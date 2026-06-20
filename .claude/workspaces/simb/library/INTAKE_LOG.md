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

---

## Batch INT-SIMB-20260619-009 — Jung Dreams

| intake_id | date | operator_request | source_title | source_type | action | status | files_created | risk_flags | next_action |
|---|---|---|---|---|---|---|---|---|---|
| INT-SIMB-20260619-009 | 2026-06-19 | TASK 19A — JUNG_DREAMS_SOURCE_INTAKE_001 — intake controlado de SRC-011 sem leitura completa | Dreams | livro (compilação CW Vols. 4, 8, 12, 16) | manifest_only + reading_plan | intake_started | SRC-SIMB-011_jung_dreams.md, JUNG_DREAMS_READING_PLAN_001.md, JUNG_DREAMS_SOURCE_INTAKE_AUDIT_001.md | copyright, therapeutic_confusion, mystical_certainty, prophecy_telepathy_overconfidence, sexual_concretism, authority_inflation, dream_as_command, archetypal_reduction | leitura faseada — iniciar com JUNG_DREAMS_PHASE_1_STRUCTURE_READ_001 |
| INT-SIMB-20260619-009-P1 | 2026-06-19 | TASK 19C — JUNG_DREAMS_PHASE_1_STRUCTURE_READ_001 — leitura estrutural de front matter e TOC | Dreams | livro | structure_read (front matter + TOC + list of illustrations) | phase_1_structure_read | JUNG_DREAMS_PHASE_1_STRUCTURE_READ_001.md, JUNG_DREAMS_PHASE_1_STRUCTURE_READ_AUDIT_001.md | — | JUNG_DREAMS_PHASE_2_ANALYSIS_OF_DREAMS_001 |
| INT-SIMB-20260620-009-FINAL | 2026-06-20 | TASKS 21A–21G — Leitura integral de SRC-SIMB-011 + revisão de integração final | Dreams | livro (compilação CW Vols. 4, 8, 12, 16) | full_read + integration_review | read_complete_integration_reviewed_pending_promotion_patch | [Tasks 21A–21F] reading_notes (5), protocol_notes (5), risk_cards (5), concept_candidates, audits (5); [Task 21B] JUNG_DREAMS_CORE_THEORY_INTEGRATION_REVIEW_001.md; [Task 21G] JUNG_DREAMS_FINAL_SOURCE_INTEGRATION_REVIEW_001.md, JUNG_DREAMS_FINAL_PROTOCOL_PROMOTION_PLAN_001.md, JUNG_DREAMS_FINAL_RISK_PROMOTION_PLAN_001.md, JUNG_DREAMS_FINAL_EVAL_CANDIDATES_001.md (15 evals), JUNG_DREAMS_FINAL_SOURCE_INTEGRATION_REVIEW_AUDIT_001.md | copyright, therapeutic_confusion, mystical_certainty, prophecy_telepathy_overconfidence, sexual_concretism, authority_inflation, historical_collapse (Part I) | próxima task: JUNG_DREAMS_PROTOCOL_PATCH_AND_EVAL_PLAN_001 — requer autorização do operador | [totais] findings: 75+ / PP: 31 / PH: 6 / RISK-JUNG: 28 / RISK-H: 5 / eval_candidates: 15 / patches_aplicados: 0 |
| INT-SIMB-20260620-009-CLOSE | 2026-06-20 | TASKS 21H–21K — Aplicação de protocolo, cards, skill alignment e QA final de SRC-SIMB-011 | Dreams | livro | protocol_patch + eval_creation + concept_card_creation + skill_alignment + final_QA + source_closure | processed_applied_closed | [Task 21H] DREAM_ANALYSIS_PROTOCOL_v0.2 (12 patches PATCH-005–016 + F-17 + F-18), EVAL-13 a EVAL-20, JUNG_DREAMS_PROTOCOL_PATCH_AND_EVALS_AUDIT_001.md; [Task 21I] CON-040 a CON-045 (6 novos), CON-037/038/039 calibrados, JUNG_DREAMS_CONCEPT_CARDS_CREATION_AUDIT_001.md; [Task 21J] SKILL.md alinhado (16 guardrails), JUNG_DREAMS_SKILL_ALIGNMENT_PATCH_AUDIT_001.md; [Task 21K] JUNG_DREAMS_FINAL_QA_AND_SOURCE_CLOSURE_001.md, JUNG_DREAMS_FINAL_QA_AND_SOURCE_CLOSURE_AUDIT_001.md | none | ciclo SRC-SIMB-011 fechado — commits: fcddab5 (21H), 7594eb1 (21I), f34de5b (21J) | [totais] patches: 12 / firewalls novos: 2 / evals novos: 8 / CON criados: 6 / CON calibrados: 3 / QA: 16/16 PASS |

---

## Batch INT-SIMB-20260620-012 — Whitmont & Perera (dream method)

| intake_id | date | operator_request | source_title | source_type | action | status | files_created | risk_flags | next_action |
|---|---|---|---|---|---|---|---|---|---|
| INT-SIMB-20260620-012 | 2026-06-20 | TASK 27 — WHITMONT_PERERA_DREAMS_SOURCE_INTAKE_AND_STRUCTURE_READ_001 — intake + Phase 1 structural read de SRC-012 | Dreams, A Portal to the Source | livro (handbook clínico junguiano) | manifest + reading_plan + phase_1_structure_read | intake_complete_phase_1_done | SRC-SIMB-012_WHITMONT_PERERA_DREAMS_PORTAL_MANIFEST_001.md, SRC-SIMB-012_WHITMONT_PERERA_DREAMS_PORTAL_READING_PLAN_001.md, WHITMONT_PERERA_DREAMS_PHASE_1_STRUCTURE_READ_001.md, WHITMONT_PERERA_DREAMS_SOURCE_INTAKE_AND_STRUCTURE_READ_AUDIT_001.md | copyright, clinical_authority, diagnosis_prognosis, therapist_role, transference_countertransference, active_imagination_enactment, fragmented_ego_clinical, sexuality_body_literalization, self_inflation | WHITMONT_PERERA_DREAMS_BLOCK_1_FOUNDATION_METHOD_READ_AND_COMMIT_001 — ler Ch. 1-3 (~p.1-25) |
| INT-SIMB-20260620-012-B1 | 2026-06-20 | TASK 28 — WHITMONT_PERERA_DREAMS_BLOCK_1_FOUNDATION_METHOD_READ_AND_COMMIT_001 — Block 1 deep read Ch. 1-3 | Dreams, A Portal to the Source | livro | block_read (Ch. 1-3, ~p.1-25) | block_1_complete | reading_notes/WHITMONT_PERERA_DREAMS_BLOCK_1_FOUNDATION_METHOD_READ_001.md, protocol_notes/WHITMONT_PERERA_DREAMS_BLOCK_1_PROTOCOL_NOTES_001.md, risk_cards/WHITMONT_PERERA_DREAMS_BLOCK_1_RISK_CANDIDATES_001.md, WHITMONT_PERERA_DREAMS_BLOCK_1_FOUNDATION_METHOD_READ_AUDIT_001.md | copyright, clinical_authority, active_imagination_enactment, self_inflation, diagnosis_prognosis | WHITMONT_PERERA_DREAMS_BLOCK_2_DREAM_LANGUAGE_FIELD_READ_AND_COMMIT_001 | [totais] findings: 25 / PP-WP candidates: 10 / RISK-WP candidates: 8 / clinical_only: 5 / all DRAFT |
| INT-SIMB-20260620-012-B2 | 2026-06-20 | TASK 29 — WHITMONT_PERERA_DREAMS_BLOCK_2_DREAM_LANGUAGE_FIELD_READ_AND_COMMIT_001 — Block 2 deep read Ch. 4-5 | Dreams, A Portal to the Source | livro | block_read (Ch. 4-5, ~p.26-55) | block_2_complete | reading_notes/WHITMONT_PERERA_DREAMS_BLOCK_2_DREAM_LANGUAGE_FIELD_READ_001.md, protocol_notes/WHITMONT_PERERA_DREAMS_BLOCK_2_PROTOCOL_NOTES_001.md, risk_cards/WHITMONT_PERERA_DREAMS_BLOCK_2_RISK_CANDIDATES_001.md, WHITMONT_PERERA_DREAMS_BLOCK_2_DREAM_LANGUAGE_FIELD_READ_AUDIT_001.md | copyright, clinical_authority, active_imagination_enactment, amplification_intrusion, symbol_overreach | WHITMONT_PERERA_DREAMS_BLOCK_3_COMPENSATION_DRAMA_TECHNICAL_READ_AND_COMMIT_001 | [totais] findings: 27 / PP-WP candidates: 12 (011-022) / RISK-WP candidates: 9 (009-017) / clinical_only: 6 / all DRAFT |
| INT-SIMB-20260620-012-B3 | 2026-06-20 | TASK 30 — WHITMONT_PERERA_DREAMS_BLOCK_3_COMPENSATION_DRAMA_TECHNICAL_READ_AND_COMMIT_001 — Block 3 deep read Ch. 6-7 | Dreams, A Portal to the Source | livro | block_read (Ch. 6-7, ~p.56-78) | block_3_complete | reading_notes/WHITMONT_PERERA_DREAMS_BLOCK_3_COMPENSATION_DRAMA_TECHNICAL_READ_001.md, protocol_notes/WHITMONT_PERERA_DREAMS_BLOCK_3_PROTOCOL_NOTES_001.md, risk_cards/WHITMONT_PERERA_DREAMS_BLOCK_3_RISK_CANDIDATES_001.md, WHITMONT_PERERA_DREAMS_BLOCK_3_COMPENSATION_DRAMA_TECHNICAL_READ_AUDIT_001.md | copyright, clinical_authority, fragmented_ego_clinical, overdramatization_panic, lysis_as_fate, waking_bypass | WHITMONT_PERERA_DREAMS_BLOCK_4_TECHNICAL_POINTS_READ_AND_COMMIT_001 — ler Ch. 8-9 (~p.79-126) | [totais] findings: 27 / PP-WP candidates: 10 (023-032) / RISK-WP candidates: 8 (018-025) / clinical_only: 4 / all DRAFT |
