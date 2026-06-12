# AGENT_MASTER_INDEX
## Índice Mestre de Agentes CORE-OS

**Versão:** 1.2 | **Data:** 2026-06-12 | **Gerado em:** CORE-STABILIZATION-002 | **Atualizado em:** CORE-EVOLUTION-001

---

## 1. Purpose

Este arquivo é um **índice de navegação e estado** — não é um router operacional.

Use-o para:
- Localizar rapidamente o AGENT.md de um agente
- Verificar o status atual de cada agente
- Entender a hierarquia de autoridade
- Identificar o que está ativo, o que está em revisão e o que está em draft

**Este arquivo não ativa, autoriza nem instrui nenhum agente.**

---

## 2. Source of Truth

| Fonte | Uso |
|---|---|
| `registry/agents_registry.yaml` | **Fonte primária** de status, active, operational_authority, last_event |
| `<tipo>/<agente>/AGENT.md` | **Fonte primária** de design: missão, não-missão, ciclo de vida, firewalls, QA |
| `logs/agent_evolution_log.md` | Trilha histórica de eventos — append-only |
| `logs/agent_qa_log.md` | Registros de QA por agente |
| `_common/` | Protocolos e padrões compartilhados (standard, evolution policy, epistemic safety) |
| **Este arquivo** | Índice derivado — consultar registry para estado atual |

> **Este índice pode estar desatualizado.** Antes de tomar qualquer decisão operacional, verificar o registry.

---

## 3. Agent Inventory

| Agente | Caminho | Tipo | Status | active | operational_authority | Maturidade | last_event | Notas |
|---|---|---|---|---|---|---|---|---|
| fw-governor | `government/fw-governor/` | government | active | (implícito) | governo | design | — | Árbitro constitucional. Autoridade nível 1. |
| meta-router | `government/meta-router/` | government | active | (implícito) | roteamento | design | — | Primeiro ponto de contato. Não processa — roteia. |
| cognitive-logistics | `government/cognitive-logistics/` | government | active | (implícito) | gestão | design | — | Carga cognitiva, contexto, continuidade. |
| context-mapper | `government/context-mapper/` | government | active | (implícito) | empacotamento | design | — | Context packs, handoffs, reinserção. |
| simb-agent | `domain/simb-agent/` | domain | **review_validated** | **true** ★ | governed_workspace_write | QA aprovada | EVT-CORE-COWORK-ACTIVATION-001 | **COWORK PILOT**. workspace: `workspaces/simb/`. runtime: workspace_write. profile.md bloqueado visitante. QA 14/14+3 PASS. |
| norm-agent | `domain/norm-agent/` | domain | **review_validated** | false | limited | QA aprovada | EVT-021 | SOURCE-FIRST. Norma privada não redistribuída. QA 10/10 PASS. Não ativado em ACTIVATION-001. |
| irata-agent | `domain/irata-agent/` | domain | **review_validated** | **true** ★ | governed_workspace_write | QA aprovada | EVT-CORE-COWORK-ACTIVATION-001 | **COWORK PILOT**. workspace: `workspaces/irata/`. runtime: workspace_write. Domínio de vida — IRATA SUPPORT ≠ FIELD RELEASE. |
| inspection-agent | `domain/inspection-agent/` | domain | **review_validated** | **true** ★ | governed_workspace_write | QA aprovada | EVT-CORE-COWORK-ACTIVATION-001 | **COWORK PILOT**. workspace: `workspaces/inspection/`. runtime: workspace_write. INSPECTION SUPPORT ≠ EQUIPMENT FITNESS CERTIFICATION. |
| asset-agent | `domain/asset-agent/` | domain | draft | **true** ★ | monitored_workspace_write_no_execution | zero QA | EVT-CORE-COWORK-ACTIVATION-001 | **COWORK PILOT** (draft). workspace: `workspaces/asset/`. trade_execution:false. Firewall lotofa absoluto. ASSET RECORDKEEPING ≠ FINANCIAL EXECUTION. |
| legal-agent | `domain/legal-agent/` | domain | draft | **true** ★ | governed_workspace_write_strict_firewall | design avançado | EVT-CORE-COWORK-ACTIVATION-001 | **COWORK PILOT** (draft). workspace: `workspaces/legal/`. 27 iterações de design. Firewall estrito — LEGAL ORGANIZATION ≠ LEGAL ADVICE. FATO NARRADO ≠ FATO PROVADO. |
| learn-agent | `domain/learn-agent/` | domain | draft | — | — | design | null | Equivalente ao HARVEST-CORE. Bloqueado visitante. |
| doc-agent | `auxiliary/doc-agent/` | auxiliary | draft | — | — | design | null | Entrega e dorme. Sem decisão de conteúdo. |
| intake-agent | `auxiliary/intake-agent/` | auxiliary | draft | — | — | design | null | Porta de entrada. Classifica, rota e dorme. |
| rag-agent | `auxiliary/rag-agent/` | auxiliary | draft | — | — | placeholder | null | RAG não implementado. Placeholder. |
| skill-auditor | `auxiliary/skill-auditor/` | auxiliary | draft | — | — | design | null | Bloqueado visitante. Propõe patches, não altera diretamente. |
| capability-gap | `auxiliary/capability-gap/` | auxiliary | draft | — | — | design | null | Detecta lacunas. Não resolve — aponta. |

**Total:** 16 agentes | 4 government active | 4 domain review_validated | 8 draft

★ = `active:true` — cowork workspace pilot ativado em CORE-COWORK-ACTIVATION-001 (2026-06-11). `active:true` ≠ autoridade irrestrita. Ver §5 e §6.

---

## 4. Status Taxonomy

| Status | Significado | Operacional? | Próximo estado válido |
|---|---|---|---|
| `draft` | Design de referência. Estrutura definida, sem QA formal. | ❌ | `review` |
| `review` | Em processo de revisão formal — QA em andamento. | ❌ | `review_validated` ou `draft` (regressão) |
| `review_validated` | Revisão documental e QA aprovadas. `active:false` mantido. **Não implica execução.** Pré-requisito para uso monitorado com supervisão humana. | ❌ | `active` (requer aprovação operador + trigger formal) |
| `active` | Design operacional — agentes de governo. Não requer `active:true` explícito para função de governo. | ⚠️ parcial | `standby` ou `deprecated` |
| `active_workspace_pilot` | `activation_status` sub-tag. `active:true` concedido para workspace escrito + ingestion governada. Não implica QA completa de domínio nem autoridade operacional plena. | ⚠️ dentro do workspace | `active` (requer QA de domínio + aprovação formal) |
| `standby` | Funcionalidade migrada ou em pausa intencional. | ❌ | `active` ou `deprecated` |
| `deprecated` | Descontinuado. Mantido apenas para referência histórica. | ❌ | `archived` |
| `archived` | Removido da operação ativa. Somente histórico. | ❌ | — |

---

## 5. Operational Warnings

```
active:false ≠ operacional
active:true ≠ autoridade irrestrita
review_validated ≠ operacional
draft ≠ inválido
status:active (governo) ≠ autoridade irrestrita
agent file exists ≠ agent can act
registry entry ≠ authorization
QA APROVADA ≠ AUTORIZAÇÃO DE EXECUÇÃO
DESIGN ≠ IMPLEMENTAÇÃO
BLUEPRINT ≠ SQL
PLANO ≠ EXECUÇÃO
ÍNDICE ≠ ROUTER
AGENT ACTIVATION ≠ SYSTEM STRUCTURE MUTATION
WORKSPACE WRITE ≠ SYSTEM WRITE
DOCUMENT INGESTION ≠ TRUSTED KNOWLEDGE
INTAKE ≠ VALIDATED CORPUS
QUARANTINE ≠ MEMORY
LEGAL ORGANIZATION ≠ LEGAL ADVICE
ASSET RECORDKEEPING ≠ FINANCIAL EXECUTION
IRATA SUPPORT ≠ FIELD RELEASE
INSPECTION SUPPORT ≠ EQUIPMENT FITNESS CERTIFICATION
SIMB WRITING ≠ THERAPY
OPERATOR OWNS SYSTEM
```

Para qualquer uso real:
1. Verificar `active` e `operational_authority` no registry
2. Verificar `status` — `review_validated` ≠ `active`
3. Confirmar trigger válido no AGENT.md
4. Confirmar supervisão humana onde exigida
5. Declarar `opa` se domínio requer modo primário

---

## 6. COWORK Activation State (CORE-COWORK-ACTIVATION-001)

Agentes com `active:true` e seus workspaces após CORE-COWORK-ACTIVATION-001 (2026-06-11):

| Agente | active | runtime_mode | workspace_path | document_ingestion | external_action | trade_exec |
|---|---|---|---|---|---|---|
| simb-agent | true | workspace_write | `.claude/workspaces/simb/` | governed_workspace_intake | false | — |
| irata-agent | true | workspace_write | `.claude/workspaces/irata/` | governed_workspace_intake | false | — |
| inspection-agent | true | workspace_write | `.claude/workspaces/inspection/` | governed_workspace_intake | false | — |
| legal-agent | true | workspace_write | `.claude/workspaces/legal/` | governed_workspace_intake | false | — |
| asset-agent | true | monitored_workspace_write | `.claude/workspaces/asset/` | governed_workspace_intake | false | false |

**O que `active:true` (workspace_pilot) permite:**
- Ser chamado pelo operador via Cowork
- Responder em domínio dentro do workspace
- Criar e editar arquivos dentro do próprio workspace
- Ingerir documentos fornecidos pelo operador (fluxo intake/ → quarantine/ → classificação → workspace)
- Atualizar USE_LOG.md e INTAKE_INDEX.md do próprio workspace

**O que `active:true` NÃO permite:**
- Alterar AGENT.md, skills, schemas, CLAUDE.md, registry
- Executar SQL ou acessar banco de dados
- Acessar APIs externas ou criar embeddings
- Executar git push
- Deletar ou mover arquivos fora do workspace
- Tomar decisões jurídicas, financeiras ou de campo pelo operador

---

## 7. Self-Evolution State (CORE-EVOLUTION-001)

Agentes com `self_evolution.enabled: true` após CORE-EVOLUTION-001 (2026-06-12):

| Agente | level | can_record | can_propose | can_create_candidate | can_apply_without_operator | autonomous_self_patch | evolution_path |
|---|---|---|---|---|---|---|---|
| simb-agent | 3_patch_candidates | true | true | true | false | **false** | `domain/simb-agent/evolution/` |
| irata-agent | 3_patch_candidates | true | true | true | false | **false** | `domain/irata-agent/evolution/` |
| inspection-agent | 3_patch_candidates | true | true | true | false | **false** | `domain/inspection-agent/evolution/` |
| legal-agent | 2_evolution_proposals | true | true | false | false | **false** | `domain/legal-agent/evolution/` |
| asset-agent | 2_evolution_proposals | true | true | false | false | **false** | `domain/asset-agent/evolution/` |

**Justificativa dos níveis:**
- `simb`, `irata`, `inspection` → level 3: aprendizado operacional frequente; patch candidates aceleram evolução real
- `legal`, `asset` → level 2: domínios jurídico/financeiro exigem cautela extra; patch candidate requer elevação explícita

**Level 5 (autonomous_self_patch):** `prohibited_until_explicit_future_governance` — nenhum agente ativo.

**Governança de evolução:**
```
SELF-EVOLUTION != UNRESTRICTED SELF-EDIT
LEARNING != MUTATION
PROPOSAL != PATCH APPLIED
PATCH CANDIDATE != LIVE AGENT CHANGE
OPERATOR APPROVAL REQUIRED FOR ALL PATCHES
```

**Protocolo:** `.claude/agents/_common/AGENT_SELF_EVOLUTION_PROTOCOL.md`  
**Índice:** `.claude/agents/evolution/EVOLUTION_INDEX.md`

---

## 8. Next Maintenance

Atualizar este índice quando:

| Evento | Ação |
|---|---|
| Novo agente criado | Adicionar linha na tabela §3 |
| `status` muda no registry | Atualizar coluna status na tabela §3 |
| `active` muda para true | Atualizar coluna active + nota de ativação |
| `operational_authority` muda | Atualizar coluna operational_authority |
| `last_event` avança (evento significativo) | Atualizar coluna last_event |
| Agente arquivado/dormant | Marcar status + remover da linha principal se arquivado |
| Status taxonomy muda | Atualizar §4 |
| `self_evolution_level` muda | Atualizar tabela §7 |
| Primeiro patch candidate criado | Atualizar nota em §7 + EVOLUTION_INDEX.md |
| Patch aplicado | Registrar em §7 + EVOLUTION_INDEX.md |

> Fonte primária é sempre o registry. Este índice é derivado e pode atrasar.
