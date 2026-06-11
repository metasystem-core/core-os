# gap-analyzer.md
# Sub-skill: Analisador de Lacunas

Consultada quando: confrontar documento com norma.

## Processo

1. Listar requisitos normativos (via norm-reader)
2. Para cada requisito: cobre / cobre parcialmente / não cobre
3. Classificar lacunas por severidade
4. Identificar dados conflitantes no próprio documento
5. Identificar dados que contradizem a norma

## Classificação

Crítico: ausência de dado obrigatório de segurança, dado fora do
limite normativo, certificado ausente, reparo sem documentação.

Atenção: dado incompleto, versão da norma não especificada,
parâmetro próximo ao limite de projeto.

Observação: recomendação não seguida (não obrigatório),
formatação inadequada.

## Saída esperada

Tabela: requisito normativo / situação no documento / classificação /
ação recomendada.
