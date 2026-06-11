from __future__ import annotations
from typing import List, FrozenSet, Optional

from .models import Draw, ScoredCandidate, U
from .features import compute_features, frequency_map, e_frequency_map, h_e_intersection_score


SOMA_MEAN = 193.0
SOMA_STD = 14.5


class ScoringContext:
    """Mapas pré-computados para uma janela histórica — evita recomputar por candidato."""
    def __init__(self, history: List[Draw], window: int):
        window_draws = history[-window:]
        H_list = [d.H for d in window_draws]
        E_list = [d.E for d in window_draws]
        self.freq_H = frequency_map(H_list)
        self.freq_E = e_frequency_map(E_list)
        self.E_list = E_list
        self.recent_H = [d.H for d in history[-10:]]


def score_candidate(
    candidate_H: FrozenSet[int],
    history: List[Draw],
    window: int = 200,
    ctx: Optional[ScoringContext] = None,
) -> ScoredCandidate:
    if ctx is None:
        ctx = ScoringContext(history, window)

    features = compute_features(candidate_H)
    candidate_E = U - candidate_H

    expected_freq = 15 / 25
    h_freq_score = sum(
        1.0 - abs(ctx.freq_H[n] - expected_freq) / expected_freq
        for n in candidate_H
    ) / 15

    e_intersection = h_e_intersection_score(candidate_E, ctx.E_list)
    e_intersection_norm = e_intersection / 10.0

    expected_e_freq = 10 / 25
    e_freq_score = sum(
        1.0 - abs(ctx.freq_E[n] - expected_e_freq) / expected_e_freq
        for n in candidate_E
    ) / 10

    struct_score = _structural_plausibility(features)
    collapse_penalty = _collapse_penalty(candidate_H, ctx.recent_H)

    total = (
        0.25 * h_freq_score
        + 0.25 * e_intersection_norm
        + 0.20 * e_freq_score
        + 0.20 * struct_score
        - 0.10 * collapse_penalty
    )

    breakdown = {
        "h_freq": round(h_freq_score, 4),
        "e_intersection": round(e_intersection_norm, 4),
        "e_freq": round(e_freq_score, 4),
        "structural": round(struct_score, 4),
        "collapse_penalty": round(collapse_penalty, 4),
        "total": round(total, 4),
        "soma": features.soma,
        "qtd_pares": features.qtd_pares,
        "qtd_moldura": features.qtd_moldura,
        "qtd_consecutivos_adj": features.qtd_consecutivos_adj,
    }

    return ScoredCandidate(
        H=candidate_H,
        E=candidate_E,
        features=features,
        score=round(total, 6),
        score_breakdown=breakdown,
    )


def _structural_plausibility(features) -> float:
    score = 1.0
    # Penalidade gradual por afastamento da media — nao hard-cutoff
    soma_dev = abs(features.soma - SOMA_MEAN) / SOMA_STD
    score -= min(soma_dev * 0.08, 0.35)
    # Pares: extremos absolutos penalizados (3 ou 12+ sao raros, nao impossivel)
    if features.qtd_pares < 4 or features.qtd_pares > 12:
        score -= 0.3
    elif features.qtd_pares < 5 or features.qtd_pares > 11:
        score -= 0.10
    # Moldura: muito extremo penalizado
    if features.qtd_moldura < 6 or features.qtd_moldura > 14:
        score -= 0.2
    # Consecutivos
    if features.qtd_consecutivos_adj > 11:
        score -= 0.2
    # Linhas vazias ou completas
    for qtd in features.linhas:
        if qtd == 0 or qtd == 5:
            score -= 0.1
    return max(score, 0.0)


def _collapse_penalty(candidate_H: FrozenSet[int], recent_H_list: List[FrozenSet[int]]) -> float:
    if not recent_H_list:
        return 0.0
    max_intersection = max(len(candidate_H & H) for H in recent_H_list)
    if max_intersection >= 14:
        return 1.0
    if max_intersection >= 13:
        return 0.5
    return 0.0
