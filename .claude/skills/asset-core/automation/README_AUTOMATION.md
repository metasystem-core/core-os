# ASSET-CORE Automation / Data Ingestion / Public Monitoring

Pacote para Claude Code.

Objetivo: alimentar o ASSET-CORE de forma automática com sinais externos, dados públicos, documentos oficiais e dados pessoais limpos, transferindo a parte mecânica de coleta/organização/triagem para o sistema sem terceirizar a decisão financeira.

Regra central:
A plataforma avisa. O sistema verifica. O ASSET-CORE analisa. O operador decide.

Camadas:
1. Dados pessoais limpos: positions.csv, transactions.csv, dividends.csv, cash_accounts.csv, watchlist.csv.
2. Sinais externos: e-mail, WhatsApp fase 2, plataforma premium, alertas de preço/provento/documento/fato relevante.
3. Dados públicos: CVM Dados Abertos, Fundos.NET, RI oficial, B3 quando aplicável.
4. Núcleo analítico: ASSET-CORE, FII Analyzer, CRI/CRA Quality Tool, Valuation Brazil, BTC-CORE, Commodity Linked Equity Analyzer.
