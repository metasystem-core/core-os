"""
Mechanical helper for SKILL-AUDITOR.

Usage:
python .claude/skills/skill-auditor/runtime/skill_frontmatter_scanner.py /path/to/repo --out docs/reports/skill_frontmatter_scan.json

This script does not modify files.
"""

from pathlib import Path
import argparse, json, re
from datetime import datetime, timezone

FRONTMATTER_RE = re.compile(r"^---\n(.*?)\n---", re.DOTALL)

def parse_frontmatter(text: str) -> dict:
    m = FRONTMATTER_RE.match(text)
    if not m:
        return {}
    data = {}
    for line in m.group(1).splitlines():
        if ":" in line:
            k, v = line.split(":", 1)
            data[k.strip()] = v.strip()
    return data

def scan(root: Path) -> dict:
    skills = []
    required = ["name", "description", "status", "core_type", "priority", "domain"]
    recommended = ["risk_level", "source_policy"]
    for p in root.rglob("SKILL.md"):
        text = p.read_text(encoding="utf-8", errors="ignore")
        fm = parse_frontmatter(text)
        missing_required = [k for k in required if k not in fm]
        missing_recommended = [k for k in recommended if k not in fm]
        skills.append({
            "path": str(p.relative_to(root)),
            "has_frontmatter": bool(fm),
            "frontmatter": fm,
            "missing_required": missing_required,
            "missing_recommended": missing_recommended,
            "size_chars": len(text)
        })
    return {
        "scanned_at": datetime.now(timezone.utc).isoformat(),
        "root": str(root),
        "total_skills": len(skills),
        "skills": skills,
        "notes": ["Mechanical scan only. Does not judge operational quality."]
    }

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("root")
    parser.add_argument("--out", default="skill_frontmatter_scan.json")
    args = parser.parse_args()
    report = scan(Path(args.root).resolve())
    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps({
        "status": "ok",
        "total_skills": report["total_skills"],
        "out": str(out)
    }, ensure_ascii=False, indent=2))

if __name__ == "__main__":
    main()
