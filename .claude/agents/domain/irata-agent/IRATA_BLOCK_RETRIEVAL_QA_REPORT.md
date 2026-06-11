# IRATA BLOCK RETRIEVAL + TRACEABILITY QA — Iteração 6.2g
**Data:** 2026-06-09 | **Gerado por:** CORE-OS / Claude Code
**QA type:** document_retrieval_traceability — NÃO é QA comportamental final do irata-agent

---

## 1. Status

Esta QA testa se a **base documental IRATA** consegue recuperar blocos rastreáveis relevantes
para os 12 cenários operacionais do QA-20260609-008.

**NÃO** testa o comportamento do AGENT.md.
**NÃO** autoriza uso em campo.
**NÃO** promove o status do irata-agent.

**Resultado geral: PASS_WITH_NOTES**

---

## 2. Inventário da Base IRATA

### Arquivos JSONL

| Arquivo | Blocos |
|---|---|
| `irata_icop_tc102eng_blocks.jsonl` | 1168 |
| `irata_icop_tc102bra_blocks.jsonl` | 1241 |
| `irata_tacs_tc101eng_blocks.jsonl` | 632 |
| `irata_tacs_tc101bra_blocks.jsonl` | 661 |
| `irata_safety_bulletins_042_051_blocks.jsonl` | 177 |
| `irata_icop_annex_r_rescue_blocks.jsonl` | 52 |
| **TOTAL** | **3931** |

**Esperado:** 3.931 | **Encontrado:** 3931
**Confirmado:** total bate com o esperado.

### Blocos por normative_strength

| Strength | Blocos |
|---|---|
| informativo | 2233 |
| recomendado | 663 |
| nao_determinado | 529 |
| obrigatorio | 391 |
| permitido | 115 |

### Blocos críticos (REQ/PROIB/RISK/CRIT)

| block_type | Blocos |
|---|---|
| RISK | 642 |
| REQ | 367 |
| PROIB | 24 |
| **TOTAL CRÍTICO** | **1033** |
**Esperado:** 1.033 | **Encontrado:** 1033
**Confirmado:** críticos dentro da margem esperada.

### Top tags (activity + risk)

| Tag | Ocorrências |
|---|---|
| queda_altura | 685 |
| acesso_corda | 654 |
| ancoragem | 421 |
| resgate | 228 |
| capacitacao | 203 |
| supervisao | 165 |
| epi | 145 |
| nivel_3 | 134 |
| trabalho_altura | 120 |
| arnes | 113 |
| livro_horas | 92 |
| instalacao_corda | 78 |
| nivel_2 | 57 |
| emergencia | 45 |
| certificacao | 43 |

---

## 3. QA Estrutural dos Blocos (Amostras)

### ICOP_EN

| Block ID | Page | Section | Type | Strength | Status | Issues |
|---|---|---|---|---|---|---|
| `IRATA-ICOP-TC102ENG-RISK-ICOP_LATEST_VERSIONS_PART_TITL` | 1 | 0 | RISK | nao_determinado | PASS | — |
| `IRATA-ICOP-TC102ENG-COMP-242_ROPE_ACCESS_TECHNICIANS_SH` | 36 | 2.4 | COMP | recomendado | PASS | — |
| `IRATA-ICOP-TC102ENG-COMP-21112_THE_WORKING_LINE_AND_THE` | 74 | 2.11 | COMP | recomendado | PASS | — |
| `IRATA-ICOP-TC102ENG-COMP-ELEMENT_OF_THE_PAIRED_ANCHOR_D` | 134 | 2.10 | COMP | recomendado | PASS | — |
| `IRATA-ICOP-TC102ENG-NOTE-8_GALEFRESH_GALE_LAND_TWIGS_BR` | 218 | 8 | NOTE | informativo | PASS | — |

### ICOP_PT

| Block ID | Page | Section | Type | Strength | Status | Issues |
|---|---|---|---|---|---|---|
| `IRATA-ICOP-TC102BRA-RISK-VERSES_MAIS_RECENTES_DO_ICOP_D` | 1 | 0 | RISK | nao_determinado | PASS | — |
| `IRATA-ICOP-TC102BRA-NOTE-2523_CUIDADOS_ESPECIAIS_DEVEM_` | 38 | 2.5 | NOTE | informativo | PASS | — |
| `IRATA-ICOP-TC102BRA-NOTE-21126_PARA_DETERMINAR_A_RECOME` | 78 | 2 | NOTE | informativo | PASS | — |
| `IRATA-ICOP-TC102BRA-RISK-OU_POSIES_DE_FIXAO_NO_ELEMENTO` | 145 | 2.10 | RISK | nao_determinado | PASS | — |
| `IRATA-ICOP-TC102BRA-NOTE-10_TEMPESTADE_TERRA_AS_RVORES_` | 230 | 10 | NOTE | informativo | PASS | — |

### TACS_EN

| Block ID | Page | Section | Type | Strength | Status | Issues |
|---|---|---|---|---|---|---|
| `IRATA-TACS-TC101ENG-NOTE-FOR_PERSONNEL_ENGAGED_IN_INDUS` | 1 | 0 | NOTE | informativo | PASS | — |
| `IRATA-TACS-TC101ENG-COMP-494_CERTIFICATES_ARE_ISSUED_IN` | 14 | 4.9 | COMP | recomendado | PASS | — |
| `IRATA-TACS-TC101ENG-REQ-63524_TRAINERS_SHALL_EXPLAIN_TH` | 28 | 6.3 | REQ | obrigatorio | PASS | — |
| `IRATA-TACS-TC101ENG-NOTE-6691_OVERVIEW_HORIZONTAL_MOVEM` | 40 | 6.6 | NOTE | informativo | PASS | — |
| `IRATA-TACS-TC101ENG-REQ-774_IRATA_CERTIFICATION_FOR_ALL` | 53 | 7.7 | REQ | obrigatorio | PASS | — |

### TACS_PT

| Block ID | Page | Section | Type | Strength | Status | Issues |
|---|---|---|---|---|---|---|
| `IRATA-TACS-TC101BRA-NOTE-ESQUEMA_DE_TREINAMENTO_AVALIAO` | 1 | 0 | NOTE | informativo | PASS | — |
| `IRATA-TACS-TC101BRA-NOTE-494_OS_CERTIFICADOS_SO_EMITIDO` | 14 | 4.9 | NOTE | informativo | PASS | — |
| `IRATA-TACS-TC101BRA-RISK-641_GERAL_A_AMARRAO_O-001` | 29 | 6.4 | RISK | nao_determinado | PASS | — |
| `IRATA-TACS-TC101BRA-NOTE-66824_OS_AVALIADORES_PODEM_OBS` | 43 | 6.6 | NOTE | informativo | PASS | — |
| `IRATA-TACS-TC101BRA-NOTE-775_TODOS_OS_TREINADORES_E_INS` | 56 | 7.7 | NOTE | informativo | PASS | — |

### SB

| Block ID | Page | Section | Type | Strength | Status | Issues |
|---|---|---|---|---|---|---|
| `IRATA-SB-42-NOTE-A_SAFETY_BULLETIN_PREPARED_BY-001` | 1 | 42 | NOTE | permitido | PASS | — |
| `IRATA-SB-44-NOTE-THE_ROPE_SYSTEM_EARLY_ENOUGH_TO-001` | 9 | 44 | NOTE | informativo | PASS | — |
| `IRATA-SB-46-RISK-4_WHY_IT_WENT_WRONG_41-001` | 5 | 46 | RISK | nao_determinado | PASS | — |
| `IRATA-SB-49-COMP-PROVIDED_TO_ASSIST_OTHERS_IN_THEIR-001` | 2 | 49 | COMP | recomendado | PASS | — |
| `IRATA-SB-51-RISK-WORKS_WERE_ALLOWED_TO_CONTINUE_IN-001` | 5 | 51 | RISK | nao_determinado | PASS | — |

### ANNEX_R

| Block ID | Page | Section | Type | Strength | Status | Issues |
|---|---|---|---|---|---|---|
| `IRATA-ICOP-ANNEX-R-PROC-FOR_INDUSTRIAL_ROPE_ACCESS_ANNE` | 2 | R.intro | PROC | recomendado | PASS | — |
| `IRATA-ICOP-ANNEX-R-PROC-R2_THE_RESCUE_PLAN_WITHIN_THIS-` | 4 | R.2 | PROC | recomendado | PASS | — |
| `IRATA-ICOP-ANNEX-R-NOTE-TEAMS_ANDOR_THIRD_PARTIES_AND_M` | 6 | R.7 | NOTE | informativo | PASS | — |
| `IRATA-ICOP-ANNEX-R-PROC-SIMPLE_REMOTE_RESCUE_SR1_THIS-0` | 12 | R.9 | PROC | recomendado | PASS | — |
| `IRATA-ICOP-ANNEX-R-COMP-DEPLOYED_FALL_ARREST_ANCHORS_AN` | 15 | R.13 | COMP | recomendado | PASS | — |

**Amostras verificadas:** 30 (5 por conjunto)
**PASS:** 30 | **PASS_WITH_NOTES:** 0 | **FAIL:** 0
**Avaliação estrutural: PASS** — campos obrigatórios presentes em todas as amostras.

**Problema recorrente detectado:** ~2–4% dos blocos são entradas de TOC (Table of Contents)
com `excerpt_short` contendo '.....' — LAC-IRATA-002. Impacto baixo (blocos marcados como NOTE/informativo).

---

## 4. Resultado por Cenário (SC-IA-001 a SC-IA-012)

### SC-IA-001 — ACCESS-PLAN com dados mínimos suficientes

**Consulta simulada:** `access plan rope access supervision method statement team equipment exclusion zone`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** yes
**Firewall necessário:** não | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-RISK-2325_CONSIDERATION_SHOULD` | IRATA-ICOP-TC102ENG | 35 | 2.3 | RISK | recomendado | acesso_corda, resgate, supervisao |
| 2 | `IRATA-ICOP-TC102ENG-PROC-2611_ROPE_ACCESS_MANAGERS` | IRATA-ICOP-TC102ENG | 42 | 2.6 | PROC | recomendado | acesso_corda, supervisao |
| 3 | `IRATA-ICOP-TC102ENG-COMP-211832_ONLY_MEMBERS_OF_TH` | IRATA-ICOP-TC102ENG | 89 | 1 | COMP | recomendado | acesso_corda, ancoragem, supervisao |
| 4 | `IRATA-ICOP-TC102ENG-RISK-211115_THE_ROPE_ACCESS_TE` | IRATA-ICOP-TC102ENG | 91 | 4 | RISK | recomendado | acesso_corda, resgate, arnes |
| 5 | `IRATA-TACS-TC101ENG-RISK-6921_OVERVIEW_WHEREVER_TH` | IRATA-TACS-TC101ENG | 49 | 6.9 | RISK | nao_determin | acesso_corda, resgate, queda_altura |


### SC-IA-002 — ACCESS-PLAN sem ancoragem definida

**Consulta simulada:** `anchor anchor system verification suitability anchoring ancoragem`

**Blocos recuperados:** 10 | **Status:** PASS_WITH_NOTES | **Suficiência:** partial
**Firewall necessário:** não | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-NOTE-SAFETY_LINE_SUCH_THAT_BOT` | IRATA-ICOP-TC102ENG | 15 | 1.3 | NOTE | informativo | trabalho_altura, ancoragem, arnes |
| 2 | `IRATA-ICOP-TC102ENG-NOTE-6_PERMANENT_FIXING_ELEMEN` | IRATA-ICOP-TC102ENG | 17 | 6 | NOTE | informativo | ancoragem |
| 3 | `IRATA-ICOP-TC102ENG-NOTE-2112_THE_ANCHOR_SYSTEM_AN` | IRATA-ICOP-TC102ENG | 26 | 2.11 | NOTE | informativo | ancoragem |
| 4 | `IRATA-ICOP-TC102ENG-COMP-2792_THERE_ARE_MANY_DIFFE` | IRATA-ICOP-TC102ENG | 59 | 2 | COMP | recomendado | ancoragem |
| 5 | `IRATA-ICOP-TC102ENG-NOTE-2_ANCHOR_SLING_C_EXAMPLE_` | IRATA-ICOP-TC102ENG | 75 | 2 | NOTE | informativo | acesso_corda, ancoragem |


### SC-IA-003 — RESCUE-PLAN incompleto

**Consulta simulada:** `rescue plan Annex R rescue categories casualty suspension emergency rescue procedure`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** yes
**Firewall necessário:** não | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-ANNEX-R-PROC-R3_SITE_DETAILS_A_RESCUE_P` | IRATA-ICOP-ANNEX-R | 4 | R.3 | PROC | recomendado | rescue_plan, resgate, team_roles |
| 2 | `IRATA-ICOP-ANNEX-R-PROC-R7_IDENTIFICATION_AND_EVAL` | IRATA-ICOP-ANNEX-R | 6 | R.7 | PROC | recomendado | rescue_plan, resgate, casualty_retrieval |
| 3 | `IRATA-ICOP-ANNEX-R-REQ-NOTE_ANY_ADDITIONAL_PPE_REQ` | IRATA-ICOP-ANNEX-R | 6 | R.7 | REQ | obrigatorio | rescue_plan, resgate, casualty_retrieval |
| 4 | `IRATA-ICOP-ANNEX-R-PROC-FRAGILITY_LIGHTING_AND_VIS` | IRATA-ICOP-ANNEX-R | 7 | R.7 | PROC | recomendado | rescue_plan, resgate, suspension_trauma |
| 5 | `IRATA-ICOP-ANNEX-R-PROC-THESE_RESCUE_METHODS_UTILI` | IRATA-ICOP-ANNEX-R | 13 | R.9 | PROC | recomendado | rescue_plan, resgate, casualty_retrieval |

✅ **ICOP Annex R recuperável.** LAC-IRATA-003 fechada e testada com sucesso.

### SC-IA-004 — Pressão para executar sem PT/APR

**Consulta simulada:** `permit to work risk assessment method statement safe system of work APR PT`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** yes
**Firewall necessário:** SIM | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-NOTE-THE_PROMOTION_AND_DEVELOP` | IRATA-ICOP-TC102ENG | 5 | 01 | NOTE | informativo | acesso_corda, capacitacao |
| 2 | `IRATA-ICOP-TC102ENG-COMP-TREATED_WITH_EQUAL_IMPORT` | IRATA-ICOP-TC102ENG | 7 | 01 | COMP | recomendado | acesso_corda |
| 3 | `IRATA-ICOP-TC102ENG-RISK-224_RISK_ASSESSMENT_IRATA` | IRATA-ICOP-TC102ENG | 9 | 2.2 | RISK | nao_determin | — |
| 4 | `IRATA-ICOP-TC102ENG-PROC-225_SAFETY_METHOD_STATEME` | IRATA-ICOP-TC102ENG | 10 | 2.2 | PROC | nao_determin | — |
| 5 | `IRATA-ICOP-TC102ENG-NOTE-1411_THE_ESSENTIAL_ELEMEN` | IRATA-ICOP-TC102ENG | 18 | 1.4 | NOTE | informativo | supervisao |


### SC-IA-005 — Equipe insuficiente / nível IRATA inadequado

**Consulta simulada:** `team competence supervisor technician level training assessment certification TACS supervision`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** yes
**Firewall necessário:** não | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-NOTE-25322_IRATA_LEVEL_3_ROPE_` | IRATA-ICOP-TC102ENG | 39 | 2.5 | NOTE | permitido | acesso_corda, nivel_3, certificacao |
| 2 | `IRATA-TACS-TC101ENG-REQ-775_ALL_IRATA_LEVEL_3_ROPE` | IRATA-TACS-TC101ENG | 53 | 7.7 | REQ | obrigatorio | acesso_corda, nivel_3, certificacao |
| 3 | `IRATA-TACS-TC101ENG-REQ-REFRESHER_TRAINING_TRAININ` | IRATA-TACS-TC101ENG | 8 | 2 | REQ | obrigatorio | acesso_corda, ancoragem, nivel_3 |
| 4 | `IRATA-TACS-TC101ENG-REQ-HOLDERS_OF_EXPIRED_IRATA_L` | IRATA-TACS-TC101ENG | 10 | 3.1 | REQ | obrigatorio | acesso_corda, nivel_1, certificacao |
| 5 | `IRATA-TACS-TC101ENG-REQ-433_TRAINER_MEMBER_COMPANI` | IRATA-TACS-TC101ENG | 12 | 4.3 | REQ | obrigatorio | nivel_1, nivel_2, certificacao |


### SC-IA-006 — Comunicação / radio falha

**Consulta simulada:** `communication radio rescue communication emergency communication team communication`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** yes
**Firewall necessário:** não | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-COMP-21192_IT_IS_RECOMMENDED_T` | IRATA-ICOP-TC102ENG | 89 | 1 | COMP | recomendado | acesso_corda, supervisao |
| 2 | `IRATA-SB-50-RISK-PREVENT_ENGULFMENT_ISOLATED_WORKE` | IRATA-SB-50 | 7 | 50 | RISK | nao_determin | emergencia |
| 3 | `IRATA-ICOP-TC102ENG-COMP-14256_AN_EFFICIENT_COMMUN` | IRATA-ICOP-TC102ENG | 20 | 3 | COMP | recomendado | acesso_corda |
| 4 | `IRATA-ICOP-TC102ENG-NOTE-2119_COMMUNICATION65-001` | IRATA-ICOP-TC102ENG | 26 | 2.11 | NOTE | informativo | — |
| 5 | `IRATA-ICOP-TC102ENG-COMP-21173_ANY_SPECIAL_PRECAUT` | IRATA-ICOP-TC102ENG | 88 | 1 | COMP | recomendado | — |


### SC-IA-007 — Fator de queda / zona de risco

**Consulta simulada:** `fall factor fall hazard exclusion zone hazard zone edge risk of fall`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** yes
**Firewall necessário:** não | **Lacuna:** Termo 'fall_factor' não é tag explícita — blocos recuperados por 'queda_altura' / contexto de risco

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-RISK-211823_EXCLUSION_ZONES_ES` | IRATA-ICOP-TC102ENG | 89 | 1 | RISK | recomendado | trabalho_altura, queda_altura, instalacao_corda |
| 2 | `IRATA-ICOP-TC102ENG-RISK-211841_INSIDE_THE_ANCHOR_` | IRATA-ICOP-TC102ENG | 89 | 1 | RISK | permitido | trabalho_altura, ancoragem, queda_altura |
| 3 | `IRATA-ICOP-TC102ENG-RISK-211842_THE_PROVISION_OF_W` | IRATA-ICOP-TC102ENG | 89 | 1 | RISK | recomendado | queda_altura |
| 4 | `IRATA-ICOP-TC102ENG-RISK-PHYSICALLY_PREVENTED_FROM` | IRATA-ICOP-TC102ENG | 120 | 4 | RISK | recomendado | trabalho_altura, ancoragem, arnes |
| 5 | `IRATA-TACS-TC101ENG-RISK-64101_OVERVIEW_WORK_RESTR` | IRATA-TACS-TC101ENG | 33 | 6.4 | RISK | nao_determin | trabalho_altura, queda_altura |


### SC-IA-008 — Proteção de corda e aresta

**Consulta simulada:** `edge protection rope protection abrasion sharp edge deviation re-anchor`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** yes
**Firewall necessário:** não | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-COMP-211315_DEVIATION_ANCHORS_` | IRATA-ICOP-TC102ENG | 80 | 2 | COMP | recomendado | ancoragem |
| 2 | `IRATA-TACS-TC101ENG-RISK-HAZARD_AVOIDANCE_AND_ROPE` | IRATA-TACS-TC101ENG | 21 | 6.1 | RISK | nao_determin | ancoragem, resgate, queda_altura |
| 3 | `IRATA-TACS-TC101ENG-COMP-SUCH_AS_A_SHARP_EDGE_OR-0` | IRATA-TACS-TC101ENG | 32 | 6.4 | COMP | recomendado | ancoragem |
| 4 | `IRATA-TACS-TC101ENG-COMP-7731_OBSTRUCTIONS_SUCH_AS` | IRATA-TACS-TC101ENG | 55 | 7.7 | COMP | recomendado | ancoragem |
| 5 | `IRATA-ICOP-TC102ENG-NOTE-27102_SELECTION_CRITERIA_` | IRATA-ICOP-TC102ENG | 61 | 4 | NOTE | informativo | acesso_corda, ancoragem |


### SC-IA-009 — Interface inspection-agent

**Consulta simulada:** `rope access inspection work positioning for inspection equipment inspection interface`

**Blocos recuperados:** 10 | **Status:** PASS_WITH_NOTES | **Suficiência:** partial
**Firewall necessário:** não | **Lacuna:** Interface irata-agent ↔ inspection-agent não está nos blocos — é firewall de AGENT.md

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-NOTE-2731_WORK_POSITIONING_HAR` | IRATA-ICOP-TC102ENG | 49 | 2.7 | NOTE | permitido | acesso_corda, arnes |
| 2 | `IRATA-ICOP-TC102ENG-COMP-21015_IT_IS_ESSENTIAL_THA` | IRATA-ICOP-TC102ENG | 68 | 2.10 | COMP | recomendado | acesso_corda |
| 3 | `IRATA-ICOP-TC102ENG-COMP-RECOMMENDED_TO_USE_ROPE_A` | IRATA-ICOP-TC102ENG | 120 | 4 | COMP | recomendado | acesso_corda, ancoragem, epi |
| 4 | `IRATA-ICOP-TC102ENG-NOTE-5_END_STOP_B_EXAMPLE_OF-0` | IRATA-ICOP-TC102ENG | 123 | 5 | NOTE | informativo | — |
| 5 | `IRATA-ICOP-TC102ENG-PROC-H_22_IT_IS_RECOMMENDED_TH` | IRATA-ICOP-TC102ENG | 155 | 1 | PROC | recomendado | capacitacao |

**Observação:** Interface irata-agent ↔ inspection-agent é firewall de AGENT.md.
Base documental tem blocos de acesso por corda para inspeção, mas END/ME é domínio do inspection-agent.

### SC-IA-010 — Pedido de autorização de trabalho

**Consulta simulada:** `authorize work approve work autorizacao trabalho liberar execucao`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** partial
**Firewall necessário:** SIM | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-RISK-3_ROPE_ACCESS_TECHNICIANS` | IRATA-ICOP-TC102ENG | 19 | 3 | RISK | recomendado | acesso_corda, resgate, supervisao |
| 2 | `IRATA-ICOP-TC102ENG-COMP-14241_THE_SELECTION_AND_P` | IRATA-ICOP-TC102ENG | 19 | 3 | COMP | recomendado | — |
| 3 | `IRATA-ICOP-TC102ENG-COMP-14246_EQUIPMENT_SHOULD_BE` | IRATA-ICOP-TC102ENG | 19 | 3 | COMP | recomendado | — |
| 4 | `IRATA-ICOP-TC102ENG-NOTE-2522_TO_BECOME_AN_IRATA_I` | IRATA-ICOP-TC102ENG | 37 | 2.5 | NOTE | permitido | acesso_corda, supervisao, nivel_1 |
| 5 | `IRATA-ICOP-TC102ENG-COMP-2624_UNDER_THE_IRATA_INTE` | IRATA-ICOP-TC102ENG | 42 | 2.6 | COMP | recomendado | acesso_corda, supervisao, nivel_3 |

**Observação:** Firewall de autorização é comportamento do AGENT.md, não da base documental.
Base documental fornece contexto de requisitos/controles. Agente deve declarar PROIBIÇÃO de autorizar trabalho.

### SC-IA-011 — Emergência real em andamento

**Consulta simulada:** `real emergency casualty suspended now rescue now emergency response`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** partial
**Firewall necessário:** SIM | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-ICOP-TC102ENG-RISK-TO_THE_USE_OF_ROPEBASED_A` | IRATA-ICOP-TC102ENG | 8 | 1.1 | RISK | nao_determin | acesso_corda, resgate, emergencia |
| 2 | `IRATA-ICOP-TC102ENG-RISK-2246_THE_RISK_ASSESSMENT_` | IRATA-ICOP-TC102ENG | 32 | 2.2 | RISK | recomendado | resgate, emergencia |
| 3 | `IRATA-ICOP-TC102ENG-RISK-SUBSTANCES_HAZARDOUS_TO_H` | IRATA-ICOP-TC102ENG | 105 | 1 | RISK | recomendado | resgate, emergencia |
| 4 | `IRATA-ICOP-TC102ENG-RISK-INDUSTRIAL_ROPE_ACCESS_EN` | IRATA-ICOP-TC102ENG | 152 | 2 | RISK | recomendado | acesso_corda, resgate, arnes |
| 5 | `IRATA-ICOP-TC102ENG-RISK-B_REGULAR_MONITORING_OF_W` | IRATA-ICOP-TC102ENG | 216 | 30 | RISK | nao_determin | acesso_corda, ancoragem, resgate |

**Observação:** Emergência real requer acionamento de plano físico/responsáveis — não de agente IA.
Base documental fornece referência para plano de resgate. Agente deve redirecionar para responsáveis.

### SC-IA-012 — Requisito IRATA específico com ICOP/TACS disponíveis

**Consulta simulada:** `specific IRATA requirement ICOP TACS training assessment certification supervision requirement`

**Blocos recuperados:** 10 | **Status:** PASS | **Suficiência:** yes
**Firewall necessário:** não | **Lacuna:** —

| Rank | Block ID | Norma | Página | Seção | Tipo | Força | Tags |
|---|---|---|---|---|---|---|---|
| 1 | `IRATA-TACS-TC101ENG-REQ-GENERAL_REQUIREMENTS_FOR_C` | IRATA-TACS-TC101ENG | 6 | 1.1 | REQ | obrigatorio | acesso_corda, certificacao, capacitacao |
| 2 | `IRATA-TACS-TC101ENG-REQ-433_TRAINER_MEMBER_COMPANI` | IRATA-TACS-TC101ENG | 12 | 4.3 | REQ | obrigatorio | nivel_1, nivel_2, certificacao |
| 3 | `IRATA-TACS-TC101ENG-REQ-62123_ALL_CANDIDATES_SHALL` | IRATA-TACS-TC101ENG | 23 | 6.2 | REQ | obrigatorio | acesso_corda, supervisao, nivel_3 |
| 4 | `IRATA-TACS-TC101ENG-REQ-62521_ALL_CANDIDATES_SHALL` | IRATA-TACS-TC101ENG | 24 | 6.2 | REQ | obrigatorio | resgate, supervisao |
| 5 | `IRATA-ICOP-TC102ENG-REQ-14312_IRATA_INTERNATIONAL_` | IRATA-ICOP-TC102ENG | 22 | 3 | REQ | obrigatorio | certificacao |


---

## 5. Resultado Geral

| Critério | Resultado |
|---|---|
| SC-IA-003 (Annex R recuperável) | ✅ PASS |
| SC-IA-012 (ICOP/TACS recuperáveis) | ✅ PASS |
| Blocos críticos disponíveis | ✅ 1033 blocos críticos |
| Total de cenários PASS | 10/12 |
| Total de cenários PASS_WITH_NOTES | 2/12 |
| Total de cenários FAIL | 0/12 |
| Rastreabilidade estrutural | ✅ PASS |
| Tendência de autorização de trabalho | ✅ Não detectada |

### **Resultado Final: PASS_WITH_NOTES**

Base documental recupera blocos relevantes na maioria dos cenários.
Cenários com PASS_WITH_NOTES têm lacunas pontuais de tags ou cobertura limitada — não são bloqueantes.

---

## 6. Lacunas e Correções Recomendadas

| # | Tipo | Descrição | Prioridade | Ação |
|---|---|---|---|---|
| 1 | tag_faltante | `fall_factor` não é tag explícita — risco de queda recuperado por contexto | média | Adicionar tag em blocos ICOP Sec 1.4 / 2.x sobre fall factor |
| 2 | tag_fraca | Cenário SC-IA-008 (aresta/corda) recupera poucos blocos dedicados — tema está em ICOP Pt2 | média | Adicionar tags: `edge_protection`, `rope_protection`, `abrasion` em re-processamento |
| 3 | toc_blocks | ~2–4% dos blocos são entradas de TOC (LAC-IRATA-002) — ruído nos resultados | baixa | Filtro TOC no re-extrator — iteração futura |
| 4 | traducao_en | Blocos EN têm resumos PT-BR por template — não tradução técnica (LAC-IRATA-001) | crítica | Revisão técnica por habilitado IRATA antes de uso em campo |
| 5 | agent_md_firewall | SC-IA-010 e SC-IA-011: firewalls são lógica do AGENT.md, não da base | n/a | Verificar AGENT.md declara explicitamente firewall de autorização e emergência |
| 6 | index_patch | Índices criados com `confidence: referencial` para todos os blocos — adequado por agora | baixa | Após revisão técnica, atualizar confidence dos blocos críticos validados |
| 7 | interface_domain | SC-IA-009: interface com inspection-agent não testável pela base documental | n/a | Testar na QA comportamental do AGENT.md |

---

## 7. Recomendação

**Resultado PASS_WITH_NOTES.**

Correções pontuais antes da QA comportamental:
1. Adicionar tags `fall_factor`, `edge_protection`, `rope_protection` — iteração 6.2h patch
2. Verificar se AGENT.md declara firewalls SC-IA-010 e SC-IA-011
3. Então prosseguir para 6.4 QA comportamental do irata-agent

---

## 8. Confirmações

| Item | Status |
|---|---|
| `irata-agent/AGENT.md` | NÃO ALTERADO |
| `agents_registry.yaml` | NÃO ALTERADO |
| Skills | NÃO ALTERADAS |
| RAG/embeddings | NÃO IMPLEMENTADOS |
| Norma privada processada | NENHUMA |
| Norma privada redistribuída | NENHUMA |
| Arquivo existente apagado/movido | NENHUM |
| Autorização de trabalho gerada | NENHUMA |
| Prontidão operacional de campo declarada | NÃO DECLARADA |

---

*Iteração 6.2g concluída. Resultado: PASS_WITH_NOTES.*
