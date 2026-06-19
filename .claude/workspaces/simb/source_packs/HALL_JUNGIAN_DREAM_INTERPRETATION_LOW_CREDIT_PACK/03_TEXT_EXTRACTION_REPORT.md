# TEXT EXTRACTION REPORT — Hall / Jungian Dream Interpretation

> **STATUS: PASS_WITH_NOTES**
> Quality audit executado pelo operador em 2026-06-17. PDF confirmado em `cesto/`.
> Operador declarou: "texto extraível; OCR legível; scan com ruídos aceitáveis."

---

## Resultados do Quality Audit

| Campo | Resultado |
|---|---|
| SHA256 | `c121837fad57a24c461390fb02cd6db7d681ae0491c3929e9d87a483d7630580` |
| Tamanho | 8.230.064 bytes (8,23 MB) |
| Número de páginas | **136** |
| Camada textual (texto selecionável) | **SIM** — texto extraível em todas as páginas de conteúdo |
| Qualidade geral da extração | **PASS_WITH_NOTES** |
| Páginas de conteúdo (>=50 palavras) | **127 de 136** |
| Média de palavras por página de conteúdo | **363 palavras** |
| Páginas de baixo texto (<20 palavras) | **7 páginas** |
| Estimativa total de palavras | ~46.200 |
| Offset PDF→livro | **+4 páginas** |

---

## Amostras de Qualidade

| Página PDF | Conteúdo | Palavras | Qualidade |
|---|---|---|---|
| p.1–6 | Capa, selos de biblioteca, folha de rosto | <20 | Degradada — frontmatter não-textual |
| p.9 | TOC "CONTENTS" — legível | ~175 | Boa |
| p.11 | Preface — texto fluido | 351 | **Boa** |
| p.13 | Ch.1 "Basic Concepts" — início | 308 | **Boa** |
| p.20 | Body text — "Relational Structures: Anima/Animus" | 376 | **Excelente** |
| p.50 | Body text — Differential Diagnosis | 380 | **Excelente** |
| p.80 | Body text — Ego-Images | 447 | **Excelente** |
| p.111 | Body text — Dream-Ego / Waking-Ego | 409 | **Excelente** |
| p.133 | Branca | 0 | Branca |

---

## Páginas de Baixo Texto (<20 palavras)

`1, 2, 3, 4, 5, 6, 133`

- p.1–6: capa, selos de biblioteca de teologia (School of Theology at Claremont), folha de rosto, dedicatória
- p.133: página em branco

**Não afetam a leitura de conteúdo** — são apenas frontmatter e blank.

---

## Estrutura Identificada pelo TOC (p.9-10)

```
Preface              → livro p.7  → PDF p.11
Chapter 1            → livro p.9  → PDF p.13
Chapter 2            → livro p.22 → PDF p.26
Chapter 3            → livro p.34 → PDF p.38
Chapter 4            → livro p.38 → PDF p.42
Chapter 5            → livro p.54 → PDF p.58
Chapter 6            → livro p.68 → PDF p.72
Chapter 7            → livro p.80 → PDF p.84
Chapter 8            → livro p.89 → PDF p.93
Chapter 9            → livro p.96 → PDF p.100
Chapter 10           → livro p.101 → PDF p.105
Chapter 11           → livro p.112 → PDF p.116
Notes                → livro p.118 → PDF p.122
Glossary             → livro p.120 → PDF p.124
Index                → livro p.122 → PDF p.126
```

**Offset PDF→livro: +4 páginas** (6 páginas de frontmatter não numeradas + conversão para numeração arábica do livro)

---

## Checklist de Quality Audit

```
[x] PDF abre sem erro
[x] Texto é selecionável (não é scan puro)
[x] Extração de amostra — verificada pelo operador
[x] OCR: ruídos aceitáveis em headers/footers (running heads com números de página)
[x] Páginas de capítulo-divisor: texto mínimo (número do capítulo em fonte grande — normal)
[x] Notas e glossário: texto extraível
[x] Adequação geral: PASS_WITH_NOTES
```

---

## Veredito

**PASS_WITH_NOTES — adequado para geração de chunks privados e leitura SOURCE-FIRST.**

Notas operacionais para a Iris:
1. Running headers extraem como ruído (ex: "10 Basic Concepts of Jungian Psychology") — o `clean_text()` do script limpa números soltos
2. Páginas de capítulo-divisor têm texto mínimo (apenas o número do capítulo em fonte grande) — blocos correspondentes serão curtos
3. O texto de conteúdo principal é excelente (363 palavras/página em média)
4. Exemplos clínicos aparecem brevemente; não reidentificar casos de pacientes
