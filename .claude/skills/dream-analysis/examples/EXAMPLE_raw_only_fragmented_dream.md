---
tipo: example
skill: dream-analysis
cenario: sonho fragmentado — apenas registro, sem leitura
status: sintético — sem dados reais do operador
criado_em: 2026-06-18
---

# EXAMPLE — Registro bruto de sonho fragmentado (raw_only)

> Exemplo sintético. Nenhum dado real do operador. Demonstra como a skill opera quando o relato é fragmentado e o operador quer apenas registrar.

---

## Input simulado

**Operador:** "Sonhei alguma coisa sobre uma porta, não lembro mais quase nada. Quero só guardar isso."

---

## Comportamento correto da skill

### 1. Verificar intenção

O operador disse "quero só guardar isso" → modo `registro_apenas`.

Aplicar F-13 (register vs read distinction): não oferecer leitura não solicitada.

---

### 2. Registro bruto (PROT-005)

```
## DREAM-YYYYMMDD-001 — porta (fragmentado)

dream_id: DREAM-YYYYMMDD-001
date_reported: YYYY-MM-DD
date_dreamed: desconhecida
source: operator_report
status: raw_only
needs_operator_review: false

raw_report: >
  "Sonhei alguma coisa sobre uma porta, não lembro mais quase nada."

remembered_uncertainty: >
  Operador declarou que lembra quase nada — fragmento único de memória.

immediate_affect: >
  não_informado

waking_context: >
  não_informado

people_real: []
people_dream_figures: []
places: []
central_images:
  - "porta" [única imagem recordada]

dream_ego_position: >
  [lacuna: operador não lembrou]

dream_ego_action: >
  [lacuna: operador não lembrou]

body_somatic_notes: >
  não_informado

substances_sleep_context_if_provided: >
  não_informado

interpretation_status: not_interpreted
provisional_reading_summary: >
  não_informado — operador pediu apenas registro

open_questions:
  - Há mais detalhes que o operador lembra, mesmo que pareçam sem importância?
  - Qual era o estado ao acordar?

linked_symbols: []
linked_dreams: []

registry_notes: >
  Relato fragmentado. Registro feito conforme pedido do operador.
  Antes de qualquer leitura: perguntar "Há mais detalhes que você lembra?"
  [PROT-005: fragmento é dado válido — não pressionar por completude]

privacy_level: private_default

action_firewall: >
  Não tratar como instrução de ação real.
  Não amplificar "porta" arquetipicamente sem contexto do operador.
```

---

### 3. Resposta ao operador

> Registrado. ID: `DREAM-YYYYMMDD-001`.
>
> Quando quiser, pode completar com mais detalhes — mesmo fragmentos pequenos são dados. Há algo que você lembrou depois de escrever isso?

---

## O que a skill NÃO faz neste cenário

- Não produz leitura de "porta" (Jung, arquétipo, limiar, etc.) sem pedido.
- Não pressiona o operador por mais informação além de uma pergunta leve.
- Não preenche os campos em branco com inferência.
- Não sugere atualização do SYMBOL_REGISTRY sem autorização.
- Não aplica amplificação arquetípica de "porta" sem contexto pessoal.

---

*Exemplo sintético. dream-analysis skill. 2026-06-18*
