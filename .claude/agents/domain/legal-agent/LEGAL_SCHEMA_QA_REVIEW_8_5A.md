---
iteration: "8.5A"
title: "Legal Snapshot Schema QA Review"
parent_iteration: "8.5"
design_mode: schema_qa_review_only
database_created: false
migrations_created: false
connectors_active: 0
legal_content_fetched: 0
active: false
operational_authority: none
created_at: "2026-06-10"
event_id: "EVT-20260610-053"
---

# Iteração 8.5A — Legal Snapshot Schema QA Review

Revisão formal do design produzido na Iteração 8.5 (`LEGAL_SNAPSHOT_SCHEMA_DESIGN_8_5.md`) antes de qualquer materialização em arquivos de schema locais, migrations, banco de dados ou conectores.

---

## §1. Identificação

| Campo | Valor |
|---|---|
| Iteração | 8.5A |
| Documento de revisão | `LEGAL_SCHEMA_QA_REVIEW_8_5A.md` |
| Documento revisado | `LEGAL_SNAPSHOT_SCHEMA_DESIGN_8_5.md` |
| Data | 2026-06-10 |
| Evento | EVT-20260610-053 |
| Status do agente | active:false / operational_authority:none |
| Dados jurídicos acessados | 0 |

---

## §2. Escopo e Objetivo da QA

Esta revisão tem escopo exclusivamente documental. Nenhum banco de dados, nenhuma migration, nenhum conector, nenhum arquivo de schema executável e nenhum conteúdo jurídico real foram criados, ativados ou acessados.

**Objetivo:** verificar se o design schema da Iteração 8.5 é internamente consistente, alinha-se com os documentos de governança anteriores (8.4D, 8.4E, 8.4C, políticas de atualização e resolução de conflitos) e não contém lacunas que comprometam a implementação futura.

**Escopo de revisão:**
- Completude de entidades (campos obrigatórios vs. campos presentes)
- Cobertura dos 7 campos críticos de proveniência definidos em 8.4D
- Consistência das enumerações entre entidades e o catálogo mestre §12
- Validação das 10 regras cross-entity (REGRA-01 a REGRA-10)
- Caminhos de promoção entre trust classes
- Firewalls RAG e de memória
- Carryover de risco de conectores da Iteração 8.4C
- Vazamentos de autoridade operacional
- Integridade dos exemplos fictícios

**Não está no escopo desta QA:**
- Validação de conteúdo jurídico real
- Avaliação de desempenho ou custo de implementação
- Decisão de arquitetura de banco de dados
- Aprovação ou ativação de conectores

---

## §3. Documentos Lidos

| Documento | Finalidade |
|---|---|
| `LEGAL_SNAPSHOT_SCHEMA_DESIGN_8_5.md` | Objeto principal da QA — design completo |
| `LEGAL_KNOWLEDGE_FIREWALL_8_4D.md` | Referência: 7 campos críticos, 6 trust classes, regras de proveniência |
| `LEGAL_CROSS_AGENT_CONTAMINATION_QA_8_4E.md` | Referência: 12 cenários de contaminação, SC-LEG-FW-001 a SC-LEG-FW-012 |
| `LEGAL_CONNECTOR_TERMS_ROBOTS_REVIEW_8_4C.md` | Referência: CONN-001/CONN-002 risco herdado, carryover obrigatório |
| `LEGAL_UPDATE_POLICY.md` | Referência: política de atualização de corpus e stale_risk |
| `LEGAL_CONFLICT_RESOLUTION_PROTOCOL.md` | Referência: 8 tipos de conflito T-01 a T-08 |

---

## §4. Completude de Entidades — Checklist

Verificação de presença das 7 entidades especificadas e contagem de campos.

| Entidade | Esperado | Campos Declarados | Status |
|---|---|---|---|
| `legal_source_snapshot` | ≥ 25 campos | 31 campos | PASS |
| `legal_source_metadata` | ≥ 20 campos | 28 campos | PASS (com REVIEW) |
| `legal_connector_log` | ≥ 20 campos | 26 campos | PASS (com REVIEW) |
| `legal_quarantine_record` | ≥ 18 campos | 22 campos | PASS (com REVIEW) |
| `legal_validation_record` | ≥ 15 campos | 20 campos | PASS |
| `legal_conflict_record` | ≥ 14 campos | 17 campos | PASS |
| `legal_rag_index_manifest` | ≥ 12 campos | 15 campos | PASS |

Todas as 7 entidades estão presentes. 3 entidades têm REVIEWs não-bloqueadores de campos ausentes recomendados (detalhados em §15).

---

## §5. Revisão de Campos Críticos de Proveniência (7 Campos — 8.4D)

Os 7 campos críticos definidos em `LEGAL_KNOWLEDGE_FIREWALL_8.4D.md` são:
`source_url`, `authority_level`, `official_source`, `fetched_at`, `raw_content_hash` (checksum), `validation_status`, `chain_of_custody_id`

### 5.1 Presença em `legal_source_snapshot`

| Campo Crítico | Presente | Obrigatório | Notas |
|---|---|---|---|
| `source_url` | PASS | `required: true` | Ausência → TRUST-0 automático |
| `authority_level` | PASS | `required: true` | Integer 1–7 |
| `official_source` | PASS | `required: true` | Boolean |
| `fetched_at` | PASS | `required: true` | ISO8601_datetime UTC |
| `raw_content_hash` | PASS | `required: true` | SHA256/SHA512 |
| `validation_status` | PASS | `required: true` | Enum master |
| `chain_of_custody_id` | PASS | `required: true` | UUID reference |

**Resultado §5.1:** 7/7 campos críticos presentes e obrigatórios em `legal_source_snapshot`. PASS completo.

### 5.2 Presença em `legal_source_metadata`

| Campo Crítico | Presente | Status |
|---|---|---|
| `source_url` | Herdado via `snapshot_id` | Parcial |
| `authority_level` | PASS — `required: true` | PASS |
| `official_source` | AUSENTE | REVIEW-02 |
| `fetched_at` | AUSENTE | REVIEW-01 |
| `raw_content_hash` | Não aplicável (metadata_only) | N/A aceitável |
| `validation_status` | PASS — presente, enum incompleto | PASS com REVIEW-05 |
| `chain_of_custody_id` | Não diretamente | Herdado via `snapshot_id` |

**Resultado §5.2:** `legal_source_metadata` ausente em `fetched_at` e `official_source`. Ambos são REVIEWs não-bloqueadores para endereçamento em 8.6. Entidade ainda é válida para design — campos herdáveis via join com snapshot onde aplicável.

### 5.3 Presença em `legal_quarantine_record`

| Campo Crítico | Presente | Status |
|---|---|---|
| `snapshot_id` | PASS — referência ao snapshot | PASS |
| `chain_of_custody_id` | AUSENTE (direto) | REVIEW-03 |
| `missing_provenance_fields` | PASS — lista campos ausentes | PASS |

**Resultado §5.3:** REVIEW-03 não-bloqueador. Quarantine record referencia snapshot que contém chain_of_custody_id, mas o registro não é auto-suficiente para auditoria forense.

---

## §6. Consistência de Enumerações

### 6.1 Enumeração Mestre §12.4 — `validation_status` (12 valores)

Valores definidos no catálogo master:
`not_started`, `pending`, `failed`, `fetched_unvalidated`, `parsed_unvalidated`, `passed_technical_only`, `validated_snapshot`, `human_review_required`, `human_reviewed`, `rejected`, `deprecated`, `conflict_detected`

### 6.2 Cobertura por Entidade

| Entidade | Valores Inline | Valores Ausentes vs. Master | Status |
|---|---|---|---|
| `legal_source_snapshot` | Referência ao master | — | PASS |
| `legal_source_metadata` | 7: [not_started, pending, passed_technical_only, validated_snapshot, human_reviewed, rejected, deprecated] | 4 ausentes: fetched_unvalidated, parsed_unvalidated, human_review_required, conflict_detected | REVIEW-05 |
| `legal_connector_log` (`validation_status_after_operation`) | 6: [not_applicable, fetched_unvalidated, parsed_unvalidated, pending, failed, validated_snapshot] | Subset intencional do log de operação | PASS (subset intencional) |
| `legal_validation_record` | Referência ao master | — | PASS |

**Resultado §6:** REVIEW-05 identificado em `legal_source_metadata`. Os 4 valores ausentes (`fetched_unvalidated`, `parsed_unvalidated`, `human_review_required`, `conflict_detected`) são estados relevantes para metadados e sua ausência cria divergência entre entidade e catálogo master.

### 6.3 Demais Enumerações — Verificação Cruzada

| Enum | Master §12 | Entidades | Status |
|---|---|---|---|
| `trust_class` | 6 valores | Consistente em todas as entidades | PASS |
| `quarantine_status` | 7 valores | Consistente | PASS |
| `authority_level` | 7 níveis (1–7) | Consistente | PASS |
| `stale_risk` | 5 valores | Consistente — [low, medium, high, critical, unknown] | PASS |
| `conflict_status` | 5 valores | Consistente | PASS |
| `allowed_use` | 7 valores | Consistente | PASS |
| `prohibited_use` | 9 valores | Consistente | PASS |
| `connector_status` | 8 valores | Consistente — CONN-001 blocked, CONN-002 review_required registrado | PASS |

---

## §7. Revisão das Regras Cross-Entity (REGRA-01 a REGRA-10)

| Regra | Descrição | Entidades Envolvidas | QA Status | Observação |
|---|---|---|---|---|
| REGRA-01 | Metadata aponta para snapshot ou declara metadata_only | legal_source_metadata → legal_source_snapshot | PASS | Campo `metadata_source_type: metadata_only` presente |
| REGRA-02 | TRUST-0/1 → quarantine_record obrigatório | legal_source_snapshot/metadata → legal_quarantine_record | PASS | Registrado em special_rules de ambas as entidades |
| REGRA-03 | TRUST-4 → validation_record obrigatório | legal_source_snapshot → legal_validation_record | PASS | Regra explícita, campo `human_review_required: true` presente |
| REGRA-04 | conflict_detected → conflict_record | legal_source_snapshot/metadata → legal_conflict_record | PASS | Campo `conflict_status` em todas entidades, `legal_conclusion_allowed:false` por padrão |
| REGRA-05 | stale_risk:critical bloqueia corpus validado | legal_source_snapshot → IDX-004/IDX-005 | PASS | REGRA-05 usa `stale_risk: critical` (enum value correto). REVIEW-06: special_rules de snapshot menos específico que REGRA formal — divergência de redação, não de lógica |
| REGRA-06 | Conteúdo de outro agente → TRUST-1 | cross-agent → legal_quarantine_record | PASS | Campo `received_from` e enum `contamination_vector: other_agent_output` presente |
| REGRA-07 | CONN-001/002 herdam risco 8.4C → TRUST-1 max | legal_connector_log → legal_source_snapshot | PASS | `connector_status_at_collection`, `access_risk_at_collection`, `terms_robots_review_status` presentes em snapshot |
| REGRA-08 | RAG validado recusa TRUST-0/1 | legal_source_snapshot/quarantine → legal_rag_index_manifest IDX-004/005 | PASS | `prohibited_trust_classes` explícito em IDX-004 e IDX-005 |
| REGRA-09 | TRUST-4 exige checksum | legal_source_snapshot → legal_validation_record | PASS | `raw_content_hash: required:true`, `checksum_created:true` em connector_log |
| REGRA-10 | TRUST-5 exige revisão humana | legal_validation_record | PASS | `validation_type: human_review`, `validator_type: [human_operator, human_lawyer]` declarados |

**Resultado §7:** Todas as 10 regras formalizadas. REGRA-05 tem REVIEW-06 de precisão de redação (não-bloqueador). 0 falhas de cobertura.

---

## §8. Revisão de Caminhos de Promoção de Trust Class

### 8.1 Caminhos Formalizados

| Transição | Regra Aplicável | Entidade de Controle | Status |
|---|---|---|---|
| TRUST-1 → TRUST-2 | Campos críticos preenchidos + official_source confirmado | legal_quarantine_record (`promotion_possible:true`, `promotion_requirements`) | PASS |
| TRUST-2 → TRUST-3 | Snapshot integral obtido de fonte oficial | Não formalizado explicitamente | REVIEW-07 |
| TRUST-3 → TRUST-4 | Validação técnica mínima + checksum | legal_validation_record (REGRA-03 + REGRA-09) | PASS |
| TRUST-4 → TRUST-5 | Revisão humana autorizada | legal_validation_record (REGRA-10) | PASS |
| TRUST-0 → qualquer | Bloqueado definitivamente | legal_quarantine_record (`promotion_possible:false`) | PASS |

### 8.2 Análise TRUST-2 → TRUST-3 (REVIEW-07)

O caminho de promoção de metadado oficial (TRUST-2) para snapshot integral (TRUST-3) representa o momento em que um localizador gera uma solicitação de coleta real. Este workflow não tem regra formal no schema:

- Não há REGRA que descreva o trigger para promoção TRUST-2 → TRUST-3
- Não há campo em `legal_source_metadata` que registre "snapshot_requested"
- O design atual assume que o operador decide manualmente quando um TRUST-2 justifica coleta de snapshot

**Classificação:** REVIEW-07 — não-bloqueador para design puro. A ausência do caminho formal é aceitável em fase de schema design; deve ser formalizada em 8.6 (local schema files) como REGRA-11 ou campo de controle adicional.

---

## §9. QA de Contaminação RAG

Verificação dos 5 índices RAG projetados quanto a firewalls de trust class e políticas de admissão.

| Índice | Trust Classes Permitidas | Trust Classes Proibidas | Embeddings | Legal Use | Status |
|---|---|---|---|---|---|
| IDX-001 (quarantine_log) | TRUST-0, TRUST-1 | — | false | false | PASS |
| IDX-002 (metadata_index) | TRUST-2 | TRUST-0, TRUST-1, TRUST-3, TRUST-4, TRUST-5 | future_optional | metadata_and_locator_only | PASS |
| IDX-003 (staging_index) | TRUST-3 | TRUST-0, TRUST-1, TRUST-2, TRUST-4, TRUST-5 | future_after_approval | staging_analysis_only | PASS |
| IDX-004 (validated_official_index) | TRUST-4 | TRUST-0, TRUST-1, TRUST-2, TRUST-3, TRUST-5 | future_after_approval | educational_and_controlled_reference | PASS |
| IDX-005 (human_reviewed_index) | TRUST-5 | TRUST-0, TRUST-1, TRUST-2, TRUST-3, TRUST-4 | future_after_human_review_gate | controlled_assisted_legal_analysis | PASS |

**Verificação de isolamento:** Cada índice admite exatamente uma trust class. Nenhum índice mistura classes de confiança diferentes. TRUST-0/1 proibidos em IDX-002 a IDX-005 explicitamente. IDX-001 não tem embeddings — apenas log de auditoria.

**Verificação de contaminação cross-índice:** `prohibited_trust_classes` declarados em cada índice. Não é possível indexar conteúdo de trust class errada sem violar as regras do manifesto do índice.

**Resultado §9:** 5/5 índices com firewalls corretos. 0 riscos de contaminação RAG detectados no design.

---

## §10. QA de Contaminação de Memória

Verificação de que o schema não contém mecanismos que permitam que conteúdo jurídico não-validado entre em memória operacional.

### 10.1 Campo `prohibited_use`

Todas as entidades com conteúdo jurídico (`legal_source_snapshot`, `legal_source_metadata`, `legal_quarantine_record`) incluem `operational_memory` no array `prohibited_use`. Verificação:

| Entidade | `operational_memory` em prohibited_use | Status |
|---|---|---|
| `legal_source_snapshot` | PASS — presente em exemplos e declaração | PASS |
| `legal_source_metadata` | PASS — presente explicitamente | PASS |
| `legal_quarantine_record` | PASS — "TRUST-0 e TRUST-1 têm todos os usos proibidos" | PASS |
| `legal_validation_record` | N/A — entidade de controle, não conteúdo | N/A |
| `legal_conflict_record` | N/A — entidade de controle | N/A |

### 10.2 Caminhos de Memória via Cross-Agent (8.4E)

REGRA-06 formaliza que conteúdo de qualquer outro agente inicia em TRUST-1 e cria `legal_quarantine_record`. Isso fecha o vetor de contaminação de memória via:
- `rag-agent` → TRUST-1 por REGRA-06
- `norm-agent` → TRUST-1 por REGRA-06
- `learn-agent` → TRUST-1 por REGRA-06

O campo `contamination_vector: memory_external` em `legal_quarantine_record.quarantine_reason` captura especificamente o vetor de memória.

**Resultado §10:** Nenhum caminho de contaminação de memória detectado. 0 riscos identificados.

---

## §11. QA de Carryover de Risco de Conectores (Herança 8.4C)

### 11.1 CONN-001 — `unknown_requires_manual_review` / risco `high`

| Verificação | Campo / Regra | Status |
|---|---|---|
| Status herdado registrado | `connector_status: blocked` em enum §12.9 | PASS |
| Risco herdado registrado | `terms_review_status_at_request: unknown_requires_manual_review` | PASS |
| Trust cap em TRUST-1 | REGRA-07 explícita | PASS |
| Campo de rastreabilidade no log | `terms_review_status_at_request` em `legal_connector_log` | PASS |
| Campo no snapshot | `connector_status_at_collection`, `access_risk_at_collection` | PASS |

### 11.2 CONN-002 — `restricted_review_required` / risco `medium`

| Verificação | Campo / Regra | Status |
|---|---|---|
| Status herdado registrado | `connector_status: review_required` em enum §12.9 | PASS |
| Risco herdado registrado | `terms_review_status_at_request: restricted_review_required` | PASS |
| Trust cap em TRUST-1 | REGRA-07 explícita | PASS |
| `python-requests` bloqueado | Nota em `user_agent_id` do connector_log | PASS |

### 11.3 Contorno via Agente Intermediário

REGRA-07 inclui cláusula explícita: "Nenhum contorno via agente intermediário." O schema não contém campo que permita bypass do status de conector via roteamento por outro agente.

### 11.4 Verificação `access_risk_at_collection` no Connector Log (REVIEW-04)

O campo `access_risk_at_collection` (risco como nível enum low/medium/high/unknown) está presente em `legal_source_snapshot` mas **ausente** em `legal_connector_log`. O log registra `terms_review_status_at_request` (o status nominal) mas não o nível de risco consolidado. Para rastreabilidade completa por operação de conector, este campo seria necessário também no log.

**Resultado §11:** Carryover de CONN-001 e CONN-002 está corretamente refletido no schema. REVIEW-04 é recomendação não-bloqueadora para 8.6.

---

## §12. Verificação de Autoridade Operacional

Verificação de que o schema design não introduz, implica ou permite ativação operacional do agente.

### 12.1 Invariantes de Status

| Invariante | Valor Esperado | Valor no Design §16 | Status |
|---|---|---|---|
| `agent_activation` | unchanged / active:false | "unchanged — active:false" | PASS |
| `operational_authority` | none | "unchanged — none" | PASS |
| `database_created` | false | false | PASS |
| `migrations_created` | false | false | PASS |
| `connectors_implemented` | 0 | 0 | PASS |
| `connectors_active` | 0 | 0 | PASS |
| `legal_content_fetched` | 0 | 0 | PASS |
| `RAG_updates` | 0 | 0 | PASS |
| `embeddings_created` | 0 | 0 | PASS |

### 12.2 Guard `active_operational` no Enum connector_status (REVIEW-08)

O enum `connector_status` inclui o valor `active_operational`. O schema não documenta explicitamente que atingir este estado requer aprovação de fw-governor e declaração de modo primário pelo operador. As notas gerais do design cobrem isso implicitamente, mas falta uma regra formal no schema da entidade que liste os requisitos de transição de estado.

**Resultado §12:** Todos os invariantes de autoridade operacional estão corretos. REVIEW-08 é recomendação de documentação para 8.6 — sem risco imediato dado que `active:false` e `operational_authority:none` são declarados explicitamente no resultado §16 do design.

---

## §13. QA de Exemplos Fictícios

### 13.1 Verificação de Conteúdo Real

| Exemplo | Entidade | Lei/Norma Usada | Órgão Usado | URL Usada | Status |
|---|---|---|---|---|---|
| A (TRUST-0) | legal_source_snapshot + quarantine | N/A — sem fonte | N/A | null | PASS |
| B (TRUST-1) | legal_source_snapshot + quarantine | N/A — "Portal Jurídico Fictício" | SRC-012 (classificação, não nome real) | portaljuridico.exemplo | PASS |
| C (TRUST-2) | legal_source_metadata | "Lei Fictícia nº 000, de 2099" | "Órgão Fictício Nacional" | N/A (metadata_only) | PASS |
| D (TRUST-3) | legal_source_snapshot | N/A — conector hipotético | Planalto (fonte hipotética aprovada) | fonte-oficial.exemplo/... | PASS |
| E (TRUST-4) | legal_source_snapshot + validation_record | N/A | N/A | N/A | PASS |

**Verificação adicional:**
- Anos usados: 2099 (todos fictícios, > 2080 conforme regra do design)
- Nomes: "Lei Fictícia nº 000", "Órgão Fictício Nacional", "CONN-HYPOTHETICAL"
- URLs: domínios `.exemplo` — inacessíveis por design
- Números de processo: nenhum presente em nenhum exemplo
- Jurisprudência real: nenhuma citada

**Resultado §13:** 5/5 exemplos sem conteúdo jurídico real. PASS completo.

### 13.2 Coerência Interna dos Exemplos

| Exemplo | trust_class Declarada | Campos Críticos Presentes | Entidades Auxiliares Criadas | Coerência |
|---|---|---|---|---|
| A | TRUST-0 | source_url:null, fetched_at:null, chain_of_custody_id:null — forçando TRUST-0 | quarantine_record ✓ | PASS |
| B | TRUST-1 | raw_content_hash:null, chain_of_custody_id:null | quarantine_record ✓ | PASS |
| C | TRUST-2 (via metadata) | authority_level:1, metadata_source_type:official_metadata | metadata_only ✓ | PASS |
| D | TRUST-3 | raw_content_hash ✓, fetched_at ✓, chain_of_custody_id ✓ | Nenhum required (staging) | PASS |
| E | TRUST-4 | TRUST-3 → TRUST-4 promotion | validation_record ✓ | PASS |

---

## §14. Tabela Resumo de Findings

| ID | Categoria | Entidade Afetada | Tipo | Severidade | Recomendação |
|---|---|---|---|---|---|
| REVIEW-01 | Campo crítico ausente | `legal_source_metadata` | Gap de proveniência | Baixa | Adicionar `fetched_at` em 8.6 |
| REVIEW-02 | Campo crítico ausente | `legal_source_metadata` | Gap de proveniência | Baixa | Adicionar `official_source: boolean` em 8.6 |
| REVIEW-03 | Campo de referência ausente | `legal_quarantine_record` | Completude de auditoria | Baixa | Adicionar `chain_of_custody_id` em 8.6 |
| REVIEW-04 | Campo de risco ausente | `legal_connector_log` | Completude de audit trail | Baixa | Adicionar `access_risk_at_collection` em 8.6 |
| REVIEW-05 | Enum incompleto | `legal_source_metadata.validation_status` | Inconsistência com master | Média | Alinhar ao enum master §12.4 em 8.6 |
| REVIEW-06 | Precisão de redação | `legal_source_snapshot.special_rules` | Divergência vs. REGRA-05 | Mínima | Especificar índices bloqueados em special_rules em 8.6 |
| REVIEW-07 | Caminho de promoção | TRUST-2 → TRUST-3 | Falta de formalização | Baixa | Adicionar REGRA-11 em 8.6 |
| REVIEW-08 | Guard de estado | `connector_status: active_operational` | Documentação | Mínima | Adicionar requisitos de transição explícitos em 8.6 |

**FAIL items:** 0

**Média de severidade:** Baixa (nenhum item médio ou alto bloqueia progressão)

---

## §15. Findings Detalhados

---

### REVIEW-01 — `legal_source_metadata` ausente: `fetched_at`

**Entidade:** `legal_source_metadata`
**Categoria:** Campo crítico de proveniência (8.4D)

**Descrição:** O campo `fetched_at` (quando este registro de metadados foi coletado) está ausente em `legal_source_metadata`. A entidade tem `publication_date` (data de publicação da norma), `effective_date` (data de vigência), `created_at` e `updated_at` (timestamps do registro), mas não registra explicitamente *quando o sistema coletou estes metadados* da fonte.

`fetched_at` é um dos 7 campos críticos de proveniência definidos em `LEGAL_KNOWLEDGE_FIREWALL_8_4D.md`. Sua ausência em `legal_source_metadata` cria inconsistência: `legal_source_snapshot` tem `fetched_at` obrigatório, mas `legal_source_metadata` (que pode existir independentemente, como `metadata_only`) não registra seu próprio timestamp de coleta.

**Impacto:** Para instâncias `metadata_source_type: metadata_only`, é impossível determinar a idade do metadado sem depender de `created_at` (que é o timestamp de criação do registro no sistema, não de quando a fonte foi consultada).

**Recomendação para 8.6:**
```yaml
fetched_at:
  type: ISO8601_datetime
  required: true
  description: "Quando este registro de metadados foi coletado da fonte (UTC)."
  behavior_if_absent: "Registrar como null. stale_risk aumenta se ausente."
```

---

### REVIEW-02 — `legal_source_metadata` ausente: `official_source`

**Entidade:** `legal_source_metadata`
**Categoria:** Campo crítico de proveniência (8.4D)

**Descrição:** O campo `official_source: boolean` está ausente em `legal_source_metadata`. A entidade tem `authority_level` (int 1–7) e `metadata_source_type` (enum incluindo `official_metadata`), mas não um campo booleano explícito que declare diretamente se a fonte dos metadados é oficial.

Em `legal_source_snapshot`, `official_source` é obrigatório e um dos 7 campos críticos. A ausência em `legal_source_metadata` cria uma dependência de derivação: para saber se um metadado é oficial, é necessário checar `authority_level ≤ 5` ou `metadata_source_type IN [primary_text, official_metadata]`.

**Impacto:** Verificações diretas de oficialidade em consultas ao schema requerem lógica extra em vez de campo booleano simples.

**Recomendação para 8.6:**
```yaml
official_source:
  type: boolean
  required: true
  description: "Indica se a fonte dos metadados é oficial (true) ou auxiliar (false)."
  derivation: "authority_level <= 5 AND metadata_source_type NOT IN [aggregator_metadata]"
```

---

### REVIEW-03 — `legal_quarantine_record` ausente: `chain_of_custody_id`

**Entidade:** `legal_quarantine_record`
**Categoria:** Completude de audit trail

**Descrição:** O registro de quarentena contém `snapshot_id` (referência ao snapshot, que por sua vez tem `chain_of_custody_id`), mas não registra diretamente `chain_of_custody_id`. Para uma auditoria forense do registro de quarentena de forma isolada, é necessário JOIN com `legal_source_snapshot`.

**Impacto:** O `legal_quarantine_record` não é auto-suficiente como documento de auditoria. Em casos de TRUST-0 onde o snapshot pode ter `chain_of_custody_id: null`, o quarantine record deveria registrar explicitamente que a cadeia de custódia está ausente.

**Recomendação para 8.6:**
```yaml
chain_of_custody_id:
  type: UUID_reference
  required: false
  description: "Referência à cadeia de custódia, se disponível. Null para TRUST-0 sem rastreabilidade."
  note: "Ausência documenta que cadeia de custódia não foi estabelecida — não omissão."
```

---

### REVIEW-04 — `legal_connector_log` ausente: `access_risk_at_collection`

**Entidade:** `legal_connector_log`
**Categoria:** Completude de audit trail por operação

**Descrição:** O log de conector registra `terms_review_status_at_request` (status nominal: `unknown_requires_manual_review`, `restricted_review_required`, `approved_for_use`, etc.) mas não registra o nível de risco consolidado como enum `[low, medium, high, unknown]`. Este campo existe em `legal_source_snapshot` (`access_risk_at_collection`) mas está ausente no log que origina a operação.

Para CONN-001 (risco `high`) e CONN-002 (risco `medium`), o nível de risco herdado de 8.4C é registrado no snapshot mas não na linha de log da operação que o gerou.

**Impacto:** Auditoria por operação de conector (sem join com snapshot) perde visibilidade do risco no momento da coleta.

**Recomendação para 8.6:**
```yaml
access_risk_at_collection:
  type: enum
  required: true
  description: "Nível de risco consolidado do conector no momento da operação."
  enum: [low, medium, high, critical, unknown]
  note: "CONN-001: high (herdado 8.4C). CONN-002: medium (herdado 8.4C). Demais: conforme revisão."
```

---

### REVIEW-05 — Enum `validation_status` incompleto em `legal_source_metadata`

**Entidade:** `legal_source_metadata`
**Categoria:** Inconsistência de enumeração vs. catálogo master

**Descrição:**
- Enum inline em `legal_source_metadata.validation_status`: 7 valores
  - [not_started, pending, passed_technical_only, validated_snapshot, human_reviewed, rejected, deprecated]
- Catálogo master §12.4: 12 valores
- 4 valores ausentes no inline: `fetched_unvalidated`, `parsed_unvalidated`, `human_review_required`, `conflict_detected`

Os 4 valores ausentes têm semântica relevante para metadados:
- `fetched_unvalidated`: estado natural após coleta de metadado, antes de processamento
- `parsed_unvalidated`: metadado parseado mas sem validação técnica
- `human_review_required`: validação técnica OK mas humano necessário
- `conflict_detected`: metadado em conflito com outra fonte — estado crítico

A ausência de `conflict_detected` é particularmente relevante: `legal_source_metadata` tem campo `conflict_status` (com `conflict_detected` como valor), mas o `validation_status` inline não reflete este estado.

**Impacto:** Implementação usando o inline enum pode não capturar todos os estados possíveis de validação, criando divergência entre entidade e catálogo master.

**Recomendação para 8.6:** Remover o inline enum de `legal_source_metadata.validation_status` e referenciar o catálogo master §12.4 diretamente, ou documentar explicitamente quais valores são excluídos e por quê.

---

### REVIEW-06 — Divergência de redação: `stale_risk:critical` em `special_rules` vs. REGRA-05

**Entidades:** `legal_source_snapshot.special_rules` vs. REGRA-05 em §13
**Categoria:** Precisão de documentação

**Descrição:**
- REGRA-05 (§13): "Todo conteúdo com `stale_risk: critical` não pode entrar em `legal_rag_validated_official_index` (IDX-004) nem em `legal_rag_human_reviewed_index` (IDX-005). Pode entrar em IDX-003 (staging) com aviso obrigatório."
- `legal_source_snapshot.special_rules`: "stale_risk:critical bloqueia uso como corpus validado."

A redação de `special_rules` não especifica quais índices são bloqueados, nem que IDX-003 é permitido com aviso. A REGRA formal é mais precisa.

**Impacto:** Mínimo — a REGRA-05 é a referência formal. O `special_rules` é nota de rápida referência. Mas inconsistência de nível de detalhe pode criar ambiguidade para implementadores.

**Recomendação para 8.6:** Alinhar o texto de `special_rules` à precisão de REGRA-05:
```
"stale_risk:critical bloqueia entrada em IDX-004 e IDX-005. Staging em IDX-003 permitido com aviso obrigatório."
```

---

### REVIEW-07 — Caminho de promoção TRUST-2 → TRUST-3 não formalizado

**Categoria:** Governança de promoção de trust class

**Descrição:** O schema design formaliza os seguintes caminhos de promoção:
- TRUST-0: sem promoção possível (definitivo)
- TRUST-1 → TRUST-2+: via `legal_quarantine_record.promotion_requirements`
- TRUST-3 → TRUST-4: via REGRA-03 + REGRA-09 + `legal_validation_record`
- TRUST-4 → TRUST-5: via REGRA-10 + revisão humana

O caminho TRUST-2 (metadata_only) → TRUST-3 (snapshot integral obtido) não tem regra formal. Este é o passo em que um metadado localizador gera uma solicitação real de coleta do texto integral. O trigger, os requisitos e o registro deste processo não estão capturados em nenhuma entidade ou regra do design atual.

**Impacto:** Implementação futura terá que inferir este caminho sem instrução formal. Risco de inconsistência entre implementações.

**Recomendação para 8.6:** Adicionar REGRA-11:
```
REGRA-11 — Promoção TRUST-2 → TRUST-3:
Um legal_source_metadata com trust_class:TRUST-2 pode originar uma solicitação de coleta de snapshot.
A promoção ocorre quando:
1. Conector aprovado para a fonte está em status ≥ candidate_connector
2. Operador primário autoriza a coleta
3. Coleta gera legal_source_snapshot com raw_content_hash preenchido
4. legal_connector_log registra a operação com success:true
5. legal_source_metadata.snapshot_id é atualizado para o novo snapshot
```

---

### REVIEW-08 — `active_operational` sem guard explícito de transição

**Categoria:** Documentação de governança de conector

**Descrição:** O enum `connector_status` inclui `active_operational` como valor possível. Nenhuma entidade ou regra no schema documenta formalmente os requisitos para que um conector atinja este estado. O design assume que esta restrição é coberta pelos princípios gerais do CORE-OS (fw-governor, modo primário), mas o schema em si não é auto-documentante neste ponto.

**Estado atual:** Todos os conectores conhecidos (CONN-001 a CONN-013) estão em `planned_only`, `blocked` ou `review_required` — nenhum próximo de `active_operational`. Risco imediato: zero.

**Impacto:** Mínimo no estado atual. Relevante para documentação de implementação futura.

**Recomendação para 8.6:** Adicionar nota de implementação em §15 do schema:
```
Nenhum conector pode atingir connector_status:active_operational sem:
1. Revisão de governance completa de terms e robots.txt
2. Aprovação explícita do operador primário
3. fw-governor informado
4. operational_authority do agente atualizada
```

---

## §16. Resultado

| Campo | Valor |
|---|---|
| iteration_status | completed |
| qa_review_type | schema_design_documentation_review |
| document_reviewed | LEGAL_SNAPSHOT_SCHEMA_DESIGN_8_5.md |
| fail_items | 0 |
| review_items_non_blocking | 8 |
| review_items_medium_severity | 1 (REVIEW-05) |
| review_items_low_severity | 5 (REVIEW-01/02/03/04/07) |
| review_items_minimal_severity | 2 (REVIEW-06/08) |
| schema_design_result | ready_for_local_schema_file_drafts |
| recommended_next_iteration | 8.6 — Local Schema File Drafts |
| 8.6_prerequisites | Endereçar REVIEW-01 a REVIEW-08 nos arquivos de schema locais |
| database_created | false |
| migrations_created | false |
| connectors_active | 0 |
| legal_content_fetched | 0 |
| agent_activation | unchanged — active:false |
| operational_authority | unchanged — none |
| RAG_updates | 0 |
| embeddings_created | 0 |

**Julgamento da QA:**

O design de schema da Iteração 8.5 é estruturalmente correto e internamente consistente para os objetivos de design puro. Todas as 10 regras cross-entity são válidas. Todos os 5 índices RAG têm firewalls corretos. Os 7 campos críticos de proveniência estão presentes e obrigatórios na entidade primária (`legal_source_snapshot`). Os exemplos fictícios não contêm conteúdo jurídico real. Nenhum invariante de autoridade operacional foi violado.

Os 8 itens de REVIEW são recomendações de melhoria para a próxima iteração (8.6 — Local Schema File Drafts), não bloqueadores desta fase. O design pode progredir para 8.6 após revisão e aprovação do operador primário.

**Schema design aprovado para progressão à Iteração 8.6.**

---

*Documento criado em 2026-06-10 como parte da Iteração 8.5A.*
*Nenhum banco criado. Nenhuma migration criada. Nenhum dado jurídico acessado.*
*Nenhum conteúdo ingerido. Nenhum RAG alimentado. Nenhum embedding gerado.*
*active:false / operational_authority:none / connectors_active:0 — inalterados.*
*QA DOCUMENTAL ≠ AUTORIZAÇÃO DE IMPLEMENTAÇÃO. SCHEMA APROVADO ≠ BANCO AUTORIZADO.*
