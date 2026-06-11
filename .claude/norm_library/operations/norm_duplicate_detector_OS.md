# OS — Detector de Norma Repetida ou Atualizada

## Comparar

```text
file_hash
norm_code
norm_title
edition
publication_date
addenda
copyright_page
table_of_contents
section_headings
page_count
```

## Classificação

```text
same_file_exact
same_norm_same_version_different_scan
same_norm_new_addendum
same_norm_new_edition
same_theme_different_norm
unknown_requires_review
```

## Ação

- `same_file_exact`: não reprocessar; registrar duplicata.
- `same_norm_same_version_different_scan`: comparar qualidade OCR; manter melhor fonte.
- `same_norm_new_addendum`: rodar diff parcial.
- `same_norm_new_edition`: criar versão nova e rodar NORM-DIFF.
- `same_theme_different_norm`: rodar NORM-CONFLICT-SCAN.
- `unknown_requires_review`: colocar em fila de revisão.
