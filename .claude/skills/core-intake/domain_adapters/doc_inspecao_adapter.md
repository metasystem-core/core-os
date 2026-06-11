# Adapter — Doc-Inspeção

## Papel
Receber relatórios, databooks, certificados, prontuários, laudos e evidências de inspeção.

## Intake médio
Extrair:
- equipamento;
- TAG;
- tipo documental;
- norma referenciada;
- data;
- responsável;
- evidência;
- lacuna documental;
- criticidade;
- relação com Inspeção-END ou IRATA.

## Destino
inspection_library/ e doc-inspecao.

## Regra
Quando houver norma dentro do documento, acionar também norm-intake se necessário.
