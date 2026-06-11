---
document_id: LEGAL_CONNECTOR_PREFLIGHT_8_4B
agent: legal-agent
version: "0.1"
status: design_only
created: "2026-06-10"
iteration: "8.4B"
event: "EVT-20260610-048"
active: false
operational_authority: none
connectors_described: [CONN-001, CONN-002]
connectors_implemented: 0
connectors_active: 0
---

# LEGAL_CONNECTOR_PREFLIGHT_8_4B — Preflight dos Conectores Planalto e LexML

> **INVARIANTES ABSOLUTOS:**
>
> ```
> CONNECTOR PREFLIGHT ≠ CONNECTOR IMPLEMENTED
> DOCUMENTATION REVIEW ≠ API DATA CALL
> ENDPOINT MAPPED ≠ ENDPOINT CONSUMED
> HTML FETCH PLANNED ≠ SCRAPING ACTIVE
> XML SRU PLANNED ≠ API CONSULTED
> CACHE DESIGN ≠ INGESTION
> PARSER SPEC ≠ PARSER ACTIVE
> SOURCE OFFICIAL ≠ LEGAL ADVICE
> SOURCE AVAILABLE ≠ VALIDATED CORPUS
> NORMA LOCALIZADA ≠ VIGÊNCIA CONFIRMADA
> CONECTOR PLANEJADO ≠ CONSULTA ATIVA
> AGENTE INATIVO ≠ AGENTE OPERACIONAL
> ```

---

## 1. Purpose

Esta iteração desenha o preflight técnico e jurídico-operacional dos dois primeiros conectores
de fonte oficial do legal-agent: CONN-001 (Planalto) e CONN-002 (LexML).

**O que esta iteração faz:**
- Define tipo de acesso previsto para cada conector.
- Especifica requisitos mínimos de cache, rate limiting, logging, parser e validação.
- Define estados de validação e critérios de promoção para iteração futura.
- Documenta riscos técnicos e jurídicos.
- Projeta schemas futuros (apenas como desenho textual).

**O que esta iteração NÃO faz:**
- Não implementa nenhum conector.
- Não executa nenhuma chamada de API ou fetch de URL.
- Não baixa leis, normas, decisões ou documentos jurídicos.
- Não ingere conteúdo em RAG.
- Não gera embeddings.
- Não calcula vigência de nenhuma norma.
- Não consulta processo real.
- Não realiza scraping operacional.
- Não altera a autoridade operacional do agente.

---

## 2. Preserved Operational State

```yaml
status: draft
active: false
operational_authority: none
APIs_consulted: 0
connectors_active: 0
connectors_implemented: 0
legal_documents_ingested: 0
RAG_updates: 0
embeddings_created: 0
real_cases_analyzed: 0
legal_deadlines_calculated: 0
protocolable_pieces_created: 0
scraping_performed: false
```

---

## 3. Connector Preflight Scope

```yaml
preflight_type: design_only
implementation_status: not_implemented
execution_status: not_executed
allowed_artifact: specification
prohibited_artifact: active_connector
connectors_in_scope: [CONN-001, CONN-002]
authorization_required_for_implementation: operador-primario
implementation_iteration: pendente
```

---

## 4. CONN-001 — Planalto / Portal da Legislação

```yaml
connector_id: CONN-001
source_name: "Planalto / Portal da Legislação"
source_url_reference: "https://www.planalto.gov.br/ccivil_03/legislacao.htm"
source_authority_level: primary_normative_source
authority_hierarchy_level: 1
expected_access_type: html_fetch_or_document_page_fetch
api_status: not_confirmed
connector_status: planned_only
implementation_status: not_implemented
authentication_required: unknown_or_not_required_for_public_pages
rate_limit_status: unknown
robots_policy_required: true
terms_review_required: true
parser_required: true
```

### 4.1 Tipo de Acesso Previsto

O Planalto não possui API REST pública documentada para acesso programático ao texto normativo.
O acesso previsto é via **HTML fetch de páginas de legislação**, com parser específico para
extração do texto consolidado e metadados.

| Modalidade | Status | Notas |
|---|---|---|
| HTML fetch de páginas de lei | planejado | Padrão atual; estrutura HTML variável por lei |
| Document page fetch (PDF) | planejado secundário | Algumas normas antigas ou DVDs estão em PDF |
| API REST oficial | não confirmado | Verificar em robots.txt e documentação antes de implementar |
| XML estruturado | não disponível diretamente | Ver CONN-002 (LexML) para XML |

**Verificações obrigatórias antes de implementação:**
- [ ] Leitura de `https://www.planalto.gov.br/robots.txt`
- [ ] Verificação dos Termos de Uso do portal
- [ ] Verificação de existência de API não documentada publicamente
- [ ] Verificação de política de uso de dados governamentais abertos

### 4.2 Parser Types Expected

```yaml
parser_type_expected:
  - html_parser:
      purpose: "Extrair texto de lei a partir do HTML da página"
      challenge: "Layout varia entre leis; tabelas e listas exigem tratamento especial"
      priority: P1
  - metadata_extractor:
      purpose: "Extrair: número da lei, ano, data de publicação, ementa, signatário"
      challenge: "Metadados não estão em campos padronizados — inferência por padrão de texto"
      priority: P1
  - text_normalizer:
      purpose: "Normalizar codificação (UTF-8), remover elementos HTML, preservar estrutura"
      challenge: "Páginas antigas podem ter encoding ISO-8859-1"
      priority: P1
  - amendment_reference_detector:
      purpose: "Identificar artigos que foram alterados com referência à lei alteradora"
      challenge: "Formato de indicação de alteração varia por lei e por época"
      priority: P2
  - revocation_reference_detector:
      purpose: "Identificar quando uma lei foi revogada, total ou parcialmente"
      challenge: "Revogações tácitas não aparecem no texto — exigem cruzamento com outras fontes"
      priority: P2
```

### 4.3 Content Types Expected

```yaml
content_types_expected:
  - Constituição Federal e emendas constitucionais
  - leis ordinárias
  - leis complementares
  - estatutos (Lei X.XXX/AAAA com título de estatuto)
  - decretos-lei (legislação pré-1988)
  - decretos
  - medidas provisórias (quando convertidas ou vigentes)
  - mensagens de veto (referência, não texto normativo)
  - portarias ministeriais relevantes (acesso futuro, não P1)
```

### 4.4 Allowed Future Use

```yaml
allowed_future_use:
  - localizar_texto_normativo_oficial:
      description: "Encontrar o texto de uma lei específica por número/ano"
      status: planned
  - registrar_url_oficial:
      description: "Armazenar URL de origem para rastreabilidade"
      status: planned
  - extrair_metadados_basicos:
      description: "Número, ano, tipo, ementa, data de publicação"
      status: planned
  - criar_snapshot_versionado:
      description: "Cópia imutável com checksum e fetched_at"
      status: planned
  - comparar_com_fonte_auxiliar:
      description: "Verificar se fonte auxiliar difere do texto oficial"
      status: planned
  - detectar_alteracoes_incorporadas:
      description: "Identificar referências a leis que alteraram o texto"
      status: planned
```

### 4.5 Prohibited Use

```yaml
prohibited_use:
  - declarar_vigencia_sem_validacao: "Snapshot ≠ norma vigente confirmada"
  - orientar_juridicamente: "Texto bruto ≠ análise jurídica"
  - calcular_prazo: "Norma localizada ≠ prazo processual confirmado"
  - redigir_peca: "Conector não produz peça — apenas localiza fonte"
  - substituir_consulta_humana: "Toda fonte requer validação humana antes de uso forense"
  - usar_sem_timestamp_checksum: "Uso sem fetched_at e checksum é proibido"
  - usar_para_rag_sem_aprovacao: "Ingestão em RAG requer aprovação explícita do operador"
```

### 4.6 Minimum Metadata — Future Schema

```yaml
minimum_metadata_future:
  source_id: "SRC-001"
  source_name: "Planalto / Portal da Legislação"
  source_url: "URL da página específica da lei no Planalto"
  fetched_at: "ISO 8601 datetime — obrigatório"
  published_at: "Data de publicação no DOU — extrair do texto ou metadado"
  norm_type: "lei_ordinaria | lei_complementar | decreto | decreto_lei | emenda_constitucional | mp | portaria"
  norm_number: "Número da norma"
  norm_year: "Ano de promulgação/publicação"
  title: "Ementa ou título oficial"
  effective_date_if_available: "Data de entrada em vigor — nem sempre explícita"
  amended_by_if_detected: "Lista de normas que alteraram — detectadas pelo parser"
  revocation_status_if_detected: "active | revoked | partially_revoked | unknown"
  checksum: "SHA-256 do conteúdo bruto capturado"
  parser_version: "Versão do parser usado na extração"
  validation_status: "planned_only | fetched_unvalidated | parsed_unvalidated | human_review_required | validated_snapshot"
```

### 4.7 Riscos Técnicos e Jurídicos

```yaml
risks:
  html_inconsistency:
    description: "Estrutura HTML varia significativamente entre leis de épocas diferentes"
    severity: high
    mitigation: "Parser tolerante a variação + fallback para extração de texto puro"
  encoding_issues:
    description: "Páginas antigas podem ter ISO-8859-1 ou mistura de encodings"
    severity: medium
    mitigation: "Detecção automática de encoding antes do parse"
  layout_changes:
    description: "Planalto pode alterar layout sem aviso — parser pode quebrar silenciosamente"
    severity: high
    mitigation: "Testes de sanidade pós-parse + alertas de falha de extração"
  missing_structured_metadata:
    description: "Metadados como effective_date podem não estar no texto de forma padronizada"
    severity: medium
    mitigation: "Campos missing ficam null/pending — nunca inferidos sem base"
  consolidated_text_uncertainty:
    description: "Texto no Planalto é compilado informalmente — podem existir erros de compilação"
    severity: high
    mitigation: "Cruzamento com LexML (CONN-002) quando disponível; marcar validation_status:pending"
  stale_snapshot_risk:
    description: "Snapshot capturado em data D pode estar desatualizado em D+1 por nova emenda"
    severity: critical
    mitigation: "stale_risk calculado; re-fetch periódico; nunca usar sem verificação de data"
  parser_false_positive:
    description: "Parser pode detectar alteração/revogação incorretamente"
    severity: medium
    mitigation: "amended_by e revocation_status ficam pending até revisão humana"
  tos_violation_risk:
    description: "Uso programático pode violar termos de uso do portal"
    severity: high
    mitigation: "Leitura obrigatória de robots.txt e ToS antes de qualquer implementação"
```

### 4.8 Mitigation Summary

| Risco | Mitigação principal |
|---|---|
| HTML inconsistente | Parser tolerante + fallback para texto puro |
| Encoding | Detecção automática |
| Layout mudado | Testes de sanidade + alertas |
| Metadados ausentes | Campos ficam null, não inferidos |
| Texto consolidado incerto | Cruzamento com LexML; pending até validação |
| Snapshot stale | stale_risk ativo; re-fetch periódico; data obrigatória |
| False positive parser | amended_by/revocation_status ficam pending |
| Risco de ToS | Revisão obrigatória antes de implementação |

---

## 5. CONN-002 — LexML / Webservice SRU

```yaml
connector_id: CONN-002
source_name: "LexML Brasil"
source_url_reference: "https://www.lexml.gov.br/"
sru_endpoint_reference: "https://www.lexml.gov.br/busca/SRU"
source_authority_level: official_federated_metadata_source
authority_hierarchy_level: 1
expected_access_type: xml_sru
api_status: documented_webservice
api_standard: "SRU — Search/Retrieve via URL (Z39.50 International)"
connector_status: planned_only
implementation_status: not_implemented
authentication_required: unknown_or_not_required_for_public_search
rate_limit_status: unknown
robots_policy_required: true
terms_review_required: true
parser_required: true
```

### 5.1 Tipo de Acesso Previsto

O LexML expõe um **Webservice SRU** (Search/Retrieve via URL), padrão Z39.50 internacional,
que permite consultas estruturadas ao repositório federado de normas jurídicas brasileiras.

| Modalidade | Status | Notas |
|---|---|---|
| XML SRU query | planejado P1 | Padrão documentado publicamente |
| OAI-PMH harvest | planejado secundário | Verificar disponibilidade |
| REST/JSON | não confirmado | Verificar se existe endpoint alternativo |
| HTML scraping | não previsto | LexML SRU é preferível |

**Parâmetros SRU mínimos a implementar futuramente:**

```
operation=searchRetrieve
version=1.1
query=<CQL query>
startRecord=1
maximumRecords=10
recordSchema=marcxml  # ou lexml
```

**Verificações obrigatórias antes de implementação:**
- [ ] Leitura de documentação oficial SRU do LexML
- [ ] Verificação de robots.txt e Termos de Uso
- [ ] Verificação de rate limit documentado
- [ ] Teste de endpoint disponível (documentation review only — não executar)
- [ ] Verificação de esquema de resposta (marcxml vs. lexml)

### 5.2 Parser Types Expected

```yaml
parser_type_expected:
  - sru_xml_parser:
      purpose: "Parse de resposta XML no formato SRU/marcxml/lexml"
      challenge: "Múltiplos esquemas possíveis; namespaces podem variar"
      priority: P1
  - metadata_parser:
      purpose: "Extrair título, tipo, número, ano, órgão, data de publicação da resposta"
      challenge: "Campos nem sempre consistentes entre registros de tipos diferentes"
      priority: P1
  - urn_parser:
      purpose: "Extrair e normalizar URNs LexML (ex: urn:lex:br:federal:lei:2002-01-10;10406)"
      challenge: "Formato de URN pode variar por tipo de norma e época"
      priority: P1
  - result_ranking_normalizer:
      purpose: "Ordenar resultados por relevância e tipo de autoridade"
      challenge: "Resultado federado mistura legislação, jurisprudência e doutrina"
      priority: P2
  - source_authority_classifier:
      purpose: "Classificar cada resultado pelo nível de autoridade da fonte (ver LEGAL_SOURCE_AUTHORITY_MATRIX)"
      challenge: "LexML agrega fontes de diferentes hierarquias sem classificação explícita"
      priority: P2
```

### 5.3 Content Types Expected

```yaml
content_types_expected:
  - normas_juridicas: "Leis, decretos, portarias — principal uso"
  - projetos_de_lei: "PLs em tramitação — uso secundário"
  - jurisprudencia: "Decisões de tribunais indexadas"
  - doutrina: "Artigos jurídicos — peso epistêmico baixo"
  - documentos_correlatos: "Exposições de motivos, mensagens presidenciais"
```

> **Aviso:** LexML agrega conteúdo de diferentes hierarquias. Jurisprudência e doutrina
> presentes no resultado **não** têm o mesmo peso de fonte primária normativa.
> O `source_authority_classifier` é obrigatório para diferenciar.

### 5.4 Allowed Future Use

```yaml
allowed_future_use:
  - localizar_metadados_juridicos:
      description: "Encontrar número, tipo, data de norma por busca CQL"
      status: planned
  - descobrir_urns:
      description: "Obter URN LexML para rastreabilidade permanente"
      status: planned
  - comparar_fontes:
      description: "Verificar se registro LexML diverge do Planalto"
      status: planned
  - encontrar_registros_relacionados:
      description: "Normas correlatas, alteradoras, revogadoras"
      status: planned
  - apoiar_roteamento_para_fonte_primaria:
      description: "LexML como índice — resultado aponta para Planalto ou tribunal"
      status: planned
```

### 5.5 Prohibited Use

```yaml
prohibited_use:
  - usar_metadado_como_texto_normativo_final: "Metadado LexML ≠ texto da lei"
  - substituir_fonte_primaria: "LexML aponta para a fonte — não a substitui"
  - concluir_vigencia: "Registro federado ≠ vigência confirmada"
  - concluir_tese_juridica: "Localização de norma ≠ interpretação válida"
  - orientar_estrategia: "Indexação ≠ orientação jurídica"
  - redigir_peca: "Conector nunca produz peça"
  - tratar_jurisprudencia_como_normativa: "Acórdão ≠ lei; classificação obrigatória"
  - usar_doutrina_como_autoridade: "Doutrina indexada no LexML = peso epistêmico baixo"
```

### 5.6 Minimum Metadata — Future Schema

```yaml
minimum_metadata_future:
  source_id: "SRC-002"
  query: "Query CQL original — para rastreabilidade"
  query_timestamp: "ISO 8601 — obrigatório"
  result_urn: "URN LexML do registro"
  title: "Título do documento conforme LexML"
  document_type: "lei | decreto | jurisprudencia | doutrina | pl | outro"
  issuing_body: "Órgão emissor conforme LexML"
  date: "Data do documento — formato pode variar"
  source_link: "Link para o documento na fonte original"
  xml_raw_checksum: "SHA-256 do XML bruto da resposta"
  parser_version: "Versão do parser SRU usado"
  authority_classification: "primary | secondary | auxiliary | unknown"
  validation_status: "planned_only | fetched_unvalidated | parsed_unvalidated | human_review_required | validated_snapshot"
```

### 5.7 Riscos Técnicos e Jurídicos

```yaml
risks:
  resultado_federado_nao_primario:
    description: "LexML agrega fontes — resultado pode não ser a fonte primária"
    severity: high
    mitigation: "source_authority_classifier obrigatório; roteamento para Planalto quando legislação federal"
  metadados_incompletos:
    description: "Registros antigos podem ter campos ausentes"
    severity: medium
    mitigation: "Campos null permitidos; validação posterior obrigatória"
  multiplos_registros_semelhantes:
    description: "Mesma lei com múltiplos registros (original + compilado + alterado)"
    severity: medium
    mitigation: "result_ranking_normalizer + preferência por URN de texto compilado"
  ambiguidade_de_urn:
    description: "Formato de URN pode variar por época — não é sempre canônico"
    severity: medium
    mitigation: "urn_parser com tratamento de variantes; fallback para título+número+ano"
  jurisprudencia_misturada_com_legislacao:
    description: "Busca retorna tipos mistos — acórdão e lei no mesmo resultado"
    severity: high
    mitigation: "Filtro por document_type obrigatório; never tratar acórdão como norma"
  resultado_nao_equivale_a_vigencia:
    description: "Norma indexada no LexML pode estar revogada"
    severity: critical
    mitigation: "revocation_status: unknown para todo resultado não verificado; validação humana obrigatória"
  rate_limit_desconhecido:
    description: "Rate limit do SRU não está documentado publicamente"
    severity: medium
    mitigation: "Implementar rate limiting conservador desde o início; backoff em 429"
```

---

## 6. Shared Connector Safety Requirements

Requisitos mínimos comuns a CONN-001 e CONN-002 — e a todos os conectores futuros.

### 6.1 Cache

| Requisito | Especificação |
|---|---|
| `raw_snapshot` | Obrigatório — cópia imutável do conteúdo bruto capturado |
| `checksum` | SHA-256 do raw_snapshot — obrigatório antes de qualquer processamento |
| `fetched_at` | ISO 8601 com timezone — obrigatório em todo snapshot |
| `never_mutate_raw_snapshot` | O conteúdo bruto original nunca deve ser sobrescrito |
| `versioned_processed_output` | Output processado pelo parser é versionado separadamente |
| `stale_ttl_by_type` | Normas codificadas: 48h mínimo; regulamentos: 4h; jurisprudência: 12h |
| `cache_invalidation_policy` | Re-fetch somente por trigger explícito + novo checksum |

### 6.2 Rate Limiting

| Requisito | Especificação |
|---|---|
| `default_interval` | Mínimo 2 segundos entre requests para qualquer fonte |
| `progressive_backoff` | Em erro: dobrar intervalo até máximo de 5 minutos |
| `pause_on_429_403_5xx` | Parar completamente em HTTP 429, 403 ou 5xx; alertar operador |
| `user_agent_policy` | User-Agent identificado com nome do projeto + contato (futuro) |
| `no_parallel_aggressive` | Sem paralelismo > 2 requests simultâneos por fonte |
| `daily_request_budget` | Limite diário configurável por fonte; alerta ao atingir 80% |

### 6.3 Logging

Todo request de conector deve gerar um registro com:

```yaml
log_record:
  log_id: "UUID v4"
  connector_id: "CONN-001 | CONN-002"
  source_id: "SRC-001 | SRC-002"
  request_type: "html_fetch | sru_query | metadata_fetch"
  timestamp: "ISO 8601"
  request_url: "URL ou endpoint consultado"
  http_status: "200 | 404 | 429 | 503 | etc."
  response_size_bytes: integer
  status: "success | partial | error | rate_limited | parse_failed"
  error: "null | descrição do erro"
  checksum: "SHA-256 do conteúdo — null se não houve conteúdo"
  parser_version: "null | versão do parser aplicado"
  validation_status: "fetched_unvalidated | parsed_unvalidated | error"
  notes: "observações adicionais — ex: encoding detectado, campos ausentes"
```

### 6.4 Parser Governance

| Regra | Especificação |
|---|---|
| `parser_version_required` | Toda saída de parser deve declarar sua versão |
| `parser_output_never_replaces_raw` | Output processado é adicional — raw é preservado |
| `parser_confidence_required` | Campo `confidence: high | medium | low | unknown` em todo campo extraído |
| `uncertain_fields_null_pending` | Campo com confiança baixa fica `null` ou `pending` — nunca inventado |
| `parser_cannot_declare_vigency` | Parser detecta texto e metadados; vigência é domínio humano |
| `amendment_detection_is_indicative` | detected_amendments são pistas — não verdades confirmadas |
| `revocation_detection_is_indicative` | detected_revocations são pistas — não verdades confirmadas |

### 6.5 Validation States

```yaml
validation_states:
  planned_only:
    description: "Conector apenas especificado — sem fetch realizado"
    transition: "→ fetched_unvalidated após primeiro fetch bem-sucedido"
  fetched_unvalidated:
    description: "Conteúdo capturado com checksum — não processado por parser"
    legal_use: proibido
    transition: "→ parsed_unvalidated após execução do parser"
  parsed_unvalidated:
    description: "Metadados extraídos pelo parser — não revisados por humano"
    legal_use: proibido
    transition: "→ human_review_required quando agendado para revisão"
  human_review_required:
    description: "Parser concluiu; campos pendentes aguardam revisão"
    legal_use: proibido
    transition: "→ validated_snapshot após revisão humana aprovada"
  validated_snapshot:
    description: "Conteúdo revisado por humano; pode ser usado como referência com caveats"
    legal_use: referencial_com_caveats_obrigatorios
    transition: "→ deprecated_snapshot se nova versão for capturada"
  deprecated_snapshot:
    description: "Snapshot substituído por versão mais recente"
    legal_use: proibido
    notes: "Preservado para auditoria; não usar em análise"
  conflict_detected:
    description: "Checksum diverge de snapshot anterior — possível alteração de conteúdo"
    legal_use: proibido
    transition: "→ human_review_required para resolução"
```

### 6.6 Legal Firewall

O conector é uma **ferramenta de localização e organização de fonte** — não uma ferramenta jurídica.

```
O conector:
  ✓ localiza texto em fonte oficial
  ✓ extrai metadados básicos
  ✓ armazena snapshot imutável com checksum
  ✓ registra log de acesso
  ✓ marca status de validação

O conector NÃO:
  ✗ aconselha juridicamente
  ✗ decide vigência
  ✗ calcula prazo
  ✗ transforma texto em estratégia
  ✗ produz peça
  ✗ substitui validação humana
  ✗ confirma interpretação de norma
  ✗ aplica jurisprudência a fato concreto
```

---

## 7. Connector Promotion Criteria

Critérios mínimos para uma iteração futura transformar `planned_only` em `candidate_connector`:

| Critério | Descrição | Obrigatório |
|---|---|---|
| Documentação revisada | Documentação oficial da fonte lida e registrada | ✓ |
| robots.txt revisado | Arquivo robots.txt verificado e registrado | ✓ |
| Termos de Uso revisados | ToS lidos; restrições de uso programático identificadas | ✓ |
| Política de cache definida | TTL, invalidação e mutabilidade do raw definidos | ✓ |
| Schema de snapshot definido | Campos obrigatórios e tipos definidos em schema formal | ✓ |
| Logs definidos | Campos de log implementados e testados em dry-run | ✓ |
| Rate limiting definido e ativo | Intervalo mínimo, backoff e budget diário implementados | ✓ |
| Parser planejado | Tipo de parser, versão, campos e confiança definidos | ✓ |
| Plano de rollback | Como desfazer a implementação sem dano a dados existentes | ✓ |
| Testes dry-run definidos | Suite de testes de parse sem fetch real aprovada | ✓ |
| Firewall jurídico mantido | Validação de que conector não emite orientação jurídica | ✓ |

**Mesmo após promoção para `candidate_connector`:**

```
active permanece: false
operational_authority permanece: none
uso jurídico operacional continua: proibido
ingestão em RAG: requer aprovação explícita adicional
```

A promoção para `active` é um evento separado que requer:
- QA técnica do conector
- QA jurídica do conteúdo ingerido
- Aprovação explícita do operador primário
- Pacote de uso monitorado (USE_MONITORED.md equivalente)

---

## 8. Future Minimal Schemas — Design Only

> **Atenção:** Estes são apenas desenhos textuais de schemas futuros.
> Nenhum arquivo de schema real é criado nesta iteração.
> Implementação requer aprovação do operador primário em iteração separada.

### 8.1 legal_source_snapshot

```
schema_name: legal_source_snapshot
purpose: "Registro imutável de conteúdo capturado de fonte oficial"

fields:
  snapshot_id:       UUID v4 — gerado na captura
  connector_id:      CONN-001 | CONN-002 | ...
  source_id:         SRC-001 | SRC-002 | ...
  source_url:        URL exata consultada
  fetched_at:        ISO 8601 datetime com timezone — obrigatório
  raw_content_path:  Caminho local do arquivo bruto — imutável após criação
  raw_checksum:      SHA-256 do conteúdo bruto — obrigatório
  content_type:      html | xml | pdf | json
  parser_version:    null | "vX.Y" — preenchido após parse
  validation_status: planned_only | fetched_unvalidated | parsed_unvalidated |
                     human_review_required | validated_snapshot |
                     deprecated_snapshot | conflict_detected

constraints:
  - raw_content_path é imutável após criação
  - raw_checksum é imutável após criação
  - validation_status segue máquina de estados da §6.5
  - snapshot não pode ser excluído — apenas deprecated
```

### 8.2 legal_source_metadata

```
schema_name: legal_source_metadata
purpose: "Metadados extraídos pelo parser a partir de um snapshot"

fields:
  metadata_id:       UUID v4
  snapshot_id:       FK → legal_source_snapshot.snapshot_id
  norm_type:         lei_ordinaria | lei_complementar | decreto | decreto_lei |
                     emenda_constitucional | mp | portaria | acordao | sumula |
                     pl | doutrina | outro
  norm_number:       string | null — número da norma
  norm_year:         integer | null — ano
  title:             string | null — ementa ou título
  issuing_body:      string | null — órgão emissor
  published_at:      date | null — data de publicação
  effective_date:    date | null — data de vigência (null se não detectada)
  revoked_status:    active | revoked | partially_revoked | unknown
  amended_by:        array[string] | null — normas alteradoras detectadas
  authority_level:   primary | secondary | auxiliary | unknown
  stale_risk:        low | medium | high | critical
  parser_confidence: high | medium | low | unknown — por campo

constraints:
  - Campos com parser_confidence:low ficam null/pending — nunca inventados
  - revoked_status:unknown é o padrão — active exige confirmação humana
  - amended_by é lista de pistas detectadas — não verdades confirmadas
  - metadata não substitui validação humana para uso jurídico
```

### 8.3 legal_connector_log

```
schema_name: legal_connector_log
purpose: "Registro de auditoria de toda operação de conector"

fields:
  log_id:          UUID v4
  connector_id:    CONN-001 | CONN-002 | ...
  operation:       search | fetch | parse | validate | rollback | error
  timestamp:       ISO 8601 datetime com timezone
  status:          success | partial | error | rate_limited | parse_failed
  error_code:      null | HTTP status | código interno
  notes:           string — observações livres; encoding detectado; campos ausentes; etc.

constraints:
  - Logs são imutáveis — apenas append
  - Erro não apaga log anterior
  - Rollback gera novo registro — não modifica o original
  - Retidos por mínimo de 90 dias após último uso do snapshot relacionado
```

---

## 9. Recommended Next Iterations

| Iteração | Descrição | Pré-requisito |
|---|---|---|
| **8.4C** | Terms/robots review checklist — leitura documentada de robots.txt e ToS do Planalto e LexML, sem acesso a dados | Aprovação do operador primário |
| **8.5** | Snapshot schema design — criar arquivos de schema formais (YAML/JSON) para os três schemas desta seção | 8.4C concluída |
| **8.6** | Dry-run connector harness — testes de parse com HTML/XML de exemplo offline, sem fetch real | 8.5 concluída |
| **8.7** | Single-document fetch sandbox — primeiro fetch controlado de um documento público, não-operacional, com revisão humana | 8.6 concluída + aprovação explícita do operador |
| **8.8** | Seed corpus ingestion plan — planejar ingestão dos 38 itens do LEGAL_SEED_CORPUS_MANIFEST.yaml em ordem de prioridade | 8.7 aprovado |

---

## 10. Result

```yaml
iteration: "8.4B"
iteration_status: completed
connector_preflight_status: design_only
connectors_designed: 2
  - CONN-001: Planalto — planned_only
  - CONN-002: LexML — planned_only
connectors_implemented: 0
connectors_active: 0
APIs_consulted: 0
legal_documents_ingested: 0
RAG_updates: 0
embeddings_created: 0
agent_activation: unchanged
active: false
operational_authority: none
status: draft
version: "0.1-draft"
event: "EVT-20260610-048"
next_eligible_iteration:
  primary: "8.4C — Terms/robots review checklist for Planalto and LexML"
  alternative: "8.5 — Snapshot schema design"
```

---

*Gerado em Iteração 8.4B — EVT-20260610-048. status:draft / active:false / operational_authority:none.*
