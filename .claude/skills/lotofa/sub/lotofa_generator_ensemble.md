# Sub-skill: lotofa_generator_ensemble

## Função específica
Gerar conjuntos de jogos com diversidade controlada.

## Quando consultar
Quando o usuário pedir 10, 20, 30 ou mais jogos/sets.

## Pipeline

1. Receber histórico validado.
2. Construir E-Histórico.
3. Gerar E_candidatos.
4. Converter cada E_c em J = U \ E_c.
5. Aplicar filtros estruturais.
6. Calcular SP.
7. Selecionar top candidatos com diversidade mínima.
8. Exportar tabela/CSV.

## Controles de diversidade

- distância mínima entre jogos;
- cobertura dos 25 números;
- cobertura de pares;
- variação de paridade;
- variação de faixas;
- controle de sequências;
- baixa redundância entre E_candidatos.

## Saída

CSV sugerido:

```csv
version,set_id,n01,n02,n03,n04,n05,n06,n07,n08,n09,n10,n11,n12,n13,n14,n15,SP,notes
```

## Onde pode falhar

- gerar jogos muito parecidos;
- perseguir score máximo e perder cobertura;
- excesso de aleatoriedade;
- filtros rígidos demais.
