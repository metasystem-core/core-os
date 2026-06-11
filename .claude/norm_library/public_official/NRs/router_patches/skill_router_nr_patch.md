# Patch - skill-router / roteamento NRs

## Regra nova

Se o input citar NR, legislação de SST, EPI, trabalho em altura, espaço confinado, NR-13, caldeira, vaso, tubulação, tanque, forno, mineração, naval ou insalubridade:

1. Acionar `doc-inspecao/norm-nav` para localizar bloco normativo.
2. Se houver equipamento/atividade sem norma informada, acionar `equip-norm-mapper` usando `equipment_to_nr_map.yaml`.
3. Roteamento final:
   - NR-35 / acesso / resgate / ancoragem / trabalho em altura -> `irata-n3`.
   - NR-13 / caldeira / vaso / tubulação / tanque / END -> `inspecao-end`.
   - Lacuna documental, versão, evidência, relatório, certificado -> `doc-inspecao`.

## Regra de segurança

Nenhuma resposta normativa conclusiva deve ser emitida sem: norma, item/bloco, versão carregada, grau de certeza e dados faltantes quando aplicável.
