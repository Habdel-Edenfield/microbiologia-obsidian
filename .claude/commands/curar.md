---
description: Executa curadoria cross-note nas notas pendentes ou em todo o vault. Usa o subagente curator para detectar conexões e propor adições à _FILA_REVISAO.md sem editar notas diretamente.
---

Execute o subagente `curator` para análise de conexões cross-note.

## Modo 1: notas pendentes (padrão — sem argumento)

Leia `.claude/pendentes-curar.txt` e invoque o curator para cada nota listada.
Após processamento, limpe o arquivo:

```bash
cat /home/habdel/microbiologia/.claude/pendentes-curar.txt 2>/dev/null
rm -f /home/habdel/microbiologia/.claude/pendentes-curar.txt
```

Se o arquivo estiver vazio ou ausente, informe o usuário.

## Modo 2: nota específica (argumento após /curar)

Se o usuário informar um nome após `/curar` (ex: `/curar Micélio como fenótipo emergente`),
invoque o curator apenas para essa nota.

## Modo 3: varredura completa (--all)

Se o usuário digitar `/curar --all`, invoque o curator para TODAS as notas em
`Notas/` e `Biblioteca/`. Sugerido apenas semanalmente.

## Após curadoria

Informe ao usuário: quantas propostas foram adicionadas a `_FILA_REVISAO.md`.
Sugira revisar o arquivo.
