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
-- RLS (ROW LEVEL SECURITY) — PERMISSÕES DO SCHEMA JURÍDICO
-- BLUEPRINT: legal_migration_rls_permissions.blueprint.yaml (iteração 8.7)
-- TOTAL: 22 políticas RLS | 7 tabelas | 7 roles
-- STATUS: rls_active: false — NÃO ATIVAR SEM APROVAÇÃO DO OPERADOR PRIMÁRIO
--
-- PRÉ-REQUISITOS (NÃO ATENDIDOS NESTA FASE):
--   [ ] Tabelas criadas (arquivos 001-007)
--   [ ] Triggers implementados (arquivo 009)
--   [ ] Roles criados no PostgreSQL:
--       fw_governor, legal_agent, rag_agent, intake_agent,
--       meta_router, operator_primary, operator_visitor
--   [ ] Aprovação do operador primário para ativação de RLS
--   [ ] rls_active atualizado para: true
-- ============================================================

-- ============================================================
-- PASSO 1: ATIVAR RLS NAS TABELAS
-- ============================================================

ALTER TABLE legal_source_snapshots        ENABLE ROW LEVEL SECURITY;
ALTER TABLE legal_source_metadata         ENABLE ROW LEVEL SECURITY;
ALTER TABLE legal_connector_logs          ENABLE ROW LEVEL SECURITY;
ALTER TABLE legal_quarantine_records      ENABLE ROW LEVEL SECURITY;
ALTER TABLE legal_validation_records      ENABLE ROW LEVEL SECURITY;
ALTER TABLE legal_conflict_records        ENABLE ROW LEVEL SECURITY;
ALTER TABLE legal_rag_index_manifests     ENABLE ROW LEVEL SECURITY;

-- ============================================================
-- PASSO 2: CRIAR ROLES (SE NÃO EXISTIREM)
-- ============================================================

-- REVIEW NOTE: adaptar para o sistema de roles real do banco.
-- Em Supabase: roles são mapeados via auth.role() ou custom claims.

CREATE ROLE fw_governor;
CREATE ROLE legal_agent;
CREATE ROLE rag_agent;
CREATE ROLE intake_agent;
CREATE ROLE meta_router;
CREATE ROLE operator_primary;
CREATE ROLE operator_visitor;

-- ============================================================
-- TABELA: legal_source_snapshots (5 políticas: RLS-SS-01 a 05)
-- ============================================================

-- RLS-SS-01: fw_governor — acesso total (SELECT, INSERT, UPDATE)
CREATE POLICY rls_ss_01_fw_governor_full_access
    ON legal_source_snapshots
    FOR ALL
    TO fw_governor
    USING (TRUE)
    WITH CHECK (TRUE);

-- RLS-SS-02: legal_agent — leitura de snapshots TRUST-3 e acima apenas
CREATE POLICY rls_ss_02_legal_agent_read_trust3plus
    ON legal_source_snapshots
    FOR SELECT
    TO legal_agent
    USING (trust_class IN ('TRUST-3','TRUST-4','TRUST-5'));

-- RLS-SS-03: operator_primary — acesso total
CREATE POLICY rls_ss_03_operator_primary_full_access
    ON legal_source_snapshots
    FOR ALL
    TO operator_primary
    USING (TRUE)
    WITH CHECK (TRUE);

-- RLS-SS-04: operator_visitor — leitura de snapshots TRUST-4/5 apenas
CREATE POLICY rls_ss_04_operator_visitor_read_trust45
    ON legal_source_snapshots
    FOR SELECT
    TO operator_visitor
    USING (trust_class IN ('TRUST-4','TRUST-5'));

-- RLS-SS-05: intake_agent — INSERT apenas (novos snapshots em modo controlado)
CREATE POLICY rls_ss_05_intake_agent_insert_only
    ON legal_source_snapshots
    FOR INSERT
    TO intake_agent
    WITH CHECK (
        trust_class IN ('TRUST-1','TRUST-2') AND
        legal_content_extracted = FALSE
    );

-- ============================================================
-- TABELA: legal_source_metadata (3 políticas: RLS-SM-01 a 03)
-- ============================================================

-- RLS-SM-01: fw_governor — acesso total
CREATE POLICY rls_sm_01_fw_governor_full_access
    ON legal_source_metadata
    FOR ALL
    TO fw_governor
    USING (TRUE)
    WITH CHECK (TRUE);

-- RLS-SM-02: legal_agent — leitura de metadados com confidence != low
-- REVIEW NOTE: aggregator_metadata (confidence=low) deve ser restrito
CREATE POLICY rls_sm_02_legal_agent_read_controlled
    ON legal_source_metadata
    FOR SELECT
    TO legal_agent
    USING (metadata_confidence IN ('high','medium','unknown'));

-- RLS-SM-03: operator_primary — acesso total
CREATE POLICY rls_sm_03_operator_primary_full_access
    ON legal_source_metadata
    FOR ALL
    TO operator_primary
    USING (TRUE)
    WITH CHECK (TRUE);

-- ============================================================
-- TABELA: legal_connector_logs (3 políticas: RLS-CL-01 a 03)
-- DESIGN: APPEND-ONLY — UPDATE e DELETE = FALSE para todos exceto fw_governor
-- ============================================================

-- RLS-CL-01: fw_governor — acesso total (inclui DELETE para cleanup autorizado)
CREATE POLICY rls_cl_01_fw_governor_full_access
    ON legal_connector_logs
    FOR ALL
    TO fw_governor
    USING (TRUE)
    WITH CHECK (TRUE);

-- RLS-CL-02: legal_agent — INSERT apenas (append-only)
CREATE POLICY rls_cl_02_legal_agent_insert_only
    ON legal_connector_logs
    FOR INSERT
    TO legal_agent
    WITH CHECK (
        operation_mode IN ('dry_run','preflight','non_operational_test') AND
        legal_content_fetched = FALSE AND
        RAG_updated = FALSE
    );

-- RLS-CL-03: operator_primary — SELECT e INSERT (sem UPDATE/DELETE — logs imutáveis)
CREATE POLICY rls_cl_03_operator_primary_read_insert
    ON legal_connector_logs
    FOR SELECT
    TO operator_primary
    USING (TRUE);

CREATE POLICY rls_cl_03b_operator_primary_insert
    ON legal_connector_logs
    FOR INSERT
    TO operator_primary
    WITH CHECK (TRUE);

-- ============================================================
-- TABELA: legal_quarantine_records (3 políticas: RLS-QR-01 a 03)
-- ============================================================

-- RLS-QR-01: fw_governor — acesso total
CREATE POLICY rls_qr_01_fw_governor_full_access
    ON legal_quarantine_records
    FOR ALL
    TO fw_governor
    USING (TRUE)
    WITH CHECK (TRUE);

-- RLS-QR-02: legal_agent — leitura de quarentena TRUST-1 apenas (não TRUST-0)
-- TRUST-0 (rejected_unusable) = acesso somente fw_governor e operator_primary
CREATE POLICY rls_qr_02_legal_agent_read_trust1_only
    ON legal_quarantine_records
    FOR SELECT
    TO legal_agent
    USING (initial_trust_class = 'TRUST-1');

-- RLS-QR-03: operator_primary — acesso total
CREATE POLICY rls_qr_03_operator_primary_full_access
    ON legal_quarantine_records
    FOR ALL
    TO operator_primary
    USING (TRUE)
    WITH CHECK (TRUE);

-- ============================================================
-- TABELA: legal_validation_records (3 políticas: RLS-VR-01 a 03)
-- ============================================================

-- RLS-VR-01: fw_governor — acesso total
CREATE POLICY rls_vr_01_fw_governor_full_access
    ON legal_validation_records
    FOR ALL
    TO fw_governor
    USING (TRUE)
    WITH CHECK (TRUE);

-- RLS-VR-02: legal_agent — leitura em modo auditoria
CREATE POLICY rls_vr_02_legal_agent_read_audit
    ON legal_validation_records
    FOR SELECT
    TO legal_agent
    USING (TRUE);

-- RLS-VR-03: operator_primary — acesso total (incluindo human_review_completed = true)
CREATE POLICY rls_vr_03_operator_primary_full_access
    ON legal_validation_records
    FOR ALL
    TO operator_primary
    USING (TRUE)
    WITH CHECK (TRUE);

-- ============================================================
-- TABELA: legal_conflict_records (3 políticas: RLS-CR-01 a 03)
-- ============================================================

-- RLS-CR-01: fw_governor — acesso total
CREATE POLICY rls_cr_01_fw_governor_full_access
    ON legal_conflict_records
    FOR ALL
    TO fw_governor
    USING (TRUE)
    WITH CHECK (TRUE);

-- RLS-CR-02: legal_agent — leitura de conflitos (não blocking)
-- severity:blocking = acesso restrito a fw-governor e operador
CREATE POLICY rls_cr_02_legal_agent_read_non_blocking
    ON legal_conflict_records
    FOR SELECT
    TO legal_agent
    USING (severity <> 'blocking');

-- RLS-CR-03: operator_primary — acesso total
CREATE POLICY rls_cr_03_operator_primary_full_access
    ON legal_conflict_records
    FOR ALL
    TO operator_primary
    USING (TRUE)
    WITH CHECK (TRUE);

-- ============================================================
-- TABELA: legal_rag_index_manifests (2 políticas: RLS-RM-01 a 02)
-- ============================================================

-- RLS-RM-01: fw_governor e operator_primary — acesso total
CREATE POLICY rls_rm_01_fw_governor_full_access
    ON legal_rag_index_manifests
    FOR ALL
    TO fw_governor
    USING (TRUE)
    WITH CHECK (TRUE);

CREATE POLICY rls_rm_01b_operator_primary_full_access
    ON legal_rag_index_manifests
    FOR ALL
    TO operator_primary
    USING (TRUE)
    WITH CHECK (TRUE);

-- RLS-RM-02: rag_agent — leitura de configuração apenas (sem INSERT/UPDATE)
-- Nota: allowed_trust_classes somente fw_governor pode modificar
CREATE POLICY rls_rm_02_rag_agent_read_config
    ON legal_rag_index_manifests
    FOR SELECT
    TO rag_agent
    USING (TRUE);

-- ============================================================
-- SUMÁRIO DE POLÍTICAS RLS
-- ============================================================

-- Tabela                    | Políticas | Roles cobertos
-- --------------------------|-----------|--------------------------------
-- legal_source_snapshots    | 5         | fw_governor, legal_agent, operator_primary, operator_visitor, intake_agent
-- legal_source_metadata     | 3         | fw_governor, legal_agent, operator_primary
-- legal_connector_logs      | 4*        | fw_governor, legal_agent, operator_primary
-- legal_quarantine_records  | 3         | fw_governor, legal_agent, operator_primary
-- legal_validation_records  | 3         | fw_governor, legal_agent, operator_primary
-- legal_conflict_records    | 3         | fw_governor, legal_agent, operator_primary
-- legal_rag_index_manifests | 3*        | fw_governor, operator_primary, rag_agent
--
-- * contagem inclui políticas separadas para SELECT vs INSERT criadas como dois CREATE POLICY

-- rls_active: false — NENHUMA POLÍTICA ESTÁ ATIVA ATÉ APROVAÇÃO EXPLÍCITA

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 011
-- ============================================================
