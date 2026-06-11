from __future__ import annotations
import csv
from datetime import datetime
from pathlib import Path
from typing import List

from .models import Draw, U


def load_history(path: Path | str) -> List[Draw]:
    path = Path(path)
    draws: List[Draw] = []

    with open(path, newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for i, row in enumerate(reader, start=2):
            concurso = int(row['concurso'])
            draw_date = datetime.strptime(row['data_sorteio'], '%Y-%m-%d').date()

            H = frozenset(int(row[f'n{j:02d}']) for j in range(1, 16))
            if len(H) != 15:
                raise ValueError(f"Linha {i}: concurso {concurso} tem {len(H)} dezenas únicas (esperado 15)")
            if not H <= U:
                raise ValueError(f"Linha {i}: concurso {concurso} tem dezenas fora de U: {H - U}")

            E = U - H

            h_mask = sum(1 << (n - 1) for n in H)
            e_mask = sum(1 << (n - 1) for n in E)

            draws.append(Draw(
                concurso=concurso,
                date=draw_date,
                H=H,
                E=E,
                soma=int(row['soma']),
                qtd_pares=int(row['qtd_pares']),
                qtd_impares=int(row['qtd_impares']),
                qtd_moldura=int(row['qtd_moldura']),
                qtd_miolo=int(row['qtd_miolo']),
                qtd_consecutivos_adj=int(row['qtd_consecutivos_adj']),
                h_mask=h_mask,
                e_mask=e_mask,
            ))

    draws.sort(key=lambda d: d.concurso)
    _validate_sequence(draws)
    return draws


def _validate_sequence(draws: List[Draw]) -> None:
    for i in range(1, len(draws)):
        expected = draws[i - 1].concurso + 1
        if draws[i].concurso != expected:
            missing = list(range(expected, draws[i].concurso))
            raise ValueError(f"Concursos ausentes na sequência: {missing[:10]}...")


def validate_only(path: Path | str) -> dict:
    path = Path(path)
    issues = []
    concursos_vistos = []

    with open(path, newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for i, row in enumerate(reader, start=2):
            concurso = int(row['concurso'])
            concursos_vistos.append(concurso)
            try:
                H = frozenset(int(row[f'n{j:02d}']) for j in range(1, 16))
                if len(H) != 15:
                    issues.append(f"linha {i}/concurso {concurso}: {len(H)} dezenas únicas")
                if not H <= U:
                    issues.append(f"linha {i}/concurso {concurso}: dezenas inválidas {H - U}")
            except Exception as e:
                issues.append(f"linha {i}/concurso {concurso}: {e}")

    min_c, max_c = min(concursos_vistos), max(concursos_vistos)
    expected_count = max_c - min_c + 1
    missing = sorted(set(range(min_c, max_c + 1)) - set(concursos_vistos))

    return {
        "total_rows": len(concursos_vistos),
        "concurso_min": min_c,
        "concurso_max": max_c,
        "expected_count": expected_count,
        "missing_count": len(missing),
        "missing_sample": missing[:20],
        "row_issues": issues,
        "status": "ok" if not issues and not missing else "com_problemas",
    }
