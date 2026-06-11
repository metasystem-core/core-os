# Ingestion Log — NBR Filtered Pack v1.2
# Data: 2026-05-12
# Operador: Rafael Santos Pena (modo primário)

## Fonte
- Arquivo: `nbr_filtered_norm_ingestion_pack_v1_2.zip`
- Hash SHA-256: verificado ✅ (sessão anterior)
- Tamanho: 346 KB
- Raw PDFs origem: `cesto/NBRs/` — 95 PDFs inventariados

## Resultado

- Normas processadas (blocos gerados): 56
- Blocos totais instalados: 266
- Schema: v1.2 TRACEABLE
- QA JSONL: sem erros (0 erros)

## Destinos instalados

| Item | Destino | Qtd |
|---|---|---|
| Blocos JSONL | `blocks/ABNT-{slug}/` | 56 arquivos |
| Índices JSON | `indices/ABNT-{slug}/` | 56 arquivos |
| Master index | `indices/ABNT/master_nbr_index.json` | 1 |
| Source registries | `registries/sources/ABNT/` | 56 arquivos |
| Ingestion logs | `ingestion_logs/ABNT/` | 56 arquivos |
| Lacunas | `lacunas/ABNT/` | 56 arquivos |
| QA | `qa/ABNT/` | 57 arquivos |
| Domain map | `maps/nbr_operational_domain_map.yaml` | 1 |
| Raw selecionados | `raw/private_authorized/ABNT/{norm_code}/` | 56 PDFs |
| Raw secundários | `raw/private_authorized/ABNT/_secondary_unprocessed/` | 39 PDFs |

## Domínios cobertos

- coating_surface → doc-inspecao, inspecao-end
- lifting_rigging → doc-inspecao, irata-n3, shared
- explosive_atmosphere → doc-inspecao, inspecao-end, irata-n3, shared
- tank_storage → doc-inspecao, inspecao-end
- valves → doc-inspecao, inspecao-end
- instrumentation_calibration → doc-inspecao, inspecao-end
- competence_quality_sampling → doc-inspecao, inspecao-end, shared

## Restrição de uso

- `permission_status: nao_redistribuir` (ABNT = privada autorizada)
- Vigência não confirmada — verificar ABNT antes de uso em relatório/fiscalização

## Pending

- Triagem formal de 39 PDFs secundários (aguarda decisão do operador)
- `triage/nbr_raw_delete_plan_after_approval.md` não estava incluído no pacote
- Nenhum arquivo deletado — conforme CODE_INSTALL ("não apagar sem aprovação humana")
