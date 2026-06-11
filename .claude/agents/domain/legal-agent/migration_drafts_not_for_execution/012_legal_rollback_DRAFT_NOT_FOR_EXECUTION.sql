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
-- ROLLBACK DO SCHEMA JURÍDICO
-- BLUEPRINT: legal_migration_rollback_design.blueprint.yaml (iteração 8.7)
-- ORDEM DE ROLLBACK: INVERSA da criação
--   legal_rag_index_manifests → legal_conflict_records → legal_validation_records
--   → legal_quarantine_records → legal_connector_logs → legal_source_metadata
--   → legal_source_snapshots → enums (implícito com tabelas)
--
-- REGRAS DE ROLLBACK:
--   1. Remover na ordem inversa das dependências FK
--   2. Preservar logs em backup antes de qualquer remoção
--   3. Snapshots TRUST-4/5 exigem APROVAÇÃO DO OPERADOR
--   4. chain_of_custody_id = audit trail — preservar mesmo após rollback
--   5. BYPASS_ATTEMPT_DETECTED logs nunca removidos sem aprovação e preservação
--   6. TRUST-0 records: aprovação do operador + log de preservação
--
-- PRESERVAÇÕES OBRIGATÓRIAS (PRES-01 a PRES-05):
--   PRES-01: BYPASS_ATTEMPT_DETECTED logs → sistema de auditoria externo
--   PRES-02: TRUST-4/5 snapshots → backup seguro com chain_of_custody_id
--   PRES-03: TRUST-0 quarantine_records → backup com log aprovado
--   PRES-04: promotion_decision=promoted + TRUST-4/5 validation_records → backup
--   PRES-05: TODOS chain_of_custody_id → exportar mapa antes de qualquer rollback
--
-- APROVAÇÃO OBRIGATÓRIA ANTES DE EXECUTAR QUALQUER DROP TABLE:
--   [ ] Operador primário autorizou explicitamente
--   [ ] Todos os backups dos PRES acima foram criados e verificados
--   [ ] Nenhum processo ativo depende das tabelas
-- ============================================================

-- ============================================================
-- PASSO 0: PRESERVAÇÕES OBRIGATÓRIAS (ANTES DE QUALQUER DROP)
-- ============================================================

-- PRES-05: exportar mapa de chain_of_custody_id de todos os snapshots
-- REVIEW NOTE: adaptar destino (tabela de auditoria externa, arquivo, etc.)

-- SELECT snapshot_id, chain_of_custody_id, trust_class, content_id, source_url
-- INTO backup_chain_of_custody_map
-- FROM legal_source_snapshots
-- WHERE chain_of_custody_id IS NOT NULL;

-- PRES-01: exportar logs de BYPASS_ATTEMPT_DETECTED
-- SELECT * INTO backup_bypass_attempt_logs
-- FROM legal_connector_logs
-- WHERE error_code = 'BYPASS_ATTEMPT_DETECTED';

-- PRES-02: backup de snapshots TRUST-4/5
-- SELECT * INTO backup_trusted_snapshots
-- FROM legal_source_snapshots
-- WHERE trust_class IN ('TRUST-4','TRUST-5');

-- PRES-03: backup de quarantine TRUST-0
-- SELECT * INTO backup_trust0_quarantine
-- FROM legal_quarantine_records
-- WHERE initial_trust_class = 'TRUST-0';

-- PRES-04: backup de validation records com promoção TRUST-4/5
-- SELECT * INTO backup_promoted_validations
-- FROM legal_validation_records
-- WHERE promotion_decision = 'promoted'
--   AND trust_class_after IN ('TRUST-4','TRUST-5');

-- ============================================================
-- ROLLBACK STEP 1: legal_rag_index_manifests
-- Aprovação obrigatória: false
-- Risco: low
-- Pré-requisito: backup de manifests, confirmar embeddings_created:0
-- ============================================================

-- Remover políticas RLS primeiro
DROP POLICY IF EXISTS rls_rm_01_fw_governor_full_access ON legal_rag_index_manifests;
DROP POLICY IF EXISTS rls_rm_01b_operator_primary_full_access ON legal_rag_index_manifests;
DROP POLICY IF EXISTS rls_rm_02_rag_agent_read_config ON legal_rag_index_manifests;

-- Remover índices
DROP INDEX IF EXISTS idx_rag_01_manifest_index_type;
DROP INDEX IF EXISTS idx_rag_02_manifest_stale_risk_policy;

-- Desativar RLS e remover tabela
ALTER TABLE legal_rag_index_manifests DISABLE ROW LEVEL SECURITY;
DROP TABLE IF EXISTS legal_rag_index_manifests;

-- ============================================================
-- ROLLBACK STEP 2: legal_conflict_records
-- Aprovação obrigatória: SIM (se legal_conclusion_allowed = true em qualquer record)
-- Risco: high
-- Pré-requisito: backup de todos conflict_records; backup especial de severity IN ('critical','blocking')
-- ============================================================

-- Remover FK circular de legal_source_snapshots primeiro
ALTER TABLE legal_source_snapshots
    DROP CONSTRAINT IF EXISTS fk_snapshot_conflict_record;

-- Remover políticas RLS
DROP POLICY IF EXISTS rls_cr_01_fw_governor_full_access ON legal_conflict_records;
DROP POLICY IF EXISTS rls_cr_02_legal_agent_read_non_blocking ON legal_conflict_records;
DROP POLICY IF EXISTS rls_cr_03_operator_primary_full_access ON legal_conflict_records;

-- Remover índices
DROP INDEX IF EXISTS idx_c_04_conflict_primary_snapshot_id;
DROP INDEX IF EXISTS idx_c_05_conflict_secondary_snapshot_id;
DROP INDEX IF EXISTS idx_c_06_conflict_severity;
DROP INDEX IF EXISTS idx_c_07_conflict_resolution_status;
DROP INDEX IF EXISTS idx_c_08_conflict_type;

-- Desativar RLS e remover tabela
ALTER TABLE legal_conflict_records DISABLE ROW LEVEL SECURITY;
DROP TABLE IF EXISTS legal_conflict_records;

-- ============================================================
-- ROLLBACK STEP 3: legal_validation_records
-- Aprovação obrigatória: SIM (se trust_class_after IN ('TRUST-4','TRUST-5'))
-- Risco: high
-- Pré-requisito: backup de validation_records, especial de promotion_decision='promoted'
-- ============================================================

-- Remover políticas RLS
DROP POLICY IF EXISTS rls_vr_01_fw_governor_full_access ON legal_validation_records;
DROP POLICY IF EXISTS rls_vr_02_legal_agent_read_audit ON legal_validation_records;
DROP POLICY IF EXISTS rls_vr_03_operator_primary_full_access ON legal_validation_records;

-- Remover índices
DROP INDEX IF EXISTS idx_r_08_validation_snapshot_id;
DROP INDEX IF EXISTS idx_v_05_validation_records_validation_status;
DROP INDEX IF EXISTS idx_v_06_validation_records_promotion_decision;
DROP INDEX IF EXISTS idx_v_07_validation_trust_class_progression;

-- Desativar RLS e remover tabela
ALTER TABLE legal_validation_records DISABLE ROW LEVEL SECURITY;
DROP TABLE IF EXISTS legal_validation_records;

-- ============================================================
-- ROLLBACK STEP 4: legal_quarantine_records
-- Aprovação obrigatória: false (mas TRUST-0 exige backup obrigatório — PRES-03)
-- Risco: medium
-- Pré-requisito: backup de quarantine_records, especial de initial_trust_class='TRUST-0'
-- ============================================================

-- Remover políticas RLS
DROP POLICY IF EXISTS rls_qr_01_fw_governor_full_access ON legal_quarantine_records;
DROP POLICY IF EXISTS rls_qr_02_legal_agent_read_trust1_only ON legal_quarantine_records;
DROP POLICY IF EXISTS rls_qr_03_operator_primary_full_access ON legal_quarantine_records;

-- Remover índices
DROP INDEX IF EXISTS idx_r_07_quarantine_chain_of_custody;
DROP INDEX IF EXISTS idx_g_05_quarantine_contamination_vector;
DROP INDEX IF EXISTS idx_g_06_quarantine_initial_trust_class;
DROP INDEX IF EXISTS idx_c_02_quarantine_reason;
DROP INDEX IF EXISTS idx_c_03_quarantine_snapshot_id;

-- Desativar RLS e remover tabela
ALTER TABLE legal_quarantine_records DISABLE ROW LEVEL SECURITY;
DROP TABLE IF EXISTS legal_quarantine_records;

-- ============================================================
-- ROLLBACK STEP 5: legal_connector_logs
-- Aprovação obrigatória: false (mas PRES-01 OBRIGATÓRIO antes — BYPASS logs)
-- Risco: medium (perda permanente de histórico de operações)
-- Pré-requisito: backup completo; BYPASS_ATTEMPT_DETECTED → sistema externo
-- ============================================================

-- Remover políticas RLS
DROP POLICY IF EXISTS rls_cl_01_fw_governor_full_access ON legal_connector_logs;
DROP POLICY IF EXISTS rls_cl_02_legal_agent_insert_only ON legal_connector_logs;
DROP POLICY IF EXISTS rls_cl_03_operator_primary_read_insert ON legal_connector_logs;
DROP POLICY IF EXISTS rls_cl_03b_operator_primary_insert ON legal_connector_logs;

-- Remover índices
DROP INDEX IF EXISTS idx_g_02_connector_log_connector_id;
DROP INDEX IF EXISTS idx_g_03_connector_log_request_timestamp;
DROP INDEX IF EXISTS idx_g_04_connector_log_access_risk;
DROP INDEX IF EXISTS idx_rag_03_connector_log_snapshot_id;

-- Desativar RLS e remover tabela
ALTER TABLE legal_connector_logs DISABLE ROW LEVEL SECURITY;
DROP TABLE IF EXISTS legal_connector_logs;

-- ============================================================
-- ROLLBACK STEP 6: legal_source_metadata
-- Aprovação obrigatória: false
-- Risco: medium
-- Pré-requisito: backup de metadata_only records e validated records
-- ============================================================

-- Remover políticas RLS
DROP POLICY IF EXISTS rls_sm_01_fw_governor_full_access ON legal_source_metadata;
DROP POLICY IF EXISTS rls_sm_02_legal_agent_read_controlled ON legal_source_metadata;
DROP POLICY IF EXISTS rls_sm_03_operator_primary_full_access ON legal_source_metadata;

-- Remover índices
DROP INDEX IF EXISTS idx_r_05_metadata_source_id;
DROP INDEX IF EXISTS idx_r_06_metadata_snapshot_id;
DROP INDEX IF EXISTS idx_v_02_metadata_validation_status;
DROP INDEX IF EXISTS idx_v_04_metadata_authority_level;

-- Desativar RLS e remover tabela
ALTER TABLE legal_source_metadata DISABLE ROW LEVEL SECURITY;
DROP TABLE IF EXISTS legal_source_metadata;

-- ============================================================
-- ROLLBACK STEP 7: legal_source_snapshots
-- Aprovação obrigatória: SIM — qualquer snapshot TRUST-3/4/5
-- Risco: CRITICAL — destrói todo o corpus jurídico
-- Pré-requisito:
--   - legal_validation_records removida (FK RESTRICT)
--   - legal_conflict_records removida (FK RESTRICT)
--   - backup de TODOS os snapshots TRUST-4/5 (PRES-02)
--   - chain_of_custody_id exportado (PRES-05)
--   - APROVAÇÃO EXPLÍCITA DO OPERADOR PRIMÁRIO
-- ============================================================

-- Remover políticas RLS
DROP POLICY IF EXISTS rls_ss_01_fw_governor_full_access ON legal_source_snapshots;
DROP POLICY IF EXISTS rls_ss_02_legal_agent_read_trust3plus ON legal_source_snapshots;
DROP POLICY IF EXISTS rls_ss_03_operator_primary_full_access ON legal_source_snapshots;
DROP POLICY IF EXISTS rls_ss_04_operator_visitor_read_trust45 ON legal_source_snapshots;
DROP POLICY IF EXISTS rls_ss_05_intake_agent_insert_only ON legal_source_snapshots;

-- Remover constraints adicionadas via ALTER TABLE (arquivo 009)
ALTER TABLE legal_source_snapshots DROP CONSTRAINT IF EXISTS ck_ss_trust45_requires_hash;
ALTER TABLE legal_source_snapshots DROP CONSTRAINT IF EXISTS ck_ss_trust5_requires_human_reviewed;

-- Remover índices
DROP INDEX IF EXISTS idx_r_01_snapshot_source_url;
DROP INDEX IF EXISTS idx_r_02_snapshot_source_id;
DROP INDEX IF EXISTS idx_r_03_snapshot_raw_content_hash;
DROP INDEX IF EXISTS idx_r_04_snapshot_chain_of_custody;
DROP INDEX IF EXISTS idx_g_01_snapshot_trust_class;
DROP INDEX IF EXISTS idx_g_07_snapshot_fetched_at;
DROP INDEX IF EXISTS idx_g_08_snapshot_official_source;
DROP INDEX IF EXISTS idx_g_09_snapshot_stale_risk;
DROP INDEX IF EXISTS idx_v_01_snapshot_validation_status;
DROP INDEX IF EXISTS idx_v_03_snapshot_authority_level;
DROP INDEX IF EXISTS idx_c_01_snapshot_conflict_status;

-- Desativar RLS e remover tabela
ALTER TABLE legal_source_snapshots DISABLE ROW LEVEL SECURITY;
DROP TABLE IF EXISTS legal_source_snapshots;

-- ============================================================
-- ROLLBACK STEP 8: ENUMS
-- Aprovação obrigatória: false
-- Nota: enums são TEXT + CHECK — não há DROP TYPE a executar.
-- As CHECK constraints são removidas implicitamente com as tabelas.
-- ============================================================

-- Nenhuma ação DDL necessária para enums.
-- Os 9 enums documentados em ENUM-01 a ENUM-09 foram implementados
-- como CHECK constraints nas colunas TEXT de cada tabela.
-- Remoção das tabelas (steps 1-7) remove as constraints implicitamente.

-- ============================================================
-- ROLLBACK DE ROLES (OPCIONAL — APENAS SE ROLES FORAM CRIADOS EXCLUSIVAMENTE PARA ESTE SCHEMA)
-- ============================================================

-- REVIEW NOTE: executar apenas se os roles não são usados por outros schemas.

-- DROP ROLE IF EXISTS fw_governor;
-- DROP ROLE IF EXISTS legal_agent;
-- DROP ROLE IF EXISTS rag_agent;
-- DROP ROLE IF EXISTS intake_agent;
-- DROP ROLE IF EXISTS meta_router;
-- DROP ROLE IF EXISTS operator_primary;
-- DROP ROLE IF EXISTS operator_visitor;

-- ============================================================
-- SUMÁRIO DE ROLLBACK
-- ============================================================

-- Step | Tabela                    | Aprovação | Risco
-- -----|---------------------------|-----------|--------
-- 1    | legal_rag_index_manifests | NÃO       | low
-- 2    | legal_conflict_records    | SIM*      | high
-- 3    | legal_validation_records  | SIM*      | high
-- 4    | legal_quarantine_records  | NÃO (PRES)| medium
-- 5    | legal_connector_logs      | NÃO (PRES)| medium
-- 6    | legal_source_metadata     | NÃO       | medium
-- 7    | legal_source_snapshots    | SIM       | CRITICAL
-- 8    | enums (implícito)         | NÃO       | —
--
-- * SIM = aprovação obrigatória se registros TRUST-4/5 existem
-- PRES = backup obrigatório mesmo sem formal approval_required

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 012
-- ============================================================
