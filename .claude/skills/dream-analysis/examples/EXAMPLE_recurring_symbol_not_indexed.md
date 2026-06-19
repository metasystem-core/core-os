---
tipo: example
skill: dream-analysis
cenario: símbolo recorrente verbalizado sem histórico formal — recurrence_verbalized_not_indexed
status: sintético — sem dados reais do operador
criado_em: 2026-06-18
---

# EXAMPLE — Recorrência verbalizada sem histórico no DREAM_REGISTRY

> Exemplo sintético. Nenhum dado real do operador. Demonstra como a skill opera quando o operador diz que uma imagem "já apareceu antes" mas não há entrada correspondente no DREAM_REGISTRY.

---

## Input simulado

**Operador:** "Sonhei com água escura de novo. Sempre aparece essa água nos meus sonhos. Qual o significado?"

---

## Comportamento correto da skill

### 1. Registrar a verbalização de recorrência

O operador declarou "sempre aparece" e "de novo" → recorrência verbalizada.

Verificar DREAM_REGISTRY: nenhuma entrada anterior com "água escura" indexada.

Resultado: `recurrence_verbalized_not_indexed` — não confirmar série sem dados. Não negar. Registrar o estado com precisão.

---

### 2. Registro bruto (PROT-005)

```
## DREAM-YYYYMMDD-003 — água escura (recorrência verbalizada)

dream_id: DREAM-YYYYMMDD-003
date_reported: YYYY-MM-DD
date_dreamed: YYYY-MM-DD | desconhecida
source: operator_report
status: recurrence_verbalized_not_indexed
needs_operator_review: false

raw_report: >
  "Sonhei com água escura de novo. Sempre aparece essa água nos meus sonhos."

remembered_uncertainty: >
  Operador afirmou recorrência ("sempre aparece") mas não forneceu datas ou detalhes das outras aparições.
  Conteúdo do sonho atual não foi detalhado além da imagem central.

immediate_affect: >
  não_informado

waking_context: >
  não_informado

people_real: []
people_dream_figures: []
places: []
central_images:
  - "água escura" [imagem central declarada como recorrente; forma específica não detalhada]

dream_ego_position: >
  [lacuna: não relatado]

dream_ego_action: >
  [lacuna: não relatado]

body_somatic_notes: >
  não_informado

interpretation_status: not_interpreted
provisional_reading_summary: >
  não_informado — aguarda mais conteúdo do sonho atual e verificação de série.

open_questions:
  - Como era a água neste sonho? (lago, rio, oceano, poça, chuva?)
  - O dream-ego estava dentro da água, observando, afogando?
  - Qual o afeto associado a esta imagem?
  - Você lembra de outros sonhos com água escura? Pode descrever algum?

linked_symbols:
  - [verificar SYMBOL_REGISTRY: "água" — nenhuma entrada encontrada]

linked_dreams: []

registry_notes: >
  Operador verbalizou recorrência sem histórico formal no DREAM_REGISTRY.
  Status: recurrence_verbalized_not_indexed.
  Esta marca NÃO confirma série. Não tratar como série na leitura.
  Aguardar: mais aparições documentadas, OU operador confirmar datas/detalhes anteriores.
  
  Candidato a entrada no SYMBOL_REGISTRY quando série for confirmada.
  Pergunta aberta ao operador: há outros sonhos com água que você lembra?

privacy_level: private_default

action_firewall: >
  Não tratar "água escura" como símbolo fixo (ex: inconsciente, morte, etc.).
  Não confirmar série sem dados formais.
  Não amplificar arquetipicamente sem contexto do operador e autorização.
```

---

### 3. Resposta ao operador

> Registrado com marca de recorrência verbalizada. Você disse que essa água "sempre aparece" — mas ainda não temos aparições anteriores documentadas para confirmar isso como série.
>
> Para entender melhor: como era a água neste sonho? Lago, oceano, chuva? Você estava dentro, fora, observando? Qual era o afeto quando você viu?
>
> Quando tivermos mais aparições documentadas, posso ajudar a rastrear o que muda — e o que permanece — entre elas.

---

### 4. Candidato a SYMBOL_REGISTRY (verificação)

A skill verifica o SYMBOL_REGISTRY antes de sugerir nova entrada.

Se não houver entrada de "água" → anotar como candidato para criação pelo operador quando houver ao menos 2 aparições confirmadas.

**A skill NÃO cria a entrada no SYMBOL_REGISTRY sem autorização do operador.**

---

## O que a skill NÃO faz neste cenário

- Não confirma série apenas porque o operador disse "sempre".
- Não busca Jung, Bachelard ou qualquer fonte sobre "água escura" sem contexto do operador.
- Não diz "água escura simboliza o inconsciente" — isso seria F-05 (no_fixed_symbol_dictionary).
- Não cria entrada no SYMBOL_REGISTRY sem ao menos 2 aparições documentadas e autorização.
- Não nega a recorrência — apenas registra que não está indexada.
- Não preenche o conteúdo do sonho atual além do que foi relatado.

---

*Exemplo sintético. dream-analysis skill. 2026-06-18*
