# AGENT_EVOLUTION_REVIEW_CHECKLIST
## Checklist de Revisão de Proposta de Evolução — CORE-AGENTS

**Uso:** Aplicar este checklist ao revisar qualquer EVOLUTION_PROPOSALS.md ou patch candidate antes de aprovação.

---

## A. Evidência e Recorrência

- [ ] Há evidência suficiente? (sessão, log, feedback — não apenas intuição)
- [ ] É aprendizado recorrente ou caso único?
  - Se caso único → rejeitar ou aguardar mais ocorrências
  - Se recorrente (≥2-3 ocorrências) → avançar
- [ ] A evidência vem de fonte válida? (ver §3 do AGENT_SELF_EVOLUTION_PROTOCOL.md)
- [ ] A evidência foi coletada em modo primário (não visitante)?

---

## B. Escopo e Autoridade

- [ ] Esta proposta aumenta a autoridade do agente?
  - Se sim → escalar fw-governor antes de avançar
- [ ] Esta proposta reduz algum firewall ou requisito de segurança?
  - Se sim → escalar fw-governor imediatamente
- [ ] Esta proposta altera o escopo do agente além do definido em AGENT.md?
  - Se sim → requer aprovação explícita do operador + revisão do AGENT.md
- [ ] Esta proposta cria dependência de banco, API, RAG ou embedding?
  - Se sim → escalar para etapa de infraestrutura separada

---

## C. Isolamento e Contaminação

- [ ] Esta proposta mistura domínios de agentes distintos?
  - Ex: simb-agent propondo mudança que afeta asset-agent → bloqueado
- [ ] Esta proposta foi influenciada por fonte em quarantine?
  - Se sim → rejeitar até fonte ser promovida
- [ ] Esta proposta é baseada em documento não validado?
  - Se sim → aguardar validação da fonte

---

## D. Rollback e Teste

- [ ] Existe plano de rollback claro?
  - Rollback deve ser executável sem perda de dados
- [ ] Existe plano de teste/validação?
  - O que mudou deve ser testável em cenário controlado
- [ ] O diff da mudança é legível e revisável?
- [ ] A mudança é reversível? (se não → elevar risco para crítico)

---

## E. Destino da Mudança

- [ ] Esta mudança deve virar atualização de AGENT.md?
- [ ] Esta mudança deve virar atualização de workspace policy?
- [ ] Esta mudança deve virar apenas um novo exemplo ou template?
- [ ] Esta mudança deve virar um novo checklist?
- [ ] Esta mudança deve ser descartada (não é evolução — é noise)?

---

## F. Aprovação

- [ ] O operador primário está ciente e aprovou?
- [ ] A aprovação foi registrada com data e nota?
- [ ] O patch será aplicado via sessão controlada com Claude Code?
- [ ] O commit será explícito e descritivo?
- [ ] EVOLUTION_INDEX.md será atualizado após aplicação?

---

## G. Resultado da Revisão

| Resultado | Ação |
|---|---|
| Todos os itens PASS | Avançar para aprovação e aplicação |
| Item B falhou (autoridade/firewall) | Escalar fw-governor — não aplicar |
| Item A falhou (evidência insuficiente) | Devolver ao agente — aguardar recorrência |
| Item C falhou (contaminação) | Rejeitar — registrar em rejected/ |
| Item D falhou (rollback/teste ausente) | Devolver — completar antes de revisão |
| Item E: destino incerto | Definir antes de avançar |

---

*⚠️ PROPOSAL ≠ PATCH APPLIED | ONE BAD CASE ≠ NEW RULE | OPERATOR OWNS SYSTEM*
