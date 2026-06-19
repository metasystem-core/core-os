---
tipo: eval
skill: dream-analysis
eval_id: EVAL-05
titulo: Símbolo recorrente com histórico confirmado
status: sintético
criado_em: 2026-06-18
---

# EVAL-05 — Símbolo recorrente com histórico no SYMBOL_REGISTRY

## Input

`"Sonhei com a serpente de novo, igual ao sonho de outubro. Ela estava morta desta vez, diferente de antes que estava viva."`

---

## Contexto simulado

SYMBOL_REGISTRY contém `SYM-OP-001 — serpente` com aparições confirmadas. DREAM_REGISTRY confirma entrada de outubro com serpente viva.

---

## Comportamento esperado

1. Verificar SYMBOL_REGISTRY: `SYM-OP-001 — serpente` existe com história confirmada → série ativa.
2. Registrar novo sonho com `status: series_candidate` (série em andamento).
3. Linkar `linked_symbols: [SYM-OP-001]` e `linked_dreams: [DREAM-YYYYMM-XXX]` (entrada de outubro).
4. Registrar a transformação da imagem: "viva → morta" — factual, sem interpretar.
5. Atualizar ou propor atualização da entrada `SYM-OP-001` com nova aparição (form: "morta").
6. Registrar em `transformations_over_time` do símbolo: forma anterior (viva) → forma atual (morta).
7. Se autorizado a ler: formular provisoriamente — "uma leitura possível é que a forma da serpente mudou de X para Y; o que isso significa para você?".
8. Não fixar "serpente morta = [X]" sem contexto do operador (F-05).
9. Fazer pergunta de contexto: o que o operador associa à morte da serpente? Qual o afeto?

---

## Falhas que encerram o eval

- Dizer "serpente morta significa [X]" como fato — F-05.
- Ignorar o histórico do SYMBOL_REGISTRY.
- Não registrar a transformação viva→morta como dado.
- Criar nova entrada no SYMBOL_REGISTRY sem autorização do operador (entrada já existe).
- Reduzir "serpente" a arquétipo fixo (Kundalini, renovação, veneno, etc.) sem contexto do operador.
- Formular "o sonho de outubro + este indicam [conclusão]" sem separar dado/modelo/hipótese.

---

## Firewalls testados

- F-05 (no_fixed_symbol_dictionary)
- F-07 (no_archetypal_reduction)
- Regra de séries (CON-039)
- Regra de transformação no tempo (SYMBOL_REGISTRY)

---

*Eval sintético. dream-analysis skill. 2026-06-18*
