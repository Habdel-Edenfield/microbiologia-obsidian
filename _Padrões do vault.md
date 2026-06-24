---
tipo: padrão
---

# Padrões do vault

Este documento define a arquitetura das notas científicas, do Graph e dos
Canvas. A padronização existe para preservar significado, rastreabilidade e
legibilidade quando o vault crescer.

## Unidade documental

O Markdown é sempre a fonte canônica. O Canvas organiza relações já registradas
nas notas; ele não substitui definição, evidência, referência ou ressalva.

A nota científica canônica é `conceito`: unidade atômica sobre uma estrutura,
processo, fenômeno ou método. Qualquer conceito pode funcionar como nó focal de
um Canvas, centrado no tema que ele representa.

Registros de `fonte` e `pesquisa` sustentam as notas de conceito, mas não exigem
Canvas próprio enquanto não funcionarem como núcleos conceituais.

Uma nota `conceito` só recebe `status: completa` quando:

- possui conteúdo e metadados revisados;
- possui Canvas pareado no mesmo diretório e com o mesmo nome-base;
- todas as relações do Canvas também existem como `[[wikilinks]]`;
- passa em `bash Scripts/validar-vault.sh`.

## Nomenclatura

### Arquivos e títulos

- Conceito: sintagma nominal científico, como `Organização nuclear do
  dicarionte` ou `Validade preditiva do cultivo em ágar`.
- Canvas: mesmo nome-base e diretório da nota focal.
- Fonte: `[sigla] — [aula ou tema] — [tipo de registro]`.
- Pesquisa: `[aula ou tema] — [lacuna ou protocolo investigado]`.

Evitar títulos metafóricos, promocionais, interrogativos ou vagos, como
“o invisível”, “a verdade”, “o que escapa”, “melhor” ou “segredo”.

### Terminologia

No texto em português:

- substantivos: `monocarionte`, `dicarionte`, `heterocarionte`;
- adjetivos: `monocariótico`, `dicariótico`, `heterocariótico`;
- usar `hifal`, não `hiphal`;
- usar `produtividade` ou `rendimento`, não `yield`;
- termos ingleses ficam restritos a citações ou à primeira equivalência técnica.

## Metadados

### Conceito

```yaml
tipo: conceito
bloco:
status: rascunho
canvas:
tags: []
eixos: []
fontes-chave: []
organismos: []
confiança:
relacionados: []
```

Valores de `status`:

- `rascunho`: estrutura ou conteúdo incompleto;
- `estruturada`: conteúdo utilizável, ainda sem Canvas ou revisão final;
- `validada`: evidência e nomenclatura revisadas;
- `completa`: nota, relações e Canvas validados.

Valores de `confiança`:

- `alta`: evidência direta no grupo biológico discutido, com método explícito;
- `média`: evidência em organismo-modelo próximo ou transferência plausível;
- `baixa`: analogia entre grupos, observação sem mecanismo ou dado não
  confirmado.

Eixos devem nomear dimensões analíticas. Vocabulário preferido:

- `morfologia-colonial`;
- `organização-nuclear`;
- `relação-genótipo-fenótipo`;
- `propagação-vegetativa`;
- `estabilidade-clonal`;
- `validade-preditiva`;
- `desfecho-reprodutivo`.

## Graph e relações

O Graph do Obsidian é construído por links nas notas. Arestas desenhadas em
arquivos `.canvas` não criam relações no Graph.

Regras:

1. A nota focal liga todos os conceitos apresentados em seu Canvas.
2. Relações entre conceitos são registradas em `relacionados` ou no corpo da
   nota que origina a relação.
3. Registrar a relação em uma direção é suficiente; backlinks fornecem a
   direção inversa.
4. Não criar wikilinks para notas inexistentes quando o destino real é uma seção
   de uma nota existente. Usar `[[Nota#Seção|rótulo]]`.
5. Uma aresta deve poder ser lida como frase:
   `origem — relação → destino`.

## Arquitetura do Canvas

Cada Canvas possui:

- uma única nota focal à esquerda, com `id: foco`;
- preferencialmente três grupos temáticos à direita;
- cards de conceitos dentro dos grupos;
- arestas rotuladas com relações científicas explícitas.

O card focal não deve ser duplicado por um nó textual de resumo. Um nó de texto
só é aceitável para legenda, fórmula ou convenção que não repita a nota.

### Camadas

Os grupos são definidos pelo conteúdo, mas cada grupo deve representar uma
única classe semântica, por exemplo:

- fenômeno ou morfologia observável;
- estrutura ou mecanismo;
- processo temporal ou propagação;
- evidência, método ou limite inferencial.

Não colocar um conceito em uma camada apenas para preencher espaço. Processos
transversais podem permanecer na camada que explica sua origem ou consequência
quando isso preservar a leitura global e evitar fragmentação visual.

### Rótulos

Usar sintagmas nominais ou relações mecanísticas:

- `estado nuclear`;
- `propagação clonal`;
- `mantido por`;
- `compatibilidade regulada por`;
- `validado por`.

Evitar:

- verbos vagos isolados, como `observa`, `governa` e `questiona`;
- símbolos sem explicação, como `≠`;
- slogans ou conclusões absolutas.

## Geometria do Canvas

### Tokens

| Token | Valor | Notas |
|---|---:|---|
| `CARD_W` | 400 | largura padrão do card |
| `CARD_H` | 260 | altura padrão do card |
| `GUTTER_X` | 190 | gap horizontal entre colunas — espaço para rótulos de arestas |
| `GUTTER_Y` | 40 | gap vertical entre linhas dentro do grupo |
| `PAD_L` | 30 | padding esquerdo do grupo |
| `PAD_R` | 40 | padding direito do grupo |
| `GROUP_GAP` | 90 | gap obrigatório entre grupos empilhados |
| `EDGE_CORRIDOR` | 300 | gap entre a borda direita da focal e o primeiro grupo |

**Fórmulas derivadas:**

Largura do grupo (2 colunas): `PAD_L + CARD_W + GUTTER_X + CARD_W + PAD_R = 30 + 400 + 330 + 400 + 40 = 1200`
Largura do grupo (3 colunas): `PAD_L + 3×CARD_W + 2×GUTTER_X + PAD_R ≈ 1720`

Posição dos cards (grupo em x=X, y=Y):
- `col1_x = X + 30` · `col2_x = X + 760` · `col3_x ≈ X + 1240` (3 colunas)
- `row0_y = Y + 50` · linhas seguintes: `+ CARD_H + GUTTER_Y`

Empilhamento vertical: `next_group_y = prev_group_y + prev_group_h + 90`

O gap de `90px` entre grupos é obrigatório: o título flutua acima da caixa no
Obsidian e um gap menor causa sobreposição visual.

### Perfis da nota focal

A nota focal é sempre um `conceito`. Dimensões padrão:

| Tipo | x | y | largura | altura |
|---|---:|---:|---:|---:|
| Conceito (panorama) | -1000 | -900 | 800 | ≥ 900 (ajustar à altura total dos grupos) |

A borda direita da nota focal termina em `x = -200`. Os grupos começam em
`x = 80`, preservando um corredor de `280px` para as arestas.

### Cor

- no máximo um grupo recebe `"color": "3"`;
- a cor marca a camada mecanística ou fundacional;
- grupos metodológicos e fenotípicos permanecem sem cor;
- não usar cores `1` ou `2`.

## Limites de complexidade

- três grupos por padrão; um quarto somente quando três não representam o tema;
- até três colunas por grupo quando há 5+ conceitos na mesma camada temática;
- máximo de doze cards conceituais, além da nota focal;
- evitar arestas cruzando grupos;
- se esses limites forem excedidos, dividir o tema em outra nota focal.

## Fluxo de criação

1. Criar a nota a partir do modelo correspondente.
2. Definir título científico, tipo, status e eixos.
3. Registrar conceitos e relações como `[[wikilinks]]`.
4. Criar o Canvas pareado com o mesmo nome-base.
5. Posicionar grupos e cards usando apenas os tokens deste documento.
6. Rotular todas as arestas.
7. Marcar `status: completa` somente após a validação.
8. Executar `bash Scripts/validar-vault.sh`.
