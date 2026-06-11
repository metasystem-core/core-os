# LEGAL MIGRATION DESIGN — Iteração 8.7

**Documento:** LEGAL_MIGRATION_DESIGN_8_7.md
**Iteração:** 8.7 — Migration Design, No Execution
**Evento:** EVT-20260610-057
**Data:** 2026-06-10
**Status:** design_only
**Executável:** NÃO

---

## Aviso Crítico

> **MIGRATION DESIGN ≠ MIGRATION CREATED**
> **BLUEPRINT YAML ≠ EXECUTABLE SQL**
> **TABLE DESIGN ≠ TABLE CREATED**
> **CONSTRAINT DESIGN ≠ DATABASE ENFORCEMENT**
> **INDEX DESIGN ≠ INDEX CREATED**
> **RLS DESIGN ≠ POLICY ACTIVE**
> **RELATIONSHIP DESIGN ≠ FOREIGN KEY CREATED**
> **ROLLBACK DESIGN ≠ ROLLBACK EXECUTED**
> **FIELD MAPPING ≠ DATA INGESTION**
> **LEGAL SCHEMA ≠ LEGAL CORPUS**
> **TRUST FIELD ≠ TRUSTED CONTENT**
> **VALIDATION FIELD ≠ HUMAN VALIDATION**
> **STALE_RISK FIELD ≠ VIGÊNCIA CONFIRMADA**
> **RAG TABLE DESIGN ≠ RAG UPDATE**
> **AGENTE INATIVO ≠ AGENTE OPERACIONAL**

Nenhum SQL foi executado. Nenhuma tabela foi criada. Nenhum banco foi acessado. Nenhum conteúdo jurídico foi ingerido. Nenhum conector foi ativado. Nenhum índice RAG foi populado. Nenhuma embedding foi criada. O agente permanece `active: false` e `operational_authority: none`.

---

## 1. Purpose

Esta iteração produz o **design formal de migration** para as 7 entidades do schema jurídico do legal-agent, materializado como blueprints YAML (`status: design_only, executable: false`).

O objetivo é:
- Mapear cada campo do schema local (`.yaml`) para colunas de banco de dados com tipos PostgreSQL propostos
- Documentar constraints, indexes, FKs e RLS como design — sem execução
- Formalizar a ordem de criação e rollback
- Consolidar enums, constraints cross-entity e políticas de acesso em documentos de referência

Esta iteração **não executa** nenhuma das operações que documenta. É exclusivamente um exercício de design e documentação.

---

## 2. Source Basis

Fonte desta iteração: schema local validado na Iteração 8.6B.

| Documento fonte | Localização | Papel |
|---|---|---|
| `LEGAL_SCHEMA_MANIFEST_8_6.yaml` | `schemas/` | Manifesto dos 7 schemas locais |
| `legal_source_snapshot.schema.yaml` | `schemas/` | 31 campos — entidade base |
| `legal_source_metadata.schema.yaml` | `schemas/` | 30 campos — metadados normativos |
| `legal_connector_log.schema.yaml` | `schemas/` | 29 campos — log de operações |
| `legal_quarantine_record.schema.yaml` | `schemas/` | 23 campos — quarentena |
| `legal_validation_record.schema.yaml` | `schemas/` | 20 campos — validação |
| `legal_conflict_record.schema.yaml` | `schemas/` | 17 campos — conflitos |
| `legal_rag_index_manifest.schema.yaml` | `schemas/` | 18 campos — manifesto RAG |
| `legal_schema_enums.yaml` | `schemas/` | 9 enums canônicos |
| `legal_schema_cross_entity_rules.yaml` | `schemas/` | 12 regras cross-entity |
| `LEGAL_LOCAL_SCHEMA_PATCH_8_6B.md` | `domain/legal-agent/` | Patches OBS-01/02/03 aplicados |

Reviews aplicados da 8.5A que informam este design: REVIEW-01 a REVIEW-08 (todos resolvidos).
OBS da 8.6A: OBS-01 (REGRA-05), OBS-02 (field counts), OBS-03 (authority_level semântica) — todas resolvidas em 8.6B e refletidas nos blueprints.

---

## 3. Design Mode

**Modo:** Blueprint YAML — design_only, não executável.

**Estratégia de banco de dados (futura, não ativa):**
- SGBD alvo: PostgreSQL
- UUIDs: `gen_random_uuid()` via pgcrypto
- Enums: implementados como `TEXT + CHECK constraint` (não `CREATE TYPE`) para flexibilidade de ALTER sem bloqueio de tabela
- Arrays: `text[]` para array_string e array_enum
- Timestamps: `timestamptz` com DEFAULT `now()` (UTC)
- Hash indexes: para `source_url` e `raw_content_hash` (lookup por igualdade)
- RLS: design documentado — nenhuma política ativa

**O que foi produzido nesta iteração:**
- 12 blueprints YAML em `migration_blueprints/`
- 1 manifesto YAML
- 1 documento principal (este)
- Zero `.sql`, zero migrations, zero tabelas, zero banco

---

## 4. Blueprints Criados

| Arquivo | Entidade | Campos | Status |
|---|---|---|---|
| `001_legal_source_snapshot.blueprint.yaml` | legal_source_snapshot | 31 | design_only |
| `002_legal_source_metadata.blueprint.yaml` | legal_source_metadata | 30 | design_only |
| `003_legal_connector_log.blueprint.yaml` | legal_connector_log | 29 | design_only |
| `004_legal_quarantine_record.blueprint.yaml` | legal_quarantine_record | 23 | design_only |
| `005_legal_validation_record.blueprint.yaml` | legal_validation_record | 20 | design_only |
| `006_legal_conflict_record.blueprint.yaml` | legal_conflict_record | 17 | design_only |
| `007_legal_rag_index_manifest.blueprint.yaml` | legal_rag_index_manifest | 18 | design_only |
| `legal_migration_enums.blueprint.yaml` | 9 enums canônicos | — | design_only |
| `legal_migration_constraints.blueprint.yaml` | 17 constraints | — | design_only |
| `legal_migration_indexes.blueprint.yaml` | 33 indexes | — | design_only |
| `legal_migration_rls_permissions.blueprint.yaml` | 22 políticas RLS | — | design_only |
| `legal_migration_rollback_design.blueprint.yaml` | Plano de rollback | — | design_only |

**Total de blueprints:** 12
**Total de artefatos de iteração (incluindo manifesto e este documento):** 14
**Arquivos `.sql` criados:** 0
**Migrations criadas:** 0
**Tabelas criadas:** 0

---

## 5. Entity Migration Overview

| Entidade | Tabela futura | Campos | PK | FKs obrigatórias | FKs opcionais | Campos críticos (8.4D) |
|---|---|---|---|---|---|---|
| legal_source_snapshot | `legal_source_snapshots` | 31 | snapshot_id uuid | — | — | source_url, authority_level, official_source, fetched_at, raw_content_hash, validation_status, chain_of_custody_id |
| legal_source_metadata | `legal_source_metadata` | 30 | metadata_id uuid | — | → snapshots (SET NULL) | fetched_at, official_source, authority_level (localizador) |
| legal_connector_log | `legal_connector_logs` | 29 | log_id uuid | — | → snapshots (SET NULL) | append-only, access_risk_at_collection |
| legal_quarantine_record | `legal_quarantine_records` | 23 | quarantine_id uuid | — | → snapshots (SET NULL) | chain_of_custody_id (promotion blocker) |
| legal_validation_record | `legal_validation_records` | 20 | validation_id uuid | → snapshots (RESTRICT) | — | trust_class_before, trust_class_after, promotion_decision |
| legal_conflict_record | `legal_conflict_records` | 17 | conflict_id uuid | → snapshots (RESTRICT) | → snapshots secundário (SET NULL) | severity, legal_conclusion_allowed |
| legal_rag_index_manifest | `legal_rag_index_manifests` | 18 | index_id uuid | — | — | allowed_trust_classes, validation_required |

**Ordem de criação de tabelas (dependências FK):**
1. enums (CHECK constraints) → 2. `legal_source_snapshots` → 3. `legal_source_metadata` → 4. `legal_connector_logs` → 5. `legal_quarantine_records` → 6. `legal_validation_records` → 7. `legal_conflict_records` → 8. `legal_rag_index_manifests`

**Ordem de rollback:** inversa — 8 → 7 → 6 → 5 → 4 → 3 → 2 → 1.

---

## 6. Enum Migration Overview

| Enum | Tipo DB | Valores | Tabelas aplicáveis | Guard |
|---|---|---|---|---|
| trust_class | text CHECK | 6 (TRUST-0 a TRUST-5) | snapshots, metadata, connector_log, quarantine, validation | TRUST-0/1/2 proibidos no RAG |
| quarantine_status | text CHECK | 7 | quarantine_records | rejected_unusable e permanently_blocked = terminais |
| authority_level | smallint CHECK 1–7 | 7 (int) | snapshots, metadata | OBS-03: metadata=localizador, snapshot=conteúdo |
| validation_status | text CHECK | 12 (REVIEW-05) | snapshots, metadata, validation | conflict_blocked ≠ stale_risk (OBS-01) |
| stale_risk | text CHECK | 5 | snapshots, metadata, validation | critical = não alimenta corpus RAG |
| conflict_status | text CHECK | 5 | snapshots, validation | conflict_detected exige conflict_record |
| allowed_use | text[] | 7 | snapshots, metadata, quarantine | RAG_validated_index exige TRUST-4+ |
| prohibited_use | text[] | 9 | snapshots, metadata, quarantine | todos 9 proibidos para TRUST-0/1 |
| connector_status | text CHECK | 8 | connector_logs | active_operational PROIBIDO (REVIEW-08/REGRA-12) |

**Estratégia de implementação:** TEXT + CHECK constraint (não CREATE TYPE). Motivo: ALTER TYPE em PostgreSQL bloqueia tabela; CHECK constraint pode ser adicionado/removido sem bloqueio.

---

## 7. Constraint Design Overview

17 constraints catalogadas em `legal_migration_constraints.blueprint.yaml`:

| Categoria | Constraints | Exemplos-chave |
|---|---|---|
| trust_class_integrity | CC-01 a CC-05 | TRUST-0 definitivo; TRUST-4/5 exige hash; TRUST-5 exige human_lawyer |
| quarantine_integrity | CC-06, CC-07 | TRUST-0/1 exigem quarantine_record; TRUST-0 não promovível |
| conflict_integrity | CC-08, CC-09 | conflict_detected exige conflict_record; stale_risk:critical bloqueia RAG |
| connector_invariants | CC-10 a CC-13 | active_operational proibido; RAG_updated:false; embeddings:false; legal_content_fetched:false |
| audit_chain_custody | CC-14, CC-15 | chain_of_custody_id imutável; connector_bypass → escalada |
| rag_trust_protection | CC-16, CC-17 | TRUST-0/1/2 fora de allowed_trust_classes; validation_required sempre true |

**Tipos:** 10 CHECK + 7 TRIGGER_BASED. Invariantes CC-10/13 são temporários (remover somente com autorização explícita). CC-14/16/17 são permanentes.

---

## 8. Index Design Overview

33 indexes catalogados em `legal_migration_indexes.blueprint.yaml`:

| Domínio | Indexes | Propósito |
|---|---|---|
| Rastreabilidade | IDX-R-01 a IDX-R-08 | source_url (hash), source_id, raw_content_hash (hash), chain_of_custody_id |
| Governança | IDX-G-01 a IDX-G-08 | trust_class, connector_id, timestamp, access_risk, contamination_vector |
| Validação | IDX-V-01 a IDX-V-07 | validation_status (múltiplas tabelas), authority_level, promotion_decision |
| Conflito e Quarentena | IDX-C-01 a IDX-C-08 | conflict_status, quarantine_reason, severity, resolution_status |
| RAG e Corpus | IDX-RAG-01 a IDX-RAG-03 | index_type, stale_risk_policy, snapshot join |

**Tipos:** 31 btree + 2 hash. Hash indexes para `source_url` e `raw_content_hash` (lookup por igualdade de alta cardinalidade).

---

## 9. RLS / Permission Design

22 políticas RLS em `legal_migration_rls_permissions.blueprint.yaml`. **RLS DESIGN ≠ RLS ATIVA.**

| Tabela | Políticas | Destaque |
|---|---|---|
| legal_source_snapshots | 5 | UPDATE bloqueado (imutável); TRUST-0 só fw-governor |
| legal_source_metadata | 3 | aggregator_metadata: sem UPDATE para corpus |
| legal_connector_logs | 3 | UPDATE/DELETE bloqueados (append-only) |
| legal_quarantine_records | 3 | TRUST-0: só fw-governor; sem UPDATE direto |
| legal_validation_records | 3 | human_review_completed:true só operador primário |
| legal_conflict_records | 3 | severity:blocking só fw-governor + operador; sem DELETE |
| legal_rag_index_manifests | 2 | escrita só operador primário |

**Roles documentados:** fw_governor, legal_agent, rag_agent, intake_agent, meta_router, operator_primary, operator_visitor.

---

## 10. Rollback Design

Plano completo em `legal_migration_rollback_design.blueprint.yaml`. **ROLLBACK DESIGN ≠ ROLLBACK AUTORIZADO.**

**Ordem de rollback:** legal_rag_index_manifests → legal_conflict_records → legal_validation_records → legal_quarantine_records → legal_connector_logs → legal_source_metadata → legal_source_snapshots → enums.

5 requisitos de preservação (PRES-01 a PRES-05):
- PRES-01: BYPASS_ATTEMPT_DETECTED logs → sistema externo de auditoria
- PRES-02: TRUST-4/5 snapshots → backup seguro com chain_of_custody_id
- PRES-03: TRUST-0 quarantine_records → backup + log de remoção aprovado
- PRES-04: promotion_decision:promoted + TRUST-4/5 validation_records → backup
- PRES-05: chain_of_custody_id de todos os registros → preservar em sistema externo

Rollback de `legal_source_snapshots` com TRUST-3/4/5 exige aprovação do operador primário.

---

## 11. Operational Safety

Invariantes preservados durante toda a Iteração 8.7:

| Campo | Valor | Significado |
|---|---|---|
| active | false | Agente inativo |
| operational_authority | none | Sem autoridade operacional |
| database_created | false | Nenhum banco criado |
| migrations_created | false | Nenhuma migration criada |
| table_created | false | Nenhuma tabela criada |
| connectors_active | 0 | Nenhum conector ativo |
| connectors_implemented | 0 | Nenhum conector implementado |
| legal_content_fetched | 0 | Nenhum conteúdo jurídico buscado |
| legal_documents_ingested | 0 | Nenhum documento jurídico ingerido |
| RAG_updates | 0 | Nenhuma atualização de índice RAG |
| embeddings_created | 0 | Nenhuma embedding criada |
| APIs_consulted_for_legal_data | 0 | Nenhuma API consultada para dados jurídicos |
| sql_files_created | 0 | Nenhum arquivo .sql criado |

---

## 12. Result

| Campo | Valor |
|---|---|
| iteration_result | migration_design_complete |
| blueprints_created | 12 |
| total_artefacts | 14 |
| entities_covered | 7 |
| enums_documented | 9 |
| constraints_documented | 17 |
| indexes_documented | 33 |
| rls_policies_documented | 22 |
| sql_files_created | 0 |
| migrations_created | 0 |
| database_created | 0 |
| tables_created | 0 |
| legal_content_fetched | 0 |
| RAG_updates | 0 |
| embeddings_created | 0 |
| active | false |
| operational_authority | none |
| next_eligible_iteration | 8.7A — Migration Blueprint QA |
| next_activation_condition | aprovação explícita do operador primário |

**Próxima iteração elegível:** 8.7A — Migration Blueprint QA.
**Condição de início:** aprovação explícita do operador primário.
**O que a 8.7A fará:** revisão formal dos 12 blueprints YAML — verificação de consistência, completude de campos, alinhamento com schemas locais 8.6B, e identificação de OBS ou itens bloqueadores antes de qualquer implementação.

---

*MIGRATION DESIGN ≠ MIGRATION CREATED. BLUEPRINT YAML ≠ SQL EXECUTÁVEL. AGENTE INATIVO ≠ AGENTE OPERACIONAL.*
