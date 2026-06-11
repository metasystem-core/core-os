---
name: baseline-comparator
description: INSERT 4 — Nenhum modelo é válido sem comparação contra o baseline mais simples disponível. No ASSET-CORE, toda estratégia é comparada contra CDI antes de ser declarada válida.
status: active
origin: FW-INSERT-4 — transferido do LOTOFA-CORE
---

# Baseline Comparator

## Princípio

Nenhum modelo é válido sem comparação contra o agente mais simples.

## No ASSET-CORE

Antes de declarar que uma estratégia funciona:
1. Quanto retornou no período?
2. Quanto o CDI retornou no mesmo período?
3. Quanto o IBOV retornou?
4. A estratégia justifica o risco adicional?

Regra: se não bate o CDI ajustado por risco, a estratégia
não está sendo remunerada adequadamente.

## Transferido de

LOTOFA-CORE — antes de declarar que um modelo funciona,
comparar contra o que um agente sem inteligência faria.

## Onde pode falhar

Usar CDI como único benchmark independente do horizonte e objetivo.
Um ativo de longo prazo em acumulação tem benchmark diferente
de uma posição de curto prazo.
