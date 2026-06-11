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
-- TABELA: legal_conflict_records
-- BLUEPRINT: 006_legal_conflict_record.blueprint.yaml (iteração 8.7, patch 8.7B OBS-04)
-- CAMPOS: 17 campos | 12 NOT NULL | 5 NULLABLE
-- ORDEM DE CRIAÇÃO: STEP 7 (após legal_source_snapshots)
-- DEPENDÊNCIAS:
--   FK OBRIGATÓRIA → legal_source_snapshots.snapshot_id [primary] (RESTRICT)
--   FK OPCIONAL → legal_source_snapshots.snapshot_id [secondary] (SET NULL)
-- REGRA-07: todo snapshot com conflict_status:conflict_detected DEVE ter registro aqui
-- PATCH OBS-04 8.7B: source_a corrigido required:false→true, nullable:true→false
-- NOTA: esta tabela é referenciada por legal_source_snapshots.conflict_record_id (FK futura)
-- ============================================================

CREATE TABLE legal_conflict_records (

    -- --------------------------------------------------------
    -- IDENTIFICAÇÃO
    -- --------------------------------------------------------

    conflict_id             UUID            NOT NULL DEFAULT gen_random_uuid(),
    conflict_type           TEXT            NOT NULL DEFAULT 'unknown',

    -- --------------------------------------------------------
    -- SNAPSHOTS EM CONFLITO
    -- --------------------------------------------------------

    primary_snapshot_id     UUID            NOT NULL,
    secondary_snapshot_id   UUID            NULL,

    -- --------------------------------------------------------
    -- FONTES (OBS-04 patch: source_a NOT NULL)
    -- --------------------------------------------------------

    -- OBS-04 8.7B patch: source_a corrigido required:false→true, nullable:true→false
    -- Para conflitos internos ao snapshot primário: usar primary_snapshot_id::text como valor
    source_a                TEXT            NOT NULL,
    source_b                TEXT            NULL,

    -- --------------------------------------------------------
    -- DESCRIÇÃO DO CONFLITO
    -- --------------------------------------------------------

    conflict_detected_at    TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    conflict_description    TEXT            NOT NULL,
    affected_fields         TEXT[]          NULL DEFAULT ARRAY[]::TEXT[],

    -- --------------------------------------------------------
    -- SEVERIDADE E STATUS
    -- --------------------------------------------------------

    severity                TEXT            NOT NULL DEFAULT 'high',
    resolution_status       TEXT            NOT NULL DEFAULT 'unresolved',
    preferred_source_if_any TEXT            NULL,

    -- --------------------------------------------------------
    -- CONCLUSÃO JURÍDICA
    -- --------------------------------------------------------

    legal_conclusion_allowed    BOOLEAN     NOT NULL DEFAULT FALSE,
    required_action         TEXT[]          NOT NULL DEFAULT ARRAY['verify_primary_source','human_review'],

    -- --------------------------------------------------------
    -- TIMESTAMPS
    -- --------------------------------------------------------

    created_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    notes                   TEXT            NULL,

    -- --------------------------------------------------------
    -- PRIMARY KEY
    -- --------------------------------------------------------

    CONSTRAINT pk_legal_conflict_records
        PRIMARY KEY (conflict_id),

    -- --------------------------------------------------------
    -- FOREIGN KEYS
    -- --------------------------------------------------------

    -- FK obrigatória: primary snapshot não pode ser deletado com conflict_records
    CONSTRAINT fk_conflict_primary_snapshot
        FOREIGN KEY (primary_snapshot_id)
        REFERENCES legal_source_snapshots (snapshot_id)
        ON DELETE RESTRICT,

    -- FK opcional: secondary snapshot pode ser SET NULL
    CONSTRAINT fk_conflict_secondary_snapshot
        FOREIGN KEY (secondary_snapshot_id)
        REFERENCES legal_source_snapshots (snapshot_id)
        ON DELETE SET NULL,

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — ENUMS
    -- --------------------------------------------------------

    CONSTRAINT ck_cr_conflict_type
        CHECK (conflict_type IN (
            'T-01','T-02','T-03','T-04','T-05','T-06','T-07','T-08',
            'parser_conflict','unknown'
        )),

    CONSTRAINT ck_cr_severity
        CHECK (severity IN ('low','medium','high','critical','blocking')),

    CONSTRAINT ck_cr_resolution_status
        CHECK (resolution_status IN (
            'unresolved','under_review','provisionally_resolved',
            'resolved','requires_human_validation','permanently_unresolved'
        )),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — REGRAS DE NEGÓCIO
    -- --------------------------------------------------------

    -- severity:blocking exige legal_conclusion_allowed = false (imutável enquanto blocking)
    CONSTRAINT ck_cr_blocking_no_legal_conclusion
        CHECK (
            severity <> 'blocking' OR
            legal_conclusion_allowed = FALSE
        ),

    -- T-06 (hash conflict) = severity IN ('critical','blocking')
    CONSTRAINT ck_cr_t06_requires_critical_severity
        CHECK (
            conflict_type <> 'T-06' OR
            severity IN ('critical','blocking')
        ),

    -- resolution_status:resolved com legal_conclusion_allowed:true exige preferred_source_if_any
    CONSTRAINT ck_cr_resolved_with_conclusion_requires_preferred_source
        CHECK (
            NOT (resolution_status = 'resolved' AND
                 legal_conclusion_allowed = TRUE AND
                 preferred_source_if_any IS NULL)
        ),

    -- preferred_source_if_any somente se resolution_status != unresolved
    CONSTRAINT ck_cr_preferred_source_only_after_review
        CHECK (
            preferred_source_if_any IS NULL OR
            resolution_status <> 'unresolved'
        )

);

-- ============================================================
-- COMENTÁRIOS DE AUDITORIA
-- ============================================================

COMMENT ON TABLE legal_conflict_records IS
    'DRAFT_NOT_FOR_EXECUTION — Registros de conflito entre snapshots. '
    'REGRA-07: snapshot com conflict_status:conflict_detected exige registro aqui. '
    'FK RESTRICT para primary_snapshot (snapshot primário não pode ser deletado). '
    'OBS-04 8.7B: source_a corrigido para NOT NULL. '
    'NOTA: legal_source_snapshots.conflict_record_id referencia esta tabela (FK futura via ALTER TABLE). '
    'Blueprint 006, iteração 8.7B. NÃO EXECUTAR SEM APROVAÇÃO DO OPERADOR PRIMÁRIO.';

COMMENT ON COLUMN legal_conflict_records.legal_conclusion_allowed IS
    'DRAFT — DEFAULT false. severity:blocking = false imutável enquanto blocking. '
    'true somente após resolução com revisão humana confirmada.';

COMMENT ON COLUMN legal_conflict_records.source_a IS
    'DRAFT — NOT NULL (OBS-04 8.7B). Para conflitos internos: usar primary_snapshot_id::text.';

-- ============================================================
-- NOTA DE FK CIRCULAR
-- ============================================================
--
-- legal_source_snapshots.conflict_record_id → legal_conflict_records.conflict_id
-- Esta FK não foi incluída na criação de legal_source_snapshots (arquivo 001)
-- porque legal_conflict_records não existia ainda.
-- Adicionar via ALTER TABLE após criação de ambas as tabelas:
--
--   ALTER TABLE legal_source_snapshots
--     ADD CONSTRAINT fk_snapshot_conflict_record
--     FOREIGN KEY (conflict_record_id)
--     REFERENCES legal_conflict_records (conflict_id)
--     ON DELETE SET NULL;
--
-- ESTA INSTRUÇÃO ALTER TABLE TAMBÉM É DRAFT_NOT_FOR_EXECUTION.
-- Incluída no arquivo 009 (constraints).

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 006
-- ============================================================
