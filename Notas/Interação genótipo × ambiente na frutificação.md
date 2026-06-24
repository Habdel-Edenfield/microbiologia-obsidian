---
tipo: conceito
bloco: genética
status: estruturada
canvas: "[[Interação genótipo × ambiente na frutificação]]"
tags: [GxE, genótipo-ambiente, frutificação, fenótipagem, plasticidade, mutagênese, CO2, confundimento]
eixos: [relação-genótipo-fenótipo, desfecho-reprodutivo, validade-preditiva]
fontes-chave: ["EFG p. 39 (complementação alélica no dicarion)", "EFG p. 46 (apenas dicariontes frutificam)", "observação experimental do cultivador"]
organismos: ["basidiomicetos cultivados", "Psilocybe cubensis", "Lentinus tigrinus"]
confiança: média
relacionados: ["[[CO2 como ponto de controle por fase de cultivo]]", "[[Mutagênese UV em basidiomicetos]]", "[[Frutificação como desfecho experimental]]", "[[Plasticidade morfológica e dimorfismo fenotípico]]", "[[Indução de frutificação — sinais ambientais]]", "[[Validade preditiva do cultivo em ágar]]", "[[Confundimento de variáveis em sistemas de cultivo]]", "[[CO₂ endógeno e ritmo respiratório micelial]]"]
---

# Interação genótipo × ambiente na frutificação

## Definição

O fenótipo do corpo frutificante emerge da interação entre dois eixos independentes: genótipo (composição alélica do dicarion, estado epigenético) e ambiente (CO₂, umidade, temperatura, luz). Nenhum dos dois, isolado, determina o desfecho observável. Essa interação — GxE — é o que torna o cultivo um experimento permanentemente confundido quando os dois eixos não são controlados de forma independente.

```
Fenótipo observável = G + E + (G × E)
```

A componente de interação (G × E) é o que faz certos genótipos responderem diferentemente ao mesmo CO₂, e o mesmo genótipo produzir morfologias distintas sob CO₂ diferentes.

## Framework de quadrantes

| | Sem controle ambiental (CO₂ livre) | Com controle ambiental (CO₂ isolado) |
|---|---|---|
| **Sem controle genético (interstrain)** | Variância total — nada interpretável | Efeito ambiental mascarado por variação interstrain |
| **Com controle genético (clonal)** | Variância ambiental mascarada pelo confundimento FAE–umidade | **Quadrante válido** — fenótipo atribuível à variável de interesse |

Apenas o quadrante inferior direito produz dados interpretáveis para atribuir causa.

## Requisito 1 — Dicarion caracterizado (controle genético)

Apenas dicariontes frutificam em condições normais [EFG p. 46]. Para que uma mutação selecionada via mutagênese produza fenótipo observável na frutificação, o dicarion resultante deve:

1. Ter sido dicariotizado a partir de monocariontes com o alelo mutado confirmado
2. Exibir fivelas validadas por microscopia óptica
3. Ser clonal — não misturas de isolados com composições nucleares distintas

Alelos recessivos são mascarados pelo alelo selvagem do núcleo parceiro no dicarion [EFG p. 39]. Um mutante obtido por irradiação do monocarion só revela seu fenótipo após dicariotização com monocarion compatível portador do mesmo alelo. → [[Mutagênese UV em basidiomicetos]]

## Requisito 2 — CO₂ controlado por fase (controle ambiental)

O fenótipo morfológico do cogumelo responde ao CO₂ de forma dose-dependente e independente do genótipo. Sem controlar CO₂ durante a frutificação:

- Cogumelos mais baixos e gordos (CO₂ muito baixo) vs. pernaltas (CO₂ moderado-alto) podem mascarar diferenças genotípicas reais
- Um mutante com maior produção pode parecer fenotipicamente igual ao selvagem sob concentração incorreta de CO₂
- O desfecho medido é CO₂ × genótipo, não genótipo isolado

→ [[CO2 como ponto de controle por fase de cultivo]]

## Por que genótipo clonal é necessário para isolar o efeito ambiental

A variação interstrain em morfologia de corpo frutificante pode ser maior que o efeito do CO₂. Para isolar o efeito ambiental, o genótipo deve ser fixo — genótipo clonal oriundo de tecido vegetativo ou de cruzamento monospórico validado. A variação observada passa então a ser atribuível ao ambiente.

*L. tigrinus* é o modelo canônico desse princípio: o mesmo isolado clonal produz forma agaricóide ou secotiante dependendo de CO₂ e temperatura — o genótipo fixo é o que torna a comparação válida. → [[Plasticidade morfológica e dimorfismo fenotípico]]

## Analogia metodológica com validade preditiva

O mesmo princípio que invalida a predição por ágar — o ambiente de triagem não replica as variáveis que determinam o desfecho real — invalida o fenotipagem sob CO₂ não controlado. Em ambos os casos, o ambiente de mensuração introduz variância que não está no genótipo.

| Problema análogo | Variável confundida | Consequência |
|---|---|---|
| Ágar vs. substrato real | Gradiente CO₂, textura mecânica, nutrientes | Velocidade em placa ≠ produtividade |
| FAE livre vs. CO₂ isolado | CO₂ e umidade acoplados | Morfologia do fruto não atribuível a CO₂ |

→ [[Validade preditiva do cultivo em ágar]]

## Fronteira aberta

A magnitude do efeito GxE em basidiomicetos cultivados não foi medida sistematicamente. Estudos de produtividade em substrato raramente reportam CO₂ como variável controlada independentemente da umidade, tornando a decomposição G + E + GxE impossível com os dados existentes. → [[Lacunas de evidência e protocolos de pesquisa]]

## Recall

Por que controlar genótipo E ambiente é necessário para interpretar o fenótipo de frutificação?
?
Porque o fenótipo observável = G + E + GxE. Sem fixar o genótipo (clones), a variação interstrain mascara o efeito ambiental. Sem controlar CO₂ independentemente da umidade, o efeito ambiental é confundido. Apenas com ambos controlados o fenótipo é atribuível a uma causa específica.
