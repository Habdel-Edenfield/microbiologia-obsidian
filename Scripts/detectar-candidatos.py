#!/usr/bin/env python3
"""
Detecta candidatos de conexão por co-ocorrência de eixos/organismos/tags
e verifica links recíprocos ausentes em 'relacionados'.

Saída: avisos no stderr; exit 0 sempre (ferramenta de sugestão, não bloqueante).
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

import yaml

ROOT = Path.cwd()
CONTENT_DIRS = ("Notas", "Biblioteca")
LINK_RE = re.compile(r"\[\[([^\]|#]+)")
MIN_SHARED = 2


def read_frontmatter(path: Path) -> dict:
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        return {}
    parts = text.split("---", 2)
    if len(parts) < 3:
        return {}
    try:
        data = yaml.safe_load(parts[1])
        return data if isinstance(data, dict) else {}
    except yaml.YAMLError:
        return {}


def collect_notes() -> list[Path]:
    notes: list[Path] = []
    for d in CONTENT_DIRS:
        dir_path = ROOT / d
        if dir_path.is_dir():
            notes.extend(sorted(dir_path.glob("*.md")))
    return notes


def extract_terms(fm: dict) -> set[str]:
    terms: set[str] = set()
    for field in ("eixos", "organismos", "tags"):
        value = fm.get(field, [])
        if isinstance(value, list):
            terms.update(str(v).strip().lower() for v in value if v)
        elif isinstance(value, str) and value.strip():
            terms.add(value.strip().lower())
    return terms


def extract_relacionados(fm: dict) -> set[str]:
    rel = fm.get("relacionados", [])
    if not isinstance(rel, list):
        return set()
    result: set[str] = set()
    for item in rel:
        m = LINK_RE.search(str(item))
        if m:
            result.add(m.group(1).strip())
    return result


def main() -> int:
    notes = collect_notes()
    terms_map: dict[str, set[str]] = {}
    relacionados_map: dict[str, set[str]] = {}

    for path in notes:
        fm = read_frontmatter(path)
        name = path.stem
        terms_map[name] = extract_terms(fm)
        relacionados_map[name] = extract_relacionados(fm)

    names = list(terms_map.keys())
    suggestions = 0
    reciprocal_issues = 0

    # Co-ocorrência: pares com ≥MIN_SHARED termos em comum e sem link mútuo
    for i, a in enumerate(names):
        for b in names[i + 1:]:
            shared = terms_map[a] & terms_map[b]
            if len(shared) < MIN_SHARED:
                continue
            a_links_b = b in relacionados_map[a]
            b_links_a = a in relacionados_map[b]
            if not a_links_b and not b_links_a:
                sample = ", ".join(sorted(shared)[:3])
                print(
                    f"CANDIDATO: '{a}' ↔ '{b}' "
                    f"({len(shared)} termos: {sample})",
                    file=sys.stderr,
                )
                suggestions += 1

    # Links recíprocos ausentes
    for name, related in relacionados_map.items():
        for target in related:
            if target not in relacionados_map:
                continue
            if name not in relacionados_map[target]:
                print(
                    f"RECÍPROCO AUSENTE: '{name}' → '{target}' "
                    f"mas '{target}' não lista '{name}' em relacionados.",
                    file=sys.stderr,
                )
                reciprocal_issues += 1

    print(
        f"Candidatos: {len(notes)} nota(s), "
        f"{suggestions} par(es) candidato(s), "
        f"{reciprocal_issues} link(s) recíproco(s) ausente(s)."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
