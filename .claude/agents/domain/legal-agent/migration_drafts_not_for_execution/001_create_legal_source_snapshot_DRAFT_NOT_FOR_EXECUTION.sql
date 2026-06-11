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
-- TABELA: legal_source_snapshots
-- BLUEPRINT: 001_legal_source_snapshot.blueprint.yaml (iteração 8.7, patch 8.7B)
-- CAMPOS: 32 campos | 21 NOT NULL | 11 NULLABLE
-- ORDEM DE CRIAÇÃO: STEP 2 (após enums)
-- DEPENDÊNCIAS: nenhuma FK de entrada nesta tabela
--
-- REVISÃO OBRIGATÓRIA ANTES DE QUALQUER EXECUÇÃO:
--   - NOTA-R-01: DEFAULT validation_status (ver README)
--   - NOTA-R-02: DEFAULT conflict_status (ver README)
--   - NOTA-R-03: lista completa de CONN-001..CONN-013
--   - NOTA-R-04: lista completa de document_type values
-- ============================================================

CREATE TABLE legal_source_snapshots (

    -- --------------------------------------------------------
    -- IDENTIFICAÇÃO E RASTREABILIDADE
    -- --------------------------------------------------------

    snapshot_id             UUID            NOT NULL DEFAULT gen_random_uuid(),
    content_id              TEXT            NOT NULL,
    source_id               TEXT            NOT NULL DEFAULT 'UNKNOWN',
    source_name             TEXT            NOT NULL DEFAULT 'desconhecida',
    source_url              TEXT            NOT NULL,
    chain_of_custody_id     UUID            NOT NULL,

    -- --------------------------------------------------------
    -- AUTORIDADE E CLASSIFICAÇÃO DE FONTE
    -- --------------------------------------------------------

    authority_level         SMALLINT        NOT NULL,
    official_source         BOOLEAN         NOT NULL DEFAULT FALSE,
    connector_id            TEXT            NULL,
    connector_status_at_collection  TEXT    NULL,

    -- --------------------------------------------------------
    -- TRUST CLASS E QUARENTENA
    -- --------------------------------------------------------

    trust_class             TEXT            NOT NULL DEFAULT 'TRUST-1',
    quarantine_status       TEXT            NOT NULL DEFAULT 'quarantined_unverified',

    -- --------------------------------------------------------
    -- COLETA E INTEGRIDADE
    -- --------------------------------------------------------

    fetched_at              TIMESTAMPTZ     NOT NULL,
    raw_snapshot_path       TEXT            NULL,
    raw_content_hash        TEXT            NOT NULL,
    checksum_algorithm      TEXT            NOT NULL DEFAULT 'SHA256',
    content_mime_type       TEXT            NULL,
    extraction_method       TEXT            NULL,
    parser_version          TEXT            NULL,
    legal_content_extracted BOOLEAN         NOT NULL DEFAULT FALSE,

    -- --------------------------------------------------------
    -- VALIDAÇÃO E STATUS
    -- --------------------------------------------------------

    -- PATCH 8.8B (NOTA-R-01 RESOLVIDA): DEFAULT alinhado ao blueprint original.
    -- 'fetched_unvalidated' adicionado como valor snapshot-específico (13º nesta entidade).
    -- Semântica: snapshot coletado, validação não iniciada. Correto para legal_source_snapshots.
    -- Distinção por entidade: snapshots → 'fetched_unvalidated'; validation_records → 'not_started'.
    validation_status       TEXT            NOT NULL DEFAULT 'fetched_unvalidated',

    stale_risk              TEXT            NOT NULL DEFAULT 'unknown',

    -- PATCH 8.8B (NOTA-R-02 RESOLVIDA): 'no_conflict' confirmado como DEFAULT canônico.
    -- ENUM-06 não inclui 'unknown'. 'no_conflict' é semanticamente correto para estado inicial.
    conflict_status         TEXT            NOT NULL DEFAULT 'no_conflict',

    conflict_record_id      UUID            NULL,

    -- --------------------------------------------------------
    -- RISCO DE ACESSO
    -- --------------------------------------------------------

    access_risk_at_collection       TEXT    NULL DEFAULT 'unknown',
    terms_robots_review_status      TEXT    NULL DEFAULT 'not_reviewed',

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
    -- TIPO DE DOCUMENTO
    -- --------------------------------------------------------

    document_type           TEXT            NULL DEFAULT 'unknown',

    -- --------------------------------------------------------
    -- TIMESTAMPS
    -- --------------------------------------------------------

    created_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    notes                   TEXT            NULL,

    -- --------------------------------------------------------
    -- PRIMARY KEY
    -- --------------------------------------------------------

    CONSTRAINT pk_legal_source_snapshots
        PRIMARY KEY (snapshot_id),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — TRUST CLASS
    -- --------------------------------------------------------

    CONSTRAINT ck_ss_trust_class
        CHECK (trust_class IN ('TRUST-0','TRUST-1','TRUST-2','TRUST-3','TRUST-4','TRUST-5')),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — ENUMS
    -- --------------------------------------------------------

    CONSTRAINT ck_ss_quarantine_status
        CHECK (quarantine_status IN (
            'rejected_unusable','quarantined_unverified','metadata_only',
            'staging_only','validated_snapshot','human_reviewed','not_applicable'
        )),

    -- PATCH 8.8B NOTA-R-01: 'fetched_unvalidated' adicionado como valor snapshot-específico (13 valores total).
    CONSTRAINT ck_ss_validation_status
        CHECK (validation_status IN (
            'fetched_unvalidated',
            'not_started','pending','in_progress','hash_verified',
            'provenance_verified','authority_verified',
            'human_review_pending','human_review_in_progress',
            'validated_snapshot','human_reviewed','conflict_blocked','failed'
        )),

    CONSTRAINT ck_ss_stale_risk
        CHECK (stale_risk IN ('low','medium','high','critical','unknown')),

    CONSTRAINT ck_ss_conflict_status
        CHECK (conflict_status IN (
            'no_conflict','conflict_detected','under_review',
            'provisionally_resolved','resolved'
        )),

    CONSTRAINT ck_ss_authority_level
        CHECK (authority_level BETWEEN 1 AND 7),

    CONSTRAINT ck_ss_checksum_algorithm
        CHECK (checksum_algorithm IN ('SHA256','SHA512')),

    CONSTRAINT ck_ss_source_url_https
        CHECK (source_url LIKE 'https://%'),

    CONSTRAINT ck_ss_content_id_format
        CHECK (content_id ~ '^[a-z0-9-]+$'),

    CONSTRAINT ck_ss_raw_content_hash_length
        CHECK (char_length(raw_content_hash) IN (64, 128)),

    -- PATCH 8.8B (NOTA-R-03 RESOLVIDA): LIKE substituído por lista IN canônica.
    -- Fonte: LEGAL_SOURCE_CONNECTORS_SPEC.md — 13 conectores planejados (CONN-001 a CONN-013).
    CONSTRAINT ck_ss_connector_id
        CHECK (connector_id IS NULL OR connector_id IN (
            'CONN-001','CONN-002','CONN-003','CONN-004','CONN-005',
            'CONN-006','CONN-007','CONN-008','CONN-009','CONN-010',
            'CONN-011','CONN-012','CONN-013'
        )),

    CONSTRAINT ck_ss_access_risk
        CHECK (access_risk_at_collection IS NULL OR
               access_risk_at_collection IN ('low','medium','high','critical','unknown')),

    CONSTRAINT ck_ss_extraction_method
        CHECK (extraction_method IS NULL OR extraction_method IN (
            'html_parse','xml_sru_fetch','fetch_pdf','pdf_ocr',
            'pdf_direct_parse','manual_entry','unknown'
        )),

    -- PATCH 8.8B (NOTA-R-04 RESOLVIDA): lista inicial validada — 14 tipos + 'unknown' = 15 valores.
    -- Idêntica à lista em arquivo 002. Lista inicial revisável — expandir antes de execução se necessário.
    CONSTRAINT ck_ss_document_type
        CHECK (document_type IS NULL OR document_type IN (
            'lei_federal','lei_estadual','lei_municipal','decreto','portaria',
            'resolucao','acordao','sumula','jurisprudencia','processo_ativo',
            'peticao','laudo','doutrina','auxiliar','unknown'
        )),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — INVARIANTES DE SEGURANÇA (fase atual)
    -- --------------------------------------------------------

    -- CC-02: TRUST-4/5 exige raw_content_hash preenchido (64 ou 128 chars já verificado acima)
    -- Nota: esta constraint verifica que TRUST-4/5 não pode ter hash de comprimento inválido.
    -- A constraint completa de "NOT NULL" para TRUST-4/5 é enforçada pela coluna raw_content_hash NOT NULL.

    -- CC-16: TRUST-0/1/2 NUNCA em RAG jurídico validado
    CONSTRAINT ck_ss_rag_prohibited_trust_classes
        CHECK (
            NOT (trust_class IN ('TRUST-0','TRUST-1','TRUST-2') AND
                 'RAG_validated_index' = ANY(allowed_use))
        ),

    -- CC-09: stale_risk:critical não pode ter RAG_validated_index em allowed_use
    CONSTRAINT ck_ss_stale_critical_no_rag
        CHECK (
            NOT (stale_risk = 'critical' AND
                 'RAG_validated_index' = ANY(allowed_use))
        ),

    -- CC-17: validation_required equivalente — legal_content_extracted:true proibido com TRUST-0
    CONSTRAINT ck_ss_trust0_no_legal_content
        CHECK (
            NOT (trust_class = 'TRUST-0' AND legal_content_extracted = TRUE)
        ),

    -- CC-07: TRUST-0 em quarentena → promotion implicitamente bloqueada
    -- (enforçada via quarantine_record.promotion_possible, não aqui diretamente)

    -- --------------------------------------------------------
    -- FOREIGN KEYS (FUTURAS — EXECUTÁVEIS APENAS APÓS TABELAS CRIADAS)
    -- --------------------------------------------------------

    -- FUTURE FK: conflict_record_id → legal_conflict_records.conflict_id ON DELETE SET NULL
    -- NÃO INCLUÍDA AQUI: tabela legal_conflict_records criada após esta (dependência circular)
    -- Adicionar via ALTER TABLE após criação de legal_conflict_records.

    -- FUTURE FK: connector_id → fonte de connectors (tabela não definida nesta fase)

    CONSTRAINT uq_ss_content_id UNIQUE (content_id)

);

-- ============================================================
-- COMENTÁRIOS DE AUDITORIA
-- ============================================================

COMMENT ON TABLE legal_source_snapshots IS
    'DRAFT_NOT_FOR_EXECUTION — Tabela central do sistema legal-agent. '
    'Entidade pivô: todas as demais entidades referenciam snapshot_id. '
    'Blueprint 001, iteração 8.7B. NÃO EXECUTAR SEM APROVAÇÃO DO OPERADOR PRIMÁRIO.';

COMMENT ON COLUMN legal_source_snapshots.trust_class IS
    'DRAFT — Trust class do snapshot. Padrão TRUST-1 (quarantine_by_default). '
    'TRUST-0 = definitivo. Elevação exige validation_record.';

COMMENT ON COLUMN legal_source_snapshots.chain_of_custody_id IS
    'DRAFT — Cadeia de custódia obrigatória. Ausência força TRUST-0. Imutável após INSERT.';

COMMENT ON COLUMN legal_source_snapshots.raw_content_hash IS
    'DRAFT — SHA-256 (64 chars) ou SHA-512 (128 chars). TRUST-4 exige campo preenchido (CC-02).';

COMMENT ON COLUMN legal_source_snapshots.validation_status IS
    'DRAFT — PATCH 8.8B (NOTA-R-01 RESOLVIDA): 13 valores para legal_source_snapshots. '
    'DEFAULT ''fetched_unvalidated'' confirmado como canônico para snapshots. '
    'Distinção por entidade: snapshots → fetched_unvalidated; validation_records → not_started.';

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 001
-- ============================================================
