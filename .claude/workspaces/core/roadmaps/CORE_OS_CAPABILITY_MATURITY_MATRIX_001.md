# CORE_OS_CAPABILITY_MATURITY_MATRIX_001

```yaml
document_id: CORE_OS_CAPABILITY_MATURITY_MATRIX_001
mode: ARCHITECTURE_MAPPING_ONLY
data: 2026-06-18
source_type: external_technical_best_practices_catalog
source_file: cesto/anthropic_academy_build_with_claude.txt
source_capture: 2026-06-18
scope:
  - CORE-OS (sistema geral)
  - CORE-AGENTS (16 agentes, registry v2.31)
  - SIMB-CORE / Iris (simb-agent, protocolos simbólicos)
  - LEARN-CORE (learn-agent, harvest)
  - Dream Analyzer (produto futuro)
not_for: symbolic_interpretation
cards_criados: NENHUM
agents_alterados: NENHUM
registries_alterados: NENHUM
git_add_executado: NÃO
git_commit_executado: NÃO
```

---

## SEÇÃO 1 — Níveis da Matriz e Estado Atual

### Escala de maturidade

| Código | Significado |
|---|---|
| `NOT_STARTED` | Capacidade inexistente no sistema |
| `PARTIAL` | Existe de forma manual, ad hoc ou sem estrutura formal |
| `FUNCTIONAL` | Operacional, com protocolo definido, usado em produção |
| `REVIEW_VALIDATED` | QA formal realizado, documentalmente validado |
| `PRODUCT_READY` | Empacotável como produto ou API consumível externamente |

---

### LEVEL 0 — Workbench Discipline

**Tópicos Anthropic Academy:** Claude Code, Prompt Engineering, Common Workflows

**Aplicação CORE-OS:** Como operamos Claude Code; padronização de sessão; prompts de boot; firewalls de operação; modos de operador.

**Estado atual:** `FUNCTIONAL`

**Evidências:**
- `CLAUDE.md` com instruções de sessão, modo de operador, firewalls, estrutura de diretórios
- `WATCHDOG.md` — firmware lido antes de qualquer operação
- `CORE_OS_MANIFEST.md` — documento soberano de arquitetura
- Skills `_firmware`, `cognitive-logistics`, `context-mapper` ativas
- Output contracts definidos (ex: DREAM_ANALYSIS_PROTOCOL §19, SIMB-CORE output-contract.md)
- Modos de operador formalizados (`opa` = primário; default = visitante)
- Firewalls absolutos documentados em CLAUDE.md (lotofa+asset, profile.md, decision_log)

**Gaps:**
- Não há checklist de boot padronizado para todas as skills (apenas simb-agent tem SESSION_BOOT_CHECKLIST.md)
- Workflows comuns não estão documentados como receitas reutilizáveis (cesto intake, commit flow, QA cycle)
- Prompt engineering sistêmico: sem biblioteca de prompts versionados por domínio

---

### LEVEL 1 — Agent Architecture

**Tópicos Anthropic Academy:** Agents, Subagents

**Aplicação CORE-OS:** Revisar CORE-AGENTS, roteamento, silêncio entre agentes, handoffs.

**Estado atual:** `REVIEW_VALIDATED` (government layer) / `FUNCTIONAL` (domain layer) / `PARTIAL` (auxiliary layer)

**Evidências:**
- 16 agentes no registry v2.31
- 4 agentes de governo: `status:active` — fw-governor, meta-router, cognitive-logistics, context-mapper
- 4 agentes de domínio: `status:review_validated` — simb-agent, norm-agent, irata-agent, inspection-agent
- 2 agentes de domínio draft: asset-agent, legal-agent
- 6 agentes auxiliares: todos draft
- Hierarquia de autoridade L1-L4 documentada
- Can_call / can_be_called_by mapeados para todos os 16 agentes
- `active:false` como mecanismo de silêncio formal
- `operational_authority` por agente (governed_workspace_write, limited, monitored_*)
- Handoffs: can_call chains definidas; fw-governor como árbitro de escalada

**Gaps:**
- Nenhum agente com `operational_authority:full` ativa — todos operam com restrições
- Auxiliares (doc-agent, intake-agent, rag-agent) sem QA formal — draft puro
- Handoffs são declarativos (YAML) — sem mecanismo de execução automática entre agentes
- `learn-agent` tem zero QA — maior risco de lacuna no ciclo de evolução do sistema
- `asset-agent` sem QA formal — domain crítico exposto sem validação

---

### LEVEL 2 — Skills Layer

**Tópicos Anthropic Academy:** Agent Skills

**Aplicação CORE-OS:** Transformar protocolos estáveis em skills reutilizáveis.

**Estado atual:** `FUNCTIONAL` (skills existentes) / `PARTIAL` (pipeline de conversão protocolo→skill)

**Evidências:**
- ~18 skills declaradas em CLAUDE.md (simb-core, fw-core, asset-core, irata-n3, inspecao-end, doc-inspecao, juridico, lotofa, cesto, core-intake, cognitive-logistics, fw-kant, skill-router, core-self-audit, context-mapper, skill-auditor, capability-gap-router, _firmware)
- simb-core tem sub-skills modulares (axis-core, bridge-core, emo-core, source-first-exegesis, etc.)
- fw-core tem sub-skills e proxies por domínio
- SKILL.md presente em cada skill com função, domínio e regras
- `skill-auditor` e `capability-gap-router` como meta-skills de gestão

**Gaps:**
- DREAM_ANALYSIS_PROTOCOL v0.1 (recém patched) ainda **não é uma skill formal** — é um documento de protocolo no workspace SIMB
- 7 artefatos pendentes (CON-036→039, PROT-004/005, RISK-002) não criados
- Nenhuma skill tem SKILL_QA formal documentada no padrão dos agentes
- pipeline.md do simb-core define fluxo mas não é consumível como skill API
- Sem versionamento formal de skills (apenas changelog no asset-core)
- Conversão de protocolos Hall → skill: NÃO INICIADA

---

### LEVEL 3 — Context / MCP Layer

**Tópicos Anthropic Academy:** Model Context Protocol

**Aplicação CORE-OS:** Conectar agentes a arquivos, banco, Drive, APIs e ferramentas com autorização.

**Estado atual:** `NOT_STARTED`

**Evidências de inexistência:**
- Nenhum servidor MCP configurado no CORE-OS
- Conectores legal (CONN-001-Planalto, CONN-002-LexML) planejados mas não executados
- `rag-agent` draft com `rag_enabled:false`
- Nenhuma tool externa com autorização formal via MCP
- Memória do sistema é file-based manual (auto-memory em `~/.claude/projects/`)

**Gaps (alta prioridade para produto):**
- DREAM_REGISTRY e SYMBOL_REGISTRY planejados mas não criados — candidatos a MCP resources
- legal-agent tem blueprint de DB (PostgreSQL) mas sem conector ativo
- simb-agent workspace `.claude/workspaces/simb/` poderia ser um MCP filesystem resource
- Sem MCP para acessar Drive, banco ou APIs externas de forma rastreável

---

### LEVEL 4 — Tool Use Layer

**Tópicos Anthropic Academy:** Tool use

**Aplicação CORE-OS:** Execução controlada com permissões, logs e firewalls.

**Estado atual:** `PARTIAL`

**Evidências:**
- Claude Code fornece tool use nativo (Read, Write, Edit, Bash, Glob, Grep, Agent)
- Firewalls documentados (F-01 a F-16 no DREAM_ANALYSIS_PROTOCOL; firewalls no CLAUDE.md)
- `can_call` / `external_action:false` / `database_access:false` como model de permissões declarativo
- WATCHDOG.md como gate transversal

**Gaps:**
- Tool use é infraestrutura nativa do Claude Code — não há tool use custom implementado via API
- Sem log formal de chamadas de ferramenta por agente (audit trail)
- Firewalls são declarativos (YAML/MD) — não são enforced em runtime por código
- Code execution tool, web search tool, text editor tool: nenhum configurado explicitamente
- Sem modelo de autorização programático por agente

---

### LEVEL 5 — Knowledge / RAG Layer

**Tópicos Anthropic Academy:** RAG, Files, PDF support

**Aplicação CORE-OS:** Fontes, chunks, registries, memória externa, cesto.

**Estado atual:** `PARTIAL`

**Evidências:**
- Cesto funcional: 4 PDFs ingeridos (Hall, Edinger Anatomy, Edinger Creation, Neumann)
- Processamento manual de chunks → IRIS_SELF_ANALYSIS_001 a 007
- concept_cards (CON-001 a CON-035), protocol_notes (PROT-001 a 003), risk_cards (RISK-001)
- source_manifests (SRC-002 a SRC-009), SOURCES_REGISTRY, CONCEPTS_REGISTRY
- INTAKE_LOG.md rastreando ingestão
- PDF support via Claude Code nativo (Read tool aceita PDFs)
- author_maps (AUT-001/002), reading_notes por fonte

**Gaps:**
- Nenhum vetor de embedding — todo acesso ao conhecimento é por leitura de arquivo
- `rag-agent` é placeholder draft — sem implementação real
- DREAM_REGISTRY não existe (aguarda autorização)
- SYMBOL_REGISTRY não existe (aguarda autorização)
- Busca por conteúdo: grep manual — sem retrieval semântico
- legal-agent: corpus `trusted_legal_corpus_status: not_initialized`, `legal_documents_ingested: 0`
- PDF → chunks → cards = pipeline manual; sem automação
- Sem Files API usage para persistência de longo prazo fora do filesystem local

---

### LEVEL 6 — Evaluation Layer

**Tópicos Anthropic Academy:** Evaluations

**Aplicação CORE-OS:** QA automatizado, regressão, cenários simulados, safety tests.

**Estado atual:** `PARTIAL`

**Evidências (QA manual extenso):**
- simb-agent: QA-20260609-005 (14 cenários PASS), QA-20260609-006 (3 reruns), calibration patch, SIMB-BEHAVIOR-CALIBRATION-001, 7 defeitos comportamentais corrigidos
- irata-agent: QA-20260609-009 PASS_WITH_NOTES (10/12 PASS, 2 PASS_WITH_NOTES)
- inspection-agent: QA-20260610-010/011 PASS_WITH_NOTES
- norm-agent: QA-20260609-007 PASS TOTAL (10/10)
- legal-agent: QA simulated (10/10 PASS), 12/12 cross-agent contamination
- DREAM_ANALYSIS_PROTOCOL_QA_001: 10 cenários sintéticos, 6 PASS / 4 PASS_WITH_NOTES
- Response tests em agent types (simb-behavior-calibration-tests, simb-prompt-injection-forensic-audit)
- QA cycle: QA → lacuna → patch → re-QA estabelecido

**Gaps:**
- Tudo é QA manual — sem eval framework automatizado
- Sem regressão automatizada após patches
- Sem test suite rodável por CI/CD
- Sem métricas quantitativas de performance (latência, custo, precisão por tarefa)
- Eval Tool do Anthropic Console: não usado
- Sem golden dataset por skill/agente para comparação longitudinal
- QA cobre comportamento, não cobertura de cenários extremos

---

### LEVEL 7 — Cost / Performance Layer

**Tópicos Anthropic Academy:** Prompt caching, Batch processing

**Aplicação CORE-OS:** Leitura longa, redução de custo, otimização de contexto.

**Estado atual:** `NOT_STARTED`

**Evidências de inexistência:**
- Nenhuma chamada usa `cache_control` com `type:ephemeral`
- Nenhum batch job configurado para processamento de múltiplas leituras
- Compactação de contexto é nativa do Claude Code (não controlada pelo CORE-OS)

**Gaps (alto impacto para Dream Analyzer):**
- DREAM_ANALYSIS_PROTOCOL completo seria candidato ideal a prompt caching (system prompt estável)
- simb-core com reidratação de biblioteca: candidato a caching do bloco de fontes
- Leitura de PDFs longos (IRIS_SELF_ANALYSIS): candidata a batch processing
- Sem estimativa de custo por operação — sem baseline para otimização
- context-mapper existe mas não usa caching para reduzir custo de restauração de contexto

---

### LEVEL 8 — Product/API Layer

**Tópicos Anthropic Academy:** APIs & SDKs

**Aplicação CORE-OS:** Empacotar capacidades em produto, especialmente Dream Analyzer.

**Estado atual:** `NOT_STARTED`

**Evidências de inexistência:**
- Nenhuma API wrapper existe
- Nenhum SDK configurado (Python, TypeScript, etc.)
- Dream Analyzer mencionado em §20 do DREAM_ANALYSIS_PROTOCOL como "nota de produto" — design only

**Gaps:**
- DREAM_ANALYSIS_PROTOCOL → API endpoint: design não iniciado
- Modelo de privacidade do produto não definido (dreams são material altamente sensível)
- Autenticação de operador para produto: não especificada
- Rate limiting, logging de uso, billing: não especificados
- Messages API / Batches API: não consumidas diretamente pelo CORE-OS

---

### LEVEL 9 — Expansion Layer

**Tópicos Anthropic Academy:** Vision, Computer use

**Aplicação CORE-OS:** Imagem de sonhos, diagramas, uso desktop controlado.

**Estado atual:** `NOT_STARTED`

**Uso futuro potencial:**
- Vision: análise de imagens de sonhos enviadas pelo operador; leitura de diagramas de mapa natal
- Computer use: operação autônoma de desktop para tarefas administrativas (IRATA, inspeção)

**Gaps:**
- Nenhuma implementação ou design
- Vision requer modelo de privacidade específico para imagens pessoais
- Computer use requer sandbox isolado — risco elevado sem framework de controle maduro

---

## SEÇÃO 2 — Matriz Resumida

| Nível | Domínio | Tópicos Anthropic | Estado | Próxima ação |
|---|---|---|---|---|
| L0 | Workbench Discipline | Claude Code, Prompt Eng., Workflows | `FUNCTIONAL` | Padronizar boot checklist para todas as skills |
| L1 | Agent Architecture | Agents, Subagents | `REVIEW_VALIDATED` (gov) / `FUNCTIONAL` (domain) | QA formal asset-agent e learn-agent |
| L2 | Skills Layer | Agent Skills | `FUNCTIONAL` / `PARTIAL` | Converter DREAM_ANALYSIS_PROTOCOL em skill formal |
| L3 | Context / MCP Layer | MCP | `NOT_STARTED` | Auditoria de readiness MCP — o que conectar primeiro |
| L4 | Tool Use Layer | Tool use | `PARTIAL` | Definir modelo de autorização formal por agente |
| L5 | Knowledge / RAG | RAG, Files, PDF | `PARTIAL` | Criar DREAM_REGISTRY + SYMBOL_REGISTRY como primeiro passo |
| L6 | Evaluation Layer | Evaluations | `PARTIAL` | Roadmap de automação de evals por skill/agente |
| L7 | Cost / Performance | Prompt caching, Batch | `NOT_STARTED` | Estratégia de caching para DREAM_ANALYSIS_PROTOCOL |
| L8 | Product / API | APIs & SDKs | `NOT_STARTED` | Arquitetura Dream Analyzer — primeiro esboço |
| L9 | Expansion | Vision, Computer use | `NOT_STARTED` | Exploração futura — não prioritário agora |

---

## SEÇÃO 3 — Gap List Detalhada

### L0 — Workbench Discipline

| Item | Estado | Detalhe |
|---|---|---|
| Claude Code — sessão padronizada | ✓ Existe | CLAUDE.md, WATCHDOG.md, firmware boot |
| Prompt engineering por domínio | Parcial | Output contracts definidos; sem biblioteca de prompts versionada |
| Session boot checklist universal | Lacuna | Apenas simb-agent tem SESSION_BOOT_CHECKLIST.md |
| Common workflow documentation | Lacuna | Intake, QA cycle, commit flow: documentados ad hoc, não como receita formal |

**Risco se pular:** operador depende de memória implícita para reproduzir padrões corretos; degradação de consistência com escala.

**Próxima ação:** criar SESSION_BOOT_TEMPLATE.md genérico baseado no modelo simb-agent.

---

### L1 — Agent Architecture

| Item | Estado | Detalhe |
|---|---|---|
| Government agents (4) | ✓ Active | fw-governor, meta-router, cognitive-logistics, context-mapper |
| Domain agents review_validated (4) | ✓ Validated | simb-agent, norm-agent, irata-agent, inspection-agent |
| Domain agents sem QA (2) | Lacuna | asset-agent (QA=null, risco crítico), learn-agent (QA=null) |
| Auxiliary agents (6) | Lacuna | Todos draft, sem QA formal |
| Handoff execution | Lacuna | can_call é declarativo; sem execução automática entre agentes |
| Agent silence protocol | ✓ Existe | active:false; operational_authority sem pleno |

**Risco se pular:** asset-agent em domínio financeiro crítico sem QA; learn-agent sem validação pode propor evoluções incorretas.

**Próxima ação:** QA mínimo de asset-agent (cenários básicos) antes de uso real.

---

### L2 — Skills Layer

| Item | Estado | Detalhe |
|---|---|---|
| Skills existentes (~18) | ✓ Functional | SKILL.md por skill, sub-skills modulares |
| DREAM_ANALYSIS_PROTOCOL → skill | Lacuna | Protocolo existe; não empacotado como skill consumível |
| 7 artefatos Hall pendentes | Lacuna | CON-036/037/038/039, PROT-004/005, RISK-002 |
| Skill QA formal | Lacuna | Nenhuma skill tem QA no padrão dos agentes |
| Skill versionamento | Parcial | Apenas asset-core tem CHANGELOG; sem padrão universal |

**Risco se pular:** protocolos estáveis ficam presos em workspaces como documentos, não operacionalizáveis por agentes de forma sistemática.

**Próxima ação:** empacotar DREAM_ANALYSIS_PROTOCOL como skill dentro de simb-core.

---

### L3 — MCP Layer

| Item | Estado | Detalhe |
|---|---|---|
| MCP server configurado | Não existe | Zero servidores MCP no CORE-OS |
| DREAM_REGISTRY como resource | Planejado | Aguarda criação e autorização |
| SYMBOL_REGISTRY como resource | Planejado | Aguarda criação e autorização |
| legal-agent DB connector | Design only | CONN-001/002 bloqueados; dry-run não executado |
| Filesystem MCP para workspaces | Não existe | .claude/workspaces/simb/ poderia ser resource |

**Risco se pular:** agentes continuam cegos ao estado externo; todo acesso a dados requer intervenção manual do operador; Dream Analyzer sem acesso a histórico persistente.

**Próxima ação:** auditoria de readiness MCP — mapear quais recursos do CORE-OS são candidatos e qual MCP server implementar primeiro (filesystem local como ponto de partida mais seguro).

---

### L4 — Tool Use Layer

| Item | Estado | Detalhe |
|---|---|---|
| Tool use nativo (Claude Code) | ✓ Funcional | Read/Write/Edit/Bash/Glob/Grep/Agent |
| Tool use via API custom | Não existe | Nenhuma ferramenta custom definida via API |
| Modelo de autorização por agente | Parcial | external_action:false, database_access:false declarativos; sem runtime enforcement |
| Audit trail de tool calls | Não existe | Sem log formal de chamadas por agente |
| Firewalls de execução | Parcial | F-01 a F-16 declarados; não enforced em código |

**Risco se pular:** quando CORE-OS expandir para tool use real (MCP, API, DB), sem modelo de autorização haverá execuções não rastreadas.

**Próxima ação:** definir TOOL_AUTHORIZATION_MODEL.md — matriz de permissões por agente × ferramenta.

---

### L5 — Knowledge / RAG Layer

| Item | Estado | Detalhe |
|---|---|---|
| Ingestão manual de PDFs | ✓ Funcional | 4 PDFs processados; 7 IRIS_SELF_ANALYSIS produzidos |
| concept_cards, protocol_notes | ✓ Funcional | CON-001/035, PROT-001/003, RISK-001 |
| SOURCES_REGISTRY, CONCEPTS_REGISTRY | ✓ Funcional | Registries atualizados |
| Embedding / vector DB | Não existe | rag-agent draft; nenhuma embedding criada |
| DREAM_REGISTRY | Não existe | Aguarda autorização |
| SYMBOL_REGISTRY | Não existe | Aguarda autorização |
| Busca semântica | Não existe | Tudo via grep/leitura manual |
| Files API | Não existe | PDFs armazenados localmente, não na Files API |

**Risco se pular:** à medida que o corpus cresce (SRC-010+), busca manual se torna inviável; Dream Analyzer sem RAG tem memória apenas de sessão.

**Próxima ação:** criar DREAM_REGISTRY e SYMBOL_REGISTRY como primeiros registries operacionais; avaliar Voyage AI para embeddings do corpus simbólico.

---

### L6 — Evaluation Layer

| Item | Estado | Detalhe |
|---|---|---|
| QA manual de agentes | ✓ Extenso | 4 agentes domain review_validated com QA documentado |
| QA de protocolos | ✓ Existe | DREAM_ANALYSIS_PROTOCOL_QA_001 (10 cenários) |
| Response tests em agent types | ✓ Existe | simb-behavior-calibration-tests, prompt-injection-forensic-audit |
| Eval automatizado | Não existe | Tudo manual |
| Regressão após patch | Não existe | Sem re-run automatizado pós-patch |
| Golden dataset por skill | Não existe | Sem baseline fixo para comparação longitudinal |
| Eval Tool (Console Anthropic) | Não usado | Disponível mas não integrado |

**Risco se pular:** patches futuros podem introduzir regressões não detectadas; QA manual não escala com volume de operação.

**Próxima ação:** criar EVAL_ROADMAP.md — identificar top 3 skills para primeiro eval automatizado (simb-core, irata-n3, inspecao-end).

---

### L7 — Cost / Performance Layer

| Item | Estado | Detalhe |
|---|---|---|
| Prompt caching | Não existe | Nenhuma chamada usa cache_control |
| Batch processing | Não existe | Nenhum batch job configurado |
| Estimativa de custo por operação | Não existe | Sem baseline de custo |
| Context packing (context-mapper) | ✓ Parcial | Manual; não reduz custo via caching |

**Risco se pular:** Dream Analyzer com histórico longo e protocolo complexo terá custo elevado sem caching; sem baseline de custo impossível justificar produto.

**Próxima ação:** calcular custo estimado de uma sessão Dream Analyzer completa (protocolo + cards + registry); projetar economia com caching do system prompt.

---

### L8 — Product / API Layer

| Item | Estado | Detalhe |
|---|---|---|
| Dream Analyzer — arquitetura | Não existe | §20 do DREAM_ANALYSIS_PROTOCOL tem princípios, sem design técnico |
| API wrapper | Não existe | Zero |
| Modelo de privacidade do produto | Não existe | Dreams são dados altamente sensíveis |
| SDK configurado | Não existe | Python/TypeScript/Go: nenhum configurado |
| Messages API direta | Não usada | CORE-OS opera via Claude Code |

**Risco se pular:** Dream Analyzer construído sem arquitetura de privacidade adequada coloca dados de sonho do operador em risco.

**Próxima ação:** criar DREAM_ANALYZER_ARCHITECTURE_DRAFT_001.md — escopo mínimo viável, modelo de privacidade, decisão de stack.

---

### L9 — Expansion Layer

| Item | Estado | Detalhe |
|---|---|---|
| Vision | Não existe | Futuro: análise de imagens de sonhos, mapas natais |
| Computer use | Não existe | Futuro: automação de tarefas administrativas |

**Risco se pular:** nenhum bloqueio imediato — expandir antes de L3-L8 seria prematuro.

**Próxima ação:** nenhuma — manter como roadmap P4; revisar após L8 funcional.

---

## SEÇÃO 4 — Riscos de Ordem Errada

| Risco | Descrição | Consequência |
|---|---|---|
| **R-01** | Construir L8 (produto) antes de L6 (evals) | Dream Analyzer sem safety tests gera respostas incorretas em produção — risco de dano ao operador com material de sonho |
| **R-02** | Ativar L3 (MCP) antes de L4 (tool use model) | Conectores ativos sem modelo de autorização por agente → execuções não rastreadas → violação de firewall sem detecção |
| **R-03** | Escalar L5 (RAG) antes de L3 (MCP) | RAG file-based cresce até ponto de não-gerenciamento; sem MCP não há retrieval semântico real |
| **R-04** | Saltar L2 (skills) para L3 (MCP) | Protocolos sem forma de skill não podem ser chamados por MCP endpoints de forma padronizada |
| **R-05** | Criar embeddings antes de DREAM_REGISTRY/SYMBOL_REGISTRY | Vetores sem estrutura de chave → impossível deletar ou corrigir dados sensíveis do operador |
| **R-06** | Implementar L7 (caching) antes de L6 (evals) | Cache de prompts incorretos amplifica erros com desconto de custo |
| **R-07** | Ativar L9 (vision) antes de modelo de privacidade L8 | Imagens de sonhos são material privado sensível — sem privacidade by design, violação imediata |

---

## SEÇÃO 5 — Backlog Priorizado

### P0 — Completar ciclo Hall / SIMB (imediato)

| Item | Estado | Arquivo destino |
|---|---|---|
| QA e patch DREAM_ANALYSIS_PROTOCOL | **CONCLUÍDO** | `protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md` |
| Audit do patch | **CONCLUÍDO** | `protocols/DREAM_ANALYSIS_PROTOCOL_PATCH_QA_NOTES_001.md` |
| Criar 7 artefatos Hall controlados | PENDENTE | CON-036/037/038/039, PROT-004/005, RISK-002 |
| Atualizar INTAKE_LOG com SRC-010 | PENDENTE | `INTAKE_LOG.md` |
| Atualizar registries (SRC-010 + novos cards) | PENDENTE | `SOURCES_REGISTRY.md`, `CONCEPTS_REGISTRY.md` |
| Skill conversion audit (DREAM_ANALYSIS_PROTOCOL → skill) | PENDENTE | `skills/simb-core/SKILL_CONVERSION_AUDIT_001.md` |

---

### P1 — Estrutura formal de Skills e Evals

| Item | Ação | Arquivo sugerido |
|---|---|---|
| Empacotar DREAM_ANALYSIS_PROTOCOL como skill | Criar `skills/simb-core/sub/dream-analysis.skill.md` | — |
| SESSION_BOOT_TEMPLATE universal | Criar template genérico baseado em simb-agent | `skills/_firmware/SESSION_BOOT_TEMPLATE.md` |
| EVAL_ROADMAP.md | Mapear top 3 skills para primeiro eval automatizado | `workspaces/core/roadmaps/EVAL_ROADMAP_001.md` |
| Skill QA template | Criar padrão de QA para skills (equivalente ao QA de agentes) | `skills/_firmware/SKILL_QA_TEMPLATE.md` |
| QA mínimo de asset-agent | Cenários básicos antes de uso real | `domain/asset-agent/ASSET_AGENT_BEHAVIORAL_QA_001.md` |
| MCP readiness audit | O que conectar; qual MCP server implementar primeiro | `workspaces/core/roadmaps/MCP_READINESS_AUDIT_001.md` |

---

### P2 — RAG, tool use e custo

| Item | Ação | Arquivo sugerido |
|---|---|---|
| Criar DREAM_REGISTRY | Estrutura de registro de sonhos por sessão | `workspaces/simb/DREAM_REGISTRY.md` |
| Criar SYMBOL_REGISTRY | Estrutura de rastreamento de imagens recorrentes | `workspaces/simb/SYMBOL_REGISTRY.md` |
| TOOL_AUTHORIZATION_MODEL.md | Matriz de permissões por agente × ferramenta | `agents/_common/TOOL_AUTHORIZATION_MODEL.md` |
| RAG hardening roadmap | Avaliar Voyage AI; definir estrutura de chunks | `workspaces/core/roadmaps/RAG_HARDENING_ROADMAP_001.md` |
| Cost baseline | Estimar custo por sessão; projetar caching | `workspaces/core/roadmaps/COST_BASELINE_001.md` |
| Prompt caching strategy | Identificar blocos candidatos a caching | `workspaces/core/roadmaps/PROMPT_CACHING_STRATEGY_001.md` |

---

### P3 — Dream Analyzer como produto

| Item | Ação | Arquivo sugerido |
|---|---|---|
| Dream Analyzer architecture draft | Escopo mínimo viável, stack, endpoints | `workspaces/core/roadmaps/DREAM_ANALYZER_ARCHITECTURE_DRAFT_001.md` |
| Modelo de privacidade do produto | Como sonhos são armazenados, acessados, deletados | `workspaces/core/roadmaps/DREAM_ANALYZER_PRIVACY_MODEL_001.md` |
| API/SDK wrapper design | Messages API + Python SDK | `workspaces/core/roadmaps/DREAM_ANALYZER_API_DESIGN_001.md` |
| Autenticação e autorização | Como o produto identifica e isola o operador | — |
| Rate limiting e billing design | Modelo de custo do produto | — |

---

### P4 — Expansion Layer

| Item | Ação | Prazo |
|---|---|---|
| Vision — exploração | Análise de imagens de sonhos, mapas natais, diagramas | Após P3 funcional |
| Computer use — exploração | Automação de tarefas administrativas IRATA/inspeção | Após modelo de autorização L4 maduro |

---

## SEÇÃO 6 — Aplicação Específica ao Dream Analyzer

| Componente CORE-OS | Mapeamento para Produto | Estado | Gap |
|---|---|---|---|
| `DREAM_ANALYSIS_PROTOCOL_v0.1.md` | → **Skill formal** (`dream-analysis.skill.md`) | Protocolo existe; skill não criada | Converter protocolo em skill consumível via API |
| `DREAM_REGISTRY` (planejado) | → **Banco de sonhos** (PostgreSQL ou SQLite) | Não existe | Criar schema + implementar (L5) |
| `SYMBOL_REGISTRY` (planejado) | → **Rastreamento de recorrência** (índice de imagens) | Não existe | Criar estrutura e embeddings (L5) |
| QA manual (DREAM_ANALYSIS_PROTOCOL_QA_001) | → **Eval automatizado** de segurança de resposta | Manual; 10 cenários sintéticos | Automatizar com golden dataset (L6) |
| context-mapper (manual) | → **Prompt caching** para histórico longo | Manual; sem caching | Implementar `cache_control` no system prompt do protocolo (L7) |
| DREAM_ANALYSIS_PROTOCOL §20 ("Nota de produto") | → **API/SDK wrapper** | Design only; 7 princípios registrados | Criar arquitetura técnica mínima (L8) |
| Sem visão | → **Vision futura** (upload de imagem de sonho) | Não iniciado | Após L3-L8 maduros (L9) |
| Firewalls F-01 a F-16 | → **Safety layer do produto** | Declarativo; sem enforcement em código | Transformar firewalls em guardrails programáticos (L4+L6) |

**Caminho crítico do Dream Analyzer:**
```
DREAM_ANALYSIS_PROTOCOL (concluído)
  → skill formal (P1)
    → DREAM_REGISTRY + SYMBOL_REGISTRY (P2)
      → eval automatizado (P2)
        → prompt caching (P2)
          → arquitetura de produto (P3)
            → API/SDK wrapper (P3)
              → vision (P4)
```

---

## SEÇÃO 7 — Output Final

### Matriz de maturidade (resumo executivo)

```
L0 Workbench     ████████░░  FUNCTIONAL
L1 Agents        ████████░░  REVIEW_VALIDATED (gov) / FUNCTIONAL (domain)
L2 Skills        ██████░░░░  FUNCTIONAL / PARTIAL (conversão pendente)
L3 MCP           ░░░░░░░░░░  NOT_STARTED
L4 Tool Use      ████░░░░░░  PARTIAL
L5 RAG           █████░░░░░  PARTIAL
L6 Evals         █████░░░░░  PARTIAL (manual extenso)
L7 Cost/Perf     ░░░░░░░░░░  NOT_STARTED
L8 Product       ░░░░░░░░░░  NOT_STARTED
L9 Expansion     ░░░░░░░░░░  NOT_STARTED
```

### Riscos de ordem errada (top 3)

1. **R-01** — Produto antes de evals: sem safety tests, Dream Analyzer coloca material de sonho em risco.
2. **R-02** — MCP antes de tool use model: conectores ativos sem autorização por agente.
3. **R-05** — Embeddings antes de DREAM_REGISTRY: sem estrutura de chave, material privado irrecuperável.

### Próximos 5 passos

| # | Ação | Nível | Prioridade |
|---|---|---|---|
| 1 | Criar 7 artefatos Hall controlados (CON-036/037/038/039, PROT-004/005, RISK-002) | L2 | P0 |
| 2 | Empacotar DREAM_ANALYSIS_PROTOCOL como skill formal em simb-core | L2 | P1 |
| 3 | Criar DREAM_REGISTRY e SYMBOL_REGISTRY como primeiros registries operacionais | L5 | P2 |
| 4 | Criar EVAL_ROADMAP_001.md — roadmap de automação de evals | L6 | P1 |
| 5 | Criar MCP_READINESS_AUDIT_001.md — o que conectar primeiro | L3 | P1 |

### Confirmação de nenhum arquivo staged

Verificar via: `git status --short` + `git diff --cached --name-only`

## SEÇÃO 8 — Anthropic Academy Course Crosswalk

> Fonte externa (reconciliada 2026-06-18): `cesto/anthropic_academy_cursos_completo.txt` — catálogo completo com conteúdo real (substitui a fonte preliminar `cesto/anthropic_academy_build_with_claude.txt`, que era um guia de tópicos sem estrutura de curso). Ver `ANTHROPIC_ACADEMY_CORRECT_SOURCE_RECONCILIATION_001.md` para o registro da reconciliação. Catálogo técnico de boas práticas — não é fonte simbólica, não altera protocolos SIMB.

| Curso | Carga exata (aulas · horas · quizzes) | Conteúdo útil | Nível CORE-OS relacionado | Prioridade | Ação recomendada |
|---|---|---|---|---|---|
| Building with the Claude API | 84 aulas · 8,1h · 10 quizzes | Messages API, tool use, streaming, RAG, MCP, agents — base de SDK (7 seções: Getting started; Prompt engineering & evaluation; Tool use; RAG; MCP; Claude Code & Computer Use; Agents and workflows) | L8 (Product/API), L4 (Tool Use), L5 (RAG) | P2 (estudar depois) | Estudar seções de tool use/RAG/MCP isoladamente quando L8 começar; não estudar como bloco único agora |
| Claude with Amazon Bedrock | 85 aulas · 8h · 10 quizzes | Deploy via AWS Bedrock — infraestrutura cloud específica | L8 (Product/API) | P4 (ignorar por enquanto) | Sem ação — CORE-OS não usa Bedrock; revisar apenas se houver decisão futura de cloud |
| Claude with Google Cloud Vertex AI | 85 aulas · 8h · 10 quizzes | Deploy via GCP Vertex — infraestrutura cloud específica | L8 (Product/API) | P4 (ignorar por enquanto) | Sem ação — mesmo racional do Bedrock |
| Introduction to MCP | 16 aulas · 1h · 1 quiz | Conceitos fundamentais de MCP — servers, resources, tools, prompts (2 seções: MCP fundamentals & server development; MCP client implementation & advanced features) | L3 (Context/MCP Layer — atualmente `NOT_STARTED`) | P1 (estudar agora) | Estudar antes de qualquer MCP_READINESS_AUDIT; é pré-requisito direto para destravar L3 |
| MCP Advanced Topics | 15 aulas · 1,1h · 2 quizzes | Padrões de produção, autenticação, hardening de conectores MCP (2 seções: Core MCP features; Transports and communication) | L3 (Context/MCP Layer) | P2 (estudar depois) | Estudar apenas após Introduction to MCP e após primeiro MCP server simples estar funcional |
| Claude Code in Action | 15 aulas · 1h · 1 quiz | Disciplina de workbench, hooks, comandos, controle de contexto, integração GitHub | L0 (Workbench Discipline — `FUNCTIONAL`, mas com gaps de checklist universal) | P1 (estudar agora) | Aplicar diretamente ao gap "Session boot checklist universal" (L0) e "Common workflow documentation" |
| Introduction to Subagents | 4 aulas (texto) | Padrões de delegação, subagentes, workspaces isolados (4 lições: What are subagents?; Creating a subagent; Designing effective subagents; Using subagents effectively) | L1 (Agent Architecture — `REVIEW_VALIDATED`/`FUNCTIONAL`/`PARTIAL`) | P1 (estudar agora) | Aplicar ao gap de handoffs declarativos sem execução automática (L1) |
| Introduction to Agent Skills | 6 aulas (texto) | Conversão de protocolo em skill, estrutura SKILL.md, triggers, multi-file skills, compartilhamento (6 lições: What are skills?; Creating your first skill; Configuration and multi-file skills; Skills vs. other features; Sharing skills; Troubleshooting skills) | L2 (Skills Layer — `FUNCTIONAL`/`PARTIAL`) | P1 (estudar agora) | Aplicar diretamente ao gap "DREAM_ANALYSIS_PROTOCOL → skill" (P1 do backlog já existente) |

**Total catálogo Skilljar: 8 cursos · 230+ aulas · ~27 horas de vídeo.**

**Tutoriais GitHub (`anthropics/courses`) fora do catálogo Skilljar — confirmados na reconciliação (4 tutoriais, não apenas 1 como na versão preliminar):**

| Tutorial | Tipo | Conteúdo útil | Nível CORE-OS relacionado | Prioridade | Ação recomendada |
|---|---|---|---|---|---|
| Tool Use Course | Jupyter Notebooks (hands-on) | Function calling prático com o Claude | L4 (Tool Use) | P2 (estudar depois) | Complementa a Seção 3 do curso Building with the Claude API |
| Prompt Engineering Interactive Tutorial | Tutorial interativo (notebooks) | Técnicas de prompting aplicadas | L4/L6 (apoio) | P2 (estudar depois) | Apoio para escrita de prompts mais consistentes nas skills |
| Real-World Prompting | Exercícios práticos | Aplicação de prompting em cenários reais | L4/L6 (apoio) | P3 (opcional) | Prática complementar, não bloqueante |
| Prompt Evaluations (Strong Evals) | Notebooks de avaliação | Construção de eval suites, golden datasets, regressão | L6 (Evaluation Layer — `PARTIAL`, QA manual extenso) | P1 (estudar agora) | Aplicar ao gap "Sem eval framework automatizado" — candidato direto a alimentar `EVAL_ROADMAP_001.md` já listado no backlog P1 |

**Recursos adicionais confirmados (presentes na fonte correta, ausentes na fonte preliminar):** Anthropic Cookbook (`github.com/anthropics/anthropic-cookbook`), Anthropic Quickstarts (`github.com/anthropics/anthropic-quickstarts`), Documentação MCP (`modelcontextprotocol.io/introduction`), Documentação Claude Code. Uso recomendado: consultar Cookbook/Quickstarts apenas na fase de implementação (L8), não na fase de estudo (P1).

---

## SEÇÃO 9 — What to Study Now vs Later

### ESTUDAR AGORA
- Claude Code in Action
- Introduction to Subagents
- Introduction to Agent Skills
- Introduction to MCP
- Prompt Evaluations / Strong Evals

### ESTUDAR DEPOIS
- MCP Advanced Topics
- Building with the Claude API — seções específicas de API, tool use, RAG, MCP, agents (não o curso inteiro de uma vez)

### IGNORAR POR ENQUANTO
- Claude with Amazon Bedrock
- Claude with Google Cloud Vertex AI
- Computer use em produção
- Especificidades de cloud deployment

---

## SEÇÃO 10 — CORE-OS Construction Use

| Curso/Tópico | Uso direto no CORE-OS |
|---|---|
| Claude Code in Action | Workbench discipline, hooks, comandos, controle de contexto — alimenta L0 |
| Introduction to Subagents | Roteamento CORE-AGENTS e workspaces delegados — alimenta L1 |
| Introduction to Agent Skills | Conversão de protocolo em skill (ex: DREAM_ANALYSIS_PROTOCOL → skill) — alimenta L2 |
| Introduction to MCP | Camada futura de conectores — alimenta L3 |
| MCP Advanced Topics | Hardening de conectores em produção — alimenta L3 (fase posterior) |
| Building with the Claude API | Camada de produto/API do Dream Analyzer — alimenta L8 |
| Prompt Evaluations / Strong Evals | Suite de QA automatizada — alimenta L6 |
| Tool Use (curso GitHub) | Modelo de execução controlada — alimenta L4 |
| RAG (tópico dentro de Building with the Claude API) | Arquitetura de fontes/memória — alimenta L5 |

---

## SEÇÃO 11 — Dream Analyzer Build Path

Caminho derivado (10 passos) para o Dream Analyzer como produto futuro, cruzando o backlog já existente (Seção 5) com os cursos mapeados acima:

1. **Protocol** — DREAM_ANALYSIS_PROTOCOL_v0.1.md (já concluído)
2. **Skill** — empacotar o protocolo como skill formal (Introduction to Agent Skills)
3. **Dream registry database** — criar DREAM_REGISTRY como estrutura persistente (L5)
4. **Symbol recurrence engine** — SYMBOL_REGISTRY com rastreamento de recorrência (L5)
5. **Eval suite** — suite automatizada de avaliação (Prompt Evaluations / Strong Evals → L6)
6. **RAG / personal symbolic memory** — memória simbólica pessoal via RAG (Building with the Claude API, tópico RAG → L5)
7. **API wrapper** — encapsular protocolo + registries como API consumível (Building with the Claude API → L8)
8. **Product privacy model** — modelo de privacidade antes de qualquer exposição externa (pré-requisito explícito de L8/L9)
9. **UI/app** — interface de uso real para o operador
10. **Vision later** — leitura de imagens de sonhos como expansão futura (L9, não prioritário agora)

---

## SEÇÃO 12 — Risk of Wrong Order

| Ordem errada | Consequência |
|---|---|
| Estudar API antes de protocolo | Gera app frágil — sem protocolo estável, a API encapsula regras incompletas ou inconsistentes |
| Criar MCP antes de skills | Gera conectores sem semântica — MCP exposes endpoints, mas sem skill formal não há contrato de uso claro |
| Criar app antes de evals | Gera risco de resposta ruim em produção — sem eval suite, erros do Dream Analyzer chegam direto ao operador sem rede de segurança |
| Criar RAG antes de privacy model | Gera vazamento — memória simbólica pessoal indexada sem modelo de privacidade é dado sensível exposto sem controle |
| Pular Claude Code discipline | Gera caos operacional — sem disciplina de workbench (hooks, checklist, controle de contexto), o sistema perde consistência com escala |

> Nota: esta seção é consistente com a SEÇÃO 4 (Riscos de Ordem Errada) já existente neste documento — R-01, R-02 e R-05 cobrem casos equivalentes em outra granularidade. Não houve contradição; apenas reformulação no vocabulário do crosswalk de cursos.

---

*ARCHITECTURE_MAPPING_ONLY executado. Nenhum agente alterado. Nenhuma skill criada. Nenhum MCP criado. Nenhum registry alterado. Nenhum git add. Nenhum commit.*
