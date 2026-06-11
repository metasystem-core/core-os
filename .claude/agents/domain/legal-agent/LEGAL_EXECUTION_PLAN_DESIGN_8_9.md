# LEGAL-AGENT — Iteração 8.9: Execution Plan Design

**Status:** DRAFT_NOT_FOR_EXECUTION  
**Data:** 2026-06-10  
**Iteração:** 8.9  
**Evento:** EVT-20260610-064  
**Baseado em:** LEGAL_SQL_DRAFT_PATCH_QA_8_8C.md (EVT-20260610-063)  
**Versão registry:** 2.25-legal-execution-plan-design  
**Patch:** 8.9B (EVT-20260610-066) — 15 obs QA 8.9A endereçadas

---

## §1 — Purpose

Esta iteração produz um **plano de execução futura** — documento de design que mapeia todos os passos, gates de aprovação, pré-condições e riscos que deverão ser atendidos antes que qualquer SQL dos 13 arquivos draft seja executado.

**Escopo desta iteração:**
- Documentar o plano. Somente documentar.
- Nenhum SQL será executado.
- Nenhum banco será criado.
- Nenhuma migration será aplicada.
- Nenhuma conexão com banco de dados será estabelecida.

A execução futura é evento separado, distinto, que requer autorização explícita do operador primário e satisfação de todas as pré-condições aqui documentadas. Este documento não autoriza nem desencadeia execução.

---

## §2 — Source Basis

| Documento | Iteração | Evento | Papel |
|---|---|---|---|
| LEGAL_SQL_DRAFT_PATCH_QA_8_8C.md | 8.8C | EVT-063 | QA pós-patch — `sql_drafts_ready_for_execution_plan_design` |
| LEGAL_SQL_DRAFT_PATCH_8_8B.md | 8.8B | EVT-062 | Patch dos 6 findings — todos RESOLVIDOS |
| LEGAL_SQL_DRAFT_QA_8_8A.md | 8.8A | EVT-061 | QA original — identificou 6 findings |
| LEGAL_EXECUTABLE_MIGRATION_DRAFTS_8_8.md | 8.8 | EVT-060 | Criação dos 13 arquivos SQL draft |
| Blueprints 8.7B | 8.7B | — | Fonte de verdade do schema |
| AGENT.md §4, §7, §9 | 8.4D | — | Missão, princípios, ciclo de vida |

**Estado atual dos drafts:** 13 arquivos em `migration_drafts_not_for_execution/` — todos com cabeçalho bloqueante `DRAFT_NOT_FOR_EXECUTION`, todos com `DO NOT RUN`, findings NOTA-R-01..05 e QA-IDX-01 resolvidos.

---

## §3 — Execution Status

Todos os invariantes permanecem intocados nesta iteração.

| Invariante | Valor Atual | Condição de Mudança |
|---|---|---|
| active | false | Ativação por operador primário |
| database_created | false | GATE-02 satisfeito |
| migrations_created | false | Execução autorizada |
| table_created | false | Execução autorizada |
| connectors_active | 0 | GATE-07 satisfeito |
| legal_content_fetched | 0 | Após connectors ativos |
| RAG_updates | 0 | Após ingestão aprovada |
| embeddings_created | 0 | Após RAG ativo e aprovado |
| sql_files_created | 0 | Drafts não contam |
| sql_executed | false | Execução autorizada |
| operational_authority | none | Ativação explícita |
| rls_active | false | GATE-06 satisfeito |
| backup_created | false | Pré-execução |
| rollback_executed | false | Somente se necessário |

**Mudança nesta iteração:** nenhuma. Documento de design apenas.

---

## §4 — Preconditions Checklist

Todas as condições abaixo devem ser satisfeitas e verificadas antes de qualquer execução dos arquivos SQL. Nenhuma é opcional.

| ID | Pré-condição | Status Atual | Responsável |
|---|---|---|---|
| PRE-01 | Aprovação explícita do operador primário (declaração verbal ou escrita) | **NÃO ATENDIDA** | Operador primário |
| PRE-02 | Banco de dados criado, acessível e identificado (nome, host, porta) | **NÃO ATENDIDA** | Operador primário |
| PRE-03 | Ambiente confirmado (dev/staging vs produção) — registrar qual | **NÃO ATENDIDA** | Operador primário |
| PRE-04 | 7 roles PostgreSQL criados: `fw_governor`, `legal_agent`, `rag_agent`, `intake_agent`, `meta_router`, `operator_primary`, `operator_visitor` | **NÃO ATENDIDA** | Operador / DBA |
| PRE-05 | Backup do estado atual realizado, verificado e testado (restore em ambiente isolado **obrigatório**) antes de qualquer DDL | **NÃO ATENDIDA** | Operador / DBA |
| PRE-06 | Revisão humana completa dos 13 arquivos SQL (incluindo patched: 001, 002, 003, 008, 009, 010) | **NÃO ATENDIDA** | Operador primário |
| PRE-07 | Plano de rollback disponível e compreendido (arquivo 012) | **NÃO ATENDIDA** | Operador primário |
| PRE-08 | `rls_active` atualizado para true; `ALTER TABLE ... ENABLE ROW LEVEL SECURITY` executado para as 7 tabelas (Step 10b) antes de executar arquivo 011 | **NÃO ATENDIDA** | Operador / DBA |
| PRE-09 | `connectors_active` aprovado (valor de N a definir) antes de qualquer ingestão | **NÃO ATENDIDA** | Operador primário |
| PRE-10 | Para arquivo 009 SEÇÃO C: STEP 1 (CREATE FUNCTION) executado antes de STEP 2 (CREATE TRIGGER) para cada par CC-01/05/06/08/14/15 | **NÃO ATENDIDA** | DBA |
| PRE-11 | OBS-8.8C-01 — 3 ALTER TABLE em arquivo 009 SEÇÃO B (CC-02, CC-03, FK circular): confirmar que tabela base `legal_source_snapshots` existe antes de executar | **NÃO ATENDIDA** | DBA |
| PRE-12 | CC-15 `legal_governance_escalations` — tabela referenciada pelo trigger `trg_qr_connector_bypass_escalation` deve existir antes de aplicar o trigger | **NÃO ATENDIDA** | DBA |
| PRE-13 | Nenhum conector ativo, nenhuma ingestão de conteúdo jurídico antes da execução completa | **NÃO ATENDIDA** | Operador primário |
| PRE-14 | legal-agent permanece em `status:draft` durante toda a execução; nenhuma autoridade operacional assumida | Garantido por design | legal-agent |
| PRE-15 | Dry-run controlado em banco local/dev isolado executado com sucesso antes de qualquer execução em staging ou produção — resultado documentado como EVT da iteração 9.0 | **NÃO ATENDIDA** | Operador / DBA |
| PRE-16 | Integridade dos 13 arquivos SQL verificada: todos presentes em `migration_drafts_not_for_execution/`, checksums validados, nenhum modificado desde 8.8C | **NÃO ATENDIDA** | Operador / DBA |

---

## §5 — Approval Gates

Cada gate deve ser satisfeito na ordem indicada. Gates não são paralelos — são sequenciais.

### GATE-01 — Autorização do Operador Primário

| Campo | Valor |
|---|---|
| gate_id | GATE-01 |
| purpose | Autorização explícita de execução pelo operador primário |
| required_evidence | Declaração explícita: "autorizo execução da migration legal-agent iteração 8.9" ou equivalente |
| pass_condition | Declaração registrada com data/hora |
| fail_action | Suspender todas as etapas; nenhum SQL executado |
| status | not_executed |
| blocks | GATE-02 a GATE-09; toda execução |

---

### GATE-02 — Banco de Dados Disponível

| Campo | Valor |
|---|---|
| gate_id | GATE-02 |
| purpose | Confirmar banco de dados criado, acessível e identificado |
| required_evidence | Conexão verificada; nome do banco, host e porta registrados |
| pass_condition | `SELECT 1;` retorna sem erro |
| fail_action | Criar banco antes de prosseguir |
| status | not_executed |
| blocks | GATE-03 a GATE-09 |

---

### GATE-03 — Roles PostgreSQL Criados

| Campo | Valor |
|---|---|
| gate_id | GATE-03 |
| purpose | 7 roles necessários para RLS e permissões devem existir antes de qualquer CREATE TABLE |
| required_evidence | `SELECT rolname FROM pg_roles WHERE rolname IN (...)` retorna 7 linhas |
| pass_condition | Todos os 7 roles presentes: fw_governor, legal_agent, rag_agent, intake_agent, meta_router, operator_primary, operator_visitor |
| fail_action | Executar CREATE ROLE para os ausentes |
| status | not_executed |
| blocks | GATE-04 a GATE-09 |

---

### GATE-04 — Backup Verificado

| Campo | Valor |
|---|---|
| gate_id | GATE-04 |
| purpose | Backup do estado atual antes de qualquer DDL irreversível |
| required_evidence | Arquivo de backup gerado, tamanho verificado, data/hora registrada |
| pass_condition | Backup restaurável confirmado — teste de restore em ambiente isolado **obrigatório** antes de qualquer DDL |
| fail_action | Gerar backup antes de prosseguir; não executar sem backup verificado |
| status | not_executed |
| blocks | GATE-05 a GATE-09 |

---

### GATE-05 — Revisão Humana Completa

| Campo | Valor |
|---|---|
| gate_id | GATE-05 |
| purpose | Operador primário revisou todos os 13 arquivos SQL, incluindo os patched em 8.8B |
| required_evidence | Confirmação explícita por arquivo; foco em 001/003/008/009/010 (patched) |
| pass_condition | Operador declara revisão concluída; nenhuma objeção pendente |
| fail_action | Resolver objeções antes de prosseguir |
| status | not_executed |
| blocks | GATE-06 a GATE-09 |

---

### GATE-06 — RLS Habilitado

| Campo | Valor |
|---|---|
| gate_id | GATE-06 |
| purpose | Row Level Security deve estar ativo antes de executar arquivo 011 |
| required_evidence | `rls_active` atualizado para true; `ALTER TABLE ... ENABLE ROW LEVEL SECURITY` executado para as 7 tabelas antes das políticas |
| pass_condition | `SELECT relrowsecurity FROM pg_class WHERE relname = 'legal_source_snapshots'` retorna true |
| fail_action | Executar ENABLE ROW LEVEL SECURITY antes das políticas |
| status | not_executed |
| blocks | GATE-07 a GATE-09 |

---

### GATE-07 — Connectors Aprovados

| Campo | Valor |
|---|---|
| gate_id | GATE-07 |
| purpose | Valor de connectors_active deve ser aprovado antes de qualquer ingestão |
| required_evidence | Operador primário declara N conectores aprovados (1..13); invariantes de fase CC-10/11/12/13 podem ser removidos |
| pass_condition | `connectors_active` atualizado de 0 para N aprovado |
| fail_action | Manter connectors_active = 0; invariantes de fase permanecem ativos |
| status | not_executed |
| note | GATE-07 não bloqueia execução do schema — bloqueia ativação de conectores |

---

### GATE-08 — Rollback Plan Confirmado

| Campo | Valor |
|---|---|
| gate_id | GATE-08 |
| purpose | Plano de rollback (arquivo 012) revisado, compreendido e disponível para execução imediata |
| required_evidence | Operador declara que leu e entende os 8 steps de rollback e os 5 requisitos PRES |
| pass_condition | Declaração de confirmação registrada |
| fail_action | Suspender execução até confirmação |
| status | not_executed |
| blocks | GATE-01 a GATE-09; toda execução — nenhuma DDL pode ser iniciada e nenhum rollback pode ser executado sem este gate satisfeito |

---

### GATE-09 — OBS-8.8C-01 e CC-15 Resolvidos

| Campo | Valor |
|---|---|
| gate_id | GATE-09 |
| purpose | Dois itens estruturais devem ser endereçados antes de executar arquivo 009 |
| required_evidence | (1) Confirmação de que `legal_source_snapshots` existe antes de executar ALTER TABLE de arquivo 009 SEÇÃO B. (2) Tabela `legal_governance_escalations` criada antes de CC-15 trigger |
| pass_condition | Ambas as condições verificadas por DBA |
| fail_action | Não executar arquivo 009 SEÇÃO B/C sem estas condições |
| status | not_executed |
| blocks | Execução do arquivo 009 |
| pass_condition_partial | CC-15 pode ser formalmente diferida: condição (1) snapshots satisfeita + adiamento documentado por escrito com identificação da iteração responsável por `legal_governance_escalations`. Partial pass = GATE-09 PASS com nota de CC-15 diferida. |

---

### GATE-10 — Dry-Run Local Confirmado

| Campo | Valor |
|---|---|
| gate_id | GATE-10 |
| purpose | Confirmar que dry-run controlado em ambiente local/dev foi executado com sucesso antes de qualquer execução em staging ou produção |
| required_evidence | Relatório de dry-run da iteração 9.0 com resultado pass; ambiente identificado e diferente do banco de produção |
| pass_condition | Dry-run local concluído sem erros; relatório registrado como EVT da iteração 9.0 |
| fail_action | Não executar em staging ou produção; resolver erros no ambiente de dry-run primeiro |
| status | not_executed |
| blocks | Execução em staging e produção |
| note | GATE-10 não bloqueia o dry-run local — bloqueia promoção para staging/produção |

---

## §6 — Future Execution Order

Ordem futura de execução dos 13 arquivos draft — **não executar nesta iteração**.

| Step | Arquivo | Objeto | Dependência | Notas |
|---|---|---|---|---|
| 0 | — | Backup | Nenhuma | PRE-05; obrigatório antes de Step 1 |
| 1 | 008_legal_enums | Documentação de enums | Nenhuma | Referência; não CREATE TYPE — enums como TEXT CHECK |
| 2 | 001_create_legal_source_snapshot | legal_source_snapshots | Nenhuma | Tabela base; todas as demais referenciam esta |
| 3 | 002_create_legal_source_metadata | legal_source_metadata | Step 2 (FK SET NULL) | FK opcional para snapshots |
| 4 | 003_create_legal_connector_log | legal_connector_logs | Step 2 (FK SET NULL) | FK opcional para snapshots |
| 5 | 004_create_legal_quarantine_record | legal_quarantine_records | Step 2 (FK SET NULL) | FK opcional para snapshots |
| 6 | 005_create_legal_validation_record | legal_validation_records | Step 2 (FK RESTRICT) | FK restritiva para snapshots |
| 7 | 006_create_legal_conflict_record | legal_conflict_records | Step 2 (FK RESTRICT) | FK restritiva para snapshots |
| 8 | 007_create_legal_rag_index_manifest | legal_rag_index_manifests | Nenhuma | Sem FKs para outras tabelas |
| 9a | 009_legal_constraints SEÇÃO A | ALTER TABLE FK circular | Steps 2–8 | FK quarantine_records ↔ snapshots |
| 9b | 009_legal_constraints SEÇÃO B | ALTER TABLE CC-02, CC-03 | Step 2 | OBS-8.8C-01: snapshots deve existir (GATE-09) |
| 9c | 009_legal_constraints SEÇÃO C | CREATE FUNCTION (STEP 1) | Steps 2–8 | Executar function ANTES do trigger |
| 9d | 009_legal_constraints SEÇÃO C | CREATE TRIGGER (STEP 2) | Step 9c | Cada trigger após sua function correspondente |
| 10 | 010_legal_indexes | 35 indexes (33 btree + 2 hash) | Steps 2–9 | Somente após todas as tabelas |
| 10b | — | ALTER TABLE ... ENABLE ROW LEVEL SECURITY (7 tabelas legal_) | Steps 2–8 | Para cada uma das 7 tabelas legal_: executar ENABLE ROW LEVEL SECURITY antes de Step 11 — satisfaz GATE-06 e PRE-08 |
| 11 | 011_legal_rls_permissions | 22 políticas RLS | GATE-03, GATE-06 | Roles e RLS ENABLE devem existir antes |
| 12a | — | Validar tabelas vazias | Step 11 | `SELECT COUNT(*) FROM` cada tabela → 0 |
| 12b | — | Confirmar zero ingestão | Step 11 | Nenhum conteúdo jurídico inserido |
| 12c | — | Registrar estado | Step 11 | Atualizar invariantes: table_created, migrations_created, rls_active |

**CC-15 prerequisite:** tabela `legal_governance_escalations` deve existir antes de executar trigger `trg_qr_connector_bypass_escalation`. Se não existir, adiar CC-15 para iteração própria. Adiamento deve ser documentado por escrito com identificação da iteração responsável por criar `legal_governance_escalations` — rastreável via GATE-09 pass_condition_partial.

---

## §7 — Pre-Execution Validation Checklist

Verificações a realizar imediatamente antes de iniciar Step 1.

| Check | Query / Ação | Expected |
|---|---|---|
| PCHECK-01 | `SELECT current_database(), current_user, version()` | Ambiente correto identificado |
| PCHECK-02 | `SELECT rolname FROM pg_roles WHERE rolname IN ('fw_governor','legal_agent','rag_agent','intake_agent','meta_router','operator_primary','operator_visitor')` | 7 linhas retornadas |
| PCHECK-03 | Backup file existe, tamanho > 0 e teste de restore em ambiente isolado concluído com sucesso | Sim — restore test obrigatório |
| PCHECK-04 | `SELECT tablename FROM pg_tables WHERE schemaname='public' AND tablename LIKE 'legal_%'` | 0 linhas (nenhuma tabela legal_ pré-existente) |
| PCHECK-05 | Todos os 13 arquivos presentes em `migration_drafts_not_for_execution/`; integridade verificada (checksums, nenhuma modificação desde 8.8C) | ls confirma 13 arquivos; checksums validados |
| PCHECK-06 | `legal_governance_escalations` existe OU CC-15 adiado | Verificar antes de Step 9d |
| PCHECK-07 | `connectors_active` valor aprovado registrado | N declarado pelo operador |
| PCHECK-08 | GATE-01 a GATE-09 todos satisfeitos | Todos pass |
| PCHECK-09 | `SELECT COUNT(*) FROM pg_tables WHERE tablename LIKE 'legal_%' AND rowsecurity = false` | 0 — todas as 7 tabelas legal_ com RLS habilitado antes de Step 11 |

---

## §8 — Post-Execution Validation Checklist

Verificações a realizar após conclusão do Step 12.

| Check | Query / Ação | Expected |
|---|---|---|
| VCHECK-01 | `SELECT tablename FROM pg_tables WHERE schemaname='public' AND tablename LIKE 'legal_%'` | 7 tabelas: snapshots, metadata, connector_logs, quarantine_records, validation_records, conflict_records, rag_index_manifests |
| VCHECK-02 | `SELECT COUNT(*) FROM legal_source_snapshots` | 0 (tabela criada, sem dados) |
| VCHECK-03 | `SELECT COUNT(*) FROM legal_source_metadata` | 0 |
| VCHECK-04 | `SELECT COUNT(*) FROM legal_connector_logs` | 0 |
| VCHECK-05 | `SELECT COUNT(*) FROM legal_quarantine_records` | 0 |
| VCHECK-06 | `SELECT COUNT(*) FROM legal_validation_records` | 0 |
| VCHECK-07 | `SELECT COUNT(*) FROM legal_conflict_records` | 0 |
| VCHECK-08 | `SELECT COUNT(*) FROM legal_rag_index_manifests` | 0 |
| VCHECK-09 | `SELECT indexname FROM pg_indexes WHERE tablename LIKE 'legal_%'` | 35 indexes (verificar contagem) |
| VCHECK-10 | `SELECT tablename, rowsecurity FROM pg_tables WHERE tablename LIKE 'legal_%'` | rowsecurity=true para 7 tabelas |
| VCHECK-11 | `SELECT COUNT(*) FROM pg_policies WHERE tablename LIKE 'legal_%'` | 22 políticas |
| VCHECK-12 | `SELECT tgname FROM pg_trigger WHERE tgrelid::regclass::text LIKE 'legal_%'` | 6 triggers: trg_ss_trust0_auto, trg_ss_trust_class_forward_only, trg_ss_trust01_quarantine_required, trg_ss_conflict_record_required, trg_ss_chain_of_custody_immutable, trg_qr_connector_bypass_escalation |
| VCHECK-12b | `SELECT proname FROM pg_proc WHERE proname IN ('fn_ss_trust0_auto','fn_ss_trust_class_forward_only','fn_ss_trust01_quarantine_required','fn_ss_conflict_record_required','fn_ss_chain_of_custody_immutable','fn_qr_connector_bypass_escalation')` | 6 functions existem |
| VCHECK-13 | Nenhum conteúdo em nenhuma tabela legal_ | Todas com COUNT=0 |
| VCHECK-14 | Atualizar invariantes do registry: table_created=true, migrations_created=true, rls_active=true | Registrar como EVT da iteração de execução real (a definir) |

---

## §9 — Rollback Plan

Baseado em `012_legal_rollback_DRAFT_NOT_FOR_EXECUTION.sql`. Ordem reversa de criação.

### PRES — Preservation Requirements (executar ANTES de qualquer DROP)

| ID | Requisito | Dados a preservar |
|---|---|---|
| PRES-01 | Export bypass logs | SELECT * FROM legal_connector_logs WHERE connector_bypass = true INTO backup |
| PRES-02 | Export TRUST-4/5 snapshots | SELECT * FROM legal_source_snapshots WHERE trust_class IN ('TRUST-4','TRUST-5') INTO backup |
| PRES-03 | Export TRUST-0 quarantine records | SELECT * FROM legal_quarantine_records WHERE quarantine_reason LIKE 'trust0%' INTO backup |
| PRES-04 | Export promoted validation records | SELECT * FROM legal_validation_records WHERE trust_class_after >= 'TRUST-3' INTO backup |
| PRES-05 | Export chain_of_custody_id map | SELECT id, chain_of_custody_id FROM legal_source_snapshots INTO backup — **executar primeiro** |

### Rollback Steps (ordem inversa da criação)

| Step | Objeto | Risco | Aprovação Necessária | Notas |
|---|---|---|---|---|
| R-00a | DROP TRIGGER IF EXISTS (6 triggers) | NONE | Não | Remover todos os triggers antes dos DROP TABLE: trg_ss_trust0_auto, trg_ss_trust_class_forward_only, trg_ss_trust01_quarantine_required, trg_ss_conflict_record_required, trg_ss_chain_of_custody_immutable, trg_qr_connector_bypass_escalation |
| R-00b | DROP FUNCTION IF EXISTS (6 functions) | NONE | Não | Remover todas as functions após R-00a: fn_ss_trust0_auto, fn_ss_trust_class_forward_only, fn_ss_trust01_quarantine_required, fn_ss_conflict_record_required, fn_ss_chain_of_custody_immutable, fn_qr_connector_bypass_escalation |
| R-01 | DROP TABLE legal_rag_index_manifests | LOW | Não | Sem FKs de outras tabelas |
| R-02 | DROP TABLE legal_conflict_records | HIGH | Operador primário | FK RESTRICT para snapshots |
| R-03 | DROP TABLE legal_validation_records | HIGH | Operador primário | FK RESTRICT para snapshots; PRES-04 |
| R-04 | DROP TABLE legal_quarantine_records | MEDIUM | Operador primário | FK SET NULL; PRES-03 |
| R-05 | DROP TABLE legal_connector_logs | MEDIUM | Verificar bypass logs | PRES-01 |
| R-06 | DROP TABLE legal_source_metadata | MEDIUM | Verificar dependências | FK SET NULL |
| R-07 | DROP TABLE legal_source_snapshots | **CRITICAL** | **Operador primário explícito** | PRES-02, PRES-05 obrigatórios antes; cadeia completa de dados |
| R-08 | Enums (implicit) | NONE | Não | Sem CREATE TYPE — CHECK constraints removidas com as tabelas |

**Todos os DROP TABLE usam `IF EXISTS` guards.**

**Roles:** rollback opcional — somente se os roles foram criados exclusivamente para este schema.

**Ordem de rollback:** R-00a (DROP TRIGGER) → R-00b (DROP FUNCTION) → R-01..R-08 (DROP TABLE).

---

## §10 — Risk Matrix

| ID | Risco | Probabilidade | Impacto | Mitigação |
|---|---|---|---|---|
| RISK-01 | Execução em ambiente errado (produção vs dev/staging) | MÉDIA | CRÍTICO | PCHECK-01: identificar ambiente antes de Step 1; GATE-02 inclui confirmação de ambiente |
| RISK-02 | Arquivo SQL movido para fora de `migration_drafts_not_for_execution/` prematuramente | BAIXA | ALTO | Proibição absoluta registrada; cabeçalho bloqueante em todos os arquivos |
| RISK-03 | Políticas RLS permissivas por erro de configuração | BAIXA | ALTO | GATE-06: verificar rowsecurity=true; VCHECK-10/11 pós-execução |
| RISK-04 | Trigger criado sem function correspondente (padrão NOTA-R-05) | MÉDIA | BLOCKER | GATE-09; PRE-10: STEP 1 (function) obrigatório antes de STEP 2 (trigger); arquivo 009 patched |
| RISK-05 | CC-15 trigger falha — `legal_governance_escalations` não existe | ALTA | BLOCKER | PRE-12, GATE-09, PCHECK-06: criar tabela ou adiar CC-15 |
| RISK-06 | Rollback de `legal_source_snapshots` sem PRES-05 — perda de chain_of_custody | BAIXA | CRÍTICO | PRES-05 é o primeiro passo de qualquer rollback; R-07 bloqueia sem confirmação |
| RISK-07 | Ingestão acidental de conteúdo jurídico antes de schema validado | MÉDIA | ALTO | PRE-13: connectors_active=0 durante execução; VCHECK-13 confirma tabelas vazias |
| RISK-08 | Ativação do legal-agent durante estado draft | BAIXA | ALTO | operational_authority: none preservado; GATE-01 requer declaração explícita |
| RISK-09 | Ativação de conectores antes da aprovação GATE-07 | MÉDIA | ALTO | Invariantes de fase CC-10/11/12/13 bloqueiam operacionalmente |
| RISK-10 | Interpretação errônea do documento como autorização de execução | ALTA | CRÍTICO | §11 desta iteração; cabeçalho DRAFT_NOT_FOR_EXECUTION; §1 Purpose explícito |
| RISK-11 | OBS-8.8C-01: ALTER TABLE em arquivo 009 SEÇÃO B executado antes da tabela base | MÉDIA | BLOCKER | GATE-09, PRE-11: Step 2 (snapshots) deve preceder Step 9b |
| RISK-12 | Execução dos arquivos em ordem incorreta — FK violations | MÉDIA | ALTO | §6 Execution Order; FK RESTRICT em validation_records e conflict_records |

---

## §11 — Non-Execution Confirmation

Esta seção confirma formalmente o que **não ocorreu** nesta iteração.

| Item | Status |
|---|---|
| SQL executado | **NÃO** |
| Banco de dados criado | **NÃO** |
| Tabelas criadas | **NÃO** |
| Migrations aplicadas | **NÃO** |
| Conexão com banco estabelecida | **NÃO** |
| Roles criados | **NÃO** |
| RLS habilitado | **NÃO** |
| Triggers criados | **NÃO** |
| Functions criadas | **NÃO** |
| Indexes criados | **NÃO** |
| Políticas RLS aplicadas | **NÃO** |
| Conteúdo jurídico ingerido | **NÃO** |
| Connectors ativados | **NÃO** |
| Autoridade operacional assumida | **NÃO** |
| Arquivos SQL fora de `migration_drafts_not_for_execution/` | **NÃO** |
| Dry-run executado | **NÃO** |
| Backup criado | **NÃO** |

**Único output desta iteração:** este documento de design + atualizações em AGENT.md, registry e evolution log.

---

## §12 — Result

| Campo | Valor |
|---|---|
| execution_plan_status | design_only |
| sql_executed | false |
| database_created | false |
| operational_authority | none |
| gates_defined | 9 (GATE-01 a GATE-09) |
| preconditions_defined | 14 (PRE-01 a PRE-14) |
| preconditions_satisfied | 1 (PRE-14 — garantido por design) |
| preconditions_pending | 13 |
| risks_identified | 12 (RISK-01 a RISK-12) |
| rollback_steps_documented | 8 (R-01 a R-08) |
| preservation_requirements | 5 (PRES-01 a PRES-05) |
| execution_steps_planned | 12 (Steps 0 a 12) |
| next_eligible | 8.9A (pré-condições e gates) ou 9.0 (execução) |
| next_trigger | Autorização explícita do operador primário + satisfação de todos os 9 gates |

**Esta iteração não produz, não aplica, não simula e não autoriza execução de SQL.**

---

*Criado por: legal-agent (status:draft — sem autoridade operacional)*  
*PLAN ≠ EXECUÇÃO. DESIGN ≠ MIGRAÇÃO APLICADA. DRAFT ≠ BANCO CRIADO.*
