# Ordem de Serviço — Patch v1.2 nos Blocos Existentes

## Objetivo

Atualizar os pacotes normativos já ingeridos em v1.1 para v1.2, preservando todos os blocos e adicionando:

- `traceability_reference`
- `citation_export`
- `versioning`
- `conflict_scan`
- `use_level`
- `human_review_required`
- `review_reason`

## Escopo inicial

Aplicar nos pacotes já existentes:

- API 510
- API 520
- API 570
- API RP 571
- API 574
- API 598
- API 650
- API 653
- ASME BPVC Section V
- NRs
- pacote para_gpt
- qualquer outro pacote v1.1 já no repositório

## Regra principal

Não reprocessar PDFs brutos de início. Primeiro fazer backfill com os metadados já disponíveis nos blocos, índices e logs.

## Procedimento

1. Localizar todos os arquivos `*_blocks.jsonl`.
2. Criar backup antes de alterar: `backups/v1_1/<nome_do_arquivo>.jsonl`.
3. Para cada bloco: preservar `id` e adicionar os campos v1.2.
4. Quando faltar página, item ou edição: preencher `null`, marcar lacuna e registrar em `lacunas/traceability_gaps.md`.
5. Não transformar referência aproximada em item exato.
6. Gerar relatório final com blocos atualizados, lacunas e revisão humana.

## Saídas esperadas

```text
updated_blocks/
traceability_registry/
lacunas/traceability_gaps.md
reports/v1_2_backfill_report.md
qa/traceability_qa_report.md
```
