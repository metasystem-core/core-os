# OS — NORM-DIFF e NORM-MERGE

## Objetivo

Quando uma norma nova, repetida ou atualizada for enviada, comparar com o que já existe, detectar alterações e propor merge controlado.

## Não fazer

- Não substituir automaticamente norma antiga.
- Não apagar blocos antigos.
- Não declarar a nova norma vigente sem confirmação.
- Não fundir blocos críticos sem revisão.

## Fluxo

1. Identificar norma por `norm_code`, título, edição, data, addenda, hash, sumário e mapa de seções.
2. Classificar como nova norma, duplicata, nova edição, addendum, substituição ou complementar.
3. Comparar blocos por tópico, tipo, item, referência, hash e resumo operacional.
4. Classificar blocos: novo, inalterado, alterado, removido, dividido, fundido, desconhecido.
5. Gerar relatórios em `diff_reports/`.
6. Criar `merge_decisions.yaml`.
7. Atualizar `version_registry/`.
