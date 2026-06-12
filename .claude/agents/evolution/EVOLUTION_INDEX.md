# EVOLUTION_INDEX
## Índice Central de Evolução de Agentes — CORE-AGENTS

**Criado em:** CORE-EVOLUTION-001 (2026-06-12)  
**Atualizado em:** — (aguardando primeiro patch candidate)

---

> Append-only. Toda proposta e patch candidate deve ter uma linha neste índice.  
> Fonte primária de detalhes: arquivos em `domain/<agent>/evolution/`.

---

## Patch Candidates e Propostas

| patch_id | agent | date | type | status | risk_level | source_event | file | decision |
|---|---|---|---|---|---|---|---|---|
| — | — | — | — | — | — | — | — | awaiting_first_proposal |

---

## Applied Patches

| patch_id | agent | applied_date | commit_hash | effect | notes |
|---|---|---|---|---|---|
| — | — | — | — | — | awaiting_first_applied |

---

## Rejected Proposals

| patch_id | agent | rejection_date | reason | alternative | notes |
|---|---|---|---|---|---|
| — | — | — | — | — | awaiting_first_rejected |

---

## Agents Configured for Self-Evolution

| agent | self_evolution_level | can_record | can_propose | can_create_candidate | can_apply | evolution_path |
|---|---|---|---|---|---|---|
| simb-agent | 3_patch_candidates | true | true | true | false | `domain/simb-agent/evolution/` |
| irata-agent | 3_patch_candidates | true | true | true | false | `domain/irata-agent/evolution/` |
| inspection-agent | 3_patch_candidates | true | true | true | false | `domain/inspection-agent/evolution/` |
| legal-agent | 2_evolution_proposals | true | true | false | false | `domain/legal-agent/evolution/` |
| asset-agent | 2_evolution_proposals | true | true | false | false | `domain/asset-agent/evolution/` |

---

## Level 5 Status

```
autonomous_self_patch: prohibited_until_explicit_future_governance
```

Nenhum agente pode atingir level 5 sem decisão formal do operador.

---

## Format Reference

| Tipo | Formato de ID |
|---|---|
| Learning Log | `LEARN-<agent>-YYYYMMDD-NNN` |
| Evolution Proposal | `PROP-<agent>-YYYYMMDD-NNN` |
| Patch Candidate | `PATCH-<agent>-YYYYMMDD-NNN` |

---

*Fonte primária: arquivos em `domain/<agent>/evolution/`*  
*Este índice é derivado — sempre verificar os arquivos originais para detalhes completos.*
