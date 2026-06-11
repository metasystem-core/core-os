---
document_id: LEGAL_SOURCE_CONNECTORS_SPEC
agent: legal-agent
version: "0.1"
status: planned_only
created: "2026-06-10"
iteration: "8.2B"
event: "EVT-20260610-045"
active: false
operational_authority: none
---

# LEGAL SOURCE CONNECTORS SPEC — Especificação de Conectores de Fontes

> **INVARIANTE ABSOLUTO:** Este documento especifica conectores **futuros** — nenhum conector está implementado, nenhuma API está ativa, nenhuma consulta foi realizada.
>
> **CONECTOR PLANEJADO ≠ CONSULTA ATIVA**
> **ESPECIFICAÇÃO ≠ IMPLEMENTAÇÃO**
> **ACESSO PREVISTO ≠ ACESSO AUTORIZADO**

---

## 1. Declaração de Status Global

```yaml
status: planned_only
connectors_implemented: 0
connectors_active: 0
data_fetched: false
implementation_iteration: pendente — requer aprovação do operador primário
```

Conectores devem ser implementados em **iteração futura separada**, com:
- Aprovação explícita do operador primário
- Análise de termos de uso de cada fonte
- Implementação de rate limiting, cache e identificação de origem
- Testes em ambiente isolado antes de uso operacional
- Revisão por `fw-governor` antes de ativação

---

## 2. Política de Scraping

O legal-agent pode realizar scraping de conteúdo web **somente** se todas as seguintes condições forem simultaneamente satisfeitas:

| Condição | Obrigatório |
|---|---|
| Fonte é pública (sem login, sem paywall) | ✓ Obrigatório |
| Não há proibição conhecida em robots.txt | ✓ Obrigatório |
| Não há proibição em Termos de Uso da fonte | ✓ Obrigatório |
| Conteúdo não está por trás de captcha | ✓ Obrigatório |
| Não há burla de autenticação | ✓ Obrigatório |
| Há cache local do conteúdo (evitar re-fetch desnecessário) | ✓ Obrigatório |
| Há identificação clara da origem no output | ✓ Obrigatório |
| Há rate limiting respeitoso (mínimo 2s entre requests) | ✓ Obrigatório |
| Conteúdo é somente para uso analítico interno | ✓ Obrigatório |

**Proibido:**
- Scraping de sites com paywall ou conteúdo premium (ex: LexMagister, Thomson Reuters)
- Burla de autenticação ou captcha
- Scraping agressivo sem rate limiting
- Redistribuição de conteúdo copiado como se fosse produção própria
- Uso de proxy para contornar restrição de IP

---

## 3. Especificação por Conector

### CONN-001 — Planalto / Portal da Legislação

```yaml
connector_id: CONN-001
source_id: SRC-001
nome: "Planalto — Portal da Legislação"
connector_status: planned
access_type: html_fetch
auth_required: false
rate_limit_unknown: true
rate_limit_estimated: "moderado — páginas pesadas"
parser_required: true
parser_notes: "HTML variável por lei; estrutura de artigos e parágrafos não padronizada entre normas"
ssl: true
robots_txt_check: obrigatório antes de implementação
cache_required: true
cache_ttl_suggested: "24h para normas codificadas; 1h para regulamentos"
legal_risk: medium
legal_risk_notes: "Planalto é fonte oficial pública. Risco de ToS: baixo. Risco de formato: alto — parsing frágil."
implementation_priority: P1
notes: >
  Principal fonte de texto consolidado de leis federais.
  Verificar se há versão LexML (CONN-002) disponível antes de parsear HTML do Planalto.
  HTML do Planalto foi modificado múltiplas vezes — parser precisa ser robusto a mudanças de layout.
```

---

### CONN-002 — LexML Brasil

```yaml
connector_id: CONN-002
source_id: SRC-002
nome: "LexML Brasil — XML-SRU"
connector_status: planned
access_type: xml_sru
auth_required: false
rate_limit_unknown: false
rate_limit_documented: "ver documentação LexML"
rate_limit_estimated: "baixo volume; API pública"
parser_required: true
parser_notes: "XML no padrão LexML (baseado em Akoma Ntoso). Parser estruturado disponível em padrão aberto."
ssl: true
robots_txt_check: não aplicável (API)
cache_required: true
cache_ttl_suggested: "48h — texto normativo muda com baixa frequência"
legal_risk: low
legal_risk_notes: "API oficial pública com padrão aberto. Risco jurídico mínimo."
implementation_priority: P1
notes: >
  Melhor opção para ingestão estruturada de leis federais.
  Preferir LexML sobre Planalto para parsing automatizado — estrutura XML é mais estável.
  Verificar cobertura: nem todas as normas estão indexadas no LexML.
```

---

### CONN-003 — Senado Federal Dados Abertos

```yaml
connector_id: CONN-003
source_id: SRC-003
nome: "Senado Federal — API de Dados Abertos"
connector_status: planned
access_type: api
api_type: REST
api_doc_planned: "https://legis.senado.leg.br/dadosabertos/docs/"
auth_required: false
rate_limit_unknown: false
rate_limit_documented: "ver documentação da API"
parser_required: false
response_format: JSON / XML
ssl: true
cache_required: true
cache_ttl_suggested: "24h para dados legislativos"
legal_risk: low
legal_risk_notes: "API oficial pública de dados abertos. Risco mínimo."
implementation_priority: P2
notes: >
  Fonte para histórico legislativo, votações, autoria de PLs.
  NÃO usar como fonte de texto consolidado de lei — cruzar sempre com SRC-001 ou SRC-002.
```

---

### CONN-004 — Câmara dos Deputados Dados Abertos

```yaml
connector_id: CONN-004
source_id: SRC-004
nome: "Câmara dos Deputados — API de Dados Abertos"
connector_status: planned
access_type: api
api_type: REST
api_doc_planned: "https://dadosabertos.camara.leg.br/swagger/api.html"
auth_required: false
rate_limit_unknown: false
rate_limit_documented: "ver documentação da API"
parser_required: false
response_format: JSON
ssl: true
cache_required: true
cache_ttl_suggested: "24h"
legal_risk: low
implementation_priority: P2
notes: >
  Tramitação de PLs, votações, autoria, comissões.
  Mesmo aviso do Senado: não usar como fonte de texto de lei vigente.
```

---

### CONN-005 — CNJ DataJud

```yaml
connector_id: CONN-005
source_id: SRC-005
nome: "CNJ DataJud — API de Dados Processuais"
connector_status: planned
access_type: api
api_type: Elasticsearch / REST
api_doc_planned: "https://datajud-wiki.cnj.jus.br/"
auth_required: true
auth_type: "token — cadastro no CNJ"
rate_limit_unknown: false
rate_limit_estimated: "moderate — verificar quotas"
parser_required: false
response_format: JSON
ssl: true
cache_required: true
cache_ttl_suggested: "1h — dados processuais mudam com frequência"
legal_risk: medium
legal_risk_notes: >
  Dados processuais são públicos mas sensíveis. Obrigado a:
  1) não expor dados pessoais de partes além do necessário;
  2) cumprir LGPD no armazenamento;
  3) não usar para finalidade diversa de análise interna do operador.
implementation_priority: P2
notes: >
  Metadados de andamento processual por número de processo e tribunal.
  ANDAMENTO ≠ TEOR DA DECISÃO — DataJud não fornece texto completo de decisões.
  Requer cadastro e autenticação — implementação precisa de credencial do operador.
```

---

### CONN-006 — STJ Jurisprudência

```yaml
connector_id: CONN-006
source_id: SRC-006
nome: "STJ — Jurisprudência e Dados Abertos"
connector_status: planned
access_type: html_fetch
alt_access_type: api
api_notes: "API de dados abertos do STJ — verificar disponibilidade atual"
api_doc_planned: "https://www.stj.jus.br/sites/portalp/Paginas/Comunicacao/Noticias/28042022-STJ-abre-base-de-jurisprudencia-para-consumo-por-meio-de-API.aspx"
auth_required: false
rate_limit_unknown: true
parser_required: true
parser_notes: "Ementa + relator + data + turma obrigatórios no output"
ssl: true
cache_required: true
cache_ttl_suggested: "24h — jurisprudência não muda diariamente mas overruling pode ocorrer"
legal_risk: low
legal_risk_notes: "Conteúdo judicial público. Uso para pesquisa é permitido."
implementation_priority: P1
notes: >
  Precedentes vinculantes (recursos repetitivos) e súmulas têm maior peso.
  Sempre incluir: número do recurso, turma, relator, data do julgamento.
  HIPÓTESE JURÍDICA SUSTENTADA ≠ TESE VALIDADA.
```

---

### CONN-007 — STF Jurisprudência e Súmulas Vinculantes

```yaml
connector_id: CONN-007
source_id: SRC-007
nome: "STF — Jurisprudência, Súmulas Vinculantes, Portal"
connector_status: planned
access_type: html_fetch
auth_required: false
rate_limit_unknown: true
parser_required: true
parser_notes: "Estrutura HTML do STF é complexa e muda; súmulas vinculantes têm página própria"
ssl: true
cache_required: true
cache_ttl_suggested: "24h"
legal_risk: low
implementation_priority: P1
notes: >
  Fonte futura — prioridade P1 para súmulas vinculantes.
  ADI, ADC, ADPF, RE com repercussão geral — textos frequentemente em PDF.
  Parser de PDF necessário para decisões completas.
  Verificar cancelamento de súmulas antes de qualquer uso.
```

---

### CONN-008 — DOU / Imprensa Nacional

```yaml
connector_id: CONN-008
source_id: SRC-008
nome: "Diário Oficial da União — API IN"
connector_status: planned
access_type: api
api_type: REST
api_doc_planned: "https://www.in.gov.br/acesso-a-informacao/dados-abertos/api"
auth_required: false
rate_limit_unknown: false
rate_limit_documented: "ver documentação da API"
parser_required: false
response_format: JSON
ssl: true
cache_required: true
cache_ttl_suggested: "24h por edição"
legal_risk: low
implementation_priority: P2
notes: >
  Busca por publicações no DOU por data, seção e palavra-chave.
  Usar para confirmar data de publicação de norma — não para obter texto consolidado.
  PUBLICAÇÃO ≠ TEXTO COMPILADO VIGENTE.
```

---

### CONN-009 — Tribunais Regionais (TRTs, TRFs, TJs)

```yaml
connector_id: CONN-009
source_id: SRC-009
nome: "Tribunais Regionais — múltiplos"
connector_status: planned
access_type: variável por tribunal
auth_required: variável
rate_limit_unknown: true
parser_required: true
parser_notes: "Alta heterogeneidade — cada tribunal tem sistema diferente (e-SAJ, PJe, PROJUDI, TJDFT etc.)"
ssl: variável
cache_required: true
legal_risk: high
legal_risk_notes: >
  Risco alto por heterogeneidade: scraping de tribunal pode:
  1) violar ToS específico de cada tribunal;
  2) expor dados processuais sensíveis;
  3) resultar em bloqueio de IP;
  4) violar LGPD se dados de partes forem armazenados.
implementation_priority: P3
notes: >
  Fonte futura — requer mapeamento individual por tribunal.
  Não implementar genérico — implementar conector específico por tribunal com análise de ToS prévia.
  Alternativa preferencial: CNJ DataJud (CONN-005) para metadados.
```

---

### CONN-010 — Jusbrasil (Auxiliar)

```yaml
connector_id: CONN-010
source_id: SRC-010
nome: "Jusbrasil"
connector_status: planned
access_type: html_fetch
auth_required: false (para conteúdo público)
rate_limit_unknown: true
parser_required: true
legal_risk: high
legal_risk_notes: >
  Portal privado com ToS que pode restringir scraping automatizado.
  Verificar ToS antes de qualquer implementação.
  Dados podem estar incompletos ou desatualizados.
  NUNCA usar como fonte jurídica final.
implementation_priority: Auxiliar (sem prioridade formal)
notes: >
  Uso APENAS como pista de localização — qualquer informação encontrada deve ser
  verificada em fonte oficial primária antes de uso.
  Implementar SOMENTE se ToS permitir e com identificação de origem.
  Considerar usar API oficial do Jusbrasil se disponível (verificar condições).
```

---

### CONN-011 a CONN-013 — Fontes Auxiliares Editoriais

```yaml
- connector_id: CONN-011
  source_id: SRC-011
  nome: "Escavador"
  connector_status: planned
  access_type: html_fetch
  legal_risk: high
  notes: "Ver CONN-010. Mesmas restrições. Uso apenas como pista."

- connector_id: CONN-012
  source_id: SRC-012
  nome: "Migalhas"
  connector_status: planned
  access_type: html_fetch
  legal_risk: medium
  notes: "Portal editorial — ToS provavelmente proíbe scraping. Verificar. Uso: acompanhar notícias legislativas, não fonte jurídica."

- connector_id: CONN-013
  source_id: SRC-013
  nome: "ConJur"
  connector_status: planned
  access_type: html_fetch
  legal_risk: medium
  notes: "Mesmo tratamento do Migalhas. Conteúdo doutrinário/editorial — nunca fonte de texto legal ou precedente."
```

---

## 4. Roadmap de Implementação

| Fase | Conectores | Pré-requisitos | Status |
|---|---|---|---|
| Fase 1 — Normas | CONN-001, CONN-002 | Aprovação do operador; análise de ToS; parser de HTML/XML | Planejado |
| Fase 2 — Jurisprudência | CONN-006, CONN-007 | Fase 1 concluída; parser de ementa/acórdão | Planejado |
| Fase 3 — Metadados | CONN-003, CONN-004, CONN-005, CONN-008 | Cadastro CNJ (CONN-005); Fase 1 concluída | Planejado |
| Fase 4 — Regional | CONN-009 | Mapeamento individual por tribunal; análise de ToS por tribunal | Planejado |
| Fase 5 — Auxiliar | CONN-010 a CONN-013 | Análise de ToS; somente se útil após Fases 1-3 | Planejado baixa prioridade |

**Nenhuma fase está ativa. Implementação requer aprovação explícita do operador primário.**

---

## 5. Infraestrutura Mínima Futura

Quando conectores forem implementados, a infraestrutura mínima necessária é:

| Componente | Função |
|---|---|
| Rate limiter | Respeitar limites de cada fonte |
| Cache local | Evitar re-fetch; registrar `fetched_at`; calcular stale_risk |
| Checksum | SHA-256 por documento coletado; detectar alteração de conteúdo |
| Log de acesso | Registrar: fonte, URL, timestamp, status HTTP, tamanho |
| Parser versionado | Versão do parser registrada em `parser_version` por documento |
| Identificação de origem | User-Agent identificável; contato disponível |

---

*Gerado em Iteração 8.2B — EVT-20260610-045. status:draft / active:false / operational_authority:none.*
