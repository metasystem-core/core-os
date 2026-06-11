---
name: correlated-asset-factor-mapper
description: Mapeia os fatores externos que correlacionam com cada ativo antes de qualquer análise. Nenhum ativo é analisado no vácuo.
status: active
---

# Correlated Asset Factor Mapper

## Função

Antes de analisar qualquer ativo, mapear seus fatores correlacionados.
Análise sem mapa de fatores é análise incompleta.

## Mapa de fatores por classe

### Ações brasileiras
- Selic/CDI (custo de capital)
- USD/BRL (importadoras x exportadoras)
- IPCA (margens reais)
- Risco político/fiscal (CDS Brasil)
- Setor específico (commodity, consumo, financeiro)

### FIIs
- Selic (concorrência com renda fixa)
- IPCA (contratos de aluguel indexados)
- Vacância do setor
- Absorção líquida
- P/VP vs NTN-B

### BTC
- Liquidez global (M2 global)
- Juros reais EUA
- DXY (dólar index)
- Risk-on/off regime
- Fluxo exchanges
- MVRV Z-Score

### Renda fixa brasileira
- Selic projetada
- IPCA projetado
- Inclinação da curva
- Risco fiscal (DívBR/PIB)

## Saída

```text
Ativo analisado:
Fator primário:
Regime do fator:
Correlação atual: favorável / neutra / desfavorável
Implicação para o ativo:
```
