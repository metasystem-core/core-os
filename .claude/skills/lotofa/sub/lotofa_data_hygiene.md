# Sub-skill: lotofa_data_hygiene

## Função específica
Validar, limpar e padronizar dados de concursos da Lotofácil.

## Quando consultar
Sempre que houver importação, atualização ou suspeita de inconsistência no histórico de concursos.

## Entrada esperada
CSV com colunas:

```text
concurso,data,n01,n02,n03,n04,n05,n06,n07,n08,n09,n10,n11,n12,n13,n14,n15
```

## Processo

1. Validar existência das colunas obrigatórias.
2. Validar 15 números por concurso.
3. Validar intervalo 1–25.
4. Validar ausência de duplicidade em cada concurso.
5. Ordenar números de cada concurso.
6. Construir H_t.
7. Construir E_t = U \ H_t.
8. Registrar inconsistências.
9. Gerar hash do dataset.

## Saída

- dataset normalizado;
- relatório de inconsistências;
- metadados;
- hash.

## Onde pode falhar

- fonte de dados incompleta;
- concurso duplicado;
- erro manual de digitação;
- mistura de datasets com datas diferentes.
