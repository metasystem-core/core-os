# Gate de Aprovação Humana — Organização do Cesto
Gerado em: 2026-05-11 | Política: CESTO_LIFECYCLE_POLICY v1.0

---

## Status dos Relatórios Obrigatórios

| Relatório | Status |
|---|---|
| `cesto_inventory_report.md` | ✅ gerado |
| `cesto_inconsistencies_report.md` | ✅ gerado |
| `cesto_organization_plan.md` | ✅ gerado |
| `human_approval_gate.md` | ✅ este documento |

**Condição de execução satisfeita.** Os quatro relatórios estão disponíveis.
A movimentação pode ser executada somente após aprovação explícita abaixo.

---

## O que será movido — Aprovação em bloco ou item a item

### BLOCO A — Residuais normativos (apenas arquivamento)

Nenhum dado é perdido: todos os raws já estão na `norm_library/raw/` e todos os blocos já estão em `norm_library/blocks/`.

| Item | Origem | Destino |
|---|---|---|
| A1 | `cesto/Normas/` (44 PDFs API/ASME/ASTM) | `_historico/normas_raw_absorvidos/Normas/` |
| A2 | `cesto/NRs/` (11 PDFs NRs) | `_historico/normas_raw_absorvidos/NRs/` |
| A3 | `cesto/NR05atualizada2023.pdf` | `_historico/normas_raw_absorvidos/NRs/` |
| A4 | `cesto/normas br/` (268 PDFs Petrobras) | `_historico/normas_raw_absorvidos/normas_br/` |

**Risco:** baixo. Operação reversível — arquivos vão para `_historico/`, não são deletados.

---

### BLOCO B — Packs e extracts pós-ingestão

| Item | Origem | Destino |
|---|---|---|
| B1 | `cesto/api570_norm_ingestion_pack.zip` | `_historico/packs_ingeridos/` |
| B2 | `cesto/api571_2003_norm_ingestion_pack.zip` | `_historico/packs_ingeridos/` |
| B3 | `cesto/api_batch_norm_ingestion_packs_combined.zip` | `_historico/packs_ingeridos/` |
| B4 | `cesto/asme_bpv_v_2019_norm_ingestion_pack.zip` | `_historico/packs_ingeridos/` |
| B5 | `cesto/normas br.zip` | `_historico/packs_ingeridos/` |
| B6 | `cesto/nrs_norm_ingestion_pack.zip` | `_historico/packs_ingeridos/` |
| B7 | `cesto/para_gpt_norm_compilation_pack.zip` | `_historico/packs_ingeridos/` |
| B8 | `cesto/_zip_extract/` (pasta inteira, ~54 artefatos v1.1) | `_historico/zip_extracts/` |

**Alerta B8:** blocos em `_zip_extract/` são v1.1 (sem `traceability_reference`). Manter acessíveis no cesto cria risco de uso acidental. Arquivar em `_historico/` reduz esse risco.

---

### BLOCO C — Patches aplicados

| Item | Origem | Destino |
|---|---|---|
| C1 | `cesto/update/` (pasta inteira, 4 arquivos) | `_historico/patches_aplicados/` |

**Condição:** executar C1 somente após o operador confirmar que os dois patches foram aplicados com sucesso.

---

### PERMANECE NO CESTO (não requer aprovação de movimento)

| Arquivo/Pasta | Motivo |
|---|---|
| `processo das tias/` | workflow jurídico ativo |
| `meus ativos/` | asset-core em uso |
| `_processados/` | asset-core em uso |
| `SINTESE_CARTEIRA_FIIS.txt` | asset-core em uso |
| `README.md` | meta do cesto |
| `CESTO_INTAKE_SKILL.md` | skill config do cesto |

---

## Decisões Pendentes — Resposta Necessária

### D1 — resumoDBD.pdf (INC-006)

Arquivo não classificado. Aguarda decisão do operador:

- [ ] É documento jurídico → mover para `cesto/processo das tias/` ou `.claude/data/juridico/`
- [ ] É documento financeiro → mover para `cesto/meus ativos/` ou `.claude/data/`
- [ ] É normativo → ingerir antes de mover
- [ ] Não reconheço este arquivo — descartar após confirmação

### D2 — Arquivos asset-core (meus ativos/, _processados/, SINTESE)

Atualmente no cesto. O operador pode optar por:

- [ ] Manter no cesto — asset-core lê daqui (status quo)
- [ ] Mover para `.claude/data/carteira/` — centraliza dados do operador fora do cesto

### D3 — ZIPs ingeridos (Bloco B, itens B1–B7)

- [ ] Mover para `_historico/packs_ingeridos/` (recomendado — limpa cesto)
- [ ] Manter no cesto como backup compactado local

---

## Instrução de Aprovação

Para autorizar a execução, o operador responde com uma das formas abaixo:

**Aprovação em bloco (tudo de uma vez):**
> `aprovado: A B C` + respostas para D1, D2, D3

**Aprovação seletiva:**
> `aprovado: A` — executa apenas o Bloco A
> `aprovado: A B` — executa A e B, aguarda C

**Aprovação com exceção:**
> `aprovado: A B C — exceto A4` — executa tudo menos normas br/

**Nenhuma ação sem resposta.**
Este gate permanece aberto até o operador responder.

---

## O que NÃO está neste gate

- Backfill v1.2 — já executado em sessão anterior
- Instalação de blocos NRs — já executado
- Instalação do gpt_pack — já executado
- Instalação dos patches de traceabilidade — já executado
- Conflict scan INC-007 — operação separada, não vinculada a este gate
- Classificação de API-RP-579 standalone vs. edição conjunta (INC-004) — operação separada

---

## Log de Execução

| Data | Bloco | Ação | Executado por |
|---|---|---|---|
| 2026-05-11 | D1 | `resumoDBD.pdf` → renomeado para `declaracao_bens_direitos_ITCD_causa_mortis.pdf` e movido para `cesto/processo das tias/` | Claude Code |
| 2026-05-11 | D2 | `meus ativos/`, `_processados/`, `SINTESE_CARTEIRA_FIIS.txt` → `.claude/data/carteira/` | Claude Code |
| 2026-05-11 | D3 | 7 ZIPs ingeridos → `_historico/packs_ingeridos/` | Claude Code |
| 2026-05-11 | A1 | `cesto/Normas/` (44 PDFs) → `_historico/normas_raw_absorvidos/Normas/` | Claude Code |
| 2026-05-11 | A2 | `cesto/NRs/` (11 PDFs) → `_historico/normas_raw_absorvidos/NRs/` | Claude Code |
| 2026-05-11 | A3 | `cesto/NR05atualizada2023.pdf` → `_historico/normas_raw_absorvidos/NRs/` | Claude Code |
| 2026-05-11 | A4 | `cesto/normas br/` (268 PDFs) → `_historico/normas_raw_absorvidos/normas_br/` | Claude Code |
| 2026-05-11 | B8 | `cesto/_zip_extract/` → `_historico/zip_extracts/` | Claude Code |
| 2026-05-11 | C1 | `cesto/update/` → `_historico/patches_aplicados/` | Claude Code |

**Status:** ✅ COMPLETO — todos os blocos aprovados e executados em 2026-05-11.
