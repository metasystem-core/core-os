---
document_id: LEGAL_SNAPSHOT_SCHEMA_DESIGN_8_5
agent: legal-agent
iteration: "8.5"
event: "EVT-20260610-052"
date: "2026-06-10"
scope: schema_design_only
based_on:
  - LEGAL_KNOWLEDGE_FIREWALL_8_4D.md
  - LEGAL_CROSS_AGENT_CONTAMINATION_QA_8_4E.md
  - LEGAL_CONNECTOR_TERMS_ROBOTS_REVIEW_8_4C.md
  - LEGAL_CONNECTOR_PREFLIGHT_8_4B.md
  - LEGAL_SOURCE_AUTHORITY_MATRIX.md
  - LEGAL_UPDATE_POLICY.md
  - LEGAL_CONFLICT_RESOLUTION_PROTOCOL.md
  - LEGAL_SEED_CORPUS_MANIFEST.yaml
design_mode: schema_design_only
database_created: false
migrations_created: false
legal_content_fetched: 0
legal_documents_ingested: 0
APIs_consulted_for_legal_data: 0
RAG_updates: 0
embeddings_created: 0
connectors_implemented: 0
connectors_active: 0
active: false
operational_authority: none
---

# LEGAL SNAPSHOT SCHEMA DESIGN — Iteração 8.5

> **STATUS: DESIGN FORMAL — NENHUM BANCO, NENHUMA MIGRATION, NENHUMA INGESTÃO.**
> Este documento desenha os schemas internos futuros para snapshots jurídicos, metadados e logs de conectores.
> Nenhuma entidade foi criada como tabela. Nenhum dado jurídico foi acessado. Nenhum conteúdo ingerido.
> SCHEMA DESENHADO ≠ BANCO IMPLEMENTADO. CAMPO DEFINIDO ≠ SNAPSHOT CRIADO.
> AGENTE INATIVO ≠ AGENTE OPERACIONAL. DESIGN ≠ AUTORIZAÇÃO.

---

## §1. Purpose

Este documento desenha formalmente os schemas internos futuros que permitirão ao `legal-agent` armazenar, rastrear, classificar e auditar snapshots jurídicos de maneira rastreável, controlada e auditável — quando, e apenas quando, as iterações de implementação forem autorizadas pelo operador primário.

**O que este documento faz:**
- Define entidades conceituais, campos, tipos, enums, regras de validação e relações.
- Incorpora integralmente o Legal Knowledge Firewall (8.4D) como controle de cada campo.
- Incorpora os achados da QA 8.4E como garantia de que o design é coerente com o firewall.
- Herda o risco dos conectores CONN-001 e CONN-002 da 8.4C como constraint explícito.
- Cria exemplos fictícios para ilustrar o comportamento esperado — sem conteúdo jurídico real.

**O que este documento NÃO faz:**
- Não cria tabela, banco, banco vetorial, migration ou schema de banco real.
- Não ativa conector, não fetcha URL, não ingere documento.
- Não alimenta RAG, não gera embedding.
- Não altera o status operacional do agente.
- Não confere vigência, validade jurídica ou autoridade normativa a nenhum conteúdo.

**Invariantes absolutos deste documento:**
```
SNAPSHOT SCHEMA DESIGN ≠ DATABASE IMPLEMENTATION
SCHEMA DESIGN ≠ CONNECTOR ACTIVE
SNAPSHOT FIELD ≠ SNAPSHOT CREATED
RAW SNAPSHOT PATH ≠ LEGAL CONTENT FETCHED
METADATA MODEL ≠ LEGAL VALIDITY
CHECKSUM FIELD ≠ VALIDATED DOCUMENT
TRUST CLASS FIELD ≠ TRUSTED CORPUS
VALIDATION STATUS FIELD ≠ HUMAN VALIDATION
STALE RISK FIELD ≠ VIGÊNCIA CONFIRMADA
LEGAL SOURCE SNAPSHOT ≠ LEGAL ADVICE
LEGAL METADATA ≠ STRATEGY
CONNECTOR LOG ≠ CONNECTOR EXECUTION
RAG INDEX DESIGN ≠ RAG UPDATE
AGENTE INATIVO ≠ AGENTE OPERACIONAL
```

---

## §2. Post-8.4E Preconditions

Esta iteração é habilitada pelo conjunto de resultados das iterações anteriores.

| Iteração | Resultado | Relevância para 8.5 |
|---|---|---|
| 8.2B | Source Authority Matrix, Seed Corpus Manifest, Update Policy, Conflict Protocol, Source Connectors Spec | Hierarquia de fontes, campos de metadados, política de atualização e stale_risk derivados dessas fontes |
| 8.4B | Connector Preflight — CONN-001 e CONN-002 design_only | Estrutura dos conectores informou campos connector_id, connector_status_at_collection, operation_type |
| 8.4C | Terms & robots review — CONN-001 high/manual, CONN-002 medium/restricted | Carryover de risco formal como constraint nos schemas: conteúdo desses conectores permanece TRUST-1 máximo |
| 8.4D | Legal Knowledge Firewall — 6 trust classes, 25 provenance fields, 5 RAG indexes, 17 threat vectors | Base direta dos schemas: campos de provenance_record, trust_class, quarantine_status, chain_of_custody derivados daqui |
| 8.4E | Cross-agent contamination QA — 12/12 PASS | Confirmou que as regras do firewall são coerentes; habilitou `firewall_maturity: ready_for_snapshot_schema_design` |

**Estado operacional no momento do design:**

| Campo | Valor | Obrigação de preservação |
|---|---|---|
| status | draft | Inalterável por este documento |
| active | false | Inalterável por este documento |
| operational_authority | none | Inalterável por este documento |
| legal_documents_ingested | 0 | Preservado |
| connectors_active | 0 | Preservado |
| connectors_implemented | 0 | Preservado |
| legal_content_fetched | 0 | Preservado |
| RAG_updates | 0 | Preservado |
| embeddings_created | 0 | Preservado |
| APIs_consulted_for_legal_data | 0 | Preservado |

---

## §3. Design Scope

| Campo | Valor |
|---|---|
| design_mode | schema_design_only |
| implementation_status | not_implemented |
| database_status | not_created |
| migration_status | not_created |
| connector_status | unchanged — connectors_active:0, connectors_implemented:0 |
| RAG_status | unchanged — RAG_updates:0, embeddings_created:0 |
| embedding_status | unchanged |
| legal_content_ingested | 0 |
| legal_content_fetched | 0 |
| APIs_consulted | 0 |

**Connector risk carryover ativo durante este design:**

| Conector | Status herdado | Efeito no schema |
|---|---|---|
| CONN-001 Planalto | `unknown_requires_manual_review` / high | `connector_status_at_collection` = blocked; TRUST máximo = TRUST-1 para qualquer conteúdo Planalto enquanto status não mudar |
| CONN-002 LexML | `restricted_review_required` / medium | `connector_status_at_collection` = restricted; TRUST máximo = TRUST-1 para qualquer conteúdo LexML enquanto status não mudar |

---

## §4. Core Entities Overview

Visão geral das 7 entidades futuras desenhadas neste documento. Nenhuma é tabela real nesta iteração.

---

### Entidade 1 — `legal_source_snapshot`

**Função:** Armazena o raw snapshot e a cadeia de coleta de um documento jurídico oficial.
É a entidade mais crítica — guarda o conteúdo bruto tal como foi obtido, com todos os campos de rastreabilidade.

**Chave natural:** `snapshot_id` (único por coleta)
**Relações:** `legal_source_metadata` (1:1 via `snapshot_id`) · `legal_validation_record` (1:N) · `legal_quarantine_record` (1:1 quando TRUST-0/TRUST-1)

---

### Entidade 2 — `legal_source_metadata`

**Função:** Armazena metadados extraídos ou associados a um snapshot — tipo de norma, numeração, órgão emissor, datas de vigência, status de revogação.
Pode existir sem snapshot completo (metadado-only).

**Chave natural:** `metadata_id`
**Relações:** `legal_source_snapshot` (N:1 via `snapshot_id` opcional)

---

### Entidade 3 — `legal_connector_log`

**Função:** Guarda logs de operação futura dos conectores — cada tentativa de fetch, seu resultado, status e rastreabilidade.
Não confere validade jurídica. Toda operação de conector — bem-sucedida ou não — deve ter entrada aqui.

**Chave natural:** `log_id`
**Relações:** `legal_source_snapshot` (0:1 via `snapshot_id` quando snapshot for criado)

---

### Entidade 4 — `legal_quarantine_record`

**Função:** Guarda conteúdo rejeitado ou quarentenado (TRUST-0 e TRUST-1) sem contaminar o corpus jurídico validado.
O registro existe para auditoria e rastreabilidade — não para uso jurídico.

**Chave natural:** `quarantine_id`
**Relações:** `legal_source_snapshot` (0:1 se snapshot existe) · `legal_connector_log` (0:1 se via conector)

---

### Entidade 5 — `legal_validation_record`

**Função:** Guarda a trilha de validação técnica e/ou humana de cada snapshot.
Cada passo de promoção de trust class deve ter uma entrada aqui.

**Chave natural:** `validation_id`
**Relações:** `legal_source_snapshot` (N:1 via `snapshot_id`)

---

### Entidade 6 — `legal_conflict_record`

**Função:** Guarda divergências detectadas entre fontes, versões ou interpretações de um mesmo conteúdo.
Conflito ativo bloqueia conclusão jurídica até resolução documentada.

**Chave natural:** `conflict_id`
**Relações:** `legal_source_snapshot` (N:2 via `primary_snapshot_id` e `secondary_snapshot_id`)

---

### Entidade 7 — `legal_rag_index_manifest`

**Função:** Design futuro dos 5 índices RAG separados obrigatórios — controla quais trust classes, tipos de documento e políticas de contaminação se aplicam a cada índice.
Nenhum índice existe ainda. Este é apenas o schema de controle futuro.

**Chave natural:** `index_id`
**Relações:** conceitual apenas — aponta para trust classes e políticas

---

## §5. Entity: `legal_source_snapshot`

```yaml
entity: legal_source_snapshot
design_mode: schema_design_only
table_created: false
purpose: >
  Armazena raw snapshot de documento jurídico oficial com cadeia completa de rastreabilidade.
  Não pode existir sem campos críticos preenchidos.

fields:

  snapshot_id:
    type: UUID
    required: true
    description: "Identificador único gerado no momento da coleta. Imutável após criação."
    validation: "Formato UUID v4. Não pode ser null."
    behavior_if_absent: "Registro não pode ser criado sem snapshot_id."

  content_id:
    type: string
    required: true
    description: "ID lógico do conteúdo (ex.: hash do source_url + fetched_at). Permite deduplicação."
    validation: "Não vazio. Único por fonte + versão."
    behavior_if_absent: "Snapshot não pode ser associado a provenance_record sem content_id."

  connector_id:
    type: string
    required: false
    description: "ID do conector que realizou a coleta (ex.: CONN-001, CONN-002). Null se coleta manual."
    enum: [CONN-001, CONN-002, MANUAL, null]
    validation: "Se não null, deve corresponder a um conector registrado."
    behavior_if_absent: "Assume coleta manual. Registrar como 'MANUAL'."

  source_id:
    type: string
    required: true
    description: "Identificador da fonte conforme LEGAL_SOURCE_AUTHORITY_MATRIX.md (SRC-001 a SRC-013)."
    enum: [SRC-001, SRC-002, SRC-003, SRC-004, SRC-005, SRC-006, SRC-007, SRC-008, SRC-009, SRC-010, SRC-011, SRC-012, SRC-013, UNKNOWN]
    validation: "Deve ser identificado antes de classificação de trust class."
    behavior_if_absent: "trust_class forçada para TRUST-1 máximo."

  source_name:
    type: string
    required: true
    description: "Nome legível da fonte (ex.: 'Planalto / Portal da Legislação')."
    validation: "Não vazio."
    behavior_if_absent: "Registrar como 'desconhecida'."

  source_url:
    type: URL
    required: true
    critical: true
    description: "URL exata de onde o conteúdo foi obtido no momento da coleta."
    validation: "Formato URL válido (https://). Não pode ser genérica — deve ser URL de conteúdo específico."
    behavior_if_absent: "CAMPO CRÍTICO — ausência força trust_class para TRUST-0 ou TRUST-1."

  source_host:
    type: string
    required: true
    description: "Host extraído da source_url (ex.: www.planalto.gov.br, lexml.gov.br)."
    validation: "Extraído automaticamente de source_url."
    behavior_if_absent: "Derivar de source_url. Se source_url ausente, deixar null."

  source_type:
    type: enum
    required: true
    description: "Tipo de fonte conforme hierarquia de autoridade."
    enum: [normativa_primaria, legislativa, jurisprudencial_vinculante, processual_metadados, publicacao_oficial, regional, auxiliar, desconhecida]
    validation: "Deve ser compatível com source_id."
    behavior_if_absent: "Registrar como 'desconhecida'. trust_class limitada a TRUST-1."

  authority_level:
    type: integer
    required: true
    critical: true
    description: "Nível de autoridade (1 a 7) conforme LEGAL_SOURCE_AUTHORITY_MATRIX.md."
    enum: [1, 2, 3, 4, 5, 6, 7]
    validation: "1 = normativa primária (maior). 7 = auxiliar (menor)."
    behavior_if_absent: "CAMPO CRÍTICO — ausência força trust_class para TRUST-1 máximo."

  official_source:
    type: boolean_extended
    required: true
    critical: true
    description: "Indica se a fonte é oficial (true/false/unknown)."
    enum: [true, false, unknown]
    validation: "unknown força trust_class para TRUST-1 máximo. false força TRUST-1 máximo."
    behavior_if_absent: "CAMPO CRÍTICO — registrar como 'unknown'. trust_class máximo: TRUST-1."

  trust_class:
    type: enum
    required: true
    description: "Classificação de confiança do snapshot conforme §4 do Knowledge Firewall."
    enum: [TRUST-0, TRUST-1, TRUST-2, TRUST-3, TRUST-4, TRUST-5]
    validation: >
      TRUST-4 exige validation_status:validated_snapshot.
      TRUST-5 exige validation_type:human_review em legal_validation_record.
      official_source:false ou unknown → máximo TRUST-1.
      Sem source_url → máximo TRUST-1.
      Sem checksum → máximo TRUST-1.
    behavior_if_absent: "Registrar como TRUST-1 por padrão seguro."

  quarantine_status:
    type: enum
    required: true
    description: "Status de quarentena derivado do trust_class e do estado de validação."
    enum: [rejected_unusable, quarantined_unverified, metadata_only, staging_only, validated_snapshot, human_reviewed, not_applicable]
    validation: "TRUST-0 → rejected_unusable. TRUST-1 → quarantined_unverified. TRUST-2 → metadata_only. TRUST-3 → staging_only. TRUST-4 → validated_snapshot. TRUST-5 → human_reviewed."
    behavior_if_absent: "Registrar como quarantined_unverified."

  connector_status_at_collection:
    type: enum
    required: false
    description: "Status do conector no momento da coleta — herdado do estado na iteração 8.4C."
    enum: [planned_only, review_required, candidate_connector, dry_run_allowed, active_non_operational, active_operational, blocked, deprecated, not_applicable]
    validation: >
      CONN-001: deve ser 'blocked' enquanto status 8.4C não for alterado.
      CONN-002: deve ser 'review_required' enquanto status 8.4C não for alterado.
    behavior_if_absent: "Registrar como 'not_applicable' se coleta manual."

  access_risk_at_collection:
    type: enum
    required: true
    description: "Nível de risco de acesso no momento da coleta."
    enum: [low, medium, high, critical, unknown]
    validation: >
      CONN-001 herda 'high' da 8.4C.
      CONN-002 herda 'medium' da 8.4C.
      Coleta manual via navegador autorizado: low ou medium.
    behavior_if_absent: "Registrar como 'unknown'."

  terms_robots_review_status:
    type: enum
    required: true
    description: "Status da revisão de governança do conector/fonte usado para esta coleta."
    enum: [not_reviewed, review_pending, unknown_requires_manual_review, restricted_review_required, approved_for_use, blocked, not_applicable]
    validation: >
      CONN-001: 'unknown_requires_manual_review' (herdado de 8.4C).
      CONN-002: 'restricted_review_required' (herdado de 8.4C).
      Coleta manual: 'not_applicable'.
    behavior_if_absent: "Registrar como 'not_reviewed'. trust_class limitada a TRUST-1."

  fetched_at:
    type: ISO8601_datetime
    required: true
    critical: true
    description: "Timestamp preciso de quando o conteúdo foi coletado (UTC)."
    validation: "Formato: YYYY-MM-DDTHH:MM:SSZ. Não pode ser data futura."
    behavior_if_absent: "CAMPO CRÍTICO — ausência força trust_class para TRUST-1 máximo."

  published_at:
    type: ISO8601_date
    required: false
    description: "Data de publicação oficial do documento, se disponível na fonte."
    validation: "Formato: YYYY-MM-DD. Registrar null se não disponível."
    behavior_if_absent: "Registrar como null. stale_risk aumenta se ausente."

  effective_date_if_available:
    type: ISO8601_date
    required: false
    description: "Data de entrada em vigor do documento, se declarada na fonte."
    validation: "Formato: YYYY-MM-DD. Registrar null se não disponível."
    behavior_if_absent: "Registrar como null."

  raw_snapshot_path:
    type: string_path
    required: true
    description: "Caminho para o arquivo de snapshot bruto armazenado localmente."
    validation: >
      Não pode apontar para conteúdo inexistente.
      Deve ser verificado no momento do registro.
      Formato de exemplo: snapshots/legal/YYYYMMDD/<snapshot_id>.<ext>
    behavior_if_absent: "Snapshot não pode ser promovido além de TRUST-1 sem raw_snapshot_path válido."

  raw_content_hash:
    type: string_hex
    required: true
    critical: true
    description: "Hash SHA-256 do conteúdo bruto no momento da coleta."
    validation: "64 caracteres hexadecimais. Recalculado e comparado a cada acesso para detectar alteração."
    behavior_if_absent: "CAMPO CRÍTICO — ausência força trust_class para TRUST-1. Integridade não verificável."

  checksum_algorithm:
    type: enum
    required: true
    description: "Algoritmo usado para calcular o hash."
    enum: [SHA256, SHA512]
    default: SHA256
    behavior_if_absent: "Assumir SHA256 se raw_content_hash estiver presente."

  content_mime_type:
    type: string
    required: true
    description: "Tipo MIME do conteúdo bruto (ex.: text/html, application/xml, application/pdf)."
    enum: [text/html, application/xml, application/pdf, text/plain, application/json, other]
    behavior_if_absent: "Registrar como 'other'. parser_version pode não ser aplicável."

  content_encoding:
    type: string
    required: false
    description: "Encoding do conteúdo (ex.: UTF-8, ISO-8859-1)."
    behavior_if_absent: "Assumir UTF-8 se não declarado."

  content_length_bytes:
    type: integer
    required: false
    description: "Tamanho do conteúdo bruto em bytes."
    validation: "Positivo. Registrar 0 se não disponível."
    behavior_if_absent: "Registrar como null."

  extraction_method:
    type: enum
    required: true
    description: "Método usado para obter o conteúdo."
    enum: [html_parse, xml_sru, pdf_ocr, pdf_direct, manual_download, copy_paste, agent_transfer, api_rest, api_graphql, other, unknown]
    validation: >
      copy_paste → trust_class máximo TRUST-1 (sem rastreabilidade automática).
      agent_transfer → trust_class máximo TRUST-1 (sem cadeia de custódia verificada).
      pdf_ocr → stale_risk aumenta; erros de caractere possíveis.
    behavior_if_absent: "Registrar como 'unknown'."

  parser_version:
    type: string
    required: false
    description: "Versão do parser usado para extração estruturada (ex.: html_parser_v1.2)."
    validation: "Obrigatório se extraction_method in [html_parse, xml_sru, pdf_ocr, pdf_direct]."
    behavior_if_absent: "Registrar como null se extração não foi feita."

  parser_confidence:
    type: enum
    required: false
    description: "Confiança do parser na extração estruturada."
    enum: [high, medium, low, not_applicable]
    validation: "low → stale_risk aumenta; validation_status permanece pending."
    behavior_if_absent: "Registrar como 'not_applicable' se sem parser."

  validation_status:
    type: enum
    required: true
    critical: true
    description: "Estado atual de validação do snapshot."
    enum: [not_started, pending, failed, fetched_unvalidated, parsed_unvalidated, passed_technical_only, validated_snapshot, human_review_required, human_reviewed, rejected, deprecated, conflict_detected]
    validation: >
      trust_class TRUST-4 exige 'validated_snapshot' ou superior.
      trust_class TRUST-5 exige 'human_reviewed'.
      'conflict_detected' bloqueia promoção de trust_class.
      'deprecated' bloqueia qualquer uso como corpus.
    behavior_if_absent: "CAMPO CRÍTICO — ausência força trust_class para TRUST-1 máximo."

  stale_risk:
    type: enum
    required: true
    critical: true
    description: "Risco de desatualização do conteúdo conforme categoria normativa."
    enum: [low, medium, high, critical, unknown]
    validation: >
      Prazos processuais: critical por padrão.
      Portarias e decretos: high por padrão.
      Jurisprudência: high por padrão.
      Códigos e leis codificadas: medium por padrão.
      stale_risk:true bloqueia uso como corpus validado.
    behavior_if_absent: "CAMPO CRÍTICO — registrar como 'unknown'. Bloqueia corpus validado."

  conflict_status:
    type: enum
    required: true
    description: "Indica se conflito com outra fonte foi detectado para este conteúdo."
    enum: [none, conflict_detected, conflict_under_review, resolved, unknown]
    validation: >
      conflict_detected → cria legal_conflict_record obrigatório.
      conflict_detected → bloqueia conclusão jurídica.
      Deve ser 'none' para trust_class TRUST-4+.
    behavior_if_absent: "Registrar como 'unknown'."

  allowed_use:
    type: array_enum
    required: true
    description: "Lista de usos permitidos dado trust_class, validation_status e stale_risk."
    enum_values: [none, lead_only, metadata_locator, staging_analysis, educational_reference, controlled_internal_reference, future_human_reviewed_use]
    validation: "Derivado automaticamente de trust_class + validation_status + stale_risk."
    behavior_if_absent: "Registrar como [none]."

  prohibited_use:
    type: array_enum
    required: true
    description: "Lista de usos proibidos para este snapshot."
    enum_values: [legal_advice, procedural_deadline, protocolable_piece, legal_strategy, rights_confirmation, victory_probability, damages_calculation, RAG_validated_index, operational_memory]
    validation: "TRUST-0 e TRUST-1 têm todos os valores prohibited_use ativos."
    behavior_if_absent: "Registrar com todos os valores prohibited — postura mais restritiva."

  chain_of_custody_id:
    type: UUID_reference
    required: true
    critical: true
    description: "Referência ao registro de cadeia de custódia: agente/operador que coletou + timestamp + método."
    validation: "Deve ser preenchido no momento da coleta. Não pode ser null para TRUST-3+."
    behavior_if_absent: "CAMPO CRÍTICO — ausência completa força trust_class para TRUST-0."

  created_at:
    type: ISO8601_datetime
    required: true
    description: "Timestamp de criação do registro (UTC)."
    behavior_if_absent: "Registro inválido sem created_at."

  updated_at:
    type: ISO8601_datetime
    required: true
    description: "Timestamp da última atualização do registro (UTC)."
    behavior_if_absent: "Sincronizar com created_at na criação."

  notes:
    type: text
    required: false
    description: "Notas adicionais, anomalias detectadas, warnings, exceções."
    behavior_if_absent: "Deixar null."

special_rules:
  - "Sem source_url, authority_level, official_source, fetched_at, raw_content_hash, validation_status e chain_of_custody_id: snapshot não pode passar de TRUST-1."
  - "trust_class TRUST-4 exige validation_status: validated_snapshot."
  - "trust_class TRUST-5 exige legal_validation_record com validation_type: human_review."
  - "official_source:true não implica validated_snapshot."
  - "raw_snapshot_path não pode apontar para conteúdo inexistente."
  - "stale_risk:critical bloqueia uso como corpus validado."
  - "Conteúdo de CONN-001 ou CONN-002 permanece TRUST-1 máximo enquanto status 8.4C não for alterado."
```

---

## §6. Entity: `legal_source_metadata`

```yaml
entity: legal_source_metadata
design_mode: schema_design_only
table_created: false
purpose: >
  Armazena metadados extraídos ou associados a um snapshot jurídico.
  Pode existir como metadado-only (sem snapshot de texto integral).
  Não substitui texto normativo primário.

fields:

  metadata_id:
    type: UUID
    required: true
    description: "Identificador único do registro de metadado."

  snapshot_id:
    type: UUID_reference
    required: false
    description: "Referência ao legal_source_snapshot correspondente. Null se metadado-only."
    validation: "Se presente, deve apontar para snapshot existente."
    behavior_if_absent: "Registrar como null. Marcar metadata_source_type como 'metadata_only'."

  source_id:
    type: string
    required: true
    description: "Fonte dos metadados conforme LEGAL_SOURCE_AUTHORITY_MATRIX.md."
    enum: [SRC-001, SRC-002, SRC-003, SRC-004, SRC-005, SRC-006, SRC-007, SRC-008, SRC-009, SRC-010, SRC-011, SRC-012, SRC-013, UNKNOWN]

  document_type:
    type: enum
    required: true
    description: "Tipo geral do documento jurídico."
    enum: [lei_federal, lei_estadual, lei_municipal, decreto, portaria, resolucao, instrucao_normativa, emenda_constitucional, constituicao, sumula, acordao, despacho, sentenca, edital, ato_administrativo, norma_tecnica, codigo, other, unknown]
    behavior_if_absent: "Registrar como 'unknown'."

  norm_type:
    type: string
    required: false
    description: "Classificação normativa específica (ex.: CLT, CC, CP, CPC, CF88)."
    behavior_if_absent: "Registrar como null."

  norm_number:
    type: string
    required: false
    description: "Número da norma (ex.: 000, 001). Para exemplos fictícios: '000'."
    behavior_if_absent: "Registrar como null."

  norm_year:
    type: integer
    required: false
    description: "Ano de publicação da norma."
    validation: "Entre 1500 e 2200. Para exemplos fictícios: ano arbitrário > 2080."
    behavior_if_absent: "Registrar como null."

  title:
    type: string
    required: false
    description: "Título oficial do documento."
    behavior_if_absent: "Registrar como null."

  issuing_body:
    type: string
    required: false
    description: "Órgão emissor (ex.: 'Presidência da República', 'Ministério X')."
    behavior_if_absent: "Registrar como null."

  jurisdiction:
    type: enum
    required: true
    description: "Âmbito de aplicação da norma."
    enum: [federal, estadual, municipal, distrital, supranacional, unknown]
    behavior_if_absent: "Registrar como 'unknown'."

  publication_date:
    type: ISO8601_date
    required: false
    description: "Data de publicação oficial."
    behavior_if_absent: "Registrar como null. stale_risk aumenta se ausente."

  effective_date:
    type: ISO8601_date
    required: false
    description: "Data de entrada em vigor."
    behavior_if_absent: "Registrar como null."

  revoked_status:
    type: enum
    required: true
    description: "Status de vigência da norma."
    enum: [active, revoked, partially_revoked, suspended, unknown]
    validation: >
      'revoked' → stale_risk:critical; bloqueia uso como corpus.
      'unknown' → stale_risk:high; emitir aviso obrigatório.
    behavior_if_absent: "Registrar como 'unknown'."

  revoked_by:
    type: string
    required: false
    description: "Norma revogadora, se conhecida."
    behavior_if_absent: "Registrar como null."

  amended_by:
    type: array_string
    required: false
    description: "Lista de normas que alteraram este documento."
    behavior_if_absent: "Registrar como array vazio."

  amendment_detected:
    type: boolean
    required: true
    description: "Indica se emenda ou alteração foi detectada após a coleta do snapshot."
    default: false
    validation: "true → stale_risk aumenta; snapshot deve ser marcado para re-coleta."

  consolidation_status:
    type: enum
    required: false
    description: "Indica se o texto é consolidado (com todas as emendas) ou original."
    enum: [consolidated, original, unknown]
    behavior_if_absent: "Registrar como 'unknown'."

  version_label:
    type: string
    required: false
    description: "Rótulo de versão do documento (ex.: 'v2025-01-15', 'emenda_001')."
    behavior_if_absent: "Registrar como null."

  authority_level:
    type: integer
    required: true
    description: "Autoridade da fonte dos metadados (1 a 7)."
    enum: [1, 2, 3, 4, 5, 6, 7]

  metadata_source_type:
    type: enum
    required: true
    description: "Indica se os metadados vêm do texto primário, de metadados oficiais ou de fonte auxiliar."
    enum: [primary_text, official_metadata, aggregator_metadata, manual_entry, metadata_only, unknown]
    validation: >
      LexML (quando ativo futuramente): official_metadata.
      Jusbrasil/Escavador: aggregator_metadata.
      aggregator_metadata → metadata_confidence máximo: low.
    behavior_if_absent: "Registrar como 'unknown'."

  metadata_confidence:
    type: enum
    required: true
    description: "Confiança na precisão dos metadados."
    enum: [high, medium, low, unknown]
    validation: >
      low → validation_status permanece 'pending'.
      aggregator_metadata → máximo 'low'.
      official_metadata de fonte primária → pode ser 'high'.
    behavior_if_absent: "Registrar como 'unknown'."

  stale_risk:
    type: enum
    required: true
    description: "Risco de desatualização dos metadados."
    enum: [low, medium, high, critical, unknown]
    validation: "revoked_status:unknown → stale_risk:high mínimo."

  conflict_status:
    type: enum
    required: true
    description: "Conflito detectado entre estes metadados e outra fonte."
    enum: [none, conflict_detected, conflict_under_review, resolved, unknown]
    validation: "conflict_detected → cria legal_conflict_record + bloqueia conclusão jurídica."

  validation_status:
    type: enum
    required: true
    description: "Estado de validação dos metadados."
    enum: [not_started, pending, passed_technical_only, validated_snapshot, human_reviewed, rejected, deprecated]

  allowed_use:
    type: array_enum
    required: true
    description: "Usos permitidos para estes metadados."
    enum_values: [none, lead_only, metadata_locator, staging_analysis, educational_reference, controlled_internal_reference]

  prohibited_use:
    type: array_enum
    required: true
    description: "Usos proibidos para estes metadados."
    note: "Metadado não substitui texto normativo primário. Nunca como corpus normativo principal."

  created_at:
    type: ISO8601_datetime
    required: true

  updated_at:
    type: ISO8601_datetime
    required: true

  notes:
    type: text
    required: false

special_rules:
  - "Metadado não substitui texto primário."
  - "metadata_confidence:low exige validation_status:pending."
  - "revoked_status:unknown ativa stale_risk mínimo:high."
  - "conflict_status:conflict_detected bloqueia conclusão jurídica."
  - "LexML e catálogos oficiais: metadata_source_type:official_metadata — não corpus normativo primário."
  - "aggregator_metadata (Jusbrasil, Escavador): metadata_confidence máximo:low."
```

---

## §7. Entity: `legal_connector_log`

```yaml
entity: legal_connector_log
design_mode: schema_design_only
table_created: false
purpose: >
  Registra operações futuras dos conectores: cada tentativa de fetch, resultado, status e rastreabilidade.
  Não confere validade jurídica ao conteúdo recuperado.

fields:

  log_id:
    type: UUID
    required: true
    description: "Identificador único de cada operação de conector."

  connector_id:
    type: string
    required: true
    description: "ID do conector que executou a operação."
    enum: [CONN-001, CONN-002, CONN-003, CONN-004, CONN-005, CONN-006, CONN-007, CONN-008, CONN-009, CONN-010, CONN-011, CONN-012, CONN-013]

  connector_name:
    type: string
    required: true
    description: "Nome legível do conector (ex.: 'Planalto HTML Connector v1')."

  operation_type:
    type: enum
    required: true
    description: "Tipo de operação realizada."
    enum: [fetch_html, fetch_xml_sru, fetch_pdf, fetch_api_rest, fetch_api_graphql, robots_check, terms_check, dry_run, preflight_only]

  operation_mode:
    type: enum
    required: true
    description: "Modo de execução da operação."
    enum: [dry_run, preflight, non_operational_test, operational]
    validation: "'operational' proibido enquanto connectors_active:0 e connector em planned_only."

  request_timestamp:
    type: ISO8601_datetime
    required: true
    description: "Timestamp do início da requisição (UTC)."

  request_url:
    type: URL
    required: true
    description: "URL exata da requisição."

  request_method:
    type: enum
    required: true
    description: "Método HTTP da requisição."
    enum: [GET, POST, HEAD, OPTIONS]

  response_status_code:
    type: integer
    required: true
    description: "Código HTTP de resposta."
    validation: "200 = sucesso. 403/404/429/5xx = registrar como erro + abort/backoff."

  response_mime_type:
    type: string
    required: false
    description: "Content-Type da resposta."

  success:
    type: boolean
    required: true
    description: "Indica se a operação foi bem-sucedida (status 2xx)."

  error_code:
    type: string
    required: false
    description: "Código de erro interno se operação falhou."
    enum: [SOCKET_BLOCK, CAPTCHA_DETECTED, RATE_LIMIT_EXCEEDED, ROBOTS_BLOCKED, TERMS_VIOLATION, ENDPOINT_404, TIMEOUT, PARSER_FAILURE, BYPASS_ATTEMPT_DETECTED, AUTHORIZATION_REQUIRED, null]

  error_message:
    type: text
    required: false
    description: "Mensagem de erro detalhada."

  rate_limit_status:
    type: enum
    required: true
    description: "Status de rate limiting durante a operação."
    enum: [not_applicable, ok, warning_approaching, exceeded, blocked]

  backoff_applied:
    type: boolean
    required: true
    description: "Indica se backoff foi aplicado após erro de rate limit ou 429."
    default: false

  robots_status_at_request:
    type: enum
    required: true
    description: "Status do robots.txt para o path solicitado no momento da operação."
    enum: [allowed, disallowed, unknown, not_checked, crawl_delay_applied]
    validation: "disallowed → operação deve ser abortada. not_checked → registrar como anomalia."

  terms_review_status_at_request:
    type: enum
    required: true
    description: "Status da revisão de governança para este conector no momento da operação."
    enum: [not_reviewed, unknown_requires_manual_review, restricted_review_required, approved_for_use, blocked, not_applicable]

  user_agent_id:
    type: string
    required: true
    description: "Identificador do User-Agent usado na requisição."
    validation: "Não pode ser User-Agent padrão de biblioteca (ex.: 'python-requests'). Deve ser User-Agent customizado identificado."
    note: "python-requests explicitamente bloqueado no robots.txt de CONN-002."

  raw_snapshot_created:
    type: boolean
    required: true
    description: "Indica se snapshot bruto foi criado como resultado desta operação."

  snapshot_id:
    type: UUID_reference
    required: false
    description: "Referência ao legal_source_snapshot criado, se raw_snapshot_created:true."

  checksum_created:
    type: boolean
    required: true
    description: "Indica se checksum foi calculado para o conteúdo recuperado."
    validation: "Se raw_snapshot_created:true e checksum_created:false — registrar como anomalia crítica."

  parser_invoked:
    type: boolean
    required: true
    description: "Indica se parser foi invocado para extração estruturada."

  parser_version:
    type: string
    required: false
    description: "Versão do parser invocado, se aplicável."

  validation_status_after_operation:
    type: enum
    required: true
    description: "Status de validação atribuído ao snapshot criado."
    enum: [not_applicable, fetched_unvalidated, parsed_unvalidated, pending, failed, validated_snapshot]
    default: fetched_unvalidated

  legal_content_fetched:
    type: boolean
    required: true
    description: "Indica se conteúdo jurídico foi efetivamente obtido nesta operação."
    validation: "true proibido enquanto connector_status em planned_only ou blocked."
    default: false

  RAG_updated:
    type: boolean
    required: true
    description: "Indica se RAG foi atualizado como resultado desta operação."
    validation: "true proibido nesta fase. RAG_updates:0 deve ser preservado."
    default: false

  embeddings_created:
    type: boolean
    required: true
    description: "Indica se embeddings foram gerados como resultado desta operação."
    validation: "true proibido nesta fase."
    default: false

  notes:
    type: text
    required: false

special_rules:
  - "legal_content_fetched:true proibido enquanto connector_status em planned_only."
  - "RAG_updated:true proibido nesta fase de design."
  - "embeddings_created:true proibido nesta fase de design."
  - "Logs não conferem validade jurídica ao conteúdo recuperado."
  - "403/404/429/5xx devem acionar error_code + abort ou backoff."
  - "CAPTCHA ou burla de bloqueio deve gerar error_code:BYPASS_ATTEMPT_DETECTED e rejeição."
  - "python-requests como user_agent_id deve gerar erro de configuração."
  - "robots_status_at_request:disallowed deve abortar operação e registrar como rejeição."
```

---

## §8. Entity: `legal_quarantine_record`

```yaml
entity: legal_quarantine_record
design_mode: schema_design_only
table_created: false
purpose: >
  Guarda conteúdo rejeitado (TRUST-0) ou quarentenado (TRUST-1) sem contaminar o corpus jurídico validado.
  O registro existe para auditoria e rastreabilidade — não para uso jurídico de qualquer espécie.

fields:

  quarantine_id:
    type: UUID
    required: true
    description: "Identificador único do registro de quarentena."

  content_id:
    type: string
    required: true
    description: "ID do conteúdo quarentenado. Pode ser gerado localmente se sem fonte rastreável."

  received_from:
    type: string
    required: true
    description: "Origem do conteúdo: agente (ex.: rag-agent), operador, externo."
    enum: [operator, rag-agent, norm-agent, doc-agent, intake-agent, simb-agent, learn-agent, connector, external_source, unknown]

  received_at:
    type: ISO8601_datetime
    required: true
    description: "Timestamp de quando o conteúdo chegou ao legal-agent (UTC)."

  source_claimed:
    type: string
    required: false
    description: "Fonte que o remetente alegou. Pode não ser verificável."
    note: "O que o remetente afirma ≠ fonte verificada. Registrar como dado não confirmado."

  source_url_claimed:
    type: URL
    required: false
    description: "URL que o remetente alegou como origem. Não verificada."

  contamination_vector:
    type: enum
    required: true
    description: "Vetor de contaminação identificado."
    enum:
      - other_agent_output        # output de rag-agent, norm-agent, doc-agent, etc.
      - user_pasted_text          # texto colado pelo operador sem indicação de fonte oficial
      - LLM_summary               # output gerado por modelo de linguagem
      - OCR_output                # texto extraído por OCR sem validação
      - aggregator_content        # Jusbrasil, Escavador, Migalhas, ConJur, similares
      - blog_article_news         # artigo, blog, notícia jurídica
      - unofficial_scraping       # scraping de fonte sem robots.txt ou contra robots.txt
      - RAG_external              # conteúdo de índice RAG de outro agente
      - memory_external           # conteúdo de memória de outro agente
      - connector_bypass          # tentativa de contorno de conector bloqueado
      - unknown

  initial_trust_class:
    type: enum
    required: true
    description: "Trust class atribuída no momento da quarentena."
    enum: [TRUST-0, TRUST-1]
    validation: "TRUST-0 = rejected_unusable. TRUST-1 = quarantined_unverified."

  quarantine_reason:
    type: enum
    required: true
    description: "Motivo da quarentena."
    enum:
      - missing_source_url
      - missing_checksum
      - missing_fetched_at
      - missing_chain_of_custody
      - unofficial_source
      - auxiliary_source
      - connector_high_risk          # CONN-001 herdado de 8.4C
      - restricted_review_required   # CONN-002 herdado de 8.4C
      - bypass_detected
      - stale_risk
      - conflict_detected
      - LLM_generated_content
      - OCR_unvalidated
      - unknown

  missing_provenance_fields:
    type: array_string
    required: false
    description: "Lista de campos críticos ausentes que levaram à quarentena."
    example: [source_url, checksum, chain_of_custody_id]

  suspected_risk:
    type: enum
    required: true
    description: "Risco de dano se conteúdo fosse usado sem quarentena."
    enum: [low, medium, high, critical]

  related_connector_id:
    type: string
    required: false
    description: "Se o conteúdo veio de ou tentou usar um conector, qual."
    enum: [CONN-001, CONN-002, null]

  inherited_connector_risk:
    type: string
    required: false
    description: "Risco herdado do conector de origem (herdado da 8.4C)."
    example: "CONN-001: high/unknown_requires_manual_review (8.4C)"

  allowed_use:
    type: array_enum
    required: true
    description: "Usos permitidos para este conteúdo quarentenado."
    note: "TRUST-0: [none]. TRUST-1: [lead_only]."

  prohibited_use:
    type: array_enum
    required: true
    description: "Usos proibidos para este conteúdo quarentenado."
    note: "TRUST-0 e TRUST-1 têm todos os usos proibidos."

  promotion_possible:
    type: boolean
    required: true
    description: "Indica se promoção de trust class é possível com informações adicionais."
    validation: "TRUST-0: false por padrão. TRUST-1: true se campos críticos puderem ser obtidos."

  promotion_requirements:
    type: array_string
    required: false
    description: "Lista do que seria necessário para promover este conteúdo além de TRUST-1."

  reviewed_by:
    type: string
    required: false
    description: "Quem revisou o registro de quarentena (operador_primario, null)."

  review_status:
    type: enum
    required: true
    description: "Status da revisão do conteúdo quarentenado."
    enum: [pending, under_review, confirmed_quarantine, promoted, rejected_permanently]
    default: pending

  created_at:
    type: ISO8601_datetime
    required: true

  updated_at:
    type: ISO8601_datetime
    required: true

  notes:
    type: text
    required: false

special_rules:
  - "TRUST-0 e TRUST-1 sempre criam legal_quarantine_record — não vão para corpus."
  - "Quarentena não alimenta RAG jurídico validado."
  - "Quarentena não vira memória operacional jurídica autorizada."
  - "TRUST-0 não pode ser promovido — rejected_unusable é definitivo."
  - "TRUST-1 pode ser promovido apenas com todos os campos críticos de provenance_record preenchidos."
```

---

## §9. Entity: `legal_validation_record`

```yaml
entity: legal_validation_record
design_mode: schema_design_only
table_created: false
purpose: >
  Guarda a trilha de validação técnica e/ou humana de cada snapshot jurídico.
  Cada passo de promoção de trust class deve ter uma entrada aqui.
  Validação técnica NÃO equivale a revisão humana.

fields:

  validation_id:
    type: UUID
    required: true
    description: "Identificador único do registro de validação."

  content_id:
    type: string
    required: true
    description: "ID do conteúdo validado."

  snapshot_id:
    type: UUID_reference
    required: true
    description: "Referência ao legal_source_snapshot validado."

  validation_type:
    type: enum
    required: true
    description: "Tipo de validação realizada."
    enum:
      - technical          # verificação de integridade: hash, formato, campos obrigatórios
      - provenance         # verificação de cadeia de custódia e campos de proveniência
      - authority          # verificação de autoridade da fonte
      - parser_output      # verificação da saída do parser
      - conflict_check     # verificação de conflito com outras fontes
      - stale_check        # verificação de desatualização
      - human_review       # revisão humana autorizada (operador primário ou advogado)

  validation_scope:
    type: string
    required: true
    description: "Escopo específico da validação (ex.: 'integridade SHA256', 'vigência da norma X')."

  validator_type:
    type: enum
    required: true
    description: "Tipo de validador."
    enum: [automated_parser, automated_hash_check, automated_stale_check, human_operator, human_lawyer, not_applicable]

  validation_timestamp:
    type: ISO8601_datetime
    required: true
    description: "Quando a validação foi realizada (UTC)."

  validation_status:
    type: enum
    required: true
    description: "Resultado da validação."
    enum: [not_started, pending, failed, passed_technical_only, validated_snapshot, human_reviewed, rejected, deprecated]

  checks_performed:
    type: array_string
    required: true
    description: "Lista de verificações realizadas nesta validação."
    example: [hash_verified, source_url_present, authority_level_confirmed, stale_risk_assessed]

  checks_failed:
    type: array_string
    required: true
    description: "Lista de verificações que falharam."
    example: []

  stale_risk_after_validation:
    type: enum
    required: true
    description: "stale_risk após esta validação."
    enum: [low, medium, high, critical, unknown]

  conflict_status_after_validation:
    type: enum
    required: true
    description: "conflict_status após esta validação."
    enum: [none, conflict_detected, conflict_under_review, resolved, unknown]

  trust_class_before:
    type: enum
    required: true
    description: "trust_class antes desta validação."
    enum: [TRUST-0, TRUST-1, TRUST-2, TRUST-3, TRUST-4, TRUST-5]

  trust_class_after:
    type: enum
    required: true
    description: "trust_class após esta validação (pode ser a mesma)."
    enum: [TRUST-0, TRUST-1, TRUST-2, TRUST-3, TRUST-4, TRUST-5]

  promotion_decision:
    type: enum
    required: true
    description: "Decisão sobre promoção de trust class."
    enum: [promoted, maintained, demoted, rejected]

  promotion_blockers:
    type: array_string
    required: false
    description: "Lista de campos ou condições que bloquearam promoção."
    example: [stale_risk:critical, conflict_detected, checksum_mismatch]

  human_review_required:
    type: boolean
    required: true
    description: "Indica se revisão humana é necessária antes de uso."
    default: true

  created_at:
    type: ISO8601_datetime
    required: true

  notes:
    type: text
    required: false

special_rules:
  - "Validação técnica (automated) não equivale a revisão humana."
  - "passed_technical_only não autoriza estratégia jurídica, prazo ou peça."
  - "TRUST-5 exige validation_type:human_review com validator_type:human_operator ou human_lawyer."
  - "conflict_detected após validação bloqueia promoção de trust_class."
  - "Cada promoção de trust class deve ter uma entrada aqui."

enum_validation_status:
  not_started: "Validação ainda não iniciada."
  pending: "Em processo ou aguardando dados."
  failed: "Validação falhou — campos ausentes ou hash inválido."
  passed_technical_only: "Passou verificações técnicas mas não humanas."
  validated_snapshot: "Validação técnica completa — TRUST-4 possível."
  human_reviewed: "Revisão humana confirmada — TRUST-5 possível."
  rejected: "Conteúdo rejeitado permanentemente nesta validação."
  deprecated: "Snapshot desatualizado — não usar como corpus."
```

---

## §10. Entity: `legal_conflict_record`

```yaml
entity: legal_conflict_record
design_mode: schema_design_only
table_created: false
purpose: >
  Guarda divergências detectadas entre fontes, versões ou interpretações de um mesmo conteúdo.
  Conflito ativo bloqueia conclusão jurídica até resolução documentada.
  Correlaciona com LEGAL_CONFLICT_RESOLUTION_PROTOCOL.md (8 tipos T-01 a T-08).

fields:

  conflict_id:
    type: UUID
    required: true
    description: "Identificador único do conflito."

  conflict_type:
    type: enum
    required: true
    description: "Tipo de conflito conforme LEGAL_CONFLICT_RESOLUTION_PROTOCOL.md."
    enum:
      - T-01_text_divergence           # dois textos diferentes para o mesmo dispositivo
      - T-02_revocation_conflict       # lei possivelmente revogada
      - T-03_jurisprudence_conflict    # jurisprudência divergente
      - T-04_official_vs_auxiliary     # fonte oficial vs. auxiliar divergem
      - T-05_federal_vs_local          # lei federal vs. estadual/municipal
      - T-06_general_vs_special        # lei geral vs. lei especial
      - T-07_old_vs_new                # norma anterior vs. norma posterior
      - T-08_nonbinding_vs_binding     # entendimento não vinculante vs. precedente vinculante
      - parser_conflict                # parser extraiu conteúdo diferente de duas coletas da mesma fonte
      - unknown

  primary_snapshot_id:
    type: UUID_reference
    required: true
    description: "Referência ao primeiro snapshot no conflito."

  secondary_snapshot_id:
    type: UUID_reference
    required: false
    description: "Referência ao segundo snapshot no conflito. Null se conflito é interno."

  source_a:
    type: string
    required: true
    description: "Identificação da primeira fonte no conflito (source_id + versão)."

  source_b:
    type: string
    required: false
    description: "Identificação da segunda fonte no conflito."

  conflict_detected_at:
    type: ISO8601_datetime
    required: true
    description: "Quando o conflito foi detectado (UTC)."

  conflict_description:
    type: text
    required: true
    description: "Descrição textual do conflito. Deve ser específica — qual campo, qual divergência."

  affected_fields:
    type: array_string
    required: true
    description: "Campos ou seções do documento afetados pelo conflito."
    example: [text_content, effective_date, revoked_status]

  severity:
    type: enum
    required: true
    description: "Severidade do conflito para uso jurídico."
    enum: [low, medium, high, critical, blocking]
    validation: "blocking → legal_conclusion_allowed:false imediato."

  resolution_status:
    type: enum
    required: true
    description: "Status de resolução do conflito."
    enum: [unresolved, under_review, provisionally_resolved, resolved, requires_human_validation, permanently_unresolved]
    default: unresolved

  preferred_source_if_any:
    type: string
    required: false
    description: "Fonte preferida pela hierarquia de autoridade, se aplicável."
    note: "Hierarquia de fonte = fonte primária prevalece. Ver LEGAL_SOURCE_AUTHORITY_MATRIX.md."

  legal_conclusion_allowed:
    type: boolean
    required: true
    description: "Indica se conclusão jurídica é permitida dado o conflito."
    default: false
    validation: "false por padrão. Só muda para true após resolução documentada + validação humana."

  required_action:
    type: array_string
    required: true
    description: "Ações necessárias para resolver o conflito."
    example: [verify_primary_source, human_review, update_snapshot, check_revocation_status]

  created_at:
    type: ISO8601_datetime
    required: true

  updated_at:
    type: ISO8601_datetime
    required: true

  notes:
    type: text
    required: false

special_rules:
  - "Conflito detectado sempre bloqueia conclusão jurídica (legal_conclusion_allowed:false por padrão)."
  - "legal_conclusion_allowed só se torna true após resolução documentada e validação humana."
  - "Conflito entre fonte oficial e fonte auxiliar: auxiliar descartada — T-04."
  - "Conflito com jurisprudência divergente: declarar sem eleger tese — T-03."
  - "severity:blocking exige escalada para fw-governor."
  - "Conflito ativo impede entrada em corpus TRUST-4+ até resolução."
```

---

## §11. Entity: `legal_rag_index_manifest`

```yaml
entity: legal_rag_index_manifest
design_mode: schema_design_only
table_created: false
purpose: >
  Design futuro dos 5 índices RAG separados obrigatórios — controla trust classes,
  tipos de documento, políticas de contaminação e configurações por índice.
  Nenhum índice existe ainda. Este é o schema de controle para implementação futura.

planned_indexes:

  - index_id: IDX-001
    index_name: legal_rag_quarantine_log
    index_type: quarantine_audit_log
    allowed_trust_classes: [TRUST-0, TRUST-1]
    prohibited_trust_classes: []
    purpose: "Registro de quarentena — sem embeddings jurídicos, apenas log de auditoria."
    embeddings: false
    semantic_search: false
    legal_use_allowed: false

  - index_id: IDX-002
    index_name: legal_rag_metadata_index
    index_type: metadata_locator
    allowed_trust_classes: [TRUST-2]
    prohibited_trust_classes: [TRUST-0, TRUST-1, TRUST-3, TRUST-4, TRUST-5]
    purpose: "Localização de normas via metadados oficiais (LexML, quando ativo). Não corpus normativo."
    embeddings: future_optional
    semantic_search: future_optional
    legal_use_allowed: metadata_and_locator_only

  - index_id: IDX-003
    index_name: legal_rag_staging_index
    index_type: staging_corpus
    allowed_trust_classes: [TRUST-3]
    prohibited_trust_classes: [TRUST-0, TRUST-1, TRUST-2, TRUST-4, TRUST-5]
    purpose: "Snapshots oficiais não validados — staging isolado do corpus validado."
    embeddings: future_after_approval
    semantic_search: future_after_approval
    legal_use_allowed: staging_analysis_only

  - index_id: IDX-004
    index_name: legal_rag_validated_official_index
    index_type: validated_corpus
    allowed_trust_classes: [TRUST-4]
    prohibited_trust_classes: [TRUST-0, TRUST-1, TRUST-2, TRUST-3, TRUST-5]
    purpose: "Corpus oficial validado — uso educativo e consulta interna controlada."
    embeddings: future_after_approval
    semantic_search: future_after_approval
    legal_use_allowed: educational_and_controlled_reference

  - index_id: IDX-005
    index_name: legal_rag_human_reviewed_index
    index_type: human_reviewed_corpus
    allowed_trust_classes: [TRUST-5]
    prohibited_trust_classes: [TRUST-0, TRUST-1, TRUST-2, TRUST-3, TRUST-4]
    purpose: "Corpus revisado por humano autorizado — nível mais maduro disponível."
    embeddings: future_after_human_review_gate
    semantic_search: future_after_human_review_gate
    legal_use_allowed: controlled_assisted_legal_analysis

fields:

  index_id:
    type: string
    required: true
    description: "Identificador do índice (IDX-001 a IDX-005)."

  index_name:
    type: string
    required: true
    description: "Nome canônico do índice."

  index_type:
    type: enum
    required: true
    enum: [quarantine_audit_log, metadata_locator, staging_corpus, validated_corpus, human_reviewed_corpus]

  allowed_trust_classes:
    type: array_enum
    required: true
    description: "Trust classes permitidas neste índice."

  prohibited_trust_classes:
    type: array_enum
    required: true
    description: "Trust classes explicitamente proibidas neste índice."

  allowed_document_types:
    type: array_string
    required: false
    description: "Tipos de documento permitidos neste índice."

  prohibited_document_types:
    type: array_string
    required: false
    description: "Tipos explicitamente proibidos."
    note: "Nunca misturar legislação, jurisprudência, doutrina e processo real sem escopo explícito."

  source_scope:
    type: array_string
    required: true
    description: "Fontes permitidas neste índice (source_ids)."

  embedding_model:
    type: string
    required: false
    description: "Modelo de embedding a usar futuramente. Null até aprovação."
    default: null

  embedding_created_at:
    type: ISO8601_datetime
    required: false
    description: "Quando embeddings foram criados. Null até implementação."
    default: null

  corpus_version:
    type: string
    required: false
    description: "Versão do corpus no índice. Null até implementação."
    default: null

  validation_required:
    type: boolean
    required: true
    description: "Indica se validação é exigida antes de admissão de conteúdo."
    default: true

  stale_risk_policy:
    type: enum
    required: true
    description: "Como tratar stale_risk neste índice."
    enum: [reject_critical, warn_and_tag, accept_with_warning, accept_silently]
    default: reject_critical

  conflict_policy:
    type: enum
    required: true
    description: "Como tratar conflict_detected neste índice."
    enum: [reject, quarantine_and_review, accept_with_flag]
    default: reject

  quarantine_policy:
    type: enum
    required: true
    description: "Como tratar conteúdo de quarentena neste índice."
    enum: [log_only_no_embeddings, reject_entirely]
    note: "IDX-001 (quarantine_log): log_only_no_embeddings. Demais: reject_entirely."

  created_at:
    type: ISO8601_datetime
    required: true

  updated_at:
    type: ISO8601_datetime
    required: true

  notes:
    type: text
    required: false

special_rules:
  - "TRUST-0 e TRUST-1 proibidos em IDX-002 a IDX-005."
  - "TRUST-2 apenas em IDX-002 (metadata/localizador)."
  - "TRUST-3 apenas em IDX-003 (staging)."
  - "TRUST-4 apenas em IDX-004 (corpus oficial validado)."
  - "TRUST-5 apenas em IDX-005 (corpus revisado por humano)."
  - "Nunca misturar doutrina, legislação, jurisprudência e processo real no mesmo índice sem escopo explícito."
  - "Cada índice deve ter sua própria policy de stale_risk, conflito e quarentena."
  - "Embeddings proibidos em IDX-001 (apenas log)."
```

---

## §12. Enumerations

Definições formais de todas as enumerações usadas nos schemas acima.

---

### 12.1 trust_class

| Valor | Nome | Descrição |
|---|---|---|
| TRUST-0 | rejected_unusable | Sem origem rastreável. Nenhum uso jurídico. Definitivo. |
| TRUST-1 | quarantined_unverified | Pode indicar pista. Não sustenta conclusão jurídica. |
| TRUST-2 | official_metadata_unvalidated | Metadado oficial/localizador. Não corpus normativo. |
| TRUST-3 | official_snapshot_unvalidated | Snapshot oficial não validado. Staging apenas. |
| TRUST-4 | validated_official_snapshot | Validação técnica completa. Consulta controlada. |
| TRUST-5 | human_reviewed_legal_corpus | Revisão humana autorizada. Estágio mais maduro. |

---

### 12.2 quarantine_status

| Valor | Correspondência trust_class | Uso permitido |
|---|---|---|
| rejected_unusable | TRUST-0 | Nenhum. Apenas indicar ao operador que fonte oficial é necessária. |
| quarantined_unverified | TRUST-1 | Lead investigativo. Sugestão de busca em fonte oficial. |
| metadata_only | TRUST-2 | Localizar / rotear. Registrar metadados. |
| staging_only | TRUST-3 | Snapshot + metadados. Staging isolado. |
| validated_snapshot | TRUST-4 | Consulta interna controlada. Referência educacional. |
| human_reviewed | TRUST-5 | Assistência jurídica controlada em estágio futuro aprovado. |
| not_applicable | — | Coleta não jurídica ou campo não relevante. |

---

### 12.3 authority_level

| Valor | Categoria | Exemplos (SRC) |
|---|---|---|
| 1 | primary_normative_source | SRC-001 Planalto, SRC-002 LexML |
| 2 | legislative_source | SRC-003 Senado, SRC-004 Câmara |
| 3 | binding_jurisprudence_source | SRC-006 STJ, SRC-007 STF |
| 4 | process_metadata_source | SRC-005 CNJ DataJud |
| 5 | official_publication_source | SRC-008 DOU |
| 6 | regional_source | SRC-009 Tribunais Regionais |
| 7 | auxiliary_source | SRC-010 Jusbrasil, SRC-011 Escavador, SRC-012 Migalhas, SRC-013 ConJur |

---

### 12.4 validation_status

| Valor | Descrição |
|---|---|
| not_started | Validação ainda não iniciada. |
| pending | Em processo ou aguardando dados. |
| failed | Falha: campos ausentes, hash inválido, fonte rejeitada. |
| fetched_unvalidated | Conteúdo obtido mas sem processamento ou validação. |
| parsed_unvalidated | Parsing feito mas sem validação técnica completa. |
| passed_technical_only | Passou técnica. Não autoriza estratégia ou prazo. |
| validated_snapshot | Validação técnica mínima completa. TRUST-4 possível. |
| human_review_required | Validação técnica OK, mas revisão humana necessária. |
| human_reviewed | Revisão humana confirmada. TRUST-5 possível. |
| rejected | Rejeitado permanentemente nesta validação. |
| deprecated | Desatualizado. Não usar como corpus ativo. |
| conflict_detected | Conflito com outra fonte. Bloqueia uso. |

---

### 12.5 stale_risk

| Valor | Categoria normativa típica | Ação obrigatória |
|---|---|---|
| low | Códigos clássicos sem emenda recente | Verificar periodicamente |
| medium | Leis codificadas com emendas eventuais | Verificar antes de uso formal |
| high | Decretos, portarias, jurisprudência | Verificar sempre antes de qualquer uso |
| critical | Prazos processuais, normas estaduais/municipais | Aviso obrigatório + bloqueio de uso como corpus |
| unknown | Não avaliado | Tratar como stale_risk:high por padrão |

---

### 12.6 conflict_status

| Valor | Descrição | Efeito |
|---|---|---|
| none | Nenhum conflito detectado. | Uso permitido conforme trust_class. |
| conflict_detected | Conflito ativo com outra fonte. | legal_conclusion_allowed:false. |
| conflict_under_review | Conflito sendo analisado. | legal_conclusion_allowed:false até resolução. |
| resolved | Conflito resolvido e documentado. | Requer legal_validation_record confirmando resolução. |
| unknown | Não verificado. | Tratar como conflict_detected por precaução. |

---

### 12.7 allowed_use

| Valor | Descrição | trust_class mínima |
|---|---|---|
| none | Nenhum uso permitido. | TRUST-0 |
| lead_only | Pista investigativa — confirmar em fonte oficial. | TRUST-1 |
| metadata_locator | Localizar e rotear para fonte primária. | TRUST-2 |
| staging_analysis | Análise em ambiente de staging isolado. | TRUST-3 |
| educational_reference | Referência educacional com declaração de fonte e data. | TRUST-4 |
| controlled_internal_reference | Consulta interna controlada com rastreabilidade. | TRUST-4 |
| future_human_reviewed_use | Assistência jurídica controlada em fase futura aprovada. | TRUST-5 |

---

### 12.8 prohibited_use

| Valor | Descrição |
|---|---|
| legal_advice | Substituir advogado em qualquer dimensão. |
| procedural_deadline | Calcular ou confirmar prazo forense. |
| protocolable_piece | Peça processual pronta para protocolo. |
| legal_strategy | Estratégia processual aprovada. |
| rights_confirmation | Confirmar direito como reconhecido. |
| victory_probability | Declarar probabilidade de vitória. |
| damages_calculation | Calcular verbas ou danos definitivamente. |
| RAG_validated_index | Alimentar índice RAG de corpus validado. |
| operational_memory | Memorizar como conhecimento jurídico operacional. |

---

### 12.9 connector_status

| Valor | Descrição |
|---|---|
| planned_only | Conector especificado em design — sem implementação. |
| review_required | Em revisão de governança — acesso proibido. |
| candidate_connector | Passou revisão preliminar — acesso ainda proibido. |
| dry_run_allowed | Apenas teste de conectividade sem conteúdo jurídico. |
| active_non_operational | Implementado mas sem uso jurídico ativo. |
| active_operational | Implementado e autorizado para uso jurídico controlado. |
| blocked | Bloqueado por resultado de revisão ou risco. |
| deprecated | Desativado — não usar. |

**Estado atual (herdado de 8.4C):**
- CONN-001: `blocked` (unknown_requires_manual_review / high)
- CONN-002: `review_required` (restricted_review_required / medium)

---

## §13. Required Cross-Entity Rules

Regras de integridade entre as entidades desenhadas. Obrigatórias em qualquer implementação futura.

**REGRA-01 — Metadata precisa de snapshot ou declaração de metadata_only:**
Todo `legal_source_metadata` deve apontar para `snapshot_id` existente em `legal_source_snapshot`, ou declarar `metadata_source_type: metadata_only` explicitamente.

**REGRA-02 — TRUST-0 e TRUST-1 obrigam quarantine_record:**
Todo conteúdo com `trust_class IN [TRUST-0, TRUST-1]` deve ter entrada correspondente em `legal_quarantine_record`. Não pode entrar em nenhum índice RAG exceto `legal_rag_quarantine_log`.

**REGRA-03 — TRUST-4 precisa de validation_record:**
Todo conteúdo com `trust_class: TRUST-4` deve ter ao menos uma entrada em `legal_validation_record` com `validation_status: validated_snapshot`.

**REGRA-04 — conflict_detected obriga conflict_record:**
Todo conteúdo com `conflict_status: conflict_detected` deve ter entrada correspondente em `legal_conflict_record`. `legal_conclusion_allowed` deve ser `false` até resolução documentada.

**REGRA-05 — stale_risk:critical bloqueia corpus validado:**
Todo conteúdo com `stale_risk: critical` não pode entrar em `legal_rag_validated_official_index` (IDX-004) nem em `legal_rag_human_reviewed_index` (IDX-005). Pode entrar em IDX-003 (staging) com aviso obrigatório.

**REGRA-06 — Conteúdo de outro agente começa em TRUST-1:**
Todo conteúdo recebido via `received_from IN [rag-agent, norm-agent, doc-agent, intake-agent, simb-agent, learn-agent, any_future_agent]` inicia com `trust_class: TRUST-1` e cria `legal_quarantine_record`. O `legal-agent` verifica a fonte — não confia na classificação do agente remetente.

**REGRA-07 — CONN-001 e CONN-002 herdam status de risco 8.4C:**
Todo conteúdo com `connector_id IN [CONN-001, CONN-002]` deve ter `trust_class` máxima de `TRUST-1` enquanto `connector_status_at_collection` permanecer em `blocked` (CONN-001) ou `review_required` (CONN-002). Nenhum contorno via agente intermediário.

**REGRA-08 — RAG validado recusa TRUST-0 e TRUST-1:**
Nenhum conteúdo com `trust_class IN [TRUST-0, TRUST-1]` pode ser indexado em `legal_rag_validated_official_index` (IDX-004) ou `legal_rag_human_reviewed_index` (IDX-005).

**REGRA-09 — TRUST-4 exige checksum:**
Nenhum snapshot pode ser promovido para `trust_class: TRUST-4` sem `raw_content_hash` preenchido e verificado. `checksum_created:true` obrigatório no `legal_connector_log` correspondente.

**REGRA-10 — TRUST-5 exige revisão humana:**
Nenhum conteúdo pode ser promovido para `trust_class: TRUST-5` sem entrada em `legal_validation_record` com `validation_type: human_review` e `validator_type IN [human_operator, human_lawyer]`. Revisão humana futura — não automatizável.

---

## §14. Example Records — Fictional Only

Exemplos fictícios para ilustrar o comportamento esperado de cada schema. Nenhum conteúdo jurídico real foi usado.

> **Regra absoluta desta seção:** Nenhum nome de lei real, artigo real, tribunal real (com número de processo) ou texto jurídico real. Apenas placeholders.

---

### Exemplo A — Conteúdo sem fonte (TRUST-0)

**Situação simulada:** Conteúdo chegou ao legal-agent sem qualquer indicação de fonte.

```yaml
# legal_source_snapshot
snapshot_id: "00000000-0000-0000-0000-EXAMPLE-A001"
content_id: "no-source-content-001"
connector_id: null
source_id: "UNKNOWN"
source_name: "desconhecida"
source_url: null                    # CAMPO CRÍTICO AUSENTE
authority_level: null               # CAMPO CRÍTICO AUSENTE
official_source: "unknown"          # CAMPO CRÍTICO
trust_class: "TRUST-0"              # forçado por ausência de campos críticos
quarantine_status: "rejected_unusable"
fetched_at: null                    # CAMPO CRÍTICO AUSENTE
raw_content_hash: null              # CAMPO CRÍTICO AUSENTE
validation_status: "failed"
stale_risk: "unknown"
conflict_status: "unknown"
allowed_use: [none]
prohibited_use: [legal_advice, procedural_deadline, protocolable_piece, legal_strategy, rights_confirmation, victory_probability, damages_calculation, RAG_validated_index, operational_memory]
chain_of_custody_id: null           # CAMPO CRÍTICO AUSENTE — força TRUST-0

# legal_quarantine_record (obrigatório)
quarantine_id: "QR-EXAMPLE-A001"
content_id: "no-source-content-001"
received_from: "operator"
contamination_vector: "user_pasted_text"
initial_trust_class: "TRUST-0"
quarantine_reason: "missing_source_url"
missing_provenance_fields: [source_url, authority_level, fetched_at, raw_content_hash, chain_of_custody_id]
suspected_risk: "critical"
allowed_use: [none]
promotion_possible: false
```

---

### Exemplo B — Artigo de blog jurídico (TRUST-1)

**Situação simulada:** norm-agent enviou trecho de artigo de portal jurídico auxiliar sem cadeia de custódia.

```yaml
# legal_source_snapshot
snapshot_id: "00000000-0000-0000-0000-EXAMPLE-B001"
content_id: "blog-article-content-001"
connector_id: null
source_id: "SRC-012"               # fonte auxiliar
source_name: "Portal Jurídico Fictício"
source_url: "https://portaljuridico.exemplo/artigos/lei-ficticia-000-2099"
authority_level: 7                  # auxiliar — menor autoridade
official_source: false
trust_class: "TRUST-1"
quarantine_status: "quarantined_unverified"
fetched_at: "2099-01-15T10:00:00Z" # fictício
raw_content_hash: null              # não calculado — sem snapshot controlado
validation_status: "fetched_unvalidated"
stale_risk: "high"
conflict_status: "unknown"
allowed_use: [lead_only]
prohibited_use: [legal_advice, procedural_deadline, protocolable_piece, legal_strategy, rights_confirmation, victory_probability, damages_calculation, RAG_validated_index, operational_memory]
chain_of_custody_id: null           # ausente — remetido de outro agente sem rastreabilidade

# legal_quarantine_record (obrigatório)
quarantine_id: "QR-EXAMPLE-B001"
received_from: "norm-agent"
contamination_vector: "other_agent_output"
initial_trust_class: "TRUST-1"
quarantine_reason: "auxiliary_source"
suspected_risk: "high"
allowed_use: [lead_only]
promotion_possible: true
promotion_requirements: [confirm_source_url_in_primary_source, obtain_raw_snapshot_from_official_source, calculate_checksum, register_chain_of_custody]
```

---

### Exemplo C — Metadado oficial hipotético de fonte TRUST-2

**Situação simulada:** Metadado extraído de catálogo oficial hipotético sem conteúdo integral.

```yaml
# legal_source_metadata (sem snapshot integral — metadata_only)
metadata_id: "MD-EXAMPLE-C001"
snapshot_id: null                   # metadado-only
source_id: "SRC-002"               # LexML (hipotético, quando ativo)
document_type: "lei_federal"
norm_number: "000"
norm_year: 2099
title: "Lei Fictícia nº 000, de 2099"
issuing_body: "Órgão Fictício Nacional"
jurisdiction: "federal"
publication_date: "2099-03-01"
effective_date: "2099-04-01"
revoked_status: "unknown"           # status de vigência não confirmado
amendment_detected: false
metadata_source_type: "official_metadata"
metadata_confidence: "medium"
stale_risk: "high"                  # revoked_status:unknown → stale_risk:high mínimo
conflict_status: "none"
validation_status: "passed_technical_only"
allowed_use: [metadata_locator, lead_only]
prohibited_use: [legal_advice, procedural_deadline, protocolable_piece, legal_strategy, rights_confirmation, victory_probability, damages_calculation, RAG_validated_index, operational_memory]
notes: "Metadado-only. Texto integral não ingerido. Vigência não confirmada. lead_only até snapshot oficial ser obtido e validado."
```

---

### Exemplo D — Snapshot oficial hipotético sem validação (TRUST-3)

**Situação simulada:** Snapshot obtido futuramente por conector aprovado hipotético, texto integral, ainda em staging.

```yaml
# legal_source_snapshot (TRUST-3 — staging apenas)
snapshot_id: "00000000-0000-0000-0000-EXAMPLE-D001"
content_id: "official-snapshot-staging-001"
connector_id: "CONN-HYPOTHETICAL"  # conector hipotético aprovado em iteração futura
source_id: "SRC-001"              # Planalto (hipotético — conector aprovado nesta cena)
source_name: "Planalto / Portal da Legislação (hipotético)"
source_url: "https://fonte-oficial.exemplo/lei-ficticia-000-2099"
authority_level: 1
official_source: true
trust_class: "TRUST-3"
quarantine_status: "staging_only"
connector_status_at_collection: "active_non_operational"  # hipotético
access_risk_at_collection: "low"
terms_robots_review_status: "approved_for_use"            # hipotético — 8.4C resolvida
fetched_at: "2099-06-01T08:00:00Z"
raw_snapshot_path: "snapshots/legal/20990601/D001.html"
raw_content_hash: "aabbcc1234567890aabbcc1234567890aabbcc1234567890aabbcc1234567890"
checksum_algorithm: SHA256
content_mime_type: "text/html"
extraction_method: "html_parse"
parser_version: "html_parser_v1.0"
validation_status: "fetched_unvalidated"   # ainda não passou validação técnica mínima
stale_risk: "medium"
conflict_status: "none"
allowed_use: [staging_analysis]
prohibited_use: [legal_advice, procedural_deadline, protocolable_piece, legal_strategy, rights_confirmation, victory_probability, damages_calculation, RAG_validated_index, operational_memory]
chain_of_custody_id: "CC-EXAMPLE-D001"
notes: "Staging apenas. Validação técnica mínima pendente. Não usar para orientação, prazo ou estratégia."
```

---

### Exemplo E — Snapshot validado hipotético (TRUST-4)

**Situação simulada:** Snapshot do Exemplo D após passar por validação técnica mínima completa.

```yaml
# legal_source_snapshot (TRUST-4 — após validação técnica)
snapshot_id: "00000000-0000-0000-0000-EXAMPLE-E001"
content_id: "official-snapshot-validated-001"
trust_class: "TRUST-4"
quarantine_status: "validated_snapshot"
validation_status: "validated_snapshot"
stale_risk: "medium"
conflict_status: "none"
allowed_use: [educational_reference, controlled_internal_reference]
prohibited_use: [legal_advice, procedural_deadline, protocolable_piece, legal_strategy, rights_confirmation, victory_probability, damages_calculation, operational_memory]
notes: "Validação técnica mínima concluída. Uso: referência educacional controlada. Prazo e estratégia proibidos. Revisão humana futura necessária para TRUST-5."

# legal_validation_record (obrigatório para TRUST-4)
validation_id: "VR-EXAMPLE-E001"
snapshot_id: "00000000-0000-0000-0000-EXAMPLE-E001"
validation_type: "technical"
validator_type: "automated_hash_check"
validation_status: "validated_snapshot"
checks_performed: [hash_verified, source_url_present, authority_level_confirmed, stale_risk_assessed, conflict_check_passed, provenance_fields_complete]
checks_failed: []
stale_risk_after_validation: "medium"
conflict_status_after_validation: "none"
trust_class_before: "TRUST-3"
trust_class_after: "TRUST-4"
promotion_decision: "promoted"
promotion_blockers: []
human_review_required: true
notes: "Técnica OK. Humana pendente para TRUST-5. Uso: educational_reference apenas."
```

---

## §15. Implementation Notes for Future Iterations

Sequência recomendada de iterações para progressão do design ao uso operacional controlado.

| Iteração | Descrição | Pré-requisito | Escopo |
|---|---|---|---|
| 8.6 | Local Schema File Drafts | Aprovação do operador | Criar arquivos de schema locais em formato yaml/json — sem banco, sem migration |
| 8.7 | Migration Design | 8.6 completa | Desenhar migrations formais para futuro banco — sem executar |
| 8.8 | Dry-Run Connector Harness | 8.4C follow-up + aprovação | Teste de conectividade apenas (HEAD / robots.txt) — sem conteúdo jurídico |
| 8.9 | Single Fake Snapshot Test | 8.7 + 8.8 completas | Criar único snapshot de conteúdo totalmente fictício para testar pipeline end-to-end |
| 9.0 | Human Review Gate Design | 8.9 completa | Desenhar o processo formal de revisão humana para promoção TRUST-4 → TRUST-5 |

**Notas críticas para iterações futuras:**
- Nenhuma iteração aqui listada é autorizada sem aprovação explícita do operador primário.
- 8.4C-follow (revisão manual de CONN-001 e CONN-002 via navegador) é pré-requisito para qualquer ativação de conector, independentemente do progresso das demais iterações.
- `active:false` e `operational_authority:none` permanecem até promoção formal aprovada.

---

## §16. Result

| Campo | Valor |
|---|---|
| iteration_status | completed |
| schema_design_status | formal_design_only |
| database_created | false |
| migrations_created | false |
| connectors_implemented | 0 |
| connectors_active | 0 |
| legal_content_fetched | 0 |
| legal_documents_ingested | 0 |
| RAG_updates | 0 |
| embeddings_created | 0 |
| agent_activation | unchanged — active:false |
| operational_authority | unchanged — none |
| entities_designed | 7 |
| enumerations_defined | 9 |
| cross_entity_rules_defined | 10 |
| fictional_examples_created | 5 |

**Entidades desenhadas:**
1. `legal_source_snapshot` — 31 campos
2. `legal_source_metadata` — 28 campos
3. `legal_connector_log` — 26 campos
4. `legal_quarantine_record` — 22 campos
5. `legal_validation_record` — 20 campos
6. `legal_conflict_record` — 17 campos
7. `legal_rag_index_manifest` — 15 campos

**Enumerações formalizadas:**
1. trust_class (6 valores)
2. quarantine_status (7 valores)
3. authority_level (7 níveis)
4. validation_status (12 valores)
5. stale_risk (5 valores)
6. conflict_status (5 valores)
7. allowed_use (7 valores)
8. prohibited_use (9 valores)
9. connector_status (8 valores)

**Regras cross-entity:**
REGRA-01 a REGRA-10 (10 regras formalizadas)

**Exemplos fictícios:**
A — TRUST-0 (sem fonte) · B — TRUST-1 (blog auxiliar) · C — TRUST-2 (metadado oficial) · D — TRUST-3 (staging) · E — TRUST-4 (validado técnico)

**Próximas iterações elegíveis:**
- `8.6` — Local Schema File Drafts (design puro, sem banco)
- `8.5A` — Schema QA Review (revisão formal do design desta iteração)

---

*Documento criado em 2026-06-10 como parte da Iteração 8.5.*
*Nenhum banco criado. Nenhuma migration criada. Nenhum dado jurídico acessado.*
*Nenhum conteúdo ingerido. Nenhum RAG alimentado. Nenhum embedding gerado.*
*active:false / operational_authority:none / connectors_active:0 — inalterados.*
*SCHEMA DESENHADO ≠ BANCO IMPLEMENTADO. DESIGN ≠ AUTORIZAÇÃO. AGENTE INATIVO ≠ AGENTE OPERACIONAL.*
