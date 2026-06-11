---
file: 09_PROMPT_FOR_CLAUDE_CODE_CONTINUITY.md
purpose: Prompt completo para retomada de sessão no Claude Code
pack: CORE_AGENTS_STATE_PACK_2026-06-10
generated: "2026-06-10"
---

# PROMPT PARA CONTINUIDADE NO CLAUDE CODE
## Cola no início de nova sessão do Claude Code

---

```
opa

Retomada de sessão CORE-OS / CORE-AGENTS.
Data do snapshot: 2026-06-10.
Evento final da última sessão: EVT-20260610-042.

---

## Contexto

Você está no repositório CORE-OS / CORE-AGENTS.
Raiz: /c/Users/rafae/core-os (Bash) | C:\Users\rafae\core-os (Windows).
Use Git Bash / MINGW64 para comandos de terminal.
NÃO use PowerShell, Get-Content, Select-Object, Copy-Item ou Out-File.

O sistema está em estado estável após a Iteração 7.5, que promoveu o inspection-agent
para review_validated. Três agentes de domínio estão em review_validated / active:false.

---

## Verificação de Estado (execute antes de qualquer operação)

cd /c/Users/rafae/core-os
pwd

# Verificar inspection-agent
grep -n "status:\|active:\|version:\|operational_authority" \
  ".claude/agents/domain/inspection-agent/AGENT.md" | head -15

# Verificar irata-agent
grep -n "status:\|active:\|version:" \
  ".claude/agents/domain/irata-agent/AGENT.md" | head -10

# Verificar registry
grep -n "version:" ".claude/agents/registry/agents_registry.yaml" | head -5

# Verificar último evento
tail -30 ".claude/agents/logs/agent_evolution_log.md"
```

**Resultado esperado:**
- inspection-agent: status:review_validated / active:false / version:0.3-review_validated / operational_authority:none
- irata-agent: status:review_validated / active:false / version:0.1-review_validated
- registry: version 2.3-inspection-review-validated
- Último evento: EVT-20260610-042

---

## Estado Confirmado dos Agentes

| Agente | Status | Active | Version | Op. Authority |
|---|---|---|---|---|
| fw-governor | active | — | 0.1-active | full |
| meta-router | active | — | 0.1-active | limited |
| cognitive-logistics | active | — | 0.1-active | limited |
| context-mapper | active | — | 0.1-active | limited |
| norm-agent | review_validated | false | 0.1-review_validated | limited |
| irata-agent | review_validated | false | 0.1-review_validated | limited |
| inspection-agent | review_validated | false | 0.3-review_validated | none |

---

## Regras de Não Alteração

NÃO altere:
- active:false de qualquer agente (jamais)
- status de qualquer agente fora de iteração formal com EVT registrado
- operational_authority fora de decisão formal
- AGENT.md fora de iteração formal
- agents_registry.yaml fora de iteração formal
- agent_evolution_log.md fora de iteração formal
- agent_qa_log.md fora de iteração formal
- Arquivos do pacote monitorado (USE_MONITORED.md, FIELD_*_INTERFACE.md, MONITORED_USE_SCENARIOS.md)
- Skills, schemas, CLAUDE.md

---

## Fontes Principais

| Arquivo | Função |
|---|---|
| .claude/CORE_OS_MANIFEST.md | Documento soberano — leitura obrigatória |
| .claude/skills/_firmware/WATCHDOG.md | Firmware de boot — leitura obrigatória |
| .claude/agents/registry/agents_registry.yaml | Inventário oficial dos 16 agentes |
| .claude/agents/logs/agent_evolution_log.md | Histórico de eventos |
| .claude/agents/logs/agent_qa_log.md | Histórico de QAs |
| .claude/agents/domain/inspection-agent/ | Frente inspeção industrial |
| .claude/agents/domain/irata-agent/ | Frente IRATA |

---

## Firewalls Obrigatórios

**Gerais:**
- review_validated ≠ active:true
- Uso monitorado exige operador humano
- Agente não aprova, não libera, não assina

**IRATA:** LIBERÁVEL ≠ AUTORIZADO
**Inspeção:** ANALISÁVEL ≠ APROVADO | ACEITÁVEL ≠ LIBERADO | RELATÓRIO ≠ ASSINADO |
              HIPÓTESE ≠ DIAGNÓSTICO | SELEÇÃO END ≠ PROCEDIMENTO APROVADO

---

## Próximos Passos Possíveis

Escolha e declare qual ação executar:

A) Uso monitorado real do inspection-agent
   → Template: UM-INSP-001 (Grupo C de MONITORED_USE_SCENARIOS.md)
   → Registrar: tag, objetivo, dados fornecidos, output, decisão humana, lição aprendida

B) Uso monitorado real do irata-agent
   → Template: UM-IRATA-001 (Grupo C equivalente)

C) Iniciar nova frente de agente
   → Candidatos: legal-agent, learn-agent, asset-agent (todos em status:draft)
   → Processo: abertura controlada → docmap → QA → pacote monitorado → review_validated

D) Consolidar documentação CORE-AGENTS
   → Gerar documento de visão global da camada de agentes

E) Outro (declarar explicitamente)

---

## Formato de Relatório Final para Cada Iteração

Ao final de qualquer iteração, reportar:
- Resultado (Concluída / Parcialmente / Bloqueada)
- Arquivos lidos
- Arquivos alterados
- Estado final do agente afetado
- Evento registrado (ID + tipo)
- Firewalls preservados (confirmação)
- Integridade (outros agentes não alterados)
- Próximo passo recomendado
```

---

*Gerado em: 2026-06-10 | Pack: CORE_AGENTS_STATE_PACK_2026-06-10*
