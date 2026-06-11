from __future__ import annotations
import random
from typing import List, FrozenSet, Optional

from .models import Draw, ScoredCandidate, U
from .scoring import score_candidate, ScoringContext
from .features import compute_features


def generate_candidates(
    history: List[Draw],
    n_sets: int = 30,
    window: int = 200,
    seed: Optional[int] = None,
    n_attempts: int = 2000,
    ctx: Optional[ScoringContext] = None,
) -> List[ScoredCandidate]:
    rng = random.Random(seed)
    if ctx is None:
        ctx = ScoringContext(history, window)

    pool: List[ScoredCandidate] = []
    for _ in range(n_attempts):
        H = _generate_one(rng)
        scored = score_candidate(H, history, window, ctx=ctx)
        pool.append(scored)

    pool.sort(key=lambda c: c.score, reverse=True)
    return _select_diverse_ensemble(pool, n_sets, rng)


def generate_e_candidates(
    history: List[Draw],
    n_sets: int = 30,
    window: int = 200,
    seed: Optional[int] = None,
    ctx: Optional[ScoringContext] = None,
) -> List[ScoredCandidate]:
    rng = random.Random(seed)
    if ctx is None:
        ctx = ScoringContext(history, window)

    sorted_by_e_freq = sorted(U, key=lambda n: ctx.freq_E[n], reverse=True)
    weights = [ctx.freq_E[n] + 0.01 for n in sorted_by_e_freq]

    pool: List[ScoredCandidate] = []
    for _ in range(2000):
        e_candidate_list = rng.choices(sorted_by_e_freq, weights=weights, k=10)
        E_candidate = frozenset(e_candidate_list)
        if len(E_candidate) != 10:
            continue
        H_candidate = U - E_candidate
        scored = score_candidate(H_candidate, history, window, ctx=ctx)
        pool.append(scored)

    pool.sort(key=lambda c: c.score, reverse=True)
    return _select_diverse_ensemble(pool, n_sets, random.Random(seed))


def generate_random_baseline(
    history: List[Draw],
    n_sets: int = 30,
    window: int = 250,
    seed: Optional[int] = None,
    ctx: Optional[ScoringContext] = None,
) -> List[ScoredCandidate]:
    """Baseline puro: filtros estruturais apenas, sem scoring H/E. Ensemble por diversidade."""
    rng = random.Random(seed)
    if ctx is None:
        ctx = ScoringContext(history, window)

    pool: List[ScoredCandidate] = []
    attempts = 0
    while len(pool) < n_sets * 10 and attempts < 5000:
        attempts += 1
        H = _generate_one(rng)
        f = compute_features(H)
        # Score = 0 para todos (sem ranking H/E — ordem puramente aleatória)
        from .models import ScoredCandidate
        cand = ScoredCandidate(
            H=H,
            E=U - H,
            features=f,
            score=rng.random(),   # ordem aleatória no ensemble
            score_breakdown={},
        )
        pool.append(cand)

    pool.sort(key=lambda c: c.score, reverse=True)
    return _select_diverse_ensemble(pool, n_sets, rng)


# v2 — ranges baseados na distribuicao empirica do historico completo (3687 concursos)
# Soma:    160-230 cobre 95.6% dos sorteios reais  (era 170-220 = 84.7%)
# Pares:   4-12    cobre 99.9%                     (era 5-11   = 98.9%)
# Moldura: 6-14    cobre 99.9%                     (era 7-14   = 99.9%)
SOMA_MIN, SOMA_MAX = 160, 230
PARES_MIN, PARES_MAX = 4, 12
MOLDURA_MIN, MOLDURA_MAX = 6, 14


def _generate_one(rng: random.Random) -> FrozenSet[int]:
    for _ in range(100):
        H = frozenset(rng.sample(sorted(U), 15))
        f = compute_features(H)
        if not (SOMA_MIN <= f.soma <= SOMA_MAX):
            continue
        if not (PARES_MIN <= f.qtd_pares <= PARES_MAX):
            continue
        if not (MOLDURA_MIN <= f.qtd_moldura <= MOLDURA_MAX):
            continue
        if all(qtd > 0 for qtd in f.linhas):
            return H
    return frozenset(rng.sample(sorted(U), 15))


def generate_peak_hunter(
    history: List[Draw],
    n_sets: int = 30,
    window: int = 250,
    seed: Optional[int] = None,
    ctx: Optional[ScoringContext] = None,
) -> List[ScoredCandidate]:
    """
    Otimizado para P(>=13 acertos).
    Concentra na zona tipica (soma 175-215, pares 6-10) e usa
    diversidade interna forte (max overlap 11) via greedy maximin com bitmasks.
    """
    rng = random.Random(seed)
    if ctx is None:
        ctx = ScoringContext(history, window)

    # Gera pool na zona típica — bitmasks para interseção rápida
    pool_masks: List[int] = []
    pool_H: List[FrozenSet[int]] = []
    seen: set = set()

    for _ in range(15000):
        if len(pool_H) >= 2000:
            break
        H = _generate_one(rng)
        key = tuple(sorted(H))
        if key in seen:
            continue
        f = compute_features(H)
        if 175 <= f.soma <= 215 and 6 <= f.qtd_pares <= 10:
            seen.add(key)
            pool_H.append(H)
            pool_masks.append(sum(1 << (n - 1) for n in H))

    # Fallback se pool insuficiente
    if len(pool_H) < n_sets * 3:
        for _ in range(5000):
            if len(pool_H) >= n_sets * 5:
                break
            H = _generate_one(rng)
            key = tuple(sorted(H))
            if key not in seen:
                seen.add(key)
                pool_H.append(H)
                pool_masks.append(sum(1 << (n - 1) for n in H))

    if not pool_H:
        return generate_random_baseline(history, n_sets, window, seed, ctx)

    # Greedy maximin com bitmasks (bin(a & b).count('1') = popcount)
    first_idx = rng.randrange(len(pool_H))
    selected_masks: List[int] = [pool_masks[first_idx]]
    selected_H: List[FrozenSet[int]] = [pool_H[first_idx]]
    pool_H.pop(first_idx)
    pool_masks.pop(first_idx)

    # min_dist[i] via bitmask: 15 - popcount(pool_masks[i] & last_selected_mask)
    min_dist = [15 - bin(m & selected_masks[0]).count('1') for m in pool_masks]

    while len(selected_H) < n_sets and pool_H:
        # threshold progressivo: tenta overlap 11, depois 12, depois livre
        best_idx = -1
        for max_overlap in [11, 12, 15]:
            # Filtra por overlap máximo com qualquer selecionado usando bitmasks
            candidates_idx = [
                i for i in range(len(pool_H))
                if all(bin(pool_masks[i] & sm).count('1') <= max_overlap
                       for sm in selected_masks)
            ]
            if candidates_idx:
                best_idx = max(candidates_idx, key=lambda i: min_dist[i])
                break

        if best_idx == -1:
            best_idx = max(range(len(pool_H)), key=lambda i: min_dist[i])

        chosen_H = pool_H[best_idx]
        chosen_mask = pool_masks[best_idx]
        selected_H.append(chosen_H)
        selected_masks.append(chosen_mask)
        pool_H.pop(best_idx)
        pool_masks.pop(best_idx)

        new_dist = [15 - bin(m & chosen_mask).count('1') for m in pool_masks]
        min_dist = [min(min_dist[i], new_dist[i]) for i in range(len(pool_H))]

    from .features import compute_features as _cf
    result = []
    for rank, H in enumerate(selected_H):
        f = _cf(H)
        result.append(ScoredCandidate(
            H=H, E=U - H, features=f,
            score=float(n_sets - rank),
            score_breakdown={"method": "peak_hunter", "rank": rank + 1},
        ))
    return result


def generate_max_diversity(
    history: List[Draw],
    n_sets: int = 30,
    window: int = 250,
    seed: Optional[int] = None,
    pool_size: int = 3000,
    ctx: Optional[ScoringContext] = None,
) -> List[ScoredCandidate]:
    """
    Ensemble por cobertura máxima (greedy maximin).
    Seleciona sets que maximizam a distância mínima entre pares —
    sem scoring H/E, sem bias de frequência.
    Cada set adicionado é o que está mais distante de todos os já selecionados.
    """
    rng = random.Random(seed)
    if ctx is None:
        ctx = ScoringContext(history, window)

    # Gera pool de sets válidos (filtros estruturais)
    pool_H: List[FrozenSet[int]] = []
    seen: set = set()
    attempts = 0
    while len(pool_H) < pool_size and attempts < pool_size * 5:
        attempts += 1
        H = _generate_one(rng)
        key = tuple(sorted(H))
        if key not in seen:
            seen.add(key)
            pool_H.append(H)

    # Greedy maximin: seleciona o set que maximiza a distância mínima
    # Distância entre dois sets = 15 - |H_a ∩ H_b| (dezenas não compartilhadas)
    selected_H: List[FrozenSet[int]] = [rng.choice(pool_H)]
    pool_H = [H for H in pool_H if H != selected_H[0]]

    # min_dist[i] = distância mínima do candidato i para qualquer set já selecionado
    min_dist = [15 - len(H & selected_H[0]) for H in pool_H]

    while len(selected_H) < n_sets and pool_H:
        # Escolhe o candidato com maior distância mínima
        best_idx = max(range(len(pool_H)), key=lambda i: min_dist[i])
        chosen = pool_H[best_idx]
        selected_H.append(chosen)
        pool_H.pop(best_idx)
        min_dist.pop(best_idx)

        # Atualiza min_dist com a distância ao novo set selecionado
        new_dist = [15 - len(H & chosen) for H in pool_H]
        min_dist = [min(min_dist[i], new_dist[i]) for i in range(len(pool_H))]

    # Empacota como ScoredCandidate com score = -rank (convenção: rank 1 = mais diverso)
    from .features import compute_features as _cf
    result = []
    for rank, H in enumerate(selected_H):
        f = _cf(H)
        result.append(ScoredCandidate(
            H=H, E=U - H, features=f,
            score=float(n_sets - rank),
            score_breakdown={"method": "maximin", "rank": rank + 1},
        ))
    return result


def _select_diverse_ensemble(
    pool: List[ScoredCandidate],
    n_sets: int,
    rng: random.Random,
) -> List[ScoredCandidate]:
    selected: List[ScoredCandidate] = []
    for candidate in pool:
        if len(selected) >= n_sets:
            break
        too_similar = any(
            len(candidate.H & existing.H) >= 14
            for existing in selected
        )
        if not too_similar:
            selected.append(candidate)
    return selected
