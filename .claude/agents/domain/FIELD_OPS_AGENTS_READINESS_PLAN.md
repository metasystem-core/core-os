# FIELD OPS AGENTS — Readiness Plan

**Arquivo:** plano de prontidão — iteração 6.0
**Criado em:** 2026-06-09
**Criado por:** operador-primario
**Agentes cobertos:** norm-agent, irata-agent, inspection-agent
**Status do plano:** ativo — uso operacional autorizado pelo operador

---

## 1. Objetivo

Definir a sequência de ativação dos três Field Ops Agents — do estado atual (draft) até review_validated — com base no source recon realizado na Iteração 6.0.

Este documento não implementa nada. Define o plano de execução.

---

## 2. Estado atual — resumo

| Agente | Status | Core parent | Source recon | AGENT.md | QA |
|---|---|---|---|---|---|
| norm-agent | draft | doc-inspecao | COMPLETO | skeleton | não executado |
| irata-agent | draft | irata-n3 | COMPLETO | skeleton | não executado |
| inspection-agent | draft | inspecao-end | COMPLETO | skeleton | não executado |

---

## 3. Avaliação de maturidade das fontes

### norm-agent

- **Core:** doc-inspecao — SKILL.md bem estruturado, 7 sub-skills, base normativa rica (39 normas + NRs)
- **Risco dominante:** vigência de normas (API 570 4th/2016, NRs não verificadas online)
- **Lacuna crítica:** sem documentos IRATA ICOP/TACS na base (relevante para interseção com irata-agent)
- **Avaliação:** **Pronto para Iteração 6.1** — core maduro, lacunas identificadas, mapeado.

### irata-agent

- **Core:** irata-n3 — 12 sub-skills operacionais, 9 templates, 2 checklists, hierarquia normativa declarada
- **Risco dominante:** domínio de vida — qualquer lacuna de output é crítica; IRATA ICOP/TACS ausentes da base
- **Lacuna crítica:** IRATA ICOP e TACS não localizados em norm_library; local-watchdog.md com encoding corrompido
- **Avaliação:** **Pronto para Iteração 6.3** — core operacional completo, exige QA com cenários de campo críticos.

### inspection-agent

- **Core:** inspecao-end — o mais rico dos três (~50 sub-arquivos, INSPECAO_CORE_CONSOLIDADO.md, 3 schemas, 6 templates, 4 exemplos)
- **Risco dominante:** conclusão técnica exige dado de campo real — modelo não pode inferir sem evidência física
- **Lacuna crítica:** INSPECAO_CORE_CONSOLIDADO.md não lido ainda — ler antes de preencher AGENT.md
- **Avaliação:** **Pronto para Iteração 6.5** — fonte mais madura, exige leitura completa do consolidado antes do AGENT.md.

---

## 4. Sequência de ativação

```
Iteração 6.1 — norm-agent AGENT.md (preenchimento para review)
Iteração 6.2 — norm-agent QA (textual, escopo normativo)
Iteração 6.3 — irata-agent AGENT.md (preenchimento para review)
Iteração 6.4 — irata-agent QA (textual, escopo campo crítico)
Iteração 6.5 — inspection-agent AGENT.md (preenchimento para review)
Iteração 6.6 — inspection-agent QA (textual, escopo laudo/END)
Iteração 6.7 — Field test package / monitored checklists (três agentes)
```

---

## 5. Dependências entre agentes

| Relação | Direção | Nota |
|---|---|---|
| inspection-agent → norm-agent | inspection chama norm para referência normativa | norm-agent deve estar em review antes do QA de inspection |
| irata-agent → norm-agent | irata chama norm para referência normativa | norm-agent deve estar em review antes do QA de irata |
| inspection-agent ← irata-agent | irata chama inspection quando há inspeção em altura | Cooperação — não bloqueia QA individual |

**Implicação:** norm-agent deve ser o primeiro a avançar. QA de irata e inspection dependem de norm em estado operacional.

---

## 6. Critérios de transição draft → review

Para cada agente, o AGENT.md preenchido deve conter, no mínimo:

1. `## Missão` — função declarada com precisão
2. `## Não-Missão` — o que o agente não faz (explícito)
3. `## Output Contract` — formato e elementos mínimos de toda resposta
4. `## Ciclo de Vida` — estados, triggers de ativação, condições de dormência
5. `## Firewalls` — bloqueios absolutos do domínio
6. `## Lacunas de Capacidade` — o que não está disponível na base atual
7. `## SOURCE-FIRST` — protocolo de rastreabilidade aplicado ao domínio

---

## 7. Critérios de transição review → review_validated

Mesmos critérios aplicados ao simb-agent:

1. QA textual com cenários representativos do domínio
2. Resultado: PASS ou PASS_WITH_NOTES (sem FAIL)
3. Calibration patch se necessário (PASS_WITH_NOTES)
4. Rerun QA pós-calibração
5. Aprovação explícita do operador primário
6. Registro EVT formal

---

## 8. Riscos do plano

| Risco | Probabilidade | Impacto | Mitigação |
|---|---|---|---|
| IRATA ICOP/TACS ausentes da base — irata-agent opera com lacuna normativa real | alta | crítico | Declarar explicitamente no AGENT.md; QA deve testar comportamento com lacuna |
| Normas com vigência não verificada — outputs com alerta de versão obrigatório | alta | alto | Regra de output: declarar alerta de vigência em toda conclusão que dependa de norma carregada |
| inspection-agent com base muito rica — risco de over-scope no QA | média | médio | Definir escopo mínimo de QA (4-6 cenários core) antes de expandir |
| Sobreposição de `finding-classifier` entre doc-inspecao e inspecao-end | baixa | baixo | Verificar em iteração 6.5; unificar se idêntico, separar se houver diferença funcional |

---

## 9. O que este plano não autoriza

- Alterar status de nenhum agente nesta iteração
- Alterar agents_registry.yaml
- Alterar skills
- Executar QA nesta iteração
- Preencher AGENT.md nesta iteração

---

## 10. Referências

- `norm-agent/NORM_AGENT_SOURCE_RECON.md` — source recon detalhado
- `irata-agent/IRATA_AGENT_SOURCE_RECON.md` — source recon detalhado
- `inspection-agent/INSPECTION_AGENT_SOURCE_RECON.md` — source recon detalhado
- `logs/agent_evolution_log.md` — EVT-20260609-017
- `logs/agent_qa_log.md` — QA-20260609-005 e QA-20260609-006 (referência de processo)
- `domain/simb-agent/AGENT.md` — referência de processo para preenchimento
