# Log de Integração — API Batch (6 normas)

> Data: 2026-05-11
> Operador: primário
> Origem: `cesto/api_batch_norm_ingestion_packs_combined.zip` (gerado via GPT)
> Integrado por: CORE-OS / norm-ingest

---

## Resumo

| Norma | source_id | Blocos | Arquivo |
|---|---|---|---|
| API-510 (1997, 8ª Ed) | API-510-8ED-001 | 36 | api510_1997_blocks.jsonl |
| API-520 (2000) | API-520-001 | 32 | api520_2000_blocks.jsonl |
| API-574 (1998) | API-574-001 | 38 | api574_1998_blocks.jsonl |
| API-598 (2004) | API-598-001 | 31 | api598_2004_blocks.jsonl |
| API-650 (1998) | API-650-001 | 53 | api650_1998_blocks.jsonl |
| API-653 (2001) | API-653-001 | 62 | api653_2001_blocks.jsonl |
| **Total** | | **252** | |

---

## Arquivos integrados por destino

### blocks/inspecao-end/
- `api510_1997_blocks.jsonl` — 36 blocos
- `api520_2000_blocks.jsonl` — 32 blocos
- `api574_1998_blocks.jsonl` — 38 blocos
- `api598_2004_blocks.jsonl` — 31 blocos
- `api650_1998_blocks.jsonl` — 53 blocos
- `api653_2001_blocks.jsonl` — 62 blocos

### indices/
- `api510_1997_index.json`
- `api520_2000_index.json`
- `api574_1998_index.json`
- `api598_2004_index.json`
- `api650_1998_index.json`
- `api653_2001_index.json`

### lacunas/
- `api510_1997_lacunas.md`
- `api520_2000_lacunas.md`
- `api574_1998_lacunas.md`
- `api598_2004_lacunas.md`
- `api650_1998_lacunas.md`
- `api653_2001_lacunas.md`

### translations/glossaries/
- `api510_1997_glossary_en_pt.yaml`
- `api520_2000_glossary_en_pt.yaml`
- `api574_1998_glossary_en_pt.yaml`
- `api598_2004_glossary_en_pt.yaml`
- `api650_1998_glossary_en_pt.yaml`
- `api653_2001_glossary_en_pt.yaml`

### equipment_norm_maps/
- `api510_1997_equipment_activity_map.yaml`
- `api520_2000_equipment_activity_map.yaml`
- `api574_1998_equipment_activity_map.yaml`
- `api598_2004_equipment_activity_map.yaml`
- `api650_1998_equipment_activity_map.yaml`
- `api653_2001_equipment_activity_map.yaml`

### routing_patches/
- `api510_1997_routing_patch.yaml`
- `api520_2000_routing_patch.yaml`
- `api574_1998_routing_patch.yaml`
- `api598_2004_routing_patch.yaml`
- `api650_1998_routing_patch.yaml`
- `api653_2001_routing_patch.yaml`

---

## Atualizações no norm_source_registry.yaml

Campos `blocks_file` e `index_file` atualizados para as 6 normas acima.

---

## Schema compliance

- Todos os blocos seguem o `norm_block_schema.yaml` base
- Campos adicionais presentes (não violam schema — são extensões):
  - `language_original` — idioma do texto fonte
  - `language_output` — idioma do operational_summary
  - `route_to_core` — lista de cores destinatários
  - `normative_strength` — força normativa (mandatory/recommended/informational)
- `permission_status: nao_redistribuir` em todos os blocos API
- `original_excerpt_short` limitado a títulos de seção (conforme regra de privacidade)

---

## Observações

- Arquivos de lote anterior (api-510_blocks.jsonl, api-650_blocks.jsonl, etc.) mantidos — ambos ficam disponíveis para consulta
- API-510 8ª Ed (1997) — edição defasada (vigente é 11ª Ed 2022) — LACUNA-004 ativa
- validity_status: vigente_nao_confirmada em todos os blocos

---

## Próximos passos

1. Integrar blocos das demais normas (API-570, API-571, API-579, ASME-BPVC-V, etc.)
2. Resolver LACUNA-001 (NR-13), LACUNA-002 (NR-35), LACUNA-006 (NR-33)
3. Atualizar README.md da norm_library com novo estado dos blocos
