#!/usr/bin/env bash
# PreToolUse: bloquear edição direta de nota com status: completa
set -uo pipefail

input=$(cat)
file=$(printf '%s' "$input" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('file_path', ''))
" 2>/dev/null)

if [[ -z "$file" ]] || [[ ! -f "$file" ]]; then
  exit 0
fi

if grep -q "^status: completa" "$file" 2>/dev/null; then
  echo "BLOQUEADO: '$file' tem status: completa."
  echo "Registre a proposta em _FILA_REVISAO.md em vez de editar diretamente."
  echo "Após aprovação explícita do usuário, a edição pode ser realizada."
  exit 2
fi
