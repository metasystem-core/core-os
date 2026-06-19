# TEXT EXTRACTION REPORT — Edinger / Anatomy of the Psyche

> **STATUS: PASS_WITH_NOTES**
> Quality audit executado em 2026-06-17. PDF confirmado em `cesto/`.

---

## Resultados do Quality Audit

| Campo | Resultado |
|---|---|
| SHA256 | `ce182b8326ee7079b070a5c0c5dd536092163091a810260961b6473d1a6cb6c7` |
| Tamanho | 15.777.296 bytes (15,05 MB) |
| Número de páginas | **294** |
| Camada textual (texto selecionável) | **SIM** — texto extraível em páginas de conteúdo |
| Qualidade geral da extração | **PASS_WITH_NOTES** (ver detalhes abaixo) |
| Páginas de conteúdo (>=50 palavras) | **265 de 294** |
| Média de palavras por página de conteúdo | **332 palavras** |
| Páginas de baixo texto (<20 palavras) | **16 páginas** (imagens ou brancas) |
| Presença de imagens/figuras alquímicas | **SIM** — gravuras históricas numerosas; não extraídas pelo script |
| Digitalização | **Internet Archive** (aviso em p.10) |
| Adequação para leitura integral privada | **SIM** |

---

## Amostras de Qualidade (pdfplumber)

| Página PDF | Conteúdo | Palavras | Qualidade |
|---|---|---|---|
| p.1 | Capa/título (OCR) — "Anatomy \| Ot me \| Alchemical \| Svmbolismin" | 9 | Degradada — capa |
| p.5 | Imagem alquímica com OCR ("ROPE TTS", "SOLV TION") | ~20 | Degradada — imagem |
| p.10 | Aviso Internet Archive (archive.org/details/...) | ~25 | OK — texto técnico |
| p.11 | Índice (TOC) — capítulos e páginas legíveis | ~50 | Boa |
| p.50 | Texto de conteúdo limpo | 179 | **Boa** |
| p.100 | Texto de conteúdo | 150 | **Boa** |
| p.150 | Texto de conteúdo | 443 | **Excelente** |
| p.200 | Texto de conteúdo | 494 | **Excelente** |
| p.293 | Branca | 0 | Branca — fim do livro |

---

## Notas do Audit

### Qualidade da extração
- **Front matter (p.1-24):** degradada em páginas de imagens e capa — esperado para digitalização IA
- **Conteúdo principal (p.25-288):** extração boa a excelente; headers/footers extraem como ruído leve — removidos pelo `clean_text()` do script
- **Páginas de figuras:** baixo texto (apenas legenda/referência) — páginas de gravuras alquímicas históricas; não afetam a leitura do texto

### Estrutura identificada pelo TOC (p.11)
```
Preface           → p.xix do livro → PDF p.21
Chapter 1         → livro p.1   → PDF p.25
Chapter 2         → livro p.17  → PDF p.41
Chapter 3         → livro p.47  → PDF p.71
Chapter 4         → livro p.83  → PDF p.107
Chapter 5         → livro p.117 → PDF p.141
Chapter 6         → livro p.147 → PDF p.171
Chapter 7         → livro p.183 → PDF p.207
Chapter 8         → livro p.211 → PDF p.235
Bibliography      → livro p.233 → PDF p.257
```
**Offset PDF → livro: +24 páginas** (23 páginas de front matter + 1 página de aviso IA)

### Páginas de baixo texto (<20 palavras)
`1, 2, 3, 4, 6, 7, 10, 23, 24, 118, 207, 289, 290, 291, 292, 293`

- p.1-4, 6-7: capa, verso, folha de rosto, frontispício
- p.10: aviso Internet Archive
- p.23-24: meia-título e frontispício antes do Capítulo 1
- p.118: gravura alquímica (Sublimatio)
- p.207: gravura alquímica (Separatio)
- p.289-293: páginas finais em branco

---

## Checklist de Quality Audit

```
[x] PDF abre sem erro
[x] Texto é selecionável (não é scan puro)
[x] Extração de amostra (p.1, 50, 100, 150) — verificada
[x] Imagens: presença de gravuras alquímicas históricas confirmada
[x] Headers e rodapés extraem como ruído leve (limpos pelo clean_text())
[x] Notas de rodapé: numéricas, inline após parágrafo — comportamento normal
[x] Páginas em branco: 16 páginas, mapeadas
[x] Adequação geral: PASS_WITH_NOTES
```

---

## Veredito

**PASS_WITH_NOTES — adequado para geração de chunks privados e leitura SOURCE-FIRST.**

Notas operacionais para a Iris:
1. Páginas de figuras (imagens alquímicas) terão pouco ou nenhum texto no chunk — a figura existe mas não é extraída
2. Front matter (p.1-24) tem qualidade OCR degradada — irrelevante para leitura de conteúdo
3. O texto de conteúdo principal é limpo e adequado para interpretação simbólica
4. Referências de figuras no texto (e.g., "see figure 2-4") podem ficar sem a imagem correspondente — considerar nas interpretações
