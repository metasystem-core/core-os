# INTAKE_LOG
## Log de Intake — Biblioteca Simbólica SIMB

**Workspace:** `.claude/workspaces/simb/library/`  
**Criado em:** SIMB-LIBRARY-001 (2026-06-12)

---

> Append-only. Nunca deletar linhas.  
> Toda entrada de fonte na biblioteca gera uma linha neste log.

---

| intake_id | date | operator_request | source_title | source_type | action | status | files_created | risk_flags | next_action |
|---|---|---|---|---|---|---|---|---|---|
| INIT-001 | 2026-06-12 | SIMB-LIBRARY-001 infrastructure | — | — | create_infrastructure | complete | README + 6 policies + 2 indexes + 16 templates | none | awaiting_first_real_intake |

---

*Próxima entrada: INT-SIMB-YYYYMMDD-001 — primeira fonte real*  
*Formato de ID: `INT-SIMB-YYYYMMDD-NNN`*

| INT-SIMB-20260612-001 | 2026-06-12 | Primeiro intake real — operador já leu o livro; testar sistema de biblioteca | The Origins and History of Consciousness | livro | manifest_only + concept_extraction + symbol_extraction + author_map | complete | SRC-001_neumann_origens-historia-consciencia.md, CON-001_uroboros.md, CON-002_grande-mae.md, CON-003_mito-do-heroi.md, CON-004_centroversao.md, CON-005_separacao-dos-sistemas.md, SYM-001_uroboros.md, SYM-002_dragao.md, SYM-003_tesouro-dificil-de-alcancar.md, AUT-001_neumann.md | copyright, therapeutic_confusion, authority_over_operator, outdated_model | próximo intake: The Great Mother (Neumann) ou outra obra indicada pelo operador |

---

## Batch INT-SIMB-20260612-002 — Rudhyar (6 livros)

| intake_id | date | operator_request | source_title | source_type | action | status | files_created | risk_flags | next_action |
|---|---|---|---|---|---|---|---|---|---|
| INT-SIMB-20260612-002 | 2026-06-12 | "faça o intake formal" — 6 livros Rudhyar em cesto/livros/ | A Prática da Astrologia | livro | manifest_only + author_map | complete | SRC-002_rudhyar_pratica-astrologia.md, AUT-002_rudhyar.md | copyright, mysticism_overreach | nenhuma — manifest_only suficiente |
| INT-SIMB-20260612-003 | 2026-06-12 | batch Rudhyar | As Casas Astrológicas (PT) | livro | manifest_only + concept_extraction | complete | SRC-003_rudhyar_casas-astrologicas-pt.md, CON-006_casas-como-campos-de-experiencia.md | copyright, authority_over_operator | leitura aprofundada se solicitada |
| INT-SIMB-20260612-004 | 2026-06-12 | batch Rudhyar | Astrology for New Minds | livro | manifest_only | complete | SRC-004_rudhyar_astrology-new-minds.md | copyright, mysticism_overreach, low_source_quality | baixa prioridade; aguardar demanda |
| INT-SIMB-20260612-005 | 2026-06-12 | batch Rudhyar | Astrology of Transformation | livro | manifest_only + concept_extraction | complete | SRC-005_rudhyar_astrology-of-transformation.md, CON-007_quatro-niveis-experiencia-rudhyar.md, CON-008_progressoes-vs-transits.md | copyright, mysticism_overreach, authority_over_operator | leitura completa recomendada — alta prioridade |
| INT-SIMB-20260612-006 | 2026-06-12 | batch Rudhyar | The Astrological Houses (EN) | livro | manifest_only | complete | SRC-006_rudhyar_astrological-houses-en.md | copyright, authority_over_operator | par de SRC-003 (PT); usar EN para terminologia original |
| INT-SIMB-20260612-007 | 2026-06-12 | batch Rudhyar | The Planetarization of Consciousness | livro | manifest_only | complete | SRC-007_rudhyar_planetarization-of-consciousness.md | copyright, mysticism_overreach_HIGH, outdated_model | manter manifest_only; requer mediação crítica forte |

---

## Batch INT-SIMB-20260618-008 — Hall (dream method)

| intake_id | date | operator_request | source_title | source_type | action | status | files_created | risk_flags | next_action |
|---|---|---|---|---|---|---|---|---|---|
| INT-SIMB-20260618-008 | 2026-06-18 | CORE/IRIS — REGISTER HALL DREAM SOURCE AND ARTIFACTS 001 — Hall já lido via IRIS_SELF_ANALYSIS_007; registrar formalmente SRC-010 e 7 artefatos | Jungian Dream Interpretation: A Handbook of Theory and Practice | livro | manifest + concept_extraction + protocol_extraction + risk_extraction + protocol_derivado | complete | SRC-010_hall_jungian_dream_interpretation.md, CON-036_dream-ego-nao-e-ego-desperto.md, CON-037_compensacao-tres-modos.md, CON-038_amplificacao-em-ordem.md, CON-039_serie-de-sonhos-imagens-relacionadas.md, PROT-004_inexaustibilidade-da-leitura-onirica.md, PROT-005_registro-bruto-antes-de-interpretacao.md, RISK-002_reducao-arquetipica.md, DREAM_ANALYSIS_PROTOCOL_v0.1.md | copyright, therapeutic_confusion, authority_over_operator | ciclo Hall fechado — DREAM_REGISTRY e SYMBOL_REGISTRY pendentes [chunks_count: 21 | audits: HALL_DREAM_PROTOCOL_PROMOTION_AUDIT_001, HALL_DREAM_ANALYSIS_PROTOCOL_CREATION_AUDIT_001, DREAM_ANALYSIS_PROTOCOL_QA_001, DREAM_ANALYSIS_PROTOCOL_PATCH_QA_NOTES_001, HALL_DREAM_ARTIFACT_CREATION_AUDIT_001, HALL_DREAM_ARTIFACT_QA_001, HALL_DREAM_ARTIFACT_PATCH_QA_NOTES_001, HALL_DREAM_REGISTRY_UPDATE_AUDIT_001, HALL_ARTIFACT_SOURCE_ID_PATCH_AUDIT_001, HALL_REGISTRY_SOURCE_QA_001, HALL_REGISTRY_SOURCE_PATCH_QA_NOTES_001] |
