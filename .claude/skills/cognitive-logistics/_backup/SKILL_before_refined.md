---
name: cognitive-logistics
description: Camada transversal de logística cognitiva. Normaliza inputs, detecta estado do usuário, gerencia crédito e fricção, comprime outputs, lê documentos em camadas. Não é core especializado — é infraestrutura de circulação.
status: active
layer: transversal
priority: high
core_type: infrastructure
domain: cognitive-infrastructure
risk_level: low
---

# COGNITIVE LOGISTICS LAYER

## Função

Organizar a circulação da informação entre usuário, cores, arquivos, memória e outputs.

## Fórmula operacional

caos de entrada → normalização → catálogo → roteamento → análise proporcional → próxima ação

## Sub-skills

### firmware-light/
- human_input_normalizer — aceita input bagunçado e produz primeira ordem
- user_state_scanner — detecta estado antes de rotear
- credit_budget_core — evita desperdício de crédito e tokens
- friction_budget_core — reduz esforço exigido do usuário
- output_compression_protocol — chat curto, arquivo completo

### document-logistics/
- large_document_layered_reader — mapa antes de leitura profunda

### simb-calibration/
- user_vs_operator_protocol — distinção fundamental de funções
- impulse_vs_need_filter — desejo ≠ necessidade
- simb_core_calibration_function — SIMB como sensor, não colonizador

## Frase constitucional

O CORE-OS não serve ao impulso do usuário.
Ele serve à formação do operador.
