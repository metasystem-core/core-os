# Validation Tests — Testes de Validade do ASSET-CORE

## Função

Evitar que o sistema pareça sofisticado, mas opere sem base.

## Teste 1 — Teste de dados mínimos

Antes de recomendar:

- tenho preço atual?
- tenho valor disponível?
- tenho posição atual?
- tenho alternativa real?
- tenho regime?
- tenho risco principal?
- tenho horizonte?
- tenho impacto no portfólio?

Se não:

> Não há base suficiente para decisão ótima neste momento.

## Teste 2 — Teste Brasil

O valuation usou:

- CDI/Selic?
- NTN-B?
- inflação?
- risco Brasil?
- liquidez?
- governança?
- regulação?
- tributação?
- risco setorial?

Se não, valuation inválido.

## Teste 3 — Teste de narrativa

A decisão depende de frases como:

- “está barato”;
- “uma hora volta”;
- “paga bem”;
- “empresa boa”;
- “BTC sempre sobe no longo prazo”;
- “P/VP abaixo de 1”;
- “DY alto”.

Se sim, exigir dados e E-Histórico.

## Teste 4 — Teste de sobrevivência

Se der errado:

- o usuário quebra?
- perde caixa essencial?
- entra em dívida?
- perde sono?
- vende no fundo?
- compromete obrigação real?

Se sim, reduzir ou bloquear.

## Teste 5 — Teste de reversibilidade

- é possível desfazer?
- há liquidez?
- custo de saída é aceitável?
- perda é permanente?

## Teste 6 — Teste de CDI

A decisão compensa CDI/NTN-B em risco ajustado?

Se não, justificar por:

- convexidade;
- proteção;
- diversificação;
- disciplina;
- EBI;
- tese de longo prazo.

## Teste 7 — Teste emocional

O usuário está em:

- FOMO;
- arrependimento;
- euforia;
- frustração;
- tédio;
- sobrecarga?

Se sim, bloquear decisão relevante ou reduzir tamanho.

## Teste 8 — Teste de overfitting

A análise usa padrões históricos como se fossem leis?

Se sim, corrigir.

## Teste 9 — Teste de escala

A recomendação é proporcional ao tamanho do capital?

- microaporte: resposta enxuta.
- aporte médio: análise completa.
- aporte grande: análise profunda + log.

## Teste 10 — Teste de falha obrigatória

Toda resposta relevante deve conter:

```markdown
## Onde este modelo pode falhar
```
