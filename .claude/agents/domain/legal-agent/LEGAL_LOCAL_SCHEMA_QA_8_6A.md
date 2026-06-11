---
iteration: "8.6A"
title: "Legal Local Schema QA"
parent_iteration: "8.6"
qa_mode: local_schema_review_only
schema_files_modified: 0
schema_files_created: 0
database_created: false
migrations_created: false
connectors_active: 0
legal_content_fetched: 0
active: false
operational_authority: none
created_at: "2026-06-10"
event_id: "EVT-20260610-055"
---

# LEGAL_LOCAL_SCHEMA_QA_8_6A

Iteração 8.6A — Revisão formal dos arquivos YAML locais criados na Iteração 8.6.

---

## 1. Purpose

Esta iteração revisa os 10 arquivos YAML de schema produzidos na Iteração 8.6 (`LEGAL_LOCAL_SCHEMA_DRAFTS_8_6.md`). Valida consistência estrutural, completude de campos críticos, coerência dos enums, aplicação das regras cross-entity, preservação do firewall jurídico e ausência de autoridade operacional implícita.

**Esta QA não modifica nenhum arquivo YAML de schema.**

**Esta QA não cria banco, tabela, migration, conector ativo, RAG, embedding ou conteúdo jurídico.**

Caso seja identificado FAIL, a próxima iteração será `8.6B — Local Schema Patch` antes do `8.7 — Migration Design`.

---

## 2. QA Mode

| campo | valor |
|---|---|
| qa_mode | local_schema_review_only |
| schema_files_modified | 0 |
| schema_files_created | 0 |
| database_created | false |
| migrations_created | false |
| connectors_active | 0 |
| legal_content_fetched | 0 |
| legal_documents_ingested | 0 |
| RAG_updates | 0 |
| embeddings_created | 0 |
| active | false |
| operational_authority | none |

---

## 3. Files Reviewed

| file | exists? | status | implementation_status | database_table_created | migration_created | operational_use | result |
|---|---|---|---|---|---|---|---|
| `legal_source_snapshot.schema.yaml` | SIM | draft_non_operational | not_implemented | false | false | prohibited | PASS |
| `legal_source_metadata.schema.yaml` | SIM | draft_non_operational | not_implemented | false | false | prohibited | PASS |
| `legal_connector_log.schema.yaml` | SIM | draft_non_operational | not_implemented | false | false | prohibited | PASS |
| `legal_quarantine_record.schema.yaml` | SIM | draft_non_operational | not_implemented | false | false | prohibited | PASS |
| `legal_validation_record.schema.yaml` | SIM | draft_non_operational | not_implemented | false | false | prohibited | PASS |
| `legal_conflict_record.schema.yaml` | SIM | draft_non_operational | not_implemented | false | false | prohibited | PASS |
| `legal_rag_index_manifest.schema.yaml` | SIM | draft_non_operational | not_implemented | false | false | prohibited | PASS |
| `legal_schema_enums.yaml` | SIM | draft_non_operational | not_implemented | — | — | — | PASS |
| `legal_schema_cross_entity_rules.yaml` | SIM | draft_non_operational | not_implemented | — | — | — | PASS |
| `LEGAL_SCHEMA_MANIFEST_8_6.yaml` | SIM | draft_non_operational | not_implemented | false | false | — | PASS |

**Todos os 10 arquivos existem com os campos de status obrigatórios corretos.**

---

## 4. 8.5A Review Resolution Verification

| review_id | expected_fix | found? | result | notes |
|---|---|---|---|---|
| REVIEW-01 | `fetched_at` em `legal_source_metadata` (required:true) | SIM — linha 136 | PASS | required:true, nullable:false, critical_field:true |
| REVIEW-02 | `official_source` em `legal_source_metadata` (required:true) | SIM — linha 151 | PASS | required:true, derivação de authority_level documentada |
| REVIEW-03 | `chain_of_custody_id` em `legal_quarantine_record` (nullable:true) | SIM — linha 53 | PASS | review_resolved:REVIEW-03, regra de bloqueio de promoção documentada |
| REVIEW-04 | `access_risk_at_collection` em `legal_connector_log` (required:true) | SIM — linha 199 | PASS | CONN-001:high, CONN-002:medium carryover 8.4C registrado |
| REVIEW-05 | `validation_status` com 12 valores em catálogo master | SIM — 12 valores confirmados | PASS | Valores: not_started, pending, failed, fetched_unvalidated, parsed_unvalidated, passed_technical_only, validated_snapshot, human_review_required, human_reviewed, rejected, deprecated, conflict_blocked |
| REVIEW-06 | REGRA-05 com precisão de índices e condições bloqueadas | SIM — REGRA-05 reformulada | PASS | IDX-004/005 explícitos. IDX-003 permitido com aviso. Relação com allowed_use documentada. Ver OBS-01 abaixo. |
| REVIEW-07 | REGRA-11: TRUST-2→TRUST-3 via novo snapshot oficial primário | SIM — REGRA-11 criada | PASS | 6 condições formalizadas, metadado permanece TRUST-2, novo snapshot nasce TRUST-3 |
| REVIEW-08 | REGRA-12: `active_operational` proibido enquanto `active:false` | SIM — REGRA-12 criada | PASS | Guard em enums.yaml, connector_log, e regras cross-entity |

**8/8 REVIEWs verificados: todos PASS.**

---

## 5. Entity Schema QA

---

### Entity: `legal_source_snapshot`

| verificação | presente? | detalhes | resultado |
|---|---|---|---|
| 7 campos críticos 8.4D | SIM | source_url, authority_level, official_source, fetched_at, raw_content_hash, validation_status, chain_of_custody_id — todos required:true | PASS |
| trust_class | SIM | enum_ref:trust_class, default:TRUST-1 (quarantine_by_default) | PASS |
| quarantine_status | SIM | enum_ref:quarantine_status, consistência com trust_class documentada | PASS |
| authority_level | SIM | integer 1–7, validação authority_level:7 = TRUST-1 máximo | PASS |
| official_source | SIM | boolean, required:true | PASS |
| fetched_at | SIM | ISO8601_datetime, required:true, UTC obrigatório | PASS |
| raw_content_hash | SIM | SHA256/SHA512, critical_field:true, ausência bloqueia TRUST-4 | PASS |
| validation_status | SIM | enum_ref:validation_status, default:fetched_unvalidated | PASS |
| stale_risk | SIM | enum_ref:stale_risk, stale_risk:critical bloqueia IDX-004/005 documentado | PASS |
| conflict_status | SIM | enum_ref:conflict_status, ausência = padrão unknown = conflict_detected | PASS |
| allowed_use / prohibited_use | SIM | all 9 prohibited_use values no default, invariante documentado | PASS |
| chain_of_custody_id | SIM | required:true, nullable:false, ausência força TRUST-0 | PASS |
| impede TRUST-4 sem checksum | SIM | validation_rule explícita, if_missing registra anomalia crítica | PASS |
| não cria uso operacional | SIM | operational_use:prohibited, descrição: FIELD DEFINED ≠ DATA INGESTED | PASS |

**Resultado: PASS**

---

### Entity: `legal_source_metadata`

| verificação | presente? | detalhes | resultado |
|---|---|---|---|
| `fetched_at` (REVIEW-01) | SIM | required:true, nullable:false, critical_field:true | PASS |
| `official_source` (REVIEW-02) | SIM | required:true, default:false, derivação documentada | PASS |
| `metadata_confidence` | SIM | enum [high, medium, low, unknown], validação aggregator → max low | PASS |
| `stale_risk` | SIM | revoked_status:unknown → stale_risk:high mínimo documentado | PASS |
| `conflict_status` | SIM | conflict_detected cria conflict_record, bloqueia conclusão | PASS |
| `validation_status` | SIM | enum_ref:validation_status (12 valores master), REVIEW-05 resolvido | PASS |
| metadado ≠ texto primário | SIM | description e special_rules explícitos | PASS |
| LexML como locator | SIM | metadata_source_type:official_metadata documentado como não corpus normativo | PASS |

**Resultado: PASS**

**OBS não-bloqueadora:** O campo `authority_level` em `legal_source_metadata` é derivado da fonte dos metadados (não do documento em si), o que é distinto de `legal_source_snapshot.authority_level` (da fonte do conteúdo). Esta distinção semântica está implícita mas não explicitamente documentada no schema. Recomendado clarificar em 8.7.

---

### Entity: `legal_connector_log`

| verificação | presente? | detalhes | resultado |
|---|---|---|---|
| `access_risk_at_collection` (REVIEW-04) | SIM | required:true, default:unknown, carryover 8.4C documentado | PASS |
| `operation_mode` | SIM | enum [dry_run, preflight, non_operational_test, operational], guard para 'operational' | PASS |
| robots/terms status | SIM | robots_status_at_request e terms_review_status_at_request presentes | PASS |
| `legal_content_fetched` | SIM | default:false, proibido enquanto connector planned_only/blocked | PASS |
| `RAG_updated` | SIM | default:false, true = violação de firewall documentado | PASS |
| `embeddings_created` | SIM | default:false, true PROIBIDO nesta fase | PASS |
| bloqueia planned_only | SIM | validation_rule em operation_mode e legal_content_fetched | PASS |
| abort/backoff para 403/429/5xx | SIM | response_status_code validation_rule + backoff_applied | PASS |
| guard active_operational | SIM | validation_rule em operation_mode: "operational PROIBIDO" + referência ao enum guard | PASS |

**Resultado: PASS**

---

### Entity: `legal_quarantine_record`

| verificação | presente? | detalhes | resultado |
|---|---|---|---|
| `chain_of_custody_id` (REVIEW-03) | SIM | review_resolved:REVIEW-03, TRUST-0:null esperado, TRUST-1:null bloqueia promoção | PASS |
| `contamination_vector` | SIM | 9 valores incluindo connector_bypass (escalada fw-governor) | PASS |
| `quarantine_reason` | SIM | 14 valores incluindo connector_high_risk e restricted_review_required | PASS |
| `missing_provenance_fields` | SIM | array_string dos campos críticos ausentes | PASS |
| `inherited_connector_risk` | SIM | carryover 8.4C documentado | PASS |
| bloqueio sem cadeia de custódia | SIM | TRUST-1 com chain_of_custody_id:null → promotion_possible:false | PASS |
| impede RAG/memória | SIM | prohibited_use: todos 9 valores, special_rules explícitas | PASS |

**Resultado: PASS**

---

### Entity: `legal_validation_record`

| verificação | presente? | detalhes | resultado |
|---|---|---|---|
| distinção técnica vs. humana | SIM | validation_type e validator_type com valores separados | PASS |
| `trust_class_before` / `trust_class_after` | SIM | ambos required:true, rejeitar sem referência | PASS |
| `promotion_decision` | SIM | enum [promoted, rejected, deferred, requires_human_review] | PASS |
| `human_review_required` | SIM | default:true (conservador) | PASS |
| impede TRUST-5 sem humano | SIM | validation_rule: TRUST-5 exige validator_type IN [human_operator, human_lawyer] | PASS |

**Resultado: PASS**

---

### Entity: `legal_conflict_record`

| verificação | presente? | detalhes | resultado |
|---|---|---|---|
| conflito bloqueia conclusão | SIM | legal_conclusion_allowed:false por padrão | PASS |
| `legal_conclusion_allowed` | SIM | default:false, só muda para true após resolução documentada + validação humana | PASS |
| `severity` | SIM | enum [low, medium, high, critical, blocking], blocking = escalada fw-governor | PASS |
| `required_action` | SIM | default [verify_primary_source, human_review] | PASS |
| cobre tipos do protocolo 8.2B | SIM | T-01 a T-08 + parser_conflict + unknown | PASS |

**Resultado: PASS**

---

### Entity: `legal_rag_index_manifest`

| verificação | presente? | detalhes | resultado |
|---|---|---|---|
| 5 índices futuros | SIM | IDX-001 a IDX-005 em planned_indexes | PASS |
| TRUST-0/1 bloqueados em RAG validado | SIM | prohibited_trust_classes em IDX-004 e IDX-005, REGRA-08 | PASS |
| TRUST-2 apenas metadata | SIM | IDX-002: allowed_trust_classes:[TRUST-2] | PASS |
| TRUST-3 apenas staging | SIM | IDX-003: allowed_trust_classes:[TRUST-3] | PASS |
| TRUST-4 corpus validado | SIM | IDX-004: allowed_trust_classes:[TRUST-4] | PASS |
| TRUST-5 corpus humano | SIM | IDX-005: allowed_trust_classes:[TRUST-5] | PASS |
| RAG manifest ≠ RAG update | SIM | Descrição e notes explícitos | PASS |

**Resultado: PASS**

---

## 6. Enum QA

| enum_name | values_count | required_values_present? | dangerous_value_guarded? | result | notes |
|---|---|---|---|---|---|
| `trust_class` | 6 | SIM (TRUST-0 a TRUST-5) | N/A | PASS | Cada valor com allowed_use e promotion_possible documentados |
| `quarantine_status` | 7 | SIM | N/A | PASS | Mapeamento direto para trust_class |
| `authority_level` | 7 (int 1–7) | SIM | N/A | PASS | derivation_rule: official_source de authority_level documentada |
| `validation_status` | **12** | SIM — todos 12 presentes | N/A | PASS | conflict_blocked, human_review_required, fetched_unvalidated, parsed_unvalidated: todos presentes |
| `stale_risk` | 5 | SIM | blocks_corpus:true em critical | PASS | blocker_rule explícita: critical bloqueia IDX-004/005 |
| `conflict_status` | 5 | SIM | legal_conclusion_allowed:false em conflict_detected, unknown, conflict_under_review | PASS | unknown tratado como conflict_detected por precaução |
| `allowed_use` | 7 | SIM | future_human_reviewed_use exige TRUST-5 | PASS | Mapeamento de trust_class_minimum por valor |
| `prohibited_use` | **9** | SIM | Todos os 9 values presentes | PASS | legal_advice, procedural_deadline, protocolable_piece, legal_strategy, rights_confirmation, victory_probability, damages_calculation, RAG_validated_index, operational_memory |
| `connector_status` | 8 | SIM | **active_operational: guard PROIBIDO no estado atual** | PASS | Guard documentado: lista 5 pré-requisitos para active_operational em fase futura. CONN-001:blocked, CONN-002:review_required no current_state |

**Todos os 9 enums: PASS.**

**Confirmação REVIEW-05:** `validation_status` contém exatamente 12 valores — verificado por contagem direta.

**Confirmação REVIEW-08:** `connector_status.active_operational` existe no enum mas é marcado `guard:PROHIBITED_CURRENT_STATE` com guard_condition e guard_action documentados.

---

## 7. Cross-Entity Rules QA

| rule_id | present? | enforceability_clear? | bypass_risk? | result | notes |
|---|---|---|---|---|---|
| REGRA-01 | SIM | SIM — condition + action + violation_action | Baixo | PASS | metadata_source_type:metadata_only como cláusula de saída válida |
| REGRA-02 | SIM | SIM — enforcement:hard | Baixo | PASS | Sem exceção para qualquer agente |
| REGRA-03 | SIM | SIM — condition + action | Baixo | PASS | Vinculada a REGRA-09 (checksum) |
| REGRA-04 | SIM | SIM — legal_conclusion_allowed:false | Baixo | PASS | Cobre todos os estados de conflito |
| REGRA-05 | SIM | SIM — IDX-004/005 explícitos, IDX-003 com aviso | Baixo | PASS (com OBS-01) | Ver OBS-01: REGRA-05 usa stale_risk:critical corretamente; texto interno menciona conflict_blocked que é semanticamente adjacente |
| REGRA-06 | SIM | SIM — sem exceção para agentes com QA | Baixo | PASS | "O legal-agent verifica a fonte — não confia na classificação do agente remetente" |
| REGRA-07 | SIM | SIM — carryover_from:8.4C documentado | Baixo | PASS | "Nenhum contorno via agente intermediário" explícito |
| REGRA-08 | SIM | SIM — condition + action | Baixo | PASS | Consistente com IDX-001 como único índice que aceita TRUST-0/1 |
| REGRA-09 | SIM | SIM — raw_content_hash IS NULL bloqueia | Baixo | PASS | Vinculada a REGRA-03 |
| REGRA-10 | SIM | SIM — validator_type NOT IN [human_operator, human_lawyer] | Baixo | PASS | "Revisão humana é não-automatizável" explícito |
| REGRA-11 | SIM | SIM — 6 condições, prerequisites documentados | Baixo | PASS | TRUST-2 permanece como locator histórico — apenas novo snapshot nasce TRUST-3 |
| REGRA-12 | SIM | SIM — condition explícita, guard_action reporta fw-governor | Baixo | PASS | Todos os conectores atuais em planned_only/blocked/review_required — active_operational inacessível |

**Todas as 12 regras: PASS.**

---

## 8. Safety Leak QA

| leak_type | found? | file_if_found | severity | result | notes |
|---|---|---|---|---|---|
| connector active | NÃO | — | — | PASS | `active_operational` aparece em 4 arquivos mas sempre em contexto de proibição/guard |
| active_operational como permitido agora | NÃO | — | — | PASS | Todos os contextos são: "PROIBIDO no estado atual", REGRA-12, guard_action |
| database_table_created:true | NÃO | — | — | PASS | Todos os schemas: false |
| migration_created:true | NÃO | — | — | PASS | Todos os schemas: false |
| autoriza legal_advice | NÃO | — | — | PASS | prohibited_use inclui legal_advice em todos os schemas |
| autoriza prazo processual | NÃO | — | — | PASS | prohibited_use inclui procedural_deadline em todos os schemas |
| autoriza peça protocolável | NÃO | — | — | PASS | prohibited_use inclui protocolable_piece |
| autoriza estratégia | NÃO | — | — | PASS | prohibited_use inclui legal_strategy |
| autoriza confirmação de direitos | NÃO | — | — | PASS | prohibited_use inclui rights_confirmation |
| autoriza cálculo indenizatório | NÃO | — | — | PASS | prohibited_use inclui damages_calculation |
| autoriza RAG update | NÃO | — | — | PASS | RAG_updates:0 invariante, RAG_updated:false em connector_log |
| autoriza embeddings | NÃO | — | — | PASS | embeddings_created:0 invariante, embeddings_created:false em connector_log |

**Resultado Safety Leak QA: PASS — nenhum vazamento de segurança detectado.**

**Nota sobre active_operational:** Os 4 arquivos que contêm "active_operational" são:
1. `legal_schema_enums.yaml` — valor documentado com `guard:PROHIBITED_CURRENT_STATE`
2. `legal_schema_cross_entity_rules.yaml` — REGRA-12 proibe explicitamente
3. `LEGAL_SCHEMA_MANIFEST_8_6.yaml` — referência em lista de regras e REVIEWs
4. `legal_source_snapshot.schema.yaml` — validation_rule: "active_operational PROIBIDO no estado atual"

Nenhum destes contextos autoriza o uso. Todos reforçam a proibição.

---

## 9. Manifest QA

Verificação de `LEGAL_SCHEMA_MANIFEST_8_6.yaml`:

| verificação | resultado | valor encontrado |
|---|---|---|
| lista todos os 7 schemas de entidade | PASS | legal_source_snapshot, legal_source_metadata, legal_connector_log, legal_quarantine_record, legal_validation_record, legal_conflict_record, legal_rag_index_manifest |
| lista enums_file | PASS | "legal_schema_enums.yaml" |
| lista cross_entity_rules_file | PASS | "legal_schema_cross_entity_rules.yaml" |
| lista documentos-base | PASS | 7 documentos listados |
| lista 8 REVIEWs resolvidos | PASS | REVIEW-01 a REVIEW-08 todos listados |
| implementation_status:not_implemented | PASS | declarado |
| database_created:false | PASS | declarado |
| migrations_created:false | PASS | declarado |
| legal_content_fetched:0 | PASS | declarado |
| legal_documents_ingested:0 | PASS | declarado |
| RAG_updates:0 | PASS | declarado |
| embeddings_created:0 | PASS | declarado |
| active:false | PASS | declarado |
| operational_authority:none | PASS | declarado |

**Resultado Manifest QA: PASS**

**OBS não-bloqueadora (OBS-02):** O manifest declara `legal_rag_index_manifest.fields_total:17` e `legal_connector_log.fields_total:28`. Contagem direta nos arquivos indica respectivamente ~18 e ~29 campos (dependendo de como se conta campos de seção `planned_indexes` vs. campos formais). Discrepância menor de contagem — não afeta funcionalidade do design. Recomendado ajuste de contagem em 8.7.

---

## 10. QA Summary

| qa_area | result | patch_required | notes |
|---|---|---|---|
| File existence | PASS | NÃO | 10/10 arquivos presentes |
| 8.5A review resolution | PASS | NÃO | 8/8 REVIEWs verificados e confirmados |
| Entity schemas (7) | PASS | NÃO | Todos os 7 com campos críticos, firewalls e invariantes |
| Enums (9) | PASS | NÃO | validation_status:12 valores ✓, active_operational guarded ✓, prohibited_use:9 valores ✓ |
| Cross-entity rules (12) | PASS | NÃO | REGRA-01 a REGRA-12 todas presentes e com enforcement:hard |
| Safety leak | PASS | NÃO | Nenhum vazamento de autoridade operacional, legal advice, RAG ou embedding |
| Manifest | PASS | NÃO | Completo, todos os invariants declarados |
| Operational state preservation | PASS | NÃO | active:false, operational_authority:none, connectors_active:0, legal_content_fetched:0 |

**Observações não-bloqueadoras registradas:**

| obs_id | descrição | área | severidade |
|---|---|---|---|
| OBS-01 | REGRA-05 description menciona `conflict_blocked` como validation_status para stale_risk:critical, mas conflict_blocked é semanticamente para conflitos de fonte. Para stale_risk puro (sem conflito), human_review_required seria mais preciso. O condition/action da REGRA-05 está correto — é apenas a redação da description que é imprecisa. | cross_entity_rules | Mínima |
| OBS-02 | Discrepâncias menores de contagem de campos no manifest: legal_rag_index_manifest declarado como 17 campos (possível contagem ~18), legal_connector_log declarado como 28 (possível contagem ~29). Não afeta funcionalidade. | manifest | Mínima |
| OBS-03 | legal_source_metadata.authority_level documenta a autoridade da **fonte dos metadados** (não do documento normativo em si). Esta distinção semântica está implícita mas poderia ser mais explícita para evitar confusão em implementação. | entity schema | Mínima |

---

## 11. Findings

### Resultado geral

**0 FAIL — 0 REVIEW bloqueante — 3 OBS mínimas não-bloqueadoras**

Todos os schemas locais estão estruturalmente corretos e consistentes com:
- O design formal da Iteração 8.5
- Os 8 REVIEWs incorporados da Iteração 8.5A
- O firewall de 6 trust classes da Iteração 8.4D
- Os 12 cenários de contaminação da Iteração 8.4E
- O carryover de risco CONN-001/002 da Iteração 8.4C
- A política de stale_risk e atualização
- O protocolo de resolução de conflitos

**Declaração formal:**

`local_schema_files_ready_for_migration_design` (com 3 observações mínimas não-bloqueadoras para incorporar opcionalmente em 8.7)

As 3 OBS não impedem progressão para 8.7 (Migration Design). São melhorias de clareza documental que podem ser endereçadas durante o design de migrations sem necessidade de patch separado.

**Patch:** não necessário. Iteração 8.6B não é obrigatória.

---

## 12. Result

| campo | valor |
|---|---|
| iteration_status | completed |
| qa_status | completed_local_schema_review |
| local_schema_result | **ready_with_non_blocking_reviews** |
| obs_items | 3 mínimas (OBS-01, OBS-02, OBS-03) |
| fail_items | 0 |
| patch_required | false |
| schema_files_modified | 0 |
| schema_files_created | 0 |
| database_created | false |
| migrations_created | false |
| legal_content_fetched | 0 |
| legal_documents_ingested | 0 |
| RAG_updates | 0 |
| embeddings_created | 0 |
| agent_activation | unchanged — active:false |
| operational_authority | unchanged — none |

**Próximas iterações elegíveis** (nenhuma sem aprovação do operador primário):

| Iteração | Descrição | Pré-requisito |
|---|---|---|
| 8.7 | Migration Design — desenhar migrations formais sem executar | Aprovação do operador |
| 8.4C-follow | Investigação manual CONN-001/CONN-002 via navegador | Ação humana direta |

**Iteração 8.6B não é necessária** — nenhum FAIL detectado.

---

*Documento criado em 2026-06-10 como parte da Iteração 8.6A.*
*Nenhum schema modificado. Nenhum banco criado. Nenhuma migration criada.*
*Nenhum dado jurídico acessado. Nenhum RAG atualizado. Nenhum embedding gerado.*
*active:false / operational_authority:none / connectors_active:0 — inalterados.*
*LOCAL SCHEMA QA ≠ SCHEMA PATCH. YAML REVIEW ≠ YAML MODIFICATION.*
