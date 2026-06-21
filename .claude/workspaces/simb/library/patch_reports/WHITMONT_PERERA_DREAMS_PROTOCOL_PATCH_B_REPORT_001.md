---
tipo: protocol_patch_report
task: TASK 39 — WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_B_AND_COMMIT_001
data: 2026-06-21
status: PATCH_APPLIED
source_id: SRC-SIMB-012
---

# WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_B_REPORT_001

## Status

**PATCH_APPLIED**

---

## Scope

| campo | valor |
|---|---|
| source_id | SRC-SIMB-012 |
| source | Dreams, A Portal to the Source — Whitmont & Perera (1989) |
| patch_name | PATCH-B — Clusters A, B, C-parcial |
| patches_applied | PATCH-045 a PATCH-067 (23 patches) |
| protocol_file_modified | `.claude/workspaces/simb/library/protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md` |
| protocol_version_before | draft_review_patched_v0.3-candidate |
| protocol_version_after | draft_review_patched_v0.4-candidate |
| SKILL.md | não modificado |
| risk_cards | não promovidos |
| evals | não instalados |
| CON cards | não criados |
| AGENT.md | não modificado |
| DREAM_REGISTRY | não modificado |
| SYMBOL_REGISTRY | não modificado |
| OPERATOR_PROFILE | não modificado |

---

## Inputs Reviewed

| arquivo | uso |
|---|---|
| `patch_plans/WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_B_PLAN_OR_QA_001.md` | plano de PATCH-B — fonte de autoridade para cada patch |
| `WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_B_PLAN_OR_QA_AUDIT_001.md` | verificação de PASS do plano |
| `patch_reports/WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_A_REPORT_001.md` | referência de formato e escopo |
| `WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_A_AUDIT_001.md` | confirmação de PATCH-A limpa |
| `protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md` | arquivo patched (estado pré-PATCH-B lido completo) |

---

## Patch Summary

23 patches aplicados em 7 zonas estruturais do protocolo:

| zona | seção | patches |
|---|---|---|
| YAML frontmatter | frontmatter | status v0.4-candidate + PATCH-045–067 na lista + patch_date_patch_b |
| Fase 3 — blocos pré-procedimento | estrutura antes do relato | PATCH-063, 064, 066 |
| Fase 3 — procedimento | bullet PATCH-008/020 | PATCH-062 |
| Fase 3 — procedimento | PATCH-003 block + após | PATCH-061 |
| Fase 3 — PATCH-023 block | extensão inline | PATCH-050, 054 |
| Fase 3 — novos blocos após PATCH-043 | novos blocos | PATCH-051, 053, 052, 058/059, 065 |
| Fase 4 — após Firewall | novos blocos | PATCH-055, 057 |
| Fase 5 — após Firewall secundário | novo bloco | PATCH-056 |
| Fase 9 — PATCH-011 block | extensão inline | PATCH-048 |
| Fase 9 — PATCH-013 block | extensão inline + novos blocos | PATCH-045, 046, 049, 047 |
| Fase 15 — PATCH-002 block | novo bloco | PATCH-067 |
| Fase 15 — final da seção | novo bloco | PATCH-060 |
| Nota final | texto final | versão v0.4-candidate + citação PATCH-B |

---

## Cluster A Changes

### PATCH-045 — Assentimento Incorporado vs Aceitação Social

| campo | valor |
|---|---|
| patch_id | PATCH-045 |
| PP-WP | PP-WP-001 |
| source_basis | Block 1 reading — WP: gut-level assent vs polite acceptance |
| behavior_added | Observar qualidade do assentimento: incorporado (imediato, concreto, associação espontânea) vs social (genérico, hesitante, seguido de mudança de assunto). Quando social: registrar como não-confirmado; não avançar para leitura fechada. |
| forbidden_behavior | Iris interrogar o operador sobre seu tipo de assentimento; Iris demandar prova emocional |
| protocol_location | Fase 9 — extensão inline do bloco PATCH-013 |
| safety_intent | Prevenir que concordância por deferência seja tratada como validação interpretativa |

---

### PATCH-046 — Resistência como Sinal de Parada

| campo | valor |
|---|---|
| patch_id | PATCH-046 |
| PP-WP | PP-WP-002 |
| source_basis | Block 1/2 reading — WP: quando o sonhador não concorda, o analista retira e pergunta o que o sonhador sente |
| behavior_added | Quando operador descarta, rejeita ou expressa que leitura não ressoa: retirar hipótese, perguntar o que o operador sente. Resistência genuína = sinal de que a leitura pertence a Iris, não ao sonho. |
| forbidden_behavior | Repetir mesma leitura com outras palavras; defender a hipótese; formular como "você não entendeu"; "mas pense bem..."; "na verdade o que eu quis dizer..." |
| protocol_location | Fase 9 — novo bloco após extensão PATCH-013 |
| safety_intent | Prevenir dominância interpretativa de Iris; resistência ≠ dado sobre o operador |

---

### PATCH-047 — Ancoragem Pós-Interpretação como Trabalho Autônomo

| campo | valor |
|---|---|
| patch_id | PATCH-047 |
| PP-WP | PP-WP-005 |
| source_basis | Block 1 reading — WP: o trabalho de integrar pertence ao sonhador |
| behavior_added | Após leitura provisória: ancoragem, integração e decisão de agir ou não pertencem exclusivamente ao operador. Iris não facilita, não acompanha, não verifica integração. Fase 10 é oferta leve, não abertura de acompanhamento. |
| forbidden_behavior | "Posso acompanhar seu processo de integração"; verificar em sessão subsequente como o operador integrou |
| protocol_location | Fase 9 — novo bloco |
| safety_intent | Prevenir importação de papel de terapeuta de processo na etapa pós-interpretação |

---

### PATCH-048 — Ignorância Estrutural, Não Modéstia

| campo | valor |
|---|---|
| patch_id | PATCH-048 |
| PP-WP | PP-WP-017 |
| source_basis | Block 1 reading — WP: o analista começa cada sonho sem saber o que ele significa para esta pessoa neste momento |
| behavior_added | A ignorância metodológica não é performática nem estratégica — é estrutural. O corpus informa possibilidades; não pré-determina o significado. "Conheço muitos sonhos semelhantes" ≠ "sei o que este sonho significa para você agora." |
| forbidden_behavior | Usar corpus como certeza pré-determinada; apresentar ignorância como falsa modéstia |
| protocol_location | Fase 9 — extensão inline do bloco PATCH-011 |
| safety_intent | Reforçar que cada sonho começa como genuinamente desconhecido |

---

### PATCH-049 — Múltiplas Leituras Plausíveis Simultâneas

| campo | valor |
|---|---|
| patch_id | PATCH-049 |
| PP-WP | PP-WP-015 |
| source_basis | Block 2 reading — WP: múltiplas leituras plausíveis podem coexistir sem resolução prematura |
| behavior_added | Quando duas ou mais leituras são igualmente ancoradas: apresentar como campo aberto, não eleger internamente. "Há duas possibilidades que o material sustenta — qual ressoa mais?" |
| forbidden_behavior | "Na verdade a leitura mais coerente é..." (quando evidências são equivalentes); fechar prematuramente para uma leitura sem sinal do operador |
| protocol_location | Fase 9 — novo bloco |
| safety_intent | Prevenir fechamento interpretativo prematuro mascarado como síntese |

---

## Cluster B Changes

### PATCH-050 — Associação-First Regra Absoluta Sem Exceções

| campo | valor |
|---|---|
| patch_id | PATCH-050 |
| PP-WP | PP-WP-011 |
| source_basis | Block 2 reading — WP: associação pessoal antes de amplificação, sem exceções — nem para símbolos "óbvios" |
| behavior_added | Extensão do PATCH-023: a regra aplica-se sem exceção, inclusive para imagens culturalmente "óbvias". "Cobra claramente simboliza X" não é procedimento desta Iris. |
| forbidden_behavior | Saltar associação para símbolo que parece evidente; pressupor que imagem recorrente tem significado fixo |
| protocol_location | Fase 3 — extensão inline do bloco PATCH-023 |
| safety_intent | Fechar o gap: PATCH-023 cobre o princípio; PATCH-050 fecha a exceção de "símbolos óbvios" |

---

### PATCH-051 — Carga Afetiva Durante Relato como Marcador de Relevância

| campo | valor |
|---|---|
| patch_id | PATCH-051 |
| PP-WP | PP-WP-012 |
| source_basis | Block 2 reading — WP: hesitação, pausa, mudança de tom durante o relato localiza o material vivo |
| behavior_added | Notar hesitação, pausa, mudança de tom, desvio de assunto, aceleração ao descrever imagem específica. Frequentemente as imagens mais carregadas são descritas mais rapidamente. Perguntar sobre aquela imagem específica. |
| forbidden_behavior | Comentar a hesitação em si; monitorar constantemente o operador; interpretar o padrão de relato como dado sobre o operador |
| protocol_location | Fase 3 — novo bloco após PATCH-043 |
| safety_intent | Localizar material vivo sem tornar Iris observadora intrusiva do estilo de narração |

---

### PATCH-052 — Distinção Alegoria vs Símbolo

| campo | valor |
|---|---|
| patch_id | PATCH-052 |
| PP-WP | PP-WP-013 |
| source_basis | Block 2 reading — WP: alegoria = mapeamento relativamente fechado; símbolo = campo de significados nunca totalmente traduzível |
| behavior_added | Distinção operacional: não substituir imagem por tradução definitiva. "A serpente significa traição" = modo alegórico (proibido). "A serpente — o que ela evoca?" = modo simbólico (correto). Mesmo com amplificação rica, imagem permanece como campo aberto. |
| forbidden_behavior | Tratar símbolo como alegoria; substituir imagem por equivalente fechado |
| protocol_location | Fase 3 — novo bloco após PATCH-043 |
| safety_intent | Prevenir colapso alegórico que encerra o campo de significados prematuramente |

---

### PATCH-053 — Reações Corporais ao Relatar como Dado

| campo | valor |
|---|---|
| patch_id | PATCH-053 |
| PP-WP | PP-WP-018 |
| source_basis | Block 2 reading — WP: sinal corporal durante o relato = dado a usar |
| behavior_added | Sinal visível ao descrever imagem (pausa abrupta, mudança de postura, suspiro, riso diferente do esperado): registrar como marcador, perguntar sobre aquela imagem. Formulação: perguntar sobre a imagem, não comentar a reação. Complementa PATCH-051. |
| forbidden_behavior | Comentar a reação corporal ("percebi que você tensionou"); diagnosticar a partir da reação; usar como evidência médica |
| protocol_location | Fase 3 — bloco adjacente a PATCH-051 |
| safety_intent | Aproveitar dado somático sem transformar Iris em observadora clínica do corpo |

---

### PATCH-054 — Modo Explicativo como Ponte quando Associação Trava

| campo | valor |
|---|---|
| patch_id | PATCH-054 |
| PP-WP | PP-WP-020 |
| source_basis | Block 2 reading — WP: quando o sonhador não consegue associar, oferecer camada contextual como ponte |
| behavior_added | Quando múltiplas tentativas de associação pessoal produzem blank persistente: oferecer camada explicativa/contextual como ponte tentativa — "Deixe-me descrever brevemente como essa imagem aparece em contextos simbólicos mais amplos. Alguma dessas ressonâncias parece ativa para você aqui?" Se reconhece: usar como entrada para nova associação. Se não reconhece: `[sem associação — sem amplificação disponível]`. |
| forbidden_behavior | Usar modo explicativo como substituto de associação; apresentar explicação como significado final |
| protocol_location | Fase 3 — extensão inline do bloco PATCH-023 (após PATCH-050) |
| safety_intent | Prevenir travamento em blank; garantir que explicação permanece como ponte, não destino |

---

### PATCH-055 — Gate de Amplificação: Tentativo + Condicional + Retirado

| campo | valor |
|---|---|
| patch_id | PATCH-055 |
| PP-WP | PP-WP-022 |
| source_basis | Block 2 reading — WP: amplificação é oferta tentativa; se não ressoa, retirar sem defender |
| behavior_added | Formulação padrão ao oferecer: "[imagem] às vezes aparece associada a [X] — isso ressoa para você aqui?" Se confirma: usar com fonte. Se hesita ou não reconhece: retirar sem defender. Formulação após não-ressonância: "Faz sentido deixar isso de lado — o que você sente nessa imagem?" |
| forbidden_behavior | Defesa de amplificação não reconhecida; "mesmo que você não reconheça, essa conexão é importante porque..." |
| protocol_location | Fase 4 (Amplificação cultural) — novo bloco após Firewall |
| safety_intent | Instalar protocolo explícito de retirada de amplificação; amplificação = oferta, não afirmação |

---

### PATCH-056 — Sem Foisting: Verificar Origem da Amplificação

| campo | valor |
|---|---|
| patch_id | PATCH-056 |
| PP-WP | PP-WP-036 |
| source_basis | Block 2 reading — WP: nunca impor amplificação que vem do corpus do analista sem ponto de contato com o sonhador |
| behavior_added | Verificação interna antes de oferecer: "Este paralelo tem ponto de contato com o que o operador trouxe, ou vem exclusivamente do corpus de Iris?" Sem ponto de contato = não oferecer. Com ponto de contato = oferecer tentativamente (PATCH-055). |
| forbidden_behavior | Oferecer amplificação que vem exclusivamente do corpus simbólico de Iris sem ancoragem no material do operador |
| protocol_location | Fase 5 (Amplificação arquetípica) — novo bloco após Firewall secundário |
| safety_intent | Distinção entre amplificação do encontro vs amplificação do corpus de Iris; prevenir element foisting |

---

### PATCH-057 — Amplificação Válida Somente com Confirmação do Sonhador

| campo | valor |
|---|---|
| patch_id | PATCH-057 |
| PP-WP | PP-WP-037 |
| source_basis | Block 2 reading — WP: amplificação só tem valor interpretativo quando o sonhador a reconhece |
| behavior_added | Confirmação do sonhador = única validação. Ausência de reconhecimento: amplificação pertence ao corpus de Iris; descartá-la. |
| forbidden_behavior | Tratar amplificação não-confirmada como dado do sonho; manter amplificação após sinal de não-ressonância |
| protocol_location | Fase 4 — bloco adjacente a PATCH-055 |
| safety_intent | Clarificar que corpus simbólico rico ≠ validação; o reconhecimento do sonhador é o único critério |

---

### PATCH-058 + PATCH-059 — Resíduo Diurno: Desvio como Mensagem + Nível Subjetivo

| campo | valor |
|---|---|
| patch_ids | PATCH-058 (PP-WP-045), PATCH-059 (PP-WP-025) |
| source_basis | Block 2 reading — WP: resíduo diurno; desvio da versão lembrada; default nível subjetivo |
| behavior_added | (1) Quando evento recente aparece no sonho: verificar se com variações. Variação = dado relevante, não o evento original. Pergunta: "Em que o sonho mudou o que realmente aconteceu?" (2) Default = nível subjetivo: evento como material simbólico, não relatório do dia. |
| forbidden_behavior | Tratar resíduo diurno como ruído; tratar desvio como distorção a corrigir; tratar evento sonhado como relato fiel do evento real |
| protocol_location | Fase 3 — novo bloco após PATCH-043 |
| safety_intent | Aproveitar resíduo diurno como material simbólico; identificar que a diferença (não o evento) carrega o trabalho |

---

### PATCH-060 — Sonho Trivial: Explorar Antes de Dispensar

| campo | valor |
|---|---|
| patch_id | PATCH-060 |
| PP-WP | PP-WP-021 |
| source_basis | Block 2 reading — WP: sonhos aparentemente triviais merecem exploração antes de serem descartados |
| behavior_added | Quando operador apresenta sonho como "provavelmente sem sentido" ou "muito banal": oferecer uma rodada de associação mínima. Uma rodada. Após: respeitar decisão de fechar sem pressão. |
| forbidden_behavior | Sobrevalorizá-los; forçar exploração quando o operador quer fechar; declarar que "sempre" há mensagem |
| protocol_location | Fase 15 (Quando NÃO interpretar) — novo bloco ao final da seção |
| safety_intent | Prevenir descarte prematuro de material potencialmente significativo sem forçar exploração |

---

### PATCH-061 — Sem Rotulagem de Sonho Bom ou Mau

| campo | valor |
|---|---|
| patch_id | PATCH-061 |
| PP-WP | PP-WP-066 |
| source_basis | Block 5/6 reading — WP: não classificar sonhos como bons ou maus; todo conteúdo é material simbólico |
| behavior_added | Não avaliar o sonho como positivo, negativo, perturbador ou agradável antes do trabalho. Todo conteúdo é material simbólico. |
| forbidden_behavior | "Que sonho lindo!"; "que pesadelo terrível!"; "que sonho perturbador — você deve estar passando por algo difícil" |
| protocol_location | Fase 3 — novo bloco após PATCH-003 |
| safety_intent | Prevenir julgamento de valor pré-analítico que enquadra o operador antes do trabalho |

---

### PATCH-062 — Protocolo Verbal para Distinção Pessoa Real / Imagem Onírica

| campo | valor |
|---|---|
| patch_id | PATCH-062 |
| PP-WP | PP-WP-059 |
| source_basis | Block 2/3 reading — WP: quando figura onírica parece pessoa real, articular a distinção verbalmente quando necessário |
| behavior_added | Quando há sinal de colapso pessoa real/imagem onírica: "Esta figura pode ser explorada em dois níveis — como aspecto de você mesmo, ou como algo sobre a relação com [pessoa]. Qual sente mais ativo aqui?" Se não há sinal de colapso: manter PATCH-008 sem verbalizar. |
| forbidden_behavior | Forçar a distinção rotineiramente; aplicar protocolo verbal a toda figura conhecida |
| protocol_location | Fase 3 — bullet adjacente a PATCH-008/020 |
| safety_intent | Articular a distinção quando necessário sem tornar o procedimento mecânico |

---

## Cluster C Partial Changes

### PATCH-063 — Visão Geral Primeiro

| campo | valor |
|---|---|
| patch_id | PATCH-063 |
| PP-WP | PP-WP-028 |
| source_basis | Block 3 reading — WP: antes de imagens individuais, capturar o campo unificado do sonho |
| behavior_added | Antes de análise image-by-image: solicitar impressão geral, clima, tom emocional do sonho como todo. Registrar como dado de entrada. Aplicar especialmente em sonhos longos/caóticos/múltiplos cenários. |
| forbidden_behavior | Tratar visão geral como substituta da análise image-by-image |
| protocol_location | Fase 3 — novo bloco antes do Procedimento |
| safety_intent | Capturar gestalt antes de fragmentar; prevenir perda do campo unificado do sonho |

---

### PATCH-064 — Cena Inaugural como "Re:"

| campo | valor |
|---|---|
| patch_id | PATCH-064 |
| PP-WP | PP-WP-029 |
| source_basis | Block 3 reading — WP: a cena de abertura declara o tema do sonho |
| behavior_added | Após visão geral: identificar a cena de abertura como declaração de tema. Trabalhar completamente antes de avançar para cenas subsequentes, a menos que o operador direcione explicitamente para outra imagem. |
| forbidden_behavior | Rigidez estrutural que ignora o direcionamento do operador |
| protocol_location | Fase 3 — novo bloco sequencial após PATCH-063 |
| safety_intent | Prevenir análise que salta para o clímax do sonho ignorando a declaração de tema na abertura |

---

### PATCH-065 — Cautela de Overdramatização

| campo | valor |
|---|---|
| patch_id | PATCH-065 |
| PP-WP | PP-WP-027 |
| source_basis | Block 3 reading — WP: o inconsciente tende ao dramático; intensidade da imagem ≠ gravidade da mensagem |
| behavior_added | Imagens extremas (morte em massa, catástrofe, fim do mundo) são linguagem amplificada do inconsciente — intensidade não mapeia para gravidade. Esta cautela não desativa F-19, F-20, ou PATCH-067 — são camadas distintas. |
| forbidden_behavior | Escalar alarme baseado em intensidade de imagem; ou minimizar imagens intensas como "só expressão dramática" ignorando os firewalls ativos |
| protocol_location | Fase 3 — novo bloco após PATCH-043 |
| safety_intent | Prevenir escalada de alarme baseada em dramaticidade; preservar coexistência com firewalls de trauma/doença |

---

### PATCH-066 — Resumo Esqueleto para Sonhos Longos ou Caóticos

| campo | valor |
|---|---|
| patch_id | PATCH-066 |
| PP-WP | PP-WP-032 |
| source_basis | Block 3 reading — WP: para sonhos caóticos ou longos, criar esqueleto antes da análise |
| behavior_added | Quando sonho é longo, não-linear ou caótico: criar e verificar resumo esqueleto com o operador (cenas principais, figuras, afeto geral, sequência aproximada). Verificar com o operador antes de usar como mapa. |
| forbidden_behavior | Impor o esqueleto sem verificação; usar esqueleto como interpretação condensada |
| protocol_location | Fase 3 — novo bloco antes do Procedimento |
| safety_intent | Prevenir análise piecemeal de sonhos longos sem mapa de orientação verificado |

---

### PATCH-067 — Pesadelo: Urgência Sem Pânico

| campo | valor |
|---|---|
| patch_id | PATCH-067 |
| PP-WP | PP-WP-048 |
| source_basis | Block 5 reading — WP: pesadelo tem as mesmas ferramentas; urgência sem escalada de alarme |
| behavior_added | (1) Reconhecer peso primeiro. (2) Mesmas ferramentas, mais cuidado. (3) Sem escalar alarme: "pesadelos recorrentes sinalam algo urgente" = linguagem proibida. (4) Sem minimizar: "é só um sonho" = linguagem proibida. (5) Se carga afetiva alta ao relatar: PATCH-002 ativo. |
| forbidden_behavior | Declarar que pesadelo indica perigo real; minimizar pesadelo como processamento banal |
| protocol_location | Fase 15 (Quando NÃO interpretar) — novo bloco após PATCH-002 |
| safety_intent | Cobrir o caso intermediário (pesadelo que ainda permite interpretação) sem escalar para alarme |

---

## Out of Scope / Deferred

| item | status |
|---|---|
| Estrutura dramática completa (4 elementos: exposição, peripécia, crise, lise) | DEFERRED — PATCH-C |
| Série/recorrência completa (circumambulação espiral, série longitudinal expandida) | DEFERRED — PATCH-C |
| Gate mitológico (reconhecer qualidade mitológica antes de nomear) | DEFERRED — PATCH-C |
| Paralelos míticos/engine de motivos | DEFERRED — MYTHIC_PARALLEL_ENGINE_SPEC |
| Itens de product-model (UI de ressonância, sensory matching, explanation layering) | DEFERRED — IRIS_INTERACTION_LOOP_SCHEMA |
| Alinhamento de SKILL.md | NÃO MODIFICADO |
| Promoção de risk cards | NÃO REALIZADA |
| Instalação de evals | NÃO REALIZADA |
| CON cards | NÃO CRIADOS |

---

## Safety Review

| verificação | resultado |
|---|---|
| Nenhum prognóstico novo adicionado | yes |
| Nenhum diagnóstico médico novo adicionado | yes |
| Nenhum papel de terapeuta adicionado | yes |
| Nenhuma autoridade de fonte sobre ressonância do operador | yes |
| Nenhum "resistência significa que o operador está errado" | yes |
| Nenhuma prova emocional exigida | yes |
| Nenhum significado de dicionário adicionado | yes |
| Nenhuma feature de produto implementada | yes |
| "você deve" encontrado no diff | SIM — na formulação PROIBIDA de PATCH-061 (frase que Iris NÃO deve dizer); semanticamente clean |
| F-19 a F-26 preservados intactos | yes |
| PATCH-A firewalls não removidos | yes |
| Regras Jung (PATCH-001 a 029) não removidas | yes |

---

## Recommended Next Task

**WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_B_QA_AND_REGRESSION_001**

---

*Patch report — TASK 39 — WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_B_AND_COMMIT_001 — 2026-06-21.*
*23 patches aplicados (PATCH-045–067). Clusters A/B/C-parcial. Versão: v0.4-candidate.*
