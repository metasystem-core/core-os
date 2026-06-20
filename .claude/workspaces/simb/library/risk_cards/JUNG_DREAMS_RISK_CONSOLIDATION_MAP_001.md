---
tipo: consolidation_map
source_id: SRC-SIMB-011
task: TASK 24 — RISK_JUNG_PROMOTION_AND_MERGE_001
data: 2026-06-20
status: official
consolidacoes_executadas: 2
consolidacoes_deferidas: 1
---

# JUNG_DREAMS_RISK_CONSOLIDATION_MAP_001

> Mapa de consolidações de risk cards de SRC-SIMB-011.
> Fonte de decisão: JUNG_DREAMS_FINAL_RISK_PROMOTION_PLAN_001 (seção "Consolidações Propostas").
> Consolidação = dois ou mais source cards com conteúdo equivalente → um card oficial unificado.

---

## Consolidações Executadas

### RISK-FINAL-001 — sexual_automatism

| campo | valor |
|---|---|
| card_id_output | RISK-FINAL-001 |
| titulo | Automatismo sexual — literalização sem contexto pessoal |
| nome_tecnico | sexual_automatism |
| source_cards | RISK-JUNG-006, RISK-H-002 |
| razão_da_consolidação | Conteúdo equivalente: ambos cobrem automatismo de leitura sexual sem contexto pessoal |
| status | official |
| arquivo_de_output | JUNG_DREAMS_PROMOTED_RISK_CARDS_001.md |

**RISK-JUNG-006 — Sexual Concretism Jung (§506, §73, General Aspects)**
Conteúdo original: imagem com conotação sexual → leitura sexual automática, sem verificar dimensão simbólica. Trigger em conteúdo explícito ou implícito.

**RISK-H-002 — Automatic Sexual Symbolism (§86, §92, §150, Part I)**
Conteúdo original: Papa, torre, serpente, entradas — Iris aplica framework sexual pronto sem contexto pessoal. Perspectiva histórica: Part I demonstra o que acontece quando o intérprete tem categorias ready-made.

**Síntese:**
Os dois cards documentam o mesmo padrão de falha em nível de trigger e resposta segura. RISK-H-002 acrescenta o ângulo histórico: o automatismo sexual é exatamente o defeito do método de Part I que a teoria madura de Jung reverteu. RISK-FINAL-001 incorpora ambas as perspectivas.

**O que cada card adiciona ao consolidado:**
- RISK-JUNG-006 → formulação geral do risco + safe behavior operacional
- RISK-H-002 → âncora histórica (por que o automatismo é um defeito doutrinário, não só metodológico)

---

### RISK-FINAL-002 — clinical_diagnostic_overreach

| campo | valor |
|---|---|
| card_id_output | RISK-FINAL-002 |
| titulo | Overreach diagnóstico / prognóstico clínico |
| nome_tecnico | clinical_diagnostic_overreach |
| source_cards | RISK-JUNG-005, RISK-JUNG-015 |
| razão_da_consolidação | Conteúdo equivalente: ambos cobrem violação do limite clínico a partir de padrão de sonhos |
| status | official |
| arquivo_de_output | JUNG_DREAMS_PROMOTED_RISK_CARDS_001.md |

**RISK-JUNG-005 — Clinical Diagnosis via Dreams (CW 8, General Aspects)**
Conteúdo original: padrão de sonhos que poderia ser lido como indicador de condição psíquica. Trigger: Iris deriva para diagnóstico informal.

**RISK-JUNG-015 — Clinical Diagnostic/Prognostic Overreach (§343–350, Part III)**
Conteúdo original: prognóstico físico além do diagnóstico psíquico. Especifica o caso clínico de Part III (menina de 17 anos) como demonstração das condições que SIMB não possui.

**Síntese:**
RISK-JUNG-005 é o caso geral; RISK-JUNG-015 é a especificação de Part III (prognóstico físico + condições ausentes). O consolidado RISK-FINAL-002 unifica as duas formulações e estabelece o safe behavior único: nomear o limite, não inferir.

**O que cada card adiciona ao consolidado:**
- RISK-JUNG-005 → formulação geral do risco + formulações de trigger psíquico
- RISK-JUNG-015 → extensão para prognóstico físico + âncora clínica de Part III

---

## Consolidação Deferida

### RISK-FINAL-003 — reductive_causal_collapse (deferido)

| campo | valor |
|---|---|
| card_id_output_proposto | RISK-FINAL-003 |
| titulo_proposto | Reductivismo causal — todo caminho leva ao passado |
| nome_tecnico_proposto | reductive_causal_collapse |
| source_cards_pretendidos | RISK-JUNG-018, RISK-JUNG-019, RISK-H-005 |
| motivo_do_deferimento | RISK-H-005 em hold (razão: consolidar antes de promover; aguarda confirmação de conteúdo) |
| status | deferido |
| ação_quando_RISK-H-005_for_promovido | criar RISK-FINAL-003 consolidando 018 + 019 + H-005 |

**Status atual de cada source card:**
- RISK-JUNG-018 → promovido individualmente (JUNG_DREAMS_PROMOTED_RISK_CARDS_001.md)
- RISK-JUNG-019 → promovido individualmente (JUNG_DREAMS_PROMOTED_RISK_CARDS_001.md)
- RISK-H-005 → HOLD (aguarda consolidação)

---

## Nota de Discrepância: ID Mapping Task 21C

Durante a promoção, foi identificada discrepância entre os IDs usados no `JUNG_DREAMS_FINAL_RISK_PROMOTION_PLAN_001.md` e os IDs atribuídos nos raw cards de Task 21C (`JUNG_DREAMS_PRACTICAL_USE_RISK_CARDS_001.md`):

| ID no plano | conteúdo descrito no plano | ID no raw card | conteúdo do raw card |
|---|---|---|---|
| RISK-JUNG-011 | "Literalização Sexual" (Task 21C/21F) | RISK-JUNG-011 | Sugestão Via Autoridade do Intérprete (§315-316) |
| RISK-JUNG-015 | Overreach Diagnóstico | RISK-JUNG-015 | Overreach Diagnóstico / Prognóstico ✓ (match) |
| RISK-JUNG-017 | Jargon Loop | RISK-JUNG-017 | Loop de Jargão / Confirmação por Jargão ✓ (match) |

**Resolução:** O plano de promoção usou IDs de uma versão anterior dos candidatos de Task 21C. A consolidação "Literalização Sexual" (plano) foi mapeada por CONTEÚDO para RISK-JUNG-006 (Task 21A) + RISK-H-002, que são os cards com conteúdo equivalente. RISK-JUNG-011 do raw card (Sugestão Via Autoridade) foi promovido individualmente. A discrepância foi reportada no audit — não afeta os counts totais (24+4+5=33).

---

## Sumário de Consolidações

| output_card | source_cards | status |
|---|---|---|
| RISK-FINAL-001 | RISK-JUNG-006 + RISK-H-002 | executado |
| RISK-FINAL-002 | RISK-JUNG-005 + RISK-JUNG-015 | executado |
| RISK-FINAL-003 | RISK-JUNG-018 + RISK-JUNG-019 + RISK-H-005 | deferido (H-005 em hold) |

---

*Mapa de consolidações — TASK 24 — 2026-06-20.*
*2 consolidações executadas, 1 deferida (aguarda promoção de RISK-H-005).*
