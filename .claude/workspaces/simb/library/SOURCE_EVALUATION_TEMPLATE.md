# SOURCE EVALUATION
## Formulário de Avaliação de Fonte — Biblioteca Simbólica SIMB

> **Template:** Preencher para toda fonte considerada para intake. Salvar em `intake/` ou `source_manifests/` dependendo do resultado.
> Consultar SOURCE_WEIGHTING_POLICY.md para definição dos níveis N0–N5.
> Consultar SELF_ANALYSIS_TRIGGER_POLICY.md para critérios de gatilho de self-analysis.

---

## Metadata

```
source_id:                   # SRC-SIMB-NNN (se já registrada) ou provisório (EVAL-PROVISÓRIO)
title:                       # título completo da obra
author:                      # autor(es)
date:                        # data desta avaliação (AAAA-MM-DD)
source_type:                 # livro | artigo | tradição_oral | compilação | digital | outro
domain:                      # psicologia_junguiana | astrologia_humanista | filosofia | mitologia | simbologia | outro
operator_reason_for_ingestion: # por que o operador está considerando esta fonte
```

---

## 1. Relevance

*A fonte é relevante para o escopo da biblioteca simbólica do SIMB-CORE?*

- relevância para o domínio simbólico:
- relevância para o modus operandi atual da Iris:
- relevância para o campo de trabalho do operador:

**authority_level:** alta | média | baixa | indeterminada  
*Justificativa:*

---

## 2. Novelty

*Quanto esta fonte acrescenta ao que já existe na biblioteca?*

Fontes já integradas que cobrem domínio próximo:
- [SRC-SIMB-NNN]: [quanto cobre]

O que esta fonte acrescenta que as existentes não cobrem:
-

**novelty_score:** 0–5  
*(0 = totalmente redundante; 5 = completamente novo, sem sobreposição)*

---

## 3. Operational Impact

*Quanto esta fonte afeta o modus operandi da Iris?*

Diagnóstico de gatilhos de self-analysis (ver SELF_ANALYSIS_TRIGGER_POLICY.md):

| Gatilho | Aplicável? | Justificativa |
|---|---|---|
| Muda o modo de leitura | sim / não / parcial | |
| Muda o modo de resposta | sim / não / parcial | |
| Muda limites e postura | sim / não / parcial | |
| Gera tensão com arquitetura | sim / não / parcial | |
| Cria necessidade de protocolo | sim / não / parcial | |
| Justifica patch candidate | sim / não / parcial | |

**operational_impact:** 0–5  
*(0 = nenhum impacto no protocolo; 5 = altera múltiplas camadas do modus operandi)*

---

## 4. Risk

*Quais riscos esta fonte introduz?*

| Risco | Presente? | Mitigação |
|---|---|---|
| copyright | sim / não | |
| therapeutic_confusion | sim / não | |
| authority_over_operator | sim / não | |
| mysticism_overreach | sim / não | |
| literalization | sim / não | |
| inflation_symbolic | sim / não | |
| outdated_model | sim / não | |

**risk_score:** 0–5  
*(0 = sem risco relevante; 5 = risco alto em múltiplas dimensões)*

---

## 5. Redundancy

*Quanto esta fonte duplica o que já existe?*

- cobre os mesmos conceitos que [SRC-SIMB-NNN]?
- acrescenta distinções novas ou apenas confirma?
- seria melhor tratar como N1 (nota) do que N2 (cards)?

**redundancy_score:** 0–5  
*(0 = nada redundante; 5 = totalmente coberta por fontes existentes)*

---

## 6. Recommended Processing Level

*Com base nas avaliações acima, qual nível de processamento é recomendado?*

| Critério | Pontuação |
|---|---|
| novelty_score | /5 |
| operational_impact | /5 |
| risk_score (penalidade) | /5 |
| redundancy_score (penalidade) | /5 |

**Nível recomendado:** N0 / N1 / N2 / N3 / N4 / N5

*(Consultar SOURCE_WEIGHTING_POLICY.md para definição de cada nível)*

---

## 7. Justification

*Por que este nível foi recomendado? Raciocínio explícito.*

Critérios fortes satisfeitos (para N3+):
-

Critérios médios satisfeitos:
-

Critérios de bloqueio presentes:
-

---

## 8. Should This Generate IRIS_SELF_ANALYSIS?

**yes / no / defer**

Justificativa:

Se yes — critérios N3 satisfeitos:
- [CF-XX]: [justificativa]
- [CM-XX]: [justificativa]

Se defer — quando reavaliar:

---

## 9. Should This Generate Cards?

**yes / no / defer**

Se yes — tipo de cards:
- [ ] concept_cards (quais conceitos?)
- [ ] symbol_cards (quais símbolos?)
- [ ] phase_cards (quando criados)

Quais conceitos/símbolos prioritários:
-

---

## 10. Should This Generate Response Tests?

**yes / no / defer**

Se yes — que tipo de teste é necessário:
- [ ] teste de não-literalização
- [ ] teste de nível de profundidade
- [ ] teste de modo Yang/Yin
- [ ] teste de firewall de inflação
- [ ] outro: [descrever]

---

## 11. Should This Generate Patch Candidate?

**yes / no / defer**

Se yes — que protocolo/schema seria alterado:
- [ ] AGENT.md
- [ ] card templates (CONCEPT/SYMBOL/PHASE)
- [ ] protocolo de resposta (IRIS_NEUMANN_RUNTIME_PROTOCOL ou equivalente)
- [ ] schema de registry
- [ ] outro: [descrever]

Formato obrigatório: IRIS SELF-REWRITE REQUEST (ver OPERATOR_APPROVAL_GATE.md)

---

## 12. Operator Decision Required

**yes / no**

Decisão do operador:

```
[ ] N0 — Reject
[ ] N1 — Reading Note only
[ ] N2 — Cards
[ ] N3 — Self-Analysis Candidate (aprovar self-analysis)
[ ] N4 — Response Test Required (antes de qualquer patch)
[ ] N5 — Patch Candidate (IRIS SELF-REWRITE REQUEST)

Observações: ___________________________________________
Data: ___________________________________________
```

---

*⚠️ SOURCE EVALUATION ≠ SOURCE TRUTH | IRIS RECOMENDA — OPERADOR DECIDE | OPERATOR OWNS INTAKE DIRECTION*

*Template: v1.0 (SIMB-SOURCE-GOVERNANCE-001) | Criado em: AAAA-MM-DD*
