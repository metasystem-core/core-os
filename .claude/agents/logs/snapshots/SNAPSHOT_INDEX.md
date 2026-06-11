# SNAPSHOT_INDEX
## Índice de Snapshots de Evolução — CORE-OS

**Última atualização:** 2026-06-11 | **Mantido por:** CORE-STABILIZATION-003+

---

> **INVARIANTE:** Este índice aponta para snapshots derivados do log bruto.  
> Fonte autoritativa: `.claude/agents/logs/agent_evolution_log.md`  
> SNAPSHOT INDEX ≠ REGISTRY. SUMMARY ≠ SOURCE OF TRUTH.

---

## Snapshots Disponíveis

| Snapshot | Arquivo | Agentes/Série | Eventos Cobertos | Período | Milestone de Encerramento |
|---|---|---|---|---|---|
| EVOLUTION_SNAPSHOT_20260611 | [EVOLUTION_SNAPSHOT_20260611.md](EVOLUTION_SNAPSHOT_20260611.md) | legal-agent (8.0→9.0C) + CORE-STABILIZATION (001A→002) | EVT-043→EVT-070 (legal) + 4 etapas de estabilização | 2026-06-10→2026-06-11 | system_audit_result:ready_for_9_1_harness_design |

---

## Eventos Não Cobertos por Snapshots

Os seguintes eventos do `agent_evolution_log.md` **não têm snapshot** e devem ser lidos diretamente no log bruto:

| Intervalo | Agentes | Eventos | Notas |
|---|---|---|---|
| EVT-001 → EVT-030 | todos (criação inicial), simb, norm | 30 eventos (2026-06-09) | Criação da CORE-AGENTS layer, QA inicial |
| EVT-031 → EVT-042 | irata-agent, inspection-agent | 12 eventos (2026-06-10) | irata uso monitorado, inspection QA/review_validated |

---

## Protocolo de Atualização

Ao criar um novo snapshot:

1. Criar arquivo `snapshots/NOME_DESCRITIVO.md` seguindo o template em `LOG_COMPACTION_POLICY.md`
2. Adicionar linha na tabela "Snapshots Disponíveis" acima
3. Remover ou atualizar linha em "Eventos Não Cobertos" se os eventos forem cobertos
4. Nunca modificar snapshots existentes — criar novo se houver atualização
5. Commit explícito dos arquivos novos/modificados — nunca `git add -A` ou `git add .`

---

## Política

Política formal de compactação: [`LOG_COMPACTION_POLICY.md`](../LOG_COMPACTION_POLICY.md)
