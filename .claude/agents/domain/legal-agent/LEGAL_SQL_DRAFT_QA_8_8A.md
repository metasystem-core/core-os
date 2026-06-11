# LEGAL-AGENT — Iteração 8.8A: SQL Draft QA

**Status:** QA_COMPLETED_NOT_EXECUTED  
**Data:** 2026-06-10  
**Iteração:** 8.8A  
**Baseado em:** 13 SQL drafts da iteração 8.8 (EVT-20260610-060)  
**Evento:** EVT-20260610-061  

---

## Seção 1 — Metadata do Documento

| Campo | Valor |
|---|---|
| documento | LEGAL_SQL_DRAFT_QA_8_8A.md |
| iteração | 8.8A |
| tipo | QA documental — revisão sem modificação, sem execução |
| base_revisada | 13 arquivos SQL em `migration_drafts_not_for_execution/` |
| agente | legal-agent (status:draft — sem autoridade operacional) |
| evento | EVT-20260610-061 |
| sql_executado | false |
| sql_modificado | false |
| tabela_criada | false |
| banco_criado | false |
| migration_criada | false |
| connectors_active | 0 |
| RAG_updates | 0 |
| embeddings_created | 0 |
| legal_content_fetched | 0 |
| operational_authority | none |
| active | false |

**Invariantes preservados:** todos os invariantes permanentes do legal-agent mantidos. Esta QA é documental: nenhum arquivo SQL foi modificado, nenhuma instrução foi executada.

---

## Seção 2 — Resultado Geral

| Dimensão | Resultado |
|---|---|
| Resultado geral | **QA APROVADA COM RESSALVAS** |
| Isolamento | PASS — 100% dos arquivos .sql no diretório correto |
| Cabeçalhos bloqueantes | PASS — 13/13 com cabeçalho padrão completo |
| Risco de execução acidental | PASS — nenhum SQL executável indevido sem cabeçalho |
| DDL das 7 tabelas | PASS — 7/7 tabelas OK com ressalvas documentadas |
| Enums (arquivo 008) | PASS — 9/9 enums cobertos; estratégia TEXT+CHECK correta |
| Constraints (arquivo 009) | PASS — CC-01 a CC-17 documentados; triggers como sketches |
| Indexes (arquivo 010) | **RESSALVA** — QA-IDX-01: contagem declarada (34) ≠ contagem real (35) |
| RLS (arquivo 011) | PASS com observação — 24 CREATE POLICY / 22 políticas lógicas (reconciliação documentada) |
| Rollback (arquivo 012) | PASS — 8 steps na ordem correta; DDL DROP presente (protegido por cabeçalho) |
| Notas críticas NOTA-R | **5 itens pendentes** — NOTA-R-01 a 05 requerem resolução antes de qualquer execução |
| Alinhamento blueprints 8.7B | PASS — 8/8 patches OBS-01 a OBS-08 refletidos |
| Safety leaks | PASS — nenhum conteúdo jurídico acessado; nenhuma connection ativa |

**Bloqueadores para execução futura:**
1. NOTA-R-01: DEFAULT validation_status (discrepância blueprint × ENUM-04)
2. NOTA-R-02: DEFAULT conflict_status (discrepância blueprint × ENUM-06)
3. NOTA-R-03: connector_id CHECK list incompleta
4. NOTA-R-04: document_type list — confirmar completude
5. NOTA-R-05: CC-05 trigger sketch exige CREATE FUNCTION antes de execução
6. QA-IDX-01: contagem de indexes a reconciliar (35 vs. 34 declarado)
7. Todos os pré-requisitos de `LEGAL_SQL_DRAFT_MANIFEST_8_8.yaml` (banco, roles, aprovação operador)

**Próxima ação:** resolução humana dos bloqueadores acima; iteração 8.9 = aprovação e execução quando todos os pré-requisitos atendidos.

---

## Seção 3 — Verificação de Isolamento

**Objetivo:** confirmar que nenhum arquivo .sql existe fora de `migration_drafts_not_for_execution/`.

**Método:** Glob `**/*.sql` na raiz do repositório.

**Resultado:**

Todos os 13 arquivos .sql encontrados estão exclusivamente em:
```
.claude/agents/domain/legal-agent/migration_drafts_not_for_execution/
```

Nenhum arquivo .sql foi encontrado em:
- `migrations/` — diretório não existe no repositório
- `supabase/migrations/` — diretório não existe no repositório
- qualquer outra localização fora do diretório designado

**Resultado: PASS ✓**

| Invariante | Verificado |
|---|---|
| sql_files_created (fora do diretório) | 0 — ✓ |
| migrations_created | false — ✓ |
| database_created | false — ✓ |

---

## Seção 4 — Verificação de Cabeçalhos Bloqueantes

**Objetivo:** confirmar que todos os 13 arquivos têm o cabeçalho bloqueante padrão.

**Cabeçalho esperado (12 linhas obrigatórias):**
```sql
-- STATUS: DRAFT_NOT_FOR_EXECUTION
-- DO NOT RUN
-- DO NOT APPLY AS MIGRATION
-- DO NOT PLACE IN SUPABASE MIGRATIONS
-- PURPOSE: HUMAN REVIEW ONLY
-- DATABASE_CREATED: false
-- MIGRATION_CREATED: false
-- TABLE_CREATED: false
-- OPERATIONAL_AUTHORITY: none
-- ACTIVE_AGENT: false
```

**Verificação por arquivo:**

| Arquivo | Cabeçalho Presente | Observação |
|---|---|---|
| 000_README | ✓ | Linhas 1-14 — idêntico ao padrão |
| 001_legal_source_snapshot | ✓ | Linhas 1-14 — idêntico ao padrão |
| 002_legal_source_metadata | ✓ | Linhas 1-14 — idêntico ao padrão |
| 003_legal_connector_log | ✓ | Linhas 1-14 — idêntico ao padrão |
| 004_legal_quarantine_record | ✓ | Linhas 1-14 — idêntico ao padrão |
| 005_legal_validation_record | ✓ | Linhas 1-14 — idêntico ao padrão |
| 006_legal_conflict_record | ✓ | Linhas 1-14 — idêntico ao padrão |
| 007_legal_rag_index_manifest | ✓ | Linhas 1-14 — idêntico ao padrão |
| 008_legal_enums | ✓ | Linhas 1-14 — idêntico ao padrão |
| 009_legal_constraints | ✓ | Linhas 1-14 — idêntico ao padrão |
| 010_legal_indexes | ✓ | Linhas 1-14 — idêntico ao padrão |
| 011_legal_rls_permissions | ✓ | Linhas 1-14 — idêntico ao padrão |
| 012_legal_rollback | ✓ | Linhas 1-14 — idêntico ao padrão |

**Resultado: 13/13 PASS ✓**

---

## Seção 5 — Verificação de Risco de Execução

**Objetivo:** identificar qualquer DDL ou DML potencialmente executável acidental.

**Análise por tipo de arquivo:**

| Arquivo | Tipo de conteúdo | Proteção |
|---|---|---|
| 000 (README) | Comentários apenas | Cabeçalho + sem DDL |
| 001-007 (tabelas) | CREATE TABLE statements | Cabeçalho bloqueante |
| 008 (enums) | Comentários apenas | Cabeçalho + sem DDL |
| 009 (constraints) | ALTER TABLE, sketches de trigger como comentários | Cabeçalho bloqueante |
| 010 (indexes) | CREATE INDEX statements | Cabeçalho bloqueante |
| 011 (RLS) | ALTER TABLE ENABLE RLS, CREATE ROLE, CREATE POLICY | Cabeçalho bloqueante |
| 012 (rollback) | DROP TABLE, DROP INDEX, DROP POLICY, ALTER TABLE DISABLE RLS | Cabeçalho bloqueante |

**Observações importantes:**

1. **Arquivo 009:** os sketches de trigger estão corretamente como comentários SQL (`--`). As instruções ALTER TABLE (CC-02, CC-03, FK circular) são DDL real — necessitam do cabeçalho como única barreira. ✓
2. **Arquivo 010:** todos os 35 CREATE INDEX são DDL real — necessitam do cabeçalho como barreira. ✓
3. **Arquivo 011:** contém CREATE ROLE e ALTER TABLE ENABLE ROW LEVEL SECURITY — DDL real com alto impacto. Cabeçalho como única barreira. ✓
4. **Arquivo 012:** contém DROP TABLE IF EXISTS — DDL destrutivo com alto impacto. Cabeçalho como única barreira. Os SELECT INTO para preservação estão corretamente comentados (`--`). ✓

**Avaliação de risco:** todos os arquivos com DDL real dependem exclusivamente do cabeçalho para não-execução. A estratégia é correta para rascunhos que serão eventualmente executados, mas requer que o revisor humano não execute diretamente esses arquivos. O risco residual é aceitável para um draft em revisão.

**Resultado: PASS ✓** — nenhum DDL executável fora do diretório correto; cabeçalhos presentes em 100% dos arquivos.

---

## Seção 6 — Arquivo 001: legal_source_snapshots

**Blueprint fonte:** 001_legal_source_snapshot.blueprint.yaml (8.7, patch 8.7B)

### Contagem de campos

| Declarado | Contado | Resultado |
|---|---|---|
| 32 campos | 32 campos | ✓ |
| 21 NOT NULL | 21 NOT NULL | ✓ |
| 11 nullable | 11 nullable | ✓ |

**Campos NOT NULL (21):** snapshot_id, content_id, source_id, source_name, source_url, chain_of_custody_id, authority_level, official_source, trust_class, quarantine_status, fetched_at, raw_content_hash, checksum_algorithm, legal_content_extracted, validation_status, stale_risk, conflict_status, allowed_use, prohibited_use, created_at, updated_at.

**Campos nullable (11):** connector_id, connector_status_at_collection, raw_snapshot_path, content_mime_type, extraction_method, parser_version, conflict_record_id, access_risk_at_collection, terms_robots_review_status, document_type, notes.

### CHECK constraints

| Constraint | Presente | Cobre |
|---|---|---|
| ck_ss_trust_class | ✓ | TRUST-0 a TRUST-5 (6 valores) |
| ck_ss_quarantine_status | ✓ | 7 valores canônicos (ENUM-02 OBS-07) |
| ck_ss_validation_status | ✓ | 12 valores canônicos (ENUM-04 REVIEW-05) |
| ck_ss_stale_risk | ✓ | low/medium/high/critical/unknown |
| ck_ss_conflict_status | ✓ | 5 valores (ENUM-06 canônico — sem 'unknown') |
| ck_ss_authority_level | ✓ | BETWEEN 1 AND 7 |
| ck_ss_checksum_algorithm | ✓ | SHA256/SHA512 |
| ck_ss_source_url_https | ✓ | LIKE 'https://%' |
| ck_ss_content_id_format | ✓ | regex ^[a-z0-9-]+$ |
| ck_ss_raw_content_hash_length | ✓ | char_length IN (64, 128) |
| ck_ss_connector_id | ✓ | LIKE 'CONN-%' (NOTA-R-03 documentada inline) |
| ck_ss_access_risk | ✓ | nullable; valores: low/medium/high/critical/unknown |
| ck_ss_extraction_method | ✓ | nullable; 7 valores |
| ck_ss_document_type | ✓ | nullable; 15 valores (NOTA-R-04 documentada inline) |
| ck_ss_rag_prohibited_trust_classes | ✓ | CC-16: TRUST-0/1/2 ≠ RAG_validated_index |
| ck_ss_stale_critical_no_rag | ✓ | CC-09: stale_risk:critical ≠ RAG_validated_index |
| ck_ss_trust0_no_legal_content | ✓ | CC-17 equivalente: TRUST-0 → legal_content_extracted=FALSE |

### Observações de design

- FK circular (conflict_record_id → legal_conflict_records) corretamente ausente e deferida para arquivo 009. ✓
- DEFAULT para validation_status: 'not_started' (NOTA-R-01 documentada inline). ✓
- DEFAULT para conflict_status: 'no_conflict' (NOTA-R-02 documentada inline). ✓
- UNIQUE constraint em content_id presente. ✓

**Resultado: PASS ✓** — ver NOTA-R-01, NOTA-R-02, NOTA-R-03, NOTA-R-04 (Seção 18)

---

## Seção 7 — Arquivo 002: legal_source_metadata

**Blueprint fonte:** 002_legal_source_metadata.blueprint.yaml (8.7, patch 8.7B)

### Contagem de campos

| Declarado | Contado | Resultado |
|---|---|---|
| 30 campos | 30 campos | ✓ |
| 18 NOT NULL | 18 NOT NULL | ✓ |
| 12 nullable | 12 nullable | ✓ |

### Regras críticas verificadas

| Regra | Presente | Status |
|---|---|---|
| REGRA-01: snapshot_id NULL exige metadata_source_type = 'metadata_only' | ✓ | CHECK constraint ck_sm_null_snapshot_requires_metadata_only |
| FK opcional: snapshot_id → legal_source_snapshots ON DELETE SET NULL | ✓ | fk_metadata_snapshot |
| authority_level = autoridade do LOCALIZADOR (OBS-03) | ✓ | COMMENT ON COLUMN explica a distinção |
| norm_year BETWEEN 1500 AND 2200 | ✓ | ck_sm_norm_year |
| publication_date <= CURRENT_DATE | ✓ | ck_sm_publication_date_not_future |
| authority_level=7 → confidence IN ('low','unknown') | ✓ | ck_sm_authority7_max_low_confidence |

**Resultado: PASS ✓**

---

## Seção 8 — Arquivo 003: legal_connector_logs

**Blueprint fonte:** 003_legal_connector_log.blueprint.yaml (8.7)

### Contagem de campos

| Declarado | Contado | Resultado |
|---|---|---|
| 29 campos | 29 campos | ✓ |
| 23 NOT NULL | 23 NOT NULL | ✓ |
| 6 nullable | 6 nullable | ✓ |

### Invariantes de fase verificados

| Invariante | Constraint | Status |
|---|---|---|
| CC-10: operation_mode ≠ 'operational' | ck_cl_operational_mode_blocked | ✓ CHECK presente |
| CC-11: RAG_updated = FALSE | ck_cl_rag_updated_invariant | ✓ CHECK presente |
| CC-12: embeddings_created = FALSE | ck_cl_embeddings_invariant | ✓ CHECK presente |
| CC-13: legal_content_fetched = FALSE | ck_cl_legal_content_fetched_invariant | ✓ CHECK presente |

### Regras de negócio verificadas

| Regra | Constraint | Status |
|---|---|---|
| robots:disallowed → success=FALSE | ck_cl_disallowed_robots_blocks_success | ✓ |
| success=TRUE → response IN (200, 201, 204) | ck_cl_success_requires_2xx | ✓ |
| dry_run/preflight → raw_snapshot_created=FALSE | ck_cl_no_snapshot_in_dry_run | ✓ |
| parser_invoked=TRUE → raw_snapshot_created=TRUE | ck_cl_parser_requires_snapshot | ✓ |

### Observação de design

O campo `validation_status_after_operation` usa DEFAULT 'fetched_unvalidated' com CHECK IN ('not_applicable','fetched_unvalidated','parsed_unvalidated','pending','failed','validated_snapshot'). Este é um enum **diferente** do ENUM-04 (validation_status de snapshots). O valor 'fetched_unvalidated' é válido neste contexto específico — não é conflito com NOTA-R-01. ✓

**Resultado: PASS ✓** — invariantes de fase CC-10/11/12/13 presentes; remover quando aprovado pelo operador.

---

## Seção 9 — Arquivo 004: legal_quarantine_records

**Blueprint fonte:** 004_legal_quarantine_record.blueprint.yaml (8.7, patch 8.7B OBS-02)

### Contagem de campos

| Declarado | Contado | Resultado |
|---|---|---|
| 22 campos (patch OBS-02) | 22 campos | ✓ |
| 12 NOT NULL (patch OBS-02) | 12 NOT NULL | ✓ |
| 10 nullable | 10 nullable | ✓ |

### Regras críticas verificadas

| Regra | Constraint | Status |
|---|---|---|
| initial_trust_class somente TRUST-0 ou TRUST-1 | ck_qr_initial_trust_class | ✓ |
| CC-07: TRUST-0 → promotion_possible=FALSE | ck_qr_trust0_not_promotable | ✓ |
| TRUST-1 + chain_of_custody_id IS NULL → promotion_possible=FALSE | ck_qr_trust1_no_custody_no_promotion | ✓ |
| FK opcional: snapshot_id → legal_source_snapshots ON DELETE SET NULL | ✓ | fk_quarantine_snapshot |

**Resultado: PASS ✓**

---

## Seção 10 — Arquivo 005: legal_validation_records

**Blueprint fonte:** 005_legal_validation_record.blueprint.yaml (8.7, patch 8.7B OBS-03)

### Contagem de campos

| Declarado | Contado | Resultado |
|---|---|---|
| 20 campos | 20 campos | ✓ |
| 16 NOT NULL (patch OBS-03) | 16 NOT NULL | ✓ |
| 4 nullable | 4 nullable | ✓ |

### Patch OBS-03 verificado

| Campo | Blueprint original | Draft 8.8 | Status |
|---|---|---|---|
| checks_performed | nullable | NOT NULL DEFAULT ARRAY[]::TEXT[] | ✓ |
| checks_failed | nullable | NOT NULL DEFAULT ARRAY[]::TEXT[] | ✓ |
| stale_risk_after_validation | nullable | NOT NULL DEFAULT 'unknown' | ✓ |
| conflict_status_after_validation | nullable | NOT NULL DEFAULT 'no_conflict' | ✓ |
| trust_class_after | nullable | NOT NULL (sem DEFAULT estático) | ✓ |

### Regras de negócio verificadas

| Regra | Constraint | Status |
|---|---|---|
| promoted → checks_failed = ARRAY[] | ck_vr_promoted_requires_no_failures | ✓ |
| trust_class_after=TRUST-5 → validator_type='human_lawyer' | ck_vr_trust5_requires_human_lawyer | ✓ |
| human_review_completed=TRUE → reviewed_by e reviewed_at NOT NULL | ck_vr_human_review_requires_reviewer | ✓ |
| TRUST-0 → promotion_decision ∉ 'promoted' | ck_vr_trust0_no_promotion | ✓ |
| conflict_detected → promotion_decision ≠ 'promoted' | ck_vr_conflict_detected_blocks_promotion | ✓ |
| FK RESTRICT: snapshot_id → legal_source_snapshots | ✓ | fk_validation_snapshot ON DELETE RESTRICT |

**Resultado: PASS ✓**

---

## Seção 11 — Arquivo 006: legal_conflict_records

**Blueprint fonte:** 006_legal_conflict_record.blueprint.yaml (8.7, patch 8.7B OBS-04)

### Contagem de campos

| Declarado | Contado | Resultado |
|---|---|---|
| 17 campos | 17 campos | ✓ |
| 12 NOT NULL (patch OBS-04) | 12 NOT NULL | ✓ |
| 5 nullable | 5 nullable | ✓ |

### Patch OBS-04 verificado

| Campo | Blueprint original | Draft 8.8 | Status |
|---|---|---|---|
| source_a | nullable | NOT NULL | ✓ |

### Regras de negócio verificadas

| Regra | Constraint | Status |
|---|---|---|
| severity:blocking → legal_conclusion_allowed=FALSE | ck_cr_blocking_no_legal_conclusion | ✓ |
| T-06 (hash conflict) → severity IN ('critical','blocking') | ck_cr_t06_requires_critical_severity | ✓ |
| resolved + legal_conclusion_allowed=TRUE → preferred_source_if_any NOT NULL | ck_cr_resolved_with_conclusion_requires_preferred_source | ✓ |
| preferred_source_if_any → resolution_status ≠ 'unresolved' | ck_cr_preferred_source_only_after_review | ✓ |
| FK RESTRICT: primary_snapshot_id | ✓ | fk_conflict_primary_snapshot ON DELETE RESTRICT |
| FK SET NULL: secondary_snapshot_id | ✓ | fk_conflict_secondary_snapshot ON DELETE SET NULL |

### Nota de FK circular

A nota de FK circular (legal_source_snapshots.conflict_record_id → esta tabela) está corretamente documentada no final do arquivo com a instrução ALTER TABLE comentada, deferida para arquivo 009. ✓

**Resultado: PASS ✓**

---

## Seção 12 — Arquivo 007: legal_rag_index_manifests

**Blueprint fonte:** 007_legal_rag_index_manifest.blueprint.yaml (8.7, patch 8.7B OBS-05)

### Contagem de campos

| Declarado | Contado | Resultado |
|---|---|---|
| 18 campos | 18 campos | ✓ |
| 12 NOT NULL (patch OBS-05) | 12 NOT NULL | ✓ |
| 6 nullable | 6 nullable | ✓ |

### Patch OBS-05 verificado

| Campo | Blueprint original | Draft 8.8 | Status |
|---|---|---|---|
| source_scope | nullable | NOT NULL DEFAULT 'federal_only' | ✓ |

### Invariantes permanentes verificados (CC-16, CC-17)

| Invariante | Constraint | Permanente | Status |
|---|---|---|---|
| CC-16a: TRUST-0/1/2 ∉ allowed_trust_classes | ck_rim_allowed_excludes_low_trust | SIM — nunca remover | ✓ |
| CC-16b: TRUST-0/1/2 ∈ prohibited_trust_classes | ck_rim_prohibited_includes_low_trust | SIM — nunca remover | ✓ |
| CC-17: validation_required = TRUE | ck_rim_validation_required_immutable | SIM — nunca remover | ✓ |
| stale_risk_policy ≠ 'accept_all' | ck_rim_stale_accept_all_prohibited | SIM — segurança RAG | ✓ |
| conflict_policy ≠ 'accept_all' | ck_rim_conflict_accept_all_prohibited | SIM — segurança RAG | ✓ |

### Invariante de fase verificado

| Invariante | Constraint | Remover quando | Status |
|---|---|---|---|
| embedding_created_at IS NULL | ck_rim_embedding_created_at_null | embeddings aprovados | ✓ |

**Resultado: PASS ✓**

---

## Seção 13 — Arquivo 008: Enums

**Blueprint fonte:** legal_migration_enums.blueprint.yaml (8.7, patch 8.7B OBS-06/07)

**Estratégia:** TEXT + CHECK constraint (não CREATE TYPE) — motivo: flexibilidade para adicionar valores sem ALTER TYPE bloqueante. ✓

**Cobertura de enums:**

| Enum | Tabelas | Valores | OBS Aplicado | Status |
|---|---|---|---|---|
| ENUM-01: trust_class | snapshots, metadata, connector_logs, quarantine, validation | 6 (TRUST-0 a TRUST-5) | — | ✓ |
| ENUM-02: quarantine_status | quarantine_records | 7 (trust-class-bound) | OBS-07 ✓ | ✓ |
| ENUM-03: authority_level | snapshots, metadata | SMALLINT 1-7 | OBS-03 nota ✓ | ✓ |
| ENUM-04: validation_status | snapshots, metadata, validation_records | 12 valores (REVIEW-05) | — | ✓ |
| ENUM-05: stale_risk | snapshots, metadata, validation_records | 5 valores | — | ✓ |
| ENUM-06: conflict_status | snapshots, validation_records | 5 valores (sem 'unknown') | — | ✓ |
| ENUM-07: allowed_use | snapshots, metadata, quarantine_records | 7 valores (OBS-06 renomeados) | OBS-06 ✓ | ✓ |
| ENUM-08: prohibited_use | snapshots, metadata, quarantine_records | 9 valores | — | ✓ |
| ENUM-09: connector_status | connector_logs | 8 estados | — | ✓ |

**Verificação OBS-06:** valores 4-7 de allowed_use corretamente renomeados:
- 'staging_analysis' (era 'corpus_candidate') ✓
- 'educational_reference' (era 'RAG_validated_index') ✓
- 'controlled_internal_reference' (era 'legal_reference') ✓
- 'future_human_reviewed_use' (era 'human_review_corpus') ✓
- 'RAG_validated_index' corretamente em ENUM-08 (prohibited_use) e não em ENUM-07 ✓

**Verificação OBS-07:** quarantine_status trust-class-bound:
- 'rejected_unusable' → TRUST-0 ✓
- 'quarantined_unverified' → TRUST-1 ✓
- 'metadata_only' → TRUST-2 ✓
- 'staging_only' → TRUST-3 ✓
- 'validated_snapshot' → TRUST-4 ✓
- 'human_reviewed' → TRUST-5 ✓
- 'not_applicable' → null/não-jurídico ✓

**Nenhum DDL executável neste arquivo.** ✓

**Resultado: PASS ✓**

---

## Seção 14 — Arquivo 009: Constraints CC-01 a CC-17

**Blueprint fonte:** legal_migration_constraints.blueprint.yaml (8.7)

### Mapa de constraints

| CC | Tipo | Tabela | Implementação no draft | Status |
|---|---|---|---|---|
| CC-01 | CHECK + TRIGGER | legal_source_snapshots | CHECK parcial inline em 001; TRIGGER sketch em 009 | ✓ |
| CC-02 | CHECK | legal_source_snapshots | ALTER TABLE em 009 (ck_ss_trust45_requires_hash) | ✓ |
| CC-03 | CHECK | legal_source_snapshots | ALTER TABLE em 009 (ck_ss_trust5_requires_human_reviewed) | ✓ |
| CC-04 | CHECK | legal_quarantine_records | Inline em 004 (ck_qr_trust1_no_custody_no_promotion) | ✓ |
| CC-05 | TRIGGER | legal_source_snapshots | Sketch comentado em 009 (NOTA-R-05) | ✓ (sketch) |
| CC-06 | TRIGGER | legal_source_snapshots | Sketch comentado em 009 | ✓ (sketch) |
| CC-07 | CHECK | legal_quarantine_records | Inline em 004 (ck_qr_trust0_not_promotable) | ✓ |
| CC-08 | TRIGGER | legal_source_snapshots | Sketch comentado em 009 | ✓ (sketch) |
| CC-09 | CHECK | legal_source_snapshots | Inline em 001 (ck_ss_stale_critical_no_rag) | ✓ |
| CC-10 | CHECK (fase) | legal_connector_logs | Inline em 003 (ck_cl_operational_mode_blocked) | ✓ |
| CC-11 | CHECK (fase) | legal_connector_logs | Inline em 003 (ck_cl_rag_updated_invariant) | ✓ |
| CC-12 | CHECK (fase) | legal_connector_logs | Inline em 003 (ck_cl_embeddings_invariant) | ✓ |
| CC-13 | CHECK (fase) | legal_connector_logs | Inline em 003 (ck_cl_legal_content_fetched_invariant) | ✓ |
| CC-14 | TRIGGER (perm.) | legal_source_snapshots | Sketch comentado em 009 | ✓ (sketch) |
| CC-15 | TRIGGER | legal_quarantine_records | Sketch comentado em 009 | ✓ (sketch) |
| CC-16 | CHECK (perm.) | legal_rag_index_manifests | Inline em 007 (dois CHECK constraints) | ✓ |
| CC-17 | CHECK (perm.) | legal_rag_index_manifests | Inline em 007 (ck_rim_validation_required_immutable) | ✓ |

**Total:** 17 constraints documentadas. 10 CHECK + 7 TRIGGER_BASED. ✓

**FK circular:** ALTER TABLE legal_source_snapshots ADD CONSTRAINT fk_snapshot_conflict_record presente no arquivo 009. ✓

**Nota sobre CC-05:** o sketch do trigger de progressão forward-only está correto em lógica (rank_before vs. rank_after via ARRAY de trust classes). Exige CREATE FUNCTION antes de aplicação. Este é o bloqueador NOTA-R-05. ✓ (documentado)

**Resultado: PASS ✓** — todos os 17 CCs cobertos; triggers como sketches corretamente comentados.

---

## Seção 15 — Arquivo 010: Indexes

**Blueprint fonte:** legal_migration_indexes.blueprint.yaml (8.7, patch 8.7B OBS-08)

### Contagem por domínio

| Domínio | Declarado | Contado | Tipo |
|---|---|---|---|
| Rastreabilidade (IDX-R-01 a 08) | 8 | 8 | 6 BTREE + 2 HASH |
| Governança (IDX-G-01 a 09) | 9 | 9 | 9 BTREE |
| Validação (IDX-V-01 a 07) | 7 | 7 | 7 BTREE |
| Conflito e Quarentena (IDX-C-01 a 08) | 8 | 8 | 8 BTREE |
| RAG e Corpus (IDX-RAG-01 a 03) | 3 | 3 | 3 BTREE |
| **TOTAL** | **35** (soma) | **35** | **33 BTREE + 2 HASH** |

### QA-IDX-01 — Discrepância de contagem

**Achado:** O arquivo 010 declara `TOTAL: 34 indexes | 32 btree | 2 hash` no cabeçalho e no sumário, mas a soma dos domínios (8+9+7+8+3) = **35** e a contagem real dos CREATE INDEX statements = **35** (33 BTREE + 2 HASH).

**Análise da origem:** A progressão documentada foi 33→34 (OBS-08 adicionou IDX-G-09). O pre-OBS-08 teria 34 domains_sum (R:8, G:8, V:7, C:8, RAG:3=34) ou 33 (R:8, G:8, V:7, C:8, RAG:2=33). Se RAG tinha apenas 2 indexes antes do draft 8.8, então IDX-RAG-03 foi adicionado sem atualizar o total.

**IDX-RAG-03:** `idx_rag_03_connector_log_snapshot_id ON legal_connector_logs USING BTREE (snapshot_id)` — index válido (join connector_log→snapshot); alocado no domínio "RAG e Corpus" mas tecnicamente é rastreabilidade. Justificativa técnica: ✓ (útil), nomenclatura de domínio: revisável.

**Ação requerida antes de execução:** atualizar cabeçalho e sumário do arquivo 010 para 35 indexes | 33 btree | 2 hash; ou remover IDX-RAG-03 se não for desejado (e atualizar blueprint). Decisão do operador.

**Verificação OBS-08:** IDX-G-09 (`idx_g_09_snapshot_stale_risk ON legal_source_snapshots USING BTREE (stale_risk)`) presente. ✓

**Resultado: PASS com ressalva — QA-IDX-01: total declarado (34) ≠ total real (35). Corrigir antes de execução.**

---

## Seção 16 — Arquivo 011: RLS Permissions

**Blueprint fonte:** legal_migration_rls_permissions.blueprint.yaml (8.7)

### Contagem de políticas

| Tabela | CREATE POLICY statements | Políticas lógicas | Roles cobertos |
|---|---|---|---|
| legal_source_snapshots | 5 | 5 | fw_governor, legal_agent, operator_primary, operator_visitor, intake_agent |
| legal_source_metadata | 3 | 3 | fw_governor, legal_agent, operator_primary |
| legal_connector_logs | 4* | 3 | fw_governor, legal_agent, operator_primary |
| legal_quarantine_records | 3 | 3 | fw_governor, legal_agent, operator_primary |
| legal_validation_records | 3 | 3 | fw_governor, legal_agent, operator_primary |
| legal_conflict_records | 3 | 3 | fw_governor, legal_agent, operator_primary |
| legal_rag_index_manifests | 3* | 2 | fw_governor+operator_primary (grupo), rag_agent |
| **TOTAL** | **24** | **22** | 7 roles |

*\* Nota: connector_logs tem rls_cl_03 (SELECT) + rls_cl_03b (INSERT) para operator_primary = 2 statements, 1 lógica. rag_index_manifests tem rls_rm_01 (fw_governor) + rls_rm_01b (operator_primary) tratados como grupo owner = 2 statements, 1 lógica no blueprint.*

**Reconciliação:** manifesto declara 22 políticas lógicas. Arquivo contém 24 CREATE POLICY statements. Diferença (2) = split statements (rls_cl_03b e rls_rm_01b contados pelo blueprint como sub-statements de políticas pai). **Sem conflito — diferença é de convenção de contagem documentada com asterisco no arquivo.** ✓

**Pré-requisitos de RLS não atendidos nesta fase:**
- rls_active: false ✓ (invariante preservado)
- Roles não criados (CREATE ROLE são drafts) ✓
- Tabelas não criadas ✓

**Políticas de segurança verificadas:**

| Política | Verificado |
|---|---|
| legal_agent lê snapshots apenas TRUST-3+ | ✓ RLS-SS-02 |
| operator_visitor lê snapshots apenas TRUST-4/5 | ✓ RLS-SS-04 |
| intake_agent INSERT somente TRUST-1/2 com legal_content_extracted=FALSE | ✓ RLS-SS-05 |
| legal_agent NÃO acessa quarentena TRUST-0 | ✓ RLS-QR-02 (somente TRUST-1) |
| legal_agent NÃO lê conflitos severity:blocking | ✓ RLS-CR-02 |
| rag_agent SOMENTE leitura de manifests | ✓ RLS-RM-02 (SELECT apenas) |
| connector_logs: APPEND-ONLY para legal_agent e operator_primary | ✓ RLS-CL-02/03 (sem UPDATE/DELETE) |

**Resultado: PASS ✓** — 22 políticas lógicas cobrindo 7 roles; controles de segurança verificados; rls_active:false confirmado.

---

## Seção 17 — Arquivo 012: Rollback

**Blueprint fonte:** legal_migration_rollback_design.blueprint.yaml (8.7)

### Estrutura de rollback

| Step | Tabela | Aprovação obrigatória | Risco | Status |
|---|---|---|---|---|
| Passo 0 | Preservações (PRES-01 a 05) — SELECT INTO comentados | N/A | — | ✓ comentados corretamente |
| Step 1 | legal_rag_index_manifests | NÃO | low | ✓ DROP IF EXISTS |
| Step 2 | legal_conflict_records | SIM* | high | ✓ remoção FK circular primeiro |
| Step 3 | legal_validation_records | SIM* | high | ✓ |
| Step 4 | legal_quarantine_records | NÃO (PRES-03) | medium | ✓ |
| Step 5 | legal_connector_logs | NÃO (PRES-01) | medium | ✓ |
| Step 6 | legal_source_metadata | NÃO | medium | ✓ |
| Step 7 | legal_source_snapshots | **SIM — CRITICAL** | CRITICAL | ✓ aprovação explícita documentada |
| Step 8 | Enums (implícito) | NÃO | — | ✓ sem DROP TYPE |

### Verificações críticas

| Verificação | Resultado |
|---|---|
| Ordem inversa da criação (RAG→conflict→validation→quarantine→connector→metadata→snapshots) | ✓ |
| FK circular removida antes do DROP de legal_conflict_records (Step 2) | ✓ |
| SELECT INTO de preservação são comentários (não executáveis) | ✓ |
| Step 7 (snapshots) marcado como CRITICAL com aprovação obrigatória | ✓ |
| DROP ROLE comentado/opcional | ✓ |
| DROP TABLE IF EXISTS (não DROP TABLE) — proteção contra erro | ✓ |
| DROP INDEX IF EXISTS — proteção contra erro | ✓ |
| DROP POLICY IF EXISTS — proteção contra erro | ✓ |

**Nota:** arquivo 012 contém DDL destrutivo real (DROP TABLE, DROP INDEX, DROP POLICY). A proteção única é o cabeçalho DRAFT_NOT_FOR_EXECUTION. Em ambiente de produção, este arquivo deve ser executado apenas após aprovação explícita, com todos os backups PRES-01 a PRES-05 verificados.

**Resultado: PASS ✓** — estrutura correta, ordem correta, preservações documentadas, step crítico marcado.

---

## Seção 18 — Avaliação das Notas Críticas NOTA-R-01 a NOTA-R-05

### NOTA-R-01 — DEFAULT validation_status

**Problema:** Blueprint 001 usa DEFAULT 'fetched_unvalidated'. ENUM-04 canônico (12 valores) não inclui 'fetched_unvalidated'.

**Draft usa:** 'not_started' (valor canônico de ENUM-04). Documentado inline em arquivo 001 linha 76-78.

**Avaliação QA:**
- 'not_started' é semanticamente correto para um snapshot recém-coletado: a validação não foi iniciada. ✓
- 'fetched_unvalidated' seria mais expressivo do estado, mas não está no enum canônico.
- **Recomendação:** aceitar 'not_started' como DEFAULT canônico. Se desejado, adicionar 'fetched_unvalidated' ao ENUM-04 no blueprint antes de executar — mas isso requeriria nova iteração de patch.

**Classificação:** MEDIUM — exige decisão do operador antes de execução.

### NOTA-R-02 — DEFAULT conflict_status

**Problema:** Blueprint 001 usa DEFAULT 'unknown'. ENUM-06 canônico (5 valores) não inclui 'unknown'.

**Draft usa:** 'no_conflict' (valor canônico de ENUM-06). Documentado inline em arquivo 001 linhas 82-84.

**Avaliação QA:**
- 'no_conflict' é semanticamente preciso: um snapshot recém-coletado não tem conflito detectado ainda. ✓
- 'unknown' seria mais conservador mas viola o enum canônico.
- **Recomendação:** aceitar 'no_conflict' como DEFAULT. Não há ambiguidade sobre a semântica de 'no_conflict' para estado inicial.

**Classificação:** LOW — recomenda-se aceitar 'no_conflict'; comunicar ao operador para registro.

### NOTA-R-03 — connector_id CHECK list

**Problema:** Blueprint referencia lista CONN-001..CONN-013 mas não a enumera. Draft usa LIKE 'CONN-%'.

**Draft usa:** `CHECK (connector_id IS NULL OR connector_id LIKE 'CONN-%')`. Documentado inline em arquivo 001 linha 176-179.

**Avaliação QA:**
- LIKE 'CONN-%' é pragmático mas não enforce a lista exata de connectors válidos.
- Permite qualquer string 'CONN-XXXXXXX' sem validar se o conector existe de fato.
- A lista completa está disponível em `LEGAL_SOURCE_CONNECTORS_SPEC.md` (CONN-001 a CONN-013).
- **Recomendação:** antes de execução, substituir LIKE 'CONN-%' por IN ('CONN-001','CONN-002',...,'CONN-013') com a lista canônica.

**Classificação:** MEDIUM — exige ação do operador para fornecer lista canônica completa.

### NOTA-R-04 — document_type CHECK list

**Problema:** Lista derivada do blueprint 002. Completude a confirmar.

**Draft usa:** IN ('lei_federal','lei_estadual','lei_municipal','decreto','portaria','resolucao','acordao','sumula','jurisprudencia','processo_ativo','peticao','laudo','doutrina','auxiliar','unknown') — 15 valores.

**Avaliação QA:**
- Lista idêntica em arquivo 001 e arquivo 002 — sem discrepância inter-arquivo. ✓
- Valores são representativos do domínio jurídico brasileiro.
- Ausências potenciais: 'recurso', 'despacho', 'mandado', 'notificacao' — depende do escopo do sistema.
- **Recomendação:** confirmar completude com o operador; a lista atual é suficiente para phase inicial.

**Classificação:** LOW — lista coerente entre arquivos; confirmar com operador antes de execução.

### NOTA-R-05 — CC-05 trigger (trust_class forward-only)

**Problema:** Progressão forward-only de trust_class não pode ser CHECK constraint. Exige BEFORE UPDATE trigger. File 009 tem apenas sketch em comentário.

**Draft usa:** sketch em comentário SQL (linha 210-221 do arquivo 009) com lógica correta de rank comparison.

**Avaliação QA:**
- O sketch está logicamente correto: compara rank_before vs. rank_after via posição em ARRAY canônico. ✓
- Sem CREATE FUNCTION + CREATE TRIGGER, CC-05 não está enforçada.
- Esta é a única proteção contra regressão de trust_class (ex.: TRUST-3 → TRUST-1).
- **Recomendação:** criar `fn_trust_class_forward_only_check()` como função PostgreSQL separada antes de executar arquivo 009.
- Bloqueador real: sem este trigger, um UPDATE poderia rebaixar trust_class sem barreira.

**Classificação:** HIGH — bloqueador funcional para enforcement completo do sistema de trust classes.

---

## Seção 19 — Alinhamento Blueprint ↔ SQL (Patches 8.7B)

**Objetivo:** verificar que todos os 8 patches OBS-01 a OBS-08 da iteração 8.7B estão refletidos nos SQL drafts.

| OBS | Descrição do patch | Arquivo | Refletido | Verificado |
|---|---|---|---|---|
| OBS-01 | Contagem de campos snapshot: 31→32 (notas blueprint) | 001 | Cabeçalho: "CAMPOS: 32 campos" | ✓ |
| OBS-02 | Quarantine: 23→22 campos, 13→12 NOT NULL | 004 | Cabeçalho: "22 campos \| 12 NOT NULL" | ✓ |
| OBS-03 | Validation_record: 5 campos nullable→NOT NULL | 005 | 5 campos NOT NULL com defaults conservadores | ✓ |
| OBS-04 | Conflict_record: source_a NOT NULL | 006 | source_a TEXT NOT NULL (linha 50) | ✓ |
| OBS-05 | RAG manifest: source_scope NOT NULL DEFAULT 'federal_only' | 007 | source_scope TEXT NOT NULL DEFAULT 'federal_only' (linha 51) | ✓ |
| OBS-06 | allowed_use valores 4-7 renomeados | 008 | Valores canônicos documentados corretamente | ✓ |
| OBS-07 | quarantine_status modelo trust-class-bound | 008 | 7 valores trust-class-bound documentados | ✓ |
| OBS-08 | IDX-G-09 adicionado (stale_risk btree) | 010 | idx_g_09_snapshot_stale_risk presente (linha 99) | ✓ |

**Resultado: 8/8 patches 8.7B refletidos ✓**

### Verificação adicional de alinhamento entre arquivos

| Verificação | Resultado |
|---|---|
| document_type CHECK idêntico em 001 e 002 | ✓ |
| validation_status CHECK idêntico em 001, 002 e 005 | ✓ |
| conflict_status CHECK idêntico em 001, 002 e 005 | ✓ |
| stale_risk CHECK idêntico em 001, 002 e 005 | ✓ |
| trust_class CHECK idêntico em 001 e 005 | ✓ |
| prohibited_use DEFAULT idêntico em 001, 002 e 004 | ✓ |
| allowed_use DEFAULT em 002 ('metadata_locator','lead_only') diferente de 001 ('none') — intencional | ✓ |
| Ordem de criação (000→011): enums→snapshots→metadata→connector_log→quarantine→validation→conflict→rag_manifest→constraints→indexes→RLS | ✓ |
| Ordem de rollback (012): inversa da criação | ✓ |

---

## Conclusão

**Iteração 8.8A — SQL Draft QA — CONCLUÍDA**

**Resultado geral:** QA APROVADA COM RESSALVAS

**O que foi validado:**
- 13/13 arquivos com cabeçalho bloqueante obrigatório
- 100% isolamento em `migration_drafts_not_for_execution/`
- 7/7 tabelas DDL coerentes com blueprints 8.7B
- 9/9 enums cobertos com estratégia correta
- 17/17 constraints CC-01 a CC-17 documentados
- 8/8 patches OBS-01 a OBS-08 refletidos
- Rollback em 8 steps na ordem correta
- Todos os invariantes do legal-agent preservados
- 0 SQL executado, 0 tabelas criadas, 0 banco acessado

**Itens pendentes para resolução antes de execução (iteração 8.9):**
1. QA-IDX-01: atualizar contagem de indexes (34→35 ou remover IDX-RAG-03)
2. NOTA-R-01: decidir DEFAULT validation_status ('not_started' vs. 'fetched_unvalidated' em novo enum)
3. NOTA-R-02: aceitar 'no_conflict' como DEFAULT (recomendado)
4. NOTA-R-03: substituir LIKE 'CONN-%' por lista canônica CONN-001..CONN-013
5. NOTA-R-04: confirmar completude da lista document_type com o operador
6. NOTA-R-05: implementar CREATE FUNCTION fn_trust_class_forward_only_check() antes de aplicar arquivo 009
7. Todos os pré-requisitos de `LEGAL_SQL_DRAFT_MANIFEST_8_8.yaml` (banco, roles PostgreSQL, aprovação do operador)

**sql_executed: false | table_created: false | database_created: false | migration_created: false**

*Criado por: legal-agent (status:draft — sem autoridade operacional)*  
*QA DOCUMENTAL ≠ AUTORIZAÇÃO DE EXECUÇÃO. REVISÃO ≠ BANCO CRIADO.*
