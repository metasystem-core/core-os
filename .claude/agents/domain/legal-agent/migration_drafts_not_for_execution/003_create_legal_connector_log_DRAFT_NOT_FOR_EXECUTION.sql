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
-- TABELA: legal_connector_logs
-- BLUEPRINT: 003_legal_connector_log.blueprint.yaml (iteração 8.7)
-- CAMPOS: 29 campos | 23 NOT NULL | 6 NULLABLE
-- ORDEM DE CRIAÇÃO: STEP 4 (após legal_source_snapshots)
-- DEPENDÊNCIAS: FK opcional → legal_source_snapshots.snapshot_id (SET NULL)
-- DESIGN: APPEND-ONLY — UPDATE e DELETE proibidos (enforçado via RLS futura)
-- INVARIANTES CRÍTICOS: legal_content_fetched=false, RAG_updated=false,
--   embeddings_created=false — NENHUM DEVE SER true NESTA FASE
-- ============================================================

CREATE TABLE legal_connector_logs (

    -- --------------------------------------------------------
    -- IDENTIFICAÇÃO
    -- --------------------------------------------------------

    log_id                  UUID            NOT NULL DEFAULT gen_random_uuid(),

    -- --------------------------------------------------------
    -- IDENTIFICAÇÃO DO CONECTOR
    -- --------------------------------------------------------

    connector_id            TEXT            NOT NULL,
    connector_name          TEXT            NOT NULL DEFAULT 'unnamed_connector',

    -- --------------------------------------------------------
    -- TIPO E MODO DE OPERAÇÃO
    -- --------------------------------------------------------

    operation_type          TEXT            NOT NULL,
    operation_mode          TEXT            NOT NULL,

    -- --------------------------------------------------------
    -- REQUISIÇÃO
    -- --------------------------------------------------------

    request_timestamp       TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    request_url             TEXT            NOT NULL,
    request_method          TEXT            NOT NULL DEFAULT 'GET',

    -- --------------------------------------------------------
    -- RESPOSTA
    -- --------------------------------------------------------

    response_status_code    INTEGER         NOT NULL DEFAULT 0,
    response_mime_type      TEXT            NULL,
    success                 BOOLEAN         NOT NULL DEFAULT FALSE,

    -- --------------------------------------------------------
    -- ERROS
    -- --------------------------------------------------------

    error_code              TEXT            NULL,
    error_message           TEXT            NULL,

    -- --------------------------------------------------------
    -- RATE LIMITING E ROBOTS
    -- --------------------------------------------------------

    rate_limit_status       TEXT            NOT NULL DEFAULT 'not_applicable',
    backoff_applied         BOOLEAN         NOT NULL DEFAULT FALSE,
    robots_status_at_request        TEXT    NOT NULL DEFAULT 'unknown',
    terms_review_status_at_request  TEXT    NOT NULL DEFAULT 'not_reviewed',
    access_risk_at_collection       TEXT    NOT NULL DEFAULT 'unknown',

    -- --------------------------------------------------------
    -- USER AGENT
    -- --------------------------------------------------------

    user_agent_id           TEXT            NOT NULL DEFAULT 'DEFAULT_UA',

    -- --------------------------------------------------------
    -- SNAPSHOT CRIADO
    -- --------------------------------------------------------

    raw_snapshot_created    BOOLEAN         NOT NULL DEFAULT FALSE,
    snapshot_id             UUID            NULL,
    checksum_created        BOOLEAN         NOT NULL DEFAULT FALSE,

    -- --------------------------------------------------------
    -- PARSER
    -- --------------------------------------------------------

    parser_invoked          BOOLEAN         NOT NULL DEFAULT FALSE,
    parser_version          TEXT            NULL,
    validation_status_after_operation   TEXT NOT NULL DEFAULT 'fetched_unvalidated',

    -- --------------------------------------------------------
    -- INVARIANTES DESTA FASE (TODOS DEVEM SER FALSE)
    -- --------------------------------------------------------

    -- CC-13: legal_content_fetched PROIBIDO = true enquanto connectors_active:0
    legal_content_fetched   BOOLEAN         NOT NULL DEFAULT FALSE,

    -- CC-11: RAG_updated PROIBIDO = true nesta fase
    RAG_updated             BOOLEAN         NOT NULL DEFAULT FALSE,

    -- CC-12: embeddings_created PROIBIDO = true nesta fase
    embeddings_created      BOOLEAN         NOT NULL DEFAULT FALSE,

    -- --------------------------------------------------------
    -- NOTAS
    -- --------------------------------------------------------

    notes                   TEXT            NULL,

    -- --------------------------------------------------------
    -- PRIMARY KEY
    -- --------------------------------------------------------

    CONSTRAINT pk_legal_connector_logs
        PRIMARY KEY (log_id),

    -- --------------------------------------------------------
    -- FOREIGN KEY (opcional — SET NULL se snapshot removido)
    -- --------------------------------------------------------

    CONSTRAINT fk_log_snapshot
        FOREIGN KEY (snapshot_id)
        REFERENCES legal_source_snapshots (snapshot_id)
        ON DELETE SET NULL,

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — ENUMS
    -- --------------------------------------------------------

    -- PATCH 8.8B (NOTA-R-03 RESOLVIDA): LIKE substituído por lista IN canônica.
    -- Fonte: LEGAL_SOURCE_CONNECTORS_SPEC.md — 13 conectores planejados (CONN-001 a CONN-013).
    CONSTRAINT ck_cl_connector_id
        CHECK (connector_id IN (
            'CONN-001','CONN-002','CONN-003','CONN-004','CONN-005',
            'CONN-006','CONN-007','CONN-008','CONN-009','CONN-010',
            'CONN-011','CONN-012','CONN-013'
        )),

    CONSTRAINT ck_cl_operation_type
        CHECK (operation_type IN (
            'fetch_html','fetch_xml_sru','fetch_pdf',
            'fetch_api_rest','fetch_api_graphql',
            'robots_check','terms_check','dry_run','preflight_only'
        )),

    CONSTRAINT ck_cl_operation_mode
        CHECK (operation_mode IN (
            'dry_run','preflight','non_operational_test','operational'
        )),

    CONSTRAINT ck_cl_request_method
        CHECK (request_method IN ('GET','POST','HEAD','OPTIONS')),

    CONSTRAINT ck_cl_request_url_https
        CHECK (request_url LIKE 'https://%'),

    CONSTRAINT ck_cl_rate_limit_status
        CHECK (rate_limit_status IN (
            'not_applicable','ok','warning_approaching','exceeded','blocked'
        )),

    CONSTRAINT ck_cl_robots_status
        CHECK (robots_status_at_request IN (
            'allowed','disallowed','unknown','not_checked','crawl_delay_applied'
        )),

    CONSTRAINT ck_cl_access_risk
        CHECK (access_risk_at_collection IN (
            'low','medium','high','critical','unknown'
        )),

    CONSTRAINT ck_cl_error_code
        CHECK (error_code IS NULL OR error_code IN (
            'SOCKET_BLOCK','CAPTCHA_DETECTED','RATE_LIMIT_EXCEEDED',
            'ROBOTS_BLOCKED','TERMS_VIOLATION','ENDPOINT_404',
            'TIMEOUT','PARSER_FAILURE','BYPASS_ATTEMPT_DETECTED',
            'AUTHORIZATION_REQUIRED'
        )),

    CONSTRAINT ck_cl_validation_status_after
        CHECK (validation_status_after_operation IN (
            'not_applicable','fetched_unvalidated','parsed_unvalidated',
            'pending','failed','validated_snapshot'
        )),

    -- --------------------------------------------------------
    -- CHECK CONSTRAINTS — REGRAS DE NEGÓCIO
    -- --------------------------------------------------------

    -- robots_status disallowed exige success = false
    CONSTRAINT ck_cl_disallowed_robots_blocks_success
        CHECK (
            robots_status_at_request <> 'disallowed' OR
            success = FALSE
        ),

    -- success = true apenas se response_status_code IN (200, 201, 204)
    CONSTRAINT ck_cl_success_requires_2xx
        CHECK (
            success = FALSE OR
            response_status_code IN (200, 201, 204)
        ),

    -- raw_snapshot_created = true em dry_run/preflight proibido
    CONSTRAINT ck_cl_no_snapshot_in_dry_run
        CHECK (
            operation_mode NOT IN ('dry_run','preflight') OR
            raw_snapshot_created = FALSE
        ),

    -- parser_invoked = true somente se raw_snapshot_created = true
    CONSTRAINT ck_cl_parser_requires_snapshot
        CHECK (
            parser_invoked = FALSE OR
            raw_snapshot_created = TRUE
        ),

    -- CC-11: RAG_updated PROIBIDO = true nesta fase
    CONSTRAINT ck_cl_rag_updated_invariant
        CHECK (RAG_updated = FALSE),

    -- CC-12: embeddings_created PROIBIDO = true nesta fase
    CONSTRAINT ck_cl_embeddings_invariant
        CHECK (embeddings_created = FALSE),

    -- CC-13: legal_content_fetched PROIBIDO = true enquanto connectors_active=0
    -- REVIEW NOTE: Esta constraint é uma invariante de fase — remover quando connectors_active > 0 aprovado.
    CONSTRAINT ck_cl_legal_content_fetched_invariant
        CHECK (legal_content_fetched = FALSE),

    -- CC-10: operation_mode:operational PROIBIDO enquanto connectors_active:0
    -- REVIEW NOTE: Esta constraint é uma invariante de fase — remover quando connectors_active > 0 aprovado.
    CONSTRAINT ck_cl_operational_mode_blocked
        CHECK (operation_mode <> 'operational')

);

-- ============================================================
-- COMENTÁRIOS DE AUDITORIA
-- ============================================================

COMMENT ON TABLE legal_connector_logs IS
    'DRAFT_NOT_FOR_EXECUTION — Log append-only de operações de conector. '
    'UPDATE e DELETE proibidos via RLS futura. Invariantes de fase: '
    'legal_content_fetched=false, RAG_updated=false, embeddings_created=false. '
    'Blueprint 003, iteração 8.7. NÃO EXECUTAR SEM APROVAÇÃO DO OPERADOR PRIMÁRIO.';

COMMENT ON COLUMN legal_connector_logs.legal_content_fetched IS
    'DRAFT — INVARIANTE: DEVE ser FALSE enquanto connectors_active=0. '
    'Constraint CC-13 enforçada via CHECK nesta fase. Remover constraint na fase futura aprovada.';

COMMENT ON COLUMN legal_connector_logs.RAG_updated IS
    'DRAFT — INVARIANTE: DEVE ser FALSE nesta fase (CC-11). CHECK constraint presente.';

COMMENT ON COLUMN legal_connector_logs.embeddings_created IS
    'DRAFT — INVARIANTE: DEVE ser FALSE nesta fase (CC-12). CHECK constraint presente.';

COMMENT ON COLUMN legal_connector_logs.operation_mode IS
    'DRAFT — operational PROIBIDO enquanto connectors_active=0 (CC-10). '
    'CHECK constraint presente nesta fase.';

-- ============================================================
-- DRAFT_NOT_FOR_EXECUTION — FIM DO ARQUIVO 003
-- ============================================================
