# CORE_EVOLUTION_001
## Governed Agent Self-Evolution Protocol

**Data:** 2026-06-12  
**Operador:** Rafael Santos Pena (modo primário — `opa`)  
**Status:** COMPLETE

---

## 1. Purpose

Criar protocolo, pastas, políticas e matriz de permissão para autoevolução governada dos agentes do CORE-OS.

Objetivo: permitir que agentes aprendam com uso real, ingestão de conteúdo, logs, erros e correções, e possam propor alterações em si mesmos — sem nunca se auto-modificar sem aprovação formal do operador.

Esta etapa **não** libera autoescrita irrestrita.  
Esta etapa **não** ativa autonomous_self_patch.  
Esta etapa **não** executa nenhum patch de agente.

---

## 2. Source State

```yaml
current_head: e67e67281f3f976b70af3ca6b4b537ce69af0a12
branch: main
agents_selected: [simb-agent, irata-agent, inspection-agent, legal-agent, asset-agent]
registry_version_before: "2.31-legal-system-audit"
agent_master_index_version_before: "1.1"
common_files_existing:
  - AGENT_COMM_UNIT_PROPOSAL.md
  - AGENT_COOPERATION_PROTOCOL.md
  - AGENT_EVOLUTION_POLICY.md
  - COMMON_CAPABILITIES.md
  - CONTEXT_COMPRESSION_PROTOCOL.md
  - CORE_AGENT_STANDARD.md
  - CORE_BIRTH_POLICY_PROPOSAL.md
  - EPISTEMIC_SAFETY_LAYER.md
evolution_dir_before: not_found
autonomous_self_patch_before: false
```

---

## 3. Protocol Created

### Arquivos em `.claude/agents/_common/` (4 novos)

| # | Arquivo | Função |
|---|---|---|
| 1 | `AGENT_SELF_EVOLUTION_PROTOCOL.md` | Protocolo central de autoevolução governada |
| 2 | `AGENT_EVOLUTION_PATCH_TEMPLATE.md` | Template para criação de patch candidates |
| 3 | `AGENT_EVOLUTION_REVIEW_CHECKLIST.md` | Checklist de revisão de propostas |
| 4 | `AGENT_EVOLUTION_RISK_MATRIX.md` | Matriz de 10 riscos de evolução |

### Índice central (1 novo diretório + 1 arquivo)

| # | Arquivo | Função |
|---|---|---|
| 5 | `.claude/agents/evolution/EVOLUTION_INDEX.md` | Índice central de patches e propostas |

### Diretórios de evolução por agente (5 × 5 = 25 arquivos + 5 dirs)

| Agente | LEARNING_LOG | EVOLUTION_PROPOSALS | patch_candidates/ | applied/ | rejected/ |
|---|---|---|---|---|---|
| simb-agent | created | created | .gitkeep | .gitkeep | .gitkeep |
| irata-agent | created | created | .gitkeep | .gitkeep | .gitkeep |
| inspection-agent | created | created | .gitkeep | .gitkeep | .gitkeep |
| legal-agent | created | created | .gitkeep | .gitkeep | .gitkeep |
| asset-agent | created | created | .gitkeep | .gitkeep | .gitkeep |

### Auditoria (1 arquivo)

| # | Arquivo |
|---|---|
| 31 | `.claude/audits/CORE_EVOLUTION_001.md` |

**Total de novos arquivos criados: 31**  
**Arquivos modificados: 2 (registry, master index)**

---

## 4. Evolution Levels

| Level | Nome | record | propose | create_candidate | apply | status |
|---|---|---|---|---|---|---|
| 0 | no_self_edit | false | false | false | false | disponível |
| 1 | learning_notes | true | false | false | false | disponível |
| 2 | evolution_proposals | true | true | false | false | **ativo** (legal, asset) |
| 3 | patch_candidates | true | true | true | false | **ativo** (simb, irata, inspection) |
| 4 | supervised_self_patch | true | true | true | true (c/ aprovação) | não ativado |
| 5 | autonomous_self_patch | — | — | — | — | **PROIBIDO** |

---

## 5. Agent Configuration

| Agente | self_evolution_level | can_record | can_propose | can_create_candidate | can_apply | risk_rationale |
|---|---|---|---|---|---|---|
| simb-agent | 3_patch_candidates | true | true | true | false | Aprendizado simbólico frequente; domínio de campo subjetivo; sem execução financeira/jurídica/técnica |
| irata-agent | 3_patch_candidates | true | true | true | false | Domínio de vida; aprendizado de campo crítico; nenhuma proposta pode ampliar autoridade de liberação |
| inspection-agent | 3_patch_candidates | true | true | true | false | Domínio técnico industrial; aprendizado normativo frequente; INSPECTION SUPPORT ≠ CERTIFICATION |
| legal-agent | 2_evolution_proposals | true | true | false | false | Risco jurídico alto; status draft; QA formal pendente; LEGAL ORGANIZATION ≠ LEGAL ADVICE |
| asset-agent | 2_evolution_proposals | true | true | false | false | Risco financeiro crítico; status draft; zero QA formal; ASSET RECORDKEEPING ≠ FINANCIAL EXECUTION |

**Para todos:** `can_apply_without_operator: false` | `autonomous_self_patch: false`

---

## 6. Registry Patch

Arquivo: `.claude/agents/registry/agents_registry.yaml`

Campos adicionados por agente (bloco `self_evolution:`):

```yaml
# Level 3 agents (simb, irata, inspection):
self_evolution:
  enabled: true
  level: "3_patch_candidates"
  can_record_learning: true
  can_propose_change: true
  can_create_patch_candidate: true
  can_apply_patch_without_operator: false
  operator_approval_required: true
  autonomous_self_patch: false
  evolution_path: "domain/<agent>/evolution/"
  last_evolution_event: "CORE-EVOLUTION-001"

# Level 2 agents (legal, asset):
self_evolution:
  enabled: true
  level: "2_evolution_proposals"
  can_record_learning: true
  can_propose_change: true
  can_create_patch_candidate: false
  can_apply_patch_without_operator: false
  operator_approval_required: true
  autonomous_self_patch: false
  evolution_path: "domain/<agent>/evolution/"
  last_evolution_event: "CORE-EVOLUTION-001"
  upgrade_condition: "QA formal + aprovação operador"
```

**Nenhum AGENT.md foi modificado substantivamente.**

---

## 7. Master Index Patch

Arquivo: `.claude/agents/AGENT_MASTER_INDEX.md`

Alterações:
- Versão: 1.1 → 1.2
- `Atualizado em:` CORE-EVOLUTION-001
- Nova seção §7: Self-Evolution State (tabela de 5 agentes com níveis, permissões, evolution_path)
- Invariantes de evolução governada adicionados
- Seção anterior §7 Next Maintenance renumerada para §8
- Eventos de manutenção: adicionados 3 novos triggers (self_evolution_level, patch candidate, patch aplicado)

---

## 8. Validation

| # | Verificação | Resultado |
|---|---|---|
| V-01 | Protocolo AGENT_SELF_EVOLUTION_PROTOCOL.md criado | PASS |
| V-02 | Template AGENT_EVOLUTION_PATCH_TEMPLATE.md criado | PASS |
| V-03 | Checklist AGENT_EVOLUTION_REVIEW_CHECKLIST.md criado | PASS |
| V-04 | Risk matrix AGENT_EVOLUTION_RISK_MATRIX.md criado | PASS |
| V-05 | EVOLUTION_INDEX.md criado | PASS |
| V-06 | evolution/ dirs criados para 5 agentes | PASS |
| V-07 | LEARNING_LOG.md criado para 5 agentes | PASS |
| V-08 | EVOLUTION_PROPOSALS.md criado para 5 agentes | PASS |
| V-09 | patch_candidates/, applied/, rejected/ criados (5 × 3) | PASS |
| V-10 | Registry atualizado para 5 agentes (self_evolution block) | PASS |
| V-11 | Master index atualizado (v1.2, §7 self-evolution) | PASS |
| V-12 | Nenhum AGENT.md alterado substantivamente | PASS |
| V-13 | autonomous_self_patch: false em todos os agentes | PASS |
| V-14 | can_apply_without_operator: false em todos | PASS |
| V-15 | Nenhuma skill modificada | PASS |
| V-16 | CLAUDE.md não modificado | PASS |
| V-17 | Nenhum SQL executado | PASS |
| V-18 | Nenhum banco acessado | PASS |
| V-19 | Nenhum embedding criado | PASS |
| V-20 | Nenhum RAG criado | PASS |
| V-21 | Nenhum documento real ingerido | PASS |
| V-22 | git add -A não usado | PASS |
| V-23 | git add . não usado | PASS |
| V-24 | git push não executado | PASS |

**24/24 PASS**

---

## 9. Git Commit

- **Message:** `feat(core-os): add governed agent self-evolution protocol`
- **Staged explicitly:** 4 _common files + 1 evolution index + 25 agent evolution files + agents_registry.yaml + AGENT_MASTER_INDEX.md + CORE_EVOLUTION_001.md
- **Not staged:** AGENT.md files, skills, schemas, CLAUDE.md, raw books, corpus normativo

---

## 10. Result

```yaml
status: governed_self_evolution_protocol_committed
agents_configured_count: 5
autonomous_self_patch_allowed: false
commit_hash: (ver abaixo após commit)
next_recommended_steps:
  - SIMB-LIBRARY-002 — First Source Intake Pilot (Neumann + outros)
  - ou first evolution proposal from SIMB after library use
  - LEGAL-USE-001 — first legal case organization use
  - ASSET-USE-001 — first portfolio recordkeeping use
```

**CORE-EVOLUTION-001: COMPLETE.**
