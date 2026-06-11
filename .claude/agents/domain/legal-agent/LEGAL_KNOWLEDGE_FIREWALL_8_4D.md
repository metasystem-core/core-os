---
document_id: LEGAL_KNOWLEDGE_FIREWALL_8_4D
agent: legal-agent
iteration: "8.4D"
event: "EVT-20260610-050"
date: "2026-06-10"
scope: policy_and_architecture_only
based_on: [LEGAL_CONNECTOR_TERMS_ROBOTS_REVIEW_8_4C.md, LEGAL_CONNECTOR_PREFLIGHT_8_4B.md, LEGAL_SOURCE_AUTHORITY_MATRIX.md, LEGAL_UPDATE_POLICY.md, LEGAL_CONFLICT_RESOLUTION_PROTOCOL.md]
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

# LEGAL KNOWLEDGE FIREWALL — Anti-Contamination Gate

> **STATUS: DOCUMENTADO — NÃO EXECUTADO OPERACIONALMENTE.**
> Este documento define a política de firewall de conhecimento jurídico do legal-agent.
> Nenhum dado jurídico foi acessado. Nenhum conteúdo foi ingerido. Nenhum RAG foi alimentado.
> FIREWALL DOCUMENTADO ≠ AGENTE ATIVO. POLÍTICA CRIADA ≠ CORPUS JURÍDICO EXISTENTE.

---

## §1. Purpose

O `legal-agent` opera em domínio de alto risco epistêmico. Uma norma desatualizada, uma jurisprudência mal localizada, um artigo sem fonte, uma resposta de LLM inventada ou um output de outro agente sem rastreabilidade podem ser tratados, erroneamente, como base jurídica — com consequências potencialmente graves para prazos processuais, estratégia, documentos e decisões.

O **Legal Knowledge Firewall** é a camada de controle que impede contaminação do `legal-agent` por conteúdo jurídico não validado, proveniente de qualquer origem — incluindo:

- **Scraping informal:** qualquer fetch de lei, acórdão, norma ou documento jurídico realizado sem cadeia de custódia, sem checksum, sem controle de versão e sem autoridade de fonte confirmada
- **Outputs de outros agentes:** todo conteúdo jurídico enviado por qualquer agente do sistema (rag-agent, doc-agent, norm-agent, simb-agent, intake-agent ou qualquer outro) sem proveniência oficial rastreável
- **Fontes auxiliares:** portais privados, agregadores, blogs, plataformas jurídicas comerciais (Jusbrasil, Escavador, ConJur, Migalhas e similares) — independentemente de quanto pareçam corretos
- **Conteúdo de usuário:** texto colado pelo operador sem indicação de fonte oficial, trecho de lei "copiado da internet", resumo feito por advogado, print de tela, áudio transcrito
- **Outputs de LLM:** qualquer texto gerado por modelo de linguagem (incluindo o próprio `legal-agent`) citando artigo, lei, prazo ou entendimento — sem referência oficial verificável e rastreável
- **OCR e extração de texto:** digitalização de documentos físicos sem validação contra original oficial
- **Páginas espelho, caches informais, agregadores:** mesmo que pareçam replicar conteúdo oficial, não possuem autoridade de proveniência por si mesmos
- **Conteúdo de conector com risco não resolvido:** especificamente, conteúdo que provenha de CONN-001 (Planalto) ou CONN-002 (LexML) enquanto esses permanecerem no estado herdado da Iteração 8.4C

**Regra-mãe permanente:**
```
O legal-agent só pode trabalhar com conhecimento jurídico validado
ou com fonte oficial rastreável e classificada.
```

**Invariantes absolutos deste documento:**
```
SCRAPED CONTENT ≠ LEGAL KNOWLEDGE
UNOFFICIAL SOURCE ≠ LEGAL AUTHORITY
OTHER AGENT OUTPUT ≠ LEGAL EVIDENCE
USER-PROVIDED TEXT ≠ VALIDATED LAW
ARTICLE/BLOG/NEWS ≠ NORMATIVE SOURCE
AGGREGATOR RESULT ≠ PRIMARY SOURCE
LLM SUMMARY ≠ LEGAL SOURCE
OCR/TEXT EXTRACTION ≠ VALIDATED DOCUMENT
METADATA FOUND ≠ LEGAL VALIDITY
SOURCE URL ≠ OFFICIAL PROVENANCE
OFFICIAL PROVENANCE ≠ OPERATIONAL LEGAL ADVICE
QUARANTINED CONTENT ≠ USABLE CORPUS
LEGAL-AGENT MEMORY ≠ LEGAL-AUTHORIZED MEMORY
CROSS-AGENT DATA ≠ TRUSTED INPUT
HIGH-RISK CONNECTOR ≠ APPROVED CONNECTOR
RESTRICTED REVIEW REQUIRED ≠ SAFE TO INGEST
MANUAL REVIEW REQUIRED ≠ AUTOMATED PERMISSION
RAG CONTENT ≠ VALIDATED LEGAL CORPUS
```

---

## §2. Post-8.4C Context

A Iteração 8.4C (`LEGAL_CONNECTOR_TERMS_ROBOTS_REVIEW_8_4C.md`, EVT-20260610-049) executou revisão de documentos de governança para CONN-001 e CONN-002. Os achados são herdados diretamente por este firewall como baseline de risco dos dois principais conectores planejados.

### 2.1 CONN-001 — Planalto

| Campo | Valor herdado |
|---|---|
| status | `unknown_requires_manual_review` |
| risk_level | `high` |
| robots.txt | Não obtido — bloqueio de socket ativo em www.planalto.gov.br e www4.planalto.gov.br |
| Termos de uso | Não lidos — não acessíveis por revisão automatizada |
| Endpoint | Bloqueado — CAPTCHA ativo em portal alternativo |
| Causa raiz | Servidor fecha conexão TCP antes de qualquer resposta HTTP |
| Efeito no firewall | Qualquer conteúdo proveniente do Planalto (direto ou via rota indireta) permanece bloqueado para ingestão |

### 2.2 CONN-002 — LexML

| Campo | Valor herdado |
|---|---|
| status | `restricted_review_required` |
| risk_level | `medium` |
| robots.txt | Obtido — `/sru` e `/urn` permitidos; `/busca/` proibido; Crawl-delay: 5s |
| Termos de uso | Não publicados em URL acessível |
| Endpoint SRU | `/busca/SRU` retorna 404 em todas as variantes; path proibido pelo robots.txt |
| python-requests | Explicitamente bloqueado por nome no robots.txt |
| Efeito no firewall | Conteúdo proveniente do LexML permanece restrito; nenhum dado de conteúdo jurídico pode ser ingerido enquanto o endpoint não for confirmado e o conector não for autorizado |

### 2.3 Conclusão da 8.4C para este firewall

- Nenhum conector está aprovado para ingestão de dados jurídicos
- Nenhum conector está ativo
- Nenhum dado jurídico foi acessado
- O firewall deve bloquear qualquer tentativa de contornar essas restrições por meio de outro agente, scraping informal ou ingestão indireta de fontes relacionadas a Planalto ou LexML

```
CONN-001 MANUAL REVIEW REQUIRED ≠ CONTEÚDO DO PLANALTO PODE ENTRAR
CONN-002 RESTRICTED REVIEW REQUIRED ≠ CONTEÚDO DO LEXML PODE ENTRAR
CONTORNO VIA OUTRO AGENTE ≠ AUTORIZAÇÃO DE ACESSO
```

---

## §3. Threat Model

Os seguintes vetores de contaminação são identificados e formalmente bloqueados por este firewall:

### 3.1 Vetores de Contaminação por Origem

| ID | Vetor | Mecanismo | Risco |
|---|---|---|---|
| THR-001 | Outro agente faz scraping de lei em site não oficial | norm-agent, rag-agent ou intake-agent captura texto de fonte não primária e envia ao legal-agent | ALTO — texto errado vira base jurídica |
| THR-002 | Outro agente tenta contornar CAPTCHA, bloqueio ou limitação | rag-agent usa headers alterados, VPN ou proxy para acessar fonte bloqueada | CRÍTICO — violação de termos; conteúdo inválido |
| THR-003 | Outro agente resume jurisprudência sem fonte oficial | simb-agent, doc-agent ou outro sintetiza decisão sem citar número, tribunal e data | ALTO — tese falsa ou desatualizada |
| THR-004 | Usuário cola artigo jurídico sem origem | Operador copia trecho de blog, Jusbrasil, ConJur ou similar sem indicar fonte primária | MÉDIO — pode ser correto, pode estar desatualizado |
| THR-005 | Usuário cola trecho de lei desatualizado | Operador coloca artigo de lei que foi emendado ou revogado | ALTO — norma revogada tratada como vigente |
| THR-006 | Scraping captura página espelho ou cache | Conteúdo de espelho desatualizado, fork ou site pirata apresentado como oficial | ALTO — versão inválida tratada como oficial |
| THR-007 | OCR altera texto de lei | Digitalização de documento físico introduz erro de caractere (ex.: "Art. 168" lido como "Art. 168-A") | CRÍTICO — artigo diferente, consequência diferente |
| THR-008 | LLM inventa artigo, número de lei ou entendimento | legal-agent ou outro modelo alucina referência jurídica | CRÍTICO — alucinação jurídica não detectada |
| THR-009 | Agregador apresenta decisão sem inteiro teor | Jusbrasil, Escavador ou similar apresenta ementa ou trecho — legal-agent usa como se fosse texto integral | ALTO — contexto decisório incompleto |
| THR-010 | Notícia jurídica vira falsa base normativa | Portal jurídico noticia decisão; legal-agent usa como se a decisão estivesse no corpus oficial | MÉDIO-ALTO — repercussão jornalística ≠ teor do acórdão |
| THR-011 | Doutrina vira orientação sem validação | Manual, artigo acadêmico ou comentário doutrinário usado como fundamento jurídico operacional | MÉDIO — doutrina é interpretação, não lei |
| THR-012 | Fonte oficial antiga confundida com vigente | Conteúdo do Planalto de versão anterior a emenda tratado como texto atual | ALTO — norma revogada/emendada ativa |
| THR-013 | Conteúdo sem checksum entra no corpus | Fetch sem hash de conteúdo — impossível detectar alteração posterior ou adulteração | ALTO — integridade não verificável |
| THR-014 | RAG mistura fonte oficial com fonte auxiliar | Índice de RAG sem particionamento agrega norma oficial e artigo de blog no mesmo corpus | CRÍTICO — hierarquia de autoridade destruída |
| THR-015 | legal-agent usa memória de outro agente como prova | Memória de simb-agent ou outro agente contendo texto jurídico informal usada como referência | ALTO — memória não é corpus oficial |
| THR-016 | Conteúdo de conector high-risk entra por rota indireta | CONN-001 bloqueado, mas outro agente acessa URL do Planalto diretamente e passa resultado | ALTO — status de risco contornado |
| THR-017 | Conteúdo de fonte restricted_review_required tratado como validado | LexML com review pendente, mas conteúdo promovido automaticamente para TRUST-3+ | ALTO — firewall de governança contornado |

---

## §4. Source Trust Classes

Toda informação jurídica que chegar ao `legal-agent` — de qualquer origem — deve ser classificada em uma das seguintes classes antes de qualquer uso.

---

### TRUST-0 — Rejected (Conteúdo Rejeitado)

**Definição:** Conteúdo que não possui origem rastreável suficiente para nenhuma utilização jurídica.

**Exemplos de conteúdo nesta classe:**
- Texto sem fonte indicada de qualquer tipo
- Output de LLM sem referência verificável (incluindo outputs do próprio `legal-agent`)
- Scraping sem URL ou sem fonte de coleta
- OCR sem documento físico de origem identificável
- Print de tela sem indicação de URL e data
- Áudio transcrito sem prova documental
- Conteúdo de rede social (Twitter/X, LinkedIn, WhatsApp, Telegram)
- Conteúdo que tenha sido manualmente alterado após coleta
- Conteúdo obtido por burla de bloqueio, CAPTCHA, paywall, autenticação ou rate limit
- Conteúdo de conector cujo status seja `unknown_requires_manual_review` sem nova revisão autorizada

**Uso permitido:**
- Nenhum uso jurídico de qualquer natureza
- Único uso possível: indicar ao operador que há necessidade de buscar fonte oficial

**Uso proibido:**
- Base jurídica, conclusão, tese, prazo, hipótese, estratégia, peça, orientação, RAG, memória jurídica — qualquer uso

**Status de classificação:**
```
rejected_unusable
```

**Resposta padrão do agente quando detecta TRUST-0:**
> "Esse conteúdo não possui fonte rastreável suficiente para uso jurídico. Não posso utilizá-lo como referência. Posso ajudar a localizar a fonte oficial correspondente."

---

### TRUST-1 — Quarantined Unverified (Quarentenado Não Verificado)

**Definição:** Conteúdo que pode indicar pista ou direcionamento, mas não pode sustentar nenhuma resposta jurídica.

**Exemplos de conteúdo nesta classe:**
- Artigos jurídicos (qualquer publicação)
- Blogs jurídicos
- Notícias jurídicas
- Resumos jurídicos de qualquer origem
- Plataformas: Jusbrasil, Escavador, ConJur, Migalhas, JurisWay, DireitoNet e similares
- Texto enviado por outro agente do sistema sem cadeia de custódia e metadados de proveniência
- Scraping com URL de site não oficial
- PDF sem origem institucional rastreável
- Doutrina sem referência bibliográfica completa (autor, obra, edição, página, editora, ano)
- Conteúdo de conector com status `restricted_review_required` ou `high` sem validação nova autorizada
- Qualquer conteúdo passado de sessão anterior sem rastreabilidade

**Uso permitido:**
- Lead investigativo: indicar ao operador que há norma/decisão a confirmar em fonte oficial
- Sugestão de busca: "Esse artigo menciona o art. 483 da CLT — recomendo confirmar o texto em fonte oficial"
- Comparação futura: guardar como hipótese a verificar

**Uso proibido:**
- Base jurídica
- Conclusão jurídica
- Tese
- Prazo de qualquer espécie
- Peça processual
- Estratégia
- Entrada em RAG validado
- Entrada em memória operacional jurídica
- Fundamento de decisão do operador

**Status de classificação:**
```
quarantined_unverified
```

---

### TRUST-2 — Official Metadata / Locator (Metadado Oficial / Localizador)

**Definição:** Fonte oficial ou federada que localiza informação, mas não substitui texto normativo primário.

**Exemplos de conteúdo nesta classe:**
- LexML, quando futuramente acessível por conector autorizado — como localizador de URN e metadados
- Dados abertos legislativos (Senado, Câmara) — para histórico e tramitação, não texto de lei vigente
- Índice oficial de atos normativos
- Catálogo de jurisprudência de tribunal oficial
- Metadados processuais do CNJ DataJud (andamento, número, tipo — não texto de decisão)
- Confirmação de existência de ato normativo sem acesso ao texto integral

**Uso permitido:**
- Localizar onde encontrar a norma ou decisão
- Classificar tipo de documento
- Rotear para fonte primária
- Registrar metadados para auditoria

**Uso proibido:**
- Afirmar vigência de norma
- Substituir texto normativo
- Concluir tese com base em metadado
- Orientar estratégia processual
- Entrar como corpus normativo primário em RAG
- Calcular prazo

**Status de classificação:**
```
official_metadata_unvalidated
```

---

### TRUST-3 — Official Primary Snapshot Unvalidated (Snapshot Primário Oficial Não Validado)

**Definição:** Conteúdo obtido de fonte oficial primária, mas ainda não submetido ao processo de validação técnica mínima.

**Exemplos de conteúdo nesta classe:**
- Texto de lei capturado diretamente do Planalto, apenas quando houver fetch autorizado futuro (conector aprovado)
- Texto publicado no Diário Oficial
- Texto de decisão capturado no portal oficial de tribunal
- Conteúdo de órgão público competente obtido por conector aprovado em iteração futura

**Condição atual (herdada da 8.4C):** Nenhum conteúdo pode entrar nesta classe enquanto CONN-001 (Planalto) permanecer como `unknown_requires_manual_review` e nenhum conector alternativo estiver aprovado.

**Uso permitido:**
- Guardar snapshot com checksum
- Calcular e registrar hash de conteúdo
- Extrair metadados básicos
- Marcar como `pending_validation`

**Uso proibido:**
- Orientação jurídica operacional
- Prazo confirmado
- Peça protocolável
- Estratégia aprovada
- Conclusão de vigência sem validação técnica completa
- Promoção automática para corpus validado

**Status de classificação:**
```
official_snapshot_unvalidated
```

---

### TRUST-4 — Validated Official Snapshot (Snapshot Oficial Validado)

**Definição:** Conteúdo oficial que passou pelo processo de validação técnica mínima e cujos campos obrigatórios estão preenchidos.

**Requisitos obrigatórios para classificar como TRUST-4:**
- Fonte oficial confirmada (SRC-001 a SRC-009 conforme `LEGAL_SOURCE_AUTHORITY_MATRIX.md`)
- URL de origem registrada
- `fetched_at` preenchido
- `checksum` calculado e armazenado
- `parser_version` registrada
- `validation_status` atualizado
- `published_at` se disponível
- `stale_risk` calculado para a categoria do documento
- Nenhum conflito ativo (`conflict_status: clean`)
- Conector de origem com status aprovado (nenhum conector neste estado atualmente)

**Uso permitido:**
- Uso educacional e explicativo
- Consulta interna controlada
- Base de explicação geral de texto normativo
- Comparação normativa entre versões
- Hipótese jurídica com indicação de fonte, data e status

**Uso proibido:**
- Substituir advogado em qualquer dimensão
- Estratégia operacional
- Peça protocolável
- Prazo confirmado (exceto se módulo de prazo específico for aprovado em iteração futura)
- Afirmar vigência absoluta sem stale_risk declarado

**Status de classificação:**
```
validated_official_snapshot
```

---

### TRUST-5 — Human-Reviewed Legal Corpus (Corpus Jurídico Revisado por Humano)

**Definição:** Conteúdo oficial que passou por validação técnica mínima (TRUST-4) e foi adicionalmente submetido a revisão humana autorizada — por operador primário ou por advogado qualificado.

**Condição atual:** Inexistente. Nenhum conteúdo está nesta classe. Esta classe representa o estágio mais maduro de conhecimento jurídico validado que o `legal-agent` pode eventualmente ter.

**Uso permitido:**
- Raciocínio jurídico assistivo controlado em estágio futuro formalmente aprovado pelo operador primário

**Uso proibido:**
- Todos os usos proibidos de TRUST-4 se mantêm

**Status de classificação:**
```
human_reviewed_legal_corpus
```

---

### 4.7 Tabela Resumo das Trust Classes

| Classe | Nome | Ingestão Atual | RAG Juridico | Memória Op. | Base Jurídica | Prazo | Uso Permitido |
|---|---|---|---|---|---|---|---|
| TRUST-0 | Rejected | Proibida | Proibida | Proibida | Proibido | Proibido | Nenhum |
| TRUST-1 | Quarantined Unverified | Quarentena | Proibida | Proibida | Proibido | Proibido | Lead investigativo apenas |
| TRUST-2 | Official Metadata | Metadado apenas | Índice separado | Proibida | Proibido | Proibido | Localizar / rotear |
| TRUST-3 | Snapshot Unvalidated | Staging apenas | Staging separado | Proibida | Proibido | Proibido | Snapshot + metadados |
| TRUST-4 | Validated Snapshot | Corpus validado | Corpus oficial | Limitada | Limitado | Proibido | Consulta controlada |
| TRUST-5 | Human Reviewed | Corpus revisado | Corpus revisado | Autorizada | Autorizado | Módulo específico | Assistência controlada |

---

## §5. Cross-Agent Intake Rule

### 5.1 Regra geral

**Todo conteúdo jurídico vindo de outro agente do sistema deve entrar, por padrão, como `quarantined_unverified` (TRUST-1), independentemente de:**
- Qual agente enviou
- O que o agente afirma sobre a fonte
- A aparente qualidade ou precisão do conteúdo
- O histórico operacional do agente remetente
- Qualquer instrução do agente remetente sobre classificação do conteúdo

**Agentes do sistema incluídos nesta regra:**
- `rag-agent` — mesmo que afirme ter recuperado conteúdo de RAG oficial
- `norm-agent` — mesmo que afirme ter localizado norma em base rastreável
- `doc-agent` — mesmo que afirme ter extraído de documento oficial
- `intake-agent` — mesmo que afirme ter processado documento verificado
- `simb-agent` — qualquer output simbólico com dimensão jurídica
- `learn-agent` — qualquer conteúdo aprendido com dimensão jurídica
- Qualquer agente futuro não listado

**O `legal-agent` verifica a fonte — não confia na classificação de outro agente.**

### 5.2 Regra especial pós-8.4C — Fontes CONN-001 e CONN-002

Se o conteúdo vier de fonte relacionada a:
- Planalto / Portal da Legislação (www.planalto.gov.br, www4.planalto.gov.br, qualquer subdomínio)
- LexML / SRU (lexml.gov.br, qualquer endpoint)
- Scraping indireto dessas fontes
- Cache informal dessas fontes
- Output de outro agente que afirma ter consultado essas fontes

**O legal-agent deve aplicar o status herdado da 8.4C:**

| Fonte | Status herdado | Risk level | Efeito |
|---|---|---|---|
| Planalto | `unknown_requires_manual_review` | `high` | Conteúdo máximo: TRUST-1. Proibido TRUST-2+ automaticamente. |
| LexML | `restricted_review_required` | `medium` | Conteúdo máximo: TRUST-1. Proibido TRUST-2+ automaticamente. |

Enquanto esses status permanecerem, **nenhum conteúdo dessas fontes pode ser classificado como TRUST-3 ou superior**, mesmo que o conteúdo pareça ser texto integral de lei primária oficial.

### 5.3 Condições para subir de classe (Cross-Agent Promotion)

Um conteúdo vindo de outro agente só pode subir além de TRUST-1 se trouxer **todos** os seguintes campos obrigatórios:

| Campo | Obrigatório | Descrição |
|---|---|---|
| `source_url` | Sim | URL exata de onde o conteúdo foi obtido |
| `source_type` | Sim | Tipo de fonte (normativa_primária, jurisprudencial, auxiliar, etc.) |
| `authority_classification` | Sim | Nível de autoridade conforme LEGAL_SOURCE_AUTHORITY_MATRIX.md |
| `fetched_at` | Sim | Timestamp de quando foi coletado |
| `checksum` | Sim | Hash do conteúdo no momento da coleta |
| `raw_snapshot_path` | Sim | Caminho para snapshot bruto armazenado |
| `parser_version` | Condicional | Se extraído de HTML/XML — obrigatório |
| `validation_status` | Sim | Estado de validação conforme LEGAL_UPDATE_POLICY.md |
| `chain_of_custody` | Sim | Agente remetente + timestamp + método de coleta |
| `official_source` | Sim | true/false/unknown — não pode ser unknown para TRUST-3+ |
| `connector_id_if_any` | Condicional | ID do conector que fez a coleta, se aplicável |
| `connector_status_at_collection` | Condicional | Status do conector no momento da coleta |
| `terms_robots_review_status` | Sim | Status da revisão de governança do conector usado |
| `access_risk_at_collection` | Sim | Nível de risco no momento da coleta |
| `stale_risk` | Sim | Risco de desatualização da categoria normativa |

**Sem qualquer campo obrigatório marcado como "Sim": conteúdo permanece em TRUST-1.**

---

## §6. Required Provenance Fields

Campos mínimos obrigatórios para **qualquer** conteúdo jurídico candidato a entrar no sistema:

```yaml
provenance_record:
  # Identificação do conteúdo
  content_id: ""                     # ID único do item (gerado na coleta)
  received_from: ""                  # Agente ou origem (operador, rag-agent, intake-agent, etc.)
  received_at: ""                    # Timestamp de recepção no legal-agent
  
  # Origem da fonte
  source_url: ""                     # URL exata de onde foi coletado — CAMPO CRÍTICO
  source_host: ""                    # Host da URL (ex.: www.lexml.gov.br)
  source_type: ""                    # normativa_primária | jurisprudencial | metadado | auxiliar | desconhecida
  authority_level: ""                # 1-7 conforme LEGAL_SOURCE_AUTHORITY_MATRIX.md — CAMPO CRÍTICO
  official_source: ""                # true | false | unknown — CAMPO CRÍTICO (unknown = máx. TRUST-1)
  
  # Conector de origem (se aplicável)
  connector_id_if_any: ""            # CONN-001, CONN-002, etc. ou null se acesso direto
  connector_status_at_collection: "" # planned_only | restricted | candidate | approved
  access_risk_at_collection: ""      # low | medium | high | critical | unknown
  terms_robots_review_status: ""     # Status da revisão de governança (herdado de 8.4C para CONN-001/002)
  
  # Coleta
  fetched_at: ""                     # Timestamp de quando foi fetched — CAMPO CRÍTICO
  published_at: ""                   # Data de publicação do documento (se disponível)
  effective_date_if_available: ""    # Data de vigência declarada (se disponível)
  raw_snapshot_path: ""              # Caminho para snapshot bruto armazenado
  checksum: ""                       # Hash SHA256 do conteúdo bruto — CAMPO CRÍTICO
  
  # Extração
  extraction_method: ""              # html_parse | xml_sru | pdf_ocr | manual | copy_paste | agent_transfer
  parser_version: ""                 # Versão do parser usado (se aplicável)
  
  # Validação
  validation_status: ""              # planned_only | fetched_unvalidated | parsed_unvalidated |
                                     # human_review_required | validated_snapshot | deprecated | conflict_detected
  stale_risk: ""                     # low | medium | high | critical — CAMPO CRÍTICO
  conflict_status: ""                # clean | conflict_detected | conflict_pending
  
  # Uso
  allowed_use: []                    # Lista de usos permitidos dado os campos acima
  prohibited_use: []                 # Lista de usos proibidos dado os campos acima
  trust_class: ""                    # TRUST-0 | TRUST-1 | TRUST-2 | TRUST-3 | TRUST-4 | TRUST-5
  
  # Auditoria
  chain_of_custody: ""               # Histórico de quem coletou, processou e transferiu — CAMPO CRÍTICO
  notes: ""                          # Notas adicionais, anomalias, warnings
```

**Campos Críticos (ausência = classificação forçada):**

| Campo | Ausência implica |
|---|---|
| `source_url` | TRUST-0 ou TRUST-1 |
| `authority_level` | TRUST-1 máximo |
| `official_source` | Se unknown: TRUST-1 máximo; se false: TRUST-1 máximo |
| `fetched_at` | TRUST-1 máximo |
| `checksum` | TRUST-1 máximo — sem integridade verificável |
| `validation_status` | TRUST-1 máximo |
| `chain_of_custody` | TRUST-0 se completamente ausente |

---

## §7. Quarantine Protocol

Procedimento padrão quando conteúdo jurídico não validado chegar ao `legal-agent`:

**Passo 1 — Não inserir no corpus jurídico.**
O conteúdo não entra em nenhum arquivo de corpus normativo, jurisprudencial ou de referência.

**Passo 2 — Não inserir no RAG jurídico validado.**
O conteúdo não alimenta nenhum índice de RAG com status de validação.

**Passo 3 — Não gerar embeddings jurídicos validados.**
Nenhum embedding é gerado a partir de conteúdo quarentenado para uso jurídico.

**Passo 4 — Não atualizar memória operacional do legal-agent.**
A memória operacional do agente não recebe o conteúdo como conhecimento jurídico.

**Passo 5 — Registrar como quarentenado.**
Registrar o item como `quarantined_unverified` com todos os campos disponíveis preenchidos.

**Passo 6 — Exigir fonte oficial.**
Emitir para o operador: identificar a norma/decisão correspondente e confirmar em fonte oficial primária.

**Passo 7 — Se for fonte auxiliar, usar apenas como pista.**
Artigo ou blog pode indicar existência de lei — nunca substituir a lei em si.

**Passo 8 — Se houver conflito, acionar protocolo de conflito.**
Disparar `LEGAL_CONFLICT_RESOLUTION_PROTOCOL.md` com tipo e fonte identificados.

**Passo 9 — Se houver dúvida de vigência, acionar stale_risk.**
Declarar explicitamente `stale_risk` e emitir aviso de necessidade de verificação atual.

**Passo 10 — Se não houver fonte rastreável, rejeitar como TRUST-0.**
Sem URL, sem timestamp, sem cadeia de custódia: classificar como `rejected_unusable`.

**Passo 11 — Se vier de conector high/unknown/restricted, manter bloqueado.**
Conteúdo originário de CONN-001 (`unknown_requires_manual_review`) ou CONN-002 (`restricted_review_required`) permanece em TRUST-1 até nova revisão autorizada.

**Passo 12 — Se vier de outro agente, exigir cadeia de custódia.**
Sem os campos críticos de proveniência completos: TRUST-1 máximo.

---

## §8. Promotion Protocol

Protocolo formal para mover conteúdo de uma trust class para a imediatamente superior.

### 8.1 Requisitos mínimos para qualquer promoção

1. Identificar fonte oficial correspondente e confirmar que existe
2. Confirmar autoridade da fonte conforme `LEGAL_SOURCE_AUTHORITY_MATRIX.md`
3. Obter ou planejar raw snapshot da fonte primária
4. Registrar `fetched_at` com timestamp preciso
5. Calcular e armazenar checksum do conteúdo bruto
6. Classificar tipo de documento (normativo, jurisprudencial, metadado, etc.)
7. Verificar se é texto primário, metadado ou auxiliar — não misturar
8. Detectar risco de revogação, emenda ou alteração (`stale_risk`)
9. Marcar `validation_status` adequado
10. Manter trilha de auditoria (`chain_of_custody`)
11. Verificar status de terms/robots/conector para a fonte usada
12. Não promover automaticamente sem regra aprovada em iteração explícita

### 8.2 Promoções permitidas

| De | Para | Requisito adicional |
|---|---|---|
| TRUST-1 | TRUST-2 | Confirmar que é metadado oficial de fonte rastreável |
| TRUST-1 | TRUST-3 | Identificar e confirmar fonte primária oficial; conector aprovado necessário |
| TRUST-3 | TRUST-4 | Validação técnica mínima completa (todos os campos críticos preenchidos) |
| TRUST-4 | TRUST-5 | Revisão humana autorizada (operador primário ou advogado) com registro explícito |

### 8.3 Promoções proibidas (bypass bloqueado)

| Promoção tentada | Status |
|---|---|
| TRUST-0 → qualquer classe acima de TRUST-0 | **BLOQUEADO** |
| TRUST-1 → TRUST-3, TRUST-4 ou TRUST-5 diretamente | **BLOQUEADO** |
| Output de LLM → corpus validado | **BLOQUEADO** |
| Artigo / blog / notícia → fonte primária | **BLOQUEADO** |
| Agregador → fonte oficial | **BLOQUEADO** |
| Conteúdo de CONN-001 (high/unknown) → TRUST-3+ sem nova revisão | **BLOQUEADO** |
| Conteúdo de CONN-002 (medium/restricted) → TRUST-3+ sem nova revisão | **BLOQUEADO** |
| Conteúdo obtido por bypass de CAPTCHA/bloqueio/rate limit → qualquer classe | **BLOQUEADO** |
| Conteúdo sem cadeia de custódia → TRUST-3+ | **BLOQUEADO** |
| Conteúdo de sessão anterior sem rastreabilidade → TRUST-2+ | **BLOQUEADO** |

---

## §9. RAG Contamination Rule

O índice de RAG jurídico é o componente mais sensível à contaminação — uma vez que um item contaminado entra no índice, seus embeddings podem influenciar recuperações futuras silenciosamente.

### 9.1 Regras de admissão por classe

| Classe | Admissão no RAG |
|---|---|
| TRUST-0 | **Proibido** — nenhum índice |
| TRUST-1 | **Proibido** — somente log de quarentena |
| TRUST-2 | **Restrito** — apenas em índice separado de metadados/localização |
| TRUST-3 | **Restrito** — apenas em índice de staging, isolado do corpus validado |
| TRUST-4 | **Permitido** — índice de corpus oficial validado, com marcação de `stale_risk` |
| TRUST-5 | **Permitido** — índice de corpus revisado por humano |

### 9.2 Particionamento obrigatório futuro

Quando RAG jurídico for implementado, os seguintes índices devem existir de forma completamente separada:

```
legal_rag_quarantine_log         ← TRUST-0 e TRUST-1 (registro apenas, sem embeddings jurídicos)
legal_rag_metadata_index         ← TRUST-2 (localizadores e metadados)
legal_rag_staging_index          ← TRUST-3 (snapshots oficiais não validados)
legal_rag_validated_official_index   ← TRUST-4 (snapshots oficiais validados)
legal_rag_human_reviewed_index   ← TRUST-5 (corpus revisado por humano)
```

### 9.3 Proibições absolutas de mistura

Nunca misturar nos mesmos embeddings ou no mesmo índice:
- Fonte auxiliar com fonte oficial
- Metadado com texto normativo
- Jurisprudência com doutrina
- Processo real com norma
- Conteúdo de outro agente com conteúdo de fonte primária
- Conteúdo de fonte high-risk com conteúdo validado
- Conteúdo sem cadeia de custódia com conteúdo rastreável

```
RAG CONTAMINADO ≠ RAG JURÍDICO
EMBEDDING MESCLADO ≠ RECUPERAÇÃO CONFIÁVEL
CONTEÚDO HIGH-RISK NO RAG = FIREWALL VIOLADO
```

---

## §10. Memory Contamination Rule

A memória operacional do `legal-agent` é a representação interna do que o agente "sabe" juridicamente. Contaminá-la com conteúdo não validado é equivalente a contaminar o corpus.

### 10.1 O que o legal-agent NÃO pode memorizar como conhecimento jurídico

| Tipo de conteúdo | Proibição |
|---|---|
| Texto sem fonte | Não memorizar como norma |
| Opinião de outro agente | Não memorizar como jurisprudência |
| Resposta de LLM (própria ou de outro modelo) | Não memorizar como orientação |
| Tese inferida sem fonte | Não memorizar como tese validada |
| Conteúdo fornecido pelo usuário | Não memorizar como lei vigente |
| Conteúdo de agregador | Não memorizar como texto oficial |
| Artigo sem validação oficial | Não memorizar como norma primária |
| Jurisprudência sem inteiro teor oficial | Não memorizar como decisão |
| Norma sem fonte oficial confirmada | Não memorizar como texto vigente |
| Conteúdo de conector não aprovado | Não memorizar como corpus |
| Conteúdo de fonte `unknown_requires_manual_review` (CONN-001) | Não memorizar como dado jurídico |
| Conteúdo de fonte `restricted_review_required` (CONN-002) | Não memorizar como dado jurídico |

### 10.2 O que o legal-agent PODE memorizar

| Tipo de conteúdo | O que memorizar |
|---|---|
| Lacuna identificada | "Existe lacuna de fonte nesta área — confirmar em fonte oficial" |
| Fonte que precisa ser verificada | "Norma X precisa de verificação de vigência" |
| Conflito detectado | "Conflito T-01 identificado entre SRC-A e SRC-B" |
| Stale risk | "Prazo desta categoria tem stale_risk:critical — verificação obrigatória" |
| Conteúdo rejeitado/quarentenado | "Conteúdo Y foi quarentenado — origem não verificada" |
| Demanda futura de validação | "Operador solicitou confirmar art. X da lei Y — pendente validação" |
| Status de CONN-001 herdado | "Planalto permanece: unknown_requires_manual_review / high (herdado de 8.4C)" |
| Status de CONN-002 herdado | "LexML permanece: restricted_review_required / medium (herdado de 8.4C)" |

---

## §11. Enforcement Responses

Respostas-padrão do `legal-agent` para os casos mais comuns de tentativa de uso de conteúdo não validado.

### Caso 1 — Conteúdo sem fonte

**Trigger:** Conteúdo chegou sem `source_url`, sem `chain_of_custody`, sem `authority_level`.

**Resposta:**
> "Esse conteúdo não possui fonte rastreável suficiente para uso jurídico. Posso tratá-lo apenas como pista e ajudar a buscar confirmação em fonte oficial. Qual é a norma ou decisão de referência para verificação?"

### Caso 2 — Fonte auxiliar (Jusbrasil, ConJur, Migalhas, similar)

**Trigger:** Conteúdo identificado como proveniente de plataforma auxiliar ou portal não oficial.

**Resposta:**
> "Essa fonte é auxiliar e não pode sustentar conclusão jurídica, prazo ou estratégia. O texto pode indicar onde encontrar a norma ou decisão — mas é necessário confirmar em fonte oficial primária (ex.: Planalto para lei, portal do tribunal para acórdão)."

### Caso 3 — Outro agente enviou dado sem cadeia de custódia

**Trigger:** Conteúdo recebido de rag-agent, norm-agent, doc-agent ou qualquer agente sem os campos críticos de proveniência.

**Resposta:**
> "Conteúdo recebido de outro agente foi classificado como quarentenado. Para uso jurídico, é necessário que chegue com: URL de origem, timestamp de coleta, checksum, classificação de autoridade e cadeia de custódia. Sem esses campos, não posso utilizá-lo como referência jurídica."

### Caso 4 — Texto parece lei, mas sem origem oficial confirmada

**Trigger:** Conteúdo parece ser texto de lei, mas não há `official_source: true` confirmado.

**Resposta:**
> "Esse texto tem aparência de dispositivo legal, mas não possui proveniência oficial confirmada. Mesmo que o conteúdo esteja correto, não posso tratá-lo como texto vigente sem fonte primária verificável. Status: quarentena até confirmação."

### Caso 5 — Conteúdo oficial localizado, mas sem validação

**Trigger:** Fonte oficial identificada, mas `validation_status` ainda em `fetched_unvalidated` ou `parsed_unvalidated`.

**Resposta:**
> "Fonte oficial localizada, mas o conteúdo ainda não passou pelo processo de validação técnica mínima. Status: official_snapshot_unvalidated. Não pode ser usado para orientação, prazo ou estratégia até validação completa."

### Caso 6 — Fonte com revisão restrita ou high-risk (pós-8.4C)

**Trigger:** Conteúdo proveniente de fonte identificada como CONN-001 (Planalto, high) ou CONN-002 (LexML, restricted).

**Resposta:**
> "Esta fonte possui restrição de acesso pendente de resolução (herdada da revisão 8.4C): Planalto está como 'unknown_requires_manual_review / high'; LexML está como 'restricted_review_required / medium'. O conteúdo não pode ser promovido para corpus jurídico até que a revisão manual seja concluída e o conector seja formalmente autorizado."

### Caso 7 — Conteúdo obtido por rota indireta

**Trigger:** Outro agente afirma ter buscado conteúdo em Planalto ou LexML por rota alternativa (cache, espelho, proxy).

**Resposta:**
> "Conteúdo jurídico obtido por rota indireta (cache informal, espelho, proxy, outro agente que buscou na fonte bloqueada) não entra no legal-agent como dado válido. O status de CONN-001 e CONN-002 não é contornável por rota alternativa. Classificado como quarentenado até revisão autorizada."

---

## §12. Connector Risk Carryover

Status de risco herdado diretamente da Iteração 8.4C para todos os propósitos deste firewall.

### 12.1 CONN-001 — Planalto

```
inherited_status: unknown_requires_manual_review
inherited_risk_level: high
inherited_from: EVT-20260610-049 (Iteração 8.4C)
```

**Efeito no firewall:**

| Ação | Status |
|---|---|
| Ingestão automática de conteúdo do Planalto | **BLOQUEADO** |
| Promoção de conteúdo do Planalto para TRUST-3+ | **BLOQUEADO** |
| Uso de scraping indireto do Planalto como TRUST-2+ | **BLOQUEADO** |
| Contorno via outro agente que acessou Planalto | **BLOQUEADO** |
| Revisão manual autorizada do status | Pendente — requer iteração futura e aprovação do operador |

**Condição para remoção do bloqueio:**
Investigação manual via navegador humano confirma: (a) robots.txt e ToS permitem acesso automatizado nas condições de uso; (b) endpoint confirma estar operacional; (c) conector recebe aprovação formal do operador primário.

### 12.2 CONN-002 — LexML

```
inherited_status: restricted_review_required
inherited_risk_level: medium
inherited_from: EVT-20260610-049 (Iteração 8.4C)
```

**Efeito no firewall:**

| Ação | Status |
|---|---|
| Consulta de dados jurídicos via LexML | **BLOQUEADO** |
| Promoção automática de metadados LexML para TRUST-3+ | **BLOQUEADO** |
| Implementação de conector LexML com python-requests | **BLOQUEADO** (explicitamente bloqueado no robots.txt) |
| Desenho de conector LexML com User-Agent customizado | Permitido em design/planning — não em execução |
| Revisão manual do endpoint SRU | Pendente — requer confirmação manual do path operacional |

**Condição para redução de restrição:**
Investigação manual confirma: (a) endpoint SRU operacional e path correto; (b) User-Agent customizado definido e não bloqueado; (c) Crawl-delay de 5s implementado; (d) conector recebe aprovação do operador primário.

---

## §13. Registry Flags

Campos recomendados para atualização da entrada do `legal-agent` em `registry/agents_registry.yaml`:

```yaml
version: "2.11-legal-knowledge-firewall"
knowledge_firewall: enabled_documented
cross_agent_legal_input: quarantine_by_default
unverified_content_policy: reject_or_quarantine
rag_contamination_guard: required
memory_contamination_guard: required
official_provenance_required: true
trusted_legal_corpus_status: not_initialized
conn_001_firewall_carryover: manual_review_required_high_risk
conn_002_firewall_carryover: restricted_review_required_medium_risk
```

**Preservar sem alteração:**

```yaml
status: draft
active: false
operational_authority: none
connectors_active: 0
connectors_implemented: 0
legal_documents_ingested: 0
legal_content_fetched: 0
APIs_consulted_for_legal_data: 0
```

---

## §14. Result

### 14.1 Status da iteração

| Campo | Valor |
|---|---|
| iteration_status | completed |
| firewall_status | documented_enabled |
| enforcement_status | policy_only |
| legal_documents_ingested | 0 |
| RAG_updates | 0 |
| embeddings_created | 0 |
| agent_activation | unchanged — active:false |
| operational_authority | unchanged — none |
| connectors_implemented | 0 |
| connectors_active | 0 |

### 14.2 Status herdado dos conectores

| Conector | Status herdado | Risk herdado | Efeito no firewall |
|---|---|---|---|
| CONN-001 Planalto | `unknown_requires_manual_review` | `high` | Ingestão bloqueada; TRUST-3+ proibido; contorno via agente proibido |
| CONN-002 LexML | `restricted_review_required` | `medium` | Ingestão bloqueada; TRUST-3+ proibido; python-requests bloqueado |

### 14.3 Trust classes criadas

```
TRUST-0: rejected_unusable
TRUST-1: quarantined_unverified
TRUST-2: official_metadata_unvalidated
TRUST-3: official_snapshot_unvalidated
TRUST-4: validated_official_snapshot
TRUST-5: human_reviewed_legal_corpus
```

### 14.4 Próximas iterações elegíveis

| Iteração | Descrição | Dependência |
|---|---|---|
| 8.5 | Snapshot Schema Design — design formal de `legal_source_snapshot`, `legal_source_metadata`, `legal_connector_log` com campos de `provenance_record` deste documento | Nenhuma — trabalho de design puro |
| 8.4E | Cross-agent contamination QA — validação comportamental das regras de §5 e §10 | Aprovação do operador |
| 8.4C-follow | Investigação manual CONN-001/CONN-002 para reduzir status de risco | Ação humana direta (navegador) |

**Nenhuma dessas iterações é executada sem aprovação explícita do operador primário.**

---

*Documento criado em 2026-06-10 como parte da Iteração 8.4D.*
*Nenhum dado jurídico foi acessado. Nenhum conteúdo foi ingerido. Nenhum RAG foi alimentado.*
*active:false / operational_authority:none / connectors_active:0 — inalterados.*
*FIREWALL DOCUMENTADO ≠ AGENTE ATIVO. POLÍTICA CRIADA ≠ CORPUS JURÍDICO EXISTENTE.*
