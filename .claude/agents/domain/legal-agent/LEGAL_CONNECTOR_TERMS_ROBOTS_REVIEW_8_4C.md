---
document_id: LEGAL_CONNECTOR_TERMS_ROBOTS_REVIEW_8_4C
agent: legal-agent
iteration: "8.4C"
event: "EVT-20260610-049"
date: "2026-06-10"
scope: governance_documents_only
connectors_reviewed: [CONN-001-Planalto, CONN-002-LexML]
legal_content_fetched: 0
legal_documents_ingested: 0
APIs_consulted_for_legal_data: 0
status: review_complete
---

# LEGAL CONNECTOR TERMS & ROBOTS REVIEW — Iteração 8.4C

> **STATUS: REVISÃO CONCLUÍDA — NENHUM CONECTOR ATIVADO.**
> Este documento registra a revisão de documentos de governança (robots.txt, termos de uso,
> documentação institucional) das fontes CONN-001 e CONN-002.
> Nenhum dado jurídico foi acessado. Nenhum conteúdo legal foi ingerido.
> Revisão de governança ≠ autorização de conector. Conector revisado ≠ conector ativo.

---

## §1. Metadados

| Campo | Valor |
|---|---|
| Documento | LEGAL_CONNECTOR_TERMS_ROBOTS_REVIEW_8_4C.md |
| Iteração | 8.4C |
| Evento | EVT-20260610-049 |
| Data | 2026-06-10 |
| Iniciado por | operador-primario |
| Escopo | Documentos de governança apenas — robots.txt, ToS, docs institucionais |
| Fontes revisadas | CONN-001 (Planalto), CONN-002 (LexML) |
| Dados jurídicos acessados | 0 |
| Conectores implementados | 0 |
| Conectores ativos | 0 |
| APIs consultadas para dados | 0 |
| Documentos jurídicos ingeridos | 0 |

---

## §2. Escopo e Propósito

Esta revisão tem por objetivo verificar, para cada conector especificado em `LEGAL_CONNECTOR_PREFLIGHT_8_4B.md`, as condições de acesso declaradas publicamente pelas fontes:

1. **robots.txt** — caminhos permitidos e proibidos para agentes automáticos
2. **Termos de uso** — proibições explícitas de acesso automatizado, redistribuição, raspagem
3. **Documentação institucional** — natureza do serviço, política pública declarada
4. **Endpoints verificáveis** — confirmação de que os endpoints documentados estão operacionais

**O que esta revisão NÃO faz:**
- Acessar dados jurídicos (legislação, jurisprudência, normas)
- Ingerir documentos legais
- Consultar APIs com dados de conteúdo
- Confirmar interpretação jurídica de qualquer natureza
- Substituir assessoria jurídica sobre termos de serviço ou propriedade intelectual

**Firewalls de escopo ativos durante toda a revisão:**
```
DOCUMENTO DE GOVERNANÇA ≠ DADO JURÍDICO
ROBOTS.TXT LIDO ≠ CONECTOR AUTORIZADO
AUSÊNCIA DE PROIBIÇÃO ≠ PERMISSÃO EXPLÍCITA
CRAWL-DELAY DECLARADO ≠ RATE LIMIT SUFICIENTE
ENDPOINT ACESSÍVEL ≠ CONECTOR IMPLEMENTADO
```

---

## §3. Nota de Governança

**Princípio de revisão:**
A ausência de proibição explícita em robots.txt ou termos de uso **não equivale a autorização**. Para conectores jurídicos de fontes governamentais brasileiras, os critérios de avanço exigem:

1. robots.txt lido e caminhos-alvo explicitamente permitidos ou não proibidos
2. Termos de uso lidos e sem vedação a acesso automatizado nas condições de uso pretendidas
3. Endpoints confirmados como operacionais
4. Rate limiting compatível com uso respeitoso da infraestrutura pública
5. Política de identificação de agente (User-Agent) definida

**Regra de bloqueio:**
Qualquer bloqueio ativo (socket-level, CAPTCHA, autenticação não documentada) impede a promoção do conector de `planned_only` para `candidate_connector`, independentemente de ausência formal de proibição em texto.

**Regra de revisão manual:**
Quando a situação de acesso não pode ser confirmada via revisão automatizada, a decisão de preflight é `unknown_requires_manual_review` ou `restricted_review_required`. Nenhum desses estados permite implementação de conector.

---

## §4. Inventário de Hosts e URLs

### 4.1 Hosts testados

| Host | Conector | Propósito | Resultado do acesso | Observação |
|---|---|---|---|---|
| `www.planalto.gov.br` | CONN-001 | robots.txt principal | FALHA — bloqueio de socket | Conexão TCP fechada antes de resposta HTTP |
| `www4.planalto.gov.br` | CONN-001 | Host alternativo | FALHA — bloqueio de socket | Mesmo comportamento do host principal |
| `www.gov.br/planalto` | CONN-001 | Portal institucional | FALHA — CAPTCHA detectado | Parede anti-bot ativa |
| `lexml.gov.br` | CONN-002 | Portal principal | SUCESSO — HTTP 200 | robots.txt obtido; página institucional disponível |
| `projeto.lexml.gov.br` | CONN-002 | FAQ / documentação | SUCESSO — HTTP 200 | FAQ disponível; termos de uso não localizados |
| `dados.gov.br` | CONN-002 | API CKAN open data | FALHA — HTTP 401 | API requer autenticação (inesperado para portal open data) |
| `dadosabertos.senado.leg.br` | CONN-002 | Senado open data | SUCESSO | Política open data confirmada |

### 4.2 URLs específicas verificadas

| URL | Status | Resultado |
|---|---|---|
| `http://www.planalto.gov.br/robots.txt` | FALHA | Socket fechado ativamente pelo servidor |
| `http://www4.planalto.gov.br/robots.txt` | FALHA | Socket fechado ativamente pelo servidor |
| `https://www.gov.br/planalto` | FALHA | CAPTCHA / anti-bot detectado |
| `https://www.lexml.gov.br/robots.txt` | SUCESSO | Robots.txt obtido e analisado |
| `https://www.lexml.gov.br/` | SUCESSO | Página institucional disponível |
| `https://www.lexml.gov.br/sobre` | FALHA | HTTP 404 |
| `https://www.lexml.gov.br/faq` | FALHA | HTTP 404 |
| `https://www.lexml.gov.br/termosDeUso` | FALHA | HTTP 404 |
| `https://www.lexml.gov.br/busca/SRU?operation=explain&version=1.1` | FALHA | HTTP 404 |
| `https://projeto.lexml.gov.br/faq` | SUCESSO | FAQ disponível sem termos formalizados |
| `https://dados.gov.br/api/3/action/package_list` | FALHA | HTTP 401 — autenticação exigida |
| `https://dadosabertos.senado.leg.br/` | SUCESSO | Open data policy confirmada |

---

## §5. CONN-001 — Planalto Review

### 5.1 Identificação

| Campo | Valor |
|---|---|
| Conector ID | CONN-001 |
| Fonte | Planalto — legislação federal brasileira |
| URL base planejada | `http://www.planalto.gov.br` |
| Tipo de acesso planejado | html_fetch (conforme LEGAL_CONNECTOR_PREFLIGHT_8_4B.md) |
| Nível de autoridade (SRC-001) | Nível 1 — máxima autoridade |

### 5.2 Revisão do robots.txt

| Item | Resultado |
|---|---|
| URL tentada | `http://www.planalto.gov.br/robots.txt` |
| Status HTTP | Indisponível — bloqueio de socket ativo |
| Comportamento observado | Servidor fecha conexão TCP antes de retornar qualquer resposta HTTP |
| Host alternativo (www4) | Mesmo comportamento — bloqueio de socket idêntico |
| Conclusão | **robots.txt não obtido — impossível confirmar caminhos permitidos ou proibidos** |

**Diagnóstico técnico:** O servidor `www.planalto.gov.br` implementa bloqueio ativo de conexões de clientes automatizados ao nível de transporte (TCP). Isso é mais restritivo do que um `Disallow: /` em robots.txt — é bloqueio de infraestrutura, não de política declarada.

### 5.3 Revisão dos Termos de Uso

| Item | Resultado |
|---|---|
| URL tentada | Via `www.gov.br/planalto` |
| Status | CAPTCHA / parede anti-bot detectada |
| Termos de uso localizados | Não |
| Política explícita de redistribuição | Não encontrada nesta revisão |

**Nota:** A ausência de termos de uso localizados não significa ausência de restrição. Para fonte governamental de nível máximo de autoridade, a não confirmação é interpretada como risco alto.

### 5.4 Status do Endpoint SRU / API

| Item | Resultado |
|---|---|
| API documentada | Não confirmada nesta revisão |
| Acesso HTML direto | Bloqueado (socket-level) |
| Acesso via portal gov.br | Bloqueado (CAPTCHA) |
| Alternativa identificada | Não — requer investigação institucional |

### 5.5 Avaliação de Risco

| Dimensão | Avaliação |
|---|---|
| Acessibilidade a clientes automáticos | **BLOQUEADA** — socket-level block ativo |
| Robots.txt confirmado | **NÃO** |
| Termos de uso lidos | **NÃO** |
| Endpoints operacionais confirmados | **NÃO** |
| Risco de bloqueio permanente | **ALTO** |
| Risco de interpretação jurídica dos ToS | **INDETERMINADO** |
| Risk_level | **high** |

### 5.6 Achados Específicos

1. **Bloqueio de socket ativo:** Tanto `www.planalto.gov.br` quanto `www4.planalto.gov.br` fecham conexões TCP antes de qualquer resposta HTTP. Esse comportamento indica filtragem ativa por IP de data center ou por User-Agent a nível de infraestrutura (firewall de rede ou middleware de proxy reverso).

2. **CAPTCHA no portal gov.br:** `www.gov.br/planalto` retorna desafio anti-bot, confirmando que o acesso automatizado é ativamente resistido em múltiplos pontos de entrada.

3. **Acesso institucional pode ser necessário:** A fonte pode ter API ou protocolo de acesso dedicado para integração institucional não documentado publicamente. Isso requer investigação fora do escopo desta revisão automatizada.

4. **Conteúdo via espelhos:** Parte do conteúdo do Planalto pode estar disponível via LexML (CONN-002) ou Senado (CONN-003), o que pode ser alternativa arquitetural ao acesso direto ao CONN-001.

### 5.7 Decisão de Preflight

```
CONN-001 Planalto: unknown_requires_manual_review
```

**Rationale:** Impossível determinar condições de acesso automatizado. Bloqueio de socket ativo impede qualquer confirmação. Implementação de conector proibida até:
- Verificação manual via navegador humano das políticas publicadas
- Confirmação de existência e condições de API institucional (se houver)
- Avaliação por assessoria jurídica especializada sobre redistribuição de conteúdo legislativo
- OU migração para fontes espelho confirmadas (LexML, Senado)

---

## §6. CONN-002 — LexML Review

### 6.1 Identificação

| Campo | Valor |
|---|---|
| Conector ID | CONN-002 |
| Fonte | LexML — metadados e identificadores de legislação federal |
| URL base planejada | `https://www.lexml.gov.br` |
| Tipo de acesso planejado | xml_sru (conforme LEGAL_CONNECTOR_PREFLIGHT_8_4B.md) |
| Nível de autoridade (SRC-002) | Nível 2 — alta autoridade (metadados, não texto) |

### 6.2 Revisão do robots.txt

**robots.txt obtido com sucesso. Conteúdo relevante:**

```
User-agent: *
Disallow: /busca/
Disallow: /doc/
Disallow: /linker/

Crawl-delay: 5

User-agent: python-requests
Disallow: /
```

| Item | Resultado |
|---|---|
| URL | `https://www.lexml.gov.br/robots.txt` |
| Status HTTP | 200 — arquivo obtido com sucesso |
| Caminho `/sru` | **Permitido** — não listado em `Disallow` |
| Caminho `/urn` | **Permitido** — não listado em `Disallow` |
| Caminho `/busca/` | **Proibido** — `Disallow: /busca/` |
| Caminho `/doc/` | **Proibido** — `Disallow: /doc/` |
| Caminho `/linker/` | **Proibido** — `Disallow: /linker/` |
| Crawl-delay declarado | **5 segundos** |
| python-requests bloqueado | **SIM** — `Disallow: /` para `User-agent: python-requests` |

**Achado crítico:** `python-requests` está explicitamente bloqueado por nome. Qualquer implementação de conector baseada na biblioteca `requests` (Python) será interpretada como não respeitosa do robots.txt. A implementação futura deve usar User-Agent diferente que não se identifique como `python-requests`.

### 6.3 Revisão dos Termos de Uso

| URL tentada | Status | Resultado |
|---|---|---|
| `https://www.lexml.gov.br/sobre` | HTTP 404 | Não encontrado |
| `https://www.lexml.gov.br/faq` | HTTP 404 | Não encontrado |
| `https://www.lexml.gov.br/termosDeUso` | HTTP 404 | Não encontrado |
| `https://projeto.lexml.gov.br/faq` | HTTP 200 | FAQ disponível — sem termos formais |

**Conclusão:** LexML não publica termos de uso formais em URL acessível. O FAQ do projeto confirma a natureza pública do serviço como aggregador de metadados de legislação, mas não documenta explicitamente as condições de uso automatizado além do robots.txt.

### 6.4 Verificação do Endpoint SRU

| Endpoint testado | Status | Resultado |
|---|---|---|
| `/busca/SRU?operation=explain&version=1.1` | HTTP 404 | Não encontrado |
| Variantes de path testadas | Múltiplas | Todas 404 |

**Achado:** O endpoint SRU documentado (`/busca/SRU`) está listado em `Disallow: /busca/` no robots.txt. Além de proibido pelo robots.txt, o endpoint retornou 404 em todos os testes — indicando que a documentação oficial do serviço SRU pode estar desatualizada ou o serviço migrou para outro path.

**Contradição identificada:** O robots.txt permite `/sru` (sem prefixo `/busca/`), mas o path documentado na especificação oficial é `/busca/SRU`. Os dois paths são diferentes. O path permitido (`/sru`) pode corresponder a um endpoint diferente não documentado, ou pode ser placeholder. Requer verificação manual.

### 6.5 Revisão Institucional

| Item | Resultado |
|---|---|
| Natureza do serviço | Aggregador de metadados — não hospeda textos completos |
| Fonte primária de textos | Redireciona para fonte original (Planalto, Diário Oficial, etc.) |
| Política open data | Confirma acesso público — sem termos formais de uso automatizado |
| dados.gov.br (CKAN) | HTTP 401 — autenticação requerida (inesperado para CKAN padrão) |
| Senado dados-abertos | Política open data confirmada — alternativa para dados parlamentares |

### 6.6 Avaliação de Risco

| Dimensão | Avaliação |
|---|---|
| Acessibilidade a clientes automáticos | **PARCIAL** — `/sru` e `/urn` permitidos pelo robots.txt |
| Robots.txt confirmado | **SIM** — obtido e analisado |
| Termos de uso lidos | **NÃO** — não publicados em URL acessível |
| Endpoints operacionais confirmados | **NÃO** — endpoint SRU documentado retorna 404 |
| python-requests bloqueado | **SIM** — bloqueio explícito por User-Agent |
| Risk_level | **medium** |

### 6.7 Achados Específicos

1. **robots.txt claro e obtido:** LexML tem robots.txt explícito. Os caminhos `/sru` e `/urn` não estão proibidos. Crawl-delay de 5s é razoável para uso respeitoso.

2. **python-requests explicitamente bloqueado:** O conector futuro deve declarar User-Agent customizado que identifique o sistema (ex.: `CORE-OS-LegalConnector/0.1 (+contact)`) e não use o User-Agent padrão da biblioteca `requests`.

3. **Endpoint SRU inconsistente:** Path documentado (`/busca/SRU`) está tanto proibido no robots.txt quanto indisponível (404). Path permitido (`/sru`) não é o caminho documentado. Resolve via investigação manual do endpoint correto.

4. **Termos de uso ausentes publicamente:** Sem termos formais, o uso é regido implicitamente pelo robots.txt e pela política open data do governo federal. Não há vedação explícita encontrada, mas também não há autorização explícita.

5. **LexML como aggregador:** A natureza de aggregador de metadados (não hospedeiro de texto completo) reduz risco de violação de direitos autorais — LexML não é o autor do conteúdo, apenas o indexador de referências.

### 6.8 Decisão de Preflight

```
CONN-002 LexML: restricted_review_required
```

**Rationale:** robots.txt permite `/sru` e `/urn`, mas o endpoint SRU documentado está inacessível e python-requests está explicitamente bloqueado. Termos de uso formais ausentes. Implementação de conector requer:
- Verificação manual do endpoint SRU operacional atual
- Definição de User-Agent customizado (não python-requests)
- Conformidade com Crawl-delay mínimo de 5 segundos
- OU contato institucional com equipe LexML para confirmar uso e endpoint

---

## §7. Classificação de Risco

| Conector | Fonte | robots.txt | ToS | Endpoint | Bloqueio Ativo | Risk Level | Decisão |
|---|---|---|---|---|---|---|---|
| CONN-001 | Planalto | Não obtido | Não lido | Não confirmado | Sim (socket-level + CAPTCHA) | **HIGH** | unknown_requires_manual_review |
| CONN-002 | LexML | Obtido — /sru permitido | Não publicado | SRU 404 | Parcial (python-requests bloqueado) | **MEDIUM** | restricted_review_required |

### 7.1 Definição dos níveis

| Nível | Critério |
|---|---|
| **LOW** | robots.txt permite, ToS permite, endpoint confirmado, nenhum bloqueio ativo |
| **MEDIUM** | robots.txt permite caminhos parcialmente; ToS ausente; endpoint com incerteza; bloqueio por User-Agent |
| **HIGH** | robots.txt não obtido; bloqueio de infraestrutura ativo; acesso CAPTCHA; ToS desconhecido |
| **CRITICAL** | Proibição explícita em robots.txt ou ToS; bloqueio total confirmado; conteúdo protegido |

### 7.2 Mapa de risco — achados específicos

| Achado | Conector | Tipo de Risco | Severidade |
|---|---|---|---|
| Bloqueio de socket em www.planalto.gov.br | CONN-001 | Infraestrutura — acesso inviável | Crítico para implementação |
| CAPTCHA em www.gov.br/planalto | CONN-001 | Anti-bot ativo | Alto |
| robots.txt não obtido (Planalto) | CONN-001 | Governança desconhecida | Alto |
| python-requests explicitamente bloqueado (LexML) | CONN-002 | User-Agent policy | Médio — mitigável |
| Endpoint SRU documentado em /busca/ (proibido por robots.txt) | CONN-002 | Path proibido + 404 | Médio — requer investigação |
| Termos de uso ausentes (LexML) | CONN-002 | Governança incompleta | Médio |
| dados.gov.br API com autenticação 401 | CONN-002 (auxiliar) | Acesso bloqueado | Médio |

---

## §8. Matriz de Decisão de Preflight

| Critério de Preflight | CONN-001 Planalto | CONN-002 LexML |
|---|---|---|
| 1. robots.txt obtido e analisado | ❌ FALHOU | ✅ Obtido |
| 2. Caminhos-alvo permitidos pelo robots.txt | ❌ Indeterminado | ⚠️ /sru permitido; /busca/ proibido |
| 3. Termos de uso lidos e sem vedação de acesso automatizado | ❌ Não lidos | ❌ Não publicados |
| 4. Endpoint principal confirmado operacional | ❌ Bloqueado | ❌ SRU 404 |
| 5. Nenhum bloqueio ativo de infraestrutura | ❌ Bloqueio socket + CAPTCHA | ⚠️ python-requests bloqueado |
| 6. Rate limiting compatível definido | ❌ Indeterminado | ⚠️ Crawl-delay 5s apenas |
| 7. User-Agent identificável definido | ❌ N/A (acesso bloqueado) | ❌ Não definido (não python-requests) |
| 8. Política open data ou equivalente confirmada | ❌ Não localizada | ⚠️ Implícita — sem documento formal |

**CONN-001:** 0/8 critérios satisfeitos → `unknown_requires_manual_review`
**CONN-002:** 1/8 critério plenamente satisfeito; 3/8 parcialmente; 4/8 não satisfeitos → `restricted_review_required`

### 8.1 Tabela de promoção

| Estado atual | Critérios satisfeitos | Próximo estado possível | Ação necessária |
|---|---|---|---|
| CONN-001: `planned_only` | 0/8 | Bloqueado | Investigação manual institucional |
| CONN-002: `planned_only` | 1 pleno + 3 parcial | `restricted_review_required` | Confirmação endpoint + User-Agent + ToS |

**Nenhum dos dois conectores avança para `candidate_connector` nesta iteração.**

---

## §9. Salvaguardas Requeridas

### 9.1 Salvaguardas obrigatórias antes de qualquer implementação

As salvaguardas abaixo são condições de pré-requisito para qualquer implementação futura. Nenhuma pode ser contornada.

| ID | Salvaguarda | Aplica-se a | Status |
|---|---|---|---|
| SAF-001 | robots.txt de CONN-001 obtido via acesso humano ou institucional | CONN-001 | Pendente |
| SAF-002 | Termos de uso de CONN-001 lidos e sem vedação de acesso automatizado | CONN-001 | Pendente |
| SAF-003 | Endpoint operacional de CONN-001 confirmado (URL + método) | CONN-001 | Pendente |
| SAF-004 | Alternativa arquitetural avaliada: LexML como espelho de CONN-001 | CONN-001 | Pendente |
| SAF-005 | Endpoint SRU operacional de CONN-002 confirmado (path correto) | CONN-002 | Pendente |
| SAF-006 | User-Agent customizado definido (não python-requests) para CONN-002 | CONN-002 | Pendente |
| SAF-007 | Crawl-delay mínimo de 5s implementado para CONN-002 | CONN-002 | Pendente |
| SAF-008 | Termos de uso de CONN-002 obtidos via contato institucional ou equivalente | CONN-002 | Pendente |
| SAF-009 | Política de cache e checksum implementada antes de qualquer fetch | Ambos | Pendente |
| SAF-010 | Sistema de logging com 12 campos obrigatórios implementado antes de qualquer fetch | Ambos | Pendente |
| SAF-011 | Aprovação explícita do operador primário para cada conector antes de ativação | Ambos | Pendente |

### 9.2 Salvaguardas específicas para CONN-002 (condições necessárias mas não suficientes)

Para que CONN-002 avance de `restricted_review_required` para `candidate_connector`:

1. **User-Agent:** Definir identificador customizado no formato `CORE-OS-LegalConnector/0.1 (+contact)` ou equivalente que não ative o bloqueio `python-requests`
2. **Endpoint:** Confirmar manualmente o path SRU operacional via teste em navegador ou via contato com equipe LexML
3. **Rate limiting:** Implementar delay de no mínimo 5 segundos por requisição (conforme Crawl-delay do robots.txt), com backoff progressivo em erros
4. **Caminhos proibidos:** Nunca acessar `/busca/`, `/doc/`, `/linker/` — apenas `/sru`, `/urn` e equivalentes permitidos
5. **Cache:** Toda resposta deve ser cacheada com checksum antes de qualquer parsing

### 9.3 Condição de bloqueio absoluto para CONN-001

Enquanto `www.planalto.gov.br` apresentar bloqueio de socket ativo para clientes automáticos, a implementação de CONN-001 como acesso direto está bloqueada. Alternativas arquiteturais a avaliar:

- **Opção A:** Verificar se LexML serve URNs que redirecionam para textos do Planalto (acesso intermediado)
- **Opção B:** Verificar se Senado `dadosabertos.senado.leg.br` espelha legislação federal com política open data confirmada
- **Opção C:** Contato institucional com Planalto para API dedicada (se existir)
- **Opção D:** Acesso manual exclusivo — CONN-001 como fonte de referência humana, não automatizada

---

## §10. Resultado da Revisão

### 10.1 Resumo executivo

| Item | Resultado |
|---|---|
| Iteração | 8.4C — concluída |
| Fontes revisadas | 2 (CONN-001, CONN-002) |
| Dados jurídicos acessados | 0 |
| Conectores implementados | 0 |
| Conectores ativados | 0 |
| Conectores que avançam para candidate_connector | 0 |

### 10.2 Estado final por conector

```
CONN-001 Planalto:
  preflight_decision: unknown_requires_manual_review
  robots_review: failed_socket_block
  terms_review: not_accessible
  endpoint_status: blocked
  implementation_status: blocked_pending_manual_investigation
  risk_level: high

CONN-002 LexML:
  preflight_decision: restricted_review_required
  robots_review: completed — /sru and /urn allowed; /busca/ prohibited; python-requests blocked
  terms_review: not_published
  endpoint_status: sru_documented_path_404 — path_conflict_with_robots
  implementation_status: blocked_pending_endpoint_confirmation_and_user_agent
  risk_level: medium
```

### 10.3 Invariantes reafirmados

```
REVISÃO DE GOVERNANÇA ≠ CONECTOR ATIVO
ROBOTS.TXT LIDO ≠ CONECTOR AUTORIZADO
AUSÊNCIA DE PROIBIÇÃO ≠ PERMISSÃO EXPLÍCITA
CONECTOR REVISADO ≠ CONECTOR IMPLEMENTADO
CONECTOR PLANEJADO ≠ CONSULTA ATIVA
DADO JURÍDICO INGERIDO: 0
NENHUMA API CONSULTADA PARA DADOS JURÍDICOS
```

### 10.4 Próximas ações autorizadas

As próximas ações não são ativas — são investigativas e dependem de aprovação do operador primário:

1. **[CONN-001]** Investigação manual via navegador humano de `robots.txt` e `ToS` de `www.planalto.gov.br`
2. **[CONN-001]** Avaliar alternativas arquiteturais (LexML como espelho, Senado como fonte alternativa)
3. **[CONN-002]** Confirmar manualmente o path SRU operacional atual
4. **[CONN-002]** Definir User-Agent customizado para uso futuro
5. **[Ambos]** Avaliar se a Iteração 8.5 deve avançar para schema design formal enquanto as pendências de governança são resolvidas

**Nenhuma dessas ações é executada nesta iteração.**

---

*Este documento registra revisão de documentos de governança executada em 2026-06-10.*
*Nenhum dado jurídico foi acessado. Nenhum conteúdo legal foi ingerido.*
*Conectores CONN-001 e CONN-002 permanecem em status: planned_only.*
*CONECTOR PLANEJADO ≠ CONSULTA ATIVA ≠ AGENTE ATIVO.*
