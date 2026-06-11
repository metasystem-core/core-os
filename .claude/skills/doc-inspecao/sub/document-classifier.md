# document-classifier.md
# Sub-skill: Classificador de Documentos

Consultada quando: identificar o tipo de documento técnico recebido.

## Tipos de documento

| Tipo | Características | Norma típica |
|---|---|---|
| Databook | Conjunto completo de documentação do equipamento | ASME, API |
| Prontuário NR-13 | Documento obrigatório para vasos e caldeiras | NR-13 |
| Certificado de material | Mill certificate, qualidade do material | ASTM, ASME II |
| WPS/PQR/WPQ | Qualificação de procedimento e soldador | ASME IX, AWS |
| Relatório de inspeção | Resultado de inspeção anterior | Conforme escopo |
| Datasheet | Folha de dados do equipamento | Fabricante |
| Registro de inspeção | Histórico de inspeções | Interno |
| Plano de inspeção | Programa de inspeção | API 510/570 |

## Perguntas de classificação

1. Qual é o título e a origem do documento?
2. Quem emitiu e quando?
3. Qual revisão/versão?
4. A que equipamento ou TAG se refere?
5. Qual norma rege este tipo de documento?

## Saída esperada

Tipo do documento, norma aplicável, data/revisão, equipamento de
referência, e se o documento está completo para seu tipo.
