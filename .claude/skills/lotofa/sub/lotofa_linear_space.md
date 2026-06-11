# Sub-skill: lotofa_linear_space

## Função específica
Representar jogos e concursos como vetores binários no espaço 25-dimensional.

## Quando consultar
Para medir diversidade, distância, agrupamento e redundância.

## Representação

```text
v ∈ {0,1}^25
v_i = 1 se número i está presente
v_i = 0 se número i está ausente
```

## Métricas úteis

- distância de Hamming;
- similaridade por interseção;
- distância entre E_candidatos;
- clusters de jogos;
- cobertura espacial;
- detecção de jogos quase duplicados.

## Uso recomendado

- auditoria de diversidade;
- seleção de ensemble;
- análise de redundância;
- visualização opcional.

## Cuidado

Representação vetorial melhora auditoria, mas não cria previsibilidade determinística.
