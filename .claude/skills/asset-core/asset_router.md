# ASSET-CORE Router — Roteador de Sub-skills

## Função

Identificar qual modo e quais sub-skills devem ser acionadas conforme o input do usuário.

## Passo 1 — Classificar demanda

A demanda pode ser:

- aporte;
- venda;
- manutenção;
- rebalanceamento;
- análise de ativo;
- revisão de decisão passada;
- arrependimento;
- valuation;
- FII;
- BTC;
- caixa/CDI;
- float;
- comparação;
- dúvida operacional;
- planejamento financeiro.

## Passo 2 — Selecionar modo de resposta

Consultar `response_modes.md`.

- Decisão pequena ou valor baixo: modo leve.
- Decisão relevante: modo padrão.
- Venda grande, aporte grande, revisão de carteira, mudança de tese ou valuation: modo profundo.

## Passo 3 — Verificar dados mínimos

Consultar `minimum_data_requirements.md`.

Se dados mínimos não forem atendidos, chamar `operational_unknown.md`.

## Passo 4 — Acionar sub-skills por contexto

### BTC

- `btc_core_cre.md`
- `regime_detector.md`
- `e_historico_engine.md`
- `position_sizing.md`
- `behavioral_guardrails.md`, se houver emoção forte.

### FIIs

- `fii_valuation_core.md`
- `fii_scorecard.md`
- `pvp_discount_detector.md`
- `cash_and_cdi_core.md`
- `regime_detector.md`
- `position_sizing.md`

Se FII de papel:

- `cri_cra_quality_analyzer.md`.

Se o usuário perguntar “é oportunidade?”:

- `opportunity_detector.md`.

### Ações brasileiras

- `valuation_brasil_adapter.md`
- `valuation_orchestrator.md`
- `brazil_risk_premium_engine.md`
- `regime_detector.md`
- `e_historico_engine.md`
- `position_sizing.md`.

### Caixa, CDI, Mercado Pago

- `cash_and_cdi_core.md`
- `position_sizing.md`
- `adaptation_lens_library.md`, se depender da realidade operacional do usuário.

### Float

- `float_strategy_detector.md`
- `cash_and_cdi_core.md`
- `validation_tests.md`.

### Arrependimento financeiro

- `regret_review.md`
- `behavioral_guardrails.md`
- `decision_log.md`.

### Falta de dados

- `operational_unknown.md`
- `minimum_data_requirements.md`
- `validation_tests.md`.

### Modelo estrangeiro, teoria importada ou diferença entre teoria e realidade

- `adaptation_lens_library.md`
- `valuation_brasil_adapter.md`
- `cross_core_firewall.md`.

### Transferência entre LOTOFA, ASSET, SIMB ou outro core

- `cross_core_firewall.md`.

## Passo 5 — Encerrar com decisão operacional

Usar `TEMPLATES/asset_core_output_template.md`.

A resposta deve terminar com:

- classificação ASSET-CORE;
- motivo;
- risco aceito;
- gatilho de revisão;
- próxima ação.
