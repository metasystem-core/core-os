# CARD_SCHEMA_NOTES
## Documentação dos Campos dos Templates — Neumann Runtime Grammar

**Versão:** 1.0  
**Criado em:** SIMB-LIBRARY-003A (2026-06-12)  
**Escopo:** concept_card v2.0, symbol_card v2.0  
**Fonte:** IRIS_SCHEMA_EVOLUTION_PROPOSAL.md + IRIS_NEUMANN_RUNTIME_PROTOCOL.md

---

## Por que os templates foram atualizados

A autoanálise IRIS_SELF_ANALYSIS_001.md (63 gaps, 33 calibrações) revelou que os cards v1.0 funcionam como fragmentos sem consciência explícita de que são fragmentos de arquétipos primordiais maiores.

A metáfora de Neumann: o arquétipo primordial é irrepresentável em sua totalidade (luz branca) → a consciência o fragmenta em espectro de símbolos assimiláveis (cores do prisma). Os cards v1.0 mapeavam as cores sem referir à luz branca.

Os novos campos tornam visível essa hierarquia.

---

## Campos Novos — Conceito e Explicação

---

### `archetypal_root`

**O que é:** O arquétipo primordial indiferenciado de que este card (conceito ou símbolo) é fragmento.

**Por que existe:** Cada concept card e symbol card é apenas um segmento do espectro de um arquétipo primordial. A Iris precisa manter consciência de que interpreta fragmentos, não o arquétipo inteiro. Interpretar o fragmento sem consciência do arquétipo subjacente é erro sistemático.

**Valores típicos:** "Grande Mãe" | "Herói" | "Self" | "Totalidade Indiferenciada (Uroboros)" | "Pai" | "Sombra" | "Anima/Animus"

**Como usar:** Ao criar um card, identificar de qual arquétipo primordial maior este conceito ou símbolo é manifestação. Um símbolo pode ser fragmento de mais de um arquétipo (anotar ambos).

**Invariante:** `archetypal_root` ≠ o único significado do símbolo. É a âncora estrutural, não a interpretação completa.

---

### `developmental_stage`

**O que é:** Fase(s) do desenvolvimento da consciência (gramática Neumanniana) em que este conceito ou símbolo tipicamente opera.

**Por que existe:** O MESMO símbolo tem leitura oposta em estágios diferentes. Uroboros em ego nascente = risco de regressão. Uroboros em individuação = mandala, centroversia. Sem o campo `developmental_stage`, a Iris não consegue calibrar a leitura ao estágio.

**Valores válidos:**
| Valor | Descrição sumária |
|---|---|
| `urobórico` | Fusão sujeito-objeto; indiferenciado; ego embrionário |
| `matriarcal` | Dominação materna; filho-amante; devoração/proteção em tensão |
| `filho-amante` | Ego diferenciado mas frágil; fusão erótica; risco de desmembramento |
| `lutador` | Resistência sem força heroica; autodestrutividade |
| `heroico` | Confronto ativo; separação dos Pais do Mundo |
| `osiríaco` | Morte voluntária como auto-geração; ego orbita Self |
| `individuação` | Self como centro gravitacional; mandala; centroversia |
| `trans-estágios` | Conceito que opera em múltiplos estágios |
| `multi-estágio` | Símbolo com morfologia diferente em cada estágio |

**Invariante crítico:** `developmental_stage` = hipótese de fase simbólica — NÃO é diagnóstico clínico, NÃO é rótulo do operador. A Iris oferece hipótese provisória, não sentença. O operador sempre pode recusar a hipótese.

---

### `function_mode`

**O que é:** A função psicológica predominante com que este conceito ou símbolo se relaciona.

**Por que existe:** Funciona como triagem antes da interpretação (STEP 0 do protocolo Neumann Runtime). Material sensório-intuitivo exige abordagem diferente de material de pensamento-sentimento. Se a Iris não identifica a função dominante, pode forçar narrativa analítica sobre material que pede acompanhamento ressonante.

**Valores válidos:** `sensação` | `intuição` | `sentimento` | `pensamento` | `todas`

**Como usar:** Se um símbolo tipicamente emerge em material sensório-intuitivo (ex: Uroboros), a Iris sabe que não deve forçar narrativa estruturada. Se emerge em material de sentimento, a abordagem é relacional.

---

### `personal_archetypal_collective_level` (concept_card) / `possible_levels` (symbol_card)

**O que é:** Nível(is) de operação em que este conceito/símbolo tipicamente opera.

**Por que existe:** A lei da personalização secundária (Neumann) opera constantemente — o transpessoal é interpretado como pessoal. A Iris precisa rastrear o caminho inverso: da figura pessoal ao arquétipo subjacente. Este campo indica qual ponto de entrada é mais provável para este conceito/símbolo específico.

**Valores válidos:** `pessoal` | `arquetípico` | `coletivo-cultural` | `misto`

**Como usar:** Se um conceito tipicamente opera no nível arquetípico (ex: Grande Mãe como estrutura), a Iris sabe que menções à "minha mãe" podem ser a personalização secundária de algo transpessoal. O campo não determina o nível — indica onde verificar primeiro.

---

### `structural_reading`

**O que é:** A leitura estrutural Neumanniana do conceito ou símbolo: o que ele É e FAZ dentro da gramática.

**Por que existe:** A Iris agora realiza leitura dupla — estrutural + genética — em vez de apenas consultar significado. A leitura estrutural responde: qual arquétipo primordial está subjacente? Quais opostos são constelados? Como este card se relaciona com o estágio identificado?

**Como preencher:** Responder as três perguntas estruturais no card, com base nas fontes disponíveis na biblioteca.

**Protocolo:** Ver IRIS_NEUMANN_RUNTIME_PROTOCOL.md, STEP 4.

---

### `genetic_reading`

**O que é:** A leitura genética Neumanniana: por que este conceito/símbolo emerge AGORA no processo do operador?

**Por que existe:** Complementa a leitura estrutural com função prospectiva — não apenas "de onde vem" mas "para onde aponta". A Iris usa o campo como guia de calibração de resposta.

**Como preencher:** Responder as três perguntas genéticas no card, com base nas fontes disponíveis.

**Protocolo:** Ver IRIS_NEUMANN_RUNTIME_PROTOCOL.md, STEP 4.

---

### `literalization_risk`

**O que é:** O risco específico de interpretar literalmente o que é simbólico neste conceito/símbolo, com indicação de mitigação.

**Por que existe:** A Iris mantém uma tabela de riscos de literalização de alto impacto (ex: castração, incesto, decapitação). O campo documenta o risco no card individual para que a Iris não precise recorrer à tabela central toda vez.

**Exemplos:**
- "Castração → risco de interpretação genital/freudiana. Mitigação: explicitar registro simbólico antes de usar o termo."
- "Incesto urobórico → risco de horror literal. Mitigação: nomear como fusão simbólica, não ato físico."

---

### `therapeutic_confusion_risk`

**O que é:** O risco de confundir análise simbólica com prescrição terapêutica.

**Por que existe:** A Iris não é terapeuta. A emoção é input, não produto. Este campo documenta as formas específicas pelas quais este conceito/símbolo pode produzir confusão terapêutica no contexto do operador.

---

### `authority_risk` (concept_card)

**O que é:** O risco de usar este conceito como autoridade sobre o operador.

**Por que existe:** Certos conceitos (especialmente de Neumann) têm potência retórica que pode fazer o operador sentir que "deve" estar em uma fase ou que o conceito "explica" sua experiência. O campo documenta esse risco especificamente.

---

### `when_not_to_interpret`

**O que é:** Condições em que este conceito/símbolo NÃO deve ser aplicado à interpretação — situações em que guardar espaço é a resposta correta.

**Por que existe:** A Iris aprende com Neumann que a fragmentação dos arquétipos é processo espontâneo, não analítico. Há momentos em que interpretar prematuramente esvazia o símbolo. Este campo documenta quando parar.

**Regra geral (aplica a todos os cards):** Material sensório-intuitivo sem narrativa → guardar espaço. Material de ego frágil → não forçar interpretação.

**Como guardar espaço:**
- "Há algo se movendo aqui que ainda não tem forma."
- "Essa imagem está presente — o que ela produz em você?"
- Não precipitar sentido antes da hora.

---

### `response_questions`

**O que é:** Perguntas de baixa pressão que a Iris usa ao encontrar este conceito/símbolo no material do operador.

**Por que existe:** A Iris não responde ao operador com interpretação imediata. Oferece perguntas que criam espaço para o operador elaborar sem pressão de confirmação ou negação. As perguntas são abertas, não pressupõem resposta.

**Regra de formulação:** Nunca "você sente que..." (pressupõe). Sempre "o que esse [elemento] produz em você?" ou "há algo nessa imagem que ressoa?"

---

### `symbolic_motion` (symbol_card)

**O que é:** A direção ou dinâmica do símbolo no processo psíquico.

**Por que existe:** Símbolos não são estáticos — têm movimento. Uroboros não "é indiferenciação" — ele produz movimento de regressão-ascensão. Dragão não "é resistência" — ele guarda e desafia. O campo captura essa dinâmica.

**Exemplos:** `regressão-ascensão` | `confronto-superação` | `dissolução-reintegração` | `centroversia` | `possessão-libertação`

---

### `morphology` (symbol_card)

**O que é:** As formas que o símbolo pode assumir — variantes morfológicas.

**Por que existe:** Um símbolo arquetípico se manifesta em múltiplas formas. Dragão, Serpente e Leviatã são morfologias do mesmo símbolo arquetípico. Identificar a morfologia específica no material do operador é passo necessário antes da interpretação.

---

### `tension_with` (symbol_card)

**O que é:** Símbolos em tensão dinâmica com este — opostos constelados.

**Por que existe:** A dinâmica simbólica Neumanniana é sempre tensional — os opostos são constelados juntos. Conhecer a tensão de um símbolo permite à Iris rastrear o que está ativado em oposição quando o símbolo aparece.

---

### `gaps_or_limits`

**O que é:** O que este card ainda não captura — lacunas de cobertura para intake futuro.

**Por que existe:** Os cards são fragmentos de fragmentos. Este campo documenta o que está ausente para que a fila de implementação (IRIS_NEUMANN_IMPLEMENTATION_QUEUE.md) possa ser atualizada.

---

## Campos que Permaneceram (Continuidade)

| Campo antigo | Equivalente v2.0 | Notas |
|---|---|---|
| `source_id` / `source` | `source` | Renomeado e consolidado |
| `status` | `source_status` | Mais específico |
| Concept Summary | `core_definition` | Renomeado |
| Useful for SIMB Because | `operational_use` | Expandido |
| Risk Notes | `literalization_risk` + `therapeutic_confusion_risk` + `authority_risk` | Disagregados |
| Related Symbols | `related_symbols` | Mantido |
| Operator Questions | `response_questions` | Renomeado |
| Symbolic Field | mantido em symbol_card | Sem mudança |
| Prohibited Use | mantido | Expandido |
| Criado em / Por | `created_at` + `updated_at` + `version` | Estruturado |

---

## Invariantes

```
DEVELOPMENTAL_STAGE = HIPÓTESE DE FASE SIMBÓLICA, NÃO DIAGNÓSTICO CLÍNICO
ARCHETYPAL_ROOT = ÂNCORA ESTRUTURAL, NÃO SIGNIFICADO ÚNICO
FUNCTION_MODE = TRIAGEM OPERACIONAL, NÃO RÓTULO
WHEN_NOT_TO_INTERPRET = GUARDAR ESPAÇO É RESPOSTA VÁLIDA
STRUCTURAL_READING + GENETIC_READING = LEITURA DUPLA OBRIGATÓRIA (NEUMANN)
CONCEPT CARD ≠ DIAGNOSIS
SYMBOL CARD ≠ FIXED MEANING
OPERATOR OWNS INTERPRETATION
```

---

*Ver também: IRIS_NEUMANN_RUNTIME_PROTOCOL.md | IRIS_SCHEMA_EVOLUTION_PROPOSAL.md | IRIS_RESPONSE_CALIBRATION_PROTOCOL.md*
