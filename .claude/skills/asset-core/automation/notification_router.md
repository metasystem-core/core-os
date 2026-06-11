# SKILL — Asset Notification Router

Encaminha cada sinal para a sub-skill correta.

Roteamento:
- FII tijolo -> FII Analyzer.
- FII papel/CRI/CRA -> CRI/CRA Quality Tool.
- FII relatório mensal -> FII Monthly Document Monitor.
- Ação brasileira -> Equity Analyzer / Valuation Brazil.
- PETR4/VALE3/commodities -> Commodity Linked Equity Analyzer.
- BTC -> BTC-CORE.
- Provento -> Portfolio Income Tracker.
- Fato relevante -> Official Source Validator + ASSET Review.
- Preço -> Regime + Valuation + Portfolio Context.
- Ruído/marketing -> registrar ou ignorar.

Regra: roteador não conclui; entrega ao módulo adequado.
