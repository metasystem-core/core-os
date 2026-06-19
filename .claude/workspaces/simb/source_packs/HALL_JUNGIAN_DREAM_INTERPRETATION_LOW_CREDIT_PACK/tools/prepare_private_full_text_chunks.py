#!/usr/bin/env python3
"""
prepare_private_full_text_chunks.py

Local/private helper for CORE-OS.

Usage:
  python tools/prepare_private_full_text_chunks.py \
    --pdf "path/to/source.pdf" \
    --out ".claude/workspaces/simb/private_full_text_chunks/hall_jungian_dream_interpretation" \
    --chapter-map "05_BLOCK_MAP.json"

This script extracts readable text from the PDF and creates private chapter/block chunks.
Designed for local use only. Do not commit generated chunks.

Dependencies:
  pip install pdfplumber
  or
  pip install pymupdf  (fallback)

Safety guarantees:
  - No network calls
  - No git operations
  - No writes outside --out directory
  - Does not copy the source PDF
  - Adds .gitignore to output directory automatically
"""

from __future__ import annotations
import argparse, re, json, hashlib, pathlib


def extract_pages_pdfplumber(pdf_path: pathlib.Path) -> dict[int, str]:
    try:
        import pdfplumber
        pages: dict[int, str] = {}
        with pdfplumber.open(pdf_path) as pdf:
            for i, page in enumerate(pdf.pages):
                txt = page.extract_text() or ""
                pages[i + 1] = txt.strip()
        return pages
    except ImportError:
        raise ImportError(
            "pdfplumber not installed.\n"
            "Run: pip install pdfplumber"
        )


def extract_pages_pymupdf(pdf_path: pathlib.Path) -> dict[int, str]:
    try:
        import fitz  # pymupdf
        pages: dict[int, str] = {}
        doc = fitz.open(str(pdf_path))
        for i, page in enumerate(doc):
            txt = page.get_text() or ""
            pages[i + 1] = txt.strip()
        return pages
    except ImportError:
        raise ImportError(
            "pymupdf not installed.\n"
            "Run: pip install pymupdf"
        )


def extract_pages(pdf_path: pathlib.Path) -> dict[int, str]:
    """Try pdfplumber first, fall back to pymupdf."""
    try:
        return extract_pages_pdfplumber(pdf_path)
    except ImportError:
        return extract_pages_pymupdf(pdf_path)


def clean_text(txt: str) -> str:
    """Remove common PDF extraction artifacts."""
    txt = re.sub(r"\n{3,}", "\n\n", txt)
    txt = re.sub(r"^\s*\d+\s*$", "", txt, flags=re.MULTILINE)
    return txt.strip()


def word_count(s: str) -> int:
    return len(re.findall(r"\b[\w'-]+\b", s))


def load_chapter_map(path: pathlib.Path) -> list[tuple[str, str, int, int]]:
    """Load chapter map from JSON (05_BLOCK_MAP.json format)."""
    with open(path, encoding="utf-8") as f:
        data = json.load(f)
    chapters = []
    for ch in data.get("chapters", []):
        ch_id = ch.get("id", "")
        title = ch.get("title", "")
        start = ch.get("start_page_est")
        end = ch.get("end_page_est")
        if ch_id and title and start is not None and end is not None:
            chapters.append((ch_id, title, int(start), int(end)))
    return chapters


def main() -> None:
    ap = argparse.ArgumentParser(
        description="Extract private text chunks from PDF for CORE-OS SIMB reading."
    )
    ap.add_argument("--pdf", required=True, help="Path to source PDF")
    ap.add_argument(
        "--out",
        default=".claude/workspaces/simb/private_full_text_chunks/hall_jungian_dream_interpretation",
        help="Output directory for private chunks"
    )
    ap.add_argument("--pages-per-block", type=int, default=10, help="Pages per chunk block")
    ap.add_argument(
        "--chapter-map",
        help="Path to 05_BLOCK_MAP.json for chapter page ranges"
    )
    args = ap.parse_args()

    pdf_path = pathlib.Path(args.pdf)
    if not pdf_path.exists():
        raise FileNotFoundError(f"PDF not found: {pdf_path}")

    out = pathlib.Path(args.out)
    out.mkdir(parents=True, exist_ok=True)

    gitignore = out / ".gitignore"
    if not gitignore.exists():
        gitignore.write_text("*\n!.gitignore\n", encoding="utf-8")

    print(f"Reading {pdf_path} ...")
    raw = pdf_path.read_bytes()
    sha = hashlib.sha256(raw).hexdigest()
    print(f"Source SHA256: {sha}")

    print("Extracting text pages ...")
    pages = extract_pages(pdf_path)
    total_pages = len(pages)
    print(f"Extracted {total_pages} pages")

    if args.chapter_map:
        chapters = load_chapter_map(pathlib.Path(args.chapter_map))
        print(f"Loaded {len(chapters)} chapters from chapter map")
    else:
        chapters = [("full", "Full Text", 1, total_pages)]
        print("No chapter map provided — treating as single section")

    block_index = []
    for ch_id, ch_title, start, end in chapters:
        bnum = 1
        p = start
        while p <= end:
            p2 = min(end, p + args.pages_per_block - 1)
            body_parts = []
            for i in range(p, p2 + 1):
                raw_page = pages.get(i, "")
                if raw_page:
                    body_parts.append(clean_text(raw_page))
            body = "\n\n".join(body_parts).strip()

            fn = f"{ch_id}_b{bnum:02d}_p{p:03d}-{p2:03d}.md"
            target = out / fn
            target.write_text(
                f"# {ch_id.upper()} / Block {bnum:02d} — {ch_title}\n\n"
                f"pages: {p}–{p2}\n"
                f"source_sha256: {sha}\n"
                f"word_count_est: {word_count(body)}\n\n"
                f"---\n\n"
                f"{body}\n",
                encoding="utf-8"
            )
            block_index.append({
                "block_id": f"{ch_id}_b{bnum:02d}",
                "chapter_id": ch_id,
                "chapter_title": ch_title,
                "pages": f"{p}-{p2}",
                "file": str(target).replace("\\", "/"),
                "word_count_est": word_count(body)
            })
            p = p2 + 1
            bnum += 1

    (out / "PRIVATE_BLOCK_INDEX.json").write_text(
        json.dumps({
            "source_file": str(pdf_path),
            "source_sha256": sha,
            "total_pages": total_pages,
            "warning": "Private full-text chunks. Do not commit or redistribute.",
            "blocks": block_index
        }, indent=2, ensure_ascii=False),
        encoding="utf-8"
    )

    print(f"\nCreated {len(block_index)} private chunks in {out}")
    print(f"Source sha256: {sha}")
    print("Do not commit generated chunks.")
    print("Verify: git status --short (chunks must appear as untracked/ignored)")


if __name__ == "__main__":
    main()
