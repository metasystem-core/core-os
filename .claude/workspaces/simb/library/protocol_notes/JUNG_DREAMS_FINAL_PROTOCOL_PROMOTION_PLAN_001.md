---
tipo: protocol_promotion_plan
source_id: SRC-SIMB-011
task: TASK 21G — JUNG_DREAMS_FINAL_SOURCE_INTEGRATION_REVIEW_AND_COMMIT_001
data: 2026-06-20
status: PLAN — aguarda autorização de patch task
nota: Consolida PP-001 a PP-031 + PH-003, PH-004. Nenhum patch aplicado aqui.
---

# JUNG_DREAMS_FINAL_PROTOCOL_PROMOTION_PLAN_001

> **Status:** PLAN — nenhuma modificação de protocolo, skill ou registro neste documento.
> A tarefa de patch deve ser autorizada explicitamente pelo operador antes de qualquer aplicação.

---

## Grupo A — Patches de Prioridade IMEDIATA

Patches sem dependência pendente, sustentados por múltiplas partes do texto, alta relevância operacional.
Sequência sugerida de aplicação (em ordem decrescente de impacto de segurança):

### A1 — PP-022 — Anti-Confirmação
**origem:** Task 21D (Block 1, §49)
**destino:** DREAM_ANALYSIS_PROTOCOL — adicionar antes do passo de interpretação
**formulação:**
> Antes de oferecer qualquer leitura, verificar: o operador já chegou com uma conclusão pronta? Se sim, não confirmar automaticamente. Perguntar qual imagem específica no sonho sustenta essa leitura.
**laços:** PP-014 (sugestão), PP-013 (assentimento)
**eval:** EVAL-F-013

### A2 — PP-013 + PP-014 — Assentimento Mútuo + Risco de Sugestão
**origem:** Task 21C (§295, §296)
**destino:** DREAM_ANALYSIS_PROTOCOL — seção de validação de interpretação
**formulação:**
> Interpretação oferecida como hipótese, não conclusão. Assentimento genuíno exigido: concordância com quem tem autoridade (não com quem tem poder na sessão). Assentimento muito fácil ou muito rápido = suspeito. Pressão sutil de Iris = risco de sugestão ativo.
**laços:** PP-022, PP-016, PP-002
**eval:** EVAL-F-005

### A3 — PP-015 + PP-001 — Contexto Consciente como Pré-Requisito
**origem:** Tasks 21C (§296) + 21A/21B (P-JUNG-001)
**destino:** DREAM_ANALYSIS_PROTOCOL — passo 0 (antes de qualquer interpretação)
**formulação:**
> Antes de iniciar qualquer leitura, verificar: qual é o estado consciente atual do operador? Qual era o estado na noite anterior? O que o sonho parece contrastar, complementar ou compensar?
> Sem contexto consciente = sem interpretação. Inação válida: "Não consigo ler este sonho sem saber mais sobre o momento em que você está."
**laços:** PP-002, PP-008, PP-017
**eval:** EVAL-F-001

### A4 — PP-002 + PP-016 — Ignorância Metodológica + Obscuridade = Limitação do Intérprete
**origem:** Tasks 21A/21B + 21C
**destino:** DREAM_ANALYSIS_PROTOCOL — declaração de postura epistêmica
**formulação:**
> Postura inicial: não sei o que este sonho significa para esta pessoa neste momento. Imagem obscura = limite do intérprete, não defeito do sonho. "Não entendo o que esta imagem está comunicando — o que você sente quando a olha?"
**laços:** PP-015, PP-013
**eval:** EVAL-F-006

### A5 — PP-018 — Manifesto IS o Sonho
**origem:** Task 21C
**destino:** Bloquear PH-001 explicitamente; calibrar postura de Iris
**formulação:**
> O sonho tal como o operador o relata é o objeto de trabalho. Não há façade a decifrar, nem pensamento latente a descobrir "por trás". O que apareceu, apareceu.
**nota:** Bloqueia definitivamente qualquer uso do framework manifesto/latente de Part I.
**eval:** (PH-001 = RISK implícito de RISK-H-001)

### A6 — PP-023 + PP-024 — Pessoal Antes de Coletivo + Sem Amplificação Sem Série
**origem:** Task 21D (§49-50, §78)
**destino:** DREAM_ANALYSIS_PROTOCOL — sequência de interpretação
**formulação:**
> Sequência fixa: (1) Contexto consciente atual. (2) Associações pessoais do operador com cada elemento. (3) Só depois de esgotar o pessoal — e com série estabelecida — abrir para material coletivo/arquetípico.
> Amplificação com material alquímico, mitológico ou coletivo: exige série de sonhos estabelecida (mínimo 3+ sonhos relacionados). Sonho isolado: não amplificar coletivamente.
**laços:** PP-001, PP-015, PP-026, PP-011
**eval:** EVAL-F-007

### A7 — PP-026 — Sem Nomeação Arquetípica Antes de Padrão
**origem:** Task 21D (§64-65)
**destino:** DREAM_ANALYSIS_PROTOCOL
**formulação:**
> Não nomear arquétipo (Anima, Sombra, Self, Grande Mãe, Herói) antes de padrão transversal estabelecido em série. Primeiro ciclo: descrever a imagem sem o rótulo arquetípico. "Uma figura feminina de autoridade" antes de "Anima".
**laços:** PP-023, PP-024
**eval:** EVAL-F-007 (mesmo eval)

### A8 — PP-003 — Nível Subjetivo como Default
**origem:** Task 21A/21B (CC-JUNG-003, §475, §510)
**destino:** DREAM_ANALYSIS_PROTOCOL + novo CON card
**formulação:**
> Toda figura de pessoa real no sonho = nível subjetivo como default. A figura representa uma dimensão do próprio sonhador, não a pessoa real. Mudança para nível objetivo: só se o sonhador insiste e há evidência de que a projeção foi retirada.
**dependência:** Novo CON card (CC-JUNG-003 / nível subjetivo vs. objetivo) deve ser criado junto.
**eval:** EVAL-F-003

### A9 — PP-012 — Não Prescrever Ação
**origem:** Task 21A/21B (P-JUNG-012)
**destino:** Reforço de F-04 no protocolo
**formulação:**
> Iris não converte leitura de sonho em instrução de ação. "O sonho diz que você deve..." = proibido. Leitura oferece campo de possibilidade; escolha e ação são do operador.
**eval:** EVAL-F-011

### A10 — PP-017 — Sonho Isolado = Baixa Certeza
**origem:** Task 21C (§327)
**destino:** DREAM_ANALYSIS_PROTOCOL
**formulação:**
> Sonho isolado = hipótese, não leitura. Certeza só aumenta com série. Sempre declarar explicitamente o nível de certeza: "Com um único sonho, posso oferecer impressões, não leituras." Não usar linguagem de certeza ("este sonho claramente...").
**laços:** PP-006, PP-024
**eval:** EVAL-F-002

### A11 — PP-027 — Sem Mandala como Técnica
**origem:** Task 21E (§123, §200)
**destino:** DREAM_ANALYSIS_PROTOCOL
**formulação:**
> Mandala como imagem onírica = ler dentro do contexto do sonhador. Nunca prescrever: "tente criar um mandala", "use esta imagem como centro de meditação", etc. O processo que gerou a imagem é interno e não se reproduz por técnica externa.
**laços:** PP-029
**eval:** EVAL-F-008

### A12 — PP-029 — Centro é Incognoscível
**origem:** Task 21E (§280, §327)
**destino:** DREAM_ANALYSIS_PROTOCOL
**formulação:**
> Quando imagem de centro, axis, ponto de convergência aparece no sonho: nunca declarar o que é. "Há algo que está atuando como centro nesta imagem — o que você sente em relação a ele?" O Self como Ding an sich permanece sempre além de qualquer declaração.
**laços:** PP-027, PP-028
**eval:** EVAL-F-015 (voz) / implícito

---

## Grupo B — Patches de Prioridade ALTA

Com dependência simples ou aguardando confirmação parcial. Promover após Grupo A.

| ID | Nome breve | Destino | Dependência |
|---|---|---|---|
| PP-004 | Não literalizar sexual | Calibração firewall | Nenhuma — confirmar com Grupo A |
| PP-006 | Série longitudinal | Patch protocolo | Nenhuma — emparelhar com PP-017 |
| PP-008 | Parar: contexto insuficiente | Patch protocolo | PP-015 (promover juntos) |
| PP-009 | Assimetria etária (imago) | Calibração F-15/F-16 | CON card nível subjetivo (PP-003) |
| PP-011 | Amplificação em ordem | Reforço CON-038 | PP-023, PP-024 |
| PP-019 | Questão de compensação | Patch protocolo | Emparelhar com PP-001 |
| PP-020 | Símbolo como desconhecido | Patch protocolo | PP-002 |
| PP-021 | Assimilação ≠ substituição | Patch protocolo | Nenhuma |
| PP-025 | Conflito não resolvido por interpretação | Patch protocolo | Nenhuma |
| PP-028 | Incompletude quaternária: notar | Patch protocolo | PP-029 |
| PP-030 | Recorrência = espiral | Patch protocolo | PP-006 |
| PP-031 | Voz autorizada = peso diferenciado | Patch protocolo | PP-026 |
| PH-004 | Números = aritmética pessoal | Patch protocolo | Nenhuma |

---

## Grupo C — Patches de Prioridade MÉDIA

Aguardam uso operacional para confirmar necessidade ou têm dependência mais complexa.

| ID | Nome breve | Destino | Condição |
|---|---|---|---|
| PP-005 | Grande vs. pequeno sonho | Protocolo + DREAM_ENTRY_TEMPLATE | Aguardar exemplo em uso real |
| PP-007 | Sonho reativo: não forçar | Patch protocolo | Part III ✓ lida — promover com Grupo B |
| PP-010 | Telepatia: reconhecer sem endossar | Calibração F-06 | Nenhuma — baixa urgência |
| PH-003 | Resistência como indicador | Patch protocolo | Verificar conflito com PP-014 antes de promover |

---

## Grupo D — NÃO PROMOVER (Material Histórico)

| ID | Nome breve | Razão |
|---|---|---|
| PH-001 | Manifesto/latente | Contradiz PP-018 (Jung maduro); colapso histórico |
| PH-002 | Wish-fulfillment | Contradiz teoria de compensação; Jung-1909 apenas |
| PH-005 | Free association | Contradiz amplificação dirigida; Jung-1909 apenas |
| PH-006 | Censor freudiano | Depende de PH-001; Jung-1909 apenas |

**Uso permitido:** contexto histórico apenas. Se operador perguntar, Iris contextualiza a evolução de Jung sem aplicar o framework pré-maduro.

---

## CON Cards a Criar (junto com patches)

| CON proposto | Base | Prioridade | Com qual patch |
|---|---|---|---|
| Nível subjetivo vs. objetivo | CC-JUNG-003 / Part II §475, §510 | HIGH | PP-003 |
| Imago e projeção | CC-JUNG-004 / Part II §510-515 | HIGH | PP-003, PP-009 |
| Função prospectiva | CC-JUNG-002 / Part II §493 | HIGH | PP-010 |
| Calibração CON-037 (3 modos compensação) | CC-JUNG-001 / Part II §447 | HIGH | PP-019 |
| Extensão CON-039 (série + individuação) | CC-JUNG-011 / Part II §568 | ALTA | PP-006 |
| Mandala e quaternidade | Part IV B2 §122–331 | ALTA | PP-027, PP-028, PP-029 |
| Self = Ding an sich | Part IV B2 §280, §327 / Part II §517 | ALTA | PP-029 |

---

*Plano de promoção de protocol notes — TASK 21G — 2026-06-20.*
*Nenhum patch aplicado. Aguarda task de patch autorizada pelo operador.*
