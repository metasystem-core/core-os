# Sub-skill: lotofa_score_plausibilidade

## Função específica
Calcular e explicar o Score de Plausibilidade — SP — para candidatos.

## Quando consultar
Na etapa de ranqueamento de E_candidatos ou jogos J.

## Componentes sugeridos

```text
SP = w_E*SP_E + w_H*SP_H + w_S*SP_Estrutural + w_C*SP_Cover - penalizações
```

## Componentes

- SP_E: aderência ao E-Histórico.
- SP_H: aderência ao H-Histórico.
- SP_Estrutural: paridade, faixas, sequências, dispersão, pares.
- SP_Cover: capacidade do ensemble de cobrir zonas com potencial 12/13.

## Penalizações

- redundância entre jogos;
- cópia excessiva de concursos históricos;
- sobreajuste à janela curta;
- concentração excessiva em poucos números/pares.

## Saída

- score total;
- decomposição por componente;
- justificativa curta;
- alertas de risco.

## Regra crítica

SP é ranking de plausibilidade, não probabilidade real de acerto e não promessa.
