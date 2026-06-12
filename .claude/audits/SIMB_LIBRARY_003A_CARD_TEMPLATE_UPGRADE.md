# SIMB_LIBRARY_003A — Card Template Upgrade
## Upgrade de Templates para Neumann Runtime Grammar

**Data:** 2026-06-12  
**Operador:** Rafael Santos Pena (modo primário — `opa`)  
**Status:** COMPLETE  
**Precedentes:** SIMB-LIBRARY-002C (a5f0c0b) | SIMB-NEUMANN-CORE-001 (86c1d24) | CORE-EVOLUTION-002 (a0d1bcf)

---

## 1. Objetivo

Atualizar os templates de concept_card e symbol_card da biblioteca simbólica do SIMB para suportar a gramática operacional da Iris derivada de Neumann, sem criar novos cards nem alterar cards existentes.

**Fonte das decisões de schema:** `IRIS_SCHEMA_EVOLUTION_PROPOSAL.md` (proposta) + `IRIS_NEUMANN_RUNTIME_PROTOCOL.md` (protocolo operacional).

---

## 2. Arquivos Criados

| Arquivo | Caminho | Função |
|---|---|---|
| `CARD_SCHEMA_NOTES.md` | `.claude/workspaces/simb/library/` | Documentação completa dos campos novos dos templates v2.0 |
| `SIMB_LIBRARY_003A_CARD_TEMPLATE_UPGRADE.md` | `.claude/audits/` | Este arquivo de auditoria |

**Total de novos arquivos: 2**

---

## 3. Arquivos Modificados

| Arquivo | Modificação | Versão |
|---|---|---|
| `CONCEPT_CARD_TEMPLATE.md` | Reescrito com 23 campos Neumann Runtime Grammar | v1.0 → v2.0 |
| `SYMBOL_CARD_TEMPLATE.md` | Reescrito com 23 campos Neumann Runtime Grammar | v1.0 → v2.0 |
| `README.md` | Adicionada seção "Templates de Card" + atualização no listing de diretório | — |
| `LIBRARY_INDEX.md` | Adicionada tabela de templates com versão e caminho | — |

**Total de arquivos modificados: 4**

---

## 4. Campos Adicionados ao Concept Card Template (v1.0 → v2.0)

### Campos novos (não existiam no v1.0):

| Campo | Tipo | Obrigatoriedade |
|---|---|---|
| `card_id` | string | obrigatório |
| `title` | string | obrigatório |
| `source` (consolidado) | string | obrigatório |
| `source_status` | enum | obrigatório |
| `archetypal_root` | string | obrigatório |
| `developmental_stage` | list enum | obrigatório |
| `function_mode` | list enum | obrigatório |
| `personal_archetypal_collective_level` | list enum | obrigatório |
| `core_definition` | texto | obrigatório |
| `operational_use` | texto | obrigatório |
| `structural_reading` | texto | obrigatório |
| `genetic_reading` | texto | obrigatório |
| `literalization_risk` | texto | obrigatório |
| `therapeutic_confusion_risk` | texto | obrigatório |
| `authority_risk` | texto | obrigatório |
| `when_not_to_interpret` | texto | obrigatório |
| `response_questions` | lista | obrigatório |
| `related_concepts` | lista | obrigatório |
| `related_symbols` | lista | obrigatório |
| `gaps_or_limits` | texto | obrigatório |
| `version` | string | obrigatório |
| `created_at` | date | obrigatório |
| `updated_at` | date | obrigatório |

**Total de campos no concept_card v2.0: 23**

### Campos preservados / renomeados do v1.0:

| v1.0 | v2.0 | Status |
|---|---|---|
| `concept_id` | `card_id` | renomeado |
| `source_id` / `source` | `source` | consolidado |
| `status` | `source_status` | renomeado |
| Concept Summary | `core_definition` | renomeado + expandido |
| Useful for SIMB Because | `operational_use` | renomeado + expandido |
| Risk Notes | disagregado em 3 campos | expandido |
| Related Symbols | `related_symbols` | mantido |
| Operator Questions | `response_questions` | renomeado |
| Prohibited Use | mantido | expandido |

---

## 5. Campos Adicionados ao Symbol Card Template (v1.0 → v2.0)

### Campos novos (não existiam no v1.0):

| Campo | Tipo | Obrigatoriedade |
|---|---|---|
| `card_id` | string | obrigatório |
| `title` | string | obrigatório |
| `source` (consolidado) | string | obrigatório |
| `source_status` | enum | obrigatório |
| `archetypal_root` | string | obrigatório |
| `morphology` | lista | obrigatório |
| `developmental_stage` | list enum | obrigatório |
| `possible_levels` | list enum | obrigatório |
| `function_mode` | list enum | obrigatório |
| `symbolic_motion` | string | obrigatório |
| `structural_reading` | texto | obrigatório |
| `genetic_reading` | texto | obrigatório |
| `tension_with` | lista | obrigatório |
| `literalization_risk` | texto | obrigatório |
| `therapeutic_confusion_risk` | texto | obrigatório |
| `when_not_to_interpret` | texto | obrigatório |
| `response_questions` | lista | obrigatório |
| `related_concepts` | lista | obrigatório |
| `related_symbols` | lista | obrigatório |
| `gaps_or_limits` | texto | obrigatório |
| `version` | string | obrigatório |
| `created_at` | date | obrigatório |
| `updated_at` | date | obrigatório |

**Total de campos no symbol_card v2.0: 23**

### Campos preservados / renomeados do v1.0:

| v1.0 | v2.0 | Status |
|---|---|---|
| `symbol_id` | `card_id` | renomeado |
| `source_refs` | `source` | renomeado + consolidado |
| `status` | `source_status` | renomeado |
| Symbolic Field | mantido | preservado |
| Not a Fixed Meaning | embutido no template | preservado |
| Possible Uses | `operational_use` | renomeado |
| Prohibited Uses | mantido | expandido |
| Questions for Operator | `response_questions` | renomeado |
| Related Concepts | `related_concepts` | mantido |

---

## 6. Confirmações de Escopo

| Verificação | Status |
|---|---|
| Nenhum card novo criado nesta etapa | CONFIRMADO |
| Cards existentes (CON-001 a CON-005, SYM-001 a SYM-003) não foram alterados | CONFIRMADO |
| AGENT.md (simb-agent) não foi modificado | CONFIRMADO |
| agents_registry.yaml não foi modificado | CONFIRMADO |
| schemas globais do sistema não foram alterados | CONFIRMADO |
| CLAUDE.md não foi modificado | CONFIRMADO |
| skills/ não foram modificadas | CONFIRMADO |
| raw_private/ não foi tocado | CONFIRMADO |
| extracted_private/ não foi tocado | CONFIRMADO |
| cesto/ não foi tocado | CONFIRMADO |
| sonhos/ não foi tocado | CONFIRMADO |
| leituras/ não foi tocado | CONFIRMADO |
| Nenhum PDF versionado | CONFIRMADO |
| git add -A não usado | CONFIRMADO |
| git add . não usado | CONFIRMADO |
| git push não executado | CONFIRMADO |

---

## 7. Relação com Proposta IRIS_SCHEMA_EVOLUTION_PROPOSAL.md

Esta tarefa implementa parcialmente a Proposta 1 (concept_cards) e Proposta 2 (symbol_cards) de `IRIS_SCHEMA_EVOLUTION_PROPOSAL.md`.

**O que foi implementado:**
- Todos os campos propostos para concept_cards e symbol_cards foram adicionados aos templates
- CARD_SCHEMA_NOTES.md documentando cada campo

**O que NÃO foi implementado nesta etapa (aguarda tarefa futura):**
- Proposta 3 — phase_cards (novo tipo de card, nova pasta) → SIMB-LIBRARY-003B sugerido
- Migração dos cards existentes para schema v2.0 → SIMB-LIBRARY-003C sugerido
- Criação dos novos cards CON-019..027, SYM-005..010 → SIMB-LIBRARY-003D sugerido

---

## 8. Git Status Antes do Commit

Arquivos relevantes no status:
```
M  .claude/workspaces/simb/library/CONCEPT_CARD_TEMPLATE.md
M  .claude/workspaces/simb/library/SYMBOL_CARD_TEMPLATE.md
?? .claude/workspaces/simb/library/CARD_SCHEMA_NOTES.md
M  .claude/workspaces/simb/library/README.md
M  .claude/workspaces/simb/library/LIBRARY_INDEX.md
?? .claude/audits/SIMB_LIBRARY_003A_CARD_TEMPLATE_UPGRADE.md
```

Arquivos NÃO staged (e que não devem ser staged):
- `.claude/workspaces/simb/leituras/` — conteúdo pessoal
- `.claude/workspaces/simb/sonhos/` — conteúdo pessoal
- `.claude/workspaces/simb/library/IRIS_SELF_ANALYSIS_001.md` — já na localização de biblioteca; copy em evolution/ já commitada em a5f0c0b
- Rudhyar files (SRC-002 a SRC-007, CON-006 a CON-008, AUT-002) — corpus de outro batch, não desta tarefa
- `cesto/*.pdf` — absolutamente proibido

---

## 9. Checklist Final

| # | Verificação | Resultado |
|---|---|---|
| V-01 | CONCEPT_CARD_TEMPLATE.md atualizado para v2.0 com 23 campos | PASS |
| V-02 | SYMBOL_CARD_TEMPLATE.md atualizado para v2.0 com 23 campos | PASS |
| V-03 | CARD_SCHEMA_NOTES.md criado com documentação de cada campo novo | PASS |
| V-04 | README.md atualizado com seção Templates e link para CARD_SCHEMA_NOTES | PASS |
| V-05 | LIBRARY_INDEX.md atualizado com tabela de templates | PASS |
| V-06 | Nenhum card novo criado | PASS |
| V-07 | Cards existentes CON-001..005, SYM-001..003 não alterados | PASS |
| V-08 | AGENT.md não modificado | PASS |
| V-09 | agents_registry.yaml não modificado | PASS |
| V-10 | Schemas globais não modificados | PASS |
| V-11 | Nenhum PDF versionado | PASS |
| V-12 | Nenhum conteúdo pessoal versionado | PASS |
| V-13 | raw_private intocado | PASS |
| V-14 | extracted_private intocado | PASS |
| V-15 | git add -A não usado | PASS |
| V-16 | git push não executado | PASS |

**16/16 PASS**

---

## 10. Result

```yaml
status: card_templates_upgraded_neumann_runtime_grammar
arquivos_criados: 2
arquivos_modificados: 4
campos_concept_card_v2: 23
campos_symbol_card_v2: 23
cards_novos_criados: 0
cards_existentes_alterados: 0
agent_md_tocado: false
registry_global_tocado: false
commit_message: "feat(simb): upgrade symbolic card templates"
```

**SIMB-LIBRARY-003A: COMPLETE.**
