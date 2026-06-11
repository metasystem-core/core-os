# CORE-OS — Delineamento Completo do Sistema
## Para revisão e análise por sistema externo
### Versão: BASELINE V2 — Maio 2026

---

## 1. O QUE É O CORE-OS

CORE-OS é um sistema modular de decisão, análise, tradução entre domínios e apoio operacional construído sobre IA conversacional (atualmente Claude Code / Claude Sonnet 4.6 — Anthropic).

Não é um chatbot genérico.
Não é um conjunto de prompts avulsos.
É uma arquitetura persistente com:

- **Camadas** (firmware, núcleo, cores especializados, sub-skills)
- **Firewalls** entre domínios incompatíveis
- **Modo de operador** com autenticação simbólica
- **Dados reais** gerenciados via arquivos versionados
- **Memória persistente** entre sessões
- **Suíte de testes QA** com 25 casos documentados

O operador é dono do sistema. A IA é intérprete.
Nenhuma plataforma é fonte de verdade. Os arquivos versionados são a fonte soberana.

---

## 2. PRINCÍPIO CENTRAL E HIERARQUIA CONSTITUCIONAL

```
Sobrevivência > Controle de risco > Liquidez > Convexidade > Retorno
```

**Regras constitucionais (sempre ativas):**

1. Todo core obedece ao Núcleo (FW-CORE).
2. Toda especialização declara seus limites.
3. Toda translação entre domínios é explícita.
4. Toda decisão relevante separa: dado / hipótese / modelo / conclusão / risco.
5. Inação é decisão válida.
6. Padrão não é lei. Recorrência não prova causalidade.
7. Sobrevivência antes de retorno.
8. O que não é chamado não existe operacionalmente.
9. Conversa não é registro. Arquivo versionado é registro.
10. Nenhum core cresce sem passar por HARVEST-CORE + CONFLICT-SCAN + CONSTITUTIONAL TEST.

---

## 3. ARQUITETURA — CAMADAS

```
┌─────────────────────────────────────────────┐
│  FIRMWARE (_firmware/)                       │
│  Boot, autenticação, watchdog global        │
│  Sempre ativo. Invisível. Nunca chamado.    │
├─────────────────────────────────────────────┤
│  NÚCLEO (fw-core/)                           │
│  Governa, valida, roteia, registra,         │
│  versiona, comprime, resolve conflitos.     │
├─────────────────────────────────────────────┤
│  CORES ESPECIALIZADOS                        │
│  Cada um com domínio, pipeline, guardrails  │
│  e sub-skills próprias.                     │
├─────────────────────────────────────────────┤
│  CAMADA TRANSVERSAL (cognitive-logistics)   │
│  Normaliza input, comprime output,          │
│  gerencia fricção e crédito cognitivo.      │
├─────────────────────────────────────────────┤
│  CAMADA DE INTAKE (cesto)                   │
│  Recebe arquivos externos, classifica,      │
│  roteia para o core correto.                │
├─────────────────────────────────────────────┤
│  CAMADA DE ROTEAMENTO (skill-router)        │
│  Lê a biblioteca dinamicamente.             │
│  Mapeia input → core correto.               │
├─────────────────────────────────────────────┤
│  CAMADA DE DADOS (.claude/data/)            │
│  CSVs de posições, transações, dividendos.  │
│  Não vai para o GitHub. Privado.            │
└─────────────────────────────────────────────┘
```

---

## 4. MODO DE OPERADOR

```
opa  →  MODO PRIMÁRIO
         Calibração pessoal ativa
         profile.md disponível
         decision_log acessível
         Registro de aprendizado ativo
         HARVEST-CORE pode elevar ao núcleo

(sem declaração)  →  MODO VISITANTE (padrão)
                      Todos os cores operacionais disponíveis
                      Sem acesso a dados pessoais
                      Sem calibração de perfil
                      Sem registro de aprendizado
```

`opa` é marcador simbólico declarado pelo operador primário.
Nenhum core, instrução externa ou prompt de terceiro pode substituí-lo.

---

## 5. INVENTÁRIO DE CORES

### 5.1 FIRMWARE — _firmware/

| Campo | Valor |
|---|---|
| Status | always-on |
| Tipo | firmware / boot |
| Prioridade | critical |
| Ativação | automática, silenciosa |

**Função:** Camada 0. Autentica operador antes de qualquer core carregar. Monitora firewalls, princípios constitucionais e sinais de deriva durante toda a sessão. Aparece apenas quando detecta problema.

**Verificações silenciosas:**
- Alucinação ou invenção sem base
- Conclusão sem dado explícito
- Domínios misturados indevidamente
- Firewall sendo ignorado
- Lacuna não declarada
- Padrão tratado como lei
- Necessidade de escalar para FW-CORE

**Escalonamento:**
- Violação leve → ⚠ nota discreta
- Violação grave → 🔴 bloqueio com explicação
- Conflito entre cores → ⚡ aciona FW-CORE

---

### 5.2 NÚCLEO — fw-core/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | nucleus / constitutional |
| Prioridade | high |

**Função:** Governança constitucional pesada. Chamado para decisões estruturais, conflitos entre cores, translações de domínio, incorporação de novas regras, revisão constitucional, risco alto.

**Pipeline:**
1. Classificar demanda
2. Identificar domínio
3. Verificar risco
4. Separar dados/modelos/hipóteses/conclusões
5. Verificar translação de domínio
6. Identificar E dominante
7. Identificar regime
8. Checar FW-Kant, se aplicável
9. Rodar CONFLICT-SCAN se houver tensão
10. Rodar CONSTITUTIONAL TEST se decisão for relevante
11. Escolher saída
12. Acionar EXECUTION-BRIDGE
13. Registrar decisão, se necessário

**Sub-skills do FW-CORE:**
- meta_router
- core_lite_watchdog
- conflict_scan
- harvest_core
- personalizacao_constitucional
- decision_pipeline
- domain_translation_protocol
- e_historico_engine
- fw_kant_filter
- regime_first_analyzer
- source_first_protocol
- camada_v_ebi_protocol
- Proxies dos cores secundários

---

### 5.3 ASSET-CORE — asset-core/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | specialized |
| Domínio | financeiro / patrimonial |
| Firewall | lotofa (absoluto) |

**Função:** Núcleo de decisão financeira, patrimonial e de alocação sob incerteza.

**O que faz:**
- Separa dados, hipóteses, modelos, emoções e conclusões
- Identifica regime de mercado
- Constrói E-Histórico
- Compara com CDI, Selic, NTN-B, caixa
- Avalia assimetria, robustez, liquidez, reversibilidade
- Dimensiona a decisão
- Termina com conduta operacional
- Registra decisões relevantes

**Estados decisórios:**

| Estado | Condição | Ação |
|---|---|---|
| Zona Verde | Dados suficientes, assimetria positiva, risco controlado | Agir em tamanho normal |
| Zona Amarela | Dados parciais ou risco moderado | Agir pequeno ou esperar |
| Zona Vermelha | Risco alto, dados insuficientes, estado emocional | Não agir ou manter caixa |
| Zona Azul | Tese em estudo | Observar, coletar, não executar |
| Zona EBI | Experimento de baixo impacto | Valor pequeno, sem escala automática |

**Classificação de saída obrigatória:**
não aporte / manter / observar / aporte simbólico / aporte pequeno / aporte neutro / aporte agressivo / EBI / venda parcial / venda total / revisão posterior

**Sub-skills:**
- asset_router
- asset_constitution
- behavioral_guardrails
- cross_core_firewall
- validation_tests
- regime_detector
- e_historico_engine
- valuation_orchestrator
- valuation_brasil_adapter
- fii_valuation_core
- btc_core_cre
- cash_and_cdi_core
- cri_cra_quality_analyzer
- pvp_discount_detector
- float_strategy_detector
- opportunity_detector
- position_sizing
- ebi_manager

**Regra de adaptação Brasil:** Nenhum valuation aplicado sem considerar CDI, Selic, NTN-B, IPCA, risco fiscal, risco regulatório, governança, tributação e liquidez B3.

---

### 5.4 SIMB-CORE — simb-core/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | specialized |
| Domínio | simbólico / subjetivo |
| profile.md | bloqueado em modo visitante |

**Função:** Leitura simbólico-operacional da experiência real. Converte vivência, emoção, conflito e direção em clareza prática — sem psicologizar nem reduzir o usuário a diagnóstico.

**Fórmula central:**
```
Experiência → leitura simbólica → filtragem normativa → direção prática → aprendizado acumulável
```

**Módulos internos:**
- META-ROUTER — classifica demanda
- CORE-LITE WATCHDOG — checa alucinação e alinhamento servil
- CONFLICT-SCAN — detecta conflitos internos
- HARVEST-CORE — decide se aprendizado sobe ao núcleo
- EMO-CORE — nomeia emoções
- LEX-CORE — lê linguagem como dado de estado
- ENER-CORE — regula energia física/mental
- VETOR-CORE — mapeia forças internas
- AXIS-CORE — detecta eixo de conflito
- MASK-CORE — identifica personas defensivas
- TELOS-CORE — separa impulso / desejo / objetivo / vocação
- LOOP-CORE — identifica repetições
- BRIDGE-CORE — traduz intensidade interna em comunicação
- KANT-CORE — filtra dignidade e autonomia

**Regra SOURCE-FIRST:** Em material filosófico, religioso, histórico ou técnico: fidelidade à fonte primeiro, tradução pessoal depois. Nunca adaptar material ao usuário antes de respeitar a fonte.

**Regra para sobrecarga:** Quando operador em tilt — reduzir complexidade, nomear estado, propor gesto mínimo. Não tomar decisão relevante sem amortecimento.

---

### 5.5 JURÍDICO-CORE — juridico/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | specialized |
| Domínio | direito brasileiro |

**Função:** Clareza, prudência e estratégia lícita no direito brasileiro.

**Pipeline:**
1. Tipo de demanda jurídica
2. Ramo do direito
3. Fonte/documento
4. Fase processual
5. Separações obrigatórias: fato / alegação / prova / norma / interpretação / consequência / risco / lacuna
6. Tradução técnica
7. Consequências possíveis
8. Riscos
9. Matriz de certeza: certo / provável / possível / especulativo / lacuna
10. Próxima ação prudente

**Guardrails permanentes:**
- Não substitui advogado
- Não promete resultado
- Não inventa lei, jurisprudência, prazo ou fato
- Não auxilia fraude, má-fé ou descumprimento de ordem judicial
- Estratégia lícita: jogar bem jogado, dentro da forma

---

### 5.6 IRATA-N3 — irata-n3/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | specialized |
| Domínio | trabalho em altura / acesso por cordas |

**Função:** Supervisão N3, gestão de equipe em altura, plano de resgate, APR/PT/AF, rastreabilidade de equipamentos e segurança operacional em campo.

**Estrutura obrigatória:**
1. Escopo normativo (NR-35, IRATA ICOP, NBRs aplicáveis)
2. Revisão de documentação disponível
3. Inspeção e rastreabilidade de equipamentos
4. Validação de procedimento e plano de resgate
5. Desvios identificados
6. Recomendação (reparo, monitoramento, substituição, liberação)

**Regras críticas:**
- Norma desatualizada = bloqueio
- Decisão verbal sem formalização = bloqueio
- Memória não substitui documentação vigente
- Verificar sempre: APR/PT/AF, certificados, rastreabilidade, plano de resgate, comunicação, isolamento de área

---

### 5.7 INSPECAO-END — inspecao-end/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | specialized |
| Domínio | inspeção técnica / END / NDT |

**Escopo:**
- Vasos de pressão, caldeiras, tubulações, tanques, reatores
- END: visual, espessura, LP, PM, US, estanqueidade, hidrostático/pneumático
- NR-13, API 510/570/579/653, ASME, ABNT NBR
- Mecanismos de dano, modos de falha, não conformidades

**Sub-skills:**
- damage-mechanisms
- ndt-selector
- report-contract
- finding-classifier

**Estilo:** Campo primeiro, laudo depois. Separar: fato / inferência / hipótese / conclusão / recomendação.

**Limites absolutos:** Não assina laudo, não emite ART, não libera equipamento crítico sem evidência.

---

### 5.8 DOC-INSPECAO — doc-inspecao/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | specialized |
| Domínio | documentação técnica / auditoria documental |

**Função:** Leitura crítica, confronto e auditoria de documentação técnica (databooks, prontuários, certificados, normas). Identifica lacunas, inconsistências, não conformidades.

**Dois modos:**
- **MODO DOCUMENTO:** centro = documento do equipamento → extrai, verifica, confronta com norma
- **MODO NORMA:** centro = norma → reconstrói requisitos, mapeia cobertura documental

**Sub-skills:**
- norm-reader
- gap-analyzer
- document-classifier
- finding-classifier

**Classificação de achados:**
- 🔴 Crítico — risco direto à segurança / não conformidade grave
- 🟡 Atenção — ponto que merece verificação
- 🔵 Observação — dado incompleto, divergência menor

---

### 5.9 LOTOFA-CORE — lotofa/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | specialized |
| Domínio | laboratório estatístico / Lotofácil |
| Firewall | asset-core (absoluto) |

**Função:** Laboratório estatístico controlado para Lotofácil. Modelagem por acertos e erros históricos. Uso lúdico e metodológico — nunca decisão financeira.

**Princípio central:**
```
U = {1..25}
H_t = números sorteados no concurso t
E_t = U \ H_t (ausentes)
Acertos(J, R_t) = 5 + |E_c ∩ E_t|
```

**Sub-skills:**
- e_historico
- score_plausibilidade
- generator_ensemble
- backtest_temporal
- version_registry
- random_baseline
- markov_lab
- linear_space
- statphys_tempering
- firewall_asset
- data_hygiene
- report_builder

**Firewall absoluto:** nenhuma conclusão do LOTOFA pode ser transferida para ASSET-CORE. Método é transferível. Conclusão não.

---

### 5.10 FW-KANT — fw-kant/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | operator / normativo |
| Domínio | ética / dignidade / autonomia |

**Função:** Filtro normativo de dignidade, autonomia e não degradação. Avalia qualquer ação, impulso, decisão ou estratégia em qualquer domínio.

**Teste central (7 perguntas):**
1. Isso trata a mim ou ao outro como mero meio?
2. Aumenta autonomia ou cria servidão?
3. Preserva dignidade ou gera degradação?
4. Poderia ser repetido como regra sem destruir o sistema?
5. Nasce de discernimento ou de compulsão?
6. Eleva e organiza — ou apenas descarrega tensão?
7. O operador conseguiria ver isso com clareza depois, sem racionalização?

**Saídas possíveis:**
- Aprovado
- Aprovado com limites
- Bloqueado
- Suspenso — clareza insuficiente
- Converter em ação superior

---

### 5.11 SKILL-ROUTER — skill-router/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | router / meta |
| Prioridade | critical |

**Função:** Percepção do sistema. Lê `.claude/skills/` dinamicamente, mapeia input para o core correto, detecta quando nenhuma skill cobre a necessidade, gerencia combinações validadas e firewalls.

**Biblioteca dinâmica:** não é lista estática. O router lê os headers de todos os SKILL.md a cada sessão e constrói o mapa automaticamente. Novo core instalado = router o conhece sem manutenção manual.

**Tabela de roteamento principal:**

| Input | Core |
|---|---|
| Estado interno, emoção, conflito, relação | simb-core |
| PDF / livro / texto externo | simb-core SOURCE-FIRST |
| Dinheiro, ativo, portfólio | asset-core |
| Trabalho em altura, resgate | irata-n3 |
| Análise técnica de equipamento, END | inspecao-end |
| Documento técnico, norma, laudo | doc-inspecao |
| Processo jurídico, prazo, documento legal | juridico |
| Lotofácil, estatística | lotofa |
| Ação com dimensão ética | fw-kant |
| Múltiplos domínios | fw-core + cores relevantes |
| Decisão estrutural do sistema | fw-core completo |

---

### 5.12 COGNITIVE-LOGISTICS — cognitive-logistics/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | transversal / infraestrutura |

**Função:** Organizar a circulação da informação entre usuário, cores, arquivos, memória e outputs. Não é core especializado — é infraestrutura de circulação.

**Fórmula:** caos de entrada → normalização → catálogo → roteamento → análise proporcional → próxima ação

**Sub-skills:**
- human_input_normalizer — aceita input bagunçado
- user_state_scanner — detecta estado antes de rotear
- credit_budget_core — evita desperdício de tokens
- friction_budget_core — reduz esforço do usuário
- output_compression_protocol — chat curto, arquivo completo
- large_document_layered_reader — mapa antes de leitura profunda
- user_vs_operator_protocol — distinção de funções
- impulse_vs_need_filter — desejo ≠ necessidade
- simb_core_calibration_function — SIMB como sensor, não colonizador

---

### 5.13 CESTO — cesto/

| Campo | Valor |
|---|---|
| Status | active |
| Tipo | intake universal |

**Função:** Classificar qualquer arquivo jogado na pasta `cesto/` e encaminhar para o core correto com contexto adequado.

**Processo obrigatório:**
1. Identificar tipo (PDF, CSV, texto, imagem)
2. Ler conteúdo ou estrutura
3. Classificar por domínio
4. Identificar core de destino
5. Extrair dados relevantes no formato do core
6. Encaminhar com contexto
7. Mover para `_processados/` ou `_rejeitados/`

**Tabela de destino:**

| Tipo de conteúdo | Core de destino |
|---|---|
| Documento jurídico, decisão | juridico-core |
| Extrato, nota de corretagem | asset-core |
| Laudo técnico, norma | inspecao-end + doc-inspecao |
| APR, PT, certificado IRATA | irata-n3 |
| Resultado Lotofácil, histórico | lotofa |
| Texto pessoal, relato, diário | simb-core |
| Dado ambíguo | skill-router |

---

### 5.14 OPERATOR-LOCK — operator-lock/ (STANDBY)

| Campo | Valor |
|---|---|
| Status | standby |
| Nota | Lógica migrada para o firmware. Mantido como referência histórica. Não chamar diretamente. |

---

## 6. FIREWALLS ABSOLUTOS

| Combinação | Status | Motivo |
|---|---|---|
| lotofa + asset-core | BLOQUEADO | Conclusão estatística de loteria não transfere para decisão financeira |
| Calibração SIMB-CORE em modo visitante | BLOQUEADO | profile.md é exclusivo do operador primário |
| decision_log em modo visitante | BLOQUEADO | Dados privados protegidos por design |
| profile.md em modo visitante | BLOQUEADO | Idem |
| Calibração por terceiro | BLOQUEADO | Operador primário é único agente de calibração |
| Conclusão técnica sem evidência | BLOQUEADO | Firmware detecta e bloqueia |

**Translação válida vs. inválida:**
- Método de backtest temporal do LOTOFA → aplicado no ASSET: **VÁLIDO** (método se transfere)
- Conclusão de acerto em loteria → validando estratégia de investimento: **BLOQUEADO** (conclusão não se transfere)

---

## 7. CAMADA DE DADOS

**Localização:** `.claude/data/` — nunca vai ao GitHub (protegida por .gitignore)

### Arquivos ativos

| Arquivo | Conteúdo | Status |
|---|---|---|
| `positions.csv` | Posições atuais da carteira (ticker, qtd, PM, custo) | Ativo |
| `dividends.csv` | Histórico de dividendos recebidos | Ativo |
| `transactions.csv` | Histórico de transações | Criado em 09/05/2026 |

### Schemas disponíveis (templates)

- positions.csv.template
- transactions.csv.template
- dividends.csv.template
- alert_log.csv.template
- cash_accounts.csv.template
- document_log.csv.template
- parsed_alerts.jsonl.template
- watchlist.csv.template

### Estado atual da carteira (referência mai/2026)

Total investido: ~R$34.549
FIIs: 67,6% | Ações: 30,0% | ETF: 2,4%
15 ativos com PM registrado + 4 direitos de subscrição

---

## 8. SUÍTE DE TESTES QA

**Localização:** `.claude/QA_TESTS/CORE_OS_QA_TESTS.md`
**Total de testes:** 25
**Versão:** BASELINE V2 — Maio 2026

### Blocos de teste

| Bloco | Tema | Testes |
|---|---|---|
| Bloco 1 | Roteamento básico | QA-01 a QA-06 |
| Bloco 2 | Firewalls | QA-07 a QA-09 |
| Bloco 3 | Lacunas e zona de não conclusão | QA-10 a QA-12 |
| Bloco 4 | Translação entre domínios | QA-13 a QA-15 |
| Bloco 5 | Derivação e qualidade de resposta | QA-16 a QA-20 |
| Bloco 6 | Modo primário vs. visitante | QA-21 a QA-22 |
| Bloco 7 | Integração cross-core | QA-23 a QA-25 |

### Critério de aprovação do Baseline V2

O sistema está operacionalmente validado quando:
- QA-01 a QA-06 passam (roteamento básico)
- QA-07 a QA-09 passam (firewalls)
- QA-16 e QA-17 passam (qualidade de resposta)
- QA-23 e QA-24 passam (integração cross-core)

Os demais são validação contínua — não bloqueiam o baseline.

### Status atual de testes

Os testes foram **definidos** mas ainda **não executados formalmente** com registro.
A próxima fase do sistema é exatamente esta: rodar os 25 casos e registrar resultado/desvio/ação corretiva.

---

## 9. ESTADO OPERACIONAL — BASELINE V2

```
Cores ativos:         10
Cores standby:         1  (operator-lock)
Camada firmware:       1
Sub-skills totais:   158+
Watchdog:            100% de cobertura
Firmware:            v2 ativo
Skill-router:        dinâmico (leitura automática da biblioteca)
Memória:             persistente (arquivos .md entre sessões)
Dados reais:         carteira + histórico jurídico em uso ativo
```

---

## 10. O QUE O SISTEMA NÃO É

- Não é oráculo.
- Não substitui advogado, engenheiro, médico ou terapeuta.
- Não prevê o futuro.
- Não garante resultado.
- Não aprende por si só — aprende via HARVEST-CORE com decisão explícita do operador.
- Não é substituível por outro sistema sem migração consciente da arquitetura.

---

## 11. DOMÍNIOS REAIS EM OPERAÇÃO (mai/2026)

O sistema não é teórico. Está em uso com dados e decisões reais:

**Domínio financeiro (ASSET-CORE):**
- Carteira de ~R$34.500 com 15 ativos (FIIs, ações, ETF)
- Compras recentes registradas (GARE11, PORD11, HGLG11)
- Histórico de dividendos desde ago/2025
- Análise de alocação e concentração setorial em uso

**Domínio jurídico (JURÍDICO-CORE):**
- Acompanhamento de processo de reintegração de posse (nº 5001927-18.2025.8.13.0028)
- Arrolamento de espólio (nº 5000441-95.2025.8.13.0028)
- Estratégia de delay ativo documentada
- Acórdão TJMG favorável registrado e analisado

**Domínio técnico (IRATA-N3 / INSPECAO-END / DOC-INSPECAO):**
- Operador com certificação IRATA N3
- Uso para apoio a laudos e inspeções industriais em campo

**Domínio estatístico (LOTOFA-CORE):**
- Uso lúdico controlado com firewall ativo em relação ao ASSET-CORE

---

## 12. PRÓXIMA FASE

**A fase atual não é expansão. É validação.**

> "Testar reflexo. Não criar anatomia."

O sistema tem anatomia suficiente. O que falta é:
1. Rodar os 25 testes QA e registrar resultados
2. Identificar onde o sistema deriva, trava ou mistura domínios indevidamente
3. Corrigir antes de adicionar qualquer novo core
4. Documentar aprendizados operacionais via HARVEST-CORE

Critério de expansão: nenhum elemento entra no núcleo sem HARVEST-CORE + CONFLICT-SCAN + CONSTITUTIONAL TEST.

---

## 13. PERGUNTAS ABERTAS / PONTOS PARA ANÁLISE EXTERNA

As questões abaixo são apresentadas para revisão por sistema externo:

1. **Coerência da hierarquia:** A estrutura firmware → núcleo → cores especializados → sub-skills é suficientemente clara para evitar conflitos de jurisdição? Há lacunas de cobertura entre camadas?

2. **Robustez dos firewalls:** O firewall LOTOFA ↔ ASSET-CORE é a única combinação que justifica bloqueio absoluto? Há outros pares com risco de contaminação cruzada que não estão mapeados?

3. **Modo visitante:** O modelo atual (bloquear apenas profile/decision_log/aprendizado) é suficiente para proteger dados privados enquanto mantém utilidade operacional para visitantes legítimos?

4. **Translação entre domínios:** O critério "método se transfere, conclusão não" é operacionalmente verificável em tempo real pelo firmware? Ou requer intervenção manual do operador?

5. **Escalabilidade:** Com 158+ sub-skills e 10 cores, o sistema está próximo de um ponto onde a complexidade supera a utilidade? Qual seria o indicador de que chegou lá?

6. **Dependência de plataforma:** O sistema é construído sobre Claude Code (Anthropic). O que acontece com a arquitetura se a plataforma mudar ou se tornar inacessível? Há elementos portáveis e elementos não portáveis?

7. **Memória persistente:** O sistema usa arquivos .md como memória entre sessões. Isso é suficiente para continuidade operacional real? Qual é o maior risco de degradação silenciosa dessa memória ao longo do tempo?

8. **Testes QA não executados:** Os 25 casos estão definidos mas não registrados formalmente. Qual o risco de o sistema estar operando com falhas nos comportamentos que os testes verificariam — dado que o uso real começou antes da execução formal dos testes?

---

## 14. ESTRUTURA DE ARQUIVOS (mapa de referência)

```
core-os/
├── CLAUDE.md                          ← instruções de sessão (carregadas automaticamente)
├── feedbackgpt.md                     ← este documento
├── cesto/                             ← pasta de entrada de arquivos externos
├── _historico/                        ← arquivos históricos
├── _staging/                          ← área de trabalho temporária
├── pt/                                ← conteúdo em português estruturado
│   ├── 03_cores/                      ← definições de cores
│   └── 05_skills/                     ← skills em desenvolvimento/revisão
└── .claude/
    ├── CORE_OS_MANIFEST.md            ← documento soberano (lido primeiro)
    ├── QA_TESTS/
    │   └── CORE_OS_QA_TESTS.md        ← 25 casos de teste
    ├── data/                          ← dados privados (gitignored)
    │   ├── positions.csv
    │   ├── dividends.csv
    │   ├── transactions.csv
    │   └── schemas/                   ← templates de todos os arquivos de dados
    └── skills/
        ├── _firmware/
        │   ├── WATCHDOG.md            ← boot obrigatório
        │   └── SKILL.md
        ├── fw-core/SKILL.md
        ├── asset-core/SKILL.md
        ├── simb-core/SKILL.md
        ├── juridico/SKILL.md
        ├── irata-n3/SKILL.md
        ├── inspecao-end/SKILL.md
        ├── doc-inspecao/SKILL.md
        ├── lotofa/SKILL.md
        ├── fw-kant/SKILL.md
        ├── skill-router/SKILL.md
        ├── cognitive-logistics/SKILL.md
        ├── cesto/SKILL.md
        └── operator-lock/SKILL.md     ← standby
```

---

*Documento gerado em 09/05/2026. Fonte: leitura direta de todos os arquivos do sistema.*
*Versão do sistema: CORE-OS BASELINE V2 — Maio 2026.*
*Plataforma: Claude Code / Claude Sonnet 4.6 (Anthropic).*
