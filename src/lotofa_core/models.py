from __future__ import annotations
from dataclasses import dataclass
from datetime import date
from typing import FrozenSet

U: FrozenSet[int] = frozenset(range(1, 26))

# Grid 5x5: moldura = borda (16 números), miolo = interior (9 números)
MOLDURA: FrozenSet[int] = frozenset([1,2,3,4,5,6,10,11,15,16,20,21,22,23,24,25])
MIOLO: FrozenSet[int] = U - MOLDURA

ROWS = [
    frozenset([1,2,3,4,5]),
    frozenset([6,7,8,9,10]),
    frozenset([11,12,13,14,15]),
    frozenset([16,17,18,19,20]),
    frozenset([21,22,23,24,25]),
]
COLS = [
    frozenset([1,6,11,16,21]),
    frozenset([2,7,12,17,22]),
    frozenset([3,8,13,18,23]),
    frozenset([4,9,14,19,24]),
    frozenset([5,10,15,20,25]),
]


@dataclass(frozen=True)
class Draw:
    concurso: int
    date: date
    H: FrozenSet[int]   # 15 sorteados
    E: FrozenSet[int]   # 10 ausentes = U \ H
    soma: int
    qtd_pares: int
    qtd_impares: int
    qtd_moldura: int
    qtd_miolo: int
    qtd_consecutivos_adj: int
    h_mask: int
    e_mask: int

    def __post_init__(self):
        assert len(self.H) == 15
        assert len(self.E) == 10
        assert self.H | self.E == U
        assert self.H & self.E == frozenset()


@dataclass
class DrawFeatures:
    H: FrozenSet[int]
    E: FrozenSet[int]
    soma: int
    qtd_pares: int
    qtd_impares: int
    qtd_moldura: int
    qtd_miolo: int
    qtd_consecutivos_adj: int
    linhas: list[int]   # contagem por linha [L1..L5]
    colunas: list[int]  # contagem por coluna [C1..C5]


@dataclass
class ScoredCandidate:
    H: FrozenSet[int]
    E: FrozenSet[int]
    features: DrawFeatures
    score: float
    score_breakdown: dict
