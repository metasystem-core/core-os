# Sub-skill: lotofa_backtest_temporal

## Função específica
Executar backtests com corte temporal correto.

## Quando consultar
Sempre que o usuário perguntar se um modelo funcionou, melhorou ou superou outro.

## Regra central

```text
Dados até T → gerar modelo → testar em concursos posteriores a T
```

## Pipeline

1. Receber dataset validado.
2. Definir ponto T.
3. Treinar/calibrar apenas com concursos ≤ T.
4. Gerar sets.
5. Testar contra concursos > T.
6. Calcular métricas.
7. Comparar com versões anteriores e baseline aleatório.

## Métricas

- média;
- mediana;
- mínimo;
- máximo;
- contagem de 11+;
- contagem de 12+;
- contagem de 13+;
- contagem de 14+;
- ocorrência de 5/6/7;
- distribuição completa de acertos.

## Saída

- matriz de acertos;
- resumo estatístico;
- diagnóstico de overfitting;
- recomendação de manter/descartar/refinar versão.

## Onde pode falhar

- se usar dados futuros por acidente;
- se testar na mesma janela usada para calibrar;
- se interpretar pico isolado como robustez.
