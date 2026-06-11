---
name: core-os-catalog
description: Índice completo e auditável do sistema CORE-OS. Gerado por varredura automática de .claude/skills/.
generated: 2026-05-03
version: 5
---

# CORE-OS — Catálogo Completo de Skills
**Versão:** v5 | **Data:** 2026-05-03 | **Gerado por:** varredura de `.claude/skills/`

---

## SUMÁRIO EXECUTIVO

| Métrica | Valor |
|---|---|
| Cores ativos | 12 |
| Cores em standby | 1 |
| Sub-skills (sub/) | 157 |
| Layers funcionais (fw-core/layers_v2) | 15 |
| Templates | 29 |
| Total arquivos .md (cores ativos) | 328 |
| Total arquivos .md (todo skills/) | 342 |

---

## NOVIDADES v5 — Hardening Operacional (2026-05-03)

- Frontmatter YAML padronizado em 11 SKILL.md (`name`, `description`, `status`, `core_type`, `priority`, `domain`)
- `_firmware/SKILL.md` criado — boot formal do watchdog com `status: always-on`
- `skill-router` atualizado com referência obrigatória ao firmware no boot
- 8 schemas em `.claude/data/schemas/` renomeados para `.template` + `.gitignore` atualizado
- 12 arquivos ALL_IN_ONE + backups movidos para `_archive/`
- Manifests reconciliados: fw-core e juridico (`v2 → manifest.json`, `v1 → manifest_deprecated.json`)
- 3 correlators criados em `asset-core/automation/correlators/`
- `operator-lock` atualizado com nota de segurança sobre o marcador `opa`
- `cesto-intake` instalado como novo core (entrada universal de arquivos)

---

## CORES ATIVOS (12)

---

### 1. `_firmware/` — Firmware Global
**core_type:** firmware | **status:** always-on | **priority:** critical | **layer:** boot

| Arquivo | Função |
|---|---|
| SKILL.md | Boot formal — core-lite-watchdog |
| WATCHDOG.md | Watchdog v2 completo — sequência de boot |
| CURADORIA.md | Protocolo de curadoria de skills |
| LOCAL_WATCHDOG_TEMPLATE.md | Template para watchdog local |

**Total:** 4 arquivos

---

### 2. `asset-core/` — Núcleo Financeiro
**core_type:** specialized | **domain:** financial | **priority:** high

**SKILL.md** + estrutura:

**sub/ (36 sub-skills):**
adaptation_lens_library · asset_review_and_learning · baseline_comparator · behavioral_guardrails · brazil_risk_premium_engine · btc_core_cre · cash_and_cdi_core · cri_cra_quality_analyzer · cross_core_firewall · ebi_manager · e_como_objeto · e_historico_engine · erro_extremo_sinal · fii_scorecard · fii_valuation_core · float_strategy_detector · investment_victory_definition · janelas_multiplas · judge_lens_asset · minimum_data_requirements · operational_unknown · opportunity_detector · peak_end_filter · position_sizing · post_mortem · pre_mortem · pvp_discount_detector · qualidade_exclusao · regime_detector · regret_review · response_modes · robustez_distribuida · skill_output_templates · validation_tests · valuation_brasil_adapter · valuation_orchestrator

**templates/ (2):** asset_core_output_template · decision_log_template

**automation/ (45 arquivos em 5 subpastas):**
- `orchestrator/` — SKILL.md
- `gateway/` — signal_relevance_triage · email_ingestion_setup · whatsapp_ingestion_phase2
- `parsers/` — platform_alert_parser · data_cleaning_normalizer
- `validators/` — official_source_validator · public_data_source_registry
- `monitors/` — document_download_pipeline · fii_monthly_monitor
- `correlators/` — commodity_linked_equity_analyzer · correlated_asset_factor_mapper · petr4_lens
- `templates/` — asset_review_trigger · decision_pending_note · feedback_de_sinal · mapa_fatores_correlacionados · painel_mensal_fiis · resumo_mensal_fii
- raiz automation: portfolio_data_schema · portfolio_income_tracker · review_trigger_matrix · event_taxonomy · notification_router · feedback_generator · guardrails + docs

**Total:** 85 arquivos

---

### 3. `cesto/` — Entrada Universal de Arquivos
**core_type:** intake | **domain:** universal-intake | **priority:** high

| Arquivo | Função |
|---|---|
| SKILL.md | Leitor universal — classifica, roteia, encaminha |

**Total:** 1 arquivo (pasta operacional em `C:\Users\rafae\core-os\cesto\`)

---

### 4. `doc-inspecao/` — Analista Documental Técnico
**core_type:** specialized | **domain:** technical-documentation | **priority:** high

**sub/ (3):** document-classifier · gap-analyzer · norm-reader

**Total:** 5 arquivos

---

### 5. `fw-core/` — Núcleo Constitucional
**core_type:** nucleus | **layer:** constitutional | **priority:** high

**SKILL.md** + estrutura:

**layers_v2/ (15 layers funcionais):**
adaptation_lens_library · adversarial_review_core · conflict_scan_v2 · constitutional_test_suite · core_lite_watchdog_v2 · core_registry · core_versioning_protocol · decision_log_core · execution_bridge · harvest_core_v2 · lacuna_protocol · memory_compression_protocol · meta_router_v2 · mode_selector · skill_lifecycle_protocol

**templates_v2/ (8 templates):**
template_constitutional_test · template_core_registry_entry · template_decision_log · template_execution_bridge · template_harvest_packet · template_lacuna · template_skill_lifecycle · template_version_record

**sub/ (2):** harvest_elevations · PROXIES_README

**Governance:** SKILL.md · manifest.json (v2 ativo) · manifest_deprecated.json · CORE_OS_MANIFEST.md

⚠ `layers/` e `templates/` (v1) — pastas presentes mas vazias. Ver lacunas.

**Total:** 58 arquivos

---

### 6. `fw-kant/` — Filtro Normativo
**core_type:** operator | **domain:** normative | **priority:** high

**sub/ (2):** domain-adapter · qualidade_exclusao

**Total:** 4 arquivos

---

### 7. `inspecao-end/` — Inspeção Técnica Industrial (END/NDT)
**core_type:** specialized | **domain:** technical-inspection | **priority:** high

**sub/ (44 sub-skills):**
campaign_vs_compliance · conformity_operability · core_lite_watchdog_insp · critical_points · damage-mechanisms · damage_mechanism_new · dismantling_inspection · document_check · ebi_inspection · engineering_escalation · equipment_dossier · equipment_norm_alignment · evidence_level · e_historico_inspection · fact_naming_tagging · failure_mode_consequence · field_inspection · field_to_report_converter · finding-classifier · fmea_lite · h_e_report_structure · inspection_baseline_comparator · inspection_conflict_scan · inspection_decision_log · inspection_taxonomy_tags · kantian_safety_ethics · limitation_language · ndt-selector · ndt_selection_new · nonconformity_severity · nonconformity_to_norm · normative_router · nr13_classification · operational_regime · portfolio_navigation · rbi_lite_criticality · recommendation · report-contract · report_builder · report_phrase_library · rope_access_interface · standard_finding_block · thickness_monitoring · zone_of_no_conclusion

**templates/ (5):** inspection_report_template · nonconformity_register · nr13_classification_form · portfolio_dashboard_template · thickness_measurement_register

**examples/ (4):** example_dismantling_ore_processing_plant · example_insulated_equipment · example_pressure_vessel_thickness_loss · example_valve_without_tag

**schemas/ (3):** (NR-13 classification, inspection, equipment)
**prompts/ (2):** (intake e operação)
**constitution.md** (CRÍTICO)

**Total:** 60 arquivos

---

### 8. `irata-n3/` — Supervisão N3 e Acesso por Cordas
**core_type:** specialized | **domain:** rope-access-safety | **priority:** high

**sub/ (3):** peak-end-filter · robustez_distribuida · team-state-reader

**Total:** 5 arquivos

---

### 9. `juridico/` — Jurídico-Core Brasil
**core_type:** specialized | **domain:** legal | **priority:** high

**SKILL.md** + estrutura:

**sub/ (32 sub-skills):**
adversarial_case_review · case_theory_builder · evidence_burden_engine · judge_lens · kantian_legal_navigator · lawyer_interface_protocol · law_source_first_protocol · legal_brazil_explainer · legal_document_reader · legal_emotional_modulator · legal_ethics_firewall · legal_gameboard_mapper · legal_implication_mapper · legal_risk_matrix · legal_strategy_core · legal_timeline_builder · legal_victory_definition · litigation_cost_engine · negative_proof_and_burden_gap · operator_adaptation_protocol · opponent_move_simulator · peak_end_juridico · possessory_property_dispute · prazo_urgencia · pre_mortem_juridico · procedural_timing_strategy · processo_trabalhista_explainer · regret_review_juridico · safe_conduct_protocol · settlement_strategy · subjective_context_synthesizer · user_intent_router

**templates/ (14):**
template_acordo_estrategico · template_conduta_segura · template_custo_total_litigio · template_leitura_decisao · template_linha_tempo_juridica · template_mapa_implicacao_juridica · template_mapa_tabuleiro_juridico · template_matriz_fato_prova_onus · template_mensagem_advogada · template_modo_juiz · template_modulacao_emocional_juridica · template_painel_comando_caso · template_revisao_adversarial · template_teoria_do_caso

**Governance:** manifest.json (v2 ativo) · manifest_deprecated.json

**Total:** 50 arquivos

---

### 10. `lotofa/` — Laboratório Estatístico (Lotofácil)
**core_type:** specialized | **domain:** statistical-lab | **priority:** medium | **firewall:** asset-core

**sub/ (12):**
lotofa_backtest_temporal · lotofa_data_hygiene · lotofa_e_historico · lotofa_firewall_asset · lotofa_generator_ensemble · lotofa_linear_space · lotofa_markov_lab · lotofa_random_baseline · lotofa_report_builder · lotofa_score_plausibilidade · lotofa_statphys_tempering · lotofa_version_registry

**data/** — pasta criada, `concursos.csv` ausente → ⚠ INOPERANTE para backtest real

**Total:** 15 arquivos

---

### 11. `simb-core/` — Análise Simbólico-Operacional
**core_type:** specialized | **domain:** symbolic | **priority:** high

**SKILL.md** + estrutura:

**sub/ (23 sub-skills):**
ausencia_como_dado · axis-core.skill · bridge-core.skill · conflict-scan.skill · core-lite-watchdog.skill · emo-core.skill · ener-core.skill · english-tech-bridge.skill · erro_extremo_sinal · harvest-core.skill · janelas_multiplas · kant-core.skill · lex-core.skill · loop-core.skill · mask-core.skill · meta-router.skill · pre-linguistic-operators.skill · productization-core.skill · relational_state_reader · reset-prompt-generator.skill · source-first-exegesis.skill · telos-core.skill · vetor-core.skill

**agents/ (3):** source-critic · symbolic-reader · synthesis-engine

**docs + pipeline + intake:** material-intake · output-contract · pipeline · session-bootstrap · source-trust-model · state-gate · symbolic-frameworks · transfer-functions · profile.md (calibração pessoal) · README · PROJECT-DESIGN

**Total:** 39 arquivos

---

### 12. `skill-router/` — Roteador Meta
**core_type:** router | **layer:** meta | **priority:** critical

| Arquivo | Função |
|---|---|
| SKILL.md | Meta-roteamento + referência ao firmware |

**Total:** 2 arquivos

---

## CORE EM STANDBY (1)

### `operator-lock/` — Camada de Identidade
**status:** standby (funcionalidade migrada para _firmware/WATCHDOG.md)
**Nota de segurança adicionada:** `opa` é marcador simbólico, não senha

**Total:** 2 arquivos

---

## ARQUIVO (_archive/)

**all_in_one/ (11):**
00_ASSET_AUTOMATION_PROMPT · 00_PROJECT_PROMPT_FULL · 00_PROMPT_COMPLETO_FW_CORE_V2 · 00_PROMPT_COMPLETO_JURIDICO_CORE · ASSET_CORE_AUTOMATION_ALL_IN_ONE · ASSET_CORE_FULL_PACK_COMBINED · ASSET_CORE_FULL_PACK_COMBINED_V2 · CORE_OS_NUCLEO_ALL_IN_ONE · FW_CORE_V2_ALL_IN_ONE · JURIDICO_CORE_ALL_IN_ONE · JURIDICO_CORE_V2_ALL_IN_ONE

**backups/ (1):** BACKUP_STRUCTURE_V1

**Total:** 12 arquivos

---

## INTERPOLAÇÕES ENTRE CORES

| Sub-skill | Origem | Destino | Princípio transferido |
|---|---|---|---|
| pre_mortem_juridico | asset-core | juridico | Análise de falha prospectiva |
| regret_review_juridico | asset-core | juridico | Revisão de decisão com antecipação de arrependimento |
| judge_lens_asset | juridico | asset-core | Leitura de posição adversarial em ativos |
| investment_victory_definition | juridico | asset-core | Definição operacional de vitória antes de agir |
| inspection_baseline_comparator | lotofa-core | inspecao-end | Comparação contra baseline antes de declarar anomalia |
| relational_state_reader | irata-n3 | simb-core | Leitura de estado alterado em terceiros |

---

## LACUNAS DETECTADAS

| # | Lacuna | Impacto | Status |
|---|---|---|---|
| L-01 | `fw-core/layers/` e `fw-core/templates/` — pastas v1 vazias | Estrutural | Pendente merge com v2 |
| L-02 | `lotofa/data/concursos.csv` ausente | LOTOFA inoperante para backtest real | Requer instalação manual |
| L-03 | FW-INSERTs 7 e 8 não definidos | Sequência 1–6 e 9 existem, gap no meio | Pendente criação |
| L-04 | `asset-core/` — behavioral_guardrails, cross_core_firewall, validation_tests existem na raiz e em sub/ | Duplicata v1/v2 | Decisão de remoção pendente |
| L-05 | `cesto/SKILL.md` — sem sub/ nem templates ainda | Cesto novo, funcional mínimo | Expansão futura opcional |

---

## FIREWALLS ATIVOS

| Firewall | Direção | Regra |
|---|---|---|
| lotofa ↔ asset-core | absoluto bilateral | Nenhuma conclusão estatística de lotofa entra em decisão financeira |
| simb-core → visitante | bloqueio de acesso | profile.md inacessível sem declaração `opa` |

---

## TOTAIS FINAIS

```
Cores ativos:          12
Cores em standby:       1
Sub-skills (sub/):    157
Layers v2 (fw-core):   15
Templates:             29
Arquivos (ativos):    328
Arquivos (total):     342
Lacunas:                5
Interpolações:          6
```
