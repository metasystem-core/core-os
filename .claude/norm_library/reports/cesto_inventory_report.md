# Cesto — Inventário de Auditoria
Gerado em: 2026-05-11 | Política: CESTO_LIFECYCLE_POLICY v1.0

---

## Resumo

| Categoria | Arquivos | Status |
|---|---|---|
| Normas raw PDF (cesto/Normas/) | 44 | residual — raw já na library |
| Normas raw PDF (cesto/NRs/ + NR05) | 12 | residual — raw já na library |
| Normas Petrobras raw (normas br/) | 268 | residual — raw já na library |
| Packs ZIP ingeridos | 7 | residual — blocos já instalados |
| Extracts ZIP (_zip_extract/) | ~54 | residual — blocos já instalados |
| Patches aplicados (update/) | 4 | residual — já executados |
| Arquivos não-normativos (FIIs, jurídico, carteira) | ~130 | fora do escopo normativo |
| Meta/config do cesto | 2 | permanecem no cesto |

---

## Grupo 1 — Normas raw PDF em cesto/Normas/ (44 arquivos)

Status: **raw_e_ingestao_disponiveis** — foram copiados para norm_library.

| Arquivo | Destino na library | Confirmado |
|---|---|---|
| API-570_4Ed-2016_Piping-Inspection-Code.pdf | raw/private_authorized/api/ | ✅ |
| API-RP-571_1Ed-2003_Damage-Mechanisms-Fixed-Equipment.pdf | raw/private_authorized/api/ | ✅ |
| ASME-BPVC-V_2019_Nondestructive-Examination.pdf | raw/private_authorized/asme/ | ✅ |
| ASME-V_escaneado-sem-texto_VERIFICAR.pdf | raw/private_authorized/asme/ | ✅ |
| ASTM-A106-A106M-06_Seamless-Carbon-Steel-Pipe.pdf | raw/private_authorized/astm/ | ✅ |
| ABNT-PROJETO-04-011-07-008_2004_VP-Inspecao-Seguranca-RASCUNHO.pdf | raw/public_official/abnt/ | ✅ |
| API-1104_21Ed-2013-Add2-2016_Welding-Pipelines.pdf | raw/private_authorized/api/ | ✅ |
| API/API-510_8Ed-1997_Pressure-Vessel-Inspection.pdf | raw/private_authorized/api/ | ✅ |
| API/API-520_PSV-Relief-Valve-Sizing.pdf | raw/private_authorized/api/ | ✅ |
| API/API-574_Inspection-Practices-Piping-Components.pdf | raw/private_authorized/api/ | ✅ |
| … (demais 34 PDFs API/ASME/ASTM) | raw/private_authorized/ | ✅ |
| Normas/API/N-2247.pdf, N-2827.pdf | raw/private_authorized/petrobras/avulsos/ | ✅ |
| Normas/N-2364.pdf, N-2668.pdf | raw/private_authorized/petrobras/avulsos/ | ✅ |

**Proposta:** mover para `_historico/normas_raw_absorvidos/` ou remover após confirmação.
**Requer aprovação humana antes de qualquer exclusão.**

---

## Grupo 2 — NRs raw PDF (12 arquivos)

Status: **raw_e_ingestao_disponiveis** — copiados para norm_library/raw/public_official/nr/.

| Arquivo | Library | Confirmado |
|---|---|---|
| NR05atualizada2023.pdf | raw/public_official/nr/ | ✅ |
| NRs/nr-06-atualizada-2025-ii.pdf | raw/public_official/nr/ | ✅ |
| NRs/nr-13-atualizada-2023-b.pdf | raw/public_official/nr/ | ✅ |
| NRs/nr-14 a nr-35 (9 arquivos) | raw/public_official/nr/ | ✅ |

**Proposta:** mover para `_historico/nrs_raw_absorvidos/` ou remover.

---

## Grupo 3 — Normas Petrobras (normas br/, 268 PDFs)

Status: **raw_e_ingestao_disponiveis** — copiados para norm_library/raw/private_authorized/petrobras/vol1/ e vol2/.

**Proposta:** normas br.zip permanece como backup compactado; a pasta normas br/ pode ser removida após confirmação.

---

## Grupo 4 — Packs ZIP ingeridos (7 arquivos)

| ZIP | Blocos instalados | Status |
|---|---|---|
| api570_norm_ingestion_pack.zip | api570_2016_blocks.jsonl (86 bl) | ✅ ingerido |
| api571_2003_norm_ingestion_pack.zip | api571_2003_damage_mechanisms_blocks.jsonl (62 bl) | ✅ ingerido |
| api_batch_norm_ingestion_packs_combined.zip | api510/520/574/598/650/653 (252 bl) | ✅ ingerido |
| asme_bpv_v_2019_norm_ingestion_pack.zip | asme_bpv_v_2019_nde_method_blocks.jsonl (30 bl) | ✅ ingerido |
| normas br.zip | 268 PDFs Petrobras copiados | ✅ absorvido |
| nrs_norm_ingestion_pack.zip | 11 blocos NR (1360 blocos) | ✅ ingerido |
| para_gpt_norm_compilation_pack.zip | 39 normas (1126 blocos) | ✅ ingerido |

**Proposta:** mover para `_historico/packs_ingeridos/` ou manter como backup compactado.

---

## Grupo 5 — Extracts ZIP (_zip_extract/, ~54 arquivos)

Conteúdo: packs api510/520/574/598/650/653 extraídos em pastas separadas com blocks/, indices/, logs/, lacunas/, maps/, patches/, glossaries/.

Status: **residual** — blocos já instalados na library; extracts são cópias intermediárias do processo de ingestão.

**Proposta:** remover _zip_extract/ inteiro após confirmação de que todos os blocos estão na library.

---

## Grupo 6 — Patches aplicados (update/, 4 arquivos)

| Arquivo | Status |
|---|---|
| norm_module_v1_2_traceability_diff_merge_patch.zip | ✅ aplicado |
| norm_module_v1_2_traceability_diff_merge_patch.sha256 | ✅ verificado |
| norm_cesto_lifecycle_patch_v1_0.zip | ✅ em execução |
| norm_cesto_lifecycle_patch_v1_0.sha256 | ✅ verificado |

**Proposta:** mover para `_historico/patches_aplicados/` após conclusão.

---

## Grupo 7 — Arquivos não-normativos

| Caminho | Domínio | Ação proposta |
|---|---|---|
| meus ativos/Fiis/ (~100 arquivos) | asset-core | permanecer no cesto para consumo por asset-core ou mover para .claude/data/ |
| _processados/ (3 arquivos) | asset-core | mover para .claude/data/carteira/ ou manter no cesto |
| SINTESE_CARTEIRA_FIIS.txt | asset-core | mover para .claude/data/ |
| processo das tias/ (~25 arquivos) | juridico | permanecer no cesto (workflow ativo do juridico-core) |
| resumoDBD.pdf | incerto | classificar antes de mover |

---

## Grupo 8 — Meta/config (permanecem no cesto)

| Arquivo | Status |
|---|---|
| README.md | meta — permanece |
| CESTO_INTAKE_SKILL.md | skill config — permanece |
