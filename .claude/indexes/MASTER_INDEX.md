# MASTER_INDEX
## Índice Mestre de Artefatos CORE-OS

**Versão:** 1.0  
**Criado em:** CORE-EVOLUTION-002 (2026-06-12)  
**Mantido por:** operador-primario (via Claude Code)  
**Fonte:** derivado dos índices locais de cada subsistema

---

## Propósito

Este índice é o ponto de entrada único para navegar todos os artefatos do CORE-OS — agents, skills, workspaces, audits, evolução.

É um **índice de navegação**, não uma fonte de autoridade. Para estado atual de qualquer componente, consultar as fontes primárias listadas em cada seção.

---

## 1. Agentes

| Fonte primária | Propósito |
|---|---|
| `.claude/agents/registry/agents_registry.yaml` | Estado oficial de todos os 16 agentes |
| `.claude/agents/AGENT_MASTER_INDEX.md` | Índice navegável, status, COWORK, evolução |
| `.claude/agents/_common/` | Protocolos e padrões compartilhados |
| `.claude/agents/_schemas/` | Schemas de agente, registry, memória, log |
| `.claude/agents/government/` | 4 agentes de governo |
| `.claude/agents/domain/` | 7 agentes de domínio |
| `.claude/agents/auxiliary/` | 5 agentes auxiliares |
| `.claude/agents/logs/` | agent_evolution_log.md, agent_qa_log.md |
| `.claude/agents/evolution/EVOLUTION_INDEX.md` | Índice central de patches e propostas |

---

## 2. Skills

| Fonte primária | Propósito |
|---|---|
| `.claude/skills/` | Todas as skills disponíveis |
| `.claude/skills/_firmware/WATCHDOG.md` | Boot obrigatório — firmware de sessão |
| `CLAUDE.md` | Tabela de skills com caminhos |

Skills disponíveis: asset-core, simb-core, fw-core, juridico, lotofa, irata-n3, inspecao-end, doc-inspecao, cesto, core-intake, cognitive-logistics, fw-kant, skill-router, core-self-audit, context-mapper, skill-auditor, capability-gap-router

---

## 3. Workspaces ativos

| Workspace | Agente | Caminho |
|---|---|---|
| simb | simb-agent | `.claude/workspaces/simb/` |
| irata | irata-agent | `.claude/workspaces/irata/` |
| inspection | inspection-agent | `.claude/workspaces/inspection/` |
| legal | legal-agent | `.claude/workspaces/legal/` |
| asset | asset-agent | `.claude/workspaces/asset/` |

---

## 4. Biblioteca Simbólica (SIMB-CORE)

| Fonte | Propósito |
|---|---|
| `.claude/workspaces/simb/library/README.md` | Visão geral da biblioteca |
| `.claude/workspaces/simb/library/LIBRARY_INDEX.md` | Índice de fontes, conceitos, símbolos |
| `.claude/workspaces/simb/library/INTAKE_LOG.md` | Log de intake — append-only |
| `.claude/workspaces/simb/library/registries/` | 8 registries locais |
| `.claude/workspaces/simb/library/concept_cards/` | Cards de conceito |
| `.claude/workspaces/simb/library/symbol_cards/` | Cards de símbolo |
| `.claude/workspaces/simb/library/author_maps/` | Mapas de autor |
| `.claude/workspaces/simb/library/raw_private/` | PDFs brutos (gitignored) |
| `.claude/workspaces/simb/library/extracted_private/` | Extrações longas (gitignored) |

**Políticas:**
- `.claude/workspaces/simb/library/LIBRARY_POLICY.md`
- `.claude/workspaces/simb/library/BOOK_INTAKE_POLICY.md`
- `.claude/workspaces/simb/library/COPYRIGHT_AND_PRIVACY_POLICY.md`

---

## 5. Evolução de Agentes

| Fonte | Propósito |
|---|---|
| `.claude/agents/_common/AGENT_SELF_EVOLUTION_PROTOCOL.md` | Protocolo central de autoevolução |
| `.claude/agents/_common/AGENT_EVOLUTION_PATCH_TEMPLATE.md` | Template de patch candidate |
| `.claude/agents/_common/AGENT_EVOLUTION_REVIEW_CHECKLIST.md` | Checklist de revisão |
| `.claude/agents/_common/AGENT_EVOLUTION_RISK_MATRIX.md` | Matriz de 10 riscos |
| `.claude/agents/evolution/EVOLUTION_INDEX.md` | Índice central de patches e propostas |

**Por agente:**

| Agente | Level | Pasta de evolução |
|---|---|---|
| simb-agent | 4_supervised_self_patch | `.claude/agents/domain/simb-agent/evolution/` |
| irata-agent | 3_patch_candidates | `.claude/agents/domain/irata-agent/evolution/` |
| inspection-agent | 3_patch_candidates | `.claude/agents/domain/inspection-agent/evolution/` |
| legal-agent | 2_evolution_proposals | `.claude/agents/domain/legal-agent/evolution/` |
| asset-agent | 2_evolution_proposals | `.claude/agents/domain/asset-agent/evolution/` |

**Protocolos específicos do simb-agent (level 4):**
- `RUNTIME_HYDRATION_PROTOCOL.md` — reidratação de sessão
- `SELF_REWRITE_POLICY.md` — política de auto-reescrita supervisionada
- `OPERATOR_APPROVAL_GATE.md` — formato de solicitação ao operador
- `PATCH_APPLICATION_PROTOCOL.md` — protocolo de aplicação de patch
- `SESSION_BOOT_CHECKLIST.md` — checklist de boot de sessão
- `SELF_EVOLUTION_LOG.md` — log de evolução supervisionada

---

## 6. Auditorias e Eventos

| Arquivo | Evento | Data |
|---|---|---|
| `.claude/audits/CORE_EVOLUTION_001.md` | Protocolo de autoevolução governada | 2026-06-12 |
| `.claude/audits/CORE_EVOLUTION_002.md` | SIMB supervised self-rewriting + runtime hydration | 2026-06-12 |

**Log de eventos:** `.claude/agents/logs/agent_evolution_log.md`

---

## 7. Documento Soberano e Firmware

| Arquivo | Função |
|---|---|
| `.claude/CORE_OS_MANIFEST.md` | Documento soberano — leitura obrigatória antes de execução |
| `.claude/skills/_firmware/WATCHDOG.md` | Boot obrigatório — camada 0 do sistema |
| `CLAUDE.md` | Instruções de sessão — lida automaticamente pelo Claude Code |

---

## 8. Invariantes

```
ESTE ÍNDICE É DERIVADO — fonte primária é sempre o registry e os AGENT.md
ÍNDICE ≠ ROUTER
ÍNDICE ≠ AUTORIZAÇÃO
ESTADO REAL = REGISTRY + AGENT.md
OPERATOR OWNS SYSTEM
```

---

## Histórico de versões

| Versão | Data | Evento |
|---|---|---|
| 1.0 | 2026-06-12 | Criado em CORE-EVOLUTION-002 |
