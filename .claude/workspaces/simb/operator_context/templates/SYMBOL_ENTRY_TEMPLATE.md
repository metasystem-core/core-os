---
tipo: template
arquivo: SYMBOL_ENTRY_TEMPLATE.md
uso: copiar para SYMBOL_REGISTRY.md ao registrar novo símbolo recorrente
criado_em: 2026-06-18
---

# SYMBOL ENTRY TEMPLATE

Copiar o bloco abaixo para SYMBOL_REGISTRY.md. Preencher apenas campos confirmados por aparições no DREAM_REGISTRY. Nunca adicionar significado fixo.

---

```
## SYM-OP-XXX — nome provisório (descritivo, não interpretativo)

symbol_id: SYM-OP-XXX
label: nome da imagem (ex: "serpente morta", "porta trancada")
first_seen: DREAM-YYYYMMDD-XXX | data estimada: YYYY-MM
last_seen: DREAM-YYYYMMDD-XXX | data estimada: YYYY-MM
status: active | dormant | unclear | corrected_by_operator

appearances:
  - dream_id: DREAM-YYYYMMDD-XXX
    context: >
      [Contexto da aparição neste sonho — breve, factual.]
    affect: >
      [Afeto associado a esta imagem neste sonho, se relatado.]
    image_form: >
      [Forma específica que a imagem tomou neste sonho.
       A mesma imagem simbólica pode ter formas distintas — registrar cada variação.]
    dream_ego_relation: >
      [Relação do dream-ego com esta imagem: observou, interagiu, evitou, foi afetado por, etc.]

  # Repetir bloco de appearance para cada sonho onde o símbolo aparece.

operator_associations: >
  [Associações declaradas pelo operador sobre esta imagem.
   Texto literal do operador quando possível. Data da declaração.
   NUNCA misturar com associações da Iris.]

cultural_layer_if_relevant: >
  [Apenas se o operador solicitou ou se há material público relevante não especulativo.
   Ex: "serpente em contexto bíblico mencionado pelo operador em DREAM-OLD-XXX".
   Não adicionar sem base no relato do operador ou autorização explícita.]

archetypal_layer_if_authorized: >
  [Apenas se o operador solicitou amplificação arquetípica explicitamente.
   Registrar fonte: qual autor, qual conceito, com data de autorização.
   NÃO preencher por iniciativa da Iris.]

transformations_over_time: >
  [Mudanças observadas na imagem ao longo das aparições.
   Ex: serpente viva → serpente morta; porta trancada → porta com jeito especial de abrir.
   Apenas factual — não interpretar como progressão ou regressão.]

linked_symbols: []
  # IDs de outros símbolos com relação estrutural observada.
  # Registrar relação: "eco estrutural com", "aparece junto a", "forma alternativa de".
  # Não inferir síntese — apenas observar co-aparição.

linked_people_real: []
  # Pessoas reais que aparecem frequentemente junto a este símbolo.
  # SEMPRE manter tensão: pessoa real ≠ função simbólica.
  # Registrar tensão explicitamente: "figura onírica com nome X não é necessariamente X real".

risk_notes: >
  [Riscos específicos de interpretação desta imagem.
   Ex: "risco de projeção de tema jurídico em conteúdo onírico",
       "risco de tratamento como presságio literal".]

correction_history: []
  # Correções do operador sobre leituras anteriores desta imagem.
  # Formato: "YYYY-MM-DD: [correção] — operador declarou que [...]"
  # Nunca deletar correção anterior — sempre append.

do_not_reduce_to: []
  # Lista de reduções proibidas para este símbolo.
  # Ex: "não reduzir a 'mãe'", "não tratar como presságio de evento real".
  # Alimentado por correções do operador e firewalls do protocolo.

current_reading: >
  [Leitura provisória mais recente — formulação aberta, não definitiva.
   Formato: "uma leitura possível em [data] é..."
   Sem linguagem de certeza.]

reading_status: open | provisional | hold | not_to_interpret
  # open: sem leitura ainda
  # provisional: leitura em andamento, revisável
  # hold: aguarda mais dados ou autorização
  # not_to_interpret: operador solicitou que não seja interpretado
```

---

## Regras de preenchimento

1. Símbolo recorrente ≠ símbolo fixo. A função deste registro é rastrear transformação, não fixar significado.
2. `operator_associations` precede qualquer camada cultural ou arquetípica. Sempre.
3. `archetypal_layer_if_authorized` só preenchido com autorização explícita e datada do operador.
4. `correction_history` é append-only — nunca apagar correção anterior.
5. `do_not_reduce_to` deve crescer com cada correção do operador.
6. Pessoa real ligada a símbolo: manter separação explícita entre pessoa real, figura onírica e função simbólica — esses três não são a mesma coisa.
7. Se o operador corrigiu uma leitura, atualizar `current_reading` e registrar correção em `correction_history`.
8. `not_to_interpret`: se o operador solicitou, não mencionar leitura mesmo que haja uma registrada.

---

*Template de uso interno. Copiar para SYMBOL_REGISTRY.md — não editar este arquivo.*
