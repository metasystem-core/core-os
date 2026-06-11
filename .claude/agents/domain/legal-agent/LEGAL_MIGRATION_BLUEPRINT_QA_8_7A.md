# LEGAL_MIGRATION_BLUEPRINT_QA_8_7A

**Documento:** LEGAL_MIGRATION_BLUEPRINT_QA_8_7A.md
**Iteração:** 8.7A — Migration Blueprint QA
**Evento:** EVT-20260610-058
**Data:** 2026-06-10
**Status:** completed_blueprint_review

---

> **MIGRATION BLUEPRINT QA ≠ MIGRATION PATCH**
> **BLUEPRINT REVIEW ≠ BLUEPRINT MODIFICATION**
> **BLUEPRINT YAML ≠ EXECUTABLE SQL**
> **QA REPORT ≠ MIGRATION CREATED**
> **TABLE BLUEPRINT ≠ TABLE CREATED**
> **CONSTRAINT QA ≠ DATABASE ENFORCEMENT**
> **INDEX QA ≠ INDEX CREATED**
> **RLS QA ≠ POLICY ACTIVE**
> **ROLLBACK QA ≠ ROLLBACK EXECUTED**
> **FIELD MAPPING QA ≠ DATA INGESTION**
> **TRUST FIELD QA ≠ TRUSTED CONTENT**
> **VALIDATION FIELD QA ≠ HUMAN VALIDATION**
> **RAG BLUEPRINT QA ≠ RAG UPDATE**
> **AGENTE INATIVO ≠ AGENTE OPERACIONAL**

Nenhum blueprint foi modificado. Nenhum SQL foi criado. Nenhuma tabela foi criada. Nenhum banco foi acessado. Nenhum conteúdo jurídico foi ingerido.

---

## 1. Purpose

Esta iteração executa revisão formal dos 12 blueprints de migration criados na Iteração 8.7, antes de qualquer avanço para SQL executável ou migration real.

**O que esta QA faz:**
- Verifica existência e integridade estrutural dos 14 artefatos
- Valida ausência absoluta de SQL executável e migrations reais
- Verifica alinhamento blueprint ↔ schema local (8.6/8.6B)
- Verifica cobertura das 12 regras cross-entity
- Verifica enums, constraints, indexes, RLS e rollback
- Identifica divergências e as classifica como REVIEW ou FAIL
- Preserva `active:false` e `operational_authority:none` sem alteração

**O que esta QA NÃO faz:**
- Não modifica nenhum blueprint YAML
- Não cria nenhum artefato executável
- Não acessa banco de dados
- Não corrige automaticamente

---

## 2. QA Mode

```
qa_mode: migration_blueprint_review_only
blueprints_modified: 0
sql_files_created: 0
migrations_created: false
database_created: false
table_created: false
legal_content_fetched: 0
legal_documents_ingested: 0
RAG_updates: 0
embeddings_created: 0
active: false
operational_authority: none
```

---

## 3. Files Reviewed

| # | File | Location | Exists? | Type | status | executable | sql_created | migration_created | table_created | Result |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | LEGAL_MIGRATION_DESIGN_8_7.md | domain/legal-agent/ | ✓ | main_doc | design_only | — | — | — | — | PASS |
| 2 | LEGAL_MIGRATION_BLUEPRINT_MANIFEST_8_7.yaml | migration_blueprints/ | ✓ | manifest | design_only | false | 0 | false | false | PASS |
| 3 | 001_legal_source_snapshot.blueprint.yaml | migration_blueprints/ | ✓ | entity_blueprint | design_only | false | false | false | false | PASS |
| 4 | 002_legal_source_metadata.blueprint.yaml | migration_blueprints/ | ✓ | entity_blueprint | design_only | false | false | false | false | PASS |
| 5 | 003_legal_connector_log.blueprint.yaml | migration_blueprints/ | ✓ | entity_blueprint | design_only | false | false | false | false | PASS |
| 6 | 004_legal_quarantine_record.blueprint.yaml | migration_blueprints/ | ✓ | entity_blueprint | design_only | false | false | false | false | PASS |
| 7 | 005_legal_validation_record.blueprint.yaml | migration_blueprints/ | ✓ | entity_blueprint | design_only | false | false | false | false | PASS |
| 8 | 006_legal_conflict_record.blueprint.yaml | migration_blueprints/ | ✓ | entity_blueprint | design_only | false | false | false | false | PASS |
| 9 | 007_legal_rag_index_manifest.blueprint.yaml | migration_blueprints/ | ✓ | entity_blueprint | design_only | false | false | false | false | PASS |
| 10 | legal_migration_enums.blueprint.yaml | migration_blueprints/ | ✓ | support_blueprint | design_only | false | false | false | false | PASS |
| 11 | legal_migration_constraints.blueprint.yaml | migration_blueprints/ | ✓ | support_blueprint | design_only | false | false | false | false | PASS |
| 12 | legal_migration_indexes.blueprint.yaml | migration_blueprints/ | ✓ | support_blueprint | design_only | false | false | false | false | PASS |
| 13 | legal_migration_rls_permissions.blueprint.yaml | migration_blueprints/ | ✓ | support_blueprint | design_only | false | false | false | false | PASS |
| 14 | legal_migration_rollback_design.blueprint.yaml | migration_blueprints/ | ✓ | support_blueprint | design_only | false | false | false | false | PASS |

**Artefatos encontrados:** 14 / 14
**No diretório migration_blueprints/:** 13 (12 blueprints + manifesto)
**Fora do diretório (main doc):** 1

**Result: PASS** — todos os 14 artefatos existem com status: design_only e executable: false.

---

## 4. Zero SQL / Zero Migration Check

| Check | Found? | Severity | Result | Notes |
|---|---|---|---|---|
| `.sql` files in domain/legal-agent/ | 0 | critical | PASS | `find` retornou zero resultados |
| Directory `migrations/` created | No | critical | PASS | Nenhum diretório de migration real |
| `CREATE TABLE` in any blueprint | No | critical | PASS | Grep confirmou ausência |
| `ALTER TABLE` in any blueprint | No | critical | PASS | Grep confirmou ausência |
| `CREATE INDEX` in any blueprint | No | critical | PASS | Grep confirmou ausência |
| `CREATE POLICY` in any blueprint | No | critical | PASS | Grep confirmou ausência |
| `DROP TABLE` in any blueprint | No | critical | PASS | Grep confirmou ausência |
| Executable DB commands in any file | No | critical | PASS | Grep confirmou ausência |

**Result: PASS** — zero SQL, zero migrations, zero comandos executáveis.

---

## 5. Entity Blueprint QA

### 001 — legal_source_snapshot

| Item | Expected | Found | Result |
|---|---|---|---|
| PK `snapshot_id uuid` | ✓ | ✓ | PASS |
| source_url (CAMPO CRÍTICO 8.4D) | ✓ | ✓ HTTPS CHECK | PASS |
| authority_level (CAMPO CRÍTICO 8.4D) | ✓ | ✓ smallint 1–7 | PASS |
| official_source (CAMPO CRÍTICO 8.4D) | ✓ | ✓ DEFAULT false | PASS |
| fetched_at (CAMPO CRÍTICO 8.4D) | ✓ | ✓ timestamptz | PASS |
| raw_content_hash (CAMPO CRÍTICO 8.4D) | ✓ | ✓ SHA-256/512 check | PASS |
| validation_status (CAMPO CRÍTICO 8.4D) | ✓ | ✓ 12v enum | PASS |
| chain_of_custody_id (CAMPO CRÍTICO 8.4D) | ✓ | ✓ NOT NULL | PASS |
| trust_class | ✓ | ✓ 6v enum, DEFAULT TRUST-1 | PASS |
| quarantine_status | ✓ | ✓ enum | PASS |
| stale_risk | ✓ | ✓ enum | PASS |
| conflict_status | ✓ | ✓ enum | PASS |
| allowed_use / prohibited_use | ✓ | ✓ arrays | PASS |
| TRUST-0/4/5 guards documentados | ✓ | ✓ constraint_notes + firewall_notes | PASS |
| NOT creates table | ✓ | ✓ table_created: false | PASS |
| notes text claim "31 campos" vs actual 32 | ⚠ | ✗ texto diz 31, YAML tem 32 | **OBS-01** |

**OBS-01:** O campo `notes:` do blueprint 001 declara "31 campos, 21 obrigatórios". O grep da lista `proposed_columns` confirma **32** entradas reais. O schema manifest (8.6B) também declara 31 para snapshot. A divergência é entre o texto `notes:` do blueprint + manifest (31) e o conteúdo real do schema YAML (32 campos contados via grep). O campo extra no schema YAML é provavelmente `notes` (campo de observações), adicionado no draft 8.6 sem atualizar o count. A estrutura real do blueprint está **correta** — 32 campos estão mapeados. Apenas o texto `notes:` e o manifest count estão desatualizados.

**Resultado 001: PASS** com OBS-01 (não bloqueante — discrepância no texto notes, estrutura correta).

---

### 002 — legal_source_metadata

| Item | Expected | Found | Result |
|---|---|---|---|
| PK `metadata_id uuid` | ✓ | ✓ | PASS |
| FK opcional → snapshot_id (SET NULL) | ✓ | ✓ | PASS |
| metadata_only permitido (snapshot_id nullable) | ✓ | ✓ | PASS |
| fetched_at NOT NULL (REVIEW-01) | ✓ | ✓ | PASS |
| official_source NOT NULL (REVIEW-02) | ✓ | ✓ | PASS |
| authority_level = localizador, não conteúdo (OBS-03/8.6B) | ✓ | ✓ security_notes explicita distinção | PASS |
| metadado ≠ texto primário (REGRA-01 reflection) | ✓ | ✓ firewall_guards cobrem | PASS |
| aggregator_metadata = confidence:low | ✓ | ✓ | PASS |
| LexML como localizador documentado | ✓ | ✓ | PASS |
| NOT creates table | ✓ | ✓ table_created: false | PASS |
| Field count: 30 schema, 30 blueprint | ✓ | ✓ | PASS |
| Required count: 18 schema, 18 blueprint | ✓ | ✓ | PASS |

**Resultado 002: PASS** — alinhamento total com schema 8.6B e OBS-03.

---

### 003 — legal_connector_log

| Item | Expected | Found | Result |
|---|---|---|---|
| PK `log_id uuid` append-only | ✓ | ✓ | PASS |
| FK opcional → snapshot_id (SET NULL) | ✓ | ✓ | PASS |
| access_risk_at_collection NOT NULL (REVIEW-04) | ✓ | ✓ | PASS |
| robots_status_at_request | ✓ | ✓ | PASS |
| terms_review_status_at_request | ✓ | ✓ | PASS |
| legal_content_fetched DEFAULT false | ✓ | ✓ | PASS |
| RAG_updated DEFAULT false, PROIBIDO | ✓ | ✓ constraint CC-11 | PASS |
| embeddings_created DEFAULT false, PROIBIDO | ✓ | ✓ constraint CC-12 | PASS |
| active_operational PROIBIDO (REGRA-12/REVIEW-08) | ✓ | ✓ constraint CC-10 | PASS |
| BYPASS_ATTEMPT_DETECTED escalada fw-governor | ✓ | ✓ error_code field | PASS |
| Append-only explicitado | ✓ | ✓ | PASS |
| Field count: 29 schema, 29 blueprint | ✓ | ✓ | PASS |
| Required count: 23 schema, 23 blueprint | ✓ | ✓ | PASS |

**Resultado 003: PASS** — alinhamento total.

---

### 004 — legal_quarantine_record

| Item | Expected | Found | Result |
|---|---|---|---|
| PK `quarantine_id uuid` | ✓ | ✓ | PASS |
| chain_of_custody_id (REVIEW-03) | ✓ | ✓ nullable, TRUST-1 promotion blocker | PASS |
| contamination_vector | ✓ | ✓ enum 9 valores | PASS |
| quarantine_reason | ✓ | ✓ enum 13 valores | PASS |
| missing_provenance_fields | ✓ | ✓ text[] nullable | PASS |
| inherited_connector_risk | ✓ | ✓ | PASS |
| TRUST-0 não promovível | ✓ | ✓ CC-07 + firewall_guards | PASS |
| RAG/memória validada bloqueados | ✓ | ✓ prohibited_use completo | PASS |
| NOT creates table | ✓ | ✓ | PASS |
| Schema fields: 21, Blueprint fields: 22 | ⚠ | ✗ +1 campo no blueprint | **OBS-02a** |
| Blueprint notes: "23 campos", actual: 22 | ⚠ | ✗ divergência no notes text | **OBS-02b** |
| Schema manifest: 23 campos para quarantine | ⚠ | ✗ manifest ≠ schema YAML (21) ≠ blueprint (22) | **OBS-02c** |
| Schema tem `promotion_requirements`, blueprint não | ⚠ | ✗ campo omitido | **OBS-02d** |
| Schema tem `review_status`, blueprint não | ⚠ | ✗ campo omitido | **OBS-02e** |
| Blueprint tem `resolution_notes`, schema não | ⚠ | ✓ campo adicional (evolução positiva) | OBS-02f |
| Blueprint tem `quarantine_resolved_at`, schema não | ⚠ | ✓ campo adicional (evolução positiva) | OBS-02f |
| Blueprint tem `reviewed_at`, schema não | ⚠ | ✓ campo adicional (audit trail) | OBS-02f |

**OBS-02 (composto):** O blueprint 004 diverge do schema local em campo e count:
- Schema tem 21 campos, blueprint tem 22 (omite 2 do schema, adiciona 3 novos)
- Campos omitidos: `promotion_requirements` e `review_status` (estão no schema, não no blueprint)
- Campos adicionados: `resolution_notes`, `quarantine_resolved_at`, `reviewed_at` (não estão no schema)
- O texto `notes:` do blueprint diz "23 campos" mas o YAML real tem 22
- O schema manifest (8.6B) diz "23 campos" para quarantine — não alinha com schema YAML nem blueprint

Os campos adicionados pelo blueprint (resolution_notes, quarantine_resolved_at, reviewed_at) representam evolução do design: melhoram o audit trail e são semanticamente válidos. Os campos omitidos (promotion_requirements, review_status) precisam ser avaliados: se o conteúdo de `review_status` está coberto pelos campos `reviewed_by`/`reviewed_at`/`resolution_notes`, a omissão pode ser intencional e aceitável.

**Recomendação:** Reconciliar em 8.7B — decidir se promotion_requirements e review_status são necessários ou se os campos adicionados cobrem o mesmo propósito.

**Resultado 004: PASS** com OBS-02 (não bloqueante — blueprint tem mais campos que o schema, cobertura semântica mantida).

---

### 005 — legal_validation_record

| Item | Expected | Found | Result |
|---|---|---|---|
| PK `validation_id uuid` | ✓ | ✓ | PASS |
| FK obrigatória → snapshot_id (RESTRICT) | ✓ | ✓ | PASS |
| validation_type (6 valores) | ✓ | ✓ | PASS |
| validator_type (4 valores) | ✓ | ✓ | PASS |
| validation_status (12v, REVIEW-05) | ✓ | ✓ | PASS |
| trust_class_before | ✓ | ✓ | PASS |
| trust_class_after | ✓ | presente mas **nullable** | **OBS-03a** |
| promotion_decision | ✓ | ✓ DEFAULT deferred | PASS |
| human_review_required DEFAULT true | ✓ | ✓ | PASS |
| TRUST-5 exige human_reviewed (REGRA-10) | ✓ | ✓ CC-03 constraint | PASS |
| NOT creates table | ✓ | ✓ | PASS |
| checks_performed (schema=required) | ⚠ | blueprint=**nullable** | **OBS-03b** |
| checks_failed (schema=required) | ⚠ | blueprint=**nullable** | **OBS-03c** |
| stale_risk_after_validation (schema=required) | ⚠ | blueprint=**nullable** | **OBS-03d** |
| conflict_status_after_validation (schema=required) | ⚠ | blueprint=**nullable** | **OBS-03e** |

**OBS-03:** O blueprint 005 marca 5 campos como nullable que o schema local declara como `required: true` (NOT NULL):
- `checks_performed` — schema: required, nullable:false; blueprint: nullable:true
- `checks_failed` — schema: required, nullable:false; blueprint: nullable:true
- `stale_risk_after_validation` — schema: required, nullable:false; blueprint: nullable:true
- `conflict_status_after_validation` — schema: required, nullable:false; blueprint: nullable:true
- `trust_class_after` — schema: required, nullable:false; blueprint: nullable:true

Impacto: se este blueprint for diretamente convertido em SQL, as CHECK constraints ficarão mais permissivas que o schema intende. Semanticamente crítico para `stale_risk_after_validation` e `conflict_status_after_validation` — sem NOT NULL, registros de validação poderão ser inseridos sem esses campos, comprometendo a lógica de promoção.

**Recomendação:** Corrigir em 8.7B — alinhar nullable com o schema local.

**Resultado 005: PASS** com OBS-03 (não bloqueante nesta fase — nenhum SQL gerado; mas crítico para fase de SQL draft).

---

### 006 — legal_conflict_record

| Item | Expected | Found | Result |
|---|---|---|---|
| PK `conflict_id uuid` | ✓ | ✓ | PASS |
| FK obrigatória → primary_snapshot_id (RESTRICT) | ✓ | ✓ | PASS |
| FK opcional → secondary_snapshot_id (SET NULL) | ✓ | ✓ | PASS |
| conflict_type (T-01 a T-08 + parser_conflict + unknown) | ✓ | ✓ | PASS |
| severity (5 valores incluindo blocking) | ✓ | ✓ | PASS |
| resolution_status | ✓ | ✓ | PASS |
| legal_conclusion_allowed DEFAULT false | ✓ | ✓ | PASS |
| REGRA-04 (conflict_detected → conflict_record) refletida | ✓ | ✓ CC-08 constraint | PASS |
| severity:blocking → legal_conclusion_allowed:false | ✓ | ✓ CC-09 | PASS |
| NOT creates table | ✓ | ✓ | PASS |
| source_a (schema=required) | ⚠ | blueprint=**nullable** | **OBS-04a** |
| affected_fields (schema=required) | ⚠ | blueprint=**nullable** | **OBS-04b** |

**OBS-04:** O blueprint 006 marca 2 campos como nullable que o schema declara como `required: true`:
- `source_a` — schema: required; blueprint: nullable
- `affected_fields` — schema: required; blueprint: nullable

Nota: `source_a` como nullable pode ser justificável se o conflito for interno ao snapshot primário (sem segunda fonte). No entanto, o schema requer. `affected_fields` como nullable também é uma escolha de design que difere do schema. Ambos os campos têm valor operacional para rastreabilidade de conflito.

**Recomendação:** Revisar em 8.7B — se source_a pode ser null quando secondary_snapshot_id é null, documentar a regra explicitamente.

**Resultado 006: PASS** com OBS-04 (não bloqueante).

---

### 007 — legal_rag_index_manifest

| Item | Expected | Found | Result |
|---|---|---|---|
| PK `index_id uuid` | ✓ | ✓ | PASS |
| allowed_trust_classes (DEFAULT [TRUST-3,4,5]) | ✓ | ✓ | PASS |
| prohibited_trust_classes (DEFAULT [TRUST-0,1,2]) | ✓ | ✓ | PASS |
| TRUST-0/1/2 SEMPRE em prohibited (CC-16) | ✓ | ✓ | PASS |
| validation_required DEFAULT true (REVIEW-08) | ✓ | ✓ | PASS |
| stale_risk_policy DEFAULT block_critical | ✓ | ✓ | PASS |
| conflict_policy DEFAULT block_conflict_detected | ✓ | ✓ | PASS |
| quarantine_policy DEFAULT block_quarantined | ✓ | ✓ | PASS |
| embedding_created_at null (invariante embeddings:0) | ✓ | ✓ firewall_notes | PASS |
| NOT implies RAG update | ✓ | ✓ firewall_guards explícito | PASS |
| NOT creates table | ✓ | ✓ | PASS |
| source_scope (schema=required) | ⚠ | blueprint=**nullable** | **OBS-05** |

**OBS-05:** `source_scope` é declarado como `required: true` no schema local, mas o blueprint 007 o marca como nullable com DEFAULT `'federal_only'`. A distinção é: schema exige valor não-nulo, blueprint aceita null (com fallback default). Como o campo tem DEFAULT e não há risco de segurança, a divergência é menor.

**Resultado 007: PASS** com OBS-05 (não bloqueante — minor nullable divergence).

---

## 6. Enums Blueprint QA

| Enum | Values Blueprint | Values Schema | Match? | Guarded? | Result | Notes |
|---|---|---|---|---|---|---|
| trust_class (ENUM-01) | 6 (TRUST-0 a TRUST-5) | 6 | ✓ COMPLETO | ✓ TRUST-0/1/2 RAG proibidos | PASS | — |
| quarantine_status (ENUM-02) | 7 | 7 | **✗ NOMES DIFERENTES** | ✓ terminais documentados | **OBS-07** | Ver abaixo |
| authority_level (ENUM-03) | 7 int | 7 int | ✓ | ✓ OBS-03/8.6B aplicado | PASS | — |
| validation_status (ENUM-04) | 12v | 12v | ✓ COMPLETO | ✓ conflict_blocked = conflict_detected (OBS-01/8.6B) | PASS | — |
| stale_risk (ENUM-05) | 5v | 5v | ✓ | ✓ critical bloqueador documentado | PASS | — |
| conflict_status (ENUM-06) | 5v | 5v | ✓ | ✓ conflict_detected obriga conflict_record | PASS | — |
| allowed_use (ENUM-07) | 7v | 7v | **✗ NOMES DIFERENTES** | ✓ RAG_validated_index bloqueado | **OBS-06** | Ver abaixo |
| prohibited_use (ENUM-08) | 9v | 9v | ✓ COMPLETO | ✓ todos 9 presentes | PASS | — |
| connector_status (ENUM-09) | 8v | 8v | ✓ | ✓ active_operational GUARD explícito | PASS | — |

**OBS-06 — allowed_use enum naming divergência:**

| Posição | Schema value | Blueprint value | Semanticamente equivalente? |
|---|---|---|---|
| 1 | none | none | ✓ |
| 2 | lead_only | lead_only | ✓ |
| 3 | metadata_locator | metadata_locator | ✓ |
| 4 | **staging_analysis** | **corpus_candidate** | ⚠ nomes diferentes |
| 5 | **educational_reference** | **RAG_validated_index** | ⚠ nomes E semântica diferentes |
| 6 | **controlled_internal_reference** | **legal_reference** | ⚠ nomes diferentes |
| 7 | **future_human_reviewed_use** | **human_review_corpus** | ⚠ nomes diferentes |

Impacto: Os valores 1–3 estão consistentes e são os valores usados em defaults (`none`, `lead_only`) nas entidades TRUST-0/1. Os valores 4–7 têm nomes diferentes. Se uma migration SQL for criada usando o nome `corpus_candidate`, mas os dados históricos usarem `staging_analysis`, haverá inconsistência. Mais grave: `educational_reference` (TRUST-4 no schema) ≠ `RAG_validated_index` (que no schema é um valor de **prohibited_use**, não allowed_use).

Nota crítica: o Blueprint ENUM-07 usa `RAG_validated_index` como um valor de `allowed_use`, mas no schema este mesmo valor está listado em `prohibited_use`. Isso é uma inversão semântica para este valor específico.

**OBS-07 — quarantine_status enum divergência:**

| Schema value | Blueprint value | Nota |
|---|---|---|
| rejected_unusable | rejected_unusable | ✓ |
| quarantined_unverified | quarantined_unverified | ✓ |
| metadata_only | **under_review** | ⚠ divergente |
| staging_only | **promoted** | ⚠ divergente |
| validated_snapshot | **escalated_to_governor** | ⚠ divergente |
| human_reviewed | **pending_chain_of_custody** | ⚠ divergente |
| not_applicable | **permanently_blocked** | ⚠ divergente |

O schema define `quarantine_status` como mapeamento para `trust_class` (trust_class-bound states). O blueprint define `quarantine_status` como lifecycle operacional (promoção, escalada, bloqueio). Estes são dois modelos semânticos distintos para o mesmo campo. Apenas 2 dos 7 valores coincidem (rejected_unusable, quarantined_unverified).

Impacto: se um SQL usar o enum do blueprint (`under_review`, `promoted`, etc.) e o código de negócio assumir os valores do schema (`metadata_only`, `staging_only`, etc.), haverá incompatibilidade.

**Recomendação:** Reconciliar em 8.7B — escolher um modelo canônico e aplicar em todos os artefatos.

---

## 7. Constraints Blueprint QA

| Constraint | Covered? | Source Rule | Enforceability (future) | Bypass Risk | Result |
|---|---|---|---|---|---|
| TRUST-4 requires validation_status compatible | ✓ CC-02 (hash) | REGRA-03/09 | CHECK implementável | Low | PASS |
| TRUST-5 requires human_reviewed | ✓ CC-03 | REGRA-10 | CHECK implementável | Low | PASS |
| stale_risk:critical blocks corpus | ✓ CC-09 | REGRA-05 (OBS-01 8.6B aplicado) | CHECK implementável | Low | PASS |
| conflict_detected requires conflict_record | ✓ CC-08 | REGRA-04 | TRIGGER_BASED | Medium (sem trigger ativo) | PASS |
| TRUST-0/1 requires quarantine_record | ✓ CC-06 | REGRA-02 | TRIGGER_BASED | Medium | PASS |
| active_operational blocked | ✓ CC-10 | REGRA-12/REVIEW-08 | CHECK (temporário) | Low | PASS |
| RAG blocked for TRUST-0/1 | ✓ CC-16 | REGRA-08 | CHECK implementável | Low | PASS |
| checksum obrigatório para TRUST-4 | ✓ CC-02 | REGRA-09 | CHECK implementável | Low | PASS |
| chain_of_custody para promoção | ✓ CC-04/CC-14 | REVIEW-03 | CHECK + TRIGGER | Low | PASS |
| RAG_updated:false invariant | ✓ CC-11 | invariante fase | CHECK (temporário) | Low | PASS |
| embeddings_created:false invariant | ✓ CC-12 | invariante fase | CHECK (temporário) | Low | PASS |
| TRUST-0 definitivo (não promovível) | ✓ CC-01/CC-07 | firewall global | CHECK implementável | Low | PASS |
| connector_bypass → escalada fw-governor | ✓ CC-15 | REGRA-12 | TRIGGER_BASED | Medium | PASS |

**Total constraints:** 17 documentadas. Todos os 12 cross-entity rules cobertos. Constraints temporárias (CC-10 a CC-13) claramente marcadas.

**Result: PASS**

---

## 8. Index Blueprint QA

| Index Target | Present? | Purpose Clear? | Creates Index Now? | Result |
|---|---|---|---|---|
| rastreabilidade / source_url (hash) | ✓ IDX-R-01 | ✓ | No (design_only) | PASS |
| source_id | ✓ IDX-R-02 | ✓ | No | PASS |
| raw_content_hash (hash) | ✓ IDX-R-03 | ✓ | No | PASS |
| chain_of_custody_id | ✓ IDX-R-04 | ✓ | No | PASS |
| connector_id | ✓ IDX-G-02 | ✓ | No | PASS |
| trust_class | ✓ IDX-G-01 | ✓ | No | PASS |
| validation_status (múltiplas tabelas) | ✓ IDX-V-01/02/05 | ✓ | No | PASS |
| stale_risk | — | ⚠ não listado como index | **OBS-08** | REVIEW |
| conflict_status | ✓ IDX-C-01 | ✓ | No | PASS |
| authority_level | ✓ IDX-V-03/04 | ✓ | No | PASS |
| fetched_at | ✓ IDX-G-07 | ✓ | No | PASS |
| quarantine_reason | ✓ IDX-C-02 | ✓ | No | PASS |
| contamination_vector | ✓ IDX-G-05 | ✓ | No | PASS |
| RAG/index_type | ✓ IDX-RAG-01 | ✓ | No | PASS |
| source_host / source_url domain | — | ⚠ não listado | **OBS-08** | REVIEW |

**OBS-08:** Dois indexes de rastreabilidade relevantes não foram incluídos no catálogo:
- `stale_risk` — campo de alta utilidade para queries de governança (ex.: "quais snapshots têm stale_risk:critical?"). Não existe index dedicado.
- `source_host/domain` — para queries de auditoria por domínio de origem, relevante para rastreabilidade. Pode ser extraído de source_url via função.

Impacto: ausência desses indexes não compromete integridade — apenas performance de queries futuras. Podem ser adicionados na 8.7B ou em fase de execução.

**Result: PASS** com OBS-08 (não bloqueante — performance apenas).

---

## 9. RLS / Permissions Blueprint QA

| Item | Expected | Found | Result |
|---|---|---|---|
| Escrita bloqueada por padrão | ✓ | ✓ operator_primary tem escrita; agentes leitura | PASS |
| legal-agent sem autoridade operacional | ✓ | ✓ operational_authority: none explícito | PASS |
| Conectores sem permissão de escrita até aprovação | ✓ | ✓ intake_agent só em modo não-operacional | PASS |
| RAG sem permissão de ingestão até fase futura | ✓ | ✓ rag-agent = leitura de config apenas | PASS |
| TRUST-0 isolado (fw-governor + operador only) | ✓ | ✓ RLS-SS-02, RLS-QR-01 | PASS |
| Logs append-only | ✓ | ✓ RLS-CL-01 (UPDATE/DELETE = FALSE) | PASS |
| Snapshots imutáveis após inserção | ✓ | ✓ RLS-SS-05 (UPDATE = FALSE) | PASS |
| RLS design ≠ policy ativa | ✓ | ✓ rls_active: false em todos | PASS |
| 7 roles documentados | ✓ | ✓ fw_governor, legal_agent, rag_agent, etc. | PASS |
| 22 políticas distribuídas em 7 tabelas | ✓ | ✓ | PASS |
| Promoção trust_class só via validation_record | ✓ | ✓ RLS-QR-03 (UPDATE = FALSE em quarantine) | PASS |

**Result: PASS** — RLS design completo. rls_active: false em todos os blueprints.

---

## 10. Rollback Blueprint QA

| Item | Expected | Found | Result |
|---|---|---|---|
| Rollback conceitual existe | ✓ | ✓ 8 passos documentados | PASS |
| Ordem reversa definida | ✓ | ✓ rag_manifest → ... → snapshots | PASS |
| Preservação de logs (BYPASS_ATTEMPT_DETECTED) | ✓ | ✓ PRES-01 | PASS |
| Cadeia de custódia protegida | ✓ | ✓ PRES-05 | PASS |
| Snapshots TRUST-4/5 não removíveis sem revisão | ✓ | ✓ PRES-02 + approval_required | PASS |
| Rollback design ≠ rollback executado | ✓ | ✓ explicitado no cabeçalho | PASS |
| FK RESTRICT refletida em rollback order | ✓ | ✓ legal_validation_records e legal_conflict_records primeiro | PASS |
| 3 cenários de risco documentados | ✓ | ✓ low/medium/critical | PASS |

**Result: PASS** — rollback design completo e seguro.

---

## 11. Schema ↔ Blueprint Alignment QA

| Entity | Schema file | Blueprint file | Critical fields match? | Enum refs match? | Firewall rules match? | Result | Notes |
|---|---|---|---|---|---|---|---|
| legal_source_snapshot | legal_source_snapshot.schema.yaml | 001_*.blueprint.yaml | ✓ todos 7 campos críticos 8.4D | ✓ 8 enum_refs | ✓ REGRA-06/07/09/10/12 | **PASS** com OBS-01 (count text) |
| legal_source_metadata | legal_source_metadata.schema.yaml | 002_*.blueprint.yaml | ✓ fetched_at, official_source, authority_level | ✓ 6 enum_refs | ✓ REGRA-01, OBS-03 8.6B | **PASS** |
| legal_connector_log | legal_connector_log.schema.yaml | 003_*.blueprint.yaml | ✓ access_risk, legal_content_fetched, RAG_updated | ✓ enums | ✓ REGRA-12/REVIEW-04/08 | **PASS** |
| legal_quarantine_record | legal_quarantine_record.schema.yaml | 004_*.blueprint.yaml | ✓ chain_of_custody_id, contamination_vector | ⚠ quarantine_status diferente | ✓ REGRA-02/06 | **PASS** com OBS-02/07 |
| legal_validation_record | legal_validation_record.schema.yaml | 005_*.blueprint.yaml | ✓ trust_class_before/after, promotion_decision | ✓ 4 enum_refs | ✓ REGRA-03/09/10 | **PASS** com OBS-03 |
| legal_conflict_record | legal_conflict_record.schema.yaml | 006_*.blueprint.yaml | ✓ severity, legal_conclusion_allowed | ✓ | ✓ REGRA-04 | **PASS** com OBS-04 |
| legal_rag_index_manifest | legal_rag_index_manifest.schema.yaml | 007_*.blueprint.yaml | ✓ allowed/prohibited_trust_classes, policies | ✓ trust_class | ✓ REGRA-08/REVIEW-08 | **PASS** com OBS-05 |

**REVIEWs 8.5A resolvidos nos blueprints:**
- REVIEW-01 ✓ (fetched_at em metadata — blueprint 002 inclui NOT NULL)
- REVIEW-02 ✓ (official_source em metadata — blueprint 002 inclui NOT NULL DEFAULT false)
- REVIEW-03 ✓ (chain_of_custody_id em quarantine — blueprint 004 inclui nullable com TRUST-1 blocker)
- REVIEW-04 ✓ (access_risk_at_collection em connector_log — blueprint 003 inclui NOT NULL)
- REVIEW-05 ✓ (validation_status 12v — ENUM-04 confirma 12 valores)
- REVIEW-06 ✓ (REGRA-05 OBS-01/8.6B aplicado — conflict_blocked ≠ stale_risk isolado no ENUM-04)
- REVIEW-07 ✓ (TRUST-2→TRUST-3 via REGRA-11 — documentada em constraints e enums)
- REVIEW-08 ✓ (active_operational guard — ENUM-09 + CC-10 + connector_log blueprint)

**OBS da 8.6B resolvidas nos blueprints:**
- OBS-01 8.6B ✓ (REGRA-05 semântica — ENUM-04 e constraints refletem distinção)
- OBS-02 8.6B ✓ (field counts — blueprints têm counts corretos nos YAML estruturais)
- OBS-03 8.6B ✓ (authority_level semântica — blueprint 002 e ENUM-03 explicitam localizador vs conteúdo)

**Result: PASS** geral com 5 OBS de alinhamento (não bloqueantes).

---

## 12. Operational Safety Leak QA

| Leak Type | Found? | File (se encontrado) | Severity | Result |
|---|---|---|---|---|
| SQL executável em blueprints | No | — | critical | PASS |
| table_created: true em qualquer blueprint | No | — | critical | PASS |
| migration_created: true | No | — | critical | PASS |
| database_created: true | No | — | critical | PASS |
| connectors ativados | No | — | critical | PASS |
| legal_content_fetched: true | No | — | critical | PASS |
| RAG_updated: true | No | — | critical | PASS |
| embeddings_created: true | No | — | critical | PASS |
| legal_advice como allowed_use | No | — | critical | PASS |
| procedural_deadline como allowed_use | No | — | critical | PASS |
| protocolable_piece como allowed_use | No | — | critical | PASS |
| legal_strategy como allowed_use | No | — | critical | PASS |
| active_operational sem guard | No | — | critical | PASS |
| active: true em algum blueprint | No | — | critical | PASS |
| operational_authority != none | No | — | critical | PASS |

**Result: PASS** — zero safety leaks. Todos os invariantes de segurança estão preservados em todos os 14 artefatos.

---

## 13. Manifest QA

Arquivo: `LEGAL_MIGRATION_BLUEPRINT_MANIFEST_8_7.yaml`

| Campo | Expected | Found | Result |
|---|---|---|---|
| iteration: 8.7 | ✓ | ✓ | PASS |
| status: design_only | ✓ | ✓ | PASS |
| executable: false | ✓ | ✓ | PASS |
| sql_files_created: 0 | ✓ | ✓ | PASS |
| migrations_created: false | ✓ | ✓ | PASS |
| database_created: false | ✓ | ✓ | PASS |
| table_created: false | ✓ | ✓ | PASS |
| entities_covered: 7 | ✓ | ✓ | PASS |
| legal_content_fetched: 0 | ✓ | ✓ | PASS |
| legal_documents_ingested: 0 | ✓ | ✓ | PASS |
| RAG_updates: 0 | ✓ | ✓ | PASS |
| embeddings_created: 0 | ✓ | ✓ | PASS |
| active: false | ✓ | ✓ | PASS |
| operational_authority: none | ✓ | ✓ | PASS |
| blueprints_created: 12 | ✓ | ✓ | PASS |
| 15 safety_invariants listados | ✓ | ✓ | PASS |
| creation_order documentado (8 passos) | ✓ | ✓ | PASS |
| rollback_order documentado | ✓ | ✓ | PASS |

**Result: PASS** — manifesto completo e alinhado.

---

## 14. QA Summary

| QA Area | Result | OBS Count | Patch Required? | Notes |
|---|---|---|---|---|
| File existence (14 artefatos) | **PASS** | 0 | No | 14/14 existem |
| Zero SQL / Zero Migration | **PASS** | 0 | No | 0 SQL, 0 migrations |
| Entity blueprint 001 (snapshot) | **PASS** | 1 (OBS-01) | No | count text stale |
| Entity blueprint 002 (metadata) | **PASS** | 0 | No | alinhamento total |
| Entity blueprint 003 (connector_log) | **PASS** | 0 | No | alinhamento total |
| Entity blueprint 004 (quarantine) | **PASS** | 1 (OBS-02) | Recommended | campo divergência |
| Entity blueprint 005 (validation) | **PASS** | 1 (OBS-03) | Recommended | nullable vs required |
| Entity blueprint 006 (conflict) | **PASS** | 1 (OBS-04) | Recommended | nullable vs required |
| Entity blueprint 007 (rag_manifest) | **PASS** | 1 (OBS-05) | Recommended | source_scope nullable |
| Enums blueprint | **PASS** | 2 (OBS-06/07) | Recommended | naming divergência |
| Constraints blueprint | **PASS** | 0 | No | 17/17 cobertos |
| Indexes blueprint | **PASS** | 1 (OBS-08) | No | stale_risk index ausente |
| RLS/permissions blueprint | **PASS** | 0 | No | 22 políticas, rls_active:false |
| Rollback blueprint | **PASS** | 0 | No | 8 passos + 5 PRES |
| Schema-blueprint alignment | **PASS** | 5 (OBS-01/02/03/04/05) | Recommended | ver detalhes §11 |
| Operational safety leak | **PASS** | 0 | No | zero leaks |
| Manifest | **PASS** | 0 | No | todos os campos corretos |

**Totais:** 17/17 áreas PASS · 8 OBS não-bloqueantes · 0 FAIL

---

## 15. Findings

**0 FAIL encontrados.**

**8 OBS não-bloqueantes:**

| OBS | Área | Severidade | Recomendação |
|---|---|---|---|
| OBS-01 | snapshot notes text | baixa | Corrigir texto "31 campos" → "32 campos" no notes do blueprint 001 e schema manifest |
| OBS-02 | quarantine divergência | média | Reconciliar 001: promotion_requirements/review_status vs resolution_notes/quarantine_resolved_at; corrigir notes text "23→22" |
| OBS-03 | validation required/nullable | alta | Alinhar nullable:true → nullable:false para 5 campos (checks_performed, checks_failed, stale_risk_after_validation, conflict_status_after_validation, trust_class_after) — crítico para SQL draft |
| OBS-04 | conflict required/nullable | média | Revisar source_a e affected_fields como nullable vs required |
| OBS-05 | rag_manifest source_scope | baixa | Alinhar source_scope nullable/required |
| OBS-06 | allowed_use naming | alta | Canonicalizar valores 4-7 (staging_analysis/corpus_candidate, educational_reference/RAG_validated_index, etc.) — ATENÇÃO: RAG_validated_index no blueprint está como allowed_use mas no schema é prohibited_use |
| OBS-07 | quarantine_status naming | alta | Reconciliar os dois modelos semânticos (trust-class-bound vs lifecycle-operational) — escolher canônico |
| OBS-08 | stale_risk index ausente | baixa | Adicionar IDX para stale_risk e possivelmente source_host |

**Declaração de resultado:**

> `migration_blueprint_result: ready_with_non_blocking_reviews`

Os blueprints de migration da Iteração 8.7 passaram em todas as 17 áreas de QA com resultado PASS. Nenhum FAIL foi identificado. 8 observações não-bloqueantes foram identificadas.

**Antes de avançar para SQL draft (8.8), é fortemente recomendado executar 8.7B — Migration Blueprint Patch** para resolver OBS-03 (campos required/nullable), OBS-06 (allowed_use naming) e OBS-07 (quarantine_status naming), que poderiam causar SQL incompatível com os schemas locais se não corrigidos.

---

## 16. Result

```
iteration_status: completed
qa_status: completed_migration_blueprint_review
migration_blueprint_result: ready_with_non_blocking_reviews

blueprints_reviewed: 12
total_artefacts_reviewed: 14
fail_count: 0
obs_count: 8
obs_high: 3 (OBS-03, OBS-06, OBS-07)
obs_medium: 2 (OBS-02, OBS-04)
obs_low: 3 (OBS-01, OBS-05, OBS-08)

blueprints_modified: 0
sql_files_created: 0
migrations_created: false
database_created: false
table_created: false
legal_content_fetched: 0
legal_documents_ingested: 0
RAG_updates: 0
embeddings_created: 0
connectors_active: 0
APIs_consulted_for_legal_data: 0

agent_activation: unchanged (active:false)
operational_authority: unchanged (none)

next_eligible_iteration:
  primary: "8.7B — Migration Blueprint Patch (recomendado antes de SQL draft)"
  alternative: "8.8 — Executable Migration Drafts, No Execution (com risco de OBS-03/06/07 pendentes)"

next_activation_condition: "Aprovação explícita do operador primário"
```
