# Política — SKILL.md deve refletir o estado real

## Problema

SKILL.md não pode declarar capacidade inexistente.

## Regra

Toda norma declarada como disponível no SKILL.md deve ter evidência material no filesystem.

## Estados permitidos no SKILL.md

- disponível
- raw_disponivel_ingestao_pendente
- blocos_disponiveis_raw_nao_localizado_rastreabilidade_incompleta
- planejada
- ausente
- histórica
- substituída
- aguardando_diff_merge
- aguardando_revisao_humana

## Evidência mínima para "disponível"

- blocks.jsonl;
- index.json;
- source_registry entry;
- ingestion_log;
- lacunas ou QA report;
- traceability_reference completo ou status de rastreabilidade.

## Se faltar

Se faltar raw:
- declarar rastreabilidade incompleta.

Se faltar ingestão:
- declarar ingestão pendente.

Se faltar tudo:
- declarar ausente apenas após busca global, inclusive ZIPs.
