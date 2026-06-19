---
tipo: template
arquivo: DREAM_ENTRY_TEMPLATE.md
uso: copiar para DREAM_REGISTRY.md ao registrar novo sonho
criado_em: 2026-06-18
---

# DREAM ENTRY TEMPLATE

Copiar o bloco abaixo para DREAM_REGISTRY.md. Preencher campos disponíveis. Deixar campos desconhecidos como `desconhecido` ou `não_informado` — nunca preencher com inferência.

---

```
## DREAM-YYYYMMDD-XXX — título provisório (curto, não interpretativo)

dream_id: DREAM-YYYYMMDD-XXX
date_reported: YYYY-MM-DD
date_dreamed: YYYY-MM-DD | desconhecida | estimada_YYYY-MM
source: operator_report | imported_old_file | chat_reconstruction
status: raw_only | interpreted | needs_context | series_candidate | high_sensitivity
needs_operator_review: true | false

raw_report: >
  [Texto literal do operador, sem edição interpretativa.
   Manter exatamente como foi relatado, incluindo erros ortográficos e
   fragmentos incompletos. NUNCA reescrever para "melhorar" a clareza.
   NUNCA preencher lacunas com inferência.]

remembered_uncertainty: >
  [O que o operador sinalizou como incerto na memória do sonho.
   Ex: "não lembro se era a rua X ou Y", "talvez fosse minha mãe mas não tenho certeza".]

immediate_affect: >
  [Afeto imediato ao acordar, se relatado pelo operador.
   Ex: angústia, alívio, confusão, indiferença, prazer, medo.]

waking_context: >
  [Contexto da vida desperta que o operador considera relevante para este sonho.
   Relato do operador, não inferência da Iris.]

people_real: []
  # Pessoas reais que apareceram no sonho. Listar por nome ou relação.
  # SEMPRE registrar tensão: pessoa real ≠ figura onírica ≠ função simbólica.
  # Não colapsar pessoa real em símbolo sem nota explícita de tensão.

people_dream_figures: []
  # Figuras que não têm correspondente real identificado.

places: []
  # Lugares do sonho. Incluir se real (ex: "Araxá — real") ou transposição (ex: "lugar parecido com escola mas não era").

central_images: []
  # Imagens centrais do sonho — não interpretadas. Apenas descritivas.
  # Ex: "serpente morta", "porta trancada", "ferramentas sem fio"

dream_ego_position: >
  [Onde o dream-ego estava no sonho — observador, participante, agente, ausente?
   Se houve split (ver e ser ao mesmo tempo), registrar.]

dream_ego_action: >
  [O que o dream-ego fez. Relato factual do relato, sem avaliação moral.]

body_somatic_notes: >
  [Sensações corporais ou somáticas mencionadas pelo operador — dor, voo, peso, etc.
   Deixar em branco se não mencionado.]

substances_sleep_context_if_provided: >
  [Se o operador mencionou uso de substâncias ou contexto de sono relevante.
   Ex: cannabis, álcool, insônia prévia, medicação.
   Deixar em branco se não mencionado. NÃO inferir.]

interpretation_status: not_interpreted | partial | interpreted
provisional_reading_summary: >
  [Apenas se interpretation_status != not_interpreted.
   Manter linguagem provisória: "uma leitura possível é...", não "o sonho significa...".
   Data da leitura: YYYY-MM-DD | versão: v1]

open_questions: []
  # Perguntas que permaneceram abertas após o registro/leitura.

linked_symbols: []
  # IDs de símbolos em SYMBOL_REGISTRY relacionados a imagens deste sonho.
  # Ex: SYM-OP-001 (serpente)

linked_dreams: []
  # IDs de outros sonhos com relação de campo ou possível série.
  # Não inferir série — listar apenas se operador sinalizou ou se há base factual.

registry_notes: >
  [Notas operacionais: correções do operador, contexto de importação,
   flags especiais, razão do status, etc.]

privacy_level: private_default | restricted | operator_only
  # private_default: tratamento padrão de material privado
  # restricted: não usar em sínteses sem solicitação explícita
  # operator_only: nunca mencionar sem solicitação do operador por nome

action_firewall: >
  [Registrar explicitamente o que NÃO inferir a partir deste sonho.
   Ex: "não tratar como instrução de ação real", "não conectar ao processo jurídico sem solicitação".]
```

---

## Regras de preenchimento

1. `raw_report` é sagrado — nunca editado após o primeiro registro.
2. Campos desconhecidos → `desconhecido` ou lista vazia `[]`. Nunca preencher com suposição.
3. `needs_operator_review: true` em qualquer reconstrução de arquivo legado ou chat.
4. `high_sensitivity` obrigatório para: pessoa real em contexto de assimetria etária, sexual, violência intensa, numinoso extremo.
5. `action_firewall` é obrigatório quando houver risco de sonho ser tratado como instrução.
6. Leitura simbólica só em `provisional_reading_summary`, com marcação `v1 — provisório` e data.
7. Não registrar pessoa real como símbolo sem nota de tensão explícita.

---

*Template de uso interno. Copiar para DREAM_REGISTRY.md — não editar este arquivo.*
