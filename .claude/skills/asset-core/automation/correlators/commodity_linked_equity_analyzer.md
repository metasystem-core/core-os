---
name: commodity-linked-equity-analyzer
description: Analisa ações cujo valor é estruturalmente ligado a commodities — petróleo, minério, celulose, agro. Mapeia os fatores externos que movem o preço antes de analisar o ativo isoladamente.
status: active
---

# Commodity-Linked Equity Analyzer

## Função

Ações como PETR4, VALE3, SUZB3, SLCE3 não devem ser analisadas
isoladamente. Seus preços são funções de fatores externos.

Analisar o fator antes do ativo.

## Fatores por setor

### Petróleo (PETR4, RECV3, PRIO3)
- Brent/WTI preço spot e futuros
- Spread Brent-WTI
- Política de preços (paridade x subsídio)
- Risco estatal/governança
- USD/BRL (petróleo é dolarizado)
- OPEC+ decisões de produção
- Estoque EUA (EIA Weekly)

### Minério de ferro (VALE3, CMIN3)
- Minério 62% Fe (preço spot)
- Demanda China (PMI, produção de aço)
- USD/BRL
- Custo C1 por tonelada
- Frete marítimo (Baltic Dry Index)

### Celulose (SUZB3, KLBN)
- Preço celulose BHKP/BSKP
- USD/BRL (exportadora)
- Capacidade instalada vs demanda global

### Agro (SLCE3, AGRO3, SMTO3)
- Preço soja, milho, açúcar (CBOT/ICE)
- USD/BRL
- Clima e safra
- Custo de insumos

## Processo

1. Identificar o fator primário do ativo
2. Qual é o preço atual do fator?
3. Qual é o regime do fator? (alta/baixa/neutro)
4. O preço do ativo está descontado ou caro relativo ao fator?
5. Só depois analisar múltiplos e valuation do ativo
