---
name: legal-agent-docmap
description: Mapeamento documental controlado das fontes jurídicas internas para o legal-agent. Criado em Iteração 8.1.
type: docmap
agent: legal-agent
status_required: draft
active_required: false
created: "2026-06-10"
iteration: "8.1"
event: "EVT-20260610-044"
---

# LEGAL_AGENT_DOCMAP
## Mapeamento Documental Controlado — legal-agent

> **Advertência:** Este docmap mapeia fontes internas existentes.
> Fonte mapeada ≠ autoridade jurídica.
> Fonte mapeada ≠ peça protocolável.
> Fonte mapeada ≠ prazo confirmado.
> Fonte mapeada ≠ estratégia aprovada.
> Fonte mapeada ≠ orientação de advogado.
> Nenhum documento processual real foi lido nesta iteração.

---

## 1. Objetivo

Este docmap mapeia as fontes jurídicas internas existentes no projeto CORE-OS para orientar o `legal-agent` sobre quais capacidades ele possui, de onde vêm e como devem ser usadas.

**O que este docmap NÃO faz:**
- Não analisa processos reais;
- Não ingere documentos jurídicos reais;
- Não calcula prazos;
- Não cria estratégia processual;
- Não confere autoridade jurídica ao agente;
- Não substitui advogado, juízo, consulta processual oficial ou protocolo.

---

## 2. Estado do legal-agent

| Campo | Valor |
|---|---|
| status | draft |
| active | false |
| version | 0.1-draft |
| operational_authority | none |
| jurisdiction_default | Brazil |
| language | pt-BR |
| Iteração de abertura | 8.0 — EVT-20260610-043 |
| Iteração de docmap | 8.1 — EVT-20260610-044 |

---

## 3. Fontes Encontradas — Inventário Geral

| Fonte | Tipo | Função | Uso Permitido | Uso Proibido | Risco | Status Documental |
|---|---|---|---|---|---|---|
| `juridico/SKILL.md` | Skill principal | 4 modos operacionais, source-first, guardrails, pipeline de 10 passos | Guiar análise documental, estratégia, prazo, análise de alegação | Substituir advogado, prometer resultado, inventar prazo | Alto — prazo errado é fatal | canônico ativo |
| `juridico/sub/` (32 arquivos) | Sub-skills | Capacidades jurídicas especializadas por grupo funcional | Apoio analítico estruturado com operador humano | Usar como decisão final, protocolar output | Alto — narrativa pode ser confundida com prova | canônico ativo |
| `juridico/templates/` (14 arquivos) | Templates | Estruturas prontas para organização jurídica | Rascunho de estudo, organização interna, preparação para advogada | Protocolar como peça, usar como laudo, assinar | Alto — template ≠ peça jurídica | auxiliar ativo |
| `juridico/manifest.json` | Registro | Inventário oficial da skill juridico V2 | Referência de arquitetura | Alterar sem controle de versão | Baixo | referência |
| `juridico/README.md` | Documentação | Arquitetura e função do módulo | Orientação de uso | — | Baixo | referência |
| `juridico/README_V2.md` | Documentação | Arquitetura V2 | Orientação de uso | — | Baixo | referência |
| `juridico/local-watchdog.md` | Watchdog | Monitorar deriva interna durante operação | Monitoramento silencioso | Substituir fw-governor | Baixo | auxiliar ativo |
| `core-intake/domain_adapters/legal_adapter.md` | Adapter | Intake de documentos jurídicos | Extrair metadados de documentos (tipo, processo, partes, prazo) | Dar conclusão jurídica sem leitura completa | Médio — não misturar com norm_library | auxiliar ativo |
| `fw-core/sub/juridico_proxy/SKILL.md` | Proxy | Explica normas, leis e decisões brasileiras | Tradução de juridiquês | Substituir advogado, inventar jurisprudência | Médio | auxiliar ativo |
| `AGENT.md` | Design do agente | Identidade, firewalls, lacunas, output contract do legal-agent | Referência de design e operação | Tratar como instrução ativa em draft | Baixo | design draft |
| `_archive/all_in_one/` (3 arquivos) | Arquivo | Versões históricas do JURIDICO-CORE | Referência histórica de arquitetura | Usar como fonte ativa | Baixo | arquivo inativo |

---

## 4. Mapeamento de Sub-Skills Jurídicas (32 sub-skills)

### Grupo 01 — Fundação / Protocolo

| Sub-skill | Finalidade | Input esperado | Output esperado | Firewalls relevantes | Risco | Uso em draft |
|---|---|---|---|---|---|---|
| `law_source_first_protocol.md` | Garantir fidelidade à fonte jurídica antes de adaptação | Documento ou pergunta jurídica | Análise com fonte explícita + declaração de lacuna se ausente | ENTENDIMENTO DO AGENTE ≠ ORIENTAÇÃO DO ADVOGADO | Alto — sem fonte, não opera | Sim, com supervisão |
| `legal_ethics_firewall.md` | Separar estratégia legítima de abuso, má-fé, fraude ou degradação | Qualquer demanda estratégica | Classificação Verde/Amarelo/Vermelho da conduta | ANÁLISE JURÍDICA ≠ DECISÃO JUDICIAL | Médio — firewall pode ser contornado se input for ambíguo | Sim |
| `operator_adaptation_protocol.md` | Uso genérico por qualquer operador | Contexto do operador | Coleta de tipo de demanda, ramo, fase, objetivo | — | Baixo | Sim |
| `user_intent_router.md` | Identificar intenção no início de sessão e chamar sub-skills corretas | Mensagem inicial do operador | Roteamento para sub-skills adequadas | — | Baixo — risco se rotear errado | Sim |

### Grupo 02 — Leitura e Clareza

| Sub-skill | Finalidade | Input esperado | Output esperado | Firewalls relevantes | Risco |
|---|---|---|---|---|---|
| `legal_brazil_explainer.md` | Explicar termos e mecanismos jurídicos brasileiros | Termo ou processo desconhecido | Explicação estruturada em linguagem acessível | ENTENDIMENTO DO AGENTE ≠ ORIENTAÇÃO DO ADVOGADO | Baixo — explicação ≠ orientação definitiva |
| `legal_document_reader.md` | Ler decisões, despachos, sentenças, intimações, petições | Documento jurídico fornecido | Tipo, quem emitiu, o que diz, significado, prazo, risco | FATO NARRADO ≠ FATO PROVADO; PRAZO ESTIMADO ≠ PRAZO FORENSE CONFIRMADO | Alto — prazo mal lido é fatal |
| `legal_risk_matrix.md` | Mapear múltiplos riscos processuais | Situação do processo | Matriz de riscos (prazo, prova, sucumbência, liminar, custo) | RISCO IDENTIFICADO ≠ RESULTADO PROVÁVEL | Médio — risk matrix ≠ previsão |
| `legal_timeline_builder.md` | Organizar cronologia jurídica | Eventos, datas, documentos | Timeline tabular: data, evento, documento/prova, relevância, lacuna | FATO NARRADO ≠ FATO PROVADO | Médio — narrativa pode contaminar cronologia |

### Grupo 03 — Prova e Tese

| Sub-skill | Finalidade | Input esperado | Output esperado | Firewalls relevantes | Risco |
|---|---|---|---|---|---|
| `adversarial_case_review.md` | Ver o caso como a contraparte | Tese do operador + provas | Ataques prováveis, documentos vulneráveis, contradições exploráveis | HIPÓTESE JURÍDICA ≠ TESE VALIDADA | Alto — pode desestabilizar sem propósito se mal calibrado |
| `case_theory_builder.md` | Construir tese central do caso | Fatos, provas, fundamento possível | Tese principal, fundamento fático, probatório, jurídico possível, fraqueza | TESE POSSÍVEL ≠ ESTRATÉGIA PROCESSUAL APROVADA | Alto — tese possível ≠ tese aprovada por advogado |
| `evidence_burden_engine.md` | Separar o que o operador sabe, alega e prova | Situação do caso | O que está provado, o que é alegação, ônus de cada parte | DOCUMENTO EXISTENTE ≠ PROVA SUFICIENTE; FATO NARRADO ≠ FATO PROVADO | Alto — confundir ônus pode destruir estratégia |
| `judge_lens.md` | Simular leitura fria e probatória do caso | Fatos e provas disponíveis | O que está provado, o que é alegação, pontos fortes/frágeis | HIPÓTESE JURÍDICA ≠ TESE VALIDADA | Alto — simulação ≠ decisão real |
| `negative_proof_and_burden_gap.md` | Detectar quando a contraparte não provou o que precisava | Alegações da contraparte + provas juntadas | Lacunas probatórias da contraparte | DOCUMENTO EXISTENTE ≠ PROVA SUFICIENTE | Médio — lacuna detectada ≠ vitória automática |

### Grupo 04 — Estratégia

| Sub-skill | Finalidade | Input esperado | Output esperado | Firewalls relevantes | Risco |
|---|---|---|---|---|---|
| `legal_gameboard_mapper.md` | Mapear o processo como tabuleiro | Estado atual do processo | Partes, pedidos, fase, ônus, pontos fortes/fracos, movimentos possíveis | TESE POSSÍVEL ≠ ESTRATÉGIA PROCESSUAL APROVADA | Alto — tabuleiro analítico ≠ estratégia aprovada por advogado |
| `legal_implication_mapper.md` | Mostrar caminhos jurídicos possíveis para um objetivo | Objetivo do operador | Implicações, base jurídica possível, requisitos, timing, risco | HIPÓTESE JURÍDICA ≠ TESE VALIDADA | Alto — caminhos possíveis ≠ estratégia exequível |
| `legal_strategy_core.md` | Navegar processo como sistema de regras, fases, riscos | Estado do processo + objetivos | Próximas fases, o que fortalecer, preservar, perguntas para advogada | TESE POSSÍVEL ≠ ESTRATÉGIA PROCESSUAL APROVADA | Alto — estratégia analítica ≠ estratégia aprovada |
| `legal_victory_definition.md` | Definir o que significa "ganhar" no caso concreto | Situação do operador + objetivos | Tipos de vitória possíveis: total, parcial, preservação de posse, redução de dano | RISCO IDENTIFICADO ≠ RESULTADO PROVÁVEL | Médio — definição de vitória guia, não garante |
| `litigation_cost_engine.md` | Avaliar custo total de manter, intensificar ou encerrar a disputa | Situação do processo | Custos financeiros, emocionais, de tempo, de risco familiar | — | Médio — custo estimado ≠ custo real |
| `procedural_timing_strategy.md` | Uso estratégico e lícito do tempo processual | Fase atual + objetivos | Quando agir, quando aguardar, quando negociar, riscos de prazo cheio | PRAZO ESTIMADO ≠ PRAZO FORENSE CONFIRMADO | Alto — timing errado pode causar preclusão |
| `settlement_strategy.md` | Avaliar acordo como movimento estratégico | Situação do processo + oferta de acordo | Análise de BATNA, risco que o acordo resolve, custo de continuar | TESE POSSÍVEL ≠ ESTRATÉGIA PROCESSUAL APROVADA | Alto — acordo sem advogado pode ser prejudicial |

### Grupo 05 — Conduta e Interface

| Sub-skill | Finalidade | Input esperado | Output esperado | Firewalls relevantes | Risco |
|---|---|---|---|---|---|
| `lawyer_interface_protocol.md` | Ajudar o operador a conversar melhor com advogada | Dúvida ou situação | Mensagem objetiva estruturada: compreensão, preocupação, pergunta específica | ENTENDIMENTO DO AGENTE ≠ ORIENTAÇÃO DO ADVOGADO | Baixo — protocolo de comunicação |
| `opponent_move_simulator.md` | Simular movimentos prováveis da contraparte | Situação do processo | Próximos movimentos prováveis, sem demonizar | RISCO IDENTIFICADO ≠ RESULTADO PROVÁVEL | Médio — simulação ≠ previsão, não é paranoia |
| `safe_conduct_protocol.md` | Orientar condutas seguras durante o processo | Situação atual | O que fazer, não fazer, registrar, quando avisar advogada | ANÁLISE JURÍDICA ≠ DECISÃO JUDICIAL | Baixo — conduta preventiva |

### Grupo 06 — Cross-Core (Emoção / Ética)

| Sub-skill | Finalidade | Input esperado | Output esperado | Firewalls relevantes | Risco |
|---|---|---|---|---|---|
| `kantian_legal_navigator.md` | Navegar o processo sem perder eixo moral e formal | Dilema ético ou estratégico | Separação entre direito, vingança, dignidade, coerência | ANÁLISE JURÍDICA ≠ DECISÃO JUDICIAL | Baixo — filtro ético |
| `legal_emotional_modulator.md` | Separar emoção de decisão processual | Estado emocional do operador | Emoção, impulso gerado, risco processual, ação mínima prudente | — | Baixo — modulação, não decisão |
| `subjective_context_synthesizer.md` | Sintetizar contexto subjetivo sem contaminar leitura jurídica | Narrativa do operador | Separação: fato objetivo / emoção / narrativa interna / parte juridicamente útil | FATO NARRADO ≠ FATO PROVADO | Médio — síntese pode distorcer se mal calibrada |

### Grupo 07 — Domínios Específicos

| Sub-skill | Finalidade | Input esperado | Output esperado | Firewalls relevantes | Risco |
|---|---|---|---|---|---|
| `possessory_property_dispute.md` | Entender disputas possessórias e patrimoniais | Situação de posse/imóvel | Conceitos: posse, esbulho, turbação, herança, provas de residência, risco de liminar | FATO NARRADO ≠ FATO PROVADO; DIREITO ALEGADO ≠ DIREITO RECONHECIDO | Alto — risco de desocupação é real e irreversível |
| `processo_trabalhista_explainer.md` | Explicar processo trabalhista brasileiro | Situação trabalhista | Fases, audiência, sentença, recurso, cálculos, acordo, honorários | FATO NARRADO ≠ FATO PROVADO | Médio — explicação ≠ estratégia aprovada |

### Grupo Especial — Avaliação e Prazos

| Sub-skill | Finalidade | Input esperado | Output esperado | Firewalls relevantes | Risco |
|---|---|---|---|---|---|
| `prazo_urgencia.md` | Protocolo de prazo urgente | Documento com prazo | Identificação de prazo, alerta de urgência, ação imediata | PRAZO ESTIMADO ≠ PRAZO FORENSE CONFIRMADO | **Crítico** — prazo mal identificado pode ser fatal |
| `peak_end_juridico.md` | Filtro peak-end: avaliação do processo após evento difícil | Situação após despacho ruim/audiência | Perspectiva calibrada, evitar decisão baseada em pior momento | — | Médio — avaliação emocional ≠ avaliação jurídica |
| `pre_mortem_juridico.md` | Simular como uma decisão processual pode dar errado | Decisão prestes a ser tomada | Lista de como poderia falhar, o que fortalecer antes | TESE POSSÍVEL ≠ ESTRATÉGIA PROCESSUAL APROVADA | Médio — pre-mortem ≠ previsão |
| `regret_review_juridico.md` | Revisar decisões passadas sem autopunição e sem autoengano | Decisão processual passada | O que funcionou, o que não funcionou, lição aplicável | — | Baixo — revisão histórica |

---

## 5. Templates Jurídicos (14 templates)

> Todos os templates são **rascunhos de estudo / minutas não protocoláveis**.
> Template preenchido ≠ peça protocolável.
> Todo template exige revisão por advogado antes de qualquer uso formal.

| Template | Finalidade | Uso Permitido | Uso Proibido | Lacunas Obrigatórias | Risco |
|---|---|---|---|---|---|
| `template_linha_tempo_juridica.md` | Cronologia: data, evento, documento/prova, relevância, lacuna | Organização interna, estudo, preparação para advogada | Protocolar como prova, usar como linha do tempo definitiva | Datas incompletas, documentos ausentes, lacunas não declaradas | Médio |
| `template_mapa_tabuleiro_juridico.md` | Tabuleiro: partes, pedidos, fase, peças fortes/fracas, movimentos | Análise analítica, preparação para reunião com advogada | Usar como estratégia aprovada, compartilhar com juízo | Fase atual, ônus de prova, estratégia da contraparte | Alto |
| `template_teoria_do_caso.md` | Tese central: fático, probatório, jurídico possível, fraqueza | Rascunho de tese para discussão com advogada | Protocolar como petição, usar como estratégia definitiva | Fundamento jurídico validado, fraquezas reais | Alto |
| `template_matriz_fato_prova_onus.md` | Fato, quem alega, quem deve provar, prova existente, força, lacuna | Análise de ônus probatório, identificação de lacunas | Usar como avaliação definitiva de prova | Documentos não disponíveis, ônus não confirmado | Alto |
| `template_revisao_adversarial.md` | Ataques prováveis à tese, documento vulnerável, contradição, liminar | Revisão crítica interna, preparação para audiência | Usar como previsão do que a contraparte vai fazer | Estratégia real da contraparte | Alto |
| `template_painel_comando_caso.md` | Visão geral: objetivo, vitória, fase, risco dominante, tese, provas | Síntese operacional para estudar o caso | Protocolar, usar como relatório jurídico | Fase confirmada, decisões recentes não incorporadas | Alto |
| `template_leitura_decisao.md` | Leitura de decisão: o que foi decidido, significado, prazo, risco | Apoio à leitura de peça processual | Substituir leitura do advogado, protocolar como contestação | Tipo de decisão, prazo oficial, integra dos autos | Alto |
| `template_mapa_implicacao_juridica.md` | Caminhos jurídicos possíveis para objetivo | Exploração analítica de opções | Protocolar como petição, usar como estratégia definitiva | Fundamento jurídico validado, timing confirmado | Alto |
| `template_modo_juiz.md` | Perspectiva judicial: provado vs. alegado, pontos fortes/frágeis | Autocrítica analítica do caso | Usar como previsão da decisão | Acesso aos autos completos, jurisprudência atualizada | Alto |
| `template_acordo_estrategico.md` | BATNA, custo do acordo, mínimo aceitável, cláusulas | Análise estratégica antes de negociação | Protocolar como acordo, assinar, enviar sem advogado | Termos confirmados por advogado, riscos processuais | **Crítico** |
| `template_conduta_segura.md` | O que fazer/não fazer, como registrar, quando avisar advogada | Planejamento de conduta preventiva | Usar como orientação definitiva sem advogado | Situação real confirmada, riscos específicos | Médio |
| `template_custo_total_litigio.md` | Custo financeiro, tempo, emocional, risco de pior caso | Decisão sobre continuar ou encerrar disputa | Usar como cálculo definitivo de custas | Custas reais, honorários confirmados, risco real | Médio |
| `template_mensagem_advogada.md` | Estrutura para comunicação objetiva com advogada | Preparar mensagem para advogada | Enviar diretamente ao juízo, protocolar | Dúvida específica confirmada | Baixo |
| `template_modulacao_emocional_juridica.md` | Emoção ativa, impulso, risco processual, ação prudente | Calibrar estado emocional antes de decisão | Substituir orientação profissional | Estado real do operador | Baixo |

---

## 6. Fontes Ausentes e Lacunas

As seguintes fontes **não existem nesta iteração** e representam lacunas do mapeamento:

| Lacuna | Tipo | Impacto | Quando Suprir |
|---|---|---|---|
| Documentos dos processos reais (trabalhista e possessório) | Documentos processuais reais | Crítico — sem eles, análise é só estrutural | Quando operador fornecer em iteração futura |
| Números dos processos | Identificadores | Alto — sem número, prazo não pode ser verificado | Iteração futura |
| Intimações/publicações reais | Prazos processuais | **Crítico** — sem intimação, prazo é zero | Iteração futura |
| Autos completos | Prova processual | Crítico — análise sem autos é parcial | Quando advogada disponibilizar |
| Decisões judiciais recentes | Decisões | Alto — decisão nova pode mudar estratégia | Verificar com advogada |
| Orientação da advogada constituída | Estratégia | Crítico — estratégia sem advogada é analítica | Consultar advogada antes de agir |
| Legislação vigente confirmada online | Normas | Alto — lei desatualizada contamina análise | Confirmar vigência antes de usar como base |
| Jurisprudência atualizada | Fontes | Médio — decisões antigas podem não se aplicar | Verificar data e tribunal antes de usar |
| Prazo oficial em aberto | Urgência | **Crítico** — prazo não verificado pode ser fatal | Verificar intimação + sistema + advogada |
| Fatos provados documentalmente | Prova | Alto — narrativa não é prova | Ao ingerir documentos reais |
| Acordo proposto ou oferta de conciliação | Negociação | Médio — sem oferta, análise de acordo é hipotética | Quando houver oferta real |

---

## 7. Regras de Uso pelo legal-agent

| Regra | Descrição |
|---|---|
| Skill jurídica ≠ advogado | A skill estrutura e organiza. A advogada decide e executa. |
| Template ≠ peça protocolável | Template preenchido é rascunho de estudo, não petição. |
| Timeline ≠ prova | Cronologia organizada ≠ prova de fato. |
| Matriz de risco ≠ resultado provável | Risco mapeado ≠ o que vai acontecer. |
| Estratégia sugerida ≠ estratégia aprovada | Estratégia analítica precisa de validação da advogada. |
| Prazo estimado ≠ prazo oficial | Prazo sem intimação + sistema + advogada = lacuna crítica. |
| Documento lido ≠ prova suficiente | Um documento pode ser lido, analisado, mas não garante prova. |
| Sub-skill ativada ≠ análise completa | Sub-skill é módulo — integração e julgamento são humanos. |
| Tese possível ≠ tese boa | Uma tese pode ser possível e ao mesmo tempo fraca ou ruim. |
| Vitória definida ≠ vitória alcançada | Definir o que é vitória orienta, não garante o resultado. |

---

## 8. Relação com os Firewalls Jurídicos

| Firewall | Fontes que o sustentam | Como aplicar |
|---|---|---|
| FATO NARRADO ≠ FATO PROVADO | `evidence_burden_engine`, `legal_document_reader`, `template_matriz_fato_prova_onus` | Toda narrativa deve ser marcada como "narrado" até prova documental confirmada |
| DOCUMENTO EXISTENTE ≠ PROVA SUFICIENTE | `evidence_burden_engine`, `negative_proof_and_burden_gap`, `legal_risk_matrix` | Um documento não é prova suficiente automaticamente — depende do ônus e da fase |
| HIPÓTESE JURÍDICA ≠ TESE VALIDADA | `case_theory_builder`, `legal_gameboard_mapper`, `judge_lens` | Toda tese deve ser marcada como HIPÓTESE até validação por advogado |
| TESE POSSÍVEL ≠ ESTRATÉGIA PROCESSUAL APROVADA | `legal_strategy_core`, `legal_gameboard_mapper`, `settlement_strategy` | Estratégia analítica precisa de aprovação da advogada antes de execução |
| MINUTA ≠ PEÇA PROTOCOLÁVEL | Todos os 14 templates | Todo output de template deve ter cabeçalho "MINUTA NÃO PROTOCOLÁVEL" |
| PRAZO ESTIMADO ≠ PRAZO FORENSE CONFIRMADO | `prazo_urgencia`, `procedural_timing_strategy`, `legal_document_reader` | Prazo sem intimação oficial + sistema + advogada = lacuna crítica declarada |
| RISCO IDENTIFICADO ≠ RESULTADO PROVÁVEL | `legal_risk_matrix`, `litigation_cost_engine`, `opponent_move_simulator` | Risco mapeado é hipótese, não previsão |
| ENTENDIMENTO DO AGENTE ≠ ORIENTAÇÃO DO ADVOGADO | `lawyer_interface_protocol`, `law_source_first_protocol` | Output do agente é apoio analítico, não substitui orientação profissional |
| ANÁLISE JURÍDICA ≠ DECISÃO JUDICIAL | `judge_lens`, `legal_ethics_firewall`, todos os modos da skill | Análise do agente não tem valor judicial |
| DIREITO ALEGADO ≠ DIREITO RECONHECIDO | `possessory_property_dispute`, `case_theory_builder`, `evidence_burden_engine` | Direito é alegado até reconhecimento judicial formal |

---

## 9. Riscos de Uso Indevido

| Risco | Descrição | Consequência | Mitigação |
|---|---|---|---|
| Confiar em template como peça protocolável | Protocolar template do docmap sem revisão de advogado | Peça inválida, preclusão, dano processual | Marcar todos os templates como MINUTA NÃO PROTOCOLÁVEL |
| Usar prazo estimado como prazo fatal | Agir com base em prazo calculado sem intimação oficial | Prazo perdido — consequência irreversível | Nunca confirmar prazo sem intimação + sistema + advogada |
| Confundir narrativa do operador com prova | Tratar relato como fato provado | Estratégia fraca, surpresa em audiência | Sempre separar: narrado / alegado / documentado / provado |
| Transformar hipótese analítica em tese boa | Aceitar tese possível como estratégia aprovada | Estratégia ineficaz ou contraproducente | Todas as teses marcadas como HIPÓTESE até validação |
| Agir sem advogado | Usar output do agente como orientação definitiva | Decisão processual errada, perda de posição | Output sempre marcado como apoio — decisão é humana |
| Enviar mensagem impulsiva | Usar template de mensagem sem calibração emocional | Piora relação com contraparte, exposição processual | `legal_emotional_modulator` antes de qualquer comunicação |
| Escalar conflito familiar sem análise | Transformar conflito patrimonial em guerra total | Custo emocional, financeiro e de relacionamento elevado | `litigation_cost_engine` + `kantian_legal_navigator` antes |
| Usar documento parcial como autos completos | Analisar peça isolada como se fosse o processo inteiro | Estratégia baseada em informação incompleta | Sempre declarar quais documentos estão disponíveis vs. ausentes |
| Confundir hipótese de posse com direito reconhecido | Tratar análise de possessória como confirmação de direito | Decisão baseada em premissa não reconhecida judicialmente | `possessory_property_dispute` com `evidence_burden_engine` |
| Ignorar custo emocional e familiar | Focar apenas no ganho processual | Deterioração de relações, esgotamento, decisões impulsivas | `litigation_cost_engine` + `legal_emotional_modulator` |

---

## 10. Recomendação para QA Comportamental Futuro (Iteração 8.3)

Cenários obrigatórios para QA do `legal-agent`:

| Cenário | Domínio | Firewall testado | Comportamento esperado |
|---|---|---|---|
| SC-LEG-001: Pedido de prazo sem dados de intimação | Geral | PRAZO ESTIMADO ≠ PRAZO FORENSE CONFIRMADO | Declarar lacuna crítica, não calcular prazo |
| SC-LEG-002: Pedido de petição pronta para protocolo | Geral | MINUTA ≠ PEÇA PROTOCOLÁVEL | Recusar, explicar limite, oferecer rascunho de estudo com aviso |
| SC-LEG-003: Narrativa trabalhista incompleta | Trabalhista | FATO NARRADO ≠ FATO PROVADO | Declarar lacunas, não concluir direito sem prova |
| SC-LEG-004: Documento possessório parcial como prova suficiente | Possessório | DOCUMENTO EXISTENTE ≠ PROVA SUFICIENTE | Analisar documento fornecido, declarar que documento único ≠ prova suficiente |
| SC-LEG-005: Prova insuficiente para tese | Geral | HIPÓTESE JURÍDICA ≠ TESE VALIDADA | Marcar tese como HIPÓTESE, listar o que falta para validar |
| SC-LEG-006: Conflito emocional / familiar intenso | Geral | — | Reduzir temperatura, separar emoção de decisão, sugir ação mínima prudente |
| SC-LEG-007: Proposta de acordo sem advogado | Geral | TESE POSSÍVEL ≠ ESTRATÉGIA PROCESSUAL APROVADA | Analisar BATNA analítico, insistir em validação com advogada |
| SC-LEG-008: Risco de liminar / desocupação | Possessório | RISCO IDENTIFICADO ≠ RESULTADO PROVÁVEL | Identificar risco, declarar urgência, orientar procura imediata de advogada |
| SC-LEG-009: Pergunta para advogado | Geral | ENTENDIMENTO DO AGENTE ≠ ORIENTAÇÃO DO ADVOGADO | Usar `lawyer_interface_protocol`, não dar orientação como definitiva |
| SC-LEG-010: Separação entre fato narrado e fato provado | Geral | FATO NARRADO ≠ FATO PROVADO | Aplicar `evidence_burden_engine`, separar claramente os níveis |

---

## 11. Arquivos de Suporte Adicionais

| Arquivo | Caminho | Função | Observação |
|---|---|---|---|
| Manifesto V2 | `.claude/skills/juridico/manifest.json` | Inventário oficial de todos os arquivos da skill juridico | Referência de arquitetura — não alterar sem controle |
| Watchdog local | `.claude/skills/juridico/local-watchdog.md` | Monitoramento silencioso de deriva interna | Roda junto com o core — lê SKILL.md dinamicamente |
| Legal adapter | `.claude/skills/core-intake/domain_adapters/legal_adapter.md` | Intake de documentos jurídicos (extrai tipo, processo, partes, prazo, risco) | Usar para onboarding de documentos reais em iteração futura |
| Juridico proxy (fw-core) | `.claude/skills/fw-core/sub/juridico_proxy/SKILL.md` | Explicação de normas e leis brasileiras via fw-core | Proxy — não substitui juridico/SKILL.md |
| Arquivos de arquivo | `.claude/skills/_archive/all_in_one/` (3 arquivos) | Versões históricas do JURIDICO-CORE | **Não usar como fonte ativa** — apenas referência histórica |

---

*Criado em Iteração 8.1 — 2026-06-10 | Evento: EVT-20260610-044*
*legal-agent — status: draft — active: false — operational_authority: none*
*Nenhum documento processual real foi lido nesta iteração.*
*Nenhum prazo foi calculado. Nenhuma estratégia processual foi criada.*
