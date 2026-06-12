# SELF-ANALYSIS TRIGGER POLICY
## Política de Gatilho para Auto-Análise — Iris / simb-agent

**Versão:** 1.0  
**Criado em:** SIMB-SOURCE-GOVERNANCE-001 (2026-06-12)  
**Agente responsável:** simb-agent (Iris)  
**Autoridade:** operador primário — Iris recomenda, operador decide

---

## Função

IRIS_SELF_ANALYSIS não é resumo de livro.  
É análise de como uma fonte **altera ou deveria alterar** o modus operandi da Iris.

A distinção é estrutural:
- **Resumo de livro:** o que a fonte diz
- **IRIS_SELF_ANALYSIS:** o que a fonte faz ao protocolo da Iris — o que muda, o que corrigi, o que cria tensão, o que precisa de patch

---

## Quando Criar IRIS_SELF_ANALYSIS

Criar apenas quando a fonte satisfizer critérios N3+ conforme SOURCE_WEIGHTING_POLICY.md.

**Checklist de gatilho:**

| Gatilho | Perguntas de diagnóstico |
|---|---|
| Muda o modo de leitura | "Depois desta fonte, Iris perguntaria diferente?" |
| Muda o modo de resposta | "Depois desta fonte, Iris responderia diferente?" |
| Muda limites e postura | "Depois desta fonte, Iris recusaria algo que antes aceitava?" |
| Gera tensão com arquitetura | "Esta fonte contradiz ou tensiona algo já integrado?" |
| Cria necessidade de protocolo | "Iris precisaria de um novo passo em algum fluxo?" |
| Justifica patch candidate | "Algum arquivo de evolução ou schema precisa ser alterado?" |

**Regra:** se a resposta for SIM a pelo menos 2 perguntas de gatilho, a fonte é candidata N3.

---

## Quando NÃO Criar IRIS_SELF_ANALYSIS

| Situação | Motivo |
|---|---|
| Fonte apenas informativa — adiciona fatos, não gramática | Não muda modus operandi |
| Fonte apenas complementar — reforça algo já integrado | Redundante — vai para N1 ou N2 |
| Fonte que gera cards mas não muda runtime | Destino: N2 |
| Fonte redundante com Neumann ou Rudhyar já integrados | Não acrescenta — pode ir para N1 |
| Fonte ainda não lida em modo SOURCE-FIRST | Sem base suficiente para diagnóstico |
| Fonte de baixa confiabilidade ou autoridade indeterminada | Risco de degradar protocolo existente |
| Fonte que apenas confirma o que já existe | Sem nova contribuição |

---

## Formato da IRIS_SELF_ANALYSIS

Todo documento IRIS_SELF_ANALYSIS deve ter a seguinte estrutura mínima:

```
# IRIS SELF-ANALYSIS NNN — [Título da Fonte]

## NOTA METODOLÓGICA
Por que esta fonte merece self-analysis — o que ela faz ao modus operandi.

## I. DIAGNÓSTICO DO ESTADO ATUAL DE IRIS
Como Iris operava antes desta fonte nos domínios afetados.

## II. O QUE ESTA FONTE ADICIONA / ALTERA
Contribuições específicas — com impacto operacional explícito.

## III. GAPS NOVOS IDENTIFICADOS
Lacunas que a fonte revelou no protocolo atual.
Formato: GAP-[SIGLA][NN] — Descrição, Impacto, Correção proposta.

## IV. TENSÕES IDENTIFICADAS
Conflitos com fontes já integradas.
Formato: T-[NN] — Polo A vs. Polo B → Resolução operacional.

## V. PROPOSTAS DE EVOLUÇÃO
O que deve mudar no protocolo — por nível (imediato / médio prazo / estrutural).

## VI. SÍNTESE: O QUE MUDA EM IRIS DEPOIS DESTA FONTE
Uma ou duas frases que capturam a mudança central.

## VII. JANELAS ABERTAS
O que ainda não foi resolvido — para sessões futuras.
```

---

## Estados Possíveis de um IRIS_SELF_ANALYSIS

| Estado | Definição | Ação seguinte |
|---|---|---|
| `candidate` | Iris recomenda self-analysis, mas operador ainda não aprovou | Aguardar decisão do operador |
| `approved` | Operador aprovou a criação da self-analysis | Criar documento IRIS_SELF_ANALYSIS_NNN |
| `complete` | Self-analysis criada, salva e registrada no índice | Avaliar para integração |
| `integrated` | Self-analysis virou protocolo, schema, card update ou patch formal | Registrar no IRIS_SELF_ANALYSIS_INDEX |
| `rejected` | Operador recusou — fonte não justifica self-analysis | Registrar motivo no IRIS_SELF_ANALYSIS_INDEX |
| `deferred` | Fonte pode ser útil depois, mas não agora | Registrar no Future Self-Analysis Candidates com justificativa |

---

## Protocolo de Recomendação de Self-Analysis (Iris → Operador)

Quando Iris identifica uma fonte candidata N3, deve emitir recomendação no formato:

```
IRIS SELF-ANALYSIS RECOMMENDATION

Fonte: [título] — [autor]
source_id: [SRC-SIMB-NNN]

Critérios fortes satisfeitos:
- [CF-XX]: [justificativa]

Critérios médios satisfeitos:
- [CM-XX]: [justificativa]

Tensões com arquitetura existente:
- [descrever tensão]

O que mudaria em Iris se esta fonte for integrada:
- [impacto operacional esperado]

Nível recomendado: N3 (Self-Analysis Candidate)
Operador aprova? [SIM / NÃO / ADIAR]
```

---

## Relação com SOURCE_WEIGHTING_POLICY.md

```
SOURCE_WEIGHTING_POLICY define QUANDO (critérios de nível)
SELF_ANALYSIS_TRIGGER_POLICY define COMO (formato, estados, protocolo)
IRIS_SELF_ANALYSIS_INDEX registra O QUE (histórico e candidatos)
SOURCE_EVALUATION_TEMPLATE é o formulário de avaliação individual
```

---

## Invariantes

```
IRIS_SELF_ANALYSIS ≠ RESUMO DE LIVRO
SELF-ANALYSIS = DIAGNÓSTICO DE MODUS OPERANDI
CANDIDATE ≠ APPROVED
APPROVED ≠ INTEGRATED
IRIS RECOMENDA — OPERADOR APROVA
AUTONOMOUS_SELF_PATCH = false
OPERATOR OWNS SELF-ANALYSIS DIRECTION
```
