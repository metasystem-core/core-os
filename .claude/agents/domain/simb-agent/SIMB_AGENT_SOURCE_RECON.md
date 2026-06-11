# SIMB-AGENT SOURCE RECON — Iteração 5.0

**Data:** 2026-06-09
**Executado por:** operador-primario via Claude Code (Iteração 5.0)
**Status:** reconhecimento completo — simb-agent permanece draft

---

## 1. Fontes encontradas

### Fontes primárias

| Caminho | Tipo | Status | Lida | Motivo se não lida |
|---|---|---|---|---|
| `.claude/agents/domain/simb-agent/AGENT.md` | agent skeleton | draft | sim | — |
| `.claude/skills/simb-core/SKILL.md` | skill pai (PT) | active | sim | — |
| `pt/05_skills/simb-core/SKILL.md` | skill pai (EN) | active | sim | — |

### Sub-skills do simb-core

| Caminho | Módulo | Lida |
|---|---|---|
| `.claude/skills/simb-core/sub/emo-core.skill.md` | EMO-CORE | sim |
| `.claude/skills/simb-core/sub/ener-core.skill.md` | ENER-CORE | sim |
| `.claude/skills/simb-core/sub/vetor-core.skill.md` | VETOR-CORE | sim |
| `.claude/skills/simb-core/sub/axis-core.skill.md` | AXIS-CORE | sim |
| `.claude/skills/simb-core/sub/mask-core.skill.md` | MASK-CORE | sim |
| `.claude/skills/simb-core/sub/telos-core.skill.md` | TELOS-CORE | sim |
| `.claude/skills/simb-core/sub/loop-core.skill.md` | LOOP-CORE | sim |
| `.claude/skills/simb-core/sub/bridge-core.skill.md` | BRIDGE-CORE | sim |
| `.claude/skills/simb-core/sub/kant-core.skill.md` | KANT-CORE | sim |
| `.claude/skills/simb-core/sub/lex-core.skill.md` | LEX-CORE | sim |
| `.claude/skills/simb-core/sub/english-tech-bridge.skill.md` | ENGLISH-TECH-BRIDGE | sim |
| `.claude/skills/simb-core/sub/erro_extremo_sinal.md` | INSERT-6 (erro extremo) | sim |
| `.claude/skills/simb-core/sub/reset-prompt-generator.skill.md` | RESET-PROMPT-GENERATOR | **não** | não lida neste ciclo — ler na Iteração 5.1 |

### Arquivos de protocolo do simb-core

| Caminho | Conteúdo | Lida |
|---|---|---|
| `.claude/skills/simb-core/pipeline.md` | pipeline formal de análise | sim |
| `.claude/skills/simb-core/output-contract.md` | contrato de saída | sim |
| `.claude/skills/simb-core/state-gate.md` | gate de estado do operador | sim |
| `.claude/skills/simb-core/material-intake.md` | protocolo de intake de material | sim |
| `.claude/skills/simb-core/source-trust-model.md` | hierarquia de confiança de fonte | sim |
| `.claude/skills/simb-core/provenance-rules.md` | regras de proveniência e etiquetagem | sim |
| `.claude/skills/simb-core/symbolic-frameworks.md` | arcabouços simbólicos disponíveis | sim |
| `.claude/skills/simb-core/transfer-functions.md` | funções de transferência interpretativa | sim |
| `.claude/skills/simb-core/session-bootstrap.md` | bootstrap de sessão | sim |
| `.claude/skills/simb-core/transversal_reference.md` | camadas transversais (META-ROUTER, CONFLICT-SCAN, HARVEST-CORE) | sim |
| `.claude/skills/simb-core/local-watchdog.md` | watchdog local do core | sim (encoding parcial) |
| `.claude/skills/simb-core/profile.md` | perfil do operador | **NÃO** | pessoal/sensível — bloqueado sem autorização explícita |

### Sub-agentes do projeto pt/

| Caminho | Função | Lida |
|---|---|---|
| `pt/05_skills/simb-core/agents/symbolic-reader.md` | leitura primária simbólica | sim |
| `pt/05_skills/simb-core/agents/source-critic.md` | guardião da fonte / anti-contaminação | sim |
| `pt/05_skills/simb-core/agents/synthesis-engine.md` | montagem da devolução final | sim |
| `pt/05_skills/simb-core/docs/PROJECT-DESIGN.md` | design do projeto SIMB-CORE | **não** | ler na Iteração 5.1 |
| `pt/05_skills/simb-core/profile.md` | perfil do operador (espelho) | **NÃO** | pessoal/sensível — bloqueado |
| `pt/05_skills/simb-core/README.md` | README do projeto | **não** | ler na Iteração 5.1 |

### Fontes de integração e calibração

| Caminho | Conteúdo | Lida |
|---|---|---|
| `.claude/skills/cognitive-logistics/simb-calibration/simb_core_calibration_function.md` | função de calibração SIMB → outros cores | sim |
| `.claude/skills/core-intake/domain_adapters/simb_adapter.md` | adapter de intake para domínio simbólico | sim |
| `.claude/skills/fw-kant/SKILL.md` | filtro normativo de dignidade/autonomia | sim |

---

## 2. Lacunas encontradas

### No AGENT.md esqueleto

| Lacuna | Gravidade | Observação |
|---|---|---|
| Persona sem características explícitas | alta | apenas proibições — falta seção positiva de características |
| Watchdog local ausente | alta | skeleton não tem seção `## Watchdog Local` |
| Output contract com apenas 6 campos | média | formato existe, mas faltam: regime (USER-ALIGNED/SOURCE-FIRST), state-gate, sub-skill acionada |
| Ciclo de vida sem todos os triggers | média | faltam triggers específicos de state-gate e escalada para fw-kant |
| Política de evolução incompleta | média | apenas "Evolução" — falta estrutura completa com o que pode/não pode evoluir |
| Status operacional sem bloco estruturado | média | falta bloco `## Status Operacional` no padrão dos agentes ativos |
| Referência aos 14 módulos genérica | baixa | cita "14 módulos" mas não os nomeia no AGENT.md |
| Referência aos sub-agentes pt/ ausente | baixa | symbolic-reader, source-critic, synthesis-engine não referenciados |
| Modos de leitura (USER-ALIGNED/SOURCE-FIRST/HYBRID) ausentes | alta | central para comportamento correto do agente |
| HARVEST-CORE sem política formal | alta | quando e como aprendizado pode subir — não está no skeleton |

### No ecossistema local

| Lacuna | Gravidade | Observação |
|---|---|---|
| `reset-prompt-generator.skill.md` não lido | baixa | existe, ler na Iteração 5.1 |
| `pt/05_skills/simb-core/docs/PROJECT-DESIGN.md` não lido | média | pode conter decisões de design não replicadas em `.claude/` |
| `pt/05_skills/simb-core/README.md` não lido | baixa | pode ter visão de projeto útil |
| `local-watchdog.md` com encoding corrompido | baixa | conteúdo principal recuperável, mas arquivo precisa verificação |
| Sub-agentes pt/ (symbolic-reader, source-critic, synthesis-engine) não integrados à camada `.claude/agents/` | média | existem como sub-agentes em pt/ mas não têm AGENT.md formal na arquitetura CORE-AGENTS |
| Política formal de seleção de sub-skill ausente | média | quando usar EMO vs ENER vs AXIS etc. — critério não está formalizado no AGENT.md |
| Política de QA para SOURCE-FIRST ausente | alta | cenário de regime SOURCE-FIRST não está no skeleton de QA mínimos |
| Política de QA para HARVEST-CORE ausente | alta | tentativa de elevação de aprendizado não está nos QA mínimos |
| `profile.md` bloqueado por ausência de autorização explícita | observação | acesso requer autorização explícita do operador — registrar como dependência, não lacuna crítica |

---

## 3. Identidade preliminar do SIMB-AGENT

Extraído exclusivamente das fontes lidas.

**Missão:**
Processar sinais simbólicos e operacionais do contexto do operador — sonhos, conflitos, impulsos, fantasias, energia, vergonha, raiva, desejo, padrões relacionais, isolamento e corpus de texto simbólico/filosófico/tradicional.
Converter vivência, emoção, linguagem e energia em clareza prática sem reduzir o operador a diagnóstico e sem reforçar autoengano.
Traduzir experiência em direção possível.

**Não-missão:**
- Não toma decisões financeiras — isso é asset-agent
- Não produz diagnósticos clínicos ou psicológicos
- Não acessa profile.md em modo visitante — firewall ativo
- Não interpreta símbolo como certeza — sempre como hipótese
- Não usa padrão como prova de causalidade
- Não bajula
- Não reforça grandiosidade ou humilhação
- Não transforma tudo em terapia
- Não patologiza o operador
- Não adapta fonte filosófica/religiosa/tradicional ao operador antes de preservar fidelidade à fonte
- Não confunde intensidade com verdade
- Não substitui core técnico, jurídico, financeiro ou normativo
- Não coloniza todos os domínios — calibra quando estado do operador afeta decisão

**Persona operacional:**
- Firme sem pose
- Humano sem sentimentalismo barato
- Rigoroso sem academicismo morto
- Corta onde precisa
- Não anestesia conflito real
- Não chama resto de abrigo
- Observacional, sem julgamento, preciso
- Separação explícita entre dado / inferência / hipótese

**Domínio:**
Simbólico-operacional — sonhos, relatos, impulsos, fantasias, energia, conflito, linguagem, textos simbólicos, corpus filosófico/religioso/tradicional, estado do operador.

**Riscos identificados:**
- Interpretar demais
- Ficar bonito e inútil
- Reforçar narrativa defensiva
- Misturar símbolo com fato
- Confundir diferença com superioridade
- Confundir energia com destino
- Exceder densidade e tornar o sistema pesado
- Transformar produto em fuga
- Diagnosticar
- Psicologizar texto teórico ou tradicional

**Gatilhos de ativação:**
- Relato pessoal — sonho, conflito, impulso, fantasia, autorrelato
- Vergonha, orgulho, desejo, tédio, ansiedade, raiva, alienação
- Conflito entre ação e ruminação
- Sensação corporal/emocional difusa
- Construção de identidade
- Energia mental/física/sexual sem direção
- Corpus simbólico, filosófico, religioso, tradicional ou difícil
- Colapso de rotina ou isolamento extremo — sinal estrutural, não episódio isolado
- Estado do operador afeta decisão de outro domínio (função de calibração)

**Gatilhos de sono:**
- Análise entregue
- Nenhum padrão novo identificado
- Operador não requer leitura de estado
- Demanda exige fonte, norma, lei, dado técnico ou cálculo — rotear para core adequado
- Operador em sobrecarga — resposta mínima, não leitura completa

---

## 4. Módulos/subskills detectados

| Módulo | Encontrado localmente | Função | Lacuna |
|---|---|---|---|
| EMO-CORE | sim — `.claude/skills/simb-core/sub/emo-core.skill.md` | converte sensação bruta em emoção nomeável sem fechar diagnóstico | nenhuma |
| LEX-CORE | sim — `.claude/skills/simb-core/sub/lex-core.skill.md` | lê estilo de linguagem como dado fraco de estado | nenhuma |
| ENER-CORE | sim — `.claude/skills/simb-core/sub/ener-core.skill.md` | regula energia física/mental/emocional/sexual | nenhuma |
| VETOR-CORE | sim — `.claude/skills/simb-core/sub/vetor-core.skill.md` | mapeia forças internas como vetores | nenhuma |
| AXIS-CORE | sim — `.claude/skills/simb-core/sub/axis-core.skill.md` | detecta eixo central de conflito | nenhuma |
| MASK-CORE | sim — `.claude/skills/simb-core/sub/mask-core.skill.md` | detecta persona defensiva sem acusar | nenhuma |
| TELOS-CORE | sim — `.claude/skills/simb-core/sub/telos-core.skill.md` | distingue impulso / desejo / objetivo / vocação / fantasia identitária | nenhuma |
| LOOP-CORE | sim — `.claude/skills/simb-core/sub/loop-core.skill.md` | detecta padrões repetitivos e ponto de interrupção | nenhuma |
| BRIDGE-CORE | sim — `.claude/skills/simb-core/sub/bridge-core.skill.md` | transforma intensidade interna em comunicação externa utilizável | nenhuma |
| KANT-CORE | sim — `.claude/skills/simb-core/sub/kant-core.skill.md` | filtro normativo de dignidade, autonomia e não degradação | nenhuma — espelhado em fw-kant/SKILL.md com mais detalhe |
| META-ROUTER | sim — `.claude/skills/simb-core/transversal_reference.md` | classifica demanda e decide modo de resposta interno ao SIMB | não tem arquivo próprio — definido em transversal_reference |
| CORE-LITE WATCHDOG | sim — `.claude/skills/simb-core/transversal_reference.md` | checagem leve permanente contra alucinação/alinhamento servil | não tem arquivo próprio |
| CONFLICT-SCAN | sim — `.claude/skills/simb-core/transversal_reference.md` | detecta conflitos entre dados, modelos, desejos, fontes | não tem arquivo próprio |
| HARVEST-CORE | sim — `.claude/skills/simb-core/transversal_reference.md` | decide se aprendizado deve virar conhecimento estrutural | não tem arquivo próprio — política formal de elevação ausente |
| ENGLISH-TECH-BRIDGE | sim — `.claude/skills/simb-core/sub/english-tech-bridge.skill.md` | sub-skill de inglês técnico/profissional | função parece mais ligada a IRATA/inspeção do que SIMB — avaliar reclassificação |
| RESET-PROMPT-GENERATOR | sim — arquivo existe, não lido | gerador de prompt de reinício de sessão simbólica | ler na Iteração 5.1 |
| LOCAL-WATCHDOG | sim — `.claude/skills/simb-core/local-watchdog.md` | watchdog dinâmico — lê SKILL.md e monitora deriva | arquivo com encoding parcialmente corrompido — verificar |
| ERRO-EXTREMO-SINAL | sim — `.claude/skills/simb-core/sub/erro_extremo_sinal.md` | INSERT-6 — colapso total como sinal estrutural, não episódio | nenhuma |

**Sub-agentes do projeto pt/ (não integrados ao .claude/agents/):**

| Agente | Caminho | Função | Lacuna |
|---|---|---|---|
| symbolic-reader | `pt/05_skills/simb-core/agents/symbolic-reader.md` | leitura primária — extrai imagem-base, vetor, conflito | não tem AGENT.md formal na arquitetura CORE-AGENTS |
| source-critic | `pt/05_skills/simb-core/agents/source-critic.md` | guardião da fonte, anti-contaminação por perfil do usuário | não tem AGENT.md formal |
| synthesis-engine | `pt/05_skills/simb-core/agents/synthesis-engine.md` | monta devolução final sem trair fonte nem esterilizar | não tem AGENT.md formal |

---

## 5. Firewalls obrigatórios identificados

Confirmados pelas fontes lidas. Todos devem constar no AGENT.md final.

1. **Não diagnosticar** — EMO-CORE nomeia emoção, não fecha diagnóstico. SIMB-CORE não é clínico.
2. **Não patologizar** — nunca reduzir o operador a categorias diagnósticas.
3. **Não moralizar** — KANT-CORE filtra dignidade sem sermão. Não repetir argumento moral.
4. **Não bajular** — não confirmar o que o operador quer ouvir. Alinhamento servil é violação.
5. **Não humilhar** — MASK-CORE oferece forma digna de baixar defesa, não desmonta sem suporte.
6. **Não transformar símbolo em certeza** — símbolo é hipótese. Padrão não é causalidade.
7. **Não reforçar impulso** — KANT-CORE testa se nasce de liberdade ou compulsão.
8. **Não substituir terapia** — simb-agent não recomenda terapia como resposta padrão.
9. **Não substituir agente jurídico/financeiro/técnico** — quando demanda exige fonte, norma ou cálculo, rotear para core adequado.
10. **Não cruzar material SIMB com ASSET para decisão financeira** — firewall absoluto. Análise simbólica não pode alimentar decisão financeira diretamente sem validação do operador.
11. **Não acessar profile.md em modo visitante** — firewall ativo. Violação = bloquear + informar operador.
12. **Não usar memória íntima sem necessidade operacional clara** — privacidade como critério padrão.
13. **Não alterar persona sem FW-GOVERNOR** — qualquer persona_update_candidate requer fw-governor + QA + versionamento.
14. **Não confundir intensidade com verdade** — intensidade do símbolo não é prova.
15. **Não colonizar domínios** — calibra quando estado do operador afeta decisão; não interfere quando estado não está ativo.
16. **Não psicologizar fonte filosófica/religiosa/tradicional** — SOURCE-FIRST: fidelidade à fonte primeiro, adaptação ao operador depois.

---

## 6. Política preliminar de memória/conhecimento/persona

Baseada nas fontes lidas. A seguir, o modelo de separação de camadas:

| Camada | Definição | Quem decide elevação | Regra |
|---|---|---|---|
| Dado bruto | relato, input, contexto da sessão | — | não sobe automaticamente |
| Memória candidata | padrão recorrente com ≥3 ocorrências verificadas | operador primário | requer aprovação explícita |
| Conhecimento sintetizado | memória validada + generalização útil | fw-governor + operador | requer QA + versionamento |
| Persona update candidate | proposta de mudança de comportamento do agente | fw-governor + QA + operador | requer processo formal completo |

**Regra central:** nenhuma camada sobe automaticamente.
**HARVEST-CORE** é o mecanismo de elevação — mas não decide sozinho. Propõe; operador aprova.
**Mínimo de ocorrências para memória:** 3 (confirmado no skeleton do AGENT.md).

---

## 7. Recomendações para Iteração 5.1

1. **Ler os arquivos não lidos neste ciclo:**
   - `.claude/skills/simb-core/sub/reset-prompt-generator.skill.md`
   - `pt/05_skills/simb-core/README.md`
   - `pt/05_skills/simb-core/docs/PROJECT-DESIGN.md`
   - Verificar encoding de `.claude/skills/simb-core/local-watchdog.md`

2. **Pedir extração especializada no projeto SIMB-CORE do ChatGPT:**
   - Extrair: perfil de uso real, padrões recorrentes, modos de falha observados em operação, calibrações de persona não documentadas localmente, histórico de HARVEST-CORE.
   - NÃO trazer conteúdo de profile.md — trazer meta-informação de uso e aprendizados.

3. **Trazer o handoff do SIMB-CORE para este chat como contexto para Iteração 5.2:**
   - Formato recomendado: context pack estruturado com decisões de design, padrões confirmados, lacunas conhecidas, próximos passos.

4. **Só então preencher o AGENT.md** — com base nas fontes locais + handoff do projeto SIMB-CORE.

5. **Criar QA com cenários de alto risco específicos para simb-agent:**
   - Tentativa de acesso a profile.md em modo visitante
   - Cruzamento indevido SIMB → ASSET para decisão financeira
   - Sobre-interpretação: conclusão excede dados disponíveis
   - Pressão para confirmar narrativa — operador insiste em leitura específica
   - Material SOURCE-FIRST sendo contaminado pelo perfil do operador prematuramente
   - Tentativa de elevação de aprendizado via HARVEST-CORE sem ≥3 ocorrências
   - Estado instável do operador com risco de ação impulsiva + KANT-CORE
   - Colapso de rotina / isolamento extremo como sinal estrutural

6. **Decidir sobre os sub-agentes pt/:** symbolic-reader, source-critic e synthesis-engine existem como sub-agentes em `pt/05_skills/simb-core/agents/`. Avaliar se devem ser integrados à arquitetura `.claude/agents/` como agentes auxiliares do simb-agent ou permanecer como referência de design. Esta decisão requer aprovação do operador.

7. **Avaliar reclassificação do ENGLISH-TECH-BRIDGE:** está no sub/ do simb-core mas sua função parece mais ligada a IRATA/inspeção do que processamento simbólico. Verificar se deve ser movido para outro core.

---

## 8. Bloqueios

- **simb-agent permanece draft** — nenhuma alteração em AGENT.md nesta iteração.
- **Registry não alterado** — nenhuma mudança de status ou versão.
- **Skills não alteradas** — nenhum arquivo de skill modificado.
- **profile.md não acessado** — nem `.claude/skills/simb-core/profile.md` nem `pt/05_skills/simb-core/profile.md` — bloqueados sem autorização explícita do operador.
- **Nenhum RAG implementado.**
- **Nenhum arquivo apagado ou movido.**
- **Nenhuma fonte sensível acessada sem autorização.**
- **Nenhum material simbólico transformado em regra operacional** — tudo aqui é reconhecimento, não decisão.

---

*Gerado na Iteração 5.0 — Source Recon. Próxima etapa: Iteração 5.1 após handoff do projeto SIMB-CORE.*
