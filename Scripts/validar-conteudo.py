#!/usr/bin/env python3

from __future__ import annotations

import re
import sys
from pathlib import Path

import yaml


ROOT = Path.cwd()
CONTENT_DIRS = ("Aulas", "Notas", "Pesquisa", "Fontes")
LINK_RE = re.compile(r"\[\[([^\]]+)\]\]")
HEADING_RE = re.compile(r"^#{1,6}\s+(.+?)\s*$", re.MULTILINE)

SCHEMAS = {
    "conceito": {
        "tipo",
        "bloco",
        "status",
        "canvas",
        "tags",
        "eixos",
        "fontes-chave",
        "organismos",
        "confiança",
        "relacionados",
    },
    "fonte": {
        "tipo",
        "livro",
        "autores",
        "bloco",
        "status",
    },
    "pesquisa": {
        "tipo",
        "bloco",
        "ferramenta-alvo",
        "status",
        "eixos",
    },
}

VALID_STATUS = {"rascunho", "estruturada", "validada", "completa", "pendente"}
VALID_CONFIDENCE = {"alta", "média", "baixa"}
OBSOLETE_KEYS = {"fonte-efg", "organismo", "aula-origem", "numero", "título", "fontes-primárias", "data"}


def frontmatter(path: Path) -> dict:
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        raise ValueError("frontmatter ausente")

    parts = text.split("---", 2)
    if len(parts) < 3:
        raise ValueError("frontmatter não foi fechado")

    data = yaml.safe_load(parts[1])
    if not isinstance(data, dict):
        raise ValueError("frontmatter não é um objeto YAML")
    return data


def content_files() -> list[Path]:
    files: list[Path] = []
    for directory in CONTENT_DIRS:
        files.extend(sorted((ROOT / directory).glob("*.md")))
    files.append(ROOT / "_Mapa.md")
    return files


def build_target_index() -> dict[str, Path]:
    index: dict[str, Path] = {}
    for path in ROOT.rglob("*"):
        if not path.is_file() or path.suffix not in {".md", ".canvas"}:
            continue
        if "_Modelos" in path.parts:
            continue
        key = path.name if path.suffix == ".canvas" else path.stem
        index[key] = path
    return index


def validate_frontmatter(paths: list[Path]) -> list[str]:
    errors: list[str] = []

    for path in paths:
        try:
            data = frontmatter(path)
        except (ValueError, yaml.YAMLError) as exc:
            errors.append(f"{path.relative_to(ROOT)}: {exc}")
            continue

        note_type = data.get("tipo")
        schema = SCHEMAS.get(note_type)
        if schema:
            missing = sorted(schema - data.keys())
            if missing:
                errors.append(
                    f"{path.relative_to(ROOT)}: propriedades ausentes: "
                    + ", ".join(missing)
                )

        obsolete = sorted(OBSOLETE_KEYS & data.keys())
        if obsolete:
            errors.append(
                f"{path.relative_to(ROOT)}: propriedades obsoletas: "
                + ", ".join(obsolete)
            )

        status = data.get("status")
        if status is not None and status not in VALID_STATUS:
            errors.append(f"{path.relative_to(ROOT)}: status inválido: {status}")

        confidence = data.get("confiança")
        if confidence is not None and confidence not in VALID_CONFIDENCE:
            errors.append(
                f"{path.relative_to(ROOT)}: confiança inválida: {confidence}"
            )

    return errors


def validate_links(paths: list[Path]) -> list[str]:
    errors: list[str] = []
    targets = build_target_index()

    for path in paths:
        text = path.read_text(encoding="utf-8")
        text = re.sub(r"```.*?```", "", text, flags=re.DOTALL)
        text = re.sub(r"`[^`\n]*`", "", text)
        for raw_link in LINK_RE.findall(text):
            destination = raw_link.split("|", 1)[0].strip()
            target_name, separator, section = destination.partition("#")
            target_name = target_name.strip()

            if not target_name:
                target_path = path
            else:
                target_path = targets.get(target_name)

            if target_path is None:
                errors.append(
                    f"{path.relative_to(ROOT)}: wikilink sem destino: [[{raw_link}]]"
                )
                continue

            if separator and target_path.suffix == ".md":
                headings = {
                    heading.strip()
                    for heading in HEADING_RE.findall(
                        target_path.read_text(encoding="utf-8")
                    )
                }
                if section.strip() not in headings:
                    errors.append(
                        f"{path.relative_to(ROOT)}: seção inexistente em "
                        f"{target_path.relative_to(ROOT)}: {section.strip()}"
                    )

    return errors


def main() -> int:
    paths = content_files()
    errors = validate_frontmatter(paths) + validate_links(paths)

    for message in errors:
        print(f"ERRO: {message}", file=sys.stderr)

    print(
        f"Conteúdo: {len(paths)} arquivo(s), {len(errors)} erro(s) de "
        "frontmatter ou wikilink."
    )
    return 1 if errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
