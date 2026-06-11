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
-- TABELA: legal_quarantine_records
-- BLUEPRINT: 004_legal_quarantine_record.blueprint.yaml (iteração 8.7, patch 8.7B)
-- CAMPOS: 22 campos | 12 NOT NULL | 10 NULLABLE
-- ORDEM DE CRIAÇÃO: STEP 5 (após legal_source_snapshots)
-- DEPENDÊNCIAS: FK opcional → legal_source_snapshots.snapshot_id (SET NULL)
-- REGRA-02: todo snapshot com trust_class IN (TRUST-0, TRUST-1) DEVE ter registro aqui
-- TRUST-0 = definitivo (rejected_unusable). TRUST-1 = promovível se chain_of_custody_id presente
-- ============================================================

CREATE TABLE legal_quarantine_records (

    -- --------------------------------------------------------
    -- IDENTIFICAÇÃO
    -- --------------------------------------------------------

    quarantine_id           UUID            NOT NULL DEFAULT gen_random_uuid(),
    snapshot_id             UUID            NULL,
    content_id              TEXT            NOT NULL,
    chain_of_custody_id     UUID            NULL,

    -- --------------------------------------------------------
    -- ORIGEM E VETOR
    -- --------------------------------------------------------

    received_from           TEXT            NOT NULL DEFAULT 'unknown',
    contamination_vector    TEXT            NOT NULL DEFAULT 'unknown',

    -- --------------------------------------------------------
    -- TRUST CLASS E QUARENTENA
    -- --------------------------------------------------------

    initial_trust_class     TEXT            NOT NULL DEFAULT 'TRUST-1',
    quarantine_reason       TEXT            NOT NULL DEFAULT 'unknown',
    suspected_risk          TEXT            NOT NULL DEFAULT 'high',
    missing_provenance_fields   TEXT[]      NULL DEFAULT ARRAY[]::TEXT[],

    -- --------------------------------------------------------
    -- CONECTOR RELACIONADO
    -- --------------------------------------------------------

    related_connector_id    TEXT            NULL,
    inherited_connector_risk    TEXT        NULL,

    -- --------------------------------------------------------
    -- USO PERMITIDO E PROIBIDO
    -- --------------------------------------------------------

    allowed_use             TEXT[]          NOT NULL DEFAULT ARRAY['none'],
    prohibited_use          TEXT[]          NOT NULL DEFAULT ARRAY[
        'legal_advice','procedural_deadline','protocolable_piece',
        'legal_strategy','rights_confirmation','victory_probability',
        'damages_calculation','RAG_validated_index','operational_memory'
    ],

    -- --------------------------------------------------------
    -- PROMOÇÃO
    -- --------------------------------------------------------

    promotion_possible      BOOLEAN         NOT NULL DEFAULT FALSE,

    -- --------------------------------------------------------
    -- RESOLUÇÃO
    -- --------------------------------------------------------

    resolution_notes        TEXT            NULL,
    quarantine_resolved_at  TIMESTAMPTZ     NULL,
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

    CONSTRAINT pk_legal_quarantine_records
        PRIMARY KEY (quarantine_id),

    -- --------------------------------------------------------
    -- FOREIGN KEY (opcional — SET NULL se snapshot removido)
    -- --------------------------------------------------------

    CONSTRAINT fk_quarantine_snapshot
        FOREIGN KEY (snapshot_id)
        REFERENCES legal_source_snapshots (snapshot_id)
        ON DELETE SET NULL,

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — ENUMS
    -- --------------------------------------------------------

    CONSTRAINT ck_qr_initial_trust_class
        CHECK (initial_trust_class IN ('TRUST-0','TRUST-1')),

    CONSTRAINT ck_qr_received_from
        CHECK (received_from IN (
            'operator','rag-agent','norm-agent','doc-agent',
            'intake-agent','simb-agent','learn-agent','external_api','unknown'
        )),

    CONSTRAINT ck_qr_contamination_vector
        CHECK (contamination_vector IN (
            'user_pasted_text','other_agent_output','aggregator_content',
            'blog_article_news','unofficial_scraping','RAG_external',
            'memory_external','connector_bypass','unknown'
        )),

    CONSTRAINT ck_qr_quarantine_reason
        CHECK (quarantine_reason IN (
            'missing_source_url','missing_checksum','missing_fetched_at',
            'missing_chain_of_custody','unofficial_source','auxiliary_source',
            'connector_high_risk','restricted_review_required',
            'bypass_detected','stale_risk','conflict_detected',
            'LLM_generated_content','OCR_unvalidated','unknown'
        )),

    CONSTRAINT ck_qr_suspected_risk
        CHECK (suspected_risk IN ('low','medium','high','critical')),

    CONSTRAINT ck_qr_related_connector_id
        CHECK (related_connector_id IS NULL OR related_connector_id LIKE 'CONN-%'),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — REGRAS DE NEGÓCIO
    -- --------------------------------------------------------

    -- CC-07: TRUST-0 = definitivo — promotion_possible DEVE ser false
    CONSTRAINT ck_qr_trust0_not_promotable
        CHECK (
            initial_trust_class <> 'TRUST-0' OR
            promotion_possible = FALSE
        ),

    -- TRUST-1 com chain_of_custody_id NULL = promotion_possible DEVE ser false (REVIEW-03)
    CONSTRAINT ck_qr_trust1_no_custody_no_promotion
        CHECK (
            NOT (initial_trust_class = 'TRUST-1' AND
                 chain_of_custody_id IS NULL AND
                 promotion_possible = TRUE)
        )

);

-- ============================================================
-- COMENTÁRIOS DE AUDITORIA
-- ============================================================

COMMENT ON TABLE legal_quarantine_records IS
    'DRAFT_NOT_FOR_EXECUTION — Registros de quarentena. '
    'TRUST-0 e TRUST-1 obrigam quarantine_record correspondente (REGRA-02). '
    'TRUST-0 = definitivo (rejected_unusable). TRUST-1 = promovível se chain_of_custody_id presente. '
    'Blueprint 004, iteração 8.7B (OBS-02 patch: 23→22 campos, 13→12 required). '
    'NÃO EXECUTAR SEM APROVAÇÃO DO OPERADOR PRIMÁRIO.';

COMMENT ON COLUMN legal_quarantine_records.initial_trust_class IS
    'DRAFT — Somente TRUST-0 e TRUST-1. TRUST-0 = rejected_unusable (definitivo). '
    'TRUST-1 = quarantined_unverified (promovível apenas com chain_of_custody_id).';

COMMENT ON COLUMN legal_quarantine_records.promotion_possible IS
    'DRAFT — TRUST-0: sempre FALSE (CC-07). TRUST-1: TRUE somente se chain_of_custody_id presente (REVIEW-03).';

COMMENT ON COLUMN legal_quarantine_records.contamination_vector IS
    'DRAFT — connector_bypass = violação crítica. Trigger futuro: escalada imediata ao fw-governor.';

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 004
-- ============================================================
