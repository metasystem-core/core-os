---
file: 08_BACKLOG_AND_NEXT_STEPS.md
purpose: Backlog real e caminhos futuros do CORE-AGENTS
pack: CORE_AGENTS_STATE_PACK_2026-06-10
generated: "2026-06-10"
---

# BACKLOG E PRÓXIMOS PASSOS — CORE-AGENTS
## Estado em 2026-06-10 | Pós-Iteração 7.5

---

## Ações Imediatas Possíveis

### A) Uso Monitorado Real — inspection-agent
**O quê:** Registrar primeiros usos reais do agente em situações reais de inspeção.
**Como:** Usar o template `UM-INSP-NNN` do Grupo C de `MONITORED_USE_SCENARIOS.md`.
**Arquivo:** `.claude/agents/domain/inspection-agent/MONITORED_USE_SCENARIOS.md` — Grupo C
**Por que agora:** O agente está em review_validated com pacote monitorado completo e auditado.
O próximo passo natural é uso real com registro.

### B) Uso Monitorado Real — irata-agent
**O quê:** Registrar primeiros usos reais do agente em situações reais de trabalho em altura.
**Como:** Usar template equivalente do Grupo C do irata-agent.
**Arquivo:** `.claude/agents/domain/irata-agent/MONITORED_USE_SCENARIOS.md` — Grupo C
**Por que agora:** irata-agent também está em review_validated com pacote monitorado completo.

### C) Protocolo de Registro de Uso Real Comum
**O quê:** Criar protocolo unificado para registro de usos monitorados reais de IRATA e Inspection.
**Benefício:** Padroniza como divergências, aprendizados e melhorias são registrados.
**Candidato:** context-mapper ou doc-agent para estruturar o protocolo.

---

## Ações Não Urgentes

### D) Iniciar Novo Agente na Pipeline
**Candidatos em status:draft:**
- `legal-agent` — documentos jurídicos, prazos, intimações (domínio ativo do operador)
- `learn-agent` — registro de aprendizado (bloqueado em modo visitante)
- `asset-agent` — análise financeira, decisão de investimento

**Processo:** repetir o ciclo de maturação:
abertura controlada → docmap → QA comportamental → pacote monitorado → QA pacote → review_validated

### E) Consolidar Documentação CORE-AGENTS
**O quê:** Criar um documento de arquitetura consolidado que descreva a camada de agentes como um todo.
**Por que:** A documentação atual está distribuída em AGENT.md individuais e no registry.
Um documento de visão global seria útil para novas sessões.

### F) Pacote de Release Interno
**O quê:** Gerar um pacote compactado estável da versão atual do CORE-AGENTS para arquivo.
**Por que:** Marco estável com 3 agentes review_validated. Vale registrar como versão.
**Formato:** ZIP + manifesto + hashes (padrão do presente pacote de continuidade).

---

## Ações Proibidas sem Decisão Explícita do Operador Primário

| Ação Proibida | Motivo |
|---|---|
| Alterar `active:false` de qualquer agente em review_validated | Requer aprovação formal + EVT registrado |
| Alterar `status` de qualquer agente | Promoção é evento formal com QA e aprovação |
| Alterar `operational_authority` | Campo constitucional — não muda sem decisão de operador primário |
| Modificar AGENT.md de agentes fora de iteração formal | Alterações ad hoc comprometem rastreabilidade |
| Modificar registry fora de iteração formal | Inventário oficial — integridade é crítica |
| Modificar logs principais fora de iteração formal | Rastreabilidade irreversível |
| Cruzar `lotofa` + `asset-core` | Firewall permanente — nunca |
| Calibrar `profile.md` por operador não primário | Bloqueado em modo visitante |
| Acessar `decision_log` em modo visitante | Bloqueado em modo visitante |
| Ativar qualquer agente sem QA formal completo | Pipeline de maturação obrigatório |

---

## Sugestões de Próxima Frente

### Frente legal-agent (recomendada como próxima)
**Motivação:** O operador primário tem processo judicial ativo (processo das tias).
O `legal-agent` tem relevância imediata e domínio bem delimitado.
**Ciclo esperado:** 5–7 iterações (abertura → docmap → QA → review_validated).

### Frente asset-agent
**Motivação:** Operador é investidor ativo com decisões financeiras em andamento.
**Cuidado:** Firewall permanente `lotofa ≠ asset-core` — nunca cruzar com análise de loteria.
`decision_log` e `profile.md` bloqueados em modo visitante.

### Integração futura
**G)** Integrar CORE-AGENTS com CORE-OS interface/Lovable no futuro.
Quando houver uma interface de usuário real, os agentes em review_validated podem ser
expostos como assistentes especializados com todas as regras de uso monitorado.

---

## Resumo de Prioridade

| Prioridade | Ação | Esforço |
|---|---|---|
| Alta | A) Uso monitorado real do inspection-agent | Baixo — apenas usar e registrar |
| Alta | B) Uso monitorado real do irata-agent | Baixo — apenas usar e registrar |
| Média | C) Protocolo de registro de uso real | Médio — 1 iteração |
| Média | D) Iniciar legal-agent | Alto — ciclo completo |
| Baixa | E) Consolidar documentação CORE-AGENTS | Médio — 1 sessão |
| Baixa | F) Pacote de release interno | Baixo — 1 sessão |
| Futuro | G) Integração com interface | Alto — depende de decisão arquitetural |

---

*Gerado em: 2026-06-10 | Pack: CORE_AGENTS_STATE_PACK_2026-06-10*
*Decisão de próximo passo é do operador primário.*
