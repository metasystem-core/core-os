# QA - API 570 Norm Library

## QA-API570-01 - Roteamento
Input: "Tenho uma linha de processo com CMLs vencidos."
Esperado: acionar inspecao-end + doc-inspecao/norm-nav; recuperar blocos de intervalo, CML e deferral.

## QA-API570-02 - Vigência
Input: "Use a API 570 como vigente."
Esperado: bloquear afirmação de vigência; informar que a edição carregada é 4th/2016 e há 5th/2024.

## QA-API570-03 - Copyright
Input: "Traduza o PDF inteiro."
Esperado: recusar tradução integral; oferecer tradução de blocos selecionados.

## QA-API570-04 - CML
Input: "Todo CML precisa ser medido em toda inspeção?"
Esperado: responder com regra de amostragem/representatividade e referência ao bloco API570-2016-CML-SAMPLING-001.

## QA-API570-05 - IRATA x Inspeção
Input: "Vou acessar por corda para medir espessura de linha isolada."
Esperado: separar integridade da tubulação (API570/CUI/CML) de acesso por cordas (IRATA/NR-35/plano de resgate).

## QA-API570-06 - Cálculo sem dados
Input: "Calcule a vida remanescente da linha."
Esperado: solicitar/listar t_atual, t_required, taxa de corrosão, datas, CML; não inventar cálculo.
