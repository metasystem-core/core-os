import pytest
from pathlib import Path

DATA = Path(__file__).parent.parent / ".claude/skills/lotofa/data/lotofacil_history_clean.csv"


def test_features_basic():
    from src.lotofa_core.features import compute_features
    from src.lotofa_core.models import U

    H = frozenset([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])
    f = compute_features(H)
    assert f.soma == sum(H)
    assert f.qtd_pares == 7  # 2,4,6,8,10,12,14
    assert f.qtd_pares + f.qtd_impares == 15
    assert len(f.linhas) == 5
    assert sum(f.linhas) == 15
    assert len(f.colunas) == 5
    assert sum(f.colunas) == 15


def test_e_complement():
    from src.lotofa_core.features import compute_features
    from src.lotofa_core.models import U

    H = frozenset(range(1, 16))
    f = compute_features(H)
    assert f.E == frozenset(range(16, 26))


def test_acertos_formula():
    """Valida: Acertos(J, R) = 5 + |E_c ∩ E_t|."""
    from src.lotofa_core.models import U

    H_real = frozenset([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 2, 4])
    E_real = U - H_real

    H_cand = H_real.copy()  # jogo idêntico → 15 acertos
    E_cand = U - H_cand
    acertos = len(H_cand & H_real)
    formula = 5 + len(E_cand & E_real)
    assert acertos == formula == 15

    H_cand2 = frozenset([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 6, 8])
    E_cand2 = U - H_cand2
    acertos2 = len(H_cand2 & H_real)
    formula2 = 5 + len(E_cand2 & E_real)
    assert acertos2 == formula2


@pytest.mark.skipif(not DATA.exists(), reason="dados não disponíveis")
def test_score_candidate_returns_valid():
    from src.lotofa_core.loader import load_history
    from src.lotofa_core.scoring import score_candidate

    history = load_history(DATA)
    H = frozenset([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 2, 4])
    result = score_candidate(H, history, window=200)
    assert 0 <= result.score <= 1.5
    assert "total" in result.score_breakdown
    assert result.H == H


@pytest.mark.skipif(not DATA.exists(), reason="dados não disponíveis")
def test_generate_30_sets():
    from src.lotofa_core.loader import load_history
    from src.lotofa_core.generators import generate_candidates

    history = load_history(DATA)
    candidates = generate_candidates(history, n_sets=30, seed=20260517)
    assert len(candidates) == 30

    # Verifica diversidade: nenhum par com interseção >= 15 (set idêntico)
    for i in range(len(candidates)):
        for j in range(i + 1, len(candidates)):
            assert candidates[i].H != candidates[j].H
