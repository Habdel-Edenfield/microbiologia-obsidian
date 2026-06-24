#!/usr/bin/env bash

set -uo pipefail

errors=0
warnings=0

error() {
  printf 'ERRO: %s\n' "$*" >&2
  errors=$((errors + 1))
}

warn() {
  printf 'AVISO: %s\n' "$*" >&2
  warnings=$((warnings + 1))
}

if ! command -v jq >/dev/null 2>&1; then
  printf 'ERRO: jq não está instalado.\n' >&2
  exit 1
fi

if [[ ! -f .obsidian/app.json ]] ||
  [[ "$(jq -r 'if has("showInlineTitle") then .showInlineTitle else true end' \
    .obsidian/app.json)" != "false" ]]; then
  error '.obsidian/app.json deve manter showInlineTitle=false'
fi

if command -v python3 >/dev/null 2>&1 &&
  python3 -c 'import yaml' >/dev/null 2>&1; then
  if ! python3 Scripts/validar-conteudo.py; then
    error 'frontmatter ou wikilinks inválidos'
  fi
else
  warn 'python3 com PyYAML indisponível; frontmatter e wikilinks não foram validados'
fi

while IFS= read -r -d '' canvas; do
  printf 'Validando %s\n' "$canvas"

  if ! jq empty "$canvas" >/dev/null 2>&1; then
    error "$canvas não contém JSON válido"
    continue
  fi

  note="${canvas%.canvas}.md"
  if [[ ! -f "$note" ]]; then
    error "$canvas não possui nota Markdown pareada"
    continue
  fi

  note_type="$(awk -F': *' '$1 == "tipo" {print $2; exit}' "$note")"
  canvas_name="$(basename "${canvas%.canvas}")"
  if ! rg -F -q "canvas: \"[[$canvas_name]]\"" "$note"; then
    error "$note não referencia o Canvas pareado na propriedade canvas"
  fi

  duplicate_nodes="$(jq -r '[.nodes[].id] | group_by(.)[] | select(length > 1) | .[0]' "$canvas")"
  [[ -z "$duplicate_nodes" ]] || error "$canvas possui IDs de nós duplicados: $duplicate_nodes"

  duplicate_edges="$(jq -r '[.edges[].id] | group_by(.)[] | select(length > 1) | .[0]' "$canvas")"
  [[ -z "$duplicate_edges" ]] || error "$canvas possui IDs de arestas duplicados: $duplicate_edges"

  if ! jq -e '([.nodes[] | select(.id == "foco" and .type == "file")] | length) == 1' \
    "$canvas" >/dev/null; then
    error "$canvas deve possuir exatamente um nó de arquivo com id=foco"
  fi

  case "$note_type" in
    conceito)
      focus_ok='all(.nodes[] | select(.id == "foco");
        .x == -1000 and .y == -900 and .width == 800 and .height >= 900)'
      ;;
    *)
      focus_ok='true'
      warn "$note usa tipo=$note_type; não há perfil focal obrigatório"
      ;;
  esac

  if ! jq -e "$focus_ok" "$canvas" >/dev/null; then
    error "$canvas não segue o perfil focal definido para tipo=$note_type"
  fi

  group_count="$(jq '[.nodes[] | select(.type == "group")] | length' "$canvas")"
  if ((group_count < 1 || group_count > 4)); then
    error "$canvas deve possuir entre 1 e 4 grupos; encontrado: $group_count"
  fi

  if ! jq -e 'all(.nodes[] | select(.type == "group");
    .x >= 80 and .width >= 920 and .height >= 320)' \
    "$canvas" >/dev/null; then
    error "$canvas possui grupo com x < 80, width < 920 ou height < 320"
  fi

  first_group_y="$(jq '[.nodes[] | select(.type == "group") | .y] | min' "$canvas")"

  prev_bottom=''
  while IFS=$'\t' read -r group_y group_h; do
    if [[ -n "$prev_bottom" ]] && ((group_y - prev_bottom < 90)); then
      error "$canvas possui intervalo entre grupos menor que 90px"
    fi
    prev_bottom=$((group_y + group_h))
  done < <(jq -r '[.nodes[] | select(.type == "group")] |
    sort_by(.y)[] | [.y, .height] | @tsv' "$canvas")

  if ! jq -e 'all(.nodes[] | select(.type == "file" and .id != "foco");
    .width == 400 and .height == 260)' "$canvas" >/dev/null; then
    error "$canvas possui card conceitual diferente de 400x260"
  fi

  if ! jq -e '
    [.nodes[] | select(.type == "group")] as $groups |
    [.nodes[] | select(.type == "file" and .id != "foco")] as $cards |
    all($cards[];
      . as $card |
      [$groups[] | select(
        $card.x >= .x and $card.y >= .y and
        ($card.x + $card.width) <= (.x + .width) and
        ($card.y + $card.height) <= (.y + .height)
      )] as $owners |
      ($owners | length) == 1 and
      ($owners[0] as $group |
        ($card.x >= ($group.x + 20) and $card.x <= ($group.x + $group.width - $card.width - 20)) and
        ($card.y >= ($group.y + 30))
      )
    )' "$canvas" >/dev/null; then
    error "$canvas possui card fora das colunas, linhas ou limites de um grupo"
  fi

  bad_colors="$(jq -r '.nodes[] | select(.type == "group" and
    (.color == "1" or .color == "2")) | .id' "$canvas")"
  [[ -z "$bad_colors" ]] || error "$canvas usa cor de grupo proibida: $bad_colors"

  colored_groups="$(jq '[.nodes[] | select(.type == "group" and has("color"))] | length' "$canvas")"
  ((colored_groups <= 1)) || error "$canvas possui mais de um grupo colorido"

  if ! jq -e '
    [.nodes[].id] as $ids |
    [.edges[] | . as $edge |
      ($ids | index($edge.fromNode)) != null and
      ($ids | index($edge.toNode)) != null
    ] | all' "$canvas" >/dev/null; then
    error "$canvas possui aresta apontando para nó inexistente"
  fi

  if ! jq -e 'all(.edges[];
    has("label") and (.label | type == "string" and length > 0))' \
    "$canvas" >/dev/null; then
    error "$canvas possui aresta sem rótulo semântico"
  fi

  while IFS= read -r file_ref; do
    [[ -f "$file_ref" ]] || error "$canvas referencia arquivo inexistente: $file_ref"
  done < <(jq -r '.nodes[] | select(.type == "file") | .file' "$canvas")

  while IFS=$'\t' read -r from_id to_id; do
    from_file="$(jq -r --arg id "$from_id" \
      '.nodes[] | select(.id == $id) | .file // empty' "$canvas")"
    to_file="$(jq -r --arg id "$to_id" \
      '.nodes[] | select(.id == $id) | .file // empty' "$canvas")"

    [[ -n "$from_file" && -n "$to_file" ]] || continue

    from_name="$(basename "${from_file%.md}")"
    to_name="$(basename "${to_file%.md}")"

    if ! rg -F -q "[[$to_name" "$from_file" &&
      ! rg -F -q "[[$from_name" "$to_file"; then
      error "$canvas possui relação $from_name -> $to_name sem wikilink correspondente"
    fi
  done < <(jq -r '.edges[] | [.fromNode, .toNode] | @tsv' "$canvas")

  text_nodes="$(jq '[.nodes[] | select(.type == "text")] | length' "$canvas")"
  ((text_nodes == 0)) || warn "$canvas possui $text_nodes nó(s) de texto; verificar redundância"
done < <(find Notas -type f -name '*.canvas' -print0)

while IFS= read -r -d '' note; do
  note_type="$(awk -F': *' '$1 == "tipo" {print $2; exit}' "$note")"
  status="$(awk -F': *' '$1 == "status" {print $2; exit}' "$note")"

  if [[ "$status" == "completa" && "$note_type" == "conceito" ]]; then
    canvas="${note%.md}.canvas"
    [[ -f "$canvas" ]] || error "$note está completa, mas não possui Canvas pareado"
  fi
done < <(find Notas -type f -name '*.md' -print0)

if command -v python3 >/dev/null 2>&1 &&
  python3 -c 'import yaml' >/dev/null 2>&1; then
  printf '\n--- Candidatos de conexão ---\n'
  python3 Scripts/detectar-candidatos.py || true
fi

printf '\nResultado: %d erro(s), %d aviso(s).\n' "$errors" "$warnings"
((errors == 0))
