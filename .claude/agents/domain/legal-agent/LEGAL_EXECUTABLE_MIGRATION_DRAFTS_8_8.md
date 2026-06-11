# LEGAL-AGENT — Iteração 8.8: Executable Migration Drafts

**Status:** DRAFT_NOT_FOR_EXECUTION  
**Data:** 2026-06-10  
**Iteração:** 8.8  
**Baseado em:** Blueprints iteração 8.7 (patch 8.7B aplicado)  
**Evento:** EVT-20260610-060  

---

## Invariantes Preservados

| Invariante | Valor |
|---|---|
| active | false |
| database_created | false |
| migrations_created | false |
| table_created | false |
| connectors_active | 0 |
| legal_content_fetched | 0 |
| RAG_updates | 0 |
| embeddings_created | 0 |
| sql_files_created | 0 (drafts não contam) |
| operational_authority | none |

---

## Propósito

Esta iteração criou **13 arquivos SQL de rascunho** para revisão humana — nenhum executável, nenhum aplicado como migration. Os arquivos estão em:

```
.claude/agents/domain/legal-agent/migration_drafts_not_for_execution/
```

**Proibições absolutas respeitadas:**
- Nenhum arquivo em `migrations/` ou `supabase/migrations/`
- Nenhum arquivo SQL fora de `migration_drafts_not_for_execution/`
- Nenhuma execução, nenhuma conexão com banco de dados
- Todos os arquivos com cabeçalho bloqueante obrigatório

---

## Arquivos Criados

### SQL Drafts (13 arquivos)

| Arquivo | Tabela/Domínio | Campos | NOT NULL | Nullable |
|---|---|---|---|---|
| 000_README.sql | Documentação geral | — | — | — |
| 001_legal_source_snapshot | legal_source_snapshots | 32 | 21 | 11 |
| 002_legal_source_metadata | legal_source_metadata | 30 | 18 | 12 |
| 003_legal_connector_log | legal_connector_logs | 29 | 23 | 6 |
| 004_legal_quarantine_record | legal_quarantine_records | 22 | 12 | 10 |
| 005_legal_validation_record | legal_validation_records | 20 | 16 | 4 |
| 006_legal_conflict_record | legal_conflict_records | 17 | 12 | 5 |
| 007_legal_rag_index_manifest | legal_rag_index_manifests | 18 | 12 | 6 |
| 008_legal_enums | Documentação de 9 enums | — | — | — |
| 009_legal_constraints | CC-01 a CC-17 (17 constraints) | — | — | — |
| 010_legal_indexes | 35 indexes (33 btree + 2 hash) | — | — | — |
| 011_legal_rls_permissions | 22 políticas RLS (7 roles) | — | — | — |
| 012_legal_rollback | Rollback em 8 steps | — | — | — |

### Manifesto e Documentação

| Arquivo | Tipo |
|---|---|
| LEGAL_SQL_DRAFT_MANIFEST_8_8.yaml | Manifesto YAML de controle |
| LEGAL_EXECUTABLE_MIGRATION_DRAFTS_8_8.md | Este documento |

---

## Ordem de Criação (para referência de revisão)

```
Step 1: enums (arquivo 008) — CHECK constraints como TEXT; não CREATE TYPE
Step 2: legal_source_snapshots (001) — tabela base; todas as demais referenciam esta
Step 3: legal_source_metadata (002) — FK opcional para snapshots (SET NULL)
Step 4: legal_connector_logs (003) — FK opcional para snapshots (SET NULL)
Step 5: legal_quarantine_records (004) — FK opcional para snapshots (SET NULL)
Step 6: legal_validation_records (005) — FK RESTRICT para snapshots
Step 7: legal_conflict_records (006) — FK RESTRICT para snapshots
Step 8: legal_rag_index_manifests (007) — sem FKs
Step 9: constraints adicionais (009) — após tabelas; inclui FK circular
Step 10: indexes (010) — após tabelas
Step 11: RLS permissions (011) — após roles e tabelas
```

---

## Patches 8.7B Refletidos nos Drafts

| OBS | Impacto no SQL Draft |
|---|---|
| OBS-01 | count correto em comentário do arquivo 001 |
| OBS-02 | 22 campos, 12 NOT NULL em arquivo 004 |
| OBS-03 | 5 campos NOT NULL em arquivo 005: checks_performed, checks_failed, stale_risk_after_validation, conflict_status_after_validation, trust_class_after |
| OBS-04 | source_a NOT NULL em arquivo 006 |
| OBS-05 | source_scope NOT NULL DEFAULT 'federal_only' em arquivo 007 |
| OBS-06 | Valores canônicos de allowed_use em arquivo 008 (staging_analysis, educational_reference, etc.) |
| OBS-07 | quarantine_status trust-class-bound em arquivo 008 (rejected_unusable, quarantined_unverified, etc.) |
| OBS-08 | IDX-G-09 (stale_risk btree) incluído em arquivo 010 |

---

## Itens de Revisão — Status Pós-Patch 8.8B

| ID | Arquivo(s) | Status | Resolução |
|---|---|---|---|
| NOTA-R-01 | 001, 008 | **RESOLVIDA** | DEFAULT 'fetched_unvalidated' em legal_source_snapshots; 13 valores em ck_ss_validation_status; ENUM-04 documentado com distinção por entidade |
| NOTA-R-02 | 001, 002, 008 | **RESOLVIDA** | 'no_conflict' confirmado como DEFAULT canônico; ENUM-06 esclarece que 'unknown' não é valor válido |
| NOTA-R-03 | 001, 003 | **RESOLVIDA** | connector_id CHECK substituído de LIKE 'CONN-%' para IN list canônica (CONN-001..CONN-013) |
| NOTA-R-04 | 001 | **RESOLVIDA** | 15 document_type values confirmados (14 tipos + 'unknown'); lista idêntica em arquivos 001 e 002 |
| NOTA-R-05 | 009 | **RESOLVIDA (BLOCKER)** | CREATE FUNCTION drafts completos (PL/pgSQL) adicionados para CC-01/05/06/08/14/15; STEP1=FUNCTION, STEP2=TRIGGER documentado |
| QA-IDX-01 | 010 | **RESOLVIDA** | Header TOTAL 34→35, btree 32→33; IDX-RAG-03 declarado com nota de correção |

---

## Invariantes de Fase (Constraints a Remover Futuramente)

| Constraint | Arquivo | Condição de Remoção |
|---|---|---|
| CC-10: operational BLOCKED | 003 | Quando connectors_active > 0 aprovado |
| CC-11: RAG_updated=false | 003 | Quando RAG ativado e aprovado |
| CC-12: embeddings=false | 003 | Quando embeddings aprovados |
| CC-13: legal_content=false | 003 | Quando connectors_active > 0 aprovado |
| ck_rim_embedding_created_at_null | 007 | Quando embeddings aprovados |

---

## Permanentes (Nunca Remover)

| Constraint | Tabela | Motivo |
|---|---|---|
| CC-14: chain_of_custody_id imutável | legal_source_snapshots | Audit trail inviolável |
| CC-16: TRUST-0/1/2 não em RAG | legal_rag_index_manifests | Proteção do corpus jurídico |
| CC-17: validation_required=true | legal_rag_index_manifests | RAG sem validação é proibido |

---

## Pré-requisitos para Execução (NÃO Atendidos Nesta Fase)

- [ ] Aprovação explícita do operador primário  
- [ ] Banco de dados criado e acessível  
- [ ] Roles PostgreSQL criados (7 roles)  
- [ ] rls_active atualizado para true  
- [ ] connectors_active aprovado (atualizar de 0 para N)  
- [ ] Revisão humana de todos os 13 arquivos SQL  
- [ ] Backup de estado atual antes de qualquer execução  
- [x] Resolução de NOTA-R-01 a NOTA-R-05 e QA-IDX-01 — **aplicada em Patch 8.8B**  

---

## Resultado da Iteração 8.8

- **13 arquivos SQL draft criados** — todos com cabeçalho bloqueante
- **1 manifesto YAML** com inventário completo
- **0 tabelas criadas**
- **0 migrations aplicadas**
- **0 execuções realizadas**
- **Todos os invariantes preservados**

## Patch 8.8B — SQL Draft Patch para Findings QA

**Evento:** EVT-20260610-062  
**Findings resolvidos:** NOTA-R-01, NOTA-R-02, NOTA-R-03, NOTA-R-04, NOTA-R-05 (BLOCKER), QA-IDX-01  

| Arquivo | Patches Aplicados |
|---|---|
| 001 | NOTA-R-01: DEFAULT + CHECK 13 valores; NOTA-R-02: comment; NOTA-R-03: IN list; NOTA-R-04: comment; COMMENT ON COLUMN atualizado |
| 002 | NOTA-R-02: comment cleanup |
| 003 | NOTA-R-03: connector_id IN list canônica |
| 008 | NOTA-R-01: ENUM-04 distinção por entidade (13 vs 12); NOTA-R-02: ENUM-06 5 valores, sem 'unknown' |
| 009 | NOTA-R-05: CREATE FUNCTION drafts completos (PL/pgSQL) para CC-01/05/06/08/14/15 |
| 010 | QA-IDX-01: header TOTAL 34→35, btree 32→33; IDX-RAG-03 declarado |

- **Próxima ação:** revisão humana final dos arquivos patched; aguardar autorização do operador para iteração 8.9 (aprovação e execução)

---

*Criado por: legal-agent (status:draft — sem autoridade operacional)*  
*DRAFT ≠ MIGRAÇÃO APLICADA. RASCUNHO ≠ BANCO CRIADO.*
