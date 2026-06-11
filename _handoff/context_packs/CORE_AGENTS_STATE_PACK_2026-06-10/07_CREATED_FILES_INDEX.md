---
file: 07_CREATED_FILES_INDEX.md
purpose: Índice dos arquivos criados ou relevantes por domínio
pack: CORE_AGENTS_STATE_PACK_2026-06-10
generated: "2026-06-10"
---

# ÍNDICE DE ARQUIVOS — CORE-AGENTS
## Arquivos criados, relevantes e suas funções | 2026-06-10

> Este índice aponta caminhos — não reproduz conteúdo integral.
> Para leitura completa, acessar os arquivos no repositório.

---

## Raiz do Repositório

```
/c/Users/rafae/core-os
```

---

## Domínio IRATA — irata-agent

| Arquivo | Caminho | Tamanho | Função |
|---|---|---|---|
| AGENT.md | `.claude/agents/domain/irata-agent/AGENT.md` | 35KB | Design completo do agente. Identidade, missão, não-missão, firewalls, ciclo de vida, versionamento. |
| USE_MONITORED.md | `.claude/agents/domain/irata-agent/USE_MONITORED.md` | 13KB | Protocolo de uso monitorado: escopo, regras, limites de autoridade, LIBERÁVEL ≠ AUTORIZADO. |
| FIELD_SUPERVISOR_INTERFACE.md | `.claude/agents/domain/irata-agent/FIELD_SUPERVISOR_INTERFACE.md` | 9.4KB | Interface para o supervisor humano de campo. Entradas, saídas, checklist. |
| MONITORED_USE_SCENARIOS.md | `.claude/agents/domain/irata-agent/MONITORED_USE_SCENARIOS.md` | 16KB | Cenários A (permitido), B (proibido), C (template de registro UM-IRATA-NNN). |

---

## Domínio Inspeção Industrial — inspection-agent

| Arquivo | Caminho | Tamanho | Função |
|---|---|---|---|
| AGENT.md | `.claude/agents/domain/inspection-agent/AGENT.md` | 24KB | Design completo: 21 seções. Identidade, 5 firewalls, skills, versionamento, pacote monitorado. |
| INSPECTION_AGENT_DOCMAP.md | `.claude/agents/domain/inspection-agent/INSPECTION_AGENT_DOCMAP.md` | 22KB | Mapa documental de ~50 sub-arquivos de inspecao-end e doc-inspecao. Criado em Iteração 7.1. |
| INSPECTION_AGENT_NORM_PROFILE_DECISION.md | `.claude/agents/domain/inspection-agent/INSPECTION_AGENT_NORM_PROFILE_DECISION.md` | 7KB | Decisão do norm_profile canônico. Resultado: norm_profile.yaml (2026-05-11). Criado em 7.1b. |
| INSPECTION_AGENT_REDUNDANCY_DECISION.md | `.claude/agents/domain/inspection-agent/INSPECTION_AGENT_REDUNDANCY_DECISION.md` | 12KB | Decisão de redundância documental. Canônicos: damage_mechanism_new.md e ndt_selection_new.md. Criado em 7.1c. |
| INSPECTION_AGENT_BEHAVIORAL_QA.md | `.claude/agents/domain/inspection-agent/INSPECTION_AGENT_BEHAVIORAL_QA.md` | 34KB | QA comportamental completo: 10 cenários SC-INSP, PASS_WITH_NOTES, 3 notas. Iteração 7.2. |
| USE_MONITORED.md | `.claude/agents/domain/inspection-agent/USE_MONITORED.md` | 16KB | Protocolo de uso monitorado: 12 seções com hardening NOTA-QA-001/002/003. |
| FIELD_INSPECTOR_INTERFACE.md | `.claude/agents/domain/inspection-agent/FIELD_INSPECTOR_INTERFACE.md` | 9.9KB | Interface para o inspetor humano. 11 seções, checklist pós-output (7 itens). |
| MONITORED_USE_SCENARIOS.md | `.claude/agents/domain/inspection-agent/MONITORED_USE_SCENARIOS.md` | 19KB | 8 cenários A + 7 B + 1 template C. A-08 cobre interface IRATA/Inspeção. |
| INSPECTION_AGENT_MONITORED_USE_QA.md | `.claude/agents/domain/inspection-agent/INSPECTION_AGENT_MONITORED_USE_QA.md` | 21KB | QA do pacote monitorado: QA-20260610-011 PASS_WITH_NOTES. Iteração 7.4-QA. |

---

## Registry e Logs

| Arquivo | Caminho | Tamanho | Função |
|---|---|---|---|
| agents_registry.yaml | `.claude/agents/registry/agents_registry.yaml` | 18KB | Inventário oficial de todos os 16 agentes. Versão atual: 2.3-inspection-review-validated. |
| agent_evolution_log.md | `.claude/agents/logs/agent_evolution_log.md` | 164KB | Histórico completo de eventos EVT. Último evento: EVT-20260610-042. |
| agent_qa_log.md | `.claude/agents/logs/agent_qa_log.md` | 192KB | Histórico completo de QAs. Último QA: QA-20260610-011. |

---

## Documentos Soberanos do Sistema

| Arquivo | Caminho | Função |
|---|---|---|
| CORE_OS_MANIFEST.md | `.claude/CORE_OS_MANIFEST.md` | Documento soberano — arquitetura, princípios constitucionais, hierarquia de componentes. |
| WATCHDOG.md | `.claude/skills/_firmware/WATCHDOG.md` | Firmware de boot obrigatório — modo operador, firewalls ativos, princípios constitucionais. |
| CLAUDE.md | `CLAUDE.md` (raiz) | Instruções de sessão — lido automaticamente pelo Claude Code ao iniciar. |

---

## Skills Canônicas do inspection-agent

| Arquivo | Caminho | Papel |
|---|---|---|
| INSPECAO_CORE_CONSOLIDADO.md | `.claude/skills/inspecao-end/INSPECAO_CORE_CONSOLIDADO.md` | Core consolidado (~59.9KB) |
| norm_profile.yaml | `.claude/skills/inspecao-end/norm_profile.yaml` | Perfil normativo canônico (2026-05-11, 4.6KB) |
| damage_mechanism_new.md | `.claude/skills/inspecao-end/sub/damage_mechanism_new.md` | Canônico operacional — protocolo de hipótese de dano |
| damage-mechanisms.md | `.claude/skills/inspecao-end/sub/damage-mechanisms.md` | Complementar taxonômico |
| ndt_selection_new.md | `.claude/skills/inspecao-end/sub/ndt_selection_new.md` | Canônico operacional — protocolo de seleção END |
| ndt-selector.md | `.claude/skills/inspecao-end/sub/ndt-selector.md` | Complementar lookup |

---

## Schemas

| Arquivo | Caminho | Função |
|---|---|---|
| core_agent_schema.yaml | `.claude/agents/_schemas/core_agent_schema.yaml` | Schema de agente |
| agent_registry_schema.yaml | `.claude/agents/_schemas/agent_registry_schema.yaml` | Schema do registry |

---

## Protocolos Comuns

| Arquivo | Caminho | Função |
|---|---|---|
| _common/ | `.claude/agents/_common/` | Padrões compartilhados: standard, protocolos, policies |

---

*Este índice é síntese — não duplicação do repositório.*
*Para conteúdo completo, acessar os arquivos originais nos caminhos indicados.*
*Gerado em: 2026-06-10 | Pack: CORE_AGENTS_STATE_PACK_2026-06-10*
