# CORE-OS Context Mapper helper.
# Uso:
# python .claude/skills/context-mapper/runtime/session_packager.py --input raw_session.md --project CORE_OS --out context_packs/2026-06-08_CORE_OS
# Este script NÃO interpreta profundamente a sessão.
# Ele cria uma estrutura inicial de pacote de contexto para preenchimento/revisão por IA ou operador.

from __future__ import annotations

from pathlib import Path
import argparse
import json
from datetime import datetime, timezone
import re

TEMPLATE_FILES = {
    'session_summary.md': '''# SESSION SUMMARY — {date} — {project}\n\n## 1. Sessão\n\n**Data:** {date}\n**Projeto:** {project}\n**Modo:** pending_review\n\n## 2. Objetivo da sessão\n\n[preencher]\n\n## 3. O que foi trabalhado\n\n[preencher]\n\n## 4. Decisões tomadas\n\n[preencher]\n\n## 5. Ideias novas\n\n[preencher]\n\n## 6. Arquivos gerados\n\n[preencher]\n\n## 7. Problemas detectados\n\n[preencher]\n\n## 8. Próxima ação mínima\n\n[preencher]\n''',
    'context_pack.md': '''# CONTEXT PACK — {date} — {project}\n\n## Estado atual do projeto\n\n[preencher]\n\n## Decisões válidas\n\n[preencher]\n\n## Propostas em aberto\n\n[preencher]\n\n## Arquivos/artefatos relevantes\n\n[preencher]\n\n## Instruções para próxima sessão\n\n[preencher]\n\n## Instruções para Claude Code\n\n[preencher]\n''',
    'action_queue.md': '''# ACTION QUEUE — {date} — {project}\n\n## Operador\n\n[preencher]\n\n## ChatGPT\n\n[preencher]\n\n## Claude Code\n\n[preencher]\n\n## Runtime/offline\n\n[preencher]\n''',
    'harvest_candidates.md': '''# HARVEST CANDIDATES — {date} — {project}\n\nNada incorporado automaticamente.\n\n## Candidatos\n\n[preencher]\n''',
    'discard_log.md': '''# DISCARD LOG — {date} — {project}\n\n## Itens não preservados\n\n[preencher]\n''',
    'next_session_bootstrap.md': '''# NEXT SESSION BOOTSTRAP — {project}\n\n## Estado atual\n\n[preencher]\n\n## Próxima ação\n\n[preencher]\n\n## Prompt inicial sugerido\n\n```text\nContinuar o projeto {project}. Use este context pack como fonte de continuidade. Não recomece do zero.\n```\n'''
}

ARTIFACT_RE = re.compile(r'([\w\-/\.]+\.(?:zip|md|txt|json|jsonl|csv|py|pdf|docx|xlsx))', re.IGNORECASE)

def extract_artifact_candidates(text: str) -> list[str]:
    seen = set()
    out = []
    for m in ARTIFACT_RE.finditer(text):
        item = m.group(1)
        if item not in seen:
            out.append(item)
            seen.add(item)
    return out

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', required=True)
    parser.add_argument('--project', required=True)
    parser.add_argument('--out', required=True)
    args = parser.parse_args()

    input_path = Path(args.input)
    raw = input_path.read_text(encoding='utf-8')
    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)
    date = datetime.now(timezone.utc).date().isoformat()

    # Save raw reference copy, not as operational memory.
    (out_dir / 'raw_session_reference.md').write_text(raw, encoding='utf-8')

    for name, template in TEMPLATE_FILES.items():
        (out_dir / name).write_text(template.format(date=date, project=args.project), encoding='utf-8')

    artifacts = extract_artifact_candidates(raw)
    manifest = {
        'session_id': f'{date}_{args.project}',
        'project': args.project,
        'date': date,
        'generated_at': datetime.now(timezone.utc).isoformat(),
        'artifacts_detected_by_regex': artifacts,
        'artifacts': [
            {
                'name': a.split('/')[-1],
                'path': a,
                'type': a.split('.')[-1].lower(),
                'purpose': 'pending_review',
                'related_core': args.project,
                'privacy_class': 'pending_classification',
                'status': 'detected',
                'next_use': 'review_and_classify'
            }
            for a in artifacts
        ],
        'notes': [
            'This helper creates scaffolding only.',
            'AI/operator must fill summaries and decisions.',
            'Artifacts were detected by regex and require review.'
        ]
    }
    (out_dir / 'artifact_manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding='utf-8')

    print(json.dumps({
        'status': 'ok',
        'out': str(out_dir),
        'artifacts_detected': len(artifacts),
        'files_created': len(TEMPLATE_FILES) + 2
    }, ensure_ascii=False, indent=2))

if __name__ == '__main__':
    main()
