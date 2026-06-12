# INGESTION_DECISIONS_REGISTRY
## Registro de Decisões de Ingestão — Biblioteca Simbólica SIMB

**Escopo:** registro explícito das decisões tomadas em cada intake — o que foi incluído, o que foi excluído e por quê.
**Append-only.**

---

## Por que este registro existe

Decisões de ingestão têm consequências para o uso futuro da biblioteca. Registrar o raciocínio permite:
- auditar por que certos conceitos foram incluídos e outros não
- rastrear limitações conhecidas de cada fonte
- evitar que futuros intakes repitam erros ou ignorem restrições

---

| decision_id | intake_id | source_id | decisão | justificativa | alternativa_considerada | risco_aceito |
|---|---|---|---|---|---|---|
| DEC-001 | INT-SIMB-20260612-001 | SRC-SIMB-001 | Incluir concept_extraction e symbol_extraction (não apenas manifest_only) | Operador já leu o livro; material familiar; copyright_risk gerenciável com cards em palavras próprias sem trechos literais | manifest_only teria sido mais conservador | copyright_risk aceito com mitigação: zero trechos literais extensos em arquivos versionados |
| DEC-002 | INT-SIMB-20260612-001 | SRC-SIMB-001 | Não criar reading_notes | Concept e symbol cards cobrem o necessário para uso operacional; reading_notes adicionariam redundância sem ganho | reading_notes criadas | nenhum |
| DEC-003 | INT-SIMB-20260612-001 | SRC-SIMB-001 | Ativar outdated_model_risk explicitamente | Premissas universalistas de Neumann são contestadas; ignorar isso seria falha epistêmica | desativar o flag | risco de o operador usar o modelo como verdade sem fricção crítica |
| DEC-004 | INT-SIMB-20260612-001 | SRC-SIMB-001 | Não criar cards para Parte II detalhada (estágios da personalidade) | Cobertura inicial focada nos conceitos de maior utilidade operacional; Parte II pode ser expandida em intake complementar | cobertura completa da Parte II | conceitos de Parte II (puberdade, segunda metade da vida) ainda não disponíveis como cards |

---

| DEC-005 | SIMB-SOURCE-GOVERNANCE-001 | — | Criar SOURCE_WEIGHTING_POLICY + SELF_ANALYSIS_TRIGGER_POLICY como camada de governance de fontes | Sem régua explícita, a biblioteca pode crescer de forma não governada — fontes de peso diferente recebendo mesmo tratamento | Deixar a decisão ad hoc por fonte | risco de incoerência no corpus a longo prazo |
| DEC-006 | SIMB-SOURCE-GOVERNANCE-001 | — | Adotar níveis N0–N5 como taxonomia de intake | Taxonomia clara permite que Iris recomende e operador decida com informação estruturada; substitui julgamento implícito por critério explícito | Manter julgamento informal | nenhum identificado |
| DEC-007 | SIMB-SOURCE-GOVERNANCE-001 | — | Separar "self-analysis candidate" (Iris recomenda) de "self-analysis aprovada" (operador aprova) | Distinção crítica: a Iris não pode autopromover fonte para self-analysis. Candidate = proposta; approved = autorização do operador | Iris decide autonomamente | viola autonomous_self_patch: false |

*Atualizado em: 2026-06-12*
