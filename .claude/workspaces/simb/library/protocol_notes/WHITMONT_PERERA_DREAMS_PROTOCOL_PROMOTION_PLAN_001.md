---
tipo: protocol_promotion_plan
source_id: SRC-SIMB-012
task: TASK 35 — WHITMONT_PERERA_DREAMS_FINAL_SOURCE_INTEGRATION_REVIEW_AND_COMMIT_001
data: 2026-06-20
status: plan_only
nota: nenhum patch aplicado — plano de execução para task autorizada subsequente
autonomous_self_patch: false
---

# WHITMONT_PERERA_DREAMS_PROTOCOL_PROMOTION_PLAN_001

## Status

**PLAN ONLY.** Nenhum patch aplicado ao DREAM_ANALYSIS_PROTOCOL.
Este arquivo é um plano de execução — requer autorização explícita do operador para a task de patch subsequente.

---

## Visão Geral

| métrica | valor |
|---|---|
| Total PP-WP candidates | 69 (PP-WP-001 a PP-WP-069) |
| NET NEW (novo para o protocolo) | 36 |
| REFINES (refina/estende regra existente) | 16 |
| CONFIRMS (confirma sem patch necessário) | 9 |
| CONFIRMS+REFINES | 4 |
| HOLD (defer) | 1 (PP-WP-056) |
| Patches a criar (estimado) | ~30–35 novos patches (PATCH-030+) |

**Fase atual do protocolo:** v0.2 com PATCH-001 a PATCH-029
**Próxima versão após WP integration:** v0.3 (estimado)

---

## Grupo A — Promoção Prioritária (HIGH + NET NEW crítico)

Estes candidatos devem ser promovidos primeiro na task de patch autorizada.
São NET NEW ou REFINES de alta criticidade operacional.

### A1 — Segurança / Firewalls (promoção obrigatória antes de qualquer uso)

| id | nome | tipo | nova regra proposta |
|---|---|---|---|
| PP-WP-053 | Trauma gateway obrigatório para conteúdo de estupro/agressão | NET NEW FIREWALL | Antes de qualquer leitura simbólica de conteúdo de estupro/violência coerciva: verificar peso emocional + convite explícito do operador |
| PP-WP-054 | Equações de doença específica: PROIBIDO | NET NEW FIREWALL ABSOLUTO | Leucemia/AIDS/câncer como equações psicológicas = NEVER; associações pessoais apenas |
| PP-WP-057 | Tranquilização falsa: proibida a partir de imagens oníricas | NET NEW FIREWALL | Nunca derivar "vai ficar bem" de imagem positiva em sonho; sempre separar simbólico de cuidado médico real |
| PP-WP-049 | Morte/doença: frame de transformação + firewall médico | NET NEW | Frame padrão = transformação/encerramento; incluir sempre declaração de referência médica quando saúde é relevante |
| PP-WP-060 | Inner therapist: retornar função ao sonhador | NET NEW FIREWALL | Iris nunca aceita framing de si mesma como guia interior/terapeuta interior/Inner Therapist; deflexão ativa |
| PP-WP-061 | Deflexão de framing de autoridade/oráculo | NET NEW FIREWALL | Iris nunca aceita papel de oráculo, xamã, alquimista, autoridade curativa; deflexão ativa retorna ao sonhador |
| PP-WP-062 | Sem rotulagem de transferência / identificação de projeção | NET NEW FIREWALL | Iris nunca usa "transferência" como rótulo; nunca identifica fonte ou objeto de projeção |
| PP-WP-063 | Sonho de terapia: simbólico apenas; sem conselho sobre relação real | NET NEW FIREWALL | Iris nunca aconselha sobre relação terapêutica real a partir de conteúdo de sonho |
| PP-WP-064 | Resistência à indução: sistêmica | NET NEW FIREWALL | Iris mantém abertura interpretativa; periodicamente devolve autoridade ao sonhador; convida correção e discordância |

### A2 — Procedimento Core (preenche lacunas maiores no protocolo)

| id | nome | tipo | integração proposta |
|---|---|---|---|
| PP-WP-022 | Gate de amplificação: tentativo, condicional, retirado | NET NEW | Novo passo antes da fase de amplificação: uma oferta, tentativa; se não ressoa → retirar |
| PP-WP-024 | Triagem objeto/sujeito por função complementar | NET NEW | Novo procedimento de triagem antes da leitura image-by-image |
| PP-WP-028 | Visão geral primeiro: sonho completo antes de imagens individuais | NET NEW | Adicionar como primeiro passo explícito na fase de leitura do sonho |
| PP-WP-029 | Cena inicial como "Re:": trabalhar completamente antes de avançar | NET NEW | Adicionar como passo 2 imediato após visão geral |
| PP-WP-027 | Cautela de overdramatização: exagero ≠ severidade literal | NET NEW | Adicionar como regra de leitura para imagens extremas/violentas |
| PP-WP-048 | Pesadelo: reconhecer urgência; mesmas ferramentas; sem escalada de pânico | NET NEW | Adicionar procedimento para pesadelos na fase de leitura |
| PP-WP-012 | Carga afetiva = marcador de relevância | NET NEW | Adicionar como critério de acompanhamento durante fase de associação |
| PP-WP-023 | Teste de compensação: leitura mais discrepante como candidata primária | NET NEW | Adicionar como heurística de desambiguação quando múltiplas leituras são possíveis |
| PP-WP-058 | Leitura multi-nível para figura de ajudante/autoridade | NET NEW | Adicionar procedimento para figuras de ajudante/autoridade/cuidado |
| PP-WP-068 | Atribuição de numinosidade: retornar ao encontro do sonhador | NET NEW | Estende deflexão de autoridade ao território do numinoso |

### A3 — Refinamentos Críticos (refina regras existentes com especificidade nova)

| id | nome | tipo | regra existente afetada |
|---|---|---|---|
| PP-WP-001 | Assentimento incorporado vs aceitação passiva | REFINES | PATCH-013 — adicionar distinção explícita entre assentimento de intestino e acordo polido |
| PP-WP-002 | Sem pressão; resistência como sinal | NET NEW | Preenche lacuna — Iris não repete nem defende interpretação após resistência |
| PP-WP-005 | Ancoragem na vida = trabalho autônomo do operador | REFINES | PATCH-025 — estende para fase pós-interpretação |
| PP-WP-011 | Associação primeiro como regra absoluta | CONFIRMS+REFINES | PROT-005/PATCH-023 — upgrade para "regra absoluta — sem exceções, sem símbolos 'óbvios'" |
| PP-WP-015 | Múltiplas leituras mantidas simultaneamente | NET NEW | Adicionar como procedimento de abertura quando múltiplas interpretações são possíveis |
| PP-WP-017 | Postura de curiosidade/ignorância como default | REFINES | PROT-005 — tornar explícita como postura operacional exigida, não apenas implicada |
| PP-WP-033 | Reconhecer qualidade mitológica antes de nomear arquétipo | NET NEW | Adicionar como gate de entrada para material mitológico |
| PP-WP-036 | Amplificação somente após trabalho pessoal completo | REFINES | PATCH-021 — reforçar com linguagem "foisting" explícita |
| PP-WP-037 | Amplificação válida somente com confirmação do sonhador | REFINES | PATCH-021 — adicionar: amplificação de Iris pode refletir seu corpus, não o sonhador |
| PP-WP-038 | Ancoragem pessoal obrigatória após leitura arquetipal | NET NEW | Adicionar como fechamento obrigatório após qualquer leitura no nível mitológico |
| PP-WP-045 | Resíduo diurno: desvio da versão lembrada = a mensagem | REFINES | PP-WP-025 — adicionar critério do desvio como localizador da mensagem |
| PP-WP-046 | Série de sonhos: circumambulação espiral; denominadores comuns | CONFIRMS+REFINES | PATCH-027 — reforçar com espiral não-linear; adicionar coincidências comportamentais ao conjunto de variações |
| PP-WP-050 | Sem prognóstico de sonhos; reframing explícito de pedidos | CONFIRMS+REFINES | F-06 — adicionar forma verbal explícita para pedidos de previsão |
| PP-WP-052 | Imagem sexual: nível sujeito primeiro; sem literalização; sem declaração de identidade | REFINES | PATCH-003/RISK-FINAL-001 — adicionar: nunca declarar identidade/orientação sexual a partir de imagem onírica |
| PP-WP-059 | Distinção pessoa real vs imagem onírica (protocolo verbal explícito) | REFINES | RISK-JUNG-007 — adicionar protocolo verbal explícito para quando figura parece ser pessoa real |

---

## Grupo B — Promoção Secundária (HIGH + MEDIUM)

| id | nome | tipo | prioridade |
|---|---|---|---|
| PP-WP-013 | Alegoria vs símbolo: manter a distinção | NET NEW | HIGH |
| PP-WP-014 | Imagem numinosa: receber antes de interpretar | NET NEW | MEDIUM |
| PP-WP-016 | Camadas de explicação: coletiva + individual | NET NEW | HIGH |
| PP-WP-018 | Reações corporais ao relatar: pedir associações | NET NEW | MEDIUM |
| PP-WP-019 | Combinar modo sensorial com descrição do sonhador | NET NEW | MEDIUM |
| PP-WP-020 | Mudança para modo explicativo quando associação trava | NET NEW | MEDIUM |
| PP-WP-021 | Sonho trivial: explorar antes de dispensar | NET NEW | MEDIUM |
| PP-WP-025 | Resíduo diurno: nível subjetivo como default; exceção | NET NEW | MEDIUM |
| PP-WP-026 | Sonho inadequado até ponto cego revelado | NET NEW | MEDIUM |
| PP-WP-030 | Mapeamento de estrutura dramática: 4 elementos | NET NEW | MEDIUM |
| PP-WP-031 | Lise/catástrofe como possibilidade, não destino | CONFIRMS+REFINES | HIGH |
| PP-WP-032 | Resumo esqueleto para sonhos caóticos/longos | NET NEW | MEDIUM |
| PP-WP-034 | Distinção caos/mito: atenção diferente, sem diagnóstico | NET NEW | HIGH |
| PP-WP-035 | Procedimento de três etapas para material mitológico | NET NEW | HIGH |
| PP-WP-039 | Motivo Life Play: teatro como possível tema maior | NET NEW | MEDIUM |
| PP-WP-040 | Motivo criança: idade como ponteiro temporal; polaridades abertas | NET NEW | MEDIUM |
| PP-WP-041 | Motivo animal: qualidade instintiva específica; três camadas | NET NEW | MEDIUM |
| PP-WP-042 | Material de vida passada: respeitar afeto; alegórico apenas | NET NEW | MEDIUM |
| PP-WP-043 | Sequência temporal como possível cadeia causal | NET NEW | MEDIUM |
| PP-WP-044 | Função reavaliadora: correção direta de perspectiva | REFINES | MEDIUM |
| PP-WP-047 | Sonho recorrente: urgência sem alarme | NET NEW | MEDIUM |
| PP-WP-051 | Imagens corporais: verificar literal → cuidado real → simbólico | NET NEW | HIGH |
| PP-WP-055 | Imagens de orifícios/excretórias: metáfora acessível, linguagem neutra | NET NEW | MEDIUM |
| PP-WP-065 | Hipótese de nível sujeito para figura de ajudante/autoridade | REFINES | MEDIUM |
| PP-WP-066 | Sem rotulagem de sonho bom/mau | CONFIRMS | MEDIUM |
| PP-WP-069 | Sem promessa de resultado do trabalho onírico | REFINES | MEDIUM |

---

## Grupo C — Baixa Prioridade / Hold

| id | nome | tipo | status |
|---|---|---|---|
| PP-WP-003 | Resultado onírico condicional | CONFIRMS+REFINES | LOW — confirma CON-041/F-06; menor urgência |
| PP-WP-004 | Sonho raramente comanda ação | CONFIRMS | LOW — confirma F-04 sem nova regra |
| PP-WP-006 | Inconsciente não é infalível | CONFIRMS | LOW — confirma F-18 sem nova regra |
| PP-WP-007 | Equivalências fixas são projeção | CONFIRMS | LOW — confirma PATCH-023 sem nova regra |
| PP-WP-008 | Seguindo sonhos verificam interpretação | REFINES | LOW — útil mas menor urgência |
| PP-WP-009 | Sonho como gerador de perguntas | NET NEW | LOW — framing útil; não urgente |
| PP-WP-010 | Distinção ego-onírico | REFINES | LOW — refina CON-036 sem urgência |
| PP-WP-056 | Motivo de dentes: transição de adaptação | NET NEW | HOLD — aguardar demanda do operador |
| PP-WP-067 | Associação-primeiro validada como método suficiente | CONFIRMS | LOW — auto-framing; menor urgência |

---

## Ordem de Execução Recomendada (para task de patch autorizada)

### Fase 1 — Firewalls e Segurança (executar primeiro, sem dependências)
1. PP-WP-053 (trauma gateway)
2. PP-WP-054 (equações de doença: PROIBIDO)
3. PP-WP-057 (tranquilização falsa: proibida)
4. PP-WP-060 (Inner Therapist: deflexão)
5. PP-WP-061 (deflexão de autoridade/oráculo)
6. PP-WP-062 (sem rotulagem de transferência)
7. PP-WP-063 (sonho de terapia: simbólico apenas)
8. PP-WP-064 (resistência à indução)

### Fase 2 — Procedimento Core (dependem de Fase 1 estar limpa)
1. PP-WP-028 (visão geral primeiro)
2. PP-WP-029 (cena inicial como "Re:")
3. PP-WP-012 (carga afetiva = marcador)
4. PP-WP-022 (gate de amplificação)
5. PP-WP-024 (triagem objeto/sujeito)
6. PP-WP-023 (teste de compensação)
7. PP-WP-027 (cautela de overdramatização)
8. PP-WP-048 (pesadelo: urgência sem pânico)
9. PP-WP-049 (morte/doença: transformação + firewall médico)
10. PP-WP-051 (imagens corporais: sequência de três etapas)
11. PP-WP-058 (leitura multi-nível para figura de ajudante)
12. PP-WP-068 (numinosidade: retornar ao sonhador)

### Fase 3 — Refinamentos e Gaps Operacionais
- Grupos A3 e B acima, em qualquer sequência interna

### Fase 4 — Confirmações / Baixa Prioridade
- Grupo C

---

## Versioning Estimate

- Patches atuais: PATCH-001 a PATCH-029 (v0.1 → v0.2)
- Patches WP layer: ~30–35 novos (PATCH-030 a ~PATCH-065)
- Resultado esperado: DREAM_ANALYSIS_PROTOCOL_v0.3

---

## O Que Este Plano NÃO Autoriza

- Não autoriza patches ao DREAM_ANALYSIS_PROTOCOL_v0.1.md
- Não autoriza modificações ao SKILL.md
- Não autoriza criação de CON cards
- Não autoriza criação de evals na SKILL.md
- Não autoriza modificação de firewalls existentes (apenas adições)
- Nenhuma ação até task de patch explicitamente autorizada pelo operador

---

*Plano de promoção de protocolo — SRC-SIMB-012 — TASK 35 — 2026-06-20.*
*69 PP-WP candidates classificados. Nenhum patch aplicado. Aguardando autorização para task de patch.*
