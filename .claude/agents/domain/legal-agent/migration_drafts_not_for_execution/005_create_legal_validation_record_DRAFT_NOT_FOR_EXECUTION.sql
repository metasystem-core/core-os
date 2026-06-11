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
-- TABELA: legal_validation_records
-- BLUEPRINT: 005_legal_validation_record.blueprint.yaml (iteração 8.7, patch 8.7B OBS-03)
-- CAMPOS: 20 campos | 16 NOT NULL | 4 NULLABLE
-- ORDEM DE CRIAÇÃO: STEP 6 (após legal_source_snapshots)
-- DEPENDÊNCIAS: FK OBRIGATÓRIA → legal_source_snapshots.snapshot_id (RESTRICT)
-- PATCH OBS-03 8.7B: 5 campos corrigidos nullable→NOT NULL:
--   checks_performed, checks_failed, stale_risk_after_validation,
--   conflict_status_after_validation, trust_class_after
-- ============================================================

CREATE TABLE legal_validation_records (

    -- --------------------------------------------------------
    -- IDENTIFICAÇÃO
    -- --------------------------------------------------------

    validation_id           UUID            NOT NULL DEFAULT gen_random_uuid(),
    snapshot_id             UUID            NOT NULL,

    -- --------------------------------------------------------
    -- TIPO E EXECUTOR DA VALIDAÇÃO
    -- --------------------------------------------------------

    validation_type         TEXT            NOT NULL,
    validator_type          TEXT            NOT NULL,
    validation_status       TEXT            NOT NULL DEFAULT 'not_started',

    -- --------------------------------------------------------
    -- CHECKS EXECUTADOS (OBS-03 patch: NOT NULL)
    -- --------------------------------------------------------

    checks_performed        TEXT[]          NOT NULL DEFAULT ARRAY[]::TEXT[],
    checks_failed           TEXT[]          NOT NULL DEFAULT ARRAY[]::TEXT[],

    -- --------------------------------------------------------
    -- AVALIAÇÃO PÓS-VALIDAÇÃO (OBS-03 patch: NOT NULL com defaults conservadores)
    -- --------------------------------------------------------

    -- OBS-03 patch: DEFAULT 'unknown' (conservador) — era nullable:true/default:null
    stale_risk_after_validation     TEXT    NOT NULL DEFAULT 'unknown',

    -- OBS-03 patch: DEFAULT 'no_conflict' (conservador) — era nullable:true/default:null
    conflict_status_after_validation TEXT   NOT NULL DEFAULT 'no_conflict',

    -- --------------------------------------------------------
    -- PROGRESSÃO DE TRUST CLASS (OBS-03 patch: trust_class_after NOT NULL)
    -- --------------------------------------------------------

    trust_class_before      TEXT            NOT NULL,
    -- OBS-03 patch: NOT NULL — aplicação deve fornecer valor no INSERT
    -- Valor inicial deve ser igual a trust_class_before (trigger recomendado)
    trust_class_after       TEXT            NOT NULL,

    -- --------------------------------------------------------
    -- DECISÃO DE PROMOÇÃO
    -- --------------------------------------------------------

    promotion_decision      TEXT            NOT NULL DEFAULT 'deferred',
    promotion_blockers      TEXT[]          NULL DEFAULT ARRAY[]::TEXT[],

    -- --------------------------------------------------------
    -- REVISÃO HUMANA
    -- --------------------------------------------------------

    human_review_required   BOOLEAN         NOT NULL DEFAULT TRUE,
    human_review_completed  BOOLEAN         NOT NULL DEFAULT FALSE,
    reviewed_by             TEXT            NULL,
    reviewed_at             TIMESTAMPTZ     NULL,

    -- --------------------------------------------------------
    -- TIMESTAMPS
    -- --------------------------------------------------------

    created_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    notes                   TEXT            NULL,

    -- --------------------------------------------------------
    -- PRIMARY KEY
    -- --------------------------------------------------------

    CONSTRAINT pk_legal_validation_records
        PRIMARY KEY (validation_id),

    -- --------------------------------------------------------
    -- FOREIGN KEY (OBRIGATÓRIA — RESTRICT)
    -- --------------------------------------------------------

    CONSTRAINT fk_validation_snapshot
        FOREIGN KEY (snapshot_id)
        REFERENCES legal_source_snapshots (snapshot_id)
        ON DELETE RESTRICT,

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — ENUMS
    -- --------------------------------------------------------

    CONSTRAINT ck_vr_validation_type
        CHECK (validation_type IN (
            'technical','human_review','hash_verification',
            'authority_verification','provenance_check','conflict_check'
        )),

    CONSTRAINT ck_vr_validator_type
        CHECK (validator_type IN (
            'automated_hash_check','automated_provenance_check',
            'human_operator','human_lawyer'
        )),

    CONSTRAINT ck_vr_validation_status
        CHECK (validation_status IN (
            'not_started','pending','in_progress','hash_verified',
            'provenance_verified','authority_verified',
            'human_review_pending','human_review_in_progress',
            'validated_snapshot','human_reviewed','conflict_blocked','failed'
        )),

    CONSTRAINT ck_vr_stale_risk_after
        CHECK (stale_risk_after_validation IN (
            'low','medium','high','critical','unknown'
        )),

    CONSTRAINT ck_vr_conflict_status_after
        CHECK (conflict_status_after_validation IN (
            'no_conflict','conflict_detected','under_review',
            'provisionally_resolved','resolved'
        )),

    CONSTRAINT ck_vr_trust_class_before
        CHECK (trust_class_before IN (
            'TRUST-0','TRUST-1','TRUST-2','TRUST-3','TRUST-4','TRUST-5'
        )),

    CONSTRAINT ck_vr_trust_class_after
        CHECK (trust_class_after IN (
            'TRUST-0','TRUST-1','TRUST-2','TRUST-3','TRUST-4','TRUST-5'
        )),

    CONSTRAINT ck_vr_promotion_decision
        CHECK (promotion_decision IN (
            'promoted','rejected','deferred','requires_human_review'
        )),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — REGRAS DE NEGÓCIO
    -- --------------------------------------------------------

    -- promoted não pode ter checks_failed não-vazio
    CONSTRAINT ck_vr_promoted_requires_no_failures
        CHECK (
            promotion_decision <> 'promoted' OR
            checks_failed = ARRAY[]::TEXT[]
        ),

    -- TRUST-5 exige validator_type:human_lawyer (REGRA-11)
    CONSTRAINT ck_vr_trust5_requires_human_lawyer
        CHECK (
            trust_class_after <> 'TRUST-5' OR
            validator_type = 'human_lawyer'
        ),

    -- human_review_completed = true exige reviewed_by e reviewed_at
    CONSTRAINT ck_vr_human_review_requires_reviewer
        CHECK (
            human_review_completed = FALSE OR
            (reviewed_by IS NOT NULL AND reviewed_at IS NOT NULL)
        ),

    -- TRUST-0 = definitivo — promotion_decision não pode ser 'promoted'
    CONSTRAINT ck_vr_trust0_no_promotion
        CHECK (
            trust_class_before <> 'TRUST-0' OR
            promotion_decision IN ('rejected','deferred')
        ),

    -- conflict_status_after:conflict_detected bloqueia promoted (REGRA-07)
    CONSTRAINT ck_vr_conflict_detected_blocks_promotion
        CHECK (
            conflict_status_after_validation <> 'conflict_detected' OR
            promotion_decision <> 'promoted'
        )

);

-- ============================================================
-- COMENTÁRIOS DE AUDITORIA
-- ============================================================

COMMENT ON TABLE legal_validation_records IS
    'DRAFT_NOT_FOR_EXECUTION — Registros de validação de snapshots. '
    'FK RESTRICT para snapshots (snapshot não pode ser deletado com validation_records). '
    'OBS-03 8.7B: 5 campos corrigidos para NOT NULL (checks_performed, checks_failed, '
    'stale_risk_after_validation, conflict_status_after_validation, trust_class_after). '
    'Blueprint 005, iteração 8.7B. NÃO EXECUTAR SEM APROVAÇÃO DO OPERADOR PRIMÁRIO.';

COMMENT ON COLUMN legal_validation_records.trust_class_after IS
    'DRAFT — NOT NULL (OBS-03 8.7B). Sem DEFAULT estático. '
    'Aplicação deve fornecer valor no INSERT (geralmente = trust_class_before no início).';

COMMENT ON COLUMN legal_validation_records.checks_performed IS
    'DRAFT — NOT NULL (OBS-03 8.7B). DEFAULT ARRAY[] vazio. '
    'Documenta quais verificações foram executadas neste evento de validação.';

COMMENT ON COLUMN legal_validation_records.human_review_required IS
    'DRAFT — DEFAULT true (conservador). TRUST-5 exige true obrigatório. '
    'false somente para validações técnicas automáticas de TRUST-3 ou inferior.';

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 005
-- ============================================================
