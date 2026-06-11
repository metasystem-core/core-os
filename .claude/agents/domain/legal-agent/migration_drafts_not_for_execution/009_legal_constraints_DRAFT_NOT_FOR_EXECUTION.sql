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
-- CONSTRAINTS DO SCHEMA JURÍDICO — CC-01 a CC-17
-- BLUEPRINT: legal_migration_constraints.blueprint.yaml (iteração 8.7)
-- TOTAL: 17 constraints | 10 CHECK | 7 TRIGGER_BASED
-- ORDEM DE APLICAÇÃO: após criação de todas as tabelas (arquivos 001-007)
--
-- NOTA: constraints que já estão inline nas tabelas (arquivos 001-007) são
-- REPETIDAS AQUI como referência documental e para aplicação via ALTER TABLE
-- se necessário. Constraints de trigger exigem CREATE FUNCTION separado.
-- ============================================================

-- ============================================================
-- SEÇÃO A: FK CIRCULAR (ALTER TABLE — após tabelas criadas)
-- ============================================================

-- FK circular: legal_source_snapshots.conflict_record_id → legal_conflict_records
-- Não pode ser incluída na criação de legal_source_snapshots (000 não existia ainda)

ALTER TABLE legal_source_snapshots
    ADD CONSTRAINT fk_snapshot_conflict_record
    FOREIGN KEY (conflict_record_id)
    REFERENCES legal_conflict_records (conflict_id)
    ON DELETE SET NULL;

-- ============================================================
-- SEÇÃO B: CHECK CONSTRAINTS (CC-01 a CC-09, CC-14, CC-15, CC-16, CC-17)
-- ============================================================

-- ------------------------------------------------------------
-- CC-01: TRUST-0 automático — definitivo
-- Tipo: CHECK
-- Tabela: legal_source_snapshots
-- Descrição: trust_class = 'TRUST-0' se source_url IS NULL
--            OR source_id = 'UNKNOWN' OR chain_of_custody_id IS NULL
-- REVIEW NOTE: Esta CC é parcialmente enforçada por campos NOT NULL e CHECK na tabela.
-- A lógica completa exige TRIGGER (veja CC-01 trigger abaixo).
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 001 (ck_ss_trust0_no_legal_content)
-- Implementação completa exige trigger (ver Seção C - CC-01-TRIGGER)

-- ------------------------------------------------------------
-- CC-02: TRUST-4/5 exige raw_content_hash
-- Tipo: CHECK
-- Tabela: legal_source_snapshots
-- ------------------------------------------------------------

ALTER TABLE legal_source_snapshots
    ADD CONSTRAINT ck_ss_trust45_requires_hash
    CHECK (
        trust_class NOT IN ('TRUST-4','TRUST-5') OR
        (raw_content_hash IS NOT NULL AND
         char_length(raw_content_hash) IN (64, 128))
    );

-- raw_content_hash já é NOT NULL na tabela — esta constraint reforça a semântica.

-- ------------------------------------------------------------
-- CC-03: TRUST-5 exige validation_status = 'human_reviewed'
-- Tipo: CHECK
-- Tabela: legal_source_snapshots
-- ------------------------------------------------------------

ALTER TABLE legal_source_snapshots
    ADD CONSTRAINT ck_ss_trust5_requires_human_reviewed
    CHECK (
        trust_class <> 'TRUST-5' OR
        validation_status = 'human_reviewed'
    );

-- ------------------------------------------------------------
-- CC-04: TRUST-1 + chain_of_custody_id IS NULL → promotion_possible = false
-- Tipo: CHECK
-- Tabela: legal_quarantine_records
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 004 (ck_qr_trust1_no_custody_no_promotion)

-- ------------------------------------------------------------
-- CC-05: trust_class progressão forward-only
-- Tipo: TRIGGER_BASED (ver Seção C)
-- Tabela: legal_source_snapshots
-- Nota: não pode ser CHECK constraint — exige BEFORE UPDATE trigger
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- CC-06: TRUST-0/1 → quarantine_record obrigatório
-- Tipo: TRIGGER_BASED (ver Seção C)
-- Tabela: legal_source_snapshots
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- CC-07: TRUST-0 em quarentena → promotion_possible = false
-- Tipo: CHECK
-- Tabela: legal_quarantine_records
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 004 (ck_qr_trust0_not_promotable)

-- ------------------------------------------------------------
-- CC-08: conflict_detected → conflict_record obrigatório
-- Tipo: TRIGGER_BASED (ver Seção C)
-- Tabela: legal_source_snapshots
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- CC-09: stale_risk:critical → RAG_validated_index NOT in allowed_use
-- Tipo: CHECK
-- Tabela: legal_source_snapshots
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 001 (ck_ss_stale_critical_no_rag)

-- ------------------------------------------------------------
-- CC-10: active_operational BLOQUEADO (invariante de fase)
-- Tipo: CHECK
-- Tabela: legal_connector_logs
-- REVIEW NOTE: invariante de fase — remover quando connectors_active > 0 aprovado
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 003 (ck_cl_operational_mode_blocked)

-- ------------------------------------------------------------
-- CC-11: RAG_updated = false (invariante de fase)
-- Tipo: CHECK
-- Tabela: legal_connector_logs
-- REVIEW NOTE: invariante de fase — remover quando RAG ativado e aprovado
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 003 (ck_cl_rag_updated_invariant)

-- ------------------------------------------------------------
-- CC-12: embeddings_created = false (invariante de fase)
-- Tipo: CHECK
-- Tabela: legal_connector_logs
-- REVIEW NOTE: invariante de fase — remover quando embeddings aprovados
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 003 (ck_cl_embeddings_invariant)

-- ------------------------------------------------------------
-- CC-13: legal_content_fetched = false (invariante de fase)
-- Tipo: CHECK
-- Tabela: legal_connector_logs
-- REVIEW NOTE: invariante de fase — remover quando connectors_active > 0 aprovado
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 003 (ck_cl_legal_content_fetched_invariant)

-- ------------------------------------------------------------
-- CC-14: chain_of_custody_id IMUTÁVEL (permanente)
-- Tipo: TRIGGER_BASED (ver Seção C)
-- Tabela: legal_source_snapshots
-- PERMANENTE: nunca remover
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- CC-15: connector_bypass → escalada fw-governor
-- Tipo: TRIGGER_BASED (ver Seção C)
-- Tabela: legal_quarantine_records
-- ------------------------------------------------------------

-- ------------------------------------------------------------
-- CC-16: RAG — trust classes proibidas incluem TRUST-0/1/2 (permanente)
-- Tipo: CHECK
-- Tabela: legal_rag_index_manifests
-- PERMANENTE: nunca remover
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 007 (ck_rim_allowed_excludes_low_trust,
-- ck_rim_prohibited_includes_low_trust)

-- ------------------------------------------------------------
-- CC-17: validation_required = false PROIBIDO (permanente)
-- Tipo: CHECK
-- Tabela: legal_rag_index_manifests
-- PERMANENTE: nunca remover
-- ------------------------------------------------------------
-- Já implementada inline em arquivo 007 (ck_rim_validation_required_immutable)

-- ============================================================
-- SEÇÃO C: TRIGGER_BASED CONSTRAINTS
-- PATCH 8.8B (NOTA-R-05 RESOLVIDA)
-- ============================================================
-- ORDEM DE EXECUÇÃO OBRIGATÓRIA PARA CADA TRIGGER:
--   STEP 1: CREATE OR REPLACE FUNCTION (executar primeiro)
--   STEP 2: CREATE TRIGGER (executar somente após STEP 1)
-- SEM A FUNCTION, O CREATE TRIGGER FALHA COM "function does not exist".
--
-- Todas as functions e triggers abaixo são DRAFTS (comentados com /* */).
-- NÃO EXECUTAR — HUMAN REVIEW ONLY. Status: DRAFT_NOT_FOR_EXECUTION.
-- ============================================================

-- ------------------------------------------------------------
-- CC-01: TRUST-0 automático por campos ausentes
-- Gatilho: BEFORE INSERT OR UPDATE em legal_source_snapshots
-- STEP 1: FUNCTION — STEP 2: TRIGGER
-- ------------------------------------------------------------

-- STEP 1 — CREATE FUNCTION (executar primeiro):
/*
CREATE OR REPLACE FUNCTION fn_trust0_auto_on_missing_fields()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.source_url IS NULL
       OR NEW.source_id = 'UNKNOWN'
       OR NEW.chain_of_custody_id IS NULL
    THEN
        NEW.trust_class := 'TRUST-0';
        NEW.quarantine_status := 'rejected_unusable';
    END IF;
    RETURN NEW;
END;
$$;
*/

-- STEP 2 — CREATE TRIGGER (executar somente após STEP 1):
/*
CREATE TRIGGER trg_ss_trust0_auto
    BEFORE INSERT OR UPDATE ON legal_source_snapshots
    FOR EACH ROW
    EXECUTE FUNCTION fn_trust0_auto_on_missing_fields();
*/

-- ------------------------------------------------------------
-- CC-05: trust_class forward-only (BLOCKER — NOTA-R-05)
-- Gatilho: BEFORE UPDATE em legal_source_snapshots
-- PERMANENTE: nunca remover
-- STEP 1: FUNCTION — STEP 2: TRIGGER
-- ------------------------------------------------------------

-- STEP 1 — CREATE FUNCTION (executar primeiro):
/*
CREATE OR REPLACE FUNCTION fn_trust_class_forward_only_check()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    trust_order TEXT[] := ARRAY[
        'TRUST-0','TRUST-1','TRUST-2','TRUST-3','TRUST-4','TRUST-5'
    ];
    rank_before INT;
    rank_after  INT;
BEGIN
    SELECT array_position(trust_order, OLD.trust_class) INTO rank_before;
    SELECT array_position(trust_order, NEW.trust_class) INTO rank_after;
    IF rank_after < rank_before THEN
        RAISE EXCEPTION 'trust_class regression prohibited: % -> %',
            OLD.trust_class, NEW.trust_class
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NEW;
END;
$$;
*/

-- STEP 2 — CREATE TRIGGER (executar somente após STEP 1):
/*
CREATE TRIGGER trg_ss_trust_class_forward_only
    BEFORE UPDATE ON legal_source_snapshots
    FOR EACH ROW
    WHEN (OLD.trust_class IS DISTINCT FROM NEW.trust_class)
    EXECUTE FUNCTION fn_trust_class_forward_only_check();
*/

-- ------------------------------------------------------------
-- CC-06: TRUST-0/1 exige quarantine_record
-- Gatilho: AFTER INSERT OR UPDATE em legal_source_snapshots
-- STEP 1: FUNCTION — STEP 2: TRIGGER
-- ------------------------------------------------------------

-- STEP 1 — CREATE FUNCTION (executar primeiro):
/*
CREATE OR REPLACE FUNCTION fn_trust01_requires_quarantine_record()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.trust_class IN ('TRUST-0','TRUST-1') THEN
        IF NOT EXISTS (
            SELECT 1 FROM legal_quarantine_records
            WHERE content_id = NEW.content_id
        ) THEN
            RAISE EXCEPTION
                'quarantine_record required for trust_class %: content_id %',
                NEW.trust_class, NEW.content_id
                USING ERRCODE = 'foreign_key_violation';
        END IF;
    END IF;
    RETURN NEW;
END;
$$;
*/

-- STEP 2 — CREATE TRIGGER (executar somente após STEP 1):
/*
CREATE TRIGGER trg_ss_trust01_quarantine_required
    AFTER INSERT OR UPDATE ON legal_source_snapshots
    FOR EACH ROW
    WHEN (NEW.trust_class IN ('TRUST-0','TRUST-1'))
    EXECUTE FUNCTION fn_trust01_requires_quarantine_record();
*/

-- ------------------------------------------------------------
-- CC-08: conflict_detected exige conflict_record
-- Gatilho: AFTER INSERT OR UPDATE em legal_source_snapshots
-- STEP 1: FUNCTION — STEP 2: TRIGGER
-- ------------------------------------------------------------

-- STEP 1 — CREATE FUNCTION (executar primeiro):
/*
CREATE OR REPLACE FUNCTION fn_conflict_detected_requires_record()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.conflict_status = 'conflict_detected' THEN
        IF NEW.conflict_record_id IS NULL THEN
            RAISE EXCEPTION
                'conflict_record required for conflict_status:conflict_detected: snapshot_id %',
                NEW.snapshot_id
                USING ERRCODE = 'not_null_violation';
        END IF;
    END IF;
    RETURN NEW;
END;
$$;
*/

-- STEP 2 — CREATE TRIGGER (executar somente após STEP 1):
/*
CREATE TRIGGER trg_ss_conflict_record_required
    AFTER INSERT OR UPDATE ON legal_source_snapshots
    FOR EACH ROW
    WHEN (NEW.conflict_status = 'conflict_detected')
    EXECUTE FUNCTION fn_conflict_detected_requires_record();
*/

-- ------------------------------------------------------------
-- CC-14: chain_of_custody_id imutável (PERMANENTE)
-- Gatilho: BEFORE UPDATE em legal_source_snapshots
-- PERMANENTE: nunca remover
-- STEP 1: FUNCTION — STEP 2: TRIGGER
-- ------------------------------------------------------------

-- STEP 1 — CREATE FUNCTION (executar primeiro):
/*
CREATE OR REPLACE FUNCTION fn_chain_of_custody_immutable()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF OLD.chain_of_custody_id IS NOT NULL AND
       NEW.chain_of_custody_id IS DISTINCT FROM OLD.chain_of_custody_id
    THEN
        RAISE EXCEPTION
            'chain_of_custody_id is immutable: cannot change % to %',
            OLD.chain_of_custody_id, NEW.chain_of_custody_id
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NEW;
END;
$$;
*/

-- STEP 2 — CREATE TRIGGER (executar somente após STEP 1):
/*
CREATE TRIGGER trg_ss_chain_of_custody_immutable
    BEFORE UPDATE ON legal_source_snapshots
    FOR EACH ROW
    WHEN (OLD.chain_of_custody_id IS DISTINCT FROM NEW.chain_of_custody_id)
    EXECUTE FUNCTION fn_chain_of_custody_immutable();
*/

-- ------------------------------------------------------------
-- CC-15: connector_bypass → escalada fw-governor
-- Gatilho: AFTER INSERT em legal_quarantine_records
-- STEP 1: FUNCTION — STEP 2: TRIGGER
-- NOTA: legal_governance_escalations não definida nesta fase — adaptar à tabela real
-- ------------------------------------------------------------

-- STEP 1 — CREATE FUNCTION (executar primeiro):
/*
CREATE OR REPLACE FUNCTION fn_connector_bypass_escalation()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.contamination_vector = 'connector_bypass' THEN
        -- legal_governance_escalations não definida nesta fase.
        -- Adaptar INSERT à tabela de escalada real antes de executar.
        INSERT INTO legal_governance_escalations (
            escalation_type, source_table, source_id, reason, created_at
        ) VALUES (
            'connector_bypass_detected',
            'legal_quarantine_records',
            NEW.quarantine_id::TEXT,
            'contamination_vector = connector_bypass',
            NOW()
        );
    END IF;
    RETURN NEW;
END;
$$;
*/

-- STEP 2 — CREATE TRIGGER (executar somente após STEP 1 e tabela de escalada criada):
/*
CREATE TRIGGER trg_qr_connector_bypass_escalation
    AFTER INSERT ON legal_quarantine_records
    FOR EACH ROW
    WHEN (NEW.contamination_vector = 'connector_bypass')
    EXECUTE FUNCTION fn_connector_bypass_escalation();
*/

-- ============================================================
-- SUMÁRIO DE CONSTRAINTS
-- PATCH 8.8B (NOTA-R-05 RESOLVIDA): todas as TRIGGER_BASED agora têm
-- CREATE FUNCTION draft completo + CREATE TRIGGER (ambos comentados).
-- ============================================================

-- CC  | Tipo         | Tabela                    | Status neste arquivo
-- ----|--------------|---------------------------|-----------------------------
-- 01  | CHECK+TRIGGER| legal_source_snapshots    | CHECK inline em 001; FUNCTION+TRIGGER draft aqui
-- 02  | CHECK        | legal_source_snapshots    | ALTER TABLE acima
-- 03  | CHECK        | legal_source_snapshots    | ALTER TABLE acima
-- 04  | CHECK        | legal_quarantine_records  | inline em 004
-- 05  | TRIGGER PERM | legal_source_snapshots    | FUNCTION+TRIGGER draft aqui (NOTA-R-05)
-- 06  | TRIGGER      | legal_source_snapshots    | FUNCTION+TRIGGER draft aqui
-- 07  | CHECK        | legal_quarantine_records  | inline em 004
-- 08  | TRIGGER      | legal_source_snapshots    | FUNCTION+TRIGGER draft aqui
-- 09  | CHECK        | legal_source_snapshots    | inline em 001
-- 10  | CHECK (fase) | legal_connector_logs      | inline em 003
-- 11  | CHECK (fase) | legal_connector_logs      | inline em 003
-- 12  | CHECK (fase) | legal_connector_logs      | inline em 003
-- 13  | CHECK (fase) | legal_connector_logs      | inline em 003
-- 14  | TRIGGER PERM | legal_source_snapshots    | FUNCTION+TRIGGER draft aqui (PERMANENTE)
-- 15  | TRIGGER      | legal_quarantine_records  | FUNCTION+TRIGGER draft aqui
-- 16  | CHECK PERM   | legal_rag_index_manifests | inline em 007
-- 17  | CHECK PERM   | legal_rag_index_manifests | inline em 007

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 009
-- ============================================================
