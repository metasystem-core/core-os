from __future__ import annotations
import json
from datetime import datetime
from pathlib import Path
from typing import List, Optional

from .models import ScoredCandidate
from .backtest import BacktestResult


def generate_audit_report(
    version: str,
    candidates: List[ScoredCandidate],
    backtest: Optional[BacktestResult],
    params: dict,
    output_dir: Path,
) -> Path:
    output_dir.mkdir(parents=True, exist_ok=True)
    report_path = output_dir / "audit_report.md"

    lines = [
        f"# Auditoria LOTOFA-CORE — {version}",
        f"Gerado em: {datetime.utcnow().isoformat()}Z",
        "",
        "---",
        "",
        "## Dado empírico",
        f"- Histórico: {params.get('history_path', 'n/d')}",
        f"- Concursos usados: {params.get('concurso_min', '?')} a {params.get('concurso_max', '?')}",
        f"- Total de concursos: {params.get('total_draws', '?')}",
        f"- Último concurso: {params.get('latest_concurso', '?')} em {params.get('latest_date', '?')}",
        "",
        "## Modelo / heurística",
        f"- Versão: {version}",
        f"- Seed: {params.get('seed', '?')}",
        f"- Janela histórica: {params.get('window', '?')} concursos",
        f"- Sets gerados: {params.get('n_sets', '?')}",
        f"- Filtros: soma 170-220, pares 5-11, moldura 7-14, linhas sem zero",
        f"- Anti-overfitting: penalidade colapso ativo, diversidade ensemble ativa",
        "",
        "## Hipótese operacional",
        "- Dezenas com frequência próxima à média histórica são mais 'plausíveis'.",
        "- Candidatos cujo E_c intersecta bastante com E histórico são preferidos.",
        "- HIPÓTESE — não implica previsão. Loteria é processo aleatório.",
        "",
        "## Sets candidatos gerados",
        "",
        "| # | Dezenas (H) | E (ausentes) | Soma | Pares | Moldura | Score |",
        "|---|---|---|---|---|---|---|",
    ]

    for i, cand in enumerate(candidates, 1):
        h_str = " ".join(f"{n:02d}" for n in sorted(cand.H))
        e_str = " ".join(f"{n:02d}" for n in sorted(cand.E))
        lines.append(
            f"| {i} | {h_str} | {e_str} | "
            f"{cand.features.soma} | {cand.features.qtd_pares} | "
            f"{cand.features.qtd_moldura} | {cand.score:.4f} |"
        )

    lines += ["", "## Resultado de backtest"]

    if backtest:
        for line in backtest.summary_lines():
            lines.append(line)
        lines += [
            "",
            "### Interpretação",
            "- Acertos ≥ 13 em backtest NÃO garantem repetição futura.",
            "- Distribuição de backtest reflete performance em dados históricos, não previsão.",
        ]
    else:
        lines.append("Backtest não executado nesta versão.")

    lines += [
        "",
        "## Onde o modelo pode falhar",
        "- **Overfitting elegante**: filtros estruturais bem ajustados ao passado podem não generalizar.",
        "- **Aleatoriedade disfarçada**: score alto não reduz incerteza do próximo sorteio.",
        "- **Fascínio por pico**: um bom resultado pontual no backtest não é evidência de eficácia.",
        "- **E-Histórico**: frequência de ausência é descritiva, não preditiva.",
        "- **Janela curta**: window pequeno amplifica padrões recentes (viés de recência).",
        "",
        "## Declaração de responsabilidade",
        "Este relatório é resultado de análise estatística lúdica.",
        "Não constitui previsão, conselho financeiro ou garantia de resultado.",
        "Jogar na loteria implica perda esperada. Inação é decisão válida.",
        "",
        "---",
        f"*LOTOFA-CORE {version} | CORE-OS Baseline V2*",
    ]

    report_path.write_text("\n".join(lines), encoding="utf-8")
    return report_path


def save_params(params: dict, output_dir: Path) -> Path:
    output_dir.mkdir(parents=True, exist_ok=True)
    path = output_dir / "params.json"
    path.write_text(json.dumps(params, indent=2, ensure_ascii=False), encoding="utf-8")
    return path


def save_candidates_csv(candidates: List[ScoredCandidate], output_dir: Path) -> Path:
    output_dir.mkdir(parents=True, exist_ok=True)
    path = output_dir / "generated_sets.csv"
    rows = ["rank,n01,n02,n03,n04,n05,n06,n07,n08,n09,n10,n11,n12,n13,n14,n15,soma,pares,moldura,score"]
    for i, cand in enumerate(candidates, 1):
        nums = sorted(cand.H)
        row = [str(i)] + [f"{n:02d}" for n in nums] + [
            str(cand.features.soma),
            str(cand.features.qtd_pares),
            str(cand.features.qtd_moldura),
            f"{cand.score:.6f}",
        ]
        rows.append(",".join(row))
    path.write_text("\n".join(rows), encoding="utf-8")
    return path


def save_candidates_jsonl(candidates: List[ScoredCandidate], output_dir: Path) -> Path:
    output_dir.mkdir(parents=True, exist_ok=True)
    path = output_dir / "generated_sets.jsonl"
    lines = []
    for i, cand in enumerate(candidates, 1):
        record = {
            "rank": i,
            "H": sorted(cand.H),
            "E": sorted(cand.E),
            "score": cand.score,
            "breakdown": cand.score_breakdown,
        }
        lines.append(json.dumps(record, ensure_ascii=False))
    path.write_text("\n".join(lines), encoding="utf-8")
    return path


def save_backtest_csv(result: BacktestResult, output_dir: Path) -> Path:
    output_dir.mkdir(parents=True, exist_ok=True)
    path = output_dir / "backtest_summary.csv"
    rows = ["concurso,best_acertos"]
    for dr in result.draws:
        rows.append(f"{dr.concurso},{dr.acertos}")
    path.write_text("\n".join(rows), encoding="utf-8")
    return path
