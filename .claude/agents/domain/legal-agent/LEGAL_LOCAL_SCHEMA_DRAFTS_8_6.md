---
iteration: "8.6"
title: "Legal Local Schema Drafts"
parent_iteration: "8.5 / 8.5A"
design_mode: local_schema_files_only
database_created: false
migrations_created: false
connectors_active: 0
legal_content_fetched: 0
active: false
operational_authority: none
created_at: "2026-06-10"
event_id: "EVT-20260610-054"
review_items_resolved: "8/8"
---

# LEGAL_LOCAL_SCHEMA_DRAFTS_8_6

Iteração 8.6 — Materialização dos schemas locais do sistema `legal-agent` em arquivos YAML de design.

---

## 1. Purpose

Esta iteração materializa em arquivos YAML locais o design formal produzido na Iteração 8.5 (`LEGAL_SNAPSHOT_SCHEMA_DESIGN_8_5.md`), incorporando obrigatoriamente todos os 8 itens de revisão identificados pela QA da Iteração 8.5A (`LEGAL_SCHEMA_QA_REVIEW_8_5A.md`).

**O que esta iteração faz:**

- Cria arquivos YAML locais de schema para cada entidade
- Define formalmente cada campo com tipo, obrigatoriedade, regras de validação e notas de segurança
- Formaliza as 9 enumerações do sistema com valores completos
- Documenta 12 regras de integridade cross-entity
- Resolve os 8 REVIEWs da QA anterior

**O que esta iteração NÃO faz:**

- Não cria banco de dados, tabela, migration ou schema executável
- Não ativa conector, não consulta API, não faz request externo
- Não baixa lei, norma, jurisprudência, artigo, doutrina ou processo
- Não atualiza RAG, não gera embeddings, não ingere conteúdo jurídico
- Não altera `active:false` nem `operational_authority:none`
- Não modifica outros agentes ou skills

**Invariantes mantidos:**

| Invariante | Status |
|---|---|
| LOCAL SCHEMA FILE ≠ DATABASE TABLE | Mantido |
| YAML/JSON DRAFT ≠ MIGRATION | Mantido |
| SCHEMA FILE CREATED ≠ SCHEMA EXECUTED | Mantido |
| FIELD DEFINED ≠ DATA INGESTED | Mantido |
| CONNECTOR STATUS FIELD ≠ CONNECTOR ACTIVE | Mantido |
| TRUST CLASS FIELD ≠ TRUSTED CORPUS | Mantido |
| VALIDATION STATUS FIELD ≠ HUMAN VALIDATION | Mantido |
| STALE_RISK FIELD ≠ VIGÊNCIA CONFIRMADA | Mantido |
| RAG MANIFEST FILE ≠ RAG UPDATE | Mantido |
| AGENTE INATIVO ≠ AGENTE OPERACIONAL | Mantido |

---

## 2. Source Basis

| Documento | Função |
|---|---|
| `LEGAL_SNAPSHOT_SCHEMA_DESIGN_8_5.md` | Design formal das 7 entidades — base principal desta iteração |
| `LEGAL_SCHEMA_QA_REVIEW_8_5A.md` | QA do design — 8 REVIEWs a incorporar obrigatoriamente |
| `LEGAL_KNOWLEDGE_FIREWALL_8_4D.md` | 7 campos críticos de proveniência, 6 trust classes, firewalls |
| `LEGAL_CROSS_AGENT_CONTAMINATION_QA_8_4E.md` | 12 cenários de contaminação, regras cross-agent |
| `LEGAL_CONNECTOR_TERMS_ROBOTS_REVIEW_8_4C.md` | Carryover de risco CONN-001/CONN-002 para campos de conector |
| `LEGAL_UPDATE_POLICY.md` | Políticas de stale_risk e atualização de corpus |
| `LEGAL_CONFLICT_RESOLUTION_PROTOCOL.md` | 8 tipos de conflito T-01 a T-08 para conflict_record |

---

## 3. Review Items Incorporated

Todos os 8 REVIEWs da QA 8.5A foram incorporados nos arquivos de schema desta iteração.

| review_id | issue | resolution_applied | file_updated | result |
|---|---|---|---|---|
| REVIEW-01 | `legal_source_metadata` ausente: `fetched_at` (campo crítico 8.4D — quando metadado foi coletado) | Campo `fetched_at` adicionado como `required: true, nullable: false`. Regra: sem fetched_at não pode progredir além de pending. | `legal_source_metadata.schema.yaml` | PASS |
| REVIEW-02 | `legal_source_metadata` ausente: `official_source` (campo crítico 8.4D — booleano explícito de oficialidade) | Campo `official_source` adicionado como `required: true, nullable: false`. Derivação: `true se authority_level IN [1..6]`. | `legal_source_metadata.schema.yaml` | PASS |
| REVIEW-03 | `legal_quarantine_record` ausente: `chain_of_custody_id` (registro não auto-suficiente para auditoria) | Campo `chain_of_custody_id` adicionado como `required: false, nullable: true`. TRUST-1 com null bloqueia promoção. | `legal_quarantine_record.schema.yaml` | PASS |
| REVIEW-04 | `legal_connector_log` ausente: `access_risk_at_collection` (nível de risco não registrado por operação) | Campo `access_risk_at_collection` adicionado como `required: true`. CONN-001=high, CONN-002=medium (8.4C carryover). | `legal_connector_log.schema.yaml` | PASS |
| REVIEW-05 | `legal_source_metadata.validation_status` inline enum com 7 valores vs. master §12 com 12 valores | `validation_status` em `legal_source_metadata` agora usa `enum_ref: validation_status` (master completo de 12 valores). Valores adicionados: fetched_unvalidated, parsed_unvalidated, human_review_required, conflict_blocked. | `legal_source_metadata.schema.yaml`, `legal_schema_enums.yaml` | PASS |
| REVIEW-06 | REGRA-05 em special_rules menos precisa que REGRA formal — não especifica índices bloqueados | REGRA-05 reformulada em `legal_schema_cross_entity_rules.yaml` com precisão: stale_risk:critical bloqueia IDX-004/IDX-005 explicitamente. IDX-003 permitido com aviso. Relação com validation_status e allowed_use documentada. | `legal_schema_cross_entity_rules.yaml` | PASS |
| REVIEW-07 | Caminho de promoção TRUST-2→TRUST-3 não formalizado como regra no schema | REGRA-11 criada em `legal_schema_cross_entity_rules.yaml`: promoção via novo snapshot oficial primário, não via elevação do metadado. 5 pré-requisitos formalizados. | `legal_schema_cross_entity_rules.yaml` | PASS |
| REVIEW-08 | `connector_status:active_operational` sem guard explícito de aprovação | REGRA-12 criada. Guard documentado em `legal_schema_enums.yaml` (connector_status), `legal_connector_log.schema.yaml` (campo operation_mode), e `legal_schema_cross_entity_rules.yaml` (REGRA-12). | `legal_schema_enums.yaml`, `legal_connector_log.schema.yaml`, `legal_schema_cross_entity_rules.yaml` | PASS |

**Todos os 8 REVIEWs: PASS.**

---

## 4. Schema Files Created

Diretório: `.claude/agents/domain/legal-agent/schemas/`

| # | Arquivo | Tipo | Status |
|---|---|---|---|
| 1 | `legal_source_snapshot.schema.yaml` | Entity schema | draft_non_operational |
| 2 | `legal_source_metadata.schema.yaml` | Entity schema | draft_non_operational |
| 3 | `legal_connector_log.schema.yaml` | Entity schema | draft_non_operational |
| 4 | `legal_quarantine_record.schema.yaml` | Entity schema | draft_non_operational |
| 5 | `legal_validation_record.schema.yaml` | Entity schema | draft_non_operational |
| 6 | `legal_conflict_record.schema.yaml` | Entity schema | draft_non_operational |
| 7 | `legal_rag_index_manifest.schema.yaml` | Entity schema | draft_non_operational |
| 8 | `legal_schema_enums.yaml` | Enum catalog | draft_non_operational |
| 9 | `legal_schema_cross_entity_rules.yaml` | Cross-entity rules | draft_non_operational |
| 10 | `LEGAL_SCHEMA_MANIFEST_8_6.yaml` | Manifest | draft_non_operational |

---

## 5. Entity Summary

| entity_name | schema_file | fields_count | required_fields | key_firewall_fields | result |
|---|---|---|---|---|---|
| `legal_source_snapshot` | `legal_source_snapshot.schema.yaml` | 31 | 21 | source_url, authority_level, official_source, fetched_at, raw_content_hash, validation_status, chain_of_custody_id | PASS |
| `legal_source_metadata` | `legal_source_metadata.schema.yaml` | 30 | 18 | fetched_at (REVIEW-01), official_source (REVIEW-02), authority_level, validation_status (12v) | PASS |
| `legal_connector_log` | `legal_connector_log.schema.yaml` | 29 | 23 | access_risk_at_collection (REVIEW-04), robots_status_at_request, terms_review_status_at_request, legal_content_fetched, RAG_updated | PASS |
| `legal_quarantine_record` | `legal_quarantine_record.schema.yaml` | 23 | 13 | chain_of_custody_id (REVIEW-03), initial_trust_class, promotion_possible, contamination_vector | PASS |
| `legal_validation_record` | `legal_validation_record.schema.yaml` | 20 | 16 | trust_class_before, trust_class_after, validator_type, checks_performed, checks_failed | PASS |
| `legal_conflict_record` | `legal_conflict_record.schema.yaml` | 17 | 13 | legal_conclusion_allowed (default false), severity, resolution_status | PASS |
| `legal_rag_index_manifest` | `legal_rag_index_manifest.schema.yaml` | 18 | 12 | allowed_trust_classes, prohibited_trust_classes, stale_risk_policy, quarantine_policy | PASS |

---

## 6. Enum Summary

| enum_id | valores | observação |
|---|---|---|
| `trust_class` | 6 | TRUST-0 a TRUST-5. TRUST-0 e TRUST-1 quarentenados por padrão. |
| `quarantine_status` | 7 | Mapeado para trust_class. not_applicable para campos não relevantes. |
| `authority_level` | 7 (int 1–7) | 1 = mais autoritativa. 7 = auxiliar = trust_class máximo TRUST-1. |
| `validation_status` | **12** | REVIEW-05 resolvido: adicionados fetched_unvalidated, parsed_unvalidated, human_review_required, conflict_blocked. |
| `stale_risk` | 5 | critical = bloqueia IDX-004/005 (REGRA-05). unknown = tratar como high. |
| `conflict_status` | 5 | conflict_detected = legal_conclusion_allowed:false + conflict_record obrigatório. |
| `allowed_use` | 7 | Determinado por trust_class. none para TRUST-0. |
| `prohibited_use` | 9 | Invariante: legal_advice e procedural_deadline sempre presentes. |
| `connector_status` | 8 | REVIEW-08 resolvido: active_operational com guard explícito de proibição no estado atual. |

**Confirmação REVIEW-05:** `validation_status` contém os 12 valores completos:
`not_started`, `pending`, `failed`, `fetched_unvalidated`, `parsed_unvalidated`, `passed_technical_only`, `validated_snapshot`, `human_review_required`, `human_reviewed`, `rejected`, `deprecated`, `conflict_blocked`

---

## 7. Cross-Entity Rules Summary

| regra | descrição | enforcement | review |
|---|---|---|---|
| REGRA-01 | Metadata → snapshot ou metadata_only | hard | — |
| REGRA-02 | TRUST-0/1 → quarantine_record obrigatório | hard | — |
| REGRA-03 | TRUST-4 → validation_record obrigatório | hard | — |
| REGRA-04 | conflict_detected → conflict_record obrigatório | hard | — |
| REGRA-05 | stale_risk:critical bloqueia IDX-004/005; IDX-003 com aviso | hard | REVIEW-06 |
| REGRA-06 | Conteúdo de outro agente → TRUST-1 imediato | hard | — |
| REGRA-07 | CONN-001/002 herdam status 8.4C → TRUST-1 max | hard | — |
| REGRA-08 | RAG validado recusa TRUST-0/1 | hard | — |
| REGRA-09 | TRUST-4 exige checksum verificado | hard | — |
| REGRA-10 | TRUST-5 exige revisão humana | hard | — |
| REGRA-11 | TRUST-2→TRUST-3 via novo snapshot oficial primário | hard | REVIEW-07 |
| REGRA-12 | active_operational proibido enquanto active:false | hard | REVIEW-08 |

**Total: 12 regras (10 originais da 8.5 + REGRA-11 e REGRA-12 adicionadas pela QA 8.5A).**

---

## 8. Operational Safety

Confirmação de todos os invariantes operacionais desta iteração:

| campo | valor esperado | valor real | status |
|---|---|---|---|
| `database_created` | false | false | PASS |
| `migrations_created` | false | false | PASS |
| `connectors_implemented` | 0 | 0 | PASS |
| `connectors_active` | 0 | 0 | PASS |
| `legal_content_fetched` | 0 | 0 | PASS |
| `legal_documents_ingested` | 0 | 0 | PASS |
| `APIs_consulted_for_legal_data` | 0 | 0 | PASS |
| `RAG_updates` | 0 | 0 | PASS |
| `embeddings_created` | 0 | 0 | PASS |
| `active` | false | false | PASS |
| `operational_authority` | none | none | PASS |
| `schema_files_created` | 10 | 10 | PASS |
| `review_items_resolved` | 8/8 | 8/8 | PASS |

---

## 9. Result

| campo | valor |
|---|---|
| iteration_status | completed |
| local_schema_files_status | draft_created |
| schemas_directory | `.claude/agents/domain/legal-agent/schemas/` |
| schema_files_created | 10 (7 entity schemas + enums + cross_entity_rules + manifest) |
| review_items_resolved | 8/8 |
| review_items_fail | 0 |
| database_created | false |
| migrations_created | false |
| connectors_active | 0 |
| legal_content_fetched | 0 |
| active | false |
| operational_authority | unchanged — none |

**Próximas iterações elegíveis** (nenhuma executada sem aprovação explícita do operador primário):

| Iteração | Descrição | Pré-requisito |
|---|---|---|
| 8.6A | Local Schema QA — revisão formal dos arquivos YAML criados | Aprovação do operador |
| 8.7 | Migration Design — desenhar migrations formais sem executar | 8.6A completa + aprovação |

---

*Documento criado em 2026-06-10 como parte da Iteração 8.6.*
*Nenhum banco criado. Nenhuma migration criada. Nenhum dado jurídico acessado.*
*Nenhum conteúdo ingerido. Nenhum RAG alimentado. Nenhum embedding gerado.*
*active:false / operational_authority:none / connectors_active:0 — inalterados.*
*LOCAL SCHEMA FILE ≠ DATABASE TABLE. YAML DRAFT ≠ MIGRATION. SCHEMA CRIADO ≠ SCHEMA EXECUTADO.*
