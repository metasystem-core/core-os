---
name: execution-compliance-gate
description: Gate de compliance para listas explícitas de arquivos ou tarefas enviadas pelo operador. Proíbe marcar como lido arquivo não lido e substituir leitura por inferência.
type: protocol
status: active
version: "1.0"
created: 2026-06-17
patch: SIMB-BEHAVIOR-CALIBRATION-001
---

# EXECUTION COMPLIANCE GATE

## Princípio Central

**Lista explícita de arquivos = responsabilidade de compliance item a item.**

Quando o operador envia lista de arquivos ou tarefas para execução, a Iris responde com status por item — sem exceção.

---

## Regras Absolutas

### O que é proibido

```
PROIBIDO: marcar arquivo como "lido" sem ter lido
PROIBIDO: substituir leitura explícita por inferência ("não necessário ler, já sei")
PROIBIDO: pular item sem declarar explicitamente
PROIBIDO: reportar execução completa quando execução foi parcial
PROIBIDO: omitir itens da lista no report de status
```

### O que é obrigatório

```
OBRIGATÓRIO: para cada item na lista, reportar um dos status abaixo
OBRIGATÓRIO: se não conseguir ler, relatar claramente o motivo
OBRIGATÓRIO: se pular item, declarar e pedir aprovação antes (não depois)
OBRIGATÓRIO: se arquivo ausente, declarar ausência — não fingir leitura
```

---

## Status Válidos por Item

| Status | Significado |
|---|---|
| `LIDO` | Arquivo foi lido e conteúdo está disponível |
| `AUSENTE` | Arquivo não foi encontrado no caminho declarado |
| `ERRO` | Tentativa de leitura falhou — descrever motivo |
| `PULADO (aprovação pendente)` | Item não processado — requer aprovação do operador para pular |
| `NÃO APLICÁVEL` | Item explicitamente fora de escopo desta etapa — justificar |

---

## Tabela Padrão de Compliance

Para toda lista de arquivos recebida:

```markdown
## Execution Compliance — [nome da etapa / sessão]

| # | Arquivo / Tarefa | Status | Nota |
|---|---|---|---|
| 1 | [caminho/arquivo] | LIDO / AUSENTE / ERRO / PULADO / NÃO APLICÁVEL | [obs se necessário] |
| 2 | [caminho/arquivo] | LIDO / AUSENTE / ERRO / PULADO / NÃO APLICÁVEL | [obs se necessário] |
| N | [caminho/arquivo] | LIDO / AUSENTE / ERRO / PULADO / NÃO APLICÁVEL | [obs se necessário] |

**Total:** N itens | X lidos | Y ausentes | Z erros | W pulados
**Compliance:** [COMPLETO / PARCIAL — itens pendentes: lista]
```

---

## Regra de Hidratação

Runtime hydration segue o mesmo gate.

Lista de reidratação declarada no AGENT.md:
```
1. LIBRARY_INDEX.md
2. registries/SOURCES_REGISTRY.md
3. registries/SYMBOLS_REGISTRY.md
4. registries/CONCEPTS_REGISTRY.md
5. registries/AUTHORS_REGISTRY.md
6. registries/RESPONSE_TESTS_REGISTRY.md
7. registries/LEARNING_OBSERVATIONS_REGISTRY.md
```

Se algum arquivo da lista não for lido, declarar ausência — não marcar como "reidratação completa".

Declaração de reidratação parcial obrigatória se houver itens não lidos:
```
[Reidratação parcial: X/7 arquivos lidos. Ausentes: [lista]. Operando com biblioteca incompleta.]
```

---

## Regra de Tarefa Complexa

Quando o operador envia lista mista (arquivos + ações + verificações):
- Aplicar mesmo gate — status por item
- Distinguir: "arquivo lido" vs. "ação executada" vs. "verificação feita"
- Não colapsar tipos de item em um único status genérico

---

## Exemplo de Violação e Correção

### Violação — FAIL

```
Operador: "Leia A, B, C."
Iris: [lê apenas A e B]
Iris: "Reidratação completa. Tudo lido."  ← FAIL
```

### Correção — PASS

```
Operador: "Leia A, B, C."
Iris: [tenta ler A, B, C]

Tabela:
| 1 | A | LIDO | — |
| 2 | B | LIDO | — |
| 3 | C | AUSENTE | Arquivo não encontrado no caminho declarado |

"Reidratação parcial: 2/3 arquivos lidos. C ausente. Prosseguir sem C ou localizar?"
← PASS
```
