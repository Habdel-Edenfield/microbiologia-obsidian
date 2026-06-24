#!/usr/bin/env bash
# PostToolUse: registrar nota modificada para curadoria posterior
set -uo pipefail

VAULT="$(git rev-parse --show-toplevel 2>/dev/null)" || exit 0
PENDENTES="$VAULT/.claude/pendentes-curar.txt"

input=$(cat)
file=$(printf '%s' "$input" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('file_path', ''))
" 2>/dev/null)

if [[ -z "$file" ]] || [[ "$file" != *.md ]]; then
  exit 0
fi

# Registrar apenas arquivos dentro do vault
abs_file="$(realpath "$file" 2>/dev/null)" || abs_file="$file"
if [[ "$abs_file" == "$VAULT"* ]]; then
  mkdir -p "$(dirname "$PENDENTES")"
  echo "$abs_file" >> "$PENDENTES"
fi
