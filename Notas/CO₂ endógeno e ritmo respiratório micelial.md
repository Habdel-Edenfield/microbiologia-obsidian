---
tipo: conceito
bloco: cultivo
status: estruturada
canvas:
tags: [CO2, respiração-micelial, substrato, headspace, FAE, metabolismo, ritmo-respiratório, C-N]
eixos: [controle-ambiental, relação-genótipo-fenótipo]
fontes-chave: ["análise transversal do vault", "observação experimental do cultivador"]
organismos: ["Psilocybe cubensis", "basidiomicetos cultivados"]
confiança: média
relacionados: ["[[CO2 como ponto de controle por fase de cultivo]]", "[[Composição química de cereais para spawn]]", "[[Reação de Maillard em esterilização úmida de grãos]]", "[[Resposta micelial a subprodutos furânicos]]", "[[Enzimas lignocelulolíticas]]", "[[Confundimento de variáveis em sistemas de cultivo]]", "[[Epigenética de condições de cultivo]]"]
---

# CO₂ endógeno e ritmo respiratório micelial

## Definição

A concentração de CO₂ no headspace da câmara de cultivo não é determinada apenas pela taxa de troca de ar fresco (FAE). É o resultado de dois termos independentes:

```
[CO₂]_headspace = [CO₂]_ambiental − remoção_FAE + [CO₂]_respiração_micelial
```

O termo de respiração micelial é interno ao sistema e depende do substrato, da temperatura e da fase de crescimento. FAE idêntico em substratos diferentes produz concentrações distintas de CO₂ na câmara.

## Variáveis que afetam a produção endógena de CO₂

| Variável | Efeito na taxa de CO₂ produzida | Conexão no vault |
|---|---|---|
| **Fonte de carbono** | Açúcares simples → glicólise rápida → alto CO₂; lignocelulose → degradação enzimática lenta → liberação gradual | [[Enzimas lignocelulolíticas]] |
| **Razão C:N** | Alta C:N (palha, coco coir) → fase vegetativa longa com alta respiração; baixa C:N (grãos) → pico de CO₂ precoce e colonização rápida | [[Composição química de cereais para spawn]] |
| **Subprodutos de Maillard** | HMF e furfural inibem metabolismo micelial → reduzem CO₂ produzido → podem mascarar comparações entre lotes de grãos preparados diferentemente | [[Reação de Maillard em esterilização úmida de grãos]], [[Resposta micelial a subprodutos furânicos]] |
| **Temperatura** | Maior T → cinética enzimática mais rápida → mais CO₂ por unidade de tempo | — |
| **Fase de crescimento** | Colonização: alta respiração vegetativa; indução de primórdios: transição metabólica; frutificação: custo energético do basidiocarpo | [[CO2 como ponto de controle por fase de cultivo]] |

## Por que isso invalida comparações sem medição real

O cultivador que ajusta FAE para atingir um nível-alvo de CO₂ assume implicitamente que a produção endógena é constante entre experimentos. Essa suposição falha quando:

- O substrato muda entre cultivos (grão vs. palha vs. coco coir)
- Lotes diferentes de substrato têm teores distintos de inibidores de Maillard
- A fase de crescimento avança durante o experimento

**Implicação prática:** dois cultivos com FAE idêntico em substratos diferentes podem ter [CO₂] completamente distintos. Conclusões comparativas entre substratos ou lotes requerem medição real de CO₂ por sensor NDIR, não apenas controle de FAE.

## Confundimento associado

Este é o terceiro confundimento recorrente no cultivo (junto com ágar–substrato e FAE–umidade): CO₂ ambiental e CO₂ endógeno são determinados por fatores distintos (FAE e substrato, respectivamente), mas somam para produzir a única grandeza acessível ao cultivador sem sensor. → [[Confundimento de variáveis em sistemas de cultivo]]

## Perfil esperado por substrato (qualitativo)

| Substrato | C:N | Ritmo respiratório esperado | CO₂ endógeno relativo |
|---|---|---|---|
| Grão de centeio | ~50:1 | Alto (amido diretamente acessível) | Alto e precoce |
| Palha de trigo | ~80:1 | Médio-baixo (celulose/hemicelulose) | Moderado e prolongado |
| Coco coir | >100:1 | Baixo (fibra recalcitrante, baixo N) | Baixo |
| Esterco de cavalo pasteurizado | ~25:1 | Alto no início, cai rapidamente | Alto no início |

## Fronteira aberta

Não há dados publicados sobre taxas de produção de CO₂ por *Psilocybe cubensis* (ou espécies próximas) em função do substrato, temperatura e fase de crescimento. Em produção comercial de *Pleurotus* e *Lentinula*, há dados empíricos sobre FAE necessário por volume de câmara — mas raramente discriminados por substrato e fase. A medição direta com sensor NDIR em cultivo doméstico seria o primeiro passo para caracterizar esse parâmetro de forma rigorosa.

## Recall

Por que FAE idêntico pode produzir [CO₂] diferente em substratos distintos?
?
Porque [CO₂]_headspace = CO₂ ambiental − remoção_FAE + CO₂_respiração_micelial. O termo de respiração micelial depende da fonte de carbono, da razão C:N e da presença de inibidores metabólicos no substrato. Substratos com fontes de carbono mais acessíveis ou menor inibição de Maillard produzem mais CO₂ endógeno, elevando a concentração final mesmo com FAE constante.
