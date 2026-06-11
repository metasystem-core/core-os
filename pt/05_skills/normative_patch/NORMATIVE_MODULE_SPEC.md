# Especificação — Módulo Normativo Leve

## Decisão

O módulo normativo será implementado como conjunto de subskills, não como novo core.

## Subskills

1. `norm-ingest`: ingestão e segmentação.
2. `norm-nav`: consulta por índices/blocos.
3. `equip-norm-mapper`: equipamento/atividade → normas possíveis.
4. `norm-translate`: tradução técnica sob demanda.

## Separação de domínios

### IRATA-N3

Acesso por cordas, trabalho em altura, resgate, ancoragem, supervisão, equipe, equipamentos de rope access, comunicação e isolamento.

### Inspeção-END

Equipamento industrial, END/NDT, integridade, danos, mecanismos de falha, critérios de aceitação, NR-13, API, ASME, ABNT e relatórios técnicos.

### Doc-Inspeção

Norma, documento, prontuário, certificado, databook, evidência, lacuna, versão, rastreabilidade e auditoria documental.

## Regra de acionamento

- Documento novo no cesto → `norm-ingest`.
- Pergunta sobre item/requisito → `norm-nav`.
- Equipamento sem norma informada → `equip-norm-mapper`.
- Norma em outro idioma com pedido explícito → `norm-translate`.

## Regra de token

Não abrir PDF bruto por padrão.
Consultar metadados, índices e blocos antes.
