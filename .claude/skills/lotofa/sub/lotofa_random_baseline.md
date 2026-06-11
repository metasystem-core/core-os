# Sub-skill: lotofa_random_baseline

## Função específica
Comparar modelos contra jogos aleatórios.

## Quando consultar
Quando houver suspeita de que o modelo não supera ruído ou quando for necessário validar ganho real.

## Processo

1. Gerar muitos ensembles aleatórios com mesmo número de jogos do modelo.
2. Testar na mesma janela histórica.
3. Comparar distribuição de acertos.
4. Calcular percentil do modelo contra aleatório.
5. Marcar ganho como robusto, fraco ou indistinguível de ruído.

## Saída

- distribuição aleatória esperada;
- percentil do modelo;
- comparação por métrica;
- alerta de falsa superioridade.

## Regra crítica

Sem baseline aleatório, a impressão de melhora pode ser ilusão estatística.
