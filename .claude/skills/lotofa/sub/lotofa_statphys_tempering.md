# Sub-skill: lotofa_statphys_tempering

## Função específica
Gerar ensembles usando intuições de física estatística: energia, entropia, temperatura e tempering.

## Quando consultar
Quando o modelo estiver rígido demais, repetitivo demais ou preso em ótimos locais.

## Conceitos operacionais

- energia: custo/penalização de uma configuração;
- temperatura: grau de aceitação de candidatos não ótimos;
- entropia: diversidade do ensemble;
- tempering: ajuste gradual entre exploração e aderência.

## Processo

1. Definir função de energia baseada em SP e penalizações.
2. Gerar candidato.
3. Aceitar sempre se melhora.
4. Aceitar às vezes se piora pouco, conforme temperatura.
5. Reduzir temperatura gradualmente.
6. Auditar diversidade e desempenho.

## Regra crítica

Física estatística aqui é metáfora operacional, não prova sobre a natureza do sorteio.
