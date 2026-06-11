# norm-reader.md
# Sub-skill: Leitor de Norma

Consultada quando: extrair o que uma norma exige para um equipamento.

## Processo

1. Identificar norma e edição
2. Identificar escopo de aplicação
3. Extrair requisitos obrigatórios (shall / deve)
4. Separar de recomendações (should / recomenda-se)
5. Identificar requisitos críticos de segurança
6. Mapear projeto × operação × inspeção
7. Declarar quando a norma não cobre a situação

## Separação obrigatória

| Tipo | Linguagem | Tratamento |
|---|---|---|
| Obrigatório | "shall", "deve" | Não negociável |
| Recomendação | "should", "recomenda-se" | Boas práticas |
| Permissão | "may", "pode" | Opcional |
| Proibição | "shall not", "não deve" | Bloqueado |

## Saída esperada

Para o equipamento e situação: listar o que a norma exige separando
obrigatório de recomendação, com referência de cláusula quando possível.
