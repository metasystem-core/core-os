# Prompt para Claude Code — Aplicar Patch Normativo v1.2

Você é a oficina/programador do CORE-OS. A tarefa é atualizar o módulo normativo já existente para o padrão v1.2, sem inflar o sistema e sem reprocessar PDFs brutos desnecessariamente.

## Objetivo

Aplicar nos intakes normativos já gerados:

1. Rastreabilidade forte (`traceability_reference`)
2. Exportação de citação (`citation_export`)
3. Versionamento de norma e bloco (`versioning`)
4. Varredura de conflito (`conflict_scan`)
5. Política de uso (`use_level`)
6. Fila de revisão humana (`human_review_required`, `review_reason`)
7. Relatórios de lacunas, diff, merge e conflitos

## Regras duras

- Não incluir PDFs brutos em pacotes de saída.
- Não reproduzir texto integral de normas privadas.
- Não sobrescrever norma antiga ao receber norma nova.
- Não usar referência aproximada como citação forte.
- Não resolver conflito material automaticamente.
- Preservar separação entre `doc-inspecao`, `inspecao-end` e `irata-n3`.

## Sequência de execução

1. Ler `README.md`.
2. Ler schemas em `/schemas`.
3. Ler regras em `/rules`.
4. Executar `operations/backfill_existing_intakes_OS.md`.
5. Aplicar `operations/patch_existing_blocks_instruction.md`.
6. Preparar suporte a `operations/norm_diff_merge_OS.md`.
7. Preparar suporte a `operations/norm_conflict_scan_OS.md`.
8. Gerar relatórios QA com base em `/qa`.
