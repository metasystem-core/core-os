import pytest
from pathlib import Path

DATA = Path(__file__).parent.parent / ".claude/skills/lotofa/data/lotofacil_history_clean.csv"


@pytest.mark.skipif(not DATA.exists(), reason="dados não disponíveis")
def test_validate_only_clean():
    from src.lotofa_core.loader import validate_only

    result = validate_only(DATA)
    assert result["status"] == "ok"
    assert result["missing_count"] == 0
    assert len(result["row_issues"]) == 0
    assert result["total_rows"] > 3000


@pytest.mark.skipif(not DATA.exists(), reason="dados não disponíveis")
def test_latest_concurso_has_correct_date():
    from src.lotofa_core.loader import load_history

    history = load_history(DATA)
    latest = history[-1]
    # Pacote gerado em 2026-05-17, último sorteio em 2026-05-16
    assert latest.concurso == 3687
    assert str(latest.date) == "2026-05-16"
