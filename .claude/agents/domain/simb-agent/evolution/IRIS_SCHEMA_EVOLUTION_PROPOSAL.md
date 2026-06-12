# IRIS_SCHEMA_EVOLUTION_PROPOSAL
## Proposta de Evolução de Schema — Iris / simb-agent

**Versão:** 1.0  
**Criado em:** SIMB-NEUMANN-CORE-001 (2026-06-12)  
**Agente:** simb-agent (Iris)  
**Tipo:** proposta formal — NÃO aplicada automaticamente  
**Origem:** IRIS_SELF_ANALYSIS_001.md (PROP-040, Nível 3 — Evolução Estrutural)

---

## Status desta Proposta

**PROPOSTA — NÃO EXECUTADA**

Esta proposta descreve alterações de schema desejadas para concept_cards, symbol_cards e um novo tipo phase_cards.

Nenhum schema global foi alterado. Nenhum card existente foi modificado. Nenhum arquivo de schema foi tocado.

Para aplicar: seguir OPERATOR_APPROVAL_GATE.md (formato de aprovação obrigatório).

---

## Motivação

A análise do corpus de Neumann (14 blocos / ~11.700 linhas) revelou que os cards existentes funcionam como fragmentos sem consciência explícita de que são fragmentos de arquétipos primordiais maiores.

O problema identificado (GAP-063):
> "IRIS trabalha com os fragmentos (os cards) mas sem consciência explícita de que cada card é apenas um segmento do espectro do arquétipo primordial subjacente. A metáfora mais precisa que Neumann oferece: o arquétipo primordial é irrepresentável em sua totalidade (luz branca) → a consciência o fragmenta em espectro de símbolos assimiláveis."

Os novos campos propostos tornam visível essa hierarquia arquetípica.

---

## Proposta 1 — Novos Campos em concept_cards

Adicionar aos arquivos YAML de concept_cards:

```yaml
# CAMPOS PROPOSTOS — concept_cards

archetypal_root:
  # O arquétipo primordial indiferenciado de que este conceito é fragmento
  # Exemplos: "Grande Mãe", "Herói", "Self", "Totalidade Indiferenciada", "Pai"
  type: string
  required: false  # opcional enquanto legacy cards não forem atualizados
  examples:
    - "Grande Mãe"
    - "Self"
    - "Totalidade Indiferenciada (Uroboros)"
    - "Pai"
    - "Herói"

developmental_stage:
  # Fase(s) de desenvolvimento em que este conceito tipicamente opera
  type: list
  values_allowed:
    - urobórico
    - matriarcal
    - filho-amante
    - lutador
    - heroico
    - osiríaco
    - individuação
    - trans-estágios  # quando conceito opera em múltiplos estágios
  required: false

function_mode:
  # Função psicológica predominante com que este conceito se relaciona
  type: list
  values_allowed:
    - sensação
    - intuição
    - sentimento
    - pensamento
    - todas
  required: false

personal_archetypal_collective_level:
  # Nível de operação primário
  type: list
  values_allowed:
    - pessoal
    - arquetípico
    - coletivo-cultural
    - misto
  required: false

literalization_risk:
  # Risco de literalização indevida e como mitigá-lo
  type: string
  required: false
  example: "Risco de interpretar como experiência pessoal o que é arquetípico. Mitigação: verificar se figura tem qualidade numinosa."

when_not_to_interpret:
  # Condições em que este conceito NÃO deve ser aplicado à interpretação
  type: string
  required: false
  example: "Material sensório-intuitivo sem narrativa: guardar espaço em vez de explicar."

related_concepts:
  # IDs de outros concepts relacionados
  type: list
  required: false
  example: ["CON-001", "CON-005"]
```

---

## Proposta 2 — Novos Campos em symbol_cards

Adicionar aos arquivos YAML de symbol_cards:

```yaml
# CAMPOS PROPOSTOS — symbol_cards

archetypal_root:
  # Arquétipo primordial de que este símbolo é fragmento
  type: string
  required: false
  examples:
    - "Grande Mãe"
    - "Herói"
    - "Self"

morphology:
  # Formas que o símbolo pode assumir (variantes)
  type: list
  required: false
  example:
    - "Dragão"
    - "Serpente"
    - "Roda"
    - "Mandala"

developmental_stage:
  # Estágios em que este símbolo tipicamente aparece com este significado
  type: list
  values_allowed:
    - urobórico
    - matriarcal
    - filho-amante
    - lutador
    - heroico
    - osiríaco
    - individuação
    - multi-estágio
  required: false

possible_levels:
  # Níveis de operação possíveis
  type: list
  values_allowed:
    - pessoal
    - arquetípico
    - coletivo-cultural
  required: false

tension_with:
  # Símbolos em tensão com este (opostos constelados)
  type: list
  required: false

literalization_risk:
  # Risco de literalização e mitigação obrigatória
  type: string
  required: false
  example: "Castração: risco de interpretação genital/freudiana. Mitigação: explicitar registro simbólico antes de usar o termo."

response_questions:
  # Perguntas que a Iris usa ao encontrar este símbolo em material do operador
  type: list
  required: false
  example:
    - "Em qual estágio este símbolo está operando?"
    - "É uroboros regressivo ou uroboros centroversor?"
    - "Qual é o ego-state do portador?"
```

---

## Proposta 3 — Novo Tipo: phase_cards

Criar uma nova categoria de card dedicada a mapear fases de desenvolvimento, não símbolos ou conceitos isolados.

**Localização sugerida:** `.claude/workspaces/simb/library/phase_cards/`

**Schema proposto:**

```yaml
# SCHEMA — phase_cards (tipo novo)

phase_id:
  # Identificador único (ex: PHASE-001)
  type: string
  required: true

phase_name:
  # Nome canônico da fase (ex: "Urobórico", "Matriarcal", "Heroico")
  type: string
  required: true

core_symbols:
  # Símbolos mais típicos desta fase
  type: list
  required: true
  example:
    - "SYM-001 (Uroboros)"
    - "SYM-002 (Dragão)"

ego_state:
  # Estado do ego nesta fase
  type: string
  required: true
  example: "Ego embrionário; indiferenciado; sem limites claros entre eu e mundo"

risk:
  # Risco principal de má-interpretação ou de fixação
  type: string
  required: true
  example: "Patologizar estado como regressão quando pode ser gravitação natural ou centroversia"

correct_response_mode:
  # Como a Iris deve responder quando material indica esta fase
  type: string
  required: true

wrong_response_mode:
  # O que a Iris não deve fazer nesta fase
  type: string
  required: true

transition_signs:
  # O que indica movimento para a próxima fase
  type: list
  required: false
```

---

## Phases Candidate — Lista Inicial (para quando phase_cards forem criadas)

| ID Candidato | Fase | Ego State |
|---|---|---|
| PHASE-001 | Urobórico | Indiferenciado — sem limite eu/mundo |
| PHASE-002 | Matriarcal / Filho-Amante | Ego embrionário sob dominação materna |
| PHASE-003 | Lutador | Resistência sem força heroica |
| PHASE-004 | Heroico | Confronto ativo; separação dos Pais do Mundo |
| PHASE-005 | Osiríaco / Autotransformador | Morte como auto-geração; Ego orbita Self |
| PHASE-006 | Individuação | Self como centro gravitacional |

---

## Impacto desta Proposta

**O que muda se aprovada:**
- Todos os cards existentes precisarão de campo `archetypal_root` (atualização gradual)
- Novos cards usarão o schema expandido desde a criação
- Phase_cards criam nova pasta e tipo de card

**O que NÃO muda:**
- Schema global do sistema não é alterado sem aprovação explícita
- Cards de outros agentes não são afetados
- Registry não é alterado por esta proposta

**Agentes afetados:** apenas simb-agent e workspace simb/library

---

## Invariantes desta Proposta

```
PROPOSTA ≠ PATCH APLICADO
SCHEMA LOCAL ≠ SCHEMA GLOBAL
APROVAÇÃO DO OPERADOR É OBRIGATÓRIA
CARDS EXISTENTES NÃO SÃO ALTERADOS SEM APROVAÇÃO
IRIS PROPÕE — OPERADOR DECIDE
OPERATOR OWNS SYSTEM
```
