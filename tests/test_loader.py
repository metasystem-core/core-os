import pytest
from pathlib import Path
from datetime import date

DATA = Path(__file__).parent.parent / ".claude/skills/lotofa/data/lotofacil_history_clean.csv"


@pytest.mark.skipif(not DATA.exists(), reason="dados não disponíveis")
def test_load_history_basic():
    from src.lotofa_core.loader import load_history
    from src.lotofa_core.models import U

    history = load_history(DATA)
    assert len(history) > 3000
    assert history[0].concurso == 1
    assert history[-1].concurso == len(history)

    for draw in history[:10]:
        assert len(draw.H) == 15
        assert len(draw.E) == 10
        assert draw.H | draw.E == U
        assert draw.H & draw.E == frozenset()
        assert draw.H <= U
        assert isinstance(draw.date, date)


@pytest.mark.skipif(not DATA.exists(), reason="dados não disponíveis")
def test_sequence_continuity():
    from src.lotofa_core.loader import load_history

    history = load_history(DATA)
    for i in range(1, len(history)):
        assert history[i].concurso == history[i-1].concurso + 1, \
            f"Gap entre {history[i-1].concurso} e {history[i].concurso}"


@pytest.mark.skipif(not DATA.exists(), reason="dados não disponíveis")
def test_masks_consistent():
    from src.lotofa_core.loader import load_history

    history = load_history(DATA)
    for draw in history[:50]:
        reconstructed_mask = sum(1 << (n - 1) for n in draw.H)
        assert draw.h_mask == reconstructed_mask
        assert draw.h_mask & draw.e_mask == 0
        assert draw.h_mask | draw.e_mask == (1 << 25) - 1
