"""
CORE-SELF-AUDIT helper scanner.

Uso:
python .claude/skills/core-self-audit/runtime/self_audit_scanner.py /caminho/do/repositorio --out docs/reports/self_audit_structure_scan.json

Este script NÃO altera arquivos.
Ele apenas mapeia estrutura básica para ajudar Claude Code e o operador.
"""

from __future__ import annotations

from pathlib import Path
import argparse
import json
import hashlib
from datetime import datetime, timezone


def sha256_file(path: Path, chunk_size: int = 1024 * 1024) -> str:
    h = hashlib.sha256()
    with path.open('rb') as f:
        for chunk in iter(lambda: f.read(chunk_size), b''):
            h.update(chunk)
    return h.hexdigest()


def scan_repo(root: Path) -> dict:
    files = []
    by_ext = {}
    skill_files = []
    manifests = []
    readmes = []
    all_in_one = []
    possible_sensitive = []
    total_size = 0

    sensitive_keywords = [
        'token', 'secret', 'senha', 'password', 'credential', 'cookie',
        'processo', 'carteira', 'extrato', 'private', 'raw_email'
    ]

    for p in root.rglob('*'):
        if not p.is_file():
            continue
        rel = str(p.relative_to(root))
        size = p.stat().st_size
        total_size += size
        ext = p.suffix.lower() or '[no_ext]'
        by_ext[ext] = by_ext.get(ext, 0) + 1

        if p.name == 'SKILL.md':
            skill_files.append(rel)
        if 'manifest' in p.name.lower():
            manifests.append(rel)
        if p.name.lower().startswith('readme'):
            readmes.append(rel)
        if 'all_in_one' in p.name.lower() or 'combined' in p.name.lower():
            all_in_one.append(rel)
        if any(k in rel.lower() for k in sensitive_keywords):
            possible_sensitive.append(rel)

        files.append({
            'path': rel,
            'size_bytes': size,
            'extension': ext,
        })

    return {
        'scanned_at': datetime.now(timezone.utc).isoformat(),
        'root': str(root),
        'total_files': len(files),
        'total_size_bytes': total_size,
        'extensions': dict(sorted(by_ext.items())),
        'skill_files': skill_files,
        'manifests': manifests,
        'readmes': readmes,
        'all_in_one_or_combined_files': all_in_one,
        'possible_sensitive_paths_by_name_only': possible_sensitive,
        'notes': [
            'This is a mechanical scan only.',
            'Possible sensitive paths are based on file names, not content.',
            'No files were modified.'
        ]
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('root')
    parser.add_argument('--out', default='self_audit_structure_scan.json')
    args = parser.parse_args()

    root = Path(args.root).resolve()
    report = scan_repo(root)
    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps({
        'status': 'ok',
        'out': str(out),
        'total_files': report['total_files'],
        'skill_files': len(report['skill_files']),
        'possible_sensitive_paths_by_name_only': len(report['possible_sensitive_paths_by_name_only'])
    }, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
