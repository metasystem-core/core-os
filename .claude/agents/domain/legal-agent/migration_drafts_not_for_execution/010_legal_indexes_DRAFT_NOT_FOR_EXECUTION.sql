-- ============================================================
-- CORE-OS / LEGAL-AGENT
-- ITERATION: 8.8
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
-- ============================================================
--
-- INDEXES DO SCHEMA JURÍDICO
-- BLUEPRINT: legal_migration_indexes.blueprint.yaml (iteração 8.7, patch 8.7B OBS-08)
-- PATCH 8.8B (QA-IDX-01 RESOLVIDA): TOTAL corrigido 34→35, btree corrigido 32→33.
-- IDX-RAG-03 (connector_log→snapshot) estava presente no arquivo mas ausente do header.
-- TOTAL: 35 indexes | 33 btree | 2 hash
-- ORDEM DE CRIAÇÃO: após criação de todas as tabelas (arquivos 001-007)
-- DOMÍNIOS: rastreabilidade (8), governança (9), validação (7),
--           conflito_e_quarentena (8), rag_e_corpus (3)
-- OBS-08 8.7B: IDX-G-09 adicionado (stale_risk btree em legal_source_snapshots)
-- ============================================================

-- ============================================================
-- DOMÍNIO: RASTREABILIDADE (IDX-R-01 a IDX-R-08)
-- ============================================================

-- IDX-R-01: source_url hash — lookup por igualdade, alta cardinalidade
CREATE INDEX idx_r_01_snapshot_source_url
    ON legal_source_snapshots USING HASH (source_url);

-- IDX-R-02: source_id btree — filtro por fonte (SRC-001 a SRC-013)
CREATE INDEX idx_r_02_snapshot_source_id
    ON legal_source_snapshots USING BTREE (source_id);

-- IDX-R-03: raw_content_hash hash — deduplicação e lookup SHA-256/512
CREATE INDEX idx_r_03_snapshot_raw_content_hash
    ON legal_source_snapshots USING HASH (raw_content_hash);

-- IDX-R-04: chain_of_custody_id btree — rastreabilidade de cadeia de custódia
CREATE INDEX idx_r_04_snapshot_chain_of_custody
    ON legal_source_snapshots USING BTREE (chain_of_custody_id);

-- IDX-R-05: legal_source_metadata.source_id btree
CREATE INDEX idx_r_05_metadata_source_id
    ON legal_source_metadata USING BTREE (source_id);

-- IDX-R-06: legal_source_metadata.snapshot_id btree — join metadata→snapshot
CREATE INDEX idx_r_06_metadata_snapshot_id
    ON legal_source_metadata USING BTREE (snapshot_id);

-- IDX-R-07: legal_quarantine_records.chain_of_custody_id btree
CREATE INDEX idx_r_07_quarantine_chain_of_custody
    ON legal_quarantine_records USING BTREE (chain_of_custody_id);

-- IDX-R-08: legal_validation_records.snapshot_id btree — join validation→snapshot
CREATE INDEX idx_r_08_validation_snapshot_id
    ON legal_validation_records USING BTREE (snapshot_id);

-- ============================================================
-- DOMÍNIO: GOVERNANÇA (IDX-G-01 a IDX-G-09)
-- ============================================================

-- IDX-G-01: trust_class btree — filtro central do sistema
CREATE INDEX idx_g_01_snapshot_trust_class
    ON legal_source_snapshots USING BTREE (trust_class);

-- IDX-G-02: legal_connector_logs.connector_id btree — auditoria por conector
CREATE INDEX idx_g_02_connector_log_connector_id
    ON legal_connector_logs USING BTREE (connector_id);

-- IDX-G-03: legal_connector_logs.request_timestamp btree — auditoria temporal
CREATE INDEX idx_g_03_connector_log_request_timestamp
    ON legal_connector_logs USING BTREE (request_timestamp);

-- IDX-G-04: legal_connector_logs.access_risk_at_collection btree — filtro de risco
CREATE INDEX idx_g_04_connector_log_access_risk
    ON legal_connector_logs USING BTREE (access_risk_at_collection);

-- IDX-G-05: legal_quarantine_records.contamination_vector btree — auditoria de vetores
CREATE INDEX idx_g_05_quarantine_contamination_vector
    ON legal_quarantine_records USING BTREE (contamination_vector);

-- IDX-G-06: legal_quarantine_records.initial_trust_class btree — filtro por trust class
CREATE INDEX idx_g_06_quarantine_initial_trust_class
    ON legal_quarantine_records USING BTREE (initial_trust_class);

-- IDX-G-07: fetched_at btree — auditoria temporal de coleta
CREATE INDEX idx_g_07_snapshot_fetched_at
    ON legal_source_snapshots USING BTREE (fetched_at);

-- IDX-G-08: official_source btree — filtro fonte oficial vs. não-oficial
CREATE INDEX idx_g_08_snapshot_official_source
    ON legal_source_snapshots USING BTREE (official_source);

-- IDX-G-09 (OBS-08 8.7B): stale_risk btree — filtro de obsolescência e bloqueio RAG (CC-09)
CREATE INDEX idx_g_09_snapshot_stale_risk
    ON legal_source_snapshots USING BTREE (stale_risk);

-- ============================================================
-- DOMÍNIO: VALIDAÇÃO (IDX-V-01 a IDX-V-07)
-- ============================================================

-- IDX-V-01: legal_source_snapshots.validation_status btree — pipeline de validação
CREATE INDEX idx_v_01_snapshot_validation_status
    ON legal_source_snapshots USING BTREE (validation_status);

-- IDX-V-02: legal_source_metadata.validation_status btree
CREATE INDEX idx_v_02_metadata_validation_status
    ON legal_source_metadata USING BTREE (validation_status);

-- IDX-V-03: legal_source_snapshots.authority_level btree — filtro por autoridade
CREATE INDEX idx_v_03_snapshot_authority_level
    ON legal_source_snapshots USING BTREE (authority_level);

-- IDX-V-04: legal_source_metadata.authority_level btree — autoridade do localizador (OBS-03)
CREATE INDEX idx_v_04_metadata_authority_level
    ON legal_source_metadata USING BTREE (authority_level);

-- IDX-V-05: legal_validation_records.validation_status btree
CREATE INDEX idx_v_05_validation_records_validation_status
    ON legal_validation_records USING BTREE (validation_status);

-- IDX-V-06: legal_validation_records.promotion_decision btree — auditoria de promoções
CREATE INDEX idx_v_06_validation_records_promotion_decision
    ON legal_validation_records USING BTREE (promotion_decision);

-- IDX-V-07: legal_validation_records (trust_class_before, trust_class_after) btree — progressão
CREATE INDEX idx_v_07_validation_trust_class_progression
    ON legal_validation_records USING BTREE (trust_class_before, trust_class_after);

-- ============================================================
-- DOMÍNIO: CONFLITO E QUARENTENA (IDX-C-01 a IDX-C-08)
-- ============================================================

-- IDX-C-01: legal_source_snapshots.conflict_status btree — REGRA-07
CREATE INDEX idx_c_01_snapshot_conflict_status
    ON legal_source_snapshots USING BTREE (conflict_status);

-- IDX-C-02: legal_quarantine_records.quarantine_reason btree — filtro de motivos
CREATE INDEX idx_c_02_quarantine_reason
    ON legal_quarantine_records USING BTREE (quarantine_reason);

-- IDX-C-03: legal_quarantine_records.snapshot_id btree — join quarantine→snapshot
CREATE INDEX idx_c_03_quarantine_snapshot_id
    ON legal_quarantine_records USING BTREE (snapshot_id);

-- IDX-C-04: legal_conflict_records.primary_snapshot_id btree — join conflict→snapshot primário
CREATE INDEX idx_c_04_conflict_primary_snapshot_id
    ON legal_conflict_records USING BTREE (primary_snapshot_id);

-- IDX-C-05: legal_conflict_records.secondary_snapshot_id btree — join conflict→snapshot secundário
CREATE INDEX idx_c_05_conflict_secondary_snapshot_id
    ON legal_conflict_records USING BTREE (secondary_snapshot_id);

-- IDX-C-06: legal_conflict_records.severity btree — filtro por severidade
CREATE INDEX idx_c_06_conflict_severity
    ON legal_conflict_records USING BTREE (severity);

-- IDX-C-07: legal_conflict_records.resolution_status btree — filtro por status
CREATE INDEX idx_c_07_conflict_resolution_status
    ON legal_conflict_records USING BTREE (resolution_status);

-- IDX-C-08: legal_conflict_records.conflict_type btree — auditoria por tipo
CREATE INDEX idx_c_08_conflict_type
    ON legal_conflict_records USING BTREE (conflict_type);

-- ============================================================
-- DOMÍNIO: RAG E CORPUS (IDX-RAG-01 a IDX-RAG-03)
-- ============================================================

-- IDX-RAG-01: legal_rag_index_manifests.index_type btree — filtro por tipo de índice
CREATE INDEX idx_rag_01_manifest_index_type
    ON legal_rag_index_manifests USING BTREE (index_type);

-- IDX-RAG-02: legal_rag_index_manifests.stale_risk_policy btree — auditoria de políticas
CREATE INDEX idx_rag_02_manifest_stale_risk_policy
    ON legal_rag_index_manifests USING BTREE (stale_risk_policy);

-- IDX-RAG-03: legal_connector_logs.snapshot_id btree — join connector_log→snapshot
-- PATCH 8.8B (QA-IDX-01): este índice estava presente no arquivo mas não declarado no header.
-- Adicionado sem atualizar TOTAL (34) nem btree (32) na iteração 8.8. Correção aplicada no header.
CREATE INDEX idx_rag_03_connector_log_snapshot_id
    ON legal_connector_logs USING BTREE (snapshot_id);

-- ============================================================
-- SUMÁRIO
-- ============================================================

-- PATCH 8.8B (QA-IDX-01 RESOLVIDA): totais corrigidos.
-- Total: 35 indexes (8+9+7+8+3 = 35 ← contagem real dos CREATE INDEX acima)
-- Hash: 2 (IDX-R-01 source_url, IDX-R-03 raw_content_hash) — lookup por igualdade
-- Btree: 33 (todos os demais)
-- OBS-08 8.7B: IDX-G-09 adicionado (count 33→34, btree 31→32)
-- Patch 8.8B: IDX-RAG-03 declarado (count 34→35, btree 32→33)
--
-- Partial indexes (futuros — NÃO implementar nesta fase):
--   WHERE trust_class IN ('TRUST-4','TRUST-5') — queries RAG
--   WHERE validation_status = 'validated_snapshot' — pipeline de validação
--   WHERE operation_mode = 'operational' — quando connectors ativos
--   WHERE promotion_possible = true — fila de promoção

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 010
-- ============================================================
