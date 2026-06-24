---
tipo: mapa
---

# Mapa — microbiologia

Vault para estudo de genética e desenvolvimento de fungos basidiomicetos. Fontes primárias: EFG (Essential Fungal Genetics, Moore & Novak Frazer) e deep research sobre reconfiguração biofísica, epigenética e organização nuclear do micélio. Objetivo de longo prazo: especialização em adaptação de basidiomicetos cultivados.

## Padrões do projeto

- [[_Padrões do vault]] — nomenclatura, metadados, Graph e geometria dos Canvas
- Validação estrutural: `bash Scripts/validar-vault.sh`

## Conceitos ativos

### Controle ambiental e cultivo

| Conceito | Status | Canvas |
|---|---|---|
| [[CO2 como ponto de controle por fase de cultivo]] | estruturada | ✓ |
| [[Interação genótipo × ambiente na frutificação]] | estruturada | ✓ |
| [[Confundimento de variáveis em sistemas de cultivo]] | estruturada | — |
| [[CO₂ endógeno e ritmo respiratório micelial]] | estruturada | — |

### Biofísica e fenótipo

| Conceito | Status | Canvas |
|---|---|---|
| [[Micélio como fenótipo emergente]] | estruturada | ✓ panorama |
| [[Reologia do ágar como seletor fenotípico]] | estruturada | — |
| [[Mecanossensibilidade hifal]] | estruturada | — |
| [[Plasticidade morfológica e dimorfismo fenotípico]] | estruturada | ✓ |
| [[Enzimas lignocelulolíticas]] | estruturada | ✓ |
| [[Morfologia colonial do micélio]] | estruturada | — |
| [[Crescimento rizomórfico]] | estruturada | — |
| [[Crescimento tomentoso]] | estruturada | — |
| [[Validade preditiva do cultivo em ágar]] | estruturada | — |
| [[Frutificação como desfecho experimental]] | estruturada | — |
| [[Indução de frutificação — sinais ambientais]] | estruturada | ✓ |

### Epigenética e memória

| Conceito | Status | Canvas |
|---|---|---|
| [[Metilação de DNA na fase micelial]] | estruturada | — |
| [[H3K27me3 e silenciamento epigenético]] | estruturada | — |
| [[Efeito colher de prata]] | estruturada | — |
| [[Epigenética de condições de cultivo]] | estruturada | — |

### Organização nuclear

| Conceito | Status | Canvas |
|---|---|---|
| [[Anastomose hifal e dikaryotização]] | estruturada | ✓ |
| [[Dicarionte]] | estruturada | — |
| [[Conexão de grampo]] | estruturada | — |
| [[Fatores de acasalamento A e B]] | estruturada | — |
| [[Heterose vegetativa]] | estruturada | — |
| [[Expressão monoalélica no dicarião]] | estruturada | — |
| [[Estequiometria nuclear e conflito genômico]] | estruturada | — |
| [[Epistasia mitonuclear]] | estruturada | — |

### Propagação e estabilidade

| Conceito | Status | Canvas |
|---|---|---|
| [[Propagação vegetativa]] | estruturada | — |
| [[Senescência clonal]] | estruturada | — |

## Livros de referência

| Livro | Status | Localização |
|---|---|---|
| Essential Fungal Genetics (EFG) — Moore & Novak Frazer | texto extraído | `/tmp/efg_full.txt` · PDF: `~/Downloads/geral/` |
| Mycelium Running Complete — Stamets | PDF legível por Read tool (por página) | `~/Downloads/videos/Curso_Fungicultura_leve/...` |
| Deep Research — Micélio: Genoma, Fenótipo e Meio | PDF completo | `~/Downloads/geral/Micélio_ Genoma, Fenótipo e Meio.pdf` |

## Convenções

- `⚠️` em notas e tabelas: fato vem de organismo-modelo não-basidiomiceto (Aspergillus, Podospora, Neurospora, levedura)
- `[pendente OCR]`: referência à fonte MR que aguarda extração
- Confiança `alta`: documentado em basidiomiceto com metodologia explícita
- Confiança `média`: documentado em basidiomiceto modelo (*C. cinereus*, *S. commune*); transferência plausível mas não medida para espécies cultivadas
- Confiança `baixa`: medido apenas em não-basidiomiceto ou sem metodologia clara
- Arestas do Canvas não alimentam o Graph; toda relação visual deve possuir `[[wikilink]]`
- Notas `conceito` completas podem ter Canvas pareado com o mesmo nome-base

### Substrato e spawn

| Conceito | Status | Canvas |
|---|---|---|
| [[Composição química de cereais para spawn]] | estruturada | — |
| [[Reação de Maillard em esterilização úmida de grãos]] | estruturada | — |
| [[Resposta micelial a subprodutos furânicos]] | estruturada | — |
| [[Capacidade de troca catiônica em substratos fúngicos]] | estruturada | — |

### Ecologia fúngica

| Conceito | Status | Canvas |
|---|---|---|
| [[Engenharia geoquímica fúngica — oxalato de cálcio]] | estruturada | — |

## Pesquisa pendente

- [[Lacunas de evidência e protocolos de pesquisa]] — cinco investigações hierarquizadas por dependência

## Biblioteca — Cultivo Prático

Pasta `Biblioteca/` criada a partir do *Psilocybin Mushroom Bible* (PMB, Haze & Mandrake, 2016, caps 1-12).

### Fonte

| Fonte | Status |
|---|---|
| [[PMB — Mushroom Bible — Guia de cultivo prático]] | indexada |

### Conceitos de cultivo

| Conceito | Status | Canvas |
|---|---|---|
| [[Cap. 01 — Noções básicas sobre cogumelos]] | rascunho | — |
| [[Cap. 02 — Obtendo esporos]] | rascunho | — |
| [[Cap. 03 — Técnica estéril no cultivo fúngico]] | rascunho | ✓ |
| [[Cap. 04 — Equipamentos e suprimentos]] | rascunho | — |
| [[Cap. 05 — Fazendo seu próprio hardware]] | rascunho | — |
| [[Cap. 06 — Método PF (Brown Rice Flour Tek)]] | rascunho | ✓ |
| [[Cap. 07 — Cultura líquida fúngica]] | rascunho | ✓ |
| [[Cap. 08 — Spawn de grão — preparação e uso]] | rascunho | ✓ |
| [[Cap. 09 — Substrato em massa e pasteurização]] | rascunho | ✓ |
| [[Cap. 10 — Cultivo em ágar e isolamento clonal]] | rascunho | ✓ |
| [[Cap. 11 — Contaminantes — diagnóstico e prevenção]] | rascunho | ✓ |
| [[Cap. 12 — Secagem e armazenamento de esporos]] | rascunho | — |

### Skill associada

`mushroom-bible-cultivo` — skill de cultivo disponível no Claude Code para referência rápida de técnicas, parâmetros e diagnóstico.

---

## Próxima extração

Mycelium Running: PDF legível diretamente via Read tool (páginas). OCR via Docling não é necessário para leitura exploratória.
```
python3 ~/.claude/skills/book-to-skill/scripts/extract.py \
  "/home/habdel/Downloads/videos/Curso_Fungicultura_leve/Artigos, livros e textos/Mycelium Running Complete.pdf" \
  --mode text
```
Isso produz `/tmp/book_skill_work/full_text.txt` para grep posterior — útil apenas para busca em texto completo.
