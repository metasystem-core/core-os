---
tipo: audit
source_id: SRC-SIMB-011
audit_id: JUNG_DREAMS_RISK_PROMOTION_AND_MERGE_AUDIT_001
objeto: TASK 24 — promoção e consolidação dos 33 risk cards candidatos de SRC-SIMB-011
task: TASK 24 — RISK_JUNG_PROMOTION_AND_MERGE_001
data: 2026-06-20
resultado: PASS
---

# JUNG_DREAMS_RISK_PROMOTION_AND_MERGE_AUDIT_001

## Status

**PASS**

---

## Preflight (pré-task)

| Item | Resultado |
|---|---|
| branch | main |
| staged files | zero (clean) |
| ahead | 0 |
| behind | 0 |
| untracked local-decision files | 4 (operator_context ×2, cesto ×2 — não tocados) |

---

## Scope Verification

| Item | Resultado |
|---|---|
| source_of_truth used: JUNG_DREAMS_FINAL_RISK_PROMOTION_PLAN_001 | sim |
| no new source theory created | sim |
| no raw PDF read | sim |
| AGENT.md not modified | sim |
| dream-analysis skill not modified | sim |
| CON cards not modified | sim |
| CONCEPTS_REGISTRY not modified | sim |
| evals not modified | sim |
| Group C/MÉDIA protocol patches not applied | sim |
| HOLD or DO_NOT_PROMOTE items not promoted | sim |
| OPERATOR_PROFILE not modified | sim |
| sonhos not touched | sim |
| cesto not touched | sim |
| no private operator content used | sim |
| no raw/full copyrighted text copied | sim |

---

## Decision Count Verification

| Categoria | Count per plano | Count executado |
|---|---|---|
| Promover (individual) | 24 | 24 ✓ |
| Consolidar (source cards) | 4 | 4 ✓ |
| Hold | 5 | 5 ✓ |
| **Total** | **33** | **33 ✓** |

**Contagem de output cards:**
- 24 cards individuais promovidos
- 2 cards consolidados (RISK-FINAL-001, RISK-FINAL-002)
- 1 consolidação deferida (RISK-FINAL-003 — RISK-H-005 em hold)
- 0 IDs de RISK_REGISTRY afetados (sem RISK_REGISTRY existente)

---

## Decisions por card

| source_id | decisão | output |
|---|---|---|
| RISK-JUNG-001 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-002 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-003 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-004 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-005 | CONSOLIDAR | → RISK-FINAL-002 (com RISK-JUNG-015) |
| RISK-JUNG-006 | CONSOLIDAR | → RISK-FINAL-001 (com RISK-H-002) |
| RISK-JUNG-007 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-008 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-009 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-010 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-011 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-012 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-013 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-014 | HOLD | — aguarda consolidação com PP-012 |
| RISK-JUNG-015 | CONSOLIDAR | → RISK-FINAL-002 (com RISK-JUNG-005) |
| RISK-JUNG-016 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-017 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-018 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-019 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-020 | HOLD | — aguarda consolidação com RISK-019 |
| RISK-JUNG-021 | HOLD | — aguarda CON card mandala/Self adicional |
| RISK-JUNG-022 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-023 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-024 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-025 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-026 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-027 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-JUNG-028 | HOLD | — confirmar com mais casos de corpus |
| RISK-H-001 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-H-002 | CONSOLIDAR | → RISK-FINAL-001 (com RISK-JUNG-006) |
| RISK-H-003 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-H-004 | PROMOVER | individual — JUNG_DREAMS_PROMOTED_RISK_CARDS_001 |
| RISK-H-005 | HOLD | — aguarda consolidação → RISK-FINAL-003 (deferido) |

---

## Nota de Discrepância: ID Mapping Task 21C

O `JUNG_DREAMS_FINAL_RISK_PROMOTION_PLAN_001.md` usa IDs de Task 21C que não correspondem aos IDs nos raw cards (`JUNG_DREAMS_PRACTICAL_USE_RISK_CARDS_001.md`). Especificamente, o plano descreve RISK-JUNG-011 como "Literalização Sexual" (Task 21C/21F), mas o raw card nesse ID é "Sugestão Via Autoridade do Intérprete" (§315-316).

**Resolução adotada:** matching por CONTEÚDO, não por ID. A consolidação "Literalização Sexual" foi mapeada para RISK-JUNG-006 (Task 21A, Sexual Concretism) + RISK-H-002, que têm conteúdo equivalente e formam o RISK-FINAL-001 coerente. RISK-JUNG-011 do raw card (Sugestão Via Autoridade) foi promovido individualmente.

**Impacto nos counts:** zero — os totais (24+4+5=33) são preservados. A discrepância é de nomenclatura interna, não de decisão de promoção.

---

## Files Created

| Arquivo | Tipo |
|---|---|
| `.claude/workspaces/simb/library/risk_cards/JUNG_DREAMS_PROMOTED_RISK_CARDS_001.md` | Cards promovidos (24 individuais + 2 consolidados) |
| `.claude/workspaces/simb/library/risk_cards/JUNG_DREAMS_RISK_CONSOLIDATION_MAP_001.md` | Mapa de consolidações |
| `.claude/workspaces/simb/library/JUNG_DREAMS_RISK_PROMOTION_AND_MERGE_AUDIT_001.md` | Este audit |

---

## Safety Grep

**Comando:**
```
grep -niE "pessoa protegida|menor de idade|diagnóstico clínico como instrução|prognóstico clínico como instrução|significa sempre|prova que|deve agir|com certeza que|mandala como prática obrigatória|wish-fulfillment master|manifesto/latente como método"
  JUNG_DREAMS_PROMOTED_RISK_CARDS_001.md
  JUNG_DREAMS_RISK_CONSOLIDATION_MAP_001.md
```

**Resultado: 0 hits — CLEAN**

**Wording safety específico:**

| termo | status |
|---|---|
| "assimetria etária" | USADO CORRETAMENTE — 1 hit em RISK-JUNG-007 (Protocol links: PATCH-020) |
| "pessoa protegida" | NÃO INTRODUZIDO — CLEAN |
| "menor de idade" | NÃO INTRODUZIDO — CLEAN |
| "legal" como label de assimetria | NÃO INTRODUZIDO — CLEAN |
| diagnóstico / prognóstico | APARECEM APENAS EM CONTEXTOS DE PROIBIÇÃO (RISK-FINAL-002) — SAFE |

**Conclusão: PASS — nenhum termo proibido aparece como instrução positiva.**

---

## Staging Verification

| Item | Resultado |
|---|---|
| git add . usado: não | correto |
| git add -A usado: não | correto |
| arquivos staging: exatos 3 caminhos explícitos | pendente — ver abaixo |

**Arquivos a serem staged (3 exatos):**
```
.claude/workspaces/simb/library/risk_cards/JUNG_DREAMS_PROMOTED_RISK_CARDS_001.md
.claude/workspaces/simb/library/risk_cards/JUNG_DREAMS_RISK_CONSOLIDATION_MAP_001.md
.claude/workspaces/simb/library/JUNG_DREAMS_RISK_PROMOTION_AND_MERGE_AUDIT_001.md
```

**Arquivos NÃO staged (untracked, operator decision pendente):**
```
.claude/workspaces/simb/operator_context/OPERATOR_CONTEXT_PERSISTENCE_PATCH_AUDIT_001.md
.claude/workspaces/simb/operator_context/RETROACTIVE_DELTA_IMPORT_AUDIT_001.md
cesto/anthropic_academy_build_with_claude.txt
cesto/anthropic_academy_cursos_completo.txt
```

---

## Commit/Push Verification

| Item | Resultado |
|---|---|
| commit criado | pendente |
| commit message | feat(simb): promote Jung Dreams risk cards |
| push executado | pendente |

---

*Audit de TASK 24 — 2026-06-20.*
*24 risk cards individuais + 2 consolidados (RISK-FINAL-001, RISK-FINAL-002) promovidos. 5 holds. 1 consolidação deferida (RISK-FINAL-003).*
*Safety grep PASS. Wording safety PASS.*
