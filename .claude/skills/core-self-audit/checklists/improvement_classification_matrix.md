# Matriz de classificação de melhorias

## MELHORIA_NECESSARIA

Use quando a falha compromete funcionamento, segurança, coerência ou rastreabilidade.

Exemplos:
- manifest desatualizado que impede uso;
- credencial exposta;
- skill principal sem gatilho;
- runtime sem teste;
- dado privado em repo público.

## MELHORIA_RECOMENDADA

Use quando melhora robustez, clareza, manutenção ou custo, mas não bloqueia funcionamento.

Exemplos:
- adicionar local-watchdog;
- melhorar README;
- adicionar sample_data;
- melhorar schema;
- separar docs de runtime.

## MELHORIA_OPCIONAL

Use quando é interessante, mas pode esperar.

Exemplos:
- interface web;
- dashboard;
- automação avançada;
- provider adicional.

## RISCO_DETECTADO

Use quando há perigo de falha futura.

Exemplos:
- dependência excessiva de Claude;
- falta de cache;
- mistura público/privado;
- uso de IA para tarefa mecânica.

## DUPLICACAO

Use quando duas partes fazem a mesma coisa ou quase a mesma coisa.

Atenção:
duplicação aparente pode esconder diferença funcional. Verificar antes de remover.

## LACUNA

Use quando algo necessário não existe.

Exemplos:
- falta de versioning;
- falta de QA;
- falta de schema;
- falta de memória por hash.

## ARQUIVAR

Use quando algo está obsoleto, redundante ou histórico.

Não deletar sem backup.

## NAO_MEXER

Use quando parte está estável, útil e mexer agora aumenta risco.
