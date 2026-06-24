---
tipo: conceito
bloco: genética
status: estruturada
canvas:
tags: [curva-de-letalidade, kill-curve, UV-C, UFC, sobrevivência, mortalidade, monocarion, oidio, sombreamento, OxyR, esporo-único]
eixos: [validade-preditiva, relação-genótipo-fenótipo]
fontes-chave: ["DR — Mutagênese UV em basidiomicetos — relatório"]
organismos: ["Coprinopsis cinerea", "basidiomicetos"]
confiança: alta
relacionados: ["[[Mutagênese UV em basidiomicetos]]", "[[Fotoliase e fotorreativação]]"]
---

# Curva de letalidade UV

## Definição

A curva de letalidade (*kill curve*) é o mapeamento dose-dependente da resposta celular à irradiação UV-C, estabelecida antes de qualquer triagem de mutantes. Seu objetivo é identificar a dose de trabalho — o tempo de exposição que produz **mortalidade de 90–95%** — chamada de zona ótima de mutagênese.

## Por que a zona ótima é 90–95% de mortalidade

A resposta celular à UV-C não é linear: sobreviventes a doses mais altas carregam maior número de mutações pontuais estáveis por genoma. A faixa 90–95% equilibra dois riscos opostos:

| Faixa de mortalidade | Problema |
|---|---|
| < 90% | Baixa taxa de mutação útil; maioria dos sobreviventes permanece com fenótipo selvagem |
| 90–95% | Zona ótima: máxima densidade de mutações pontuais com mínima letalidade por acúmulo |
| > 95% | Acúmulo de mutações letais múltiplas por genoma; sobreviventes biologicamente comprometidos e instáveis |

## Pré-requisito fundamental: unicelularidade e hemizigose

O material de partida deve ser estritamente monocariótico — oidios ou basidiósporos monospóricos isolados. Duas exigências se sobrepõem:

**Hemizigose:** cada célula possui um único núcleo haploide, de modo que qualquer mutação induzida é imediatamente expressa no fenótipo do sobrevivente, sem mascaramento pelo alelo selvagem do núcleo parceiro como ocorre no dicarion. [EFG p. 39]

**Unicelularidade:** agregados de esporos ou fragmentos hifais produzem **sombreamento físico** — células externas absorvem a radiação e protegem as internas, gerando uma distribuição de dose heterogênea e uma curva de sobrevivência artefatual. A filtração em membrana de 40 μm é obrigatória para eliminar esses agregados.

## Protocolo completo

### Etapa 1 — Obtenção e padronização da suspensão celular

1. Inocular a linhagem monocariótica (ou homocariótica AmutBmut) em placas com MEA (Ágar Extrato de Malte) ou PDA (Ágar Batata Dextrose).
2. Incubar a 30°C por 7 dias **em escuro absoluto** — a ausência de luz estimula a produção abundante de oidios ou esporos assexuais livres.
3. Adicionar 10 mL de NaCl 0,85% p/v acrescido de Tween 80 a 0,05% v/v sobre a colônia; raspar suavemente com alça de Drigalski estéril para desprender os esporos.
4. Filtrar a suspensão em funil contendo lã de vidro estéril ou membrana microporosa de nylon com porosidade de **40 μm** — retém fragmentos hifais multicelulares e agregados de esporos.
5. Centrifugar o filtrado a **3.000 rcf por 5 minutos**; descartar o sobrenadante; ressuspender o pellet em 10 mL de solução salina estéril.
6. Quantificar a densidade celular em câmara de Neubauer e ajustar para **1,0 × 10⁶ esporos/mL** por diluição com salina estéril.

### Etapa 2 — Calibração da exposição ao UV-C

1. Configurar câmara de irradiação com lâmpada germicida UV-C de baixa pressão (254 nm), devidamente higienizada.
2. Usar radiômetro calibrado para ajustar a distância vertical entre a lâmpada e o plano de exposição (tipicamente 20–40 cm) e medir a irradiância conhecida em μW/cm².
3. Pipetar **120 μL** da suspensão padronizada no centro de placas de Petri estéreis, gerando gotas uniformes e isoladas com a mesma área superficial exposta.
4. Remover completamente as tampas das placas — poliestireno e vidro absorvem quase toda a radiação a 254 nm.
5. Submeter as placas sem tampa a tempos preestabelecidos (ex.: 0, 15, 30, 60, 120 e 180 segundos):

$$Dose \, (mJ/cm^2) = \frac{Irradiância \, (\mu W/cm^2) \times Tempo \, (s)}{1.000}$$

6. Cada amostra deve receber **exposição única e contínua**. O fracionamento ativa o regulon *OxyR* (sistema antioxidante adaptativo fúngico), que altera a sensibilidade celular à UV e compromete a reprodutibilidade da curva de morte.
7. A amostra do tempo 0 (controle não irradiado) deve ser colocada na câmara nas mesmas condições físicas, porém sem acionar a lâmpada — serve como referência de viabilidade basal.

### Etapa 3 — Diluição seriada, plaqueamento e incubação no escuro

1. Logo após o término da exposição de cada placa, pipetar **100 μL** da gota exposta e transferir para tubos com salina estéril. Realizar diluições decimais seriadas até 10⁻⁴ **sob luz de segurança verde** — o espectro verde (~510–560 nm) não ativa as fotoliases (que requerem 330–480 nm), evitando fotorreativação precoce.
2. Plaquear alíquotas de **100 μL** de cada diluição em meio sólido PDA ou MEA **em triplicata**.
3. Envolver imediatamente as placas em folhas de papel alumínio para garantir o escuro absoluto durante toda a incubação.
4. Incubar as placas de cabeça para baixo a **28°C por 3 a 5 dias** até a visualização de colônias isoladas.
5. Contar as Unidades Formadoras de Colônias (UFC) nas placas que apresentem entre 30 e 300 colônias.

## Cálculo de sobrevivência e mortalidade

$$S(\%) = \left(\frac{UFC/mL \, (amostra \, irradiada)}{UFC/mL \, (controle \, t=0)}\right) \times 100$$

$$M(\%) = 100 - S(\%)$$

## Perfil típico de resposta

| Tempo (s) | Dose aprox. (mJ/cm²) | S (%) típica | M (%) típica |
|---|---|---|---|
| 0 | 0 | 100 | 0 |
| 15 | ~4 | ~60–70 | ~30–40 |
| 30 | ~8 | ~35–45 | ~55–65 |
| 60 | ~16 | ~10–15 | ~85–90 |
| 120 | ~32 | ~2–5 | ~95–98 |
| 180 | ~48 | ~0,5–1 | ~99 |

(Valores ilustrativos para irradiância de ~270 μW/cm². A curva varia entre espécies e linhagens — refazer para cada combinação.)

A dose de trabalho para ensaios de mutagênese é selecionada no ponto em que S(%) cai entre 5% e 10% (M = 90–95%).

## Por que a curva deve ser refeita por linhagem

A sensibilidade à UV-C varia em função da:
- Espessura e composição da parede celular do esporo (teor de quitina, melanina)
- Nível basal de expressão de fotoliases na linhagem testada
- Tipo de estrutura celular (oidio vs. basidiósporo monocariótico vs. oidio de AmutBmut)
- Temperatura de incubação pós-irradiação (influencia atividade de TLS)

## Fronteira aberta

A variação intra-espécie na sensibilidade à UV-C entre linhagens comerciais de *Pleurotus ostreatus* e *Lentinula edodes* é documentada empiricamente, mas os determinantes genéticos dessa variação (polimorfismos em *phr1*, *phr2*, reguladores de *OxyR*, composição da parede) ainda não foram sistematicamente mapeados. → [[Mutagênese UV em basidiomicetos#Fronteira aberta]]

## Recall

Por que o fracionamento da dose UV compromete a reprodutibilidade da curva de letalidade?
?
O fracionamento (exposição em múltiplas etapas com intervalo) ativa o regulon *OxyR*, sistema antioxidante adaptativo que aumenta a tolerância celular ao estresse oxidativo e reduz a sensibilidade basal à UV nas exposições subsequentes. Isso altera a inclinação da curva de morte e subestima a dose necessária para atingir 90–95% de mortalidade, tornando os resultados não comparáveis entre experimentos.

Por que filtrar a suspensão em membrana de 40 μm antes da irradiação?
?
Para garantir unicelularidade. Agregados de esporos e fragmentos hifais multicelulares criam sombreamento físico: as células externas do agregado absorvem a maior parte da radiação UV-C e protegem as células internas, que recebem dose subótima. O resultado é uma curva de sobrevivência artefatual que superestima a resistência da linhagem e produz uma dose de trabalho incorreta.
