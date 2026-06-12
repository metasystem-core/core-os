# ARCHITECTURAL_OBSERVATIONS_REGISTRY
## Registro de Observações Arquiteturais — Biblioteca Simbólica SIMB

**Escopo:** observações sobre a arquitetura da biblioteca — o que está funcionando, o que precisa ser ajustado, decisões de design que devem ser lembradas.
**Append-only.**
**Uso:** informa patches estruturais futuros via Claude Code, não operação corrente.

---

## Sobre este registro

Este registro não é operacional — é memória de design. Registra tensões, trade-offs e decisões arquiteturais tomadas durante o desenvolvimento da biblioteca. Toda mudança estrutural deve consultar este registro antes de executar.

---

| obs_id | date | componente | tipo | observação | ação_sugerida | prioridade |
|---|---|---|---|---|---|---|
| ARCH-001 | 2026-06-12 | registries/ | design_decision | Registries criados como pasta separada de índices e templates. Separação clara: LIBRARY_INDEX.md = índice de consulta operacional rápida; registries/ = índices detalhados com metadados estruturados. | Manter essa separação. LIBRARY_INDEX não deve replicar o detalhe dos registries. | alta |
| ARCH-002 | 2026-06-12 | INTAKE_LOG.md | limitação | Linha de intake é muito longa para o formato de tabela Markdown — lista de files_created ocupa muito espaço. | Considerar mover files_created para campo no source_manifest e simplificar INTAKE_LOG para metadados de processo apenas. | média |
| ARCH-003 | 2026-06-12 | concept_cards/ | gap | Cards de conceito não têm campo explícito para "conceitos relacionados" (além da referência ao source). Conexões entre CON-SIMB-001 (Uroboros) e CON-SIMB-002 (Grande Mãe) são implícitas no texto, não indexadas. | Adicionar campo `related_concepts` ao CONCEPT_CARD_TEMPLATE.md em próximo patch. | média |
| ARCH-004 | 2026-06-12 | symbol_cards/ | gap | Symbol cards não têm campo para "conceitos opostos" ou "símbolos em tensão". Uroboros e Dragão são relacionados mas distintos — essa relação não está indexada. | Adicionar campo `tension_with` ao SYMBOL_CARD_TEMPLATE.md em próximo patch. | baixa |
| ARCH-005 | 2026-06-12 | registries/ | design_decision | LEARNING_OBSERVATIONS_REGISTRY marcado como acesso modo primário apenas — contém observações sobre o operador. Isso cria um registro que deve ser gitignored ou não? Decisão atual: versionado, mas com acesso controlado por modo. | Revisar com operador se este registro deve ser gitignored ou se permanece versionado com controle de modo. | alta |

---

| ARCH-006 | 2026-06-12 | SOURCE_WEIGHTING_POLICY / SELF_ANALYSIS_TRIGGER_POLICY | design_decision | Taxonomia N0–N5 criada para governar intake de fontes. IRIS_SELF_ANALYSIS fica vinculada a critérios explícitos (mínimo 2 critérios fortes OU 3 médios), não a julgamento implícito. Critérios de bloqueio (B-01 a B-10) documentados para evitar self-analysis inflacionada. | Manter essa taxonomia. Toda nova fonte deve passar pelo SOURCE_EVALUATION_TEMPLATE antes de qualquer processamento. | alta |
| ARCH-007 | 2026-06-12 | IRIS_SELF_ANALYSIS_INDEX | design_decision | Separação entre "self-analysis candidate" (Iris recomenda via protocolo de recomendação estruturado) e "self-analysis approved" (operador decide). Garante que autonomous_self_patch: false seja respeitado também na decisão de criar self-analysis. | Nunca criar IRIS_SELF_ANALYSIS sem aprovação explícita do operador. Candidate ≠ Approved. | alta |
| ARCH-008 | 2026-06-12 | library/ | design_decision | SOURCE_EVALUATION_TEMPLATE criado como formulário de avaliação individual de fonte — substitui julgamento ad hoc. Template inclui campos de novelty_score, operational_impact, risk_score, redundancy_score, além de questões sobre geração de cards, response tests e patch candidates. | Usar o template para toda nova fonte, mesmo quando o nível parecer óbvio. A documentação da avaliação é tão importante quanto a decisão. | média |

*Atualizado em: 2026-06-12*
