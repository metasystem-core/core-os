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
-- TABELA: legal_rag_index_manifests
-- BLUEPRINT: 007_legal_rag_index_manifest.blueprint.yaml (iteração 8.7, patch 8.7B OBS-05)
-- CAMPOS: 18 campos | 12 NOT NULL | 6 NULLABLE
-- ORDEM DE CRIAÇÃO: STEP 8 (sem FKs — independente)
-- DEPENDÊNCIAS: nenhuma FK para outras tabelas nesta fase
-- INVARIANTES CRÍTICOS: RAG_updates=0, embeddings_created=0
-- PATCH OBS-05 8.7B: source_scope corrigido required:false→true, nullable:true→false
-- ============================================================

CREATE TABLE legal_rag_index_manifests (

    -- --------------------------------------------------------
    -- IDENTIFICAÇÃO
    -- --------------------------------------------------------

    index_id                UUID            NOT NULL DEFAULT gen_random_uuid(),
    index_name              TEXT            NOT NULL,
    index_type              TEXT            NOT NULL,

    -- --------------------------------------------------------
    -- TRUST CLASS PERMITIDAS/PROIBIDAS
    -- --------------------------------------------------------

    allowed_trust_classes   TEXT[]          NOT NULL DEFAULT ARRAY['TRUST-3','TRUST-4','TRUST-5'],
    prohibited_trust_classes TEXT[]         NOT NULL DEFAULT ARRAY['TRUST-0','TRUST-1','TRUST-2'],

    -- --------------------------------------------------------
    -- ESCOPO E DOCUMENTOS
    -- --------------------------------------------------------

    allowed_document_types  TEXT[]          NULL DEFAULT ARRAY[]::TEXT[],
    prohibited_document_types TEXT[]        NULL DEFAULT ARRAY[]::TEXT[],

    -- OBS-05 8.7B patch: source_scope corrigido required:false→true, nullable:true→false
    -- DEFAULT 'federal_only' preservado (conservador)
    source_scope            TEXT            NOT NULL DEFAULT 'federal_only',

    -- --------------------------------------------------------
    -- EMBEDDING (INVARIANTE: NULL NESTA FASE)
    -- --------------------------------------------------------

    embedding_model         TEXT            NULL,
    embedding_created_at    TIMESTAMPTZ     NULL,
    corpus_version          TEXT            NULL,

    -- --------------------------------------------------------
    -- POLÍTICAS DE SEGURANÇA
    -- --------------------------------------------------------

    -- CC-17: validation_required SEMPRE true para RAG jurídico (PROIBIDO = false)
    validation_required     BOOLEAN         NOT NULL DEFAULT TRUE,
    stale_risk_policy       TEXT            NOT NULL DEFAULT 'block_critical',
    conflict_policy         TEXT            NOT NULL DEFAULT 'block_conflict_detected',
    quarantine_policy       TEXT            NOT NULL DEFAULT 'block_quarantined',

    -- --------------------------------------------------------
    -- TIMESTAMPS
    -- --------------------------------------------------------

    created_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    notes                   TEXT            NULL,

    -- --------------------------------------------------------
    -- PRIMARY KEY
    -- --------------------------------------------------------

    CONSTRAINT pk_legal_rag_index_manifests
        PRIMARY KEY (index_id),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — ENUMS
    -- --------------------------------------------------------

    CONSTRAINT ck_rim_index_type
        CHECK (index_type IN ('semantic','keyword','hybrid')),

    CONSTRAINT ck_rim_source_scope
        CHECK (source_scope IN ('federal_only','all_jurisdictions','custom')),

    CONSTRAINT ck_rim_stale_risk_policy
        CHECK (stale_risk_policy IN ('block_critical','flag_high','accept_all')),

    CONSTRAINT ck_rim_conflict_policy
        CHECK (conflict_policy IN (
            'block_conflict_detected','flag_conflict','accept_all'
        )),

    CONSTRAINT ck_rim_quarantine_policy
        CHECK (quarantine_policy IN ('block_quarantined','flag_quarantined')),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — INVARIANTES DE SEGURANÇA PERMANENTES
    -- --------------------------------------------------------

    -- CC-16 (permanente): TRUST-0/1/2 NUNCA em allowed_trust_classes
    CONSTRAINT ck_rim_allowed_excludes_low_trust
        CHECK (
            NOT ('TRUST-0' = ANY(allowed_trust_classes)) AND
            NOT ('TRUST-1' = ANY(allowed_trust_classes)) AND
            NOT ('TRUST-2' = ANY(allowed_trust_classes))
        ),

    -- CC-16 (permanente): TRUST-0/1/2 SEMPRE em prohibited_trust_classes
    CONSTRAINT ck_rim_prohibited_includes_low_trust
        CHECK (
            'TRUST-0' = ANY(prohibited_trust_classes) AND
            'TRUST-1' = ANY(prohibited_trust_classes) AND
            'TRUST-2' = ANY(prohibited_trust_classes)
        ),

    -- CC-17 (permanente): validation_required PROIBIDO = false
    CONSTRAINT ck_rim_validation_required_immutable
        CHECK (validation_required = TRUE),

    -- stale_risk_policy:accept_all PROIBIDO para RAG jurídico
    CONSTRAINT ck_rim_stale_accept_all_prohibited
        CHECK (stale_risk_policy <> 'accept_all'),

    -- conflict_policy:accept_all PROIBIDO para RAG jurídico
    CONSTRAINT ck_rim_conflict_accept_all_prohibited
        CHECK (conflict_policy <> 'accept_all'),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — INVARIANTES DE FASE (remover quando aprovado)
    -- --------------------------------------------------------

    -- embedding_created_at DEVE ser NULL enquanto embeddings_created invariante = 0
    -- REVIEW NOTE: remover esta constraint na fase futura aprovada
    CONSTRAINT ck_rim_embedding_created_at_null
        CHECK (embedding_created_at IS NULL)

);

-- ============================================================
-- COMENTÁRIOS DE AUDITORIA
-- ============================================================

COMMENT ON TABLE legal_rag_index_manifests IS
    'DRAFT_NOT_FOR_EXECUTION — Manifesto de configuração de índice RAG jurídico. '
    'INVARIANTES: RAG_updates=0, embeddings_created=0. Nenhum índice ativo nesta fase. '
    'OBS-05 8.7B: source_scope corrigido para NOT NULL DEFAULT federal_only. '
    'CC-16 (permanente): TRUST-0/1/2 NUNCA em allowed_trust_classes. '
    'CC-17 (permanente): validation_required SEMPRE true. '
    'Blueprint 007, iteração 8.7B. NÃO EXECUTAR SEM APROVAÇÃO DO OPERADOR PRIMÁRIO.';

COMMENT ON COLUMN legal_rag_index_manifests.allowed_trust_classes IS
    'DRAFT — DEFAULT [TRUST-3, TRUST-4, TRUST-5]. '
    'TRUST-0/1/2 PROIBIDOS aqui (CC-16 permanente). Nunca remover esta restrição.';

COMMENT ON COLUMN legal_rag_index_manifests.validation_required IS
    'DRAFT — SEMPRE true. validation_required=false = violação de firewall (CC-17 permanente).';

COMMENT ON COLUMN legal_rag_index_manifests.source_scope IS
    'DRAFT — NOT NULL (OBS-05 8.7B). DEFAULT federal_only (conservador). '
    'all_jurisdictions exige stale_risk_policy mínimo block_critical.';

COMMENT ON COLUMN legal_rag_index_manifests.embedding_created_at IS
    'DRAFT — DEVE ser NULL enquanto embeddings_created invariante = 0. '
    'CHECK constraint ck_rim_embedding_created_at_null enforça invariante de fase.';

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 007
-- ============================================================
