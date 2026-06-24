# Regras do vault — microbiologia

@AGENTS.md

## Regras adicionais para agentes Claude Code

8. **Critérios de incorporação cross-note.** Após criar ou modificar qualquer nota,
   verificar se o novo fato, mecanismo ou citação pertence também a notas existentes:
   a. Extrair `eixos`, `organismos`, `tags` e `fontes-chave` do frontmatter.
   b. Buscar com `rg` notas que compartilhem ≥1 desses termos em `Notas/`, `Biblioteca/`.
   c. Para cada candidato não listado em `relacionados`: avaliar se o novo conteúdo
      é relevante para aquela nota.
   d. Registrar propostas em `_FILA_REVISAO.md`; nunca editar a nota-alvo diretamente.

9. **Proteção de notas com `status: completa`.** Proibido editar diretamente. Toda
   alteração proposta deve ir para `_FILA_REVISAO.md` com nota-alvo, nota-fonte,
   conteúdo exato a inserir e justificativa. A edição só acontece após aprovação
   explícita do usuário.
