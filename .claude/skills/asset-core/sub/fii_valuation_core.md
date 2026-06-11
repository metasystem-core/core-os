# FII Valuation Core

## Função

Avaliar FIIs com método próprio, sem tratá-los como ações comuns.

## Classificação obrigatória

Todo FII deve ser classificado como:

- high grade;
- high yield;
- oportunidade;
- híbrido;
- inconclusivo;
- evitar.

## High Grade

Características:

- ativos ou créditos de maior qualidade;
- gestão confiável;
- renda previsível;
- menor risco de corte abrupto;
- liquidez melhor;
- menor yield, mas maior segurança relativa.

## High Yield

Características:

- DY elevado;
- risco maior;
- pode ter crédito mais frágil;
- pode ter alavancagem;
- pode ter vacância;
- pode ter concentração;
- exige prêmio claro.

Regra:

> High yield não é renda fixa turbinada. É risco sendo remunerado ou escondido.

## Oportunidade

Exige:

- desconto real;
- risco compreendido;
- renda ou ativo sobrevivível;
- retorno esperado acima de CDI/NTN-B ajustado;
- margem de segurança;
- tamanho adequado.

## FIIs de tijolo

Avaliar:

- localização;
- qualidade dos imóveis;
- vacância;
- contratos;
- indexadores;
- concentração de inquilinos;
- alavancagem;
- liquidez;
- gestão;
- P/VP;
- dividend yield;
- cap rate implícito.

## FIIs de papel

Acionar `cri_cra_quality_analyzer.md`.

Avaliar:

- devedores;
- garantias;
- LTV;
- indexadores;
- spread;
- duration;
- inadimplência;
- rating;
- subordinação;
- concentração.

## Comparação obrigatória

Todo FII deve ser comparado com:

- CDI;
- NTN-B;
- FII high grade alternativo;
- caixa;
- risco específico do fundo.

## Saída

```text
Classificação:
Risco dominante:
Renda é sustentável?
Preço compensa?
Tamanho permitido:
Gatilho de revisão:
```
