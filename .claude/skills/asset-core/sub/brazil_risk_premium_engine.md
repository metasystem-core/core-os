# Brazil Risk Premium Engine — Motor de Prêmio de Risco Brasil

## Função

Calibrar o retorno exigido para ativos brasileiros.

## Regra

Ativo brasileiro precisa superar não apenas uma taxa livre de risco teórica, mas o custo de oportunidade local ajustado pelo risco.

## Componentes

### Taxa base

- CDI/Selic para curto prazo;
- NTN-B para taxa real longa;
- Tesouro IPCA como referência de retorno real.

### Prêmio macro Brasil

- risco fiscal;
- inflação;
- câmbio;
- instabilidade institucional;
- risco político;
- juros longos;
- volatilidade de fluxo estrangeiro.

### Prêmio setorial

- bancos;
- utilities;
- commodities;
- construção;
- varejo;
- logística;
- papel e celulose;
- energia;
- saneamento;
- FIIs;
- crédito privado.

### Prêmio do ativo

- governança;
- liquidez;
- dívida;
- concentração;
- previsibilidade;
- risco de execução;
- risco de gestão;
- transparência.

## Fórmula operacional

Retorno exigido aproximado:

```text
Retorno exigido = benchmark local + prêmio Brasil + prêmio setorial + prêmio do ativo + prêmio de liquidez
```

## Uso

Se o retorno esperado não supera o retorno exigido ajustado:

- não é oportunidade;
- pode ser apenas ativo bom a preço ruim;
- ou ativo arriscado insuficientemente remunerado.

## Saída

- benchmark usado;
- prêmios aplicados;
- retorno mínimo aceitável;
- se o ativo supera ou não a régua.
