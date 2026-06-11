# Cesto — Inconsistências Detectadas
Gerado em: 2026-05-11 | Política: CESTO_LIFECYCLE_POLICY v1.0

---

## INC-001 — Raw duplicado: cesto/Normas/ vs. library

**Tipo:** norma_duplicada (raw em dois lugares)
**Severidade:** baixa — não é conflito de conteúdo, é redundância de localização
**Descrição:** Todos os 44 PDFs de cesto/Normas/ foram copiados para norm_library/raw/. As cópias no cesto são residuais.
**Risco:** confusão sobre qual cópia é a fonte canônica; consumo de espaço em disco.
**Ação:** confirmar via hash que as cópias são idênticas; designar norm_library/ como fonte canônica; remover ou arquivar cópias do cesto após aprovação.
**Requer aprovação:** ✅ sim — não apagar sem confirmação

---

## INC-002 — Raw duplicado: cesto/NRs/ e NR05 vs. library

**Tipo:** norma_duplicada (raw em dois lugares)
**Severidade:** baixa
**Descrição:** 12 PDFs de NRs copiados para norm_library/raw/public_official/nr/. Cópias no cesto são residuais.
**Ação:** mesma estratégia do INC-001.

---

## INC-003 — Extracts de packs em _zip_extract/ sem papel definido

**Tipo:** residual_sem_destino_claro
**Severidade:** baixa
**Descrição:** _zip_extract/api_batch_norm_ingestion_packs/ contém pastas de packs api510/520/574/598/650/653 com blocks/, indices/, logs/, etc. Esses artefatos foram usados como intermediários de ingestão mas nunca foram limpos. Os blocos já estão em norm_library/blocks/inspecao-end/.
**Risco:** versões dos blocos nos extracts são v1.1 (pré-backfill); os da library já são v1.2. Usar o extract por engano pode retornar blocos sem traceability_reference.
**Ação:** remover _zip_extract/ ou mover para _historico/.
**Requer aprovação:** ✅ sim

---

## INC-004 — API-RP-579 presente em cesto/Normas/ mas sem blocos dedicados na library

**Tipo:** raw_disponivel_ingestao_pendente
**Severidade:** média
**Descrição:** cesto/Normas/API/API-RP-579_1Ed-2000_Fitness-for-Service.pdf existe e foi copiado para norm_library/raw/. No entanto, os blocos instalados são `api-579-1-asme-ffs-1_blocks.jsonl` do gpt_pack (30 blocos, edição conjunta API 579-1/ASME FFS-1). A edição standalone 1st Ed 2000 pode ter diferenças em relação à edição conjunta.
**Risco:** referência feita ao API RP 579 standalone pode não mapear corretamente para o bloco da edição conjunta.
**Ação:** registrar no version_registry; rodar norm-diff quando a edição conjunta estiver disponível.

---

## INC-005 — ASME-V escaneado sem texto extraível

**Tipo:** erro_leitura / raw_disponivel_ingestao_pendente
**Severidade:** média
**Descrição:** cesto/Normas/ASME-V_escaneado-sem-texto_VERIFICAR.pdf é PDF image-only, sem texto extraível. Foi copiado para a library mas não pode ser ingerido automaticamente.
**Ação:** manter em quarentena; requer OCR ou substituição por versão com texto.

---

## INC-006 — resumoDBD.pdf sem classificação

**Tipo:** unknown
**Severidade:** baixa
**Descrição:** cesto/resumoDBD.pdf não foi classificado. Nome sugere "resumo DBD" — possivelmente documento jurídico ou financeiro.
**Ação:** classificar manualmente antes de mover; pode ser juridico-core ou asset-core.

---

## INC-007 — Dois conjuntos de blocos para mesma norma (API 570, API RP 571, ASME BPVC V)

**Tipo:** mesma_norma_versao_diferente (ou granularidade diferente)
**Severidade:** baixa — coexistência intencional
**Descrição:**
- API 570: `api570_2016_blocks.jsonl` (86 bl, pack especializado) + `api-570_blocks.jsonl` (45 bl, gpt_pack)
- API RP 571: `api571_2003_damage_mechanisms_blocks.jsonl` (62 bl) + `api-rp-571_blocks.jsonl` (30 bl)
- ASME BPVC V: `asme_bpv_v_2019_nde_method_blocks.jsonl` (30 bl) + `asme-bpvc-v_blocks.jsonl` (45 bl)
**Risco:** consultas podem retornar blocos diferentes para a mesma norma; conflict_scan não rodou.
**Ação:** rodar norm-conflict-scan nos pares; documentar qual é preferencial para cada tipo de consulta.

---

## INC-008 — Packs ZIP ingeridos sem remoção do cesto

**Tipo:** residual_pós_ingestão
**Severidade:** baixa
**Descrição:** 7 ZIPs de ingestão permanecem no cesto após processamento completo.
**Ação:** mover para _historico/packs_ingeridos/ após aprovação.

---

## Sem inconsistências críticas detectadas

Nenhum conflito normativo de severidade alta foi identificado nesta auditoria de filesystem.
Blocos duplicados (INC-007) são coexistência intencional, não conflito de conteúdo.
