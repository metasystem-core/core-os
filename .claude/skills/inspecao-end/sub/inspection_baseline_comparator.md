---
name: inspection-baseline-comparator
description: Antes de declarar que um padrão de dano é anômalo, comparar contra o baseline esperado para aquele equipamento. Transferido do LOTOFA-CORE para o INSPECAO-CORE.
status: active
origin: interpolação LOTOFA-CORE → INSPECAO-CORE
---

# Inspection Baseline Comparator

## Função

Antes de declarar anomalia, comparar contra o que seria
esperado estatisticamente para aquele equipamento naquele serviço.

## Perguntas

- Qual é a taxa de corrosão esperada para esse material nesse serviço?
- O desgaste encontrado é proporcional à idade e ao serviço?
- O histórico anterior do equipamento é compatível com o achado atual?
- Um equipamento similar nesse serviço teria comportamento diferente?
- O achado é anômalo ou dentro do esperado para as condições?

## Regra

Anomalia só é anomalia em relação a uma referência.
Sem baseline, todo achado é especulação.

## Fontes de baseline

- histórico do próprio equipamento
- equipamentos similares na planta
- dados normativos (taxas típicas por mecanismo)
- literatura técnica para o serviço

## Saída

```text
Achado:
Baseline de referência:
Comparação:
Anômalo? Sim / Não / Incerto
Ação recomendada:
```
