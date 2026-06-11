# CORE_SYSTEM_AUDITION_001

Full System Architecture, Security & Living-System Review

**Data:** 2026-06-11
**Auditor:** Claude Code (Opus 4.8) — modo auditor sênior de sistemas
**Operador:** primário (modo `opa` ativo na sessão de auditoria)
**Escopo:** CORE-OS completo — agentes, skills, registries, logs, governança, norm_library, segurança, metabolismo

---

## 1. Audit Purpose

Avaliar o CORE-OS como **organismo completo**, não como agente isolado:

- O que o sistema se tornou desde o BASELINE V2 (maio 2026);
- Coerência entre camadas (firmware → fw-core → agentes → skills → dados);
- Se a governança reduz risco real ou virou ritual;
- Se o metabolismo (tokens, logs, documentos) é sustentável;
- Lacunas críticas antes de criar mais agentes;
- A próxima decisão arquitetural que evita colapso futuro.

Esta auditoria usa lentes combinadas de arquitetura de software, segurança, engenharia de agentes, sistemas complexos e biologia sistêmica — com cada analogia biológica traduzida em critério operacional verificável.

---

## 2. Audit Mode

```yaml
audit_mode: read_only_system_review
files_modified: 0          # exceto criação deste relatório
files_created: 1           # .claude/audits/CORE_SYSTEM_AUDITION_001.md
agents_modified: 0
registry_modified: false
logs_modified: false
sql_executed: false
database_accessed: false
embeddings_created: false
RAG_updated: false
connectors_activated: false
execution_allowed: false
harness_created: false
dry_run_executed: false
```

---

## 3. Repository Map

| path | role | maturity | notes |
|---|---|---|---|
| `CLAUDE.md` | boot de sessão | **desatualizado** | Afirma "todos os 16 agentes em status:draft" — falso (4 active, 4 review_validated). Carregado em toda sessão → desinformação sistemática no boot |
| `.claude/CORE_OS_MANIFEST.md` | documento soberano | estável | BASELINE V2. Coerente, enxuto. Diz "lotofa desativado" enquanto CLAUDE.md o lista como disponível |
| `.claude/skills/_firmware/WATCHDOG.md` | camada 0 — boot/auth | maduro | Bem desenhado. Leitura dinâmica de firewalls declarada (não verificável como executada) |
| `.claude/skills/` (20 dirs, 493 arquivos, ~4.9MB) | biblioteca de skills | misto | De maduro (irata-n3, inspecao-end) a quebrado (operator-lock e skill-router com frontmatter `description` vazio) |
| `.claude/agents/` | camada CORE-AGENTS | em construção | 16 agentes; padrão forte (_common, _schemas); peso documental crescendo mais rápido que o uso |
| `.claude/agents/registry/agents_registry.yaml` (34KB) | fonte de verdade declarada | **degradando** | Chaves YAML duplicadas, campo notes virou log, dois campos de versão divergentes |
| `.claude/agents/logs/agent_evolution_log.md` (325KB, 6.805 linhas) | log de evolução | íntegro mas obeso | Append-only respeitado; sem compactação/snapshot; já é caro de ler |
| `.claude/agents/logs/agent_qa_log.md` (195KB) | log de QA | íntegro mas obeso | 11 QAs registrados; muito texto por QA |
| `.claude/norm_library/` (1.324 arquivos, **553MB**) | biblioteca normativa | estrutura madura, ingestão parcial | raw = 520MB de PDFs (gitignored em parte); blocos/índices bem organizados com proveniência |
| `.claude/data/` | dados do operador (carteira) | gitignored ✓ | positions, FIIs, transações — privacidade tratada |
| `.claude/logs/session_inputs.log` (904KB) | hook de log de inputs | **risco crescente** | Captura todo input de sessão em texto plano; cresce sem rotação; contém material sensível por natureza |
| `.claude/QA_TESTS/` | testes de reflexo | mínimo | 1 arquivo. O manifesto diz "a próxima fase é testar reflexo" — quase não aconteceu |
| `_handoff/context_packs/` | continuidade entre sessões | **excelente** | CORE_AGENTS_STATE_PACK com manifest, checksums, prompts de reinserção — padrão a replicar |
| `src/lotofa_core/` + `tests/` | único código executável real | funcional | Python com pytest. Ironia: o único runtime de verdade pertence ao core "desativado" |
| `pt/`, `en/`, `para_gpt/`, `_staging/`, `_historico/`, `*.zip` na raiz | duplicação/legado | **entulho** | Árvores paralelas de docs, zips de packs já instalados, dirs de unpack. Massa morta no repositório |
| `docs/reports/` | auditorias anteriores | bom | self-audit + skill audits de 2026-06-08 — ninguém consolidou os achados |
| git | registro versionado | **crítico** | 1 commit ("Initial release v0.1"). Todo o resto — registry, logs, agentes, QAs — está uncommitted, incluindo deleções pendentes |

---

## 4. CORE-OS Identity Assessment

**O que o CORE-OS é hoje, de fato:** um *exocórtex documental governado* — uma arquitetura de prompts, protocolos e bibliotecas que o Claude (ou outro LLM) lê para operar com disciplina epistêmica nos domínios de vida do operador (patrimônio, jurídico, trabalho em altura, inspeção, subjetividade).

**O que ele não é — e a documentação às vezes finge que é:**

1. **Não é um runtime.** Não existe motor que execute agentes, roteie chamadas ou imponha `can_be_called_by`. O "sistema" executa apenas na medida em que um LLM lê os documentos e escolhe obedecê-los. META-ROUTER `status:active` significa "existe um documento que o Claude deve consultar", não "existe um processo rodando". Esta é a tensão de identidade central do sistema: **a linguagem é de sistema operacional; a substância é de constituição comportamental para LLM.**
2. **Não é produto.** Não há usuário além do operador, nem interface, nem empacotamento.
3. **Não é (ainda) um sistema RAG.** rag_enabled:false em todos; embeddings:0; blocos existem mas não há recuperação implementada.

**A identidade está clara?** Internamente, sim — o manifesto é honesto ("não é oráculo, não substitui profissional"). Mas o sistema vive uma **dupla personalidade não declarada**: laboratório de engenharia de agentes (legal-agent como tese de mestrado em governança) vs. ferramenta de apoio real ao operador (a carteira em `.claude/data/`, o processo das tias, o trabalho IRATA). As duas identidades competem por energia, e o laboratório está ganhando — o que é um problema, porque quem paga a conta é a vida real do operador.

**O nome é coerente?** "OS" é aspiracional. Hoje é mais um *CORE-CONSTITUTION + CORE-LIBRARY*. Aceitável como visão, desde que ninguém confunda a metáfora com capacidade real — o próprio sistema tem firewall para isso (`AGENTE INATIVO ≠ AGENTE OPERACIONAL`) e o aplica bem.

**Veredicto de identidade:** mistura de framework + biblioteca + laboratório, com vocação de organismo operacional. A identidade não está difusa — está **dividida**, e a divisão precisa ser decidida conscientemente (ver §20).

---

## 5. Architecture Layers Assessment

| layer | purpose | current_state | coherence | risk | recommendation |
|---|---|---|---|---|---|
| FIRMWARE (WATCHDOG.md) | boot, auth, firewalls | maduro, enxuto (6.5KB) | alta | baixo | Manter. É o melhor exemplo de "pequeno e suficiente" do sistema |
| FW-CORE / fw-governor | governança constitucional | SKILL.md enxuto (1.6KB) + 40 sub-skills/proxies | média | médio | 19 proxies de 1KB cada são fragmentação sem ganho — fundir em um arquivo de tabela de proxies |
| META-ROUTER | roteamento | AGENT.md bom, regras claras | alta | baixo | Tabela de roteamento é útil de verdade. Manter |
| CORE-LITE WATCHDOG | coerência constitucional local | disperso (v1 + v2 em layers/ e layers_v2/) | **baixa** | médio | Duas gerações coexistem sem deprecação formal — decidir e arquivar a perdedora |
| CORE-AGENTS | camada funcional sobre skills | 16 agentes, padrão forte | alta no design | médio | Congelar criação; o padrão está provado, o uso não |
| Skills | capacidade de domínio | 20 skills, 493 arquivos | média | médio | 2 skills com frontmatter quebrado; sub-skills de 300-900 bytes pulverizadas |
| cesto / core-intake | porta de entrada | políticas boas, uso real baixo | alta | baixo | OK |
| Domain cores (pt/03_cores) | legado pré-agentes | parcialmente deletado, uncommitted | **baixa** | médio | Resolver as deleções pendentes no git — estado atual é ambíguo |
| Registries/logs | rastreabilidade | íntegros, obesos | média | **alto** | Registry virou log; log virou monólito. Compactar (§12) |
| QA/patch cycles | qualidade | rigorosos no legal-agent, ausentes em asset-agent | **assimétrica** | alto | Rebalancear: QA proporcional ao risco real, não à ordem de criação |
| Memória/documentação | continuidade | context packs excelentes; resto pesado | média | médio | Replicar o padrão context pack; compactar o resto |
| norm_library / RAG-ready | base normativa | estrutura exemplar, recuperação inexistente | alta | baixo | É o ativo mais valioso do sistema depois das skills de domínio |

**Diagnóstico de camadas:** a arquitetura vertical (firmware → governo → domínio → auxiliar) é coerente e bem pensada. O problema não é desenho — é **distribuição de massa**: as camadas de governança e registro acumularam mais peso documental que as camadas que entregam valor.

---

## 6. Agent Ecology Map

| agent | domain | status | maturity | AGENT.md | registry | logs | op_authority | active | risk | notes |
|---|---|---|---|---|---|---|---|---|---|---|
| fw-governor | governo | active | QA-reviewed | ✓ | ✓ | ✓ | sim (declarada) | sim | critical | QA textual apenas — nunca arbitrou conflito real |
| meta-router | governo | active | QA-reviewed | ✓ | ✓ | ✓ | sim (roteamento) | sim | low | Melhor relação peso/utilidade da camada governo |
| cognitive-logistics | governo | active | QA-reviewed | ✓ | ✓ | ✓ | sim | sim | low | Sobreposição conceitual com a skill homônima — fronteira agente/skill borrada |
| context-mapper | governo | active | QA-reviewed | ✓ | ✓ | ✓ | sim | sim | low | Único agente com output real comprovado (context packs) |
| simb-agent | subjetivo | review_validated | QA-reviewed | ✓ (45KB) | ✓ | ✓ | limited | **não** | high | 14 cenários QA PASS. AGENT.md de 45KB é 7x o do learn-agent |
| asset-agent | financeiro | draft | **skeleton** | ✓ (5.5KB) | ✓ | ✓ | — | não | **critical** | Maior assimetria do sistema: risco crítico, dados reais em `.claude/data/`, **zero QA** |
| norm-agent | normativo | review_validated | QA-reviewed | ✓ | ✓ | ✓ | limited | não | high | QA 10/10. `core_parent: NORM-CORE` não existe no schema — drift |
| irata-agent | altura/IRATA | review_validated | patched | ✓ (35KB) | ✓ | ✓ | limited | não | critical | 3.931 blocos processados, pacote monitorado + QA. Mais próximo de uso real |
| inspection-agent | END/NDT | review_validated | patched | ✓ (24KB) | ✓ | ✓ | none | não | high | Ciclo 7.0→7.5 completo, hardening de notas QA |
| legal-agent | jurídico | draft | **dry-run-planned** | ✓ (**77KB**) | ✓ | ✓ | none | não | high | 27 iterações, ~900KB de docs, 0 execução. Estudo de caso §14 |
| learn-agent | aprendizado | draft | designed | ✓ (6.2KB) | ✓ | ✓ | — | não | medium | Modelo de AGENT.md enxuto e completo — **este é o tamanho certo** |
| doc-agent | auxiliar | draft | skeleton | ✓ | ✓ | — | — | não | low | OK como placeholder |
| intake-agent | auxiliar | draft | skeleton | ✓ | ✓ | — | — | não | low | OK |
| rag-agent | auxiliar | draft | skeleton | ✓ | ✓ | — | — | não | medium | Honesto: declara "NÃO IMPLEMENTADO" em caixa alta |
| skill-auditor | auxiliar | draft | skeleton | ✓ | ✓ | — | — | não | medium | Duplica skill homônima sem valor agregado ainda |
| capability-gap | auxiliar | draft | skeleton | ✓ | ✓ | — | — | não | low | OK |

**Contagem:** 16 agentes — 4 active (governo), 4 review_validated, 8 draft. Nenhum agente de domínio ativo. Nenhuma execução real registrada (template UM-INSP-NNN / UM-IRATA-NNN criado, nunca preenchido).

**Leitura ecológica:** o ecossistema tem predadores de contexto (legal-agent, simb-agent, irata-agent — juntos >150KB só de AGENT.md) e organismos eficientes (learn-agent, meta-router). A seleção natural aqui é manual: o operador decide quem engorda. Até agora, engordou quem foi trabalhado por último, não quem entrega mais.

---

## 7. Agent Boundary Audit

| agente / grupo | separação de domínio | autoridade | limites | resultado |
|---|---|---|---|---|
| Governo (4) | clara | proporcional e declarada | bons | **PASS** |
| simb-agent | clara; firewall com asset explícito | limited, active:false | bons | **PASS** |
| asset-agent | clara no papel | declarada mas sem QA que a teste | firewall lotofa declarado | **REVIEW** — risco crítico sem validação comportamental |
| norm-agent | clara | limited | bons; `can_call: legal-agent` é o único domínio→domínio direto além de norm — justificado mas vigiar | **PASS** |
| irata-agent ↔ inspection-agent | interface tratada (A-08, SC-INSP-009, rope_access_interface) | limited/none | bons | **PASS** |
| legal-agent | clara; quarentena interagente por default | none | exemplares | **PASS** |
| learn-agent | clara | proposta-apenas | bons | **PASS** |
| Auxiliares (5) | clara | mínima | bons | **PASS** |
| cognitive-logistics (agente) vs cognitive-logistics (skill) | **borrada** | — | mesmo nome, dois artefatos, fronteira não documentada | **REVIEW** |
| skill-auditor (agente) vs skill-auditor (skill) | **borrada** | — | idem | **REVIEW** |

**Achados específicos de fronteira:**

1. **Risco de agente inativo parecer operacional:** mitigado *textualmente* de forma exemplar (firewalls "≠" em todo documento), mas o ambiente Claude Code lista `inspection-agent-*` e `irata-agent-*` como subagentes invocáveis na sessão. Um LLM em sessão futura pode invocá-los sem ler USE_MONITORED.md. A trava é documental; o vetor é de runtime. **Gap real.**
2. **`can_be_called_by` não é imposto por nada.** É contrato social entre documentos. Enquanto não houver harness, tratar como documentação de intenção — válida, mas não chamar de "controle".
3. **Cross-agent contamination:** o legal-agent tem o único QA formal disso (12/12 PASS, simulado). Nenhum outro par de agentes foi testado para contaminação.

---

## 8. Governance and Safety Audit

**O que existe e funciona:**

- Status explícito em todo agente; `active:false` e `operational_authority` rastreados em registry + AGENT.md + log (tripla redundância coerente — verificado no legal-agent pela auditoria 9.0C, F-001).
- Invariantes de execução (`sql_executed:false`, `connectors_active:0`, etc.) repetidos e preservados — 19 campos no legal-agent, todos false/0.
- Separação design → QA → patch → plano → harness → dry-run → execução: formalmente impecável.
- Autoridade do operador primário preservada em todos os documentos lidos. Nenhum documento se autodenomina autorização.

**As perguntas obrigatórias, respondidas sem anestesia:**

- **As travas reduzem risco real?** As travas *epistêmicas* (SOURCE-FIRST, firewalls ≠, confidence levels), sim — elas moldam o comportamento do LLM que lê. As travas *processuais* do pipeline legal-agent (10 gates, 16 pré-condições, 19 evidências para criar 7 tabelas SQLite locais vazias) reduzem um risco que **já era quase zero** — o custo marginal de segurança da iteração 8.9B em diante é negligível, o custo de tokens não.
- **Existe ritual sem ganho operacional?** Sim. O padrão QA→patch→QA-do-patch→registro-em-3-lugares aplicado a observações LOW cosméticas é ritual. Exemplo concreto: 8 OBS LOW do dry-run plan geraram um documento de patch de 17KB, um QA de 31KB e ~3KB de notes no registry — para um plano que ainda não pode ser executado.
- **Algum documento pode ser interpretado como autorização?** Não encontrei nenhum. Os anti-headers ("QA APROVADA ≠ AUTORIZAÇÃO") são consistentes. Este é um ponto genuinamente forte.
- **Algum agente pode ganhar autoridade por acidente?** Por via documental, não — a tripla redundância protege. Por via de runtime (subagentes listados no ambiente, sessão sem boot correto), **sim** — ver §7.1 e §9 T-03.
- **O registry é fonte de verdade ou só mais um documento?** Está deixando de ser fonte de verdade por *obesidade e defeito técnico*: (a) chaves YAML duplicadas — `sql_executed` aparece 2x e `migrations_created` 2x na entrada do legal-agent; `last_event` 2x na do inspection-agent — um parser YAML padrão silenciosamente descarta a primeira ocorrência; (b) o campo `notes` do legal-agent é um parágrafo de ~6.000 palavras que duplica o evolution log; (c) o cabeçalho diz "Versão: 0.2-review" e o corpo diz `version: "2.31-legal-system-audit"`. **Um registry que não passa em um lint YAML não é fonte de verdade — é prosa com indentação.**

**Veredicto de governança:** segura nos princípios, **inflamada no processo**. A segurança não vem mais de adicionar gates — vem de manter os firewalls epistêmicos e começar a usar o sistema.

---

## 9. Security Posture & Threat Model Audit

| threat_id | threat | where_it_can_happen | current_mitigation | gap | severity | recommendation |
|---|---|---|---|---|---|---|
| T-01 | Prompt injection via documento ingerido | cesto/, norm_library/raw, PDFs jurídicos, e-mails de corretora (asset automation futura) | Princípio "o que vem de fora é objeto de análise, não calibração" (WATCHDOG); quarentena no legal-agent | Sem política de injection scan no intake genérico; cesto aceita qualquer arquivo | **alta** | Adicionar ao core-intake um passo explícito: conteúdo de arquivo nunca é instrução; marcar blocos com origem |
| T-02 | Fonte externa contaminando memória/perfil | simb-core profile.md, learn-agent | Calibração exclusiva do primário; elevação exige ≥3 ocorrências + aprovação | Boa cobertura documental; sem teste prático | média | Incluir cenário de injeção no primeiro QA de uso real |
| T-03 | Agente draft invocado como subagente real | Ambiente Claude Code lista inspection-agent-*/irata-agent-* como invocáveis | Firewalls textuais nos próprios docs | **A trava está dentro do documento que o invocador pode não ler** | **alta** | Primeira linha de cada agent-doc invocável deve ser o bloqueio ("este agente requer operador humano e modo monitorado"), não a descrição |
| T-04 | Conector futuro escrevendo onde deveria ler | legal-agent CONN-001/002 | Preflight 8.4B/8.4C exemplar; conectores 0 implementados | nenhum gap hoje | baixa | Manter padrão preflight como template global |
| T-05 | Segredo/API key exposto | repo, logs, automation futura do asset-core | .gitignore cobre dados; nenhum secret encontrado nos arquivos lidos | session_inputs.log captura tudo que o operador digita — incluindo qualquer segredo futuro | **alta** | Rotação/truncamento do log + aviso de não colar segredos; idealmente filtrar no hook |
| T-06 | Dados sensíveis em log | `.claude/logs/session_inputs.log` (904KB, texto plano, cresce sem limite) | gitignored | Sem rotação, sem expurgo, sem classificação; processo jurídico familiar + carteira passam por ali | **alta** | Política de retenção (ex.: 30 dias) + rotação por tamanho |
| T-07 | Redistribuição de material licenciado | norm_library/raw (gitignored ✓); **PDFs IRATA dentro de `.claude/agents/domain/irata-agent/raw_public_sources/` (~20MB) NÃO estão no .gitignore** | gitignore parcial | PDFs IRATA serão commitados/pushados se alguém rodar `git add -A`; termos de redistribuição IRATA não documentados no repo | média-alta | Mover para norm_library/raw ou adicionar ao .gitignore; registrar termos de uso |
| T-08 | RAG com conteúdo não validado | futuro rag-agent | "RAG não é conclusão automática" em camada epistêmica + agente placeholder honesto | nenhum hoje (RAG inexistente) | baixa | Manter gate: norm_library indexada e versionada antes de ativar |
| T-09 | SQL draft promovido a migration por acidente | legal-agent migration_drafts | Sufixo `_DRAFT_NOT_FOR_EXECUTION` no nome de arquivo + header bloqueante em 13/13 | praticamente nenhum | baixa | Padrão excelente — virar template global |
| T-10 | Modelo caro sem controle de custo | toda a operação (logs de 325KB relidos, AGENT.md de 77KB carregados) | nenhuma | **Não existe governança de custo/tokens em lugar nenhum do sistema** | **alta** | Criar política: budget de contexto por tipo de tarefa; proibir carregar log integral |
| T-11 | Operador confundindo draft com operacional | toda a camada | Firewalls ≠ excelentes e onipresentes | CLAUDE.md desatualizado trabalha *contra* isso (diz que tudo é draft quando 8 não são) | média | Corrigir CLAUDE.md (fora do escopo desta auditoria — recomendação) |
| T-12 | Perda de rastreabilidade por git não usado | repo inteiro | Constituição regra 9 declara "arquivo versionado é registro" | **1 commit no repositório; registry v2.31, 70 eventos, 11 QAs — tudo uncommitted; deleções pendentes não resolvidas** | **crítica** | Commitar estado atual como baseline; commits por iteração daqui em diante. Sem isso, todo o edifício de rastreabilidade repousa em arquivos que um `git checkout` pode destruir |

**Postura geral:** forte contra ameaças *epistêmicas e de autoridade* (o sistema foi desenhado por alguém que entende prompt injection e drift). Fraca contra ameaças *de infraestrutura banal*: git, rotação de log, custo. O sistema tranca a porta da frente com 10 gates e deixa a janela do versionamento aberta.

---

## 10. Organic System Health Audit

| biological_lens | system_equivalent | current_health | pathology_risk | operational_recommendation |
|---|---|---|---|---|
| DNA / genética | _schemas/, _common/, templates, CORE_AGENT_STANDARD | **boa** — DNA claro e replicável | Mutação não sincronizada: registry usa `review_validated`, schema só permite `[draft, review, active, standby, deprecated, archived]`; `NORM-CORE` e `domain-agent` fora dos allowed_values | Atualizar schema OU registry — DNA e fenótipo divergiram; rodar validação de schema como rotina |
| Células | arquivos pequenos, blocos, sub-skills | excesso de divisão celular | 19 proxies de ~1KB, 40 sub-skills de <1KB no asset-core — fragmentação que custa I/O e atenção sem ganho funcional | Fundir células anãs em tecidos (1 arquivo-tabela por grupo) |
| Órgãos | agentes de domínio | 4 órgãos formados (norm, irata, inspection, simb), 1 hipertrofiado em gestação (legal), 1 vital atrofiado (asset) | **O coração financeiro — domínio com dados reais e risco crítico — é o órgão menos desenvolvido** | Priorizar asset-agent no próximo ciclo de QA |
| Sistema nervoso | META-ROUTER + skill-router | funcional no papel, nunca estimulado em carga real | Reflexo não testado = reflexo desconhecido | Executar os QA_TESTS de roteamento que o próprio manifesto pede desde maio |
| Sistema imune | WATCHDOG + firewalls + QA + anti-contamination | **forte demais em um braço, ausente no outro** | Autoimunidade: QA atacando observações cosméticas com resposta inflamatória completa; imunodeficiência: asset-agent sem nenhum anticorpo | Calibrar resposta imune à severidade do antígeno |
| Metabolismo | tokens, logs, contexto, custo | **comprometido** | 325KB de log de evolução + 195KB QA log + 77KB AGENT.md: qualquer sessão que "leia o estado" queima dezenas de milhares de tokens antes de trabalhar | Snapshots compactos + master index; log integral só para auditoria |
| Homeostase | active:false, gates, invariantes | excelente | Setpoint tão conservador que o organismo nunca sai do repouso | Definir o que é "atividade saudável", não só o que é repouso seguro |
| Crescimento | criação de agentes/skills | **desregulado na direção errada** | 16 agentes criados, 0 em uso real; crescimento anatômico sem crescimento funcional | Moratória de novos agentes até 3 usos reais registrados |
| Cicatrização | patch + QA + rollback | madura | Cicatriz hipertrófica: patches de 17KB para arranhões LOW | Patch proporcional ao ferimento |
| Sono / dormência | sleeping default, active:false | bem definido | Nenhum protocolo de *arquivamento* — dormência eterna não é sono, é coma | Criar estado `archived` com critério (ex.: 90 dias sem uso) |
| Mutação boa | evolução incremental validada (6.x irata, 7.x inspection) | presente e bem governada | — | Manter |
| Mutação ruim | patch local quebrando arquitetura global | contida até agora | layers/ vs layers_v2/ no fw-core é mutação não resolvida — dois genomas ativos | Deprecar formalmente a geração perdedora |
| Infecção | fonte fraca, injection, RAG indevido | sem infecção ativa detectada | Vetores abertos: cesto sem injection policy (T-01), subagent invocation (T-03) | Vacinar o intake |
| Câncer | crescimento de escopo/documentação | **estágio inicial detectado no tecido de governança** | O legal-agent produziu ~900KB de documentação para 0 bytes de execução; o padrão, se replicado nos 8 drafts restantes, gera ~7MB de processo para 0 uso | Não replicar o protocolo 8.x integral; usar a versão compactada (§14) |
| Inflamação | QA excessivo travando entrega | **presente e crônica** | 27 iterações no legal-agent; o sistema confunde dor (risco real) com inchaço (observação cosmética) | Anti-inflamatório: classes de mudança (ver §20) |
| Reprodução | criação por template | saudável — CORE_AGENT_STANDARD gera filhos consistentes | learn-agent (6KB) e legal-agent (77KB) saíram do mesmo DNA — a epigenética (disciplina do operador) decide o tamanho | Adotar learn-agent como fenótipo de referência |

**Respostas diretas:**

- **O CORE-OS tem estado saudável definido?** Tem estado *seguro* definido (tudo false). Não tem estado *saudável* definido — saúde seria "agentes em uso monitorado entregando valor com custo controlado". Não existe métrica para isso.
- **O sistema sabe detectar doença?** Doença epistêmica, sim (watchdogs). Doença metabólica, não — nada mede custo, tamanho de log ou inflação documental.
- **O sistema sabe dormir?** Sim, exemplarmente.
- **O sistema sabe compactar?** Tem protocolo (CONTEXT_COMPRESSION_PROTOCOL, context packs) mas não aplica aos próprios logs e registry.
- **O sistema sabe parar de crescer?** Não. O Baseline V2 congelou o *núcleo* e o crescimento migrou para a camada de agentes — o congelamento funcionou como dique, não como dieta.
- **O sistema sabe matar/fundir/arquivar agentes?** Não há um único exemplo de fusão ou aposentadoria de agente. operator-lock virou "standby histórico" — o mais perto de um funeral que o sistema já fez.
- **O sistema tem metabolismo sustentável?** No ritmo atual, não. A taxa de produção documental por unidade de valor entregue está crescendo; sem compactação e sem uso real, o sistema tende a ficar caro demais para ser consultado — um organismo que gasta mais energia mantendo o próprio prontuário médico do que vivendo.

---

## 11. Documentation Quality Audit

**O que está excelente:**
- EPISTEMIC_SAFETY_LAYER.md — denso, operacional, sem gordura. Deveria ser lido por todo agente sempre.
- Firewalls em formato `X ≠ Y` — a melhor tecnologia de segurança do sistema: barata, memorável, eficaz contra o modo de falha real de LLMs (colapso de níveis epistêmicos).
- Context packs do _handoff (manifest + checksums + prompt de reinserção) — padrão profissional.
- Headers bloqueantes nos SQL drafts (nome de arquivo + conteúdo).
- learn-agent/AGENT.md e WATCHDOG.md — prova de que o padrão completo cabe em 6KB.

**O que está pesado:**
- legal-agent: 77KB de AGENT.md + ~820KB de documentos satélites. O campo `notes` do registry repete tudo de novo.
- agent_evolution_log.md: eventos de ~150 linhas cada, com `invariants_preserved` de 25 linhas repetido verbatim em cada evento da série legal — o mesmo bloco aparece dezenas de vezes.
- simb-agent/AGENT.md (45KB) e irata-agent/AGENT.md (35KB) — conteúdo bom, empacotamento inflado.

**O que deve ser compactado:** registry notes (→ 3 linhas + ponteiro para log); evolution log (→ snapshot trimestral + log ativo); AGENT.md grandes (→ corpo ≤10KB + anexos).

**O que deve virar template:** preflight de conector (8.4B/C), header bloqueante de draft, pacote de uso monitorado (USE_MONITORED + INTERFACE + SCENARIOS), context pack.

**O que deve virar regra global:** "nenhum evento de log repete bloco de invariantes — referencia o anterior por ID"; "notes de registry ≤ 5 linhas".

**O que deve ser arquivado:** `_archive/all_in_one/` (já é arquivo — mover para fora de skills/), `layers/` v1 do fw-core, `_staging/`, `para_gpt/`, zips da raiz, dirs `_*_unpack/`.

**O que deve sumir das próximas iterações:** a cadeia QA-do-patch-do-QA para observações LOW; a repetição integral de invariantes; AGENT.md acima de 15KB.

**Facilidade de reinserção em novo chat:** alta *se* usar o context pack; baixa se tentar ler o estado real (logs + registry = ~550KB).

---

## 12. Registry and Log Audit

**Registry é fonte de verdade?** Em intenção sim; em prática está comprometido:
1. **Chaves YAML duplicadas** (legal-agent: `sql_executed`, `migrations_created`; inspection-agent: `last_event`) — defeito técnico objetivo; qualquer parser usa a última e descarta silenciosamente a primeira.
2. **Dois campos de versão divergentes** (header "0.2-review" vs `registry.version: 2.31`).
3. **`status: review_validated` não existe no schema** — o registry e seu próprio schema discordam.
4. O campo `notes` virou changelog — duplicação massiva com o evolution log.

**Logs estão úteis?** O conteúdo é rastreável e os eventos têm rollback_path — isso é raro e valioso. Mas 6.805 linhas sem índice nem snapshot tornam o log *write-only* na prática: ninguém relê 325KB.

**Recomendações (todas devem existir):**

| item | veredicto | forma mínima |
|---|---|---|
| Master index | **sim, urgente** | 1 arquivo, 1 linha por agente: status, versão, último evento, último QA, próxima ação |
| Log compactado | **sim** | snapshot por marco (fim de série de iterações) + log ativo só do ciclo corrente |
| Snapshots periódicos | sim | o context pack de 2026-06-10 já é isso — formalizar cadência |
| Audit summaries | sim | tabela de findings por auditoria, não prosa |
| Event schema mais rígido | **sim** | proibir duplicação de invariantes; campos fixos; validável por script |
| Agent state dashboard | sim | é o master index com 3 colunas a mais |
| Lifecycle registry | sim | datas de criação/promoção/última atividade/critério de arquivamento |

**E o pré-requisito de tudo:** commitar no git. Um registry "fonte de verdade" com 70 eventos uncommitted não sobrevive a um acidente de working tree.

---

## 13. Skills Audit

20 diretórios, 493 arquivos, ~4.9MB. Auditorias anteriores (docs/reports/skill_audits, 2026-06-08) já mapearam frontmatter — os achados não foram consolidados.

| skill | category | maturity | overlap | risk | recommendation |
|---|---|---|---|---|---|
| _firmware | infraestrutura | madura | — | — | Padrão-ouro. Manter |
| fw-core | infraestrutura | madura mas fragmentada | layers vs layers_v2 duplicados; 19 proxies anões | médio | Consolidar v2, arquivar v1, fundir proxies |
| fw-kant | transversal | madura | leve com kantian_* dentro de juridico/inspecao | baixo | OK |
| skill-router | infraestrutura | **frontmatter quebrado** (description vazia → aparece como "---" no ambiente) | função duplicada pelo meta-router | médio | Corrigir frontmatter; decidir: skill-router OU meta-router como autoridade de roteamento |
| operator-lock | standby | **frontmatter quebrado** | lógica já migrada para firmware | baixo | Arquivar de vez — está em standby desde a migração |
| cognitive-logistics | transversal | madura | duplicada como agente homônimo | médio | Definir fronteira skill/agente em 5 linhas |
| context-mapper | transversal | madura, **com output real** | idem | baixo | Manter — é das poucas com valor comprovado |
| asset-core | domínio | extensa, não auditada como agente | 40+ sub-skills anãs; automation/ inteira é aspiracional | **alto** | Próximo ciclo de QA deve ser aqui, não em agente novo |
| simb-core | domínio | madura, recém refinada | — | médio | OK |
| juridico | domínio | madura (36 subs, 14 templates) | parcial com legal-agent docs | baixo | OK — o legal-agent a referencia corretamente |
| irata-n3 | domínio | madura, templates fortes | — | baixo | OK |
| inspecao-end | domínio | madura | INSPECAO_CORE_CONSOLIDADO.md (60KB) duplica sub-skills | médio | Decidir canônico: consolidado OU subs (a decisão de redundância 7.1c cobriu só 2 pares) |
| doc-inspecao | domínio | madura | sub/ e subskills/ coexistem com estruturas diferentes | baixo | Unificar convenção |
| lotofa | domínio | madura + único runtime Python real | — | baixo | Coerência: manifesto diz desativada, CLAUDE.md diz disponível — alinhar |
| cesto / core-intake | infraestrutura | boas políticas | cesto ⊂ core-intake conceitualmente | baixo | Candidatas a fusão |
| core-self-audit / skill-auditor / capability-gap-router / context-mapper | meta | boas | skill-auditor skill vs agente | baixo | OK; consolidar achados antigos |

**Faltam:** skill de governança de custo/contexto (não existe); skill de manutenção de registry/logs (lint, compactação, snapshot).

---

## 14. Legal-Agent as Reference Pattern

**O ciclo 8.0 → 9.0C foi bom?** Como *prova de conceito de governança*, foi excepcional: 27 iterações sem nenhuma violação de invariante, coerência tripla verificada, zero ambiguidade sobre estado. Como *engenharia*, foi desproporcional: ~900KB de documentação, 14 blueprints, 13 SQL drafts, 10 gates, 16 pré-condições, 19 evidências planejadas — para chegar ao direito de *planejar* a criação de 7 tabelas SQLite locais vazias.

**Foi seguro?** Sim — e teria sido igualmente seguro com um terço do processo. A segurança real vem de 4 coisas: header bloqueante nos arquivos, invariantes no registry, quarentena de conteúdo, e aprovação humana obrigatória. Os outros ~20 mecanismos adicionam rastro, não segurança.

**Deve ser replicado para outros agentes?** **Não na íntegra.** Replicar:

- Docmap inicial (8.1) — barato e de alto valor;
- Source authority matrix + knowledge firewall (8.2/8.4D) — essencial para qualquer agente que tocará conteúdo externo;
- Preflight de conector (8.4B/C) — template global;
- Headers bloqueantes e invariantes no registry — sempre.

Não replicar:

- A cadeia QA→patch→QA-do-patch para observações LOW;
- Blueprint YAML *e* SQL draft *e* manifesto *e* QA de cada um — escolher dois níveis, não quatro;
- O registro integral de invariantes em cada evento de log.

**Virou padrão de excelência ou padrão caro demais?** As duas coisas: é o padrão de excelência *para o passo mais arriscado do sistema* (primeira persistência de dados + futuros conectores externos em domínio jurídico sensível). Como padrão *default*, é caro demais. **Mostrou maturidade real** na disciplina de invariantes e na honestidade de estado. **Mostrou excesso de cerimônia** da iteração 8.9A em diante, onde o objeto auditado já não mudava de risco entre iterações.

---

## 15. Systemic Risks

| risk_id | risk | severity | where_seen | impact | mitigation | priority |
|---|---|---|---|---|---|---|
| R-01 | Excesso de cerimônia | alta | legal-agent 8.9+; QA de patch de QA | Velocidade de entrega → 0; fadiga do operador | Classes de mudança com processo proporcional | P1 |
| R-02 | Custo de tokens | alta | logs 520KB, AGENT.md 77KB, notes gigantes | Cada sessão paga imposto crescente | Master index + snapshots + budget de contexto | P1 |
| R-03 | Logs grandes demais | alta | evolution log 325KB / 6.805 linhas | Log write-only; auditoria futura cara | Snapshot por marco + log ativo | P1 |
| R-04 | Duplicação de documentos | média | registry notes ≈ log; layers v1/v2; pt/ vs .claude/; INSPECAO consolidado vs subs | Inconsistência inevitável com o tempo | Definir canônico, arquivar resto | P2 |
| R-05 | Agente inativo parecendo operacional | média | subagentes listados no ambiente; CLAUDE.md desatualizado | Invocação indevida | Bloqueio na 1ª linha do doc invocável; corrigir CLAUDE.md | P1 |
| R-06 | Design confundido com execução | baixa | — | — | Já é o risco mais bem mitigado do sistema | P4 |
| R-07 | QA infinita sem entrega | **alta** | 16 agentes, 0 usos reais; templates UM-* nunca preenchidos | Sistema vira fim em si mesmo | Meta: 3 usos monitorados registrados antes de qualquer novo artefato de governança | **P0** |
| R-08 | Acoplamento entre agentes | baixa | can_call enxuto, interfaces documentadas | — | Manter | P4 |
| R-09 | Contaminação entre domínios | baixa-média | firewalls fortes; só legal tem QA disso | — | Testar contaminação no 1º uso real dos outros | P3 |
| R-10 | Ausência de visão de produto | média | dupla identidade laboratório/ferramenta | Energia drenada do valor real | Decisão explícita do operador (§23) | P2 |
| R-11 | Dificuldade de manutenção | média | schema drift, YAML inválido, frontmatters quebrados | Erosão da fonte de verdade | Lint automatizado (script de 50 linhas resolve) | P1 |
| R-12 | Dependência de modelo caro | média | todo o sistema assume leitura profunda de docs longos | Custo recorrente alto | Compactação reduz o problema na origem | P2 |
| R-13 | Perda de contexto em chats longos | baixa | context packs existem e são bons | — | Formalizar cadência | P3 |
| R-14 | Crescimento sem pruning | alta | nenhum agente/skill jamais arquivado ou fundido | Massa morta acumula | Lifecycle com critério de arquivamento | P2 |
| R-15 | Falta de dashboard | média | inexistente | Operador sem visão global barata | Master index (1 arquivo) | P1 |
| R-16 | Falta de compactação | alta | logs, registry, AGENT.md | ver R-02/R-03 | idem | P1 |
| R-17 | Falta de lifecycle de agentes | média | sem critérios de ativação/aposentadoria | Dormência eterna OU ativação ad-hoc | Definir critérios objetivos (§19) | P2 |
| R-18 | Agentes demais antes de uso real | **alta** | 8 drafts esperando o mesmo ciclo caro | Multiplicação do custo R-01/R-02 | Moratória de novos agentes | **P0** |
| R-19 | Rastreabilidade inteira fora do git | **crítica** | 1 commit; tudo uncommitted; deleções pendentes | Um acidente de working tree apaga a história que todo o sistema existe para preservar | Commit baseline imediato | **P0** |

---

## 16. Failure Mode Analysis

| failure_mode | trigger | propagation_path | detection_method | containment | recovery | severity |
|---|---|---|---|---|---|---|
| Agente ativado indevidamente | Subagente invocado sem boot/contexto; sessão visitante lendo AGENT.md como instrução | output do agente → decisão do operador | Hoje: só atenção humana. Falta: bloqueio na 1ª linha | Firewalls ≠ no próprio doc (parcial) | Encerrar sessão; registrar evento | alta |
| SQL executado em ambiente errado | Operador/LLM copia draft para shell | banco local → falsa sensação de "sistema implementado" | Sufixo de arquivo + header (forte) | Drafts isolados em dir explícito | rollback drafts existem | baixa (bem mitigada) |
| Fonte auxiliar virando autoridade | Bloco `confidence:referencial` citado como vigente | resposta normativa → decisão de campo | Etiqueta confidence (existe); falta verificação de vigência | SOURCE-FIRST + "vigência não confirmada" | Corrigir + registrar lacuna | alta (domínio de vida) |
| RAG contaminado | ingestão futura sem validação | índice → todas as respostas downstream | gates do rag-agent (norm_library versionada antes) | rag_enabled:false global | reindexar de fontes limpas | média (futura) |
| Registry e AGENT.md divergindo | edição em um sem o outro | decisões baseadas no documento errado | Hoje: auditoria manual (9.0C fez isso) | tripla redundância | reconciliar pelo evolution log | média — **já ocorrendo em forma leve (schema drift)** |
| Log crescendo até ficar inútil | append-only sem snapshot | custo de leitura → ninguém lê → log vira ritual | tamanho do arquivo (já 325KB) | nenhum | snapshot + arquivo morto | alta — **em curso** |
| Prompt gigante virando gargalo | "leia o estado do sistema" ingênuo | sessão queima contexto antes de trabalhar | percepção do operador | context packs (quando usados) | master index | alta — **em curso** |
| Skill duplicada com comportamento inconsistente | layers v1/v2; consolidado vs subs; skill vs agente homônimo | LLM lê a versão errada → resposta divergente | nenhum automático | nenhuma | definir canônico + arquivar | média |
| Agente sem fronteira respondendo fora do domínio | pergunta ambígua + agente já carregado | resposta com persona errada | watchdog local (documental) | non-mission lists (boas) | re-rotear via meta-router | baixa-média |
| Operador perdendo visão global | estado distribuído em 550KB+ de docs | decisões com mapa mental defasado | esta auditoria é o sintoma | context packs | master index + dashboard | alta |
| Modelo caro para tarefa pequena | toda interação carrega arquitetura pesada | custo recorrente | nenhuma métrica | regra de ativação proporcional (documental, boa) | budget de contexto | média |
| Sistema para de entregar valor por excesso de QA | próxima rodada de "QA do patch do QA" | desmotivação do operador → abandono do sistema | **0 usos reais após 16 agentes é o alarme já tocando** | — | §22 STOP | **crítica** |

---

## 17. What Is Working Well

1. **Rastreabilidade documental** — cada mudança tem evento, rationale, evidência e rollback_path. Raro até em times profissionais.
2. **Prudência antes de execução** — a separação design/QA/patch/plano/dry-run/execução é real e nunca foi violada (verificado: todos os invariantes do legal-agent false/0).
3. **Divisão por domínio** — fronteiras de agentes limpas, interfaces irata↔inspection tratadas explicitamente, firewall lotofa↔asset absoluto e respeitado.
4. **Firewalls epistêmicos `X ≠ Y`** — a melhor inovação do sistema; ataca exatamente o modo de falha de LLMs (colapso de níveis).
5. **Evolução incremental governada** — os ciclos 6.x (irata) e 7.x (inspection) mostram cadência saudável: QA comportamental → pacote monitorado → QA do pacote → correções → promoção.
6. **Preservação do operador primário** — modo visitante por default, calibração exclusiva, nenhum documento usurpa autoridade.
7. **Documentação de invariantes** — o estado "nada foi executado" é provável, não apenas declarado.
8. **Context packs** — empacotamento de continuidade com manifest e checksums.
9. **Honestidade dos placeholders** — rag-agent declara "NÃO IMPLEMENTADO" em vez de fingir capacidade.
10. **Estrutura com potencial de framework** — _schemas + _common + templates formam um DNA replicável de verdade; o padrão de pacote de uso monitorado (USE_MONITORED + INTERFACE + SCENARIOS) é exportável para qualquer domínio de risco.
11. **norm_library** — proveniência, separação public/private, lacunas declaradas, gitignore correto para material licenciado. É um ativo real.

---

## 18. What Is Overbuilt or Heavy

1. **O protocolo legal-agent das iterações 8.9A→9.0B** — QA de plano, patch de plano, QA do patch do plano, para artefatos que não podem ser executados. Simplificar para: design → 1 QA → patch → pronto.
2. **Registry notes** — 6.000 palavras na entrada do legal-agent. Deve ser ≤5 linhas + ponteiro.
3. **Repetição de invariantes no log** — o mesmo bloco de 25 linhas dezenas de vezes. Referenciar por ID.
4. **AGENT.md de 35-77KB** — o padrão completo cabe em 6KB (learn-agent prova). Corpo ≤10-15KB, resto em anexos.
5. **19 proxies de 1KB no fw-core + layers v1/v2 coexistindo** — arquitetura sem uso prático suficiente para justificar a fragmentação.
6. **40+ sub-skills anãs no asset-core** (300-900 bytes cada) — pulverização que custa navegação sem ganhar modularidade real.
7. **Medo excessivo de execução, em um ponto específico:** o dry-run do legal-agent é a criação de tabelas vazias em SQLite local. O risco real é ~zero; o processo o trata como deploy de produção. A prudência está certa como hábito; a dose está errada neste caso.
8. **Onde a segurança virou ritual:** anti-headers repetidos 10+ vezes no mesmo documento; QA de observações cosméticas com pipeline completo; tripla escrita (registry+AGENT.md+log) de cada micro-evento.
9. **Massa morta no repo:** zips na raiz, dirs `_*_unpack/`, `para_gpt/`, `pt/`+`en/` duplicando docs, `_staging/`, `_historico/`.

---

## 19. Missing Pieces

| lacuna | existe hoje? | forma mínima viável |
|---|---|---|
| Camada de auditoria global | a partir de agora (este relatório + 9.0C local) | pasta .claude/audits/ + cadência |
| Dashboard de estado / master index | **não** | 1 arquivo MD, 16 linhas, 6 colunas |
| Resumo compacto por agente | parcial (context packs) | seção fixa de 10 linhas no topo de cada AGENT.md |
| Schema unificado de eventos | parcial (schema existe, não é imposto) | lint script + proibição de duplicar invariantes |
| Política de arquivamento | **não** | regra: artefato sem uso/edição em 90 dias → candidato a archive |
| Lifecycle de agentes | parcial (estados existem; critérios de transição não) | critérios objetivos para draft→review→active→archived |
| Critérios para ativação | **não** (só "aprovação do operador") | checklist: QA + uso monitorado N vezes + custo aceito |
| Critérios para aposentadoria/sleep | **não** | ver política de arquivamento |
| Governança de custo/tokens | **não — lacuna mais grave da lista** | budget por tipo de tarefa; proibir leitura integral de logs |
| Backup/restore de contexto | parcial (packs) | cadência formal pós-marco |
| Operator console | não | o master index É o console v0 |
| Templates globais | parcial (_common) | promover: preflight de conector, header bloqueante, pacote monitorado |
| Compactador de logs | **não** | snapshot manual por marco já resolve 80% |
| Mapa de dependência entre agentes | parcial (can_call no registry) | 1 diagrama gerado do registry |
| Política de uso de modelo caro | **não** | 5 linhas no CLAUDE.md |
| Priorização de produto/uso real | **não** | decisão do operador (§23) |
| **Git como prática** | **não — pré-requisito de tudo acima** | commit baseline + commit por iteração |

---

## 20. Recommended Architecture Adjustments

### Immediate

| recommendation | why | expected_benefit | risk_if_ignored | effort |
|---|---|---|---|---|
| **Commit baseline no git** (resolver deleções pendentes, commitar estado, daí commits por iteração) | Regra constitucional 9 está sendo violada na prática; 70 eventos de rastreabilidade vivem em arquivos não versionados | A rastreabilidade passa a ser real, com diff, blame e rollback de verdade | Perda irrecuperável da história em um acidente | baixo |
| **Corrigir registry**: remover chaves duplicadas, alinhar versão do header, encolher notes para ≤5 linhas + ponteiro | Fonte de verdade não pode falhar em lint YAML | Registry volta a ser machine-readable e auditável por script | Divergência silenciosa crescente | baixo |
| **Atualizar CLAUDE.md** (status real dos agentes; lotofa; skills quebradas) | É o documento carregado em TODA sessão — hoje desinforma | Boot correto em toda sessão | LLM opera com mapa falso | baixo |
| **Corrigir frontmatter de skill-router e operator-lock** | Aparecem como "---" no ambiente — invocação quebrada | Skills funcionais ou arquivadas conscientemente | Comportamento errático de roteamento | trivial |
| **Bloqueio na 1ª linha dos docs de agente invocáveis como subagente** | T-03: a trava precisa estar antes do conteúdo, não no meio | Mitiga invocação indevida sem harness | Agente draft usado como operacional | baixo |

### Short-term (próximas 2-4 semanas)

| recommendation | why | expected_benefit | risk_if_ignored | effort |
|---|---|---|---|---|
| **Master index / dashboard** (1 arquivo) | R-15; visão global custa hoje 550KB de leitura | Estado do sistema em 1 tela | Operador decide com mapa defasado | baixo |
| **Classes de mudança** com processo proporcional: Classe A (toca dados reais/conector/autoridade) = protocolo completo; Classe B (design/doc) = 1 QA; Classe C (cosmético) = registro de 3 linhas sem QA | R-01/R-07: o custo do processo deve seguir o risco do objeto | Desinflamação imediata; entrega volta a andar | QA infinita mata o sistema por fadiga | baixo |
| **Snapshot do evolution log** (compactar série legal 8.0-9.0C em 1 resumo; log ativo só do ciclo corrente) | R-03 | Leitura de estado barata | Log write-only | médio |
| **Política de log de sessão** (rotação por tamanho/idade do session_inputs.log) | T-05/T-06 | Contenção de dado sensível | Vazamento em backup/cópia futura | trivial |
| **Mover/ignorar PDFs IRATA** dos agents para norm_library ou .gitignore | T-07 | Sem redistribuição acidental de material licenciado | Violação de termos no primeiro push | trivial |

### Medium-term (1-2 meses)

| recommendation | why | expected_benefit | risk_if_ignored | effort |
|---|---|---|---|---|
| **3 usos monitorados reais registrados** (irata ou inspection, template UM-*) antes de qualquer novo agente/protocolo | R-07: o sistema nunca foi testado contra a realidade | Feedback real recalibra tudo — inclusive o que vale a pena documentar | Sistema otimiza para a métrica errada (volume documental) | médio (disciplina, não código) |
| **QA comportamental do asset-agent** | Único domínio com dados reais + risco crítico + zero validação | O órgão vital ganha anticorpos | Erro financeiro real sem trava testada | médio |
| **Lint automatizado** (script: valida registry contra schema, frontmatters, chaves duplicadas) | R-11; o sistema tem schemas mas nada os impõe | Drift detectado em segundos, não em auditorias | Erosão contínua | baixo (50-100 linhas Python — já existe pyproject) |
| **Limpeza do repo** (zips, unpacks, pt/en duplicados, _staging) | higiene; massa morta confunde leituras | Repo navegável | Confusão crescente sobre o que é canônico | baixo |

### Later

- Harness real de dry-run do legal-agent (9.1) — *depois* dos usos reais dos agentes prontos;
- RAG sobre norm_library (o ativo já justifica; o processo legal-agent 8.4 é o template de segurança);
- Decisão formal sobre camada de agentes como subagentes Claude Code reais (com permissões do harness) vs. documentos de persona — hoje é híbrido não declarado.

---

## 21. Recommended Next 30 Steps

**Estabilização (1-6)**
1. Resolver deleções pendentes no git (confirmar intenção de cada `D`).
2. Commit baseline: "CORE-OS state 2026-06-11 — pre-audit-001 baseline".
3. Corrigir chaves YAML duplicadas no registry (legal-agent, inspection-agent).
4. Alinhar versão do header do registry com `registry.version`.
5. Atualizar CLAUDE.md: status reais, lotofa, nota sobre camada de agentes ser documental.
6. Corrigir frontmatter de skill-router; arquivar operator-lock.

**Compactação (7-12)**
7. Encolher `notes` de legal-agent e inspection-agent no registry para ≤5 linhas + ponteiros.
8. Snapshot da série legal 8.0→9.0C no evolution log (1 resumo de ~100 linhas; original vira arquivo morto referenciado).
9. Snapshot das séries 6.x/7.x (irata/inspection).
10. Regra de log: invariantes referenciados por ID do evento anterior, nunca repetidos.
11. Rotação do session_inputs.log + política de retenção.
12. Mover zips/unpacks/_staging/para_gpt para `_historico/` ou deletar (decisão do operador).

**Auditoria e visibilidade (13-16)**
13. Criar `AGENT_MASTER_INDEX.md` (16 linhas, 6 colunas, gerável do registry).
14. Script `lint_registry.py`: schema check + duplicate keys + frontmatter scan (consolida os scans JSON já feitos em docs/reports).
15. Consolidar achados das auditorias de 2026-06-08 (estão escritos e ignorados).
16. Adicionar `review_validated` ao schema OU renomear o status — decidir e alinhar.

**Padronização (17-20)**
17. Promover a templates globais: header bloqueante de draft, preflight de conector, pacote de uso monitorado.
18. Definir classes de mudança A/B/C com processo proporcional (documento de 1 página).
19. Definir lifecycle de agente com critérios objetivos de transição e arquivamento.
20. Teto de AGENT.md: corpo ≤15KB; excedente vira anexo.

**Uso real — o centro de tudo (21-25)**
21. Executar 1 uso monitorado real do irata-agent (caso de campo real, template UM-IRATA-001).
22. Executar 1 uso monitorado real do inspection-agent (UM-INSP-001).
23. Executar os QA_TESTS de roteamento do manifesto ("testar reflexo") em sessão real.
24. Retro de 1 página após cada uso: o que o agente acertou, errou, custou.
25. Só então decidir o próximo investimento de arquitetura — com dados de uso, não por impulso de construção.

**Agentes prioritários (26-27)**
26. QA comportamental do asset-agent (o gap de risco mais grave do sistema).
27. Congelar legal-agent em 9.0C até existirem 3 usos reais de outros agentes — o harness 9.1 não perde validade esperando.

**Custo e governança (28-30)**
28. Política de contexto: proibir leitura integral de logs em sessão de trabalho; máximo 1 context pack + master index.
29. Política de modelo: tarefas de classificação/roteamento/limpeza em modelo barato; análise de domínio de risco em modelo caro.
30. Agendar CORE_SYSTEM_AUDITION_002 após os 3 primeiros usos reais (não por calendário — por marco de uso).

---

## 22. Stop / Continue / Start

### STOP
- **Parar de criar agentes e protocolos novos.** 16 agentes, 0 usos. O gargalo não é capacidade — é validação pela realidade.
- Parar de rodar pipeline completo de QA para observações cosméticas (classes de mudança resolvem).
- Parar de repetir blocos de invariantes verbatim em cada evento de log.
- Parar de escrever AGENT.md de 40-80KB — o padrão cabe em 6-15KB.
- Parar de acumular trabalho fora do git.
- Parar de tratar o registry como diário — notes não é changelog.

### CONTINUE
- Continuar com firewalls `X ≠ Y` — em tudo que for novo.
- Continuar com active:false + aprovação humana explícita como gate de ativação.
- Continuar com context packs no fechamento de marcos.
- Continuar com a cadência QA comportamental → pacote monitorado → promoção (modelo 6.x/7.x — este sim é o protocolo certo).
- Continuar com a honestidade de placeholders e declaração de lacunas.
- Continuar protegendo o modo primário e o perfil do operador.

### START
- Começar a **usar** os agentes validados em casos reais com o template UM-* (a única coisa que o sistema ainda não fez).
- Começar a commitar — cada iteração, um commit.
- Começar a medir custo (tokens por sessão de trabalho típica; tamanho dos artefatos lidos).
- Começar o master index e os snapshots de log.
- Começar o QA do asset-agent.
- Começar a arquivar (operator-lock, layers v1, all_in_one, zips) — o sistema precisa aprender a enterrar.

---

## 23. Model Opinion / Auditor Verdict

**O sistema está ficando bom?** Sim — e isso precisa ser dito sem rodeio: a disciplina epistêmica, os firewalls de colapso de nível, a separação design/execução e a rastreabilidade são melhores do que a maioria dos frameworks de agentes publicados que conheço. O CORE-OS entendeu algo que muito sistema "sério" não entendeu: o principal risco de LLM não é capacidade, é **confusão de status epistêmico** — e construiu defesas reais contra isso.

**Está ficando excessivamente complexo?** Está ficando excessivamente *documentado*, que é diferente e mais tratável. A complexidade essencial (domínios, autoridade, firewalls) é justificada. A complexidade acidental (logs monolíticos, tripla escrita, QA recursiva, AGENT.md inflados) é gordura removível sem tocar na arquitetura.

**Está virando o quê?** Hoje: um *laboratório de governança de agentes* com uma *biblioteca de domínio* valiosa acoplada. A vocação declarada — organismo operacional a serviço do operador — ainda não se realizou porque o organismo nunca saiu da UTI documental. O risco institucional número 1 não é técnico: é o sistema continuar gerando a sensação de progresso (iterações, QAs, promoções) sem gerar valor (decisões melhores na carteira, no processo, no campo).

**O que impressiona:** a integridade. Em ~900KB de documentação do legal-agent, não encontrei uma única contradição de estado ou invariante violado. Isso é raríssimo.

**O que preocupa:** três coisas, em ordem. (1) **Zero uso real** após um mês de construção intensa — o sistema está otimizando a métrica errada. (2) **Git com 1 commit** — toda a tese de rastreabilidade repousa em arquivos não versionados; é o calcanhar de aquiles de tudo. (3) **Assimetria de risco** — o domínio financeiro, único com dados reais e risco crítico, é o menos validado do sistema, enquanto o legal-agent (que ainda não pode tocar nada) recebeu 27 iterações.

**A decisão arquitetural mais importante agora:** declarar formalmente que a fase de anatomia acabou — exatamente o que o manifesto já pediu em maio ("testar reflexo, não criar anatomia") e que a camada de agentes, na prática, ignorou ao criar 16 agentes. A próxima unidade de progresso do CORE-OS não é um documento: é um registro UM-IRATA-001 preenchido com um caso real.

**O que deve ser compactado antes de crescer mais:** evolution log, registry notes, AGENT.md grandes — nessa ordem.

**Qual camada merece prioridade:** uso monitorado real (irata/inspection) + QA do asset-agent.

**O que não merece energia agora:** harness 9.1 do legal-agent, novos agentes, novos protocolos de governança, RAG.

---

## 24. Final Readiness Verdict

```yaml
final_verdict: coherent_but_heavy
secondary_condition: early_stage_documentation_hypertrophy   # câncer documental em estágio inicial, operável
confidence: high       # baseado em leitura direta de registry, logs, 16 agentes, 20 skills, schemas e packs
blockers:
  - B-01: git não usado — rastreabilidade inteira em arquivos não versionados (R-19)
  - B-02: zero uso real — nenhuma validação do sistema contra a realidade (R-07)
reviews:
  - REV-01: registry com YAML inválido (chaves duplicadas) e schema drift
  - REV-02: CLAUDE.md desinformando o boot de toda sessão
  - REV-03: asset-agent crítico sem QA
  - REV-04: PDFs IRATA fora do gitignore
  - REV-05: session_inputs.log sem rotação
recommended_next_action: >
  Não criar nada novo. Sequência: (1) commit baseline no git;
  (2) correções imediatas do §20 (registry, CLAUDE.md, frontmatters);
  (3) primeiro uso monitorado real (UM-IRATA-001 ou UM-INSP-001);
  (4) só então decidir o próximo investimento arquitetural — com dados de uso.
```

**Frase final do auditor:** o CORE-OS construiu um sistema imunológico de elite para um organismo que ainda não respirou. As defesas são reais, a anatomia é coerente, o DNA é replicável — falta o ato mais simples e mais difícil: viver um caso real e deixar a realidade auditar o sistema. Nenhum QA substitui isso.

---

*Relatório gerado em 2026-06-11 por CORE_SYSTEM_AUDITION_001. Auditoria read-only — nenhum arquivo do sistema foi modificado além da criação deste relatório.*
