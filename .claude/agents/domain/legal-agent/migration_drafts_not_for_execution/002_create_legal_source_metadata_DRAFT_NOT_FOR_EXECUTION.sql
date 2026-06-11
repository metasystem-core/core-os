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
-- TABELA: legal_source_metadata
-- BLUEPRINT: 002_legal_source_metadata.blueprint.yaml (iteração 8.7, patch 8.7B)
-- CAMPOS: 30 campos | 18 NOT NULL | 12 NULLABLE
-- ORDEM DE CRIAÇÃO: STEP 3 (após legal_source_snapshots)
-- DEPENDÊNCIAS: FK opcional → legal_source_snapshots.snapshot_id (SET NULL)
-- NOTA OBS-03: authority_level = autoridade do LOCALIZADOR, não do documento
-- ============================================================

CREATE TABLE legal_source_metadata (

    -- --------------------------------------------------------
    -- IDENTIFICAÇÃO
    -- --------------------------------------------------------

    metadata_id             UUID            NOT NULL DEFAULT gen_random_uuid(),
    snapshot_id             UUID            NULL,
    source_id               TEXT            NOT NULL DEFAULT 'UNKNOWN',

    -- --------------------------------------------------------
    -- CLASSIFICAÇÃO DO DOCUMENTO
    -- --------------------------------------------------------

    document_type           TEXT            NOT NULL DEFAULT 'unknown',
    norm_number             TEXT            NULL,
    norm_year               SMALLINT        NULL,
    title                   TEXT            NULL,
    issuing_body            TEXT            NULL,
    jurisdiction            TEXT            NOT NULL DEFAULT 'unknown',

    -- --------------------------------------------------------
    -- VIGÊNCIA
    -- --------------------------------------------------------

    publication_date        DATE            NULL,
    effective_date          DATE            NULL,
    revoked_status          TEXT            NOT NULL DEFAULT 'unknown',
    revoked_by              TEXT            NULL,
    amended_by              TEXT[]          NULL DEFAULT ARRAY[]::TEXT[],
    amendment_detected      BOOLEAN         NOT NULL DEFAULT FALSE,
    consolidation_status    TEXT            NULL DEFAULT 'unknown',
    version_label           TEXT            NULL,

    -- --------------------------------------------------------
    -- AUTORIDADE DO LOCALIZADOR (não do documento — OBS-03)
    -- --------------------------------------------------------

    authority_level         SMALLINT        NOT NULL,
    official_source         BOOLEAN         NOT NULL DEFAULT FALSE,

    -- --------------------------------------------------------
    -- METADADO E CONFIANÇA
    -- --------------------------------------------------------

    metadata_source_type    TEXT            NOT NULL DEFAULT 'unknown',
    metadata_confidence     TEXT            NOT NULL DEFAULT 'unknown',
    fetched_at              TIMESTAMPTZ     NOT NULL,

    -- --------------------------------------------------------
    -- STATUS DE VALIDAÇÃO E RISCO
    -- --------------------------------------------------------

    stale_risk              TEXT            NOT NULL DEFAULT 'unknown',
    -- PATCH 8.8B (NOTA-R-02 RESOLVIDA): 'no_conflict' confirmado como DEFAULT canônico.
    -- ENUM-06 não inclui 'unknown'. 'no_conflict' é semanticamente correto para estado inicial.
    conflict_status         TEXT            NOT NULL DEFAULT 'no_conflict',
    validation_status       TEXT            NOT NULL DEFAULT 'not_started',

    -- --------------------------------------------------------
    -- USO PERMITIDO E PROIBIDO
    -- --------------------------------------------------------

    allowed_use             TEXT[]          NOT NULL DEFAULT ARRAY['metadata_locator','lead_only'],
    prohibited_use          TEXT[]          NOT NULL DEFAULT ARRAY[
        'legal_advice','procedural_deadline','protocolable_piece',
        'legal_strategy','rights_confirmation','victory_probability',
        'damages_calculation','RAG_validated_index','operational_memory'
    ],

    -- --------------------------------------------------------
    -- TIMESTAMPS
    -- --------------------------------------------------------

    created_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    notes                   TEXT            NULL,

    -- --------------------------------------------------------
    -- PRIMARY KEY
    -- --------------------------------------------------------

    CONSTRAINT pk_legal_source_metadata
        PRIMARY KEY (metadata_id),

    -- --------------------------------------------------------
    -- FOREIGN KEY (opcional — SET NULL se snapshot removido)
    -- --------------------------------------------------------

    CONSTRAINT fk_metadata_snapshot
        FOREIGN KEY (snapshot_id)
        REFERENCES legal_source_snapshots (snapshot_id)
        ON DELETE SET NULL,

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — ENUMS
    -- --------------------------------------------------------

    CONSTRAINT ck_sm_document_type
        CHECK (document_type IN (
            'lei_federal','lei_estadual','lei_municipal','decreto','portaria',
            'resolucao','acordao','sumula','jurisprudencia','processo_ativo',
            'peticao','laudo','doutrina','auxiliar','unknown'
        )),

    CONSTRAINT ck_sm_jurisdiction
        CHECK (jurisdiction IN (
            'federal','estadual','municipal','distrital','supranacional','unknown'
        )),

    CONSTRAINT ck_sm_revoked_status
        CHECK (revoked_status IN (
            'active','revoked','partially_revoked','suspended','unknown'
        )),

    CONSTRAINT ck_sm_consolidation_status
        CHECK (consolidation_status IS NULL OR consolidation_status IN (
            'consolidated','original','unknown'
        )),

    CONSTRAINT ck_sm_authority_level
        CHECK (authority_level BETWEEN 1 AND 7),

    CONSTRAINT ck_sm_metadata_source_type
        CHECK (metadata_source_type IN (
            'primary_text','official_metadata','aggregator_metadata',
            'manual_entry','metadata_only','unknown'
        )),

    CONSTRAINT ck_sm_metadata_confidence
        CHECK (metadata_confidence IN ('high','medium','low','unknown')),

    CONSTRAINT ck_sm_stale_risk
        CHECK (stale_risk IN ('low','medium','high','critical','unknown')),

    CONSTRAINT ck_sm_conflict_status
        CHECK (conflict_status IN (
            'no_conflict','conflict_detected','under_review',
            'provisionally_resolved','resolved'
        )),

    CONSTRAINT ck_sm_validation_status
        CHECK (validation_status IN (
            'not_started','pending','in_progress','hash_verified',
            'provenance_verified','authority_verified',
            'human_review_pending','human_review_in_progress',
            'validated_snapshot','human_reviewed','conflict_blocked','failed'
        )),

    CONSTRAINT ck_sm_norm_year
        CHECK (norm_year IS NULL OR (norm_year BETWEEN 1500 AND 2200)),

    CONSTRAINT ck_sm_publication_date_not_future
        CHECK (publication_date IS NULL OR publication_date <= CURRENT_DATE),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — REGRAS DE NEGÓCIO
    -- --------------------------------------------------------

    -- REGRA-01: snapshot_id NULL exige metadata_source_type = 'metadata_only'
    CONSTRAINT ck_sm_null_snapshot_requires_metadata_only
        CHECK (
            snapshot_id IS NOT NULL OR
            metadata_source_type = 'metadata_only'
        ),

    -- authority_level=7 (auxiliar) exige metadata_confidence IN ('low','unknown')
    CONSTRAINT ck_sm_authority7_max_low_confidence
        CHECK (
            authority_level <> 7 OR
            metadata_confidence IN ('low','unknown')
        )

);

-- ============================================================
-- COMENTÁRIOS DE AUDITORIA
-- ============================================================

COMMENT ON TABLE legal_source_metadata IS
    'DRAFT_NOT_FOR_EXECUTION — Metadados normativos. Localizador, não corpus. '
    'authority_level = autoridade do SISTEMA DE METADADOS (OBS-03), NÃO do documento. '
    'Blueprint 002, iteração 8.7B. NÃO EXECUTAR SEM APROVAÇÃO DO OPERADOR PRIMÁRIO.';

COMMENT ON COLUMN legal_source_metadata.authority_level IS
    'DRAFT — Autoridade do LOCALIZADOR/SISTEMA que forneceu os metadados (ex.: LexML), '
    'NÃO do documento normativo em si. OBS-03 8.6B/8.7B.';

COMMENT ON COLUMN legal_source_metadata.snapshot_id IS
    'DRAFT — FK opcional. NULL permitido se metadata_source_type = metadata_only (REGRA-01).';

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 002
-- ============================================================
