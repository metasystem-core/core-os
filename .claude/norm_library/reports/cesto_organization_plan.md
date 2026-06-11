# Cesto — Plano de Organização
Gerado em: 2026-05-11 | Política: CESTO_LIFECYCLE_POLICY v1.0

---

## Objetivo

Este documento descreve a movimentação proposta para cada grupo de arquivos do cesto.
Nenhuma ação aqui descrita é executada automaticamente.
Execução depende de aprovação explícita do operador — ver `human_approval_gate.md`.

---

## Premissa de execução

Todos os blocos JSONL das normas abaixo já estão instalados em `norm_library/blocks/` ou `norm_library/public_official/NRs/blocks/`.
Todos os PDFs raw já estão copiados para `norm_library/raw/`.
As movimentações propostas são de limpeza e arquivamento — não de ingestão.

---

## Grupo 1 — cesto/Normas/ (44 PDFs)

**Status:** raw_e_ingestao_disponiveis — cópias já em `norm_library/raw/private_authorized/`

**Ação proposta:** mover para `_historico/normas_raw_absorvidos/Normas/`

**Justificativa:** norm_library/ é a fonte canônica. Cópias no cesto são residuais e criam ambiguidade sobre qual é a versão autoritativa (INC-001).

**Pré-condição:** confirmar via hash que as cópias são idênticas antes de mover.

**Reversibilidade:** alta — arquivos estarão em `_historico/` e podem ser restaurados ao cesto se necessário.

---

## Grupo 2 — cesto/NRs/ (11 PDFs) + cesto/NR05atualizada2023.pdf

**Status:** raw_e_ingestao_disponiveis — cópias já em `norm_library/raw/public_official/nr/`

**Ação proposta:**
- `cesto/NRs/` → mover para `_historico/normas_raw_absorvidos/NRs/`
- `cesto/NR05atualizada2023.pdf` → mover para `_historico/normas_raw_absorvidos/NRs/`

**Justificativa:** norm_library/ é fonte canônica (INC-002). NR05 não tem blocos gerados — raw preservado na library.

---

## Grupo 3 — cesto/normas br/ (268 PDFs)

**Status:** raw_e_ingestao_disponiveis — cópias já em `norm_library/raw/private_authorized/petrobras/vol1/` e `vol2/`

**Ação proposta:** mover pasta `normas br/` para `_historico/normas_raw_absorvidos/normas_br/`

**Nota:** `normas br.zip` (backup compactado) permanece no cesto até decisão separada do operador sobre arquivamento de ZIPs.

**Justificativa:** 268 PDFs representam o maior volume residual; lib é canônica.

---

## Grupo 4 — Packs ZIP ingeridos (7 arquivos no cesto raiz)

| ZIP | Status |
|---|---|
| `api570_norm_ingestion_pack.zip` | ✅ ingerido — blocos instalados |
| `api571_2003_norm_ingestion_pack.zip` | ✅ ingerido — blocos instalados |
| `api_batch_norm_ingestion_packs_combined.zip` | ✅ ingerido — blocos instalados |
| `asme_bpv_v_2019_norm_ingestion_pack.zip` | ✅ ingerido — blocos instalados |
| `normas br.zip` | ✅ absorvido — PDFs na library |
| `nrs_norm_ingestion_pack.zip` | ✅ ingerido — blocos instalados |
| `para_gpt_norm_compilation_pack.zip` | ✅ ingerido — blocos instalados |

**Ação proposta:** mover os 7 ZIPs para `_historico/packs_ingeridos/`

**Justificativa:** INC-008. Blocos instalados; ZIPs são backups que pertencem ao histórico, não à área de trabalho ativa.

**Opção alternativa:** o operador pode optar por manter os ZIPs no cesto como backup compactado local — decisão aguardada no approval gate.

---

## Grupo 5 — cesto/_zip_extract/ (~54 arquivos)

**Conteúdo:** pasta `api_batch_norm_ingestion_packs/` com subpastas api510/520/574/598/650/653, contendo blocks/, indices/, logs/, lacunas/, maps/, patches/, glossaries/ gerados na ingestão intermediária.

**Risco ativo:** blocos nessas pastas são v1.1 (pré-backfill). Usar por engano retorna blocos sem `traceability_reference` (INC-003).

**Ação proposta:** mover `_zip_extract/` inteiro para `_historico/zip_extracts/`

**Justificativa:** blocos v1.2 já estão em `norm_library/blocks/inspecao-end/`. Os extracts são artefatos intermediários de processamento, não fontes operacionais.

---

## Grupo 6 — cesto/update/ (4 arquivos)

| Arquivo | Status |
|---|---|
| `norm_module_v1_2_traceability_diff_merge_patch.zip` | ✅ aplicado |
| `norm_module_v1_2_traceability_diff_merge_patch.sha256` | ✅ verificado |
| `norm_cesto_lifecycle_patch_v1_0.zip` | ✅ em execução (este patch) |
| `norm_cesto_lifecycle_patch_v1_0.sha256` | ✅ verificado |

**Ação proposta:** mover pasta `update/` inteira para `_historico/patches_aplicados/`

**Justificativa:** patches já aplicados; update/ não deve conter patches expirados.

**Condição:** mover `update/` somente após conclusão completa deste patch (incluindo geração desta série de relatórios).

---

## Grupo 7 — Arquivos não-normativos (permanecem no cesto por ora)

### 7a — cesto/meus ativos/ (103 arquivos — FIIs, carteira)

**Domínio:** asset-core

**Ação proposta:** **manter no cesto** até decisão do operador.

**Opções disponíveis:**
- Opção A: manter no cesto — asset-core lê daqui
- Opção B: mover para `.claude/data/carteira/`

**Decisão pendente:** aguardar instrução do operador no approval gate.

### 7b — cesto/_processados/ (3 arquivos — carteira CSV/XLSX)

| Arquivo | Domínio |
|---|---|
| `movimentacao-2026-05-02.csv` | asset-core |
| `movimentacao-2026-05-02.xlsx` | asset-core |
| `posicao-2026-05-05-13-46-30.xlsx` | asset-core |

**Ação proposta:** **manter no cesto** ou mover para `.claude/data/carteira/` — aguardar decisão.

### 7c — cesto/SINTESE_CARTEIRA_FIIS.txt

**Domínio:** asset-core

**Ação proposta:** **manter no cesto** ou mover para `.claude/data/` — aguardar decisão.

### 7d — cesto/processo das tias/ (24 arquivos — workflow jurídico ativo)

**Domínio:** juridico

**Ação proposta:** **permanecer no cesto** — workflow ativo. Não mover.

**Justificativa:** documentos processuais em uso operacional corrente pelo juridico-core.

### 7e — cesto/resumoDBD.pdf (não classificado)

**Status:** INC-006 — arquivo não identificado. Nome sugere "resumo DBD" — possivelmente jurídico ou financeiro.

**Ação proposta:** **classificar antes de qualquer movimentação**. Aguarda decisão do operador no approval gate.

**Opções:**
- Se jurídico: mover para `processo das tias/` ou `.claude/data/juridico/`
- Se financeiro: mover para `meus ativos/` ou `.claude/data/`
- Se normativo: ingerir antes de mover

---

## Grupo 8 — Meta/config (permanecem no cesto)

| Arquivo | Status |
|---|---|
| `README.md` | permanece no cesto |
| `CESTO_INTAKE_SKILL.md` | permanece no cesto |

---

## Resumo das Ações Propostas

| Grupo | Ação | Requer Aprovação |
|---|---|---|
| Normas/ (44 PDFs) | mover → `_historico/normas_raw_absorvidos/Normas/` | ✅ sim |
| NRs/ + NR05 (12 PDFs) | mover → `_historico/normas_raw_absorvidos/NRs/` | ✅ sim |
| normas br/ (268 PDFs) | mover → `_historico/normas_raw_absorvidos/normas_br/` | ✅ sim |
| 7 ZIPs ingeridos | mover → `_historico/packs_ingeridos/` | ✅ sim (ou manter — ver gate) |
| _zip_extract/ (~54 artefatos) | mover → `_historico/zip_extracts/` | ✅ sim |
| update/ (4 arquivos) | mover → `_historico/patches_aplicados/` | ✅ sim |
| meus ativos/ (103 arquivos) | manter no cesto OU → `.claude/data/carteira/` | decisão pendente |
| _processados/ (3 arquivos) | manter no cesto OU → `.claude/data/carteira/` | decisão pendente |
| SINTESE_CARTEIRA_FIIS.txt | manter no cesto OU → `.claude/data/` | decisão pendente |
| processo das tias/ (24 arquivos) | permanecer no cesto | N/A |
| resumoDBD.pdf | classificar primeiro | decisão pendente |
| README.md + CESTO_INTAKE_SKILL.md | permanecer no cesto | N/A |

---

## Destino `_historico/`

A pasta `_historico/` já existe no repositório (raiz de `core-os/`).
As subpastas necessárias serão criadas na execução:

```
_historico/
├── normas_raw_absorvidos/
│   ├── Normas/          ← 44 PDFs de cesto/Normas/
│   ├── NRs/             ← 11 PDFs de cesto/NRs/ + NR05
│   └── normas_br/       ← 268 PDFs de cesto/normas br/
├── packs_ingeridos/     ← 7 ZIPs
├── zip_extracts/        ← cesto/_zip_extract/ completo
└── patches_aplicados/   ← cesto/update/ completo
```
