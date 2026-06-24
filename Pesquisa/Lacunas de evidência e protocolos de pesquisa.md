---
tipo: pesquisa
bloco: genética
ferramenta-alvo: Gemini Deep Research
status: pendente
eixos: [estabilidade-clonal, organização-nuclear, validade-preditiva, melhoramento-genético, epigenética]
---

# Lacunas de evidência e protocolos de pesquisa

Hierarquizados do mais fundacional (trava o restante) ao mais especulativo. Execute nessa ordem — o resultado do #1 informa se #2 e #3 fazem sentido, e o resultado do #3 informa #4.

---

## Prioridade 1 — Senescência clonal em basidiomicetos cultivados

**Prompt:**
What is the molecular evidence for clonal degeneration or senescence in cultivated basidiomycetes? Specifically: what mechanisms have been proposed or measured for performance decline — reduced fruiting body yield, slower colonization, or loss of vigor — in Pleurotus ostreatus, Lentinula edodes, Ganoderma lucidum, or Agaricus bisporus lines propagated vegetatively over multiple generations? Distinguish clearly between: (1) mitochondrial mechanisms (plasmid insertion, DNA rearrangement), (2) epigenetic mechanisms (methylation, chromatin), (3) nuclear mutation accumulation, and (4) changes in nuclear ratio in heterokaryons. Include whether each mechanism has been directly measured in basidiomycetes or only inferred by analogy from Podospora anserina or Neurospora crassa. Rate the quality of evidence for each.

**Por que:** EFG documenta senescência via plasmídeo mitocondrial em *P. anserina* (ascomiceto ⚠️) mas não para basidiomicetos cultivados. Esta pergunta fecha o eixo de senescência desta aula com dados reais.

**Critério de qualidade:** Rejeitar resposta que apenas citar P. anserina ou Neurospora como explicação para basidiomicetos. Exigir estudos com espécies cultivadas e metodologia explícita.

---

## Prioridade 2 — Expressão molecular nos estados monocariótico e dicariótico

**Prompt:**
Are there transcriptomic or proteomic studies comparing monokaryotic (haploid) vs. dikaryotic mycelium in commercially cultivated basidiomycetes — specifically Pleurotus ostreatus, Lentinula edodes, or Cyclocybe aegerita? What genes are upregulated in the dikaryotic state? Is there evidence that hybrid vigor (as described for heterokaryons in classical fungal genetics) is quantifiable at the transcriptome level in basidiomycetes? Include publication years and whether the studies used RNA-seq or older technologies.

**Por que:** EFG documenta que dikaryons ocultam alelos recessivos e podem exibir vigor híbrido [EFG p. 39], mas isso é para organismos-modelo. Precisamos saber se a fisiologia molecular do dicarion foi medida em espécies de cultivo.

**Critério de qualidade:** Estudos publicados a partir de 2010, com metodologia de sequenciamento explícita.

---

## Prioridade 3 — Validade preditiva de fenótipos em ágar

**Prompt:**
What agar culture characteristics are statistically correlated with fruiting body yield in basidiomycetes? Specifically: has any study measured growth rate on agar (mm/day), colonial morphology (rhizomorphic vs. tomentose scoring), sector formation frequency, or other plate phenotypes against actual yield in substrate trials? Which traits showed significant positive correlation, which showed negative, and which showed no correlation? Include species and substrate types in results. Are there studies that tried to build predictive models from plate phenotypes for basidiomycete strain selection?

**Por que:** A afirmação "correlação entre morfologia em placa e desempenho em substrato é fraca" precisa de dado quantitativo, não apenas premissa de raciocínio.

**Critério de qualidade:** Rejeitar resposta puramente qualitativa. Exigir valores de correlação ou pelo menos dados de comparação direta placa vs. substrato.

---

## Prioridade 4 — Protocolos de melhoramento de linhagens

**Prompt:**
What are the current best practices for a basidiomycete strain improvement program targeting Pleurotus ostreatus or Lentinula edodes? Specifically: (1) How do commercial and academic breeders obtain monokaryons from dikaryotic starting material — what is the standard protocol for spore germination and monokaryon isolation? (2) How are compatible monokaryons identified before crossing — what mating type tests are used? (3) How many crosses are typically needed before selecting a superior dikaryon? (4) What is the standard evaluation pipeline from cross to production trial? Include references to published protocols and any commercial programs that are documented in scientific literature.

**Por que:** Compreender o fluxo experimental completo — da linhagem à seleção — antes de elaborar qualquer plano de trabalho próprio.

**Critério de qualidade:** Protocolos publicados em periódicos, não apenas manuais de cultivo. Preferir dados de programas de melhoramento documentados.

---

## Prioridade 5 — Herança epigenética durante a propagação vegetativa

**Prompt:**
Is there evidence for epigenetic inheritance across vegetative generations in basidiomycetes? Specifically: do cultivation conditions (substrate composition, temperature regime, CO2 levels during colonization) leave heritable epigenetic marks — detectable in subsequent vegetative generations — that affect either mycelial growth or fruiting body development? Include what is known about DNA methylation in basidiomycetes and whether it plays a functional role analogous to plants or animals. Distinguish between transient acclimation (lost after a few generations) and stable epigenetic inheritance.

**Por que:** Questão aberta de fronteira — se condições de cultivo deixam marcas epigenéticas herdáveis, isso altera radicalmente a estratégia de seleção de linhagens.

**Critério de qualidade:** Separar claramente o que foi medido em basidiomicetos do que foi inferido de outros organismos. Evidência direta vale mais que analogia.

**Ponto de partida no vault:** [[Epigenética de condições de cultivo]] formaliza a hipótese e mapeia a evidência disponível — inclui protocolo mínimo de teste (reset com 5-azacitidina e comparação de gerações). [[CO₂ endógeno e ritmo respiratório micelial]] documenta como a concentração de CO₂ durante a colonização depende do substrato, uma variável independente relevante para isolar o efeito epigenético do efeito imediato de CO₂.

---

## Eixos metodológicos propostos

Abordagens experimentais derivadas de fronteiras identificadas nas notas de conceito. Complementam os prompts de busca acima com estratégias de produção de dados originais.

### Eixo 1 — Fenômica de alto rendimento

**Phenotype Microarray (Biolog PM):** placa com ~900+ condições distintas de nutrientes e estressores avaliadas simultaneamente por colorimetria. Permite traçar perfil de nicho fisiológico de linhagens e detectar diferenças entre isolados ou gerações de subcultivo que seriam invisíveis em experimentos convencionais. Custo moderado; não exige sequenciamento.

### Eixo 2 — Microfluídica para biofísica hifal

**Canais PDMS** com gradientes controlados de rigidez mecânica ou de concentração de solutos permitem medir diretamente thigmotropismo, velocidade de crescimento apical e resposta ao substrato sem variáveis confundidoras de placa aberta. Relevante para isolar a contribuição mecânica do substrato em separado da composição química.

### Eixo 3 — Modulação epigenética química

Usar 5-azacitidina (desmetilante de DNA) e tricostatina A (inibidor de HDAC) em concentrações sub-inibitórias para revelar clusters gênicos crípticos ou fenótipos morfológicos silenciados. Protocolo: comparar perfis de colônia e produção em linhagens tratadas vs. controle por ≥3 gerações de subcultivo. → [[H3K27me3 e silenciamento epigenético]]

### Eixo 4 — *Lentinus tigrinus* como modelo evo-devo

*L. tigrinus* exibe dimorfismo estável entre forma agaricóide (píleo plano, lamelas, estípite) e forma secotiante (gleba fechada, sem deiscência). O dimorfismo é modulável por CO₂, temperatura e substrato — tornando-o modelo experimental de transição morfogenética em basidiomiceto sem manipulação genética. Permite dissecar quais sinais ambientais disparam mudança de estado fenotípico. → [[Plasticidade morfológica e dimorfismo fenotípico]]
