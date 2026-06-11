# QA — Checklist de Rastreabilidade Normativa

## Por bloco

- [ ] Tem `norm_code`.
- [ ] Tem `norm_title`.
- [ ] Tem edição ou versão.
- [ ] Tem `source_file`.
- [ ] Tem `source_file_hash` ou justificativa.
- [ ] Tem `page_pdf` ou justificativa.
- [ ] Tem `page_printed` quando disponível.
- [ ] Tem item/seção/subseção OU tabela/figura/anexo.
- [ ] Tem `reference_precision`.
- [ ] Tem `citation_export`.
- [ ] Tem `operational_summary`.
- [ ] Tem `validity_status`.
- [ ] Tem `use_level`.

## Bloco pode ser usado em relatório?

Sim, somente se:

- [ ] `reference_precision` é item/tabela/figura/anexo exato.
- [ ] `citation_export` está preenchido.
- [ ] `validity_status` não é revogada/desconhecida sem aviso.
- [ ] Não há conflito confirmado em aberto.
- [ ] Se for critério crítico, houve revisão humana.
