# Lacunas de Rastreabilidade — backfill v1.2
Gerado em: 2026-05-11 08:55

Total blocos processados: 2916
Blocos com precision=lacuna: 0
Blocos com human_review_required: 2916

## Arquivos com lacunas

Nenhum arquivo com lacuna total.

## Causa raiz mais comum

- `pagina_pdf_aprox` presente mas `item`/`section` ausente → precision=pagina_aproximada
- `item` ausente nos blocos do pack API570 especializado → precision=lacuna nos primeiros blocos META/NOTE
- NRs com `item` preenchido têm precision=secao_exata

## Próximos passos recomendados

1. Revisar manualmente blocos com `precision=lacuna` nas normas críticas: NR-13, API 510, API 570.
2. Confirmar edição vigente no DOU/portal antes de uso em relatório.
3. Adicionar `page_printed` nos blocos de inspeção em campo (API 510/570/571).
