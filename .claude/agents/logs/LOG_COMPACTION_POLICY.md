# LOG_COMPACTION_POLICY
## Política de Compactação de Logs — CORE-OS

**Versão:** 1.0 | **Data:** 2026-06-11 | **Criado em:** CORE-STABILIZATION-003

---

## 1. Propósito

Este documento define quando, como e por quem logs do sistema CORE-OS podem ser compactados (snapshot + índice), sem jamais apagar ou modificar o log bruto original.

**LOG SNAPSHOT ≠ LOG DELETION**  
**COMPACTION POLICY ≠ HISTORY LOSS**  
**SUMMARY ≠ SOURCE OF TRUTH**  
**RAW LOG PRESERVED**

---

## 2. Logs Cobertos por Esta Política

| Log | Caminho | Tipo | Política |
|---|---|---|---|
| `agent_evolution_log.md` | `logs/agent_evolution_log.md` | append-only, eventos de agente | **coberto** |
| `agent_qa_log.md` | `logs/agent_qa_log.md` | append-only, QA por agente | **coberto** |
| Logs de sessão | `.claude/logs/session_inputs.log` | sessão, sensível | **NÃO versionado — excluído desta política** |

---

## 3. Definições

```yaml
snapshot:
  definição: >
    Documento legível que resume uma série de eventos do log bruto,
    agrupados por período, agente ou milestone. Serve como ponto de
    orientação rápida sem substituir o log bruto.
  invariante: "snapshot é derivado. log bruto é autoritativo."

compaction:
  definição: >
    Criação de snapshot(s) cobrindo eventos antigos, com o objetivo de
    reduzir a necessidade de ler o log inteiro para entender o estado atual.
    NÃO envolve apagamento, truncamento, movimentação ou modificação do log bruto.
  invariante: "log bruto permanece intacto após qualquer compaction."

snapshot_index:
  definição: >
    Índice de todos os snapshots existentes, com referências aos eventos
    cobertos por cada um. Não é o registry de agentes — é navegação de histórico.
```

---

## 4. Gatilhos de Compactação

Compactação é elegível quando **qualquer** dos seguintes critérios for atendido:

| Critério | Threshold | Medida |
|---|---|---|
| Tamanho do `agent_evolution_log.md` | > 200KB | `ls -la` no arquivo |
| Eventos acumulados sem snapshot | > 30 eventos sequenciais de um único agente | contagem manual ou `grep event_id` |
| Série de iterações de design concluída | Ciclo de agente encerrado com system_audit | ex.: 8.0 → 9.0C (legal-agent) |
| Sessão de QA pesada concluída | > 10 cenários QA documentados em série | ex.: QA 8.3→8.4E (legal-agent) |

**Compactação não é obrigatória.** É elegível quando os gatilhos forem atingidos e houver aprovação do operador primário.

---

## 5. O Que Pode Ser Compactado

| Elegível para snapshot | NÃO elegível |
|---|---|
| Série de eventos de design de um agente (ex.: iterações 8.x) | Eventos sem série clara |
| Ciclo de QA completo (design → execução → patch → recheck) | Eventos isolados |
| Conjunto de estabilizações (001A → 002) | Último evento de cada agente (preservar visibilidade) |
| Eventos com > 60 dias sem referência ativa | Qualquer evento posterior a uma auditoria ativa |

---

## 6. Protocolo de Compactação

**Passo 1 — Aprovação**  
Operador primário aprova a compactação. Declaração mínima: "aprovar compactação de [série]".

**Passo 2 — Leitura do log bruto**  
Ler o log bruto completo para a série a ser compactada. Identificar eventos start/end.

**Passo 3 — Criar snapshot**  
Criar arquivo em `logs/snapshots/NOME_DESCRITIVO.md`. Seguir o template de snapshot (§8).

**Passo 4 — Atualizar SNAPSHOT_INDEX.md**  
Adicionar entrada ao índice com: nome, eventos cobertos, data, agente, milestone.

**Passo 5 — Commit**  
Staging explícito apenas dos arquivos criados. Nunca incluir o log bruto no staging de compactação.

**Passo 6 — Verificar log bruto**  
Confirmar que `agent_evolution_log.md` não foi modificado: `git diff .claude/agents/logs/agent_evolution_log.md` deve retornar vazio.

---

## 7. Proibições Absolutas

```
PROIBIDO: apagar agent_evolution_log.md
PROIBIDO: truncar agent_evolution_log.md
PROIBIDO: mover agent_evolution_log.md
PROIBIDO: reescrever agent_evolution_log.md
PROIBIDO: editar qualquer evento passado no log
PROIBIDO: criar snapshot sem apontar eventos cobertos no SNAPSHOT_INDEX
PROIBIDO: usar snapshot como substituto do log em decisão operacional
PROIBIDO: compactar sem aprovação do operador primário
```

---

## 8. Template de Snapshot

```markdown
# SNAPSHOT_[SERIE]
## [Agente/Série] — [Data inicial] → [Data final]

**Eventos cobertos:** EVT-XXXXXX-NNN → EVT-XXXXXX-MMM (N eventos)
**Agente(s):** [nome(s)]
**Período:** YYYY-MM-DD → YYYY-MM-DD
**Milestone de encerramento:** [ex.: system_audit_result:ready_for_9_1_harness_design]

---

## Estado inicial da série

[descrever estado ao início — versão, status, active, operational_authority]

## Eventos por fase

| Evento | Tipo | Iteração | Resultado |
|---|---|---|---|
| EVT-... | event_type | X.Y | summary |

## Artefatos criados na série

[lista de arquivos criados]

## Estado final da série

[descrever estado ao final — versão, status, active, operational_authority, invariantes]

## Invariantes preservados na série

[lista de invariantes que se mantiveram durante toda a série]

## Referência ao log bruto

> Todo o detalhe de cada evento está no log bruto:
> `.claude/agents/logs/agent_evolution_log.md`
> Este snapshot é derivado e não substitui o log.
```

---

## 9. Responsabilidade

| Papel | Responsabilidade |
|---|---|
| Operador primário | Aprovação de compactação; verificação de log bruto preservado |
| Claude Code | Criação de snapshots; staging explícito; nunca editar log bruto |
| fw-governor | Árbitro em caso de conflito sobre o que compactar |

---

## 10. Revisão desta Política

Esta política deve ser revisada quando:
- O `agent_evolution_log.md` superar 1MB
- Novo tipo de log for criado no sistema
- O processo de compactação revelar lacunas não cobertas

---

## 11. Histórico

| Versão | Data | Evento |
|---|---|---|
| 1.0 | 2026-06-11 | Criação inicial em CORE-STABILIZATION-003 |
