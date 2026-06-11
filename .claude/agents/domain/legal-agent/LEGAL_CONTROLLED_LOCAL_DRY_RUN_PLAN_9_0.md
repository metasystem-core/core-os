# LEGAL_CONTROLLED_LOCAL_DRY_RUN_PLAN_9_0

**Status:** DRAFT_NOT_FOR_EXECUTION  
**Data:** 2026-06-11  
**Iteração:** 9.0  
**Evento:** EVT-20260610-067  
**Baseado em:** LEGAL_EXECUTION_PLAN_DESIGN_8_9.md (patched 8.9B — EVT-20260610-066)  
**Versão registry:** 2.28-legal-controlled-local-dry-run-plan  
**Patch:** 9.0B (EVT-20260610-069) — 8 obs LOW da QA 9.0A endereçadas

---

## §1 — Purpose

Esta iteração cria o **plano formal para um dry-run local controlado** dos 13 SQL drafts do legal-agent.

**Esta iteração documenta o plano. Somente documenta.**

Nenhum dry-run será executado nesta iteração.  
Nenhum SQL será executado.  
Nenhum banco será criado.  
Nenhuma migration será aplicada.  
Nenhuma conexão com banco de dados será estabelecida.  
Nenhum dado jurídico será ingerido.

O dry-run local futuro é evento separado, distinto, que requer:
- Aprovação explícita do operador primário;
- Satisfação de todos os 10 DRY-GATEs documentados neste plano;
- Ambiente local isolado confirmado e identificado;
- Ausência de qualquer conexão com produção ou banco remoto.

**Este documento não autoriza nem desencadeia dry-run, execução, migration ou ativação do agente.**

DRY-RUN PLAN ≠ DRY-RUN EXECUTED  
LOCAL DRY-RUN PLAN ≠ LOCAL DATABASE CREATED  
ENVIRONMENT PLAN ≠ ENVIRONMENT CREATED  
SQL COPY PLAN ≠ SQL MOVED  
SQL DRAFT READY ≠ SQL EXECUTED  
BACKUP PLAN ≠ BACKUP CREATED  
ROLLBACK PLAN ≠ ROLLBACK EXECUTED  
GATE DESIGN ≠ GATE APPROVED  
LOCAL TEST PLAN ≠ MIGRATION CREATED  
TABLE TEST PLAN ≠ TABLE CREATED  
LEGAL TABLE PLAN ≠ LEGAL CORPUS  
AGENTE INATIVO ≠ AGENTE OPERACIONAL

---

## §2 — Source Basis

| Documento | Iteração | Evento | Papel |
|---|---|---|---|
| LEGAL_EXECUTION_PLAN_DESIGN_8_9.md (patched 8.9B) | 8.9 + 8.9B | EVT-064 + EVT-066 | Plano de execução futura — 10 gates, 16 pré-condições, Step 10b, R-00a/R-00b |
| LEGAL_EXECUTION_PLAN_PATCH_8_9B.md | 8.9B | EVT-066 | Patch report das 15 obs LOW da 8.9A — execution_plan_result: execution_plan_ready_for_controlled_dry_run_plan_design |
| LEGAL_EXECUTION_PLAN_QA_8_9A.md | 8.9A | EVT-065 | QA formal do plano — ready_with_non_blocking_reviews |
| LEGAL_SQL_DRAFT_PATCH_QA_8_8C.md | 8.8C | EVT-063 | QA pós-patch dos 13 SQL — sql_drafts_ready_for_execution_plan_design |
| LEGAL_SQL_DRAFT_PATCH_8_8B.md | 8.8B | EVT-062 | 6/6 findings resolvidos — NOTA-R-05 BLOCKER (CREATE FUNCTION) resolvido |
| LEGAL_EXECUTABLE_MIGRATION_DRAFTS_8_8.md | 8.8 | EVT-060 | 13 SQL drafts DRAFT_NOT_FOR_EXECUTION |
| LEGAL_KNOWLEDGE_FIREWALL_8_4D.md | 8.4D | EVT-050 | 6 trust classes — quarentena por padrão — RAG guard |
| LEGAL_SQL_DRAFT_MANIFEST_8_8.yaml | 8.8 | — | Manifesto dos 13 SQL: filenames, tipos, campos, dependências |

**Estado atual dos SQL drafts:** 13 arquivos em `migration_drafts_not_for_execution/` — todos com cabeçalho bloqueante `DRAFT_NOT_FOR_EXECUTION`, todos com `DO NOT RUN`. Nenhuma NOTA-R pendente. Nenhum QA-finding não resolvido.

---

## §3 — Dry-Run Status

Todos os invariantes permanecem intocados nesta iteração.

| Campo | Valor | Nota |
|---|---|---|
| dry_run_plan_status | design_only | Plano criado — dry-run não executado |
| dry_run_executed | false | Invariante |
| local_database_created | false | Invariante |
| sql_executed | false | Invariante |
| migration_created | false | Invariante |
| database_created | false | Invariante |
| table_created | false | Invariante |
| backup_created | false | Invariante |
| rollback_executed | false | Invariante |
| execution_allowed | false | Invariante |
| active | false | Invariante |
| operational_authority | none | Invariante |
| connectors_active | 0 | Invariante |
| legal_content_fetched | 0 | Invariante |
| legal_documents_ingested | 0 | Invariante |
| RAG_updates | 0 | Invariante |
| embeddings_created | 0 | Invariante |
| APIs_consulted_for_legal_data | 0 | Invariante |

**Mudança nesta iteração:** nenhuma. Documento de plano apenas.

---

## §4 — Local Environment Requirements

Requisitos futuros que o ambiente local deve satisfazer antes do dry-run. Nenhum destes requisitos está sendo atendido ou verificado nesta iteração.

### 4.1 Ambiente Obrigatório

| Requisito | Descrição | Verificação futura |
|---|---|---|
| ENV-01 | Ambiente local/dev completamente isolado | Endereço, porta e nome do banco documentados — diferentes de produção e Supabase remoto |
| ENV-02 | Banco PostgreSQL vazio criado localmente | `SELECT count(*) FROM information_schema.tables WHERE table_schema='public'` → 0 tabelas |
| ENV-03 | Versão PostgreSQL ≥ 14 (exigência de RLS e PL/pgSQL) | `SELECT version()` — registrar versão exata |
| ENV-04 | Sem conexão com produção durante dry-run | `pg_hba.conf` ou firewall local confirmado — sem remote hosts |
| ENV-05 | Sem conexão com Supabase remoto | Variáveis de ambiente `DATABASE_URL`, `SUPABASE_URL` apontando apenas para local |
| ENV-06 | Sem conectores ativos | `connectors_active: 0` confirmado antes do início |
| ENV-07 | Sem RAG ativo | Nenhum processo de ingestão em execução |
| ENV-08 | Sem embeddings em geração | Nenhum modelo de embedding ativo durante dry-run |
| ENV-09 | Operador primário presente no terminal | Dry-run não pode ocorrer sem operador primário monitorando cada step |
| ENV-10 | Terminal com output salvo em arquivo de log local | `psql ... 2>&1 | tee dry_run_log_YYYY-MM-DD.txt` |

### 4.2 Pré-Requisitos de Roles

| Role | Descrição | Verificação futura |
|---|---|---|
| fw_governor | Árbitro constitucional | `SELECT rolname FROM pg_roles WHERE rolname='fw_governor'` |
| legal_agent | Agente jurídico | `SELECT rolname FROM pg_roles WHERE rolname='legal_agent'` |
| rag_agent | Agente RAG | `SELECT rolname FROM pg_roles WHERE rolname='rag_agent'` |
| intake_agent | Agente de intake | `SELECT rolname FROM pg_roles WHERE rolname='intake_agent'` |
| meta_router | Roteador | `SELECT rolname FROM pg_roles WHERE rolname='meta_router'` |
| operator_primary | Operador primário | `SELECT rolname FROM pg_roles WHERE rolname='operator_primary'` |
| operator_visitor | Operador visitante | `SELECT rolname FROM pg_roles WHERE rolname='operator_visitor'` |

### 4.3 Pré-Requisitos de SQL Drafts

| Requisito | Ação futura |
|---|---|
| SQL-PREP-01 | Verificar integridade dos 13 SQL em `migration_drafts_not_for_execution/` antes de qualquer cópia |
| SQL-PREP-02 | Criar cópia controlada em área de trabalho temporária (ex.: `dry_run_workspace/`) — **nunca em `migrations/`** |
| SQL-PREP-03 | Na cópia: comentar/remover cabeçalhos bloqueantes DRAFT_NOT_FOR_EXECUTION somente dos arquivos da cópia — **originais preservados intactos** |
| SQL-PREP-04 | Na cópia: verificar checksums contra os originais antes de executar |
| SQL-PREP-05 | CC-15 (`legal_governance_escalations`): decidir antes do dry-run se tabela será criada ou CC-15 será adiado — documentar decisão explicitamente |

**Invariante absoluto:** a pasta `migration_drafts_not_for_execution/` e seus 13 arquivos originais **nunca são modificados** durante o dry-run. Somente a cópia em área temporária é tratada.

---

## §5 — Dry-Run Gates

Cada gate deve ser satisfeito **na ordem indicada** antes de iniciar o dry-run. Gates são sequenciais — não paralelos.

### DRY-GATE-01 — Ambiente Local Isolado Confirmado

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-01 |
| purpose | Confirmar que o ambiente alvo do dry-run é local, isolado e completamente diferente de produção ou Supabase remoto |
| required_evidence | Nome do banco local, endereço (localhost), porta registrados; confirmação de que não há conexão externa |
| pass_condition | `SELECT current_database(), inet_server_addr(), inet_server_port()` retorna banco local esperado |
| fail_action | Cancelar dry-run imediatamente; não executar nenhum SQL em ambiente não confirmado |
| status | not_executed |
| blocks | DRY-GATE-02 a DRY-GATE-10; toda execução de dry-run |

---

### DRY-GATE-02 — Banco Vazio Confirmado

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-02 |
| purpose | Confirmar que o banco local não contém tabelas `legal_` pré-existentes — dry-run sempre parte de estado limpo |
| required_evidence | `SELECT tablename FROM pg_tables WHERE schemaname='public' AND tablename LIKE 'legal_%'` → 0 linhas |
| pass_condition | 0 tabelas legal_ existentes; schema public limpo ou com apenas tabelas não-legal_ explicitamente documentadas |
| fail_action | Executar rollback ou usar banco diferente — nunca rodar dry-run sobre schema jurídico pré-existente |
| status | not_executed |
| blocks | DRY-GATE-03 a DRY-GATE-10 |

---

### DRY-GATE-03 — Ausência de Dados Jurídicos Reais Confirmada

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-03 |
| purpose | Confirmar que o banco local não contém nenhum dado jurídico real importado, migrado ou copiado de produção |
| required_evidence | Banco criado do zero nesta sessão de dry-run; histórico de criação documentado; nenhum pg_dump de produção restaurado |
| pass_condition | Banco local criado localmente — declaração registrada pelo operador |
| fail_action | Cancelar; nunca executar dry-run em banco com dados jurídicos reais |
| status | not_executed |
| blocks | DRY-GATE-04 a DRY-GATE-10 |
| note | Evidência declarativa aceita by_design: banco criado do zero nesta sessão implica ausência de dados jurídicos reais. DRY-GATE-02 (0 tabelas legal_) complementa a garantia. Verificação programática de histórico de criação de banco não disponível em PostgreSQL padrão. |

---

### DRY-GATE-04 — SQL Drafts Revisados e Cópia Controlada Preparada

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-04 |
| purpose | Confirmar que os 13 SQL drafts foram revisados, a cópia controlada foi criada em área temporária e os originais estão intactos |
| required_evidence | (1) `ls -lh migration_drafts_not_for_execution/*.sql` → 13 arquivos; (2) cópia criada em `dry_run_workspace/`; (3) checksums comparados; (4) originais inalterados |
| pass_condition | Todos os 13 arquivos presentes em cópia; originais intactos com cabeçalhos bloqueantes; `diff` confirma que somente cabeçalhos foram tratados na cópia |
| fail_action | Não iniciar execução; reconstruir cópia; verificar integridade |
| status | not_executed |
| blocks | DRY-GATE-05 a DRY-GATE-10 |

---

### DRY-GATE-05 — Ordem Function → Trigger Confirmada

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-05 |
| purpose | Confirmar que, no arquivo 009, cada CREATE FUNCTION será executado antes do CREATE TRIGGER correspondente — 6 pares: CC-01/05/06/08/14/15 |
| required_evidence | Checklist dos 6 pares (fn + trigger): fn_ss_trust0_auto/trg_ss_trust0_auto, fn_ss_trust_class_forward_only/trg_ss_trust_class_forward_only, fn_ss_trust01_quarantine_required/trg_ss_trust01_quarantine_required, fn_ss_conflict_record_required/trg_ss_conflict_record_required, fn_ss_chain_of_custody_immutable/trg_ss_chain_of_custody_immutable, fn_qr_connector_bypass_escalation/trg_qr_connector_bypass_escalation |
| pass_condition | Para cada par: linha do STEP 1 (FUNCTION) < linha do STEP 2 (TRIGGER) no arquivo de cópia tratado; grep confirma ordem |
| fail_action | Reordenar cópia; não executar trigger sem function correspondente criada |
| status | not_executed |
| blocks | DRY-GATE-06 a DRY-GATE-10 |
| note | CC-15 (fn_qr_connector_bypass_escalation): requer decisão CC-15 documentada antes deste gate |

---

### DRY-GATE-06 — Rollback Local Revisado e Disponível

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-06 |
| purpose | Confirmar que o arquivo 012 (rollback) foi revisado e está na cópia controlada — dry-run exige rollback testável |
| required_evidence | Arquivo `012_legal_rollback_DRAFT_NOT_FOR_EXECUTION.sql` presente na cópia; sequência R-00a → R-00b → R-01..R-08 revisada |
| pass_condition | Operador declara que entende a sequência completa de rollback, incluindo PRES-01..05 |
| fail_action | Não iniciar dry-run sem rollback disponível e revisado |
| status | not_executed |
| blocks | DRY-GATE-07 a DRY-GATE-10 |

---

### DRY-GATE-07 — Backup/Snapshot Local Criado (se aplicável)

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-07 |
| purpose | Se o banco local já contiver objetos (schemas não-legal, dados de desenvolvimento), criar snapshot antes do dry-run |
| required_evidence | `pg_dump` do estado pré-dry-run armazenado localmente; ou declaração explícita de que banco foi criado do zero nesta sessão |
| pass_condition | Snapshot presente com timestamp; ou declaração de banco vazio que torna snapshot opcional |
| fail_action | Criar snapshot antes de prosseguir |
| status | not_executed |
| blocks | DRY-GATE-08 a DRY-GATE-10 |
| note | Para banco criado do zero nesta sessão: snapshot é opcional mas recomendado para rastreabilidade |

---

### DRY-GATE-08 — Aprovação Explícita do Operador Primário para Dry-Run

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-08 |
| purpose | Autorização explícita do operador primário para iniciar o dry-run local — dry-run é evento irreversível no banco local |
| required_evidence | Declaração: "autorizo execução do dry-run local controlado do legal-agent (sessão autorizada — data/hora a registrar no log)" (ou equivalente) com data/hora — não fixar iteração específica; dry-run pode ocorrer em qualquer sessão futura aprovada pelo operador primário |
| pass_condition | Declaração registrada antes do Step 1 do dry-run |
| fail_action | Suspender todas as etapas; nenhum SQL executado no banco local |
| status | not_executed |
| blocks | DRY-GATE-09 a DRY-GATE-10; toda execução de dry-run |

---

### DRY-GATE-09 — Legal-Agent Permanecerá Inativo Após Dry-Run

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-09 |
| purpose | Confirmar que o sucesso do dry-run local não implica ativação do legal-agent — dry-run local ≠ autoridade operacional |
| required_evidence | Declaração registrada: "dry-run local bem-sucedido não ativa o legal-agent, não autoriza execução em produção e não altera operational_authority" |
| pass_condition | Declaração registrada; AGENT.md e registry preservam active:false e operational_authority:none |
| fail_action | Suspender; reafirmar invariantes antes de prosseguir |
| status | not_executed |
| blocks | DRY-GATE-10; toda execução de dry-run |

---

### DRY-GATE-10 — Nenhum Conector Será Ativado Durante ou Após Dry-Run

| Campo | Valor |
|---|---|
| gate_id | DRY-GATE-10 |
| purpose | Confirmar que o dry-run não ativa nem planeja ativar conectores — connectors_active permanece 0 |
| required_evidence | `connectors_active: 0` confirmado antes do início; nenhuma configuração de conector presente no banco local |
| pass_condition | connectors_active: 0 antes, durante e após dry-run |
| fail_action | Cancelar; isolar qualquer configuração de conector antes de prosseguir |
| status | not_executed |

---

## §6 — Future Dry-Run Sequence

Sequência futura de execução para o dry-run local controlado. **Tudo nesta seção é plano futuro — não execução.**

| Step | Ação | Arquivo / Objeto | Dependência | Notas |
|---|---|---|---|---|
| DR-00 | Confirmar ambiente local isolado | — | DRY-GATE-01 | ENV-01..05 verificados |
| DR-01 | Confirmar banco vazio | `SELECT COUNT(*) FROM pg_tables WHERE tablename LIKE 'legal_%'` → 0 | DRY-GATE-02 | Banco fresh ou rollback completo anterior |
| DR-02 | Criar snapshot/backup local pré-dry-run | `pg_dump` local com timestamp | DRY-GATE-07 | Opcional se banco criado do zero; recomendado |
| DR-03 | Confirmar e criar 7 roles PostgreSQL | `CREATE ROLE` para ausentes | DRY-GATE-01 | fw_governor, legal_agent, rag_agent, intake_agent, meta_router, operator_primary, operator_visitor |
| DR-04 | Copiar SQL drafts para `dry_run_workspace/` | Cópia controlada dos 13 arquivos | DRY-GATE-04 | **Originais em migration_drafts_not_for_execution/ NUNCA MODIFICADOS** |
| DR-05 | Tratar cabeçalhos bloqueantes na cópia | Comentar/remover DRAFT_NOT_FOR_EXECUTION da cópia | DRY-GATE-04 | Somente na cópia; verificar checksums pós-tratamento |
| DR-06 | Executar enums (arquivo 008) | Documentação de 9 enums (TEXT+CHECK) | DR-05 | Enums são implícitos em CHECK constraints — sem CREATE TYPE |
| DR-07 | Executar CREATE TABLE — tabela base | `001`: `legal_source_snapshots` (32 campos) | DR-05 | Tabela base; todas as demais referenciam esta |
| DR-08 | Executar CREATE TABLE — tabelas dependentes | `002`..`007`: 6 tabelas restantes | DR-07 | Ordem: metadata → connector_logs → quarantine_records → validation_records → conflict_records → rag_index_manifests |
| DR-09a | Executar constraints SEÇÃO A (FK circular) | `009` SEÇÃO A | DR-07..DR-08 | FK quarantine_records ↔ snapshots |
| DR-09b | Executar constraints SEÇÃO B (ALTER TABLE) | `009` SEÇÃO B | DR-07 | CC-02, CC-03 — `legal_source_snapshots` deve existir |
| DR-09c | Executar STEP 1 de cada par: 6 CREATE FUNCTION | `009` SEÇÃO C — STEP 1 | DR-07..DR-08 | Cada function antes do trigger correspondente — DRY-GATE-05 |
| DR-09d | Executar STEP 2 de cada par: 6 CREATE TRIGGER | `009` SEÇÃO C — STEP 2 | DR-09c | CC-15: somente se `legal_governance_escalations` existir; caso contrário adiar |
| DR-10 | Executar 35 indexes | `010`: 33 btree + 2 hash | DR-07..DR-09d | Somente após todas as tabelas e constraints |
| DR-10b | ENABLE ROW LEVEL SECURITY para 7 tabelas | `ALTER TABLE legal_X ENABLE ROW LEVEL SECURITY` | DR-07..DR-10 | Para cada uma das 7 tabelas legal_ — pré-requisito de RLS (ENV-03/ENV-09); independente de DRY-GATE-05 (DRY-GATE-05 cobre ordem function→trigger CC-01/05/06/08/14/15, não ENABLE RLS) |
| DR-11 | Executar 22 políticas RLS | `011` | DR-03, DR-10b | Roles devem existir (DR-03); RLS habilitado (DR-10b) |
| DR-12a | Validar estrutura vazia | `SELECT COUNT(*) FROM` cada tabela → 0 | DR-11 | 7 tabelas — todas devem estar vazias |
| DR-12b | Confirmar zero dados jurídicos | Nenhum conteúdo inserido em nenhuma tabela | DR-12a | Invariante absoluto |
| DR-12c | Confirmar legal-agent inactive | `active: false`, `operational_authority: none` | DR-11 | Dry-run bem-sucedido ≠ ativação |
| DR-12d | Confirmar connectors inactive | `connectors_active: 0` | DR-11 | Dry-run ≠ autorização de conector |
| DR-13 | Registrar evidências | Logs + timestamps + checksums | DR-12a..DR-12d | Ver §7 Evidence Collection Plan |
| DR-14 | Executar rollback local (se objetivo incluir teste de rollback) | Sequência R-00a → R-00b → R-01..R-08 | DR-13 | Rollback também exige DRY-GATE-08 renovado; ver §10 |

**CC-15 nota:** `legal_governance_escalations` não está entre os 13 SQL drafts. Antes do DR-09d, decidir: (a) criar tabela manualmente no dry-run e executar CC-15, ou (b) adiar CC-15 e documentar adiamento. Decisão deve ser registrada antes do dry-run.

---

## §7 — Evidence Collection Plan

Evidências futuras que o operador deve coletar durante o dry-run. Nada aqui está sendo coletado nesta iteração.

| ID | Evidência | Quando coletar | Formato sugerido |
|---|---|---|---|
| EV-01 | Timestamp de início do dry-run | DR-00 | `date '+%Y-%m-%d %H:%M:%S'` → arquivo de log |
| EV-02 | Ambiente local identificado | DR-00 | `SELECT current_database(), inet_server_addr(), inet_server_port(), version()` |
| EV-03 | Banco vazio confirmado | DR-01 | `SELECT tablename FROM pg_tables WHERE schemaname='public' AND tablename LIKE 'legal_%'` → 0 linhas |
| EV-04 | 7 roles presentes | DR-03 | `SELECT rolname FROM pg_roles WHERE rolname IN (...)` → 7 linhas |
| EV-05 | Checksums dos 13 SQL originais | DR-04 | `md5sum migration_drafts_not_for_execution/*.sql` → arquivo de referência |
| EV-06 | Checksums da cópia tratada | DR-05 | `md5sum dry_run_workspace/*.sql` → comparar somente diferenças de cabeçalho |
| EV-07 | Log de criação de cada tabela | DR-07..DR-08 | Output do psql: `CREATE TABLE` → 7 confirmações |
| EV-08 | Log de criação de constraints SEÇÃO A e B; cobertura de enums TEXT+CHECK | DR-09a..DR-09b | `ALTER TABLE` → output confirmado; nota: enums usam estratégia TEXT+CHECK (sem CREATE TYPE) — evidência implícita em EV-07 (CREATE TABLE com CHECK inline) e EV-08 (ALTER TABLE com CHECK constraints) |
| EV-09 | Log de criação de 6 functions | DR-09c | `CREATE OR REPLACE FUNCTION` → 6 confirmações |
| EV-10 | Log de criação de 6 triggers | DR-09d | `CREATE TRIGGER` → 6 confirmações (ou nota de CC-15 adiado) |
| EV-11 | Log de criação de 35 indexes | DR-10 | `CREATE INDEX` × 35 |
| EV-12 | Confirmação de ENABLE RLS nas 7 tabelas | DR-10b | `SELECT tablename, rowsecurity FROM pg_tables WHERE tablename LIKE 'legal_%'` → rowsecurity=true × 7 |
| EV-13 | Log de criação de 22 políticas RLS | DR-11 | `CREATE POLICY` × 22 |
| EV-14 | Validação de 7 tabelas vazias | DR-12a | `SELECT COUNT(*) FROM` cada tabela → 0 × 7 |
| EV-15 | Confirmação legal-agent inactive | DR-12c | Declaração registrada + AGENT.md inalterado |
| EV-16 | Confirmação connectors inactive | DR-12d | `connectors_active: 0` declarado |
| EV-17 | Log completo do dry-run (stdout + stderr) | Toda a sessão | `psql ... 2>&1 | tee dry_run_YYYY-MM-DD.log` |
| EV-18 | Timestamp de conclusão (sucesso ou falha) | Final | `date '+%Y-%m-%d %H:%M:%S'` |
| EV-19 | Log de rollback (se executado) | DR-14 | `DROP TRIGGER` × 6 + `DROP FUNCTION` × 6 + `DROP TABLE` × 7 |

---

## §8 — Dry-Run Success Criteria

Critérios de sucesso futuro para o dry-run local controlado.

| ID | Critério | Verificação |
|---|---|---|
| SC-01 | Todos os 13 SQL da cópia executam sem erro de sintaxe ou dependência | Nenhuma linha de erro `ERROR:` no log completo |
| SC-02 | 7 tabelas `legal_` criadas com estrutura correta | `SELECT tablename FROM pg_tables WHERE tablename LIKE 'legal_%'` → 7 linhas |
| SC-03 | 6 functions criadas antes dos triggers correspondentes | `SELECT proname FROM pg_proc WHERE proname IN ('fn_ss_trust0_auto','fn_ss_trust_class_forward_only','fn_ss_trust01_quarantine_required','fn_ss_conflict_record_required','fn_ss_chain_of_custody_immutable','fn_qr_connector_bypass_escalation')` → 6 linhas antes do passo DR-09d |
| SC-04 | 6 triggers criados sem erro de dependência | `SELECT tgname FROM pg_trigger WHERE tgrelid::regclass::text LIKE 'legal_%'` → 6 linhas (ou 5 se CC-15 adiado) |
| SC-05 | 35 indexes criados | `SELECT indexname FROM pg_indexes WHERE tablename LIKE 'legal_%'` → 35 linhas |
| SC-06 | RLS habilitado nas 7 tabelas antes das políticas | `SELECT rowsecurity FROM pg_tables WHERE tablename LIKE 'legal_%'` → true × 7 |
| SC-07 | 22 políticas RLS criadas | `SELECT COUNT(*) FROM pg_policies WHERE tablename LIKE 'legal_%'` → 22 |
| SC-08 | 7 tabelas vazias após execução completa | `SELECT COUNT(*) FROM` cada tabela → 0 × 7 |
| SC-09 | Nenhum dado jurídico ingerido | Invariante preservado: legal_content_fetched: 0 |
| SC-10 | Nenhum conector ativado | connectors_active: 0 durante e após dry-run |
| SC-11 | legal-agent continua inactive | active: false, operational_authority: none — inalterados |
| SC-12 | Rollback local testável | Arquivo 012 (cópia) executa sem erro de dependência ao reverter |
| SC-13 | Evidências EV-01..EV-18 coletadas e armazenadas | Log completo gerado e salvo |
| SC-14 | Originais em `migration_drafts_not_for_execution/` intactos | Checksums inalterados pós-dry-run |

---

## §9 — Dry-Run Failure Criteria

Critérios de falha que encerram o dry-run imediatamente.

| ID | Critério de Falha | Ação imediata |
|---|---|---|
| FC-01 | Execução em banco errado (produção, Supabase remoto ou banco com dados reais) | Parar imediatamente; não executar rollback do banco errado sem aprovação explícita |
| FC-02 | Qualquer conexão estabelecida com host externo durante dry-run | Cancelar; investigar antes de prosseguir |
| FC-03 | SQL executado fora do plano (arquivo original modificado ou executado diretamente) | Parar; registrar como falha crítica; rollback local se possível |
| FC-04 | CREATE TRIGGER executado sem CREATE FUNCTION correspondente | Parar no passo DR-09d; corrigir ordem e reiniciar a partir do rollback |
| FC-05 | Constraint incompatível ou erro de FK não previsto | Registrar ERROR completo; não prosseguir sem análise |
| FC-06 | RLS configurada como permissiva por configuração incorreta (rowsecurity=false ou policy allows all) | Rollback imediato do banco local |
| FC-07 | Dado jurídico real inserido em qualquer tabela legal_ | Parar imediatamente; registrar como violação crítica; rollback |
| FC-08 | Conector ativado durante dry-run | Cancelar; isolar; não prosseguir |
| FC-09 | legal-agent marcado como active=true ou operational_authority atualizado | Reverter imediatamente; registrar como incidente |
| FC-10 | Rollback impossível (tabelas com dados, locks, permissão insuficiente) | Registrar como falha crítica; escalar ao operador primário |
| FC-11 | Evidências insuficientes (log incompleto, timestamps ausentes) | Repetir dry-run com logging adequado antes de reportar sucesso |
| FC-12 | Originais em `migration_drafts_not_for_execution/` modificados durante dry-run | Restaurar via git; registrar como falha crítica |

---

## §10 — Local Rollback Plan

Plano de rollback local futuro. Rollback é executado **após** dry-run falho **ou** quando o objetivo do dry-run inclui teste de rollback. Não executar nesta iteração.

### 10.1 Preservation Before Rollback (executar ANTES de qualquer DROP)

| ID | Ação | Dados a preservar |
|---|---|---|
| L-PRES-01 | Export bypass logs | `COPY (SELECT * FROM legal_connector_logs WHERE connector_bypass = true) TO '/tmp/dry_run_bypass_logs.csv' CSV` |
| L-PRES-02 | Export TRUST-4/5 snapshots | `COPY (SELECT * FROM legal_source_snapshots WHERE trust_class IN ('TRUST-4','TRUST-5')) TO '/tmp/dry_run_trust45.csv' CSV` |
| L-PRES-03 | Export TRUST-0 quarantine records | `COPY (SELECT * FROM legal_quarantine_records WHERE quarantine_reason LIKE 'trust0%') TO '/tmp/dry_run_quarantine.csv' CSV` |
| L-PRES-04 | Export promoted validation records | `COPY (SELECT * FROM legal_validation_records WHERE trust_class_after >= 'TRUST-3') TO '/tmp/dry_run_promoted.csv' CSV` |
| L-PRES-05 | Export chain_of_custody map | `COPY (SELECT id, chain_of_custody_id FROM legal_source_snapshots) TO '/tmp/dry_run_custody.csv' CSV` — **executar primeiro** |

**Nota para dry-run:** Como o dry-run não ingere dados jurídicos, os L-PRES-01..05 provavelmente não encontrarão dados. Executar mesmo assim para confirmar tabelas vazias e para testar o rollback como exercício completo.

### 10.2 Rollback Sequence

| Step | Objeto | Ação | Aprovação | Notas |
|---|---|---|---|---|
| LR-00a | 6 triggers | `DROP TRIGGER IF EXISTS trg_ss_trust0_auto ON legal_source_snapshots;` (e demais 5) | Não | **Primeiro step** — antes de qualquer DROP TABLE |
| LR-00b | 6 functions | `DROP FUNCTION IF EXISTS fn_ss_trust0_auto();` (e demais 5) | Não | Após LR-00a; antes de LR-01 |
| LR-01 | legal_rag_index_manifests | `DROP TABLE IF EXISTS legal_rag_index_manifests;` | Não | Sem FKs de outras tabelas |
| LR-02 | legal_conflict_records | `DROP TABLE IF EXISTS legal_conflict_records;` | Operador | FK RESTRICT para snapshots |
| LR-03 | legal_validation_records | `DROP TABLE IF EXISTS legal_validation_records;` | Operador | FK RESTRICT para snapshots |
| LR-04 | legal_quarantine_records | `DROP TABLE IF EXISTS legal_quarantine_records;` | Operador | FK SET NULL |
| LR-05 | legal_connector_logs | `DROP TABLE IF EXISTS legal_connector_logs;` | Operador | FK SET NULL |
| LR-06 | legal_source_metadata | `DROP TABLE IF EXISTS legal_source_metadata;` | Operador | FK SET NULL |
| LR-07 | legal_source_snapshots | `DROP TABLE IF EXISTS legal_source_snapshots CASCADE;` | **Operador explícito** | **CRITICAL** — executar por último; CASCADE aceito para dry-run local (LR-01..LR-06 já executados antes; sem risco de dependentes residuais); nota: R-07 do plano de execução principal (8.9B) não usa CASCADE — divergência documentada e aceita para escopo do dry-run |
| LR-08 | Indexes (implícito) | — | — | Removidos automaticamente com as tabelas |
| LR-09 | RLS/policies (implícito) | — | — | Removidas automaticamente com as tabelas |
| LR-10 | Log de rollback | Salvar timestamp de conclusão | — | `date '+%Y-%m-%d %H:%M:%S'` no log |

**Ordem obrigatória:** LR-00a → LR-00b → LR-01 → LR-02 → LR-03 → LR-04 → LR-05 → LR-06 → LR-07 → LR-10

**Rollback também exige gate:** repetir DRY-GATE-08 (aprovação do operador) antes de iniciar sequência de rollback.

---

## §11 — Risk Matrix

| risk_id | Risco | Severidade | Mitigação | Gate relacionado | Status |
|---|---|---|---|---|---|
| DRY-RISK-01 | Confundir plano de dry-run com dry-run executado | CRÍTICO | Cabeçalho DRAFT_NOT_FOR_EXECUTION; §12 Non-Execution Confirmation; invariantes explícitos | — | not_executed |
| DRY-RISK-02 | Usar banco errado (produção ou Supabase remoto) | CRÍTICO | DRY-GATE-01: banco local confirmado antes de Step 1; FC-01 ativa parada imediata | DRY-GATE-01 | not_executed |
| DRY-RISK-03 | Copiar SQL para pasta `migrations/` real ou pasta executável | CRÍTICO | SQL-PREP-02: cópia apenas em `dry_run_workspace/`; nunca em `migrations/`; originais intactos | DRY-GATE-04 | not_executed |
| DRY-RISK-04 | Remover cabeçalho bloqueante dos originais (não da cópia) | ALTO | SQL-PREP-03: somente cópia é tratada; `diff` pós-tratamento confirma originais intactos | DRY-GATE-04 | not_executed |
| DRY-RISK-05 | Executar trigger antes da function correspondente | ALTO | DRY-GATE-05: ordem STEP1→STEP2 verificada por grep antes de DR-09c; FC-04 para imediatamente | DRY-GATE-05 | not_executed |
| DRY-RISK-06 | RLS permissiva por erro de ENABLE omitido | ALTO | Step DR-10b: ENABLE RLS explícito antes do DR-11; EV-12 confirma rowsecurity=true × 7 | DR-10b | not_executed |
| DRY-RISK-07 | Executar dry-run sem rollback disponível | ALTO | DRY-GATE-06: rollback revisado e disponível antes de iniciar | DRY-GATE-06 | not_executed |
| DRY-RISK-08 | Dado jurídico real criado ou importado no banco local de dry-run | CRÍTICO | DRY-GATE-03: banco sem dados jurídicos; FC-07 ativa parada imediata; connectors_active: 0 | DRY-GATE-03 | not_executed |
| DRY-RISK-09 | legal-agent ativado após dry-run bem-sucedido | CRÍTICO | DRY-GATE-09: declaração explícita; invariantes preservados; active:false inalterado | DRY-GATE-09 | not_executed |
| DRY-RISK-10 | Conector ativado durante ou após dry-run | ALTO | DRY-GATE-10: connectors_active: 0 confirmado antes, durante e após; FC-08 ativa parada | DRY-GATE-10 | not_executed |
| DRY-RISK-11 | Dry-run local bem-sucedido interpretado como aprovação de execução em produção | CRÍTICO | DRY-GATE-09 declaração; §1 invariantes; AGENT.md; registro EVT-067 documenta que plano ≠ execução | DRY-GATE-09 | not_executed |

---

## §12 — Non-Execution Confirmation

Esta seção confirma formalmente o que **não ocorreu** nesta iteração.

| Item | Status |
|---|---|
| Dry-run executado | **NÃO** |
| SQL executado | **NÃO** |
| Banco de dados criado | **NÃO** |
| Banco local criado | **NÃO** |
| Tabelas criadas | **NÃO** |
| Migrations criadas | **NÃO** |
| Conexão com banco estabelecida | **NÃO** |
| Roles criados | **NÃO** |
| RLS habilitado | **NÃO** |
| Triggers criados | **NÃO** |
| Functions criadas | **NÃO** |
| Indexes criados | **NÃO** |
| Políticas RLS aplicadas | **NÃO** |
| SQL movido para pasta executável | **NÃO** |
| SQL modificado | **NÃO** |
| Conector ativado | **NÃO** |
| Conteúdo jurídico ingerido | **NÃO** |
| RAG atualizado | **NÃO** |
| Embeddings criados | **NÃO** |
| API consultada | **NÃO** |
| Backup criado | **NÃO** |
| Rollback executado | **NÃO** |
| `dry_run_workspace/` criado | **NÃO** |
| Agente ativado | **NÃO** |
| `active` alterado | **NÃO** — permanece false |
| `operational_authority` alterado | **NÃO** — permanece none |

**Único output desta iteração:** este documento de plano de dry-run + atualizações em AGENT.md, registry e evolution log.

---

## §13 — Result

| Campo | Valor |
|---|---|
| iteration_status | completed |
| dry_run_plan_status | design_only |
| dry_run_executed | false |
| sql_executed | false |
| local_database_created | false |
| migration_created | false |
| database_created | false |
| table_created | false |
| backup_created | false |
| rollback_executed | false |
| execution_allowed | false |
| active | false |
| operational_authority | none |
| dry_run_gates_defined | 10 (DRY-GATE-01..10) |
| dry_run_sequence_steps | 22 (DR-00..DR-14 com sub-steps: DR-09a/b/c/d, DR-10b, DR-12a/b/c/d = 22 linhas totais; labels base DR-00..DR-14 = 15 + 7 sub-steps = 22) |
| evidence_items_planned | 19 (EV-01..EV-19) |
| success_criteria_defined | 14 (SC-01..SC-14) |
| failure_criteria_defined | 12 (FC-01..FC-12) |
| local_rollback_steps_defined | 10 (LR-00a..LR-10) |
| risks_identified | 11 (DRY-RISK-01..11) |

### Próximas Iterações Elegíveis

| Iteração | Condição |
|---|---|
| **9.0A — Controlled Local Dry-Run Plan QA** | QA formal deste plano — verificar completude, coerência de gates, ausência de gaps na sequência e risco de dry-run acidental |
| **9.1 — Local Dry-Run Harness Design, No Execution** | Somente após QA da 9.0A aprovada — desenhar harness técnico (scripts, ambiente, comandos exatos) sem executar |

**Condição para avançar para 9.1:** aprovação explícita do operador primário + QA da 9.0A com resultado satisfatório.

DRY-RUN PLAN ≠ DRY-RUN EXECUTED.  
LOCAL DRY-RUN PLAN ≠ LOCAL DATABASE CREATED.  
GATE DESIGN ≠ GATE APPROVED.  
DRY-RUN GATE ≠ DRY-RUN EXECUTED.

---

*Criado por: legal-agent (status:draft — sem autoridade operacional)*  
*PLANO DE DRY-RUN ≠ SQL EXECUTADO. PLANO LOCAL ≠ BANCO CRIADO. AGENTE INATIVO ≠ AGENTE OPERACIONAL.*
