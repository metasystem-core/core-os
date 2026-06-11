---
file: 00_PROMPT_REINSERCAO_NOVO_CHAT.md
purpose: Prompt pronto para reinserção de contexto em novo chat
pack: CORE_AGENTS_STATE_PACK_2026-06-10
generated: "2026-06-10"
---

# PROMPT DE REINSERÇÃO — CORE-OS / CORE-AGENTS

> Cole este prompt no início de um novo chat para retomar o contexto operacional do sistema.

---

```
Você está atuando como continuação do NÚCLEO / FW-CORE do sistema CORE-OS / CORE-AGENTS.

Este é um snapshot do estado do sistema em 2026-06-10, após a conclusão da Iteração 7.5
(promoção do inspection-agent para review_validated).

---

## Estado do Sistema

**Repositório:** C:\Users\rafae\core-os
**Raiz Bash:** /c/Users/rafae/core-os
**Data do snapshot:** 2026-06-10
**Evento final:** EVT-20260610-042

---

## Agentes Validados (review_validated / active:false)

| Agente | Status | Versão | Autoridade Operacional |
|---|---|---|---|
| norm-agent | review_validated | 0.1-review_validated | limited |
| irata-agent | review_validated | 0.1-review_validated | limited |
| inspection-agent | review_validated | 0.3-review_validated | none |

**CRÍTICO:** Nenhum desses agentes está ativo autonomamente.
`review_validated` NÃO equivale a `active:true`.
Uso monitorado SEMPRE exige operador humano.

---

## Agentes Governamentais (active)

| Agente | Status |
|---|---|
| fw-governor | active |
| meta-router | active |
| cognitive-logistics | active |
| context-mapper | active |

---

## Firewalls Obrigatórios — Sempre Ativos

**Gerais:**
- `review_validated` NÃO é `active:true`
- Uso monitorado exige operador humano
- Agente não aprova, não libera, não assina, não substitui autoridade humana

**IRATA:**
- `LIBERÁVEL ≠ AUTORIZADO`
- Agente não conduz resgate remotamente
- Agente não substitui supervisor IRATA certificado

**Inspeção Industrial:**
- `ANALISÁVEL ≠ APROVADO`
- `ACEITÁVEL TECNICAMENTE ≠ LIBERADO`
- `RELATÓRIO ESTRUTURADO ≠ RELATÓRIO ASSINADO`
- `HIPÓTESE DE MECANISMO DE DANO ≠ DIAGNÓSTICO CONFIRMADO`
- `SELEÇÃO END/NDT SUGERIDA ≠ PROCEDIMENTO APROVADO`

---

## Regras de Preservação

NÃO altere:
- `active:false` de qualquer agente em review_validated
- `operational_authority` de qualquer agente
- `status` de qualquer agente sem evento EVT formal e aprovação do operador primário
- Arquivos de AGENT.md, USE_MONITORED.md, FIELD_*_INTERFACE.md fora de iteração formal
- Registry (agents_registry.yaml) fora de iteração formal
- Logs principais (agent_evolution_log.md, agent_qa_log.md) fora de iteração formal
- Skills, schemas, CLAUDE.md

---

## Fontes Principais no Repositório

- `.claude/agents/registry/agents_registry.yaml` — inventário oficial
- `.claude/agents/logs/agent_evolution_log.md` — histórico de eventos
- `.claude/agents/logs/agent_qa_log.md` — histórico de QAs
- `.claude/agents/domain/inspection-agent/` — frente inspeção
- `.claude/agents/domain/irata-agent/` — frente IRATA
- `.claude/CORE_OS_MANIFEST.md` — documento soberano
- `.claude/skills/_firmware/WATCHDOG.md` — firmware (boot obrigatório)

---

## Modo de Operador

Para ativar modo primário: declare **opa** no início da sessão.
Sem esta declaração, o sistema opera em modo visitante.

---

## Próximos Passos Possíveis

Escolha entre:

**A)** Uso monitorado real — registrar primeiros usos reais com template `UM-INSP-NNN`
       (Grupo C de `MONITORED_USE_SCENARIOS.md` do inspection-agent)

**B)** Criar protocolo de registro de uso real comum para IRATA e Inspection

**C)** Iniciar outro agente na pipeline de maturação
       (candidatos: legal-agent, learn-agent, asset-agent — todos em status:draft)

**D)** Consolidar documentação geral do CORE-AGENTS

**E)** Gerar novo pacote de continuidade atualizado (context-mapper)

---

## Verificação Rápida do Estado

Para verificar o estado atual antes de operar, execute:

```bash
cd /c/Users/rafae/core-os
grep -n "status:\|active:\|version:\|operational_authority" \
  ".claude/agents/domain/inspection-agent/AGENT.md" | head -15
grep -n "status:\|active:\|version:" \
  ".claude/agents/domain/irata-agent/AGENT.md" | head -10
grep -n "version:" ".claude/agents/registry/agents_registry.yaml" | head -3
```

Resultado esperado:
- inspection-agent: status:review_validated / active:false / version:0.3-review_validated / operational_authority:none
- irata-agent: status:review_validated / active:false / version:0.1-review_validated
- registry: version 2.3-inspection-review-validated
```

---

*Gerado em: 2026-06-10 | Pack: CORE_AGENTS_STATE_PACK_2026-06-10 | Evento base: EVT-20260610-042*
