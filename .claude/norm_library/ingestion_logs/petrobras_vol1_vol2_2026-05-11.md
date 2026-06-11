# Log de Ingestão — Normas Petrobras Vol1+Vol2

**Data:** 2026-05-11  
**Operador:** primário  
**Fonte:** `cesto/normas br/` (duas pastas de volume)

## Resumo

| Campo | Valor |
|---|---|
| Total de PDFs | 268 |
| Falhas de extração | 0 |
| Sem título | 0 |
| Sem SC identificado | 0 |
| Sem data | 4 |
| Ambíguos (SC-21) | 1 |

## Distribuição por domínio

| Domínio | Qtd |
|---|---|
| `inspecao-end` | 126 |
| `shared` | 131 |
| `shared+irata-n3` | 10 |
| `ambigua` | 1 |
| **Total** | **268** |

## Classificação aplicada

- `source_type: privada_autorizada`
- `permission_status: nao_redistribuir`
- `validity_status: vigente_nao_confirmada`
- `language: pt-BR`

## Arquivos gerados

- `.claude/norm_library/indices/petrobras_catalog.md` — catálogo mestre
- `.claude/norm_library/indices/petrobras_catalog_inspecao-end.md`
- `.claude/norm_library/indices/petrobras_catalog_shared.md`
- `.claude/norm_library/indices/petrobras_catalog_shared_irata-n3.md`
- `.claude/norm_library/indices/petrobras_catalog_ambigua.md`
- `.claude/norm_library/indices/petrobras_norm_source_registry.yaml`
- `.claude/norm_library/lacunas/petrobras_lacunas.md`
- `.claude/norm_library/raw/private_authorized/petrobras/vol1/` (134 PDFs)
- `.claude/norm_library/raw/private_authorized/petrobras/vol2/` (134 PDFs)

## Lacunas identificadas

- **N-2415** (SC-21 "Ligas") — SC-21 não mapeado para domínio; classificado como ambíguo.
- **N-1500, N-1618, N-1728, N-2396** — sem data na primeira página (folhas de dados / títulos maiúsculos).

## Método de extração

`pdftotext -l 1` + parser Python estrutural baseado no layout CONTEC padrão.  
SC detectado com regex multi-variante (hífen, en-dash, soft-hyphen 0xAD).
