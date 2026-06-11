# QA - Módulo NRs

- QA-NR-06: consulta por equipamento/atividade deve retornar NR-06, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-13: consulta por equipamento/atividade deve retornar NR-13, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-14: consulta por equipamento/atividade deve retornar NR-14, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-15-ANEXO-12: consulta por equipamento/atividade deve retornar NR-15-ANEXO-12, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-15-ANEXO-13: consulta por equipamento/atividade deve retornar NR-15-ANEXO-13, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-15-ANEXO-13A: consulta por equipamento/atividade deve retornar NR-15-ANEXO-13A, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-15: consulta por equipamento/atividade deve retornar NR-15, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-22: consulta por equipamento/atividade deve retornar NR-22, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-33: consulta por equipamento/atividade deve retornar NR-33, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-34: consulta por equipamento/atividade deve retornar NR-34, item/página, grau de certeza, dados faltantes e core de destino.
- QA-NR-35: consulta por equipamento/atividade deve retornar NR-35, item/página, grau de certeza, dados faltantes e core de destino.

## Testes essenciais

- Pergunta: "vou inspecionar vaso em altura" -> deve retornar NR-13 + NR-35 + NR-06, com Inspeção-END e IRATA-N3 separados.
- Pergunta: "entrada em tanque" -> deve retornar NR-33 como condicional/central e NR-13 se tanque/equipamento estiver enquadrado.
- Pergunta: "EPI sem CA" -> deve retornar NR-06 e dados faltantes.
- Pergunta: "caldeira sem relatório" -> deve retornar NR-13 e bloco/documentação aplicável.
