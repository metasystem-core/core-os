# SOURCE WEIGHTING POLICY
## Política de Peso de Fontes — Biblioteca Simbólica SIMB

**Versão:** 1.0  
**Criado em:** SIMB-SOURCE-GOVERNANCE-001 (2026-06-12)  
**Agente responsável:** simb-agent (Iris)  
**Autoridade:** operador primário — esta política não pode ser alterada por Iris sem aprovação explícita

---

## Função

Nem toda fonte lida deve alterar a Iris.  
Toda fonte deve ser avaliada por peso, função, risco e destino operacional antes de qualquer processamento.

Esta política define a régua de avaliação. A decisão final de processamento é sempre do operador.

---

## Níveis de Processamento (N0–N5)

---

### N0 — Reject / Quarantine

**Destino:** quarantine ou intake recusado

**Critérios:**
- fonte fraca, superficial ou sem rigor interno
- fora do escopo da biblioteca simbólica
- contaminante — introduz frameworks que contradizem premissas centrais sem ganho operacional
- redundante com fonte já integrada, sem nova contribuição
- sem autoridade reconhecível no domínio
- risco alto de confusão ou inflação simbólica sem compensação
- fonte que transforma símbolo em signo automático

**O que produz:** nada — ou nota de recusa no INGESTION_DECISIONS_REGISTRY

**Exemplos de candidatos N0:**
- manuais genéricos de "simbolismo universal"
- fontes que afirmam certeza sobre significados simbólicos fixos
- fontes que misticismo operacional sem distinção entre nível pessoal e arquetípico

---

### N1 — Reading Note

**Destino:** `reading_notes/` — nota de síntese curta, não versionada como card

**Critérios:**
- fonte útil como referência contextual, mas sem força operacional
- amplia o background do operador, não o protocolo da Iris
- não gera cards
- não gera self-analysis
- não gera patch

**O que produz:** uma nota de leitura curta em `reading_notes/`

**Exemplos de candidatos N1:**
- enciclopédias de mitologia (útil como referência, não como gramática)
- monografias de tema muito específico sem generalização para o protocolo
- fontes históricas que situam contexto mas não alteram método

---

### N2 — Cards

**Destino:** concept_cards/, symbol_cards/ ou phase_cards/ (quando criados)

**Critérios:**
- fonte contém conceitos, símbolos ou distinções úteis para o repertório da Iris
- gera concept/symbol/phase cards no schema v2.0
- não muda o protocolo de análise da Iris
- não muda como Iris interpreta, limita ou responde

**O que produz:** cards novos ou expansão de cards existentes

**Exemplos de candidatos N2:**
- obras de mitologia comparada com mapeamento preciso de símbolos
- fontes que expandem cobertura de um arquétipo já mapeado
- obras que adicionam tradições culturais não representadas

---

### N3 — Self-Analysis Candidate

**Destino:** IRIS_SELF_ANALYSIS_CANDIDATE → aprovação do operador → IRIS_SELF_ANALYSIS_NNN

**Critérios (ver SELF_ANALYSIS_TRIGGER_POLICY.md para detalhes completos):**
- fonte muda o modo como Iris interpreta, pergunta, limita, escuta ou responde
- gera tensão com protocolo existente que precisa ser nomeada e avaliada
- recomenda mudança de postura antes de mudança de conteúdo

**O que produz:** IRIS_SELF_ANALYSIS_CANDIDATE (proposta); self-analysis formal se aprovada pelo operador

**Nota:** a Iris pode identificar e propor N3, mas só o operador aprova a promoção para self-analysis formal.

**Exemplos de candidatos N3:**
- Neumann (já integrado como SA-001) — gramática arquetípica
- Rudhyar (SA-002 a SA-004) — epistemologia e postura
- Obras que introduzem nova lógica interpretativa com impacto direto no protocolo

---

### N4 — Response Test Required

**Destino:** RESPONSE_TESTS_REGISTRY antes de qualquer patch

**Critérios:**
- fonte cria risco operacional ou mudança de leitura que precisa ser testada antes de integrar
- a mudança proposta é plausível mas pode produzir respostas erradas em contextos específicos
- tensão com fonte já integrada que pode produzir leituras contraditórias

**O que produz:** response tests antes de qualquer atualização de protocolo

**Regra:** fonte N4 não pode gerar patch antes de testes documentados no RESPONSE_TESTS_REGISTRY.

---

### N5 — Patch Candidate

**Destino:** IRIS SELF-REWRITE REQUEST → aprovação explícita do operador → Claude Code aplica

**Critérios:**
- fonte justifica alteração em protocolo, runtime, schema, card template ou modo de operação
- a mudança é arquitetural, não apenas de repertório
- pode incluir: alteração de AGENT.md, novos campos em templates, novo tipo de card, ajuste de protocolo de resposta

**O que produz:** patch candidate formal via OPERATOR_APPROVAL_GATE.md

**Nota crítica:** N5 sempre requer formato IRIS SELF-REWRITE REQUEST (7 campos). Nunca automático. `autonomous_self_patch: false` é invariante absoluto.

---

## Critérios de Promoção para Self-Analysis (N3+)

Uma fonte só pode ser recomendada para self-analysis se cumprir **pelo menos 2 critérios fortes OU 3 critérios médios**.

### Critérios Fortes (peso 2)

| # | Critério |
|---|---|
| CF-01 | Muda o modo de perguntar da Iris |
| CF-02 | Muda o modo de interpretar da Iris |
| CF-03 | Muda o modo de não interpretar (quando guardar espaço) |
| CF-04 | Corrige risco recorrente identificado em self-analysis anterior |
| CF-05 | Altera a relação estrutural entre símbolo, operador e resposta |
| CF-06 | Exige mudança de protocolo ou schema que não existia antes |
| CF-07 | Entra em tensão estrutural com fonte já integrada (tensão que deve ser nomeada e gerenciada) |

### Critérios Médios (peso 1)

| # | Critério |
|---|---|
| CM-01 | Adiciona vocabulário simbólico útil não coberto por fontes existentes |
| CM-02 | Melhora uma categoria existente com distinções mais precisas |
| CM-03 | Cria novos cards relevantes para o repertório operacional |
| CM-04 | Melhora ou expande response tests existentes |
| CM-05 | Amplia repertório sem alterar arquitetura |
| CM-06 | Refina uma distinção já existente com maior precisão |

---

## Critérios de Bloqueio para Self-Analysis

Uma fonte **NÃO deve** gerar self-analysis se qualquer um dos seguintes se aplicar:

| # | Critério de Bloqueio |
|---|---|
| B-01 | Apenas confirma o que já existe — sem nova contribuição operacional |
| B-02 | É redundante com fonte já integrada |
| B-03 | É sedutora mas imprecisa — estilo elevado sem rigor |
| B-04 | Gera inflação simbólica sem compensação operacional |
| B-05 | Estimula misticismo automático sem distinção de nível |
| B-06 | Empurra diagnóstico clínico ou prescrição de ação |
| B-07 | Transforma símbolo em comando ("este símbolo significa que você deve...") |
| B-08 | Aumenta dependência do operador em relação a Iris |
| B-09 | Não produz mudança operacional verificável no modus operandi |
| B-10 | Fonte ainda não lida ou processada SOURCE-FIRST |

---

## Saída Obrigatória da Avaliação de Fonte

Toda fonte avaliada deve receber um formulário de avaliação completo antes de qualquer decisão de processamento.

**Template:** `SOURCE_EVALUATION_TEMPLATE.md`

**Campos obrigatórios:**

```yaml
source_id:            # SRC-SIMB-NNN (se já registrada) ou provisório
title:                # título da obra
author:               # autor(es)
source_type:          # livro | artigo | tradição oral | compilação | digital
domain:               # psicologia_junguiana | astrologia_humanista | filosofia | mitologia | etc.
authority_level:      # alta | média | baixa | indeterminada
novelty_score:        # 0–5 — quanto acrescenta ao que já existe na biblioteca
operational_impact:   # 0–5 — quanto afeta o modus operandi da Iris
risk_score:           # 0–5 — risco de inflação, confusão, mysticism, literalização
redundancy_score:     # 0–5 — quanto duplica fontes já integradas (5 = totalmente redundante)
recommended_level:    # N0 / N1 / N2 / N3 / N4 / N5
justification:        # por que este nível — raciocínio explícito
operator_decision_required: # yes / no
next_action:          # o que fazer a seguir
```

---

## Invariantes

```
NEM TODA FONTE LIDA ALTERA A IRIS
NEM TODA FONTE ÚTIL GERA SELF-ANALYSIS
SELF-ANALYSIS = MUDANÇA NO MODUS OPERANDI, NÃO RESUMO
N3 REQUER APROVAÇÃO DO OPERADOR
N5 REQUER IRIS SELF-REWRITE REQUEST + APROVAÇÃO FORMAL
AUTONOMOUS_SELF_PATCH = false (absoluto)
OPERATOR DECIDES FINAL LEVEL
IRIS RECOMMENDS — OPERATOR APPROVES
```
