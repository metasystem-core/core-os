from __future__ import annotations
from typing import FrozenSet, List

from .models import DrawFeatures, U, MOLDURA, MIOLO, ROWS, COLS


def compute_features(H: FrozenSet[int]) -> DrawFeatures:
    assert len(H) == 15
    E = U - H

    nums_sorted = sorted(H)
    soma = sum(H)
    qtd_pares = sum(1 for n in H if n % 2 == 0)
    qtd_moldura = len(H & MOLDURA)
    qtd_miolo = len(H & MIOLO)

    consecutivos = 0
    for i in range(len(nums_sorted) - 1):
        if nums_sorted[i + 1] - nums_sorted[i] == 1:
            consecutivos += 1

    linhas = [len(H & row) for row in ROWS]
    colunas = [len(H & col) for col in COLS]

    return DrawFeatures(
        H=H,
        E=E,
        soma=soma,
        qtd_pares=qtd_pares,
        qtd_impares=15 - qtd_pares,
        qtd_moldura=qtd_moldura,
        qtd_miolo=qtd_miolo,
        qtd_consecutivos_adj=consecutivos,
        linhas=linhas,
        colunas=colunas,
    )


def mask(numbers: FrozenSet[int]) -> int:
    return sum(1 << (n - 1) for n in numbers)


def h_e_intersection_score(candidate_E: FrozenSet[int], history_E_list: List[FrozenSet[int]]) -> float:
    """Média de |E_c ∩ E_t| sobre a janela histórica."""
    if not history_E_list:
        return 0.0
    return sum(len(candidate_E & Et) for Et in history_E_list) / len(history_E_list)


def frequency_map(history_H_list: List[FrozenSet[int]]) -> dict[int, float]:
    """Frequência relativa de cada dezena em H, sobre a janela histórica."""
    counts = {n: 0 for n in U}
    for H in history_H_list:
        for n in H:
            counts[n] += 1
    total = len(history_H_list)
    return {n: counts[n] / total for n in U} if total else {n: 0.0 for n in U}


def e_frequency_map(history_E_list: List[FrozenSet[int]]) -> dict[int, float]:
    """Frequência relativa de cada dezena em E (ausentes), sobre a janela."""
    counts = {n: 0 for n in U}
    for E in history_E_list:
        for n in E:
            counts[n] += 1
    total = len(history_E_list)
    return {n: counts[n] / total for n in U} if total else {n: 0.0 for n in U}
