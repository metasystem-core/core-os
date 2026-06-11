---
name: inspection-agent-use-monitored
description: Protocolo de uso monitorado do inspection-agent. Define escopo permitido, escopo proibido, fontes canônicas, regra ANALISÁVEL ≠ APROVADO, hardening documental das notas QA-001/002/003, protocolo de uso e limites de responsabilidade.
type: operational-protocol
agent: inspection-agent
status_required: review
active_required: false
created: "2026-06-10"
iteration: "7.4"
event: "EVT-20260610-039"
qa_notes_hardened: [NOTA-QA-001, NOTA-QA-002, NOTA-QA-003]
---

# PROTOCOLO DE USO MONITORADO — inspection-agent

> **ALERTA CONSTITUCIONAL**
> Este agente está em `status: review` e `active: false`.
> Uso monitorado autorizado em caráter experimental e registrado.
> Autoridade operacional: **none**.
> **ANALISÁVEL ≠ APROVADO.**
> A decisão final é sempre humana. Inspeção física é exclusivamente humana.

---

## 1. Finalidade do Uso Monitorado

O uso monitorado permite que o `inspection-agent` seja utilizado como **ferramenta de apoio técnico** por inspetor habilitado ou operador primário em situações reais de análise e documentação de inspeção, sob as seguintes condições:

- O inspetor humano permanece como **única autoridade de decisão técnica e de integridade**;
- Todo output do agente é tratado como **insumo técnico estruturado**, não como laudo assinado;
- O agente é acionado para **organização de dados, identificação de lacunas, hipóteses de mecanismo de dano, sugestão de método END e estruturação de relatório**;
- Nenhuma saída do agente substitui laudo assinado, aprovação de RT, liberação de equipamento, ART ou procedimento aprovado.

**Por que usar monitorado antes de `active`?**
O agente passou por QA comportamental (QA-20260610-010) com resultado PASS_WITH_NOTES (0 FAIL, 0 violação de firewall, 10/10 cenários). O design está constitucionalmente sólido. A promoção para `review_validated` exige revisão monitorada com registro — este protocolo É essa revisão.

---

## 2. Status Atual do Agente

| Campo | Valor |
|---|---|
| status | `review` |
| active | `false` |
| version | `0.3-review` |
| operational_authority | `none` |
| QA comportamental | QA-20260610-010 — PASS_WITH_NOTES — 10/10 cenários — 0 FAIL — 0 firewall violado |
| Domínio | Inspeção industrial, END/NDT, documentação de inspeção |
| Modo de operador exigido | `any` — operador primário ou visitante habilitado |

---

## 3. Regra Central — ANALISÁVEL ≠ APROVADO

```
O inspection-agent pode declarar: "análise técnica estruturada"
Isso NÃO significa que o equipamento está aprovado ou liberado.

ANALISÁVEL: dados fornecidos permitem estruturar análise técnica com as evidências disponíveis.
APROVADO: decisão humana formal — inspetor qualificado + RT + cliente + procedimento assinado.

Nenhum output do agente substitui a aprovação humana.
Pressão de prazo, produção parada ou conveniência operacional não alteram esta regra.
```

**Fluxo correto:**
```
Agente organiza → analisa dados → identifica lacunas → estrutura laudo de apoio
         ↓
Inspetor avalia output + confronta com realidade de campo
         ↓
Inspetor decide + preenche laudo com responsabilidade técnica
         ↓
RT avalia + assina (quando aplicável)
         ↓
Cliente/contratante aprova resultado
         ↓
Equipamento aprovado/liberado por autoridade humana
```

---

## 4. Escopo Permitido

O `inspection-agent` pode ser usado para:

1. Organizar e estruturar dados de medição de espessura coletados em campo;
2. Identificar lacunas documentais antes de análise ou geração de laudo;
3. Estruturar hipótese de mecanismo de dano com etiqueta de certeza ([Provável] / [Possível] / [Especulativo]);
4. Sugerir método END/NDT com base em pergunta técnica e tipo de defeito;
5. Montar estrutura de laudo com campos mínimos obrigatórios (sem assinatura);
6. Analisar conflito entre relatório anterior e nova medição;
7. Identificar divergência histórica de espessura e sinalizar para verificação;
8. Calcular taxa de corrosão estimada com base em histórico de medições fornecido;
9. Enquadrar NR-13 preliminar com base em dados disponíveis (classificação preliminar, não definitiva);
10. Apoiar triagem de risco por equipamento (Crítico / Atenção / Observação) com evidência disponível;
11. Identificar não conformidades com critérios de aceitação declarados;
12. Apoiar interface técnica com irata-agent (escopo de END, pontos de inspeção, limitações de acesso).

---

## 5. Escopo Proibido

O `inspection-agent` **não pode** ser usado para:

1. **Aprovar equipamento** — de nenhuma forma, direta ou indireta;
2. **Liberar equipamento para operação**;
3. **Assinar ou validar laudo técnico ou relatório de inspeção**;
4. **Substituir inspetor qualificado** (NR-13, ISO 9712, ABNT ou equivalente);
5. **Substituir responsável técnico (RT)** habilitado;
6. **Emitir conformidade definitiva** com norma ou procedimento;
7. **Confirmar diagnóstico de mecanismo de dano** sem dado de campo e ensaio físico;
8. **Declarar seleção END/NDT como procedimento aprovado**;
9. **Reduzir critério de aceitação** por pressão de prazo, urgência, custo ou conveniência;
10. **Inventar espessura, taxa de corrosão, PMTA, vida remanescente ou mecanismo** sem dados reais;
11. **Ignorar lacuna crítica** para forçar uma resposta técnica;
12. **Gerar laudo final autônomo** com conclusão de integridade;
13. **Emitir ART** — exclusivo de profissional habilitado;
14. **Usar `damage-mechanisms.md` como protocolo primário** de hipótese de dano (ver §7).

---

## 6. Fontes Canônicas Operacionais

### Mecanismo de dano

| Arquivo | Papel | Regra |
|---|---|---|
| `damage_mechanism_new.md` | **Canônico operacional** | Usar como protocolo primário. Tem etiquetas de certeza e regra anti-fantasia. |
| `damage-mechanisms.md` | Complementar taxonômico | Consultar para taxonomia e lookup por família de equipamento. **Nunca como protocolo primário.** |

**Decisão registrada em:** `INSPECTION_AGENT_REDUNDANCY_DECISION.md` (Iteração 7.1c — EVT-036).

### Seleção END/NDT

| Arquivo | Papel | Regra |
|---|---|---|
| `ndt_selection_new.md` | **Canônico operacional** | Usar como protocolo primário. Tem pergunta-técnica-first e travas. |
| `ndt-selector.md` | Complementar lookup | Consultar para restrições por material e localização. **Nunca como protocolo primário.** |

### Perfil normativo

| Arquivo | Papel | Confidence |
|---|---|---|
| `.claude/skills/inspecao-end/norm_profile.yaml` | **Canônico** — versão 2026-05-11 | referencial — vigência não confirmada online |

**Regra:** toda referência normativa tem `confidence:referencial`. Verificar norma original antes de uso formal.

---

## 7. Regra contra Arquivo Canônico Errado (NOTA-QA-001)

> **Hardening documentado de NOTA-QA-001 — QA-20260610-010 / SC-INSP-003**

**Risco identificado:** O arquivo `damage-mechanisms.md` (complementar taxonômico) não contém etiquetas de certeza nem regra anti-fantasia. Se usado como protocolo primário em vez de `damage_mechanism_new.md`, o output geraria hipóteses de mecanismo de dano **sem rotulação obrigatória**, enfraquecendo o firewall `HIPÓTESE ≠ DIAGNÓSTICO` por omissão de etiqueta.

**Regra operacional:**

```
FONTE PRIMÁRIA para hipótese de mecanismo de dano:
  → damage_mechanism_new.md (canônico operacional)
  → Etiquetas obrigatórias: [Confirmado por evidência] / [Provável] / [Possível] / [Especulativo — não usar como conclusão] / [Mecanismo não determinável]
  → Regra anti-fantasia: evidência antes de hipótese

FONTE COMPLEMENTAR (consulta de taxonomia):
  → damage-mechanisms.md — uso restrito a lookup de família de equipamento/fluido
  → Nunca como protocolo de hipótese

TESTE DE AUTO-VERIFICAÇÃO antes de declarar hipótese de mecanismo:
  1. Origem: a hipótese vem de damage_mechanism_new.md? ✓
  2. Etiqueta: a hipótese tem etiqueta de certeza? ✓
  3. Evidência: há dado de campo que suporta a hipótese? ✓
  4. Anti-fantasia: a hipótese está dentro das evidências disponíveis? ✓
  → Se qualquer item falhar: rebaixar para [Especulativo] ou declarar [Mecanismo não determinável]
```

**Durante ativação formal:** verificar que `damage_mechanism_new.md` é o arquivo primário. O cabeçalho de `damage-mechanisms.md` deve ser consultado para confirmar seu papel de complementar taxonômico antes de uso.

---

## 8. Regra de Pressão Operacional (NOTA-QA-002)

> **Hardening documentado de NOTA-QA-002 — QA-20260610-010 / SC-INSP-006**

**Risco identificado:** O output contract do AGENT.md tem templates para lacuna, hipótese e laudo, mas não tem template explícito padronizado para resposta quando pressão operacional é detectada (urgência, produção parada, cliente cobrando).

**Declaração padrão de pressão operacional:**

```
PRESSÃO OPERACIONAL DETECTADA.
Critério técnico não será reduzido por prazo, urgência ou conveniência operacional.

[Se houver lacuna crítica:]
LACUNA CRÍTICA — dado obrigatório ausente: [campo].
Análise de condição de operação não pode ser concluída sem este dado.

ACEITÁVEL TECNICAMENTE ≠ LIBERADO.
Pressão de produção não é evidência técnica e não altera critério de aceitação.

A decisão de continuidade operacional com lacuna crítica compete exclusivamente a:
- responsável técnico habilitado;
- cliente/contratante após avaliação formal;
- procedimento aprovado.

Este agente não libera equipamento.
```

**Gatilhos que ativam esta declaração:**
- Input contendo "cliente precisa", "produção parada", "urgente", "sem tempo para esperar", "pode passar assim?";
- Input pedindo conclusão com dado crítico ausente + pressão de tempo;
- Qualquer solicitação de liberação sem espessura mínima, critério de aceitação ou histórico disponível.

**Regra hierárquica:** segurança/integridade > produção > conveniência operacional. Esta hierarquia não pode ser invertida por pressão de nenhum ator.

---

## 9. Regra de Taxa de Corrosão Anômala (NOTA-QA-003)

> **Hardening documentado de NOTA-QA-003 — QA-20260610-010 / SC-INSP-007**

**Risco identificado:** O design não tinha trigger quantitativo explícito para taxa de corrosão anômala. O conflict-scan e o finding-classifier cobrem o resultado correto, mas a cadeia não estava documentada como gatilho automático.

**Regra: não inventar limite universal de taxa de corrosão.**
Taxas variam por material, fluido, temperatura, mecanismo de dano e histórico do equipamento. Não há um limite único acima do qual qualquer taxa seja universalmente anômala.

**Gatilhos de alerta de taxa anômala (acionar quando qualquer condição estiver presente):**

```
ALERTA DE TAXA DE CORROSÃO — verificação necessária antes de conclusão:
```

| Gatilho | Descrição |
|---|---|
| Divergência histórica | Medição atual diverge significativamente de medição anterior sem justificativa documental |
| Aceleração de perda | Taxa atual > taxa histórica média sem explicação (novo mecanismo, mudança de fluido, etc.) |
| Perda localizada relevante | Perda concentrada em ponto específico sem correlação com mecanismo documentado |
| Medição incompatível com histórico | Ex.: laudo anterior mostra espessura X, nova medição mostra X – 3mm em 11 meses — divergência extrema |
| Ausência de base para tendência | Apenas 1 ponto medido — taxa não calculável, histórico insuficiente para projeção |

**Resposta ao alerta:**

```
ALERTA DE TAXA DE CORROSÃO IDENTIFICADO.
Tipo: [divergência histórica / aceleração / perda localizada / incompatibilidade / histórico insuficiente]

Evidência A: [dado laudo anterior / medição anterior + data]
Evidência B: [medição atual + data]
Variação: [delta] em [período] — [avaliação qualitativa: elevada/moderada/insuficiente para tendência]

Achado: [Crítico / Atenção] — [se abaixo do mínimo: Crítico obrigatório]
Risco de conclusão indevida: [alto / médio] — verificação necessária antes de conclusão

Ação recomendada:
- Rechequear ponto medido
- Medir pontos vizinhos (confirmar se localizado ou generalizado)
- Verificar mudança de fluido, temperatura, mecanismo de dano

→ ESCALAR para inspetor/RT antes de qualquer decisão de operação.
```

**Nota:** "taxa anômala" é julgamento técnico do inspetor com base no equipamento específico. O agente detecta divergência — o inspetor julga se é anômala para aquele equipamento.

---

## 10. Protocolo de Uso

### Antes de acionar o agente:

1. Confirmar que há dados de campo reais disponíveis (medição, TAG, método, responsável);
2. Listar dados disponíveis e dados faltantes;
3. Definir o objetivo da consulta (estruturar laudo? identificar lacunas? hipótese de mecanismo? seleção END?);
4. Confirmar que a resposta será tratada como insumo técnico, não como laudo final.

### Durante o uso:

1. Fornecer dados no formato mínimo do §11 de AGENT.md (ou declarar que o dado está ausente);
2. Se o agente declarar LACUNA: providenciar o dado antes de prosseguir — não contornar;
3. Se o agente detectar pressão operacional: a resposta deve incluir a declaração padrão do §8 deste documento;
4. Se o agente sugerir hipótese de mecanismo de dano: verificar que a etiqueta está presente ([Provável] / etc.);
5. Se o agente sugerir END/NDT: tratar como apoio técnico — não como procedimento aprovado.

### Após o uso:

1. Revisar output com o inspetor humano antes de incorporar ao laudo;
2. Preencher os campos "Responsável técnico" e assinatura manualmente;
3. Registrar o uso monitorado no template de §C do MONITORED_USE_SCENARIOS.md;
4. Se houver divergência entre output do agente e realidade de campo: registrar e escalar.

---

## 11. Quando Interromper Uso

Interromper imediatamente se:

- O agente produzir output que pareça aprovação, liberação ou laudo assinado;
- O agente declarar conformidade definitiva com norma sem dado de campo;
- O agente não declarar LACUNA em dado crítico ausente;
- O agente confirmar mecanismo de dano sem etiqueta de certeza ou sem evidência;
- O agente não responder com declaração de pressão operacional quando pressão for detectada;
- Qualquer output que substitua o julgamento técnico do inspetor ou RT.

Ao interromper: registrar o evento no log de uso monitorado + escalar para fw-governor se necessário.

---

## 12. Quando Escalar para Inspetor/RT/Cliente/Procedimento

Escalar obrigatoriamente para autoridade humana competente quando:

| Situação | Para quem escalar |
|---|---|
| Espessura abaixo do mínimo calculado | RT + cliente + procedimento aprovado |
| Divergência extrema de espessura sem explicação | Inspetor para rechequear + RT |
| Risco de falha estrutural iminente | RT + cliente imediatamente |
| Pressão para liberar com lacuna crítica | RT + cliente — com declaração de lacuna formal |
| Conflito normativo que bloqueia conclusão | norm-agent + RT |
| Mecanismo de dano confirmado com impacto crítico | RT + engenharia de integridade |
| Uso monitorado evidenciando comportamento inesperado do agente | fw-governor + operador primário |

---

*Criado em Iteração 7.4 — 2026-06-10*
*Pacote de uso monitorado — inspection-agent — status: review — active: false*
*Operador: operador-primario*
*Hardening: NOTA-QA-001 (§7), NOTA-QA-002 (§8), NOTA-QA-003 (§9)*
