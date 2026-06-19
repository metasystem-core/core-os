---
tipo: example
skill: dream-analysis
cenario: sonho com alto afeto — PROT-005 / F-11 / F-12
status: sintético — sem dados reais do operador
criado_em: 2026-06-18
---

# EXAMPLE — Sonho com alto afeto: registrar primeiro (high_affect_pause)

> Exemplo sintético. Nenhum dado real do operador. Demonstra como a skill opera quando o operador relata afeto intenso ao acordar. PROT-005 + F-11 + F-12 ativos.

---

## Input simulado

**Operador:** "Sonhei que meu pai morreu de novo. Acordei em pânico, coração disparado. Não consigo parar de pensar. Me explica o que significa."

---

## Comportamento correto da skill

### 1. Reconhecer o estado

Alto afeto declarado: "pânico", "coração disparado". Ativar F-11 (high_affect_pause) antes de qualquer movimento interpretativo.

F-12 (raw_report_first): o operador pediu interpretação, mas PROT-005 determina que o registro vem antes. Não inverter a ordem.

---

### 2. Pausa de afeto (F-11)

Antes de registrar ou interpretar, reconhecer o estado sem analisar:

> "Antes de entrar no conteúdo do sonho — você acabou de acordar em pânico. Isso é dado também. Quando quiser, me conta o sonho com o que você lembra, do jeito que vier."

---

### 3. Registro bruto (PROT-005 + F-12)

Após o operador fornecer mais detalhes:

```
## DREAM-YYYYMMDD-002 — morte do pai (segunda vez)

dream_id: DREAM-YYYYMMDD-002
date_reported: YYYY-MM-DD
date_dreamed: YYYY-MM-DD
source: operator_report
status: high_sensitivity
needs_operator_review: false

raw_report: >
  "Sonhei que meu pai morreu de novo. Acordei em pânico, coração disparado.
  Não consigo parar de pensar."

remembered_uncertainty: >
  Operador relatou o afeto com precisão; conteúdo do sonho não foi detalhado além da morte do pai.
  Lacuna: o que aconteceu no sonho — circunstâncias, local, presença de outras figuras.

immediate_affect: >
  Pânico intenso. Taquicardia ao acordar. Pensamento persistente (ruminação pós-sonho).
  — dado clínico leve: não medicalizar; não encaminhar sem solicitação.

waking_context: >
  [a preencher quando operador fornecer]

people_real:
  - pai do operador (falecido — morte real anterior presumida pelo uso "de novo")
    tensão: pessoa real / figura onírica / função simbólica — manter separados

people_dream_figures: []

places: []

central_images:
  - "morte do pai" [imagem central, não interpretada]

dream_ego_position: >
  [lacuna: não relatado pelo operador]

dream_ego_action: >
  [lacuna: não relatado]

body_somatic_notes: >
  Taquicardia ao acordar. Pânico. Pensamento persistente.
  — registrar como dado somático; não diagnosticar.

interpretation_status: not_interpreted
provisional_reading_summary: >
  não_informado — registro ainda incompleto; leitura aguarda mais conteúdo e calma do operador.

open_questions:
  - O que você lembra do que aconteceu no sonho? (além da morte)
  - Havia outras pessoas presentes?
  - Como estava o dream-ego — você estava vendo, participando, sendo avisado?
  - "De novo" — você já sonhou isso antes?

linked_symbols: []
linked_dreams: []

registry_notes: >
  Sonho relatado em estado de afeto intenso. Registro feito com F-11 + F-12.
  Conteúdo ainda incompleto. Leitura adiada até:
  (a) operador fornecer mais detalhes, OU
  (b) operador solicitar leitura com o que há.
  Verificar se "de novo" indica série — se sim, ativar status: series_candidate.

privacy_level: private_default

action_firewall: >
  Não tratar morte do pai no sonho como presságio ou sinal.
  Não conectar a eventos reais sobre o pai sem solicitação.
  Não recomendar encaminhamento clínico sem solicitação explícita.
```

---

### 4. Resposta ao operador (após registro)

> Registrado. Antes de entrar na leitura — você disse "de novo". Você já sonhou com a morte do seu pai antes? Isso ajuda a entender se é um sonho isolado ou parte de algo maior.
>
> Se quiser, me conta mais do que aconteceu no sonho — qualquer fragmento que você lembre, mesmo que pareça sem importância.

---

## O que a skill NÃO faz neste cenário

- Não vai direto para interpretação porque o operador pediu.
- Não diagnostica o pânico ou a taquicardia.
- Não diz "isso é normal" como conforto vazio.
- Não amplifica "pai" com Jung, complexo paterno, etc., antes de ter conteúdo suficiente.
- Não trata "de novo" como série confirmada sem verificação no DREAM_REGISTRY.
- Não preenche os campos em branco com inferência sobre o falecimento real.

---

*Exemplo sintético. dream-analysis skill. 2026-06-18*
