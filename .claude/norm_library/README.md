# .claude/norm_library

Biblioteca normativa local do CORE-OS.

Esta pasta contém fontes normativas, textos extraídos, blocos codificados, índices, traduções cacheadas, mapas equipamento→normas, logs de ingestão e lacunas.

---

## Estrutura

```text
norm_library/
├── raw/
│   ├── public_official/abnt/        — 1 documento
│   ├── private_authorized/api/      — 30 normas/documentos API
│   ├── private_authorized/asme/     — 4 documentos ASME
│   ├── private_authorized/astm/     — 1 norma ASTM
│   ├── private_authorized/petrobras/
│   │   ├── vol1/                    — 134 normas N-series
│   │   ├── vol2/                    — 134 normas N-series
│   │   └── avulsos/                 — 4 normas fora do acervo vol
│   ├── manuals/soldagem/            — 5 materiais técnicos
│   └── client_procedures/           — vazio
├── extracted_text/                  — vazio (aguardando extração)
├── blocks/
│   ├── shared/                      — vazio (aguardando ingestão)
│   ├── irata-n3/                    — vazio (aguardando ingestão)
│   ├── inspecao-end/                — vazio (aguardando ingestão)
│   └── doc-inspecao/                — vazio (aguardando ingestão)
├── indices/
│   ├── norm_source_registry.yaml    — registro principal (não-Petrobras)
│   ├── petrobras_norm_source_registry.yaml — registro Petrobras (268 norms)
│   ├── petrobras_catalog.md         — catálogo mestre Petrobras
│   ├── petrobras_catalog_inspecao-end.md
│   ├── petrobras_catalog_shared.md
│   ├── petrobras_catalog_shared_irata-n3.md
│   ├── normas_cesto_catalog.md      — catálogo de todas as fontes (não-Petrobras-vol)
│   └── petrobras_avulsos_catalog.md
├── equipment_norm_maps/
│   └── base_equipment_to_norms.yaml — mapa equipamento → normas candidatas
├── schemas/
│   └── norm_block_schema.yaml       — esquema de blocos normativos
├── translations/ptbr/               — cache de traduções (vazio)
├── translations/glossaries/         — cache de glossários (vazio)
├── version_registry/                — vazio
├── ingestion_logs/
│   ├── petrobras_vol1_vol2_2026-05-11.md
│   └── normas_cesto_2026-05-11.md
└── lacunas/
    ├── README.md                    — modelo de registro de lacuna
    ├── petrobras_lacunas.md         — lacunas do acervo Petrobras
    └── lacunas_gerais.md            — lacunas gerais (NR-13, extração, etc.)
```

---

## Inventário de fontes

| Corpo | Qtd | Domínio | Registro |
|---|---|---|---|
| ABNT/NBR (processadas) | 56 | inspecao-end / irata-n3 / shared | registries/sources/ABNT/ |
| ABNT/NBR (secundárias) | 39 | — | raw/private_authorized/ABNT/_secondary_unprocessed/ |
| ABNT (antiga, v1.0) | 1 | inspecao-end | norm_source_registry.yaml |
| API | 30 | inspecao-end | norm_source_registry.yaml |
| ASME | 4 | inspecao-end | norm_source_registry.yaml |
| ASTM | 1 | inspecao-end | norm_source_registry.yaml |
| Petrobras (vol1+vol2) | 268 | inspecao-end / shared / irata-n3 | petrobras_norm_source_registry.yaml |
| Petrobras (avulsos) | 4 | inspecao-end | norm_source_registry.yaml |
| Manuais soldagem | 5 | inspecao-end / shared | norm_source_registry.yaml |
| NRs (12 normas) | 12 | doc-inspecao / inspecao-end / irata-n3 / shared | indices/NR/ |
| **Total fontes** | **420** | | |

---

## Normas prioritárias para inspecao-end

| Source ID | Norma | Uso principal |
|---|---|---|
| API-510-8ED-001 | API-510 | Vasos de pressão em serviço |
| API-570-4ED-001 | API-570 | Tubulações em serviço |
| API-571-1ED-001 | API-RP-571 | Biblioteca de mecanismos de dano |
| API-574-001 | API-574 | Componentes de tubulação |
| API-653-001 | API-653 | Tanques atmosféricos em serviço |
| API-579-1ED-001 | API-RP-579 | Avaliação de aptidão ao serviço |
| ASME-BPVC-V-2019-001 | ASME-BPVC-V | Ensaios não destrutivos |
| ABNT-PROJ-VP-2004-001 | ABNT-PROJETO | Vasos de pressão em serviço (PT-BR) |

---

## Estado atual — Maio 2026

| Camada | Estado |
|---|---|
| Fontes físicas (raw/) | ✅ 369 documentos — 313 anteriores + 56 ABNT selecionadas + 39 ABNT secundárias |
| Registros de índice | ✅ norm_source_registry.yaml + petrobras + 56 registries ABNT individuais |
| Mapa equipamento→normas | ✅ base_equipment_to_norms.yaml + nbr_operational_domain_map.yaml |
| Texto extraído | ✅ 51 arquivos — API/ASME/ABNT/Petrobras (39) + NRs (12) |
| Blocos inspecao-end | ✅ **1.682 blocos** — 45 arquivos (API, ASME, NR-13, NR-14, Petrobras N) |
| Blocos shared | ✅ **1.630 blocos** — 10 arquivos (NR-05/06/15/22/33/34/35) |
| Blocos irata-n3 | ✅ **57 blocos** — NR-35 |
| Blocos doc-inspecao | ✅ **45 blocos** — manuais de soldagem + apostila API 5L |
| **Blocos ABNT (NBR)** | ✅ **266 blocos** — 56 normas em `blocks/ABNT-*/` (schema v1.2) |
| **TOTAL BLOCOS** | **✅ 3.680 blocos consultáveis** |
| Índices por norma | ✅ 56 índices ABNT em `indices/ABNT-*/` + master_nbr_index.json |
| Lacunas ABNT | ✅ 56 arquivos em `lacunas/ABNT/` |
| Logs ABNT | ✅ 56 arquivos em `ingestion_logs/ABNT/` |
| QA ABNT | ✅ 57 arquivos em `qa/ABNT/` |
| Glossários | ⚡ parcial — 9 glossários en→pt em `translations/glossaries/` |
| Routing patches | ⚡ parcial — 6 patches em `routing_patches/` |
| Cache de traduções | ❌ vazio |

### Normas com blocos integrados

| Norma | Blocos | Arquivo |
|---|---|---|
| API-510 (8ª Ed / 1997) | 36 + 45 | api510_1997_blocks.jsonl + api-510_blocks.jsonl |
| API-520 (2000) | 32 + 45 | api520_2000_blocks.jsonl + api-520_blocks.jsonl |
| API-570 (4ª Ed) | 86 + 45 | api570_2016_blocks.jsonl + api-570_blocks.jsonl |
| API-571 (1ª Ed / 2003) | 62 + 30 | api571_2003_damage_mechanisms_blocks.jsonl + api-rp-571_blocks.jsonl |
| API-574 (1998) | 38 + 45 | api574_1998_blocks.jsonl + api-574_blocks.jsonl |
| API-598 (2004) | 31 + 22 | api598_2004_blocks.jsonl + api-598_blocks.jsonl |
| API-650 (1998) | 53 + 70 | api650_1998_blocks.jsonl + api-650_blocks.jsonl |
| API-653 (2001) | 62 + 45 | api653_2001_blocks.jsonl + api-653_blocks.jsonl |
| ASME-BPVC-V (2019) | 30 + 45 | asme_bpv_v_2019_nde_method_blocks.jsonl + asme-bpvc-v_blocks.jsonl |
| + 34 outros arquivos jsonl | ~770 | API-1104, API-1110, API-6A/6D, API-5L series, Petrobras N-series, ASTM, ABNT... |

---

## Lacunas críticas

Ver `lacunas/lacunas_gerais.md` e `lacunas/ABNT/` para registro completo.

- **Vigência ABNT não confirmada** — blocos válidos para consulta/roteamento; confirmar vigência antes de uso em relatório/fiscalização
- **Extração de texto bloqueada** — pdftoppm não instalado (PDFs raw disponíveis, blocos disponíveis)
- NR-13, NR-35, NR-33 → resolvidas (blocos integrados v1.2)

---

## Regra operacional

O PDF original é a fonte-mãe.
O bloco codificado é instrumento de navegação.
A tradução é auxílio operacional.
A decisão final pertence ao operador técnico responsável.

## Privacidade/licença

Arquivos em `raw/private_authorized/` não devem ir para GitHub público.
