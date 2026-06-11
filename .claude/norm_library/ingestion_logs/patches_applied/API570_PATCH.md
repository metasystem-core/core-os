# Patch - doc-inspecao recebe API 570

## Nova fonte normativa
- API 570 - 4th Edition, February 2016
- Domínio: inspecao-end
- Uso: referência de inspeção em serviço de sistemas de tubulação, PRDs, CMLs, intervalos, reparos, rerating, registros e tubulação enterrada.

## Regras
1. Sempre verificar status de versão antes de conclusão de campo.
2. Usar primeiro `api570_2016_index.json`.
3. Recuperar blocos por ID em `api570_2016_blocks.jsonl`.
4. Nunca abrir/reproduzir PDF bruto sem necessidade explícita.
5. Não reproduzir texto integral da norma.
6. Se a pergunta envolver trabalho em altura/acesso por cordas para executar inspeção, combinar com `irata-n3`, sem misturar critérios de integridade da tubulação com critérios de acesso por cordas.

## Chamadas típicas
- “qual item fala de CML?” -> norm-nav -> API570 blocos CML
- “linha vencida pode operar?” -> norm-nav -> bloco deferral/overdue + dados faltantes
- “reparo com clamp em linha enterrada” -> norm-nav -> buried repair + repair nonwelding
