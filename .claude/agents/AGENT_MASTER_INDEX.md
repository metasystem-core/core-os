# AGENT_MASTER_INDEX
## Índice Mestre de Agentes CORE-OS

**Versão:** 1.0 | **Data:** 2026-06-11 | **Gerado em:** CORE-STABILIZATION-002

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
| simb-agent | `domain/simb-agent/` | domain | **review_validated** | false | limited | QA aprovada | EVT-20260609 | Modo primário. profile.md bloqueado visitante. QA 14/14+3 PASS. |
| norm-agent | `domain/norm-agent/` | domain | **review_validated** | false | limited | QA aprovada | EVT-021 | SOURCE-FIRST. Norma privada não redistribuída. QA 10/10 PASS. |
| irata-agent | `domain/irata-agent/` | domain | **review_validated** | false | limited | QA aprovada | EVT-20260610-032 | Domínio de vida. Uso monitorado criado. QA documental + comportamental PASS_WITH_NOTES. |
| inspection-agent | `domain/inspection-agent/` | domain | **review_validated** | false | none | QA aprovada | EVT-20260610-042 | Campo primeiro, laudo depois. Uso monitorado criado. QA PASS_WITH_NOTES. |
| asset-agent | `domain/asset-agent/` | domain | draft | false | — | zero QA | null | Risco crítico. Zero validação. Firewall lotofa absoluto. |
| legal-agent | `domain/legal-agent/` | domain | draft | false | none | design avançado | EVT-20260610-070 | 27 iterações de design. Sistema auditado 9.0C. Harness pendente. FATO NARRADO ≠ FATO PROVADO. |
| learn-agent | `domain/learn-agent/` | domain | draft | — | — | design | null | Equivalente ao HARVEST-CORE. Bloqueado visitante. |
| doc-agent | `auxiliary/doc-agent/` | auxiliary | draft | — | — | design | null | Entrega e dorme. Sem decisão de conteúdo. |
| intake-agent | `auxiliary/intake-agent/` | auxiliary | draft | — | — | design | null | Porta de entrada. Classifica, rota e dorme. |
| rag-agent | `auxiliary/rag-agent/` | auxiliary | draft | — | — | placeholder | null | RAG não implementado. Placeholder. |
| skill-auditor | `auxiliary/skill-auditor/` | auxiliary | draft | — | — | design | null | Bloqueado visitante. Propõe patches, não altera diretamente. |
| capability-gap | `auxiliary/capability-gap/` | auxiliary | draft | — | — | design | null | Detecta lacunas. Não resolve — aponta. |

**Total:** 16 agentes | 4 government active | 4 domain review_validated | 8 draft

---

## 4. Status Taxonomy

| Status | Significado | Operacional? | Próximo estado válido |
|---|---|---|---|
| `draft` | Design de referência. Estrutura definida, sem QA formal. | ❌ | `review` |
| `review` | Em processo de revisão formal — QA em andamento. | ❌ | `review_validated` ou `draft` (regressão) |
| `review_validated` | Revisão documental e QA aprovadas. `active:false` mantido. **Não implica execução.** Pré-requisito para uso monitorado com supervisão humana. | ❌ | `active` (requer aprovação operador + trigger formal) |
| `active` | Design operacional — agentes de governo. Não requer `active:true` explícito para função de governo. | ⚠️ parcial | `standby` ou `deprecated` |
| `standby` | Funcionalidade migrada ou em pausa intencional. | ❌ | `active` ou `deprecated` |
| `deprecated` | Descontinuado. Mantido apenas para referência histórica. | ❌ | `archived` |
| `archived` | Removido da operação ativa. Somente histórico. | ❌ | — |

---

## 5. Operational Warnings

```
active:false ≠ operacional
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
```

Para qualquer uso real:
1. Verificar `active` e `operational_authority` no registry
2. Verificar `status` — `review_validated` ≠ `active`
3. Confirmar trigger válido no AGENT.md
4. Confirmar supervisão humana onde exigida
5. Declarar `opa` se domínio requer modo primário

---

## 6. Next Maintenance

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

> Fonte primária é sempre o registry. Este índice é derivado e pode atrasar.
