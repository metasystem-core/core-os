# Auditoria Pós-Movimentação
Data: 2026-05-11 | Executada após aprovação blocos A/B/C/D

---

## 1. Raws absorvidos — _historico vs. norm_library/raw vs. registries

### 1a — Presença em norm_library/raw

| Grupo | Qtd em _historico | Qtd em norm_library/raw | Cobertura |
|---|---|---|---|
| API/ASME/ASTM (cesto/Normas/) | 44 arquivos | 44 arquivos | ✅ 100% |
| NRs (cesto/NRs/ + NR05) | 12 arquivos | 12 arquivos | ✅ 100% |
| Petrobras vol1/vol2 (normas br/) | 268 arquivos | 268 arquivos | ✅ 100% |

**Resultado:** nenhum arquivo classificado como `raw_em_historico_sem_alocacao_definitiva`.
Todos os raws absorvidos têm cópia canônica em `norm_library/raw/`.

### 1b — Presença em norm_source_registry.json

O `norm_source_registry.json` existe em `registries/` com **39 entradas** cobrindo o gpt_pack + material_didatico.

**Gaps detectados — não estão no norm_source_registry:**

| Norma/Grupo | Raw na library | Blocos | Status |
|---|---|---|---|
| API 570 4th Ed/2016 (pack especializado) | ✅ | ✅ `api570_2016_blocks.jsonl` (86 bl) | `blocos_disponiveis_sem_entrada_registry` |
| API RP 571 1st Ed/2003 (pack especializado) | ✅ | ✅ `api571_2003_damage_mechanisms_blocks.jsonl` (62 bl) | `blocos_disponiveis_sem_entrada_registry` |
| ASME BPVC V 2019 (pack especializado) | ✅ | ✅ `asme_bpv_v_2019_nde_method_blocks.jsonl` (30 bl) | `blocos_disponiveis_sem_entrada_registry` |
| API-RP-579 1st Ed/2000 standalone | ✅ raw/private_authorized/api/ | ❌ sem blocos | `raw_disponivel_ingestao_pendente` — ambiguidade com edição conjunta (INC-004) |
| ASME-V escaneado | ✅ raw/private_authorized/asme/ | ❌ sem texto extraível | `raw_disponivel_sem_texto_extraivel` — em quarentena |
| Petrobras vol1 (N-0002 a N-1965, 130 normas) | ✅ raw/private_authorized/petrobras/vol1/ | ❌ sem blocos | `raw_disponivel_ingestao_pendente` |
| Petrobras vol2 (N-1973 a N-2943, 138 normas) | ✅ raw/private_authorized/petrobras/vol2/ | ❌ sem blocos | `raw_disponivel_ingestao_pendente` |

**Gap estrutural:** `file_location_registry` referenciado na política **não existe** no filesystem.
O `norm_source_registry.json` cobre apenas os 39 itens do gpt_pack — não substitui um file_location_registry completo.

---

## 2. Packs ingeridos — localização de artefatos

### Pack especializado: api570_2016

| Artefato | Caminho | Status |
|---|---|---|
| blocks | `blocks/inspecao-end/api570_2016_blocks.jsonl` (86 bl) | ✅ |
| index | `indices/api570_2016_index.json` (verificar) | ⚠️ ver abaixo |
| log | `ingestion_logs/api570_2016_ingestion_log.md` | ✅ |
| lacunas | não localizado em `lacunas/` | ⚠️ ausente |

### Pack especializado: api571_2003

| Artefato | Caminho | Status |
|---|---|---|
| blocks | `blocks/inspecao-end/api571_2003_damage_mechanisms_blocks.jsonl` (62 bl) | ✅ |
| index | `indices/api571_2003_index.json` (verificar) | ⚠️ ver abaixo |
| log | `ingestion_logs/api571_2003_ingestion_log.md` | ✅ |
| lacunas | não localizado em `lacunas/` | ⚠️ ausente |

### Pack especializado: asme_bpv_v_2019

| Artefato | Caminho | Status |
|---|---|---|
| blocks | `blocks/inspecao-end/asme_bpv_v_2019_nde_method_blocks.jsonl` (30 bl) | ✅ |
| index | `indices/asme_bpv_v_2019_index.json` (verificar) | ⚠️ ver abaixo |
| log | `ingestion_logs/asme_bpv_v_2019_ingestion_log.md` | ✅ |
| lacunas | não localizado em `lacunas/` | ⚠️ ausente |

### gpt_pack (39 normas + material_didatico)

| Artefato | Status |
|---|---|
| blocks — inspecao-end (34 normas) | ✅ 35 arquivos JSONL em `blocks/inspecao-end/` |
| blocks — doc-inspecao (5 materiais) | ✅ 5 arquivos JSONL em `blocks/doc-inspecao/` |
| indices | ✅ 59 arquivos em `indices/` (master + por norma) |
| logs | ✅ 50+ arquivos em `ingestion_logs/` |
| lacunas | ⚠️ `lacunas/` na raiz da norm_library está **vazio** |
| norm_source_registry | ✅ `registries/norm_source_registry.json` (39 entradas) |

### NRs pack (11 NRs + NR-05 avulso)

| Artefato | Status |
|---|---|
| blocks (11 NRs) | ✅ `public_official/NRs/blocks/` — 11 JSONL |
| indices | ✅ `public_official/NRs/indices/` — 12 JSON + master + equipment_map |
| logs | ✅ `public_official/NRs/logs/` — 12 por-NR + 1 master |
| lacunas | ✅ `public_official/NRs/lacunas/nrs_lacunas.md` |
| version_registry | ✅ `public_official/NRs/version_registry/nrs_version_registry.yaml` |
| NR-05 blocks | ❌ NR-05 raw disponível em `raw/public_official/nr/` mas `blocos: 0` no version_registry |

---

## 3. _zip_extract — isolamento v1.1

| Verificação | Resultado |
|---|---|
| Localização atual | ✅ `_historico/zip_extracts/_zip_extract/api_batch_norm_ingestion_packs/` |
| Nenhuma skill aponta para `_zip_extract` | ✅ varredura em todos os `.md` e `.yaml` de `.claude/skills/` — zero hits |
| Blocos v1.1 fora de circulação | ✅ caminho rompido — não é possível acessar acidentalmente |

---

## 4. SKILL.md — declaração vs. filesystem

### doc-inspecao/SKILL.md
✅ Atualizado em sessão anterior. Declara 34 normas privadas (gpt_pack), 3 packs especializados, 5 materiais didáticos, NRs por path separado. **Coerente com filesystem.**

### inspecao-end/SKILL.md + norm_profile.yaml
SKILL.md não enumera blocos diretamente — delega para `norm_profile.yaml`.

`norm_profile.yaml` declara `loaded_blocks_public_official` para NR-06, NR-13, NR-14, NR-15, NR-22, NR-33, NR-34, NR-35.

Verificação contra filesystem:
| NR declarada | Bloco existe | Contagem declarada | Status |
|---|---|---|---|
| NR-06 | ✅ | 58 bl | ✅ |
| NR-13 | ✅ | 163 bl | ✅ |
| NR-14 | ✅ | 13 bl | ✅ |
| NR-15 + anexos | ✅ | declarado sem total | ✅ |
| NR-22 | ✅ | 530 bl | ✅ |
| NR-33 | ✅ | 93 bl | ✅ |
| NR-34 | ✅ | 409 bl | ✅ |
| NR-35 | ✅ | 58 bl | ✅ |

**Nota:** `primary_norm_families.public_official` lista NR-01, NR-10, NR-12, NR-20 sem blocos — correto, pois são referências normativas, não blocos carregados. A separação `loaded_blocks_public_official` vs. `primary_norm_families` está correta.

**Packs especializados (api570_2016, api571_2003, asme_bpv_v_2019) não aparecem em norm_profile.yaml.** São acessíveis via ingestion_logs e blocos na library, mas não declarados explicitamente no perfil.

### irata-n3/SKILL.md + norm_profile.yaml
`loaded_blocks_public_official` declara NR-06, NR-15, NR-22, NR-33, NR-34, NR-35.
Todos verificados ✅ no filesystem.

---

## 5. Cesto — verificação final

```
cesto/
├── processo das tias/    (24 arquivos — workflow jurídico ativo) ✅
├── _rejeitados/          (vazia) ✅
├── CESTO_INTAKE_SKILL.md ✅
└── README.md             ✅
```

**Nenhum raw normativo, bloco, índice ou artefato de ingestão permanece no cesto.** ✅

---

## Resumo de Achados

| ID | Tipo | Severidade | Descrição |
|---|---|---|---|
| PA-001 | gap_estrutural | baixa | `file_location_registry` não existe — apenas `norm_source_registry.json` para os 39 itens do gpt_pack |
| PA-002 | blocos_sem_registry | baixa | api570_2016, api571_2003, asme_bpv_v_2019 têm blocos mas não têm entrada em `norm_source_registry.json` |
| PA-003 | raw_ingestao_pendente | média | 268 Petrobras vol1/vol2 têm raw na library mas zero blocos gerados |
| PA-004 | raw_quarentena | baixa | ASME-V escaneado: sem texto extraível, em quarentena — já documentado como INC-005 |
| PA-005 | ambiguidade_edicao | baixa | API-RP-579 standalone vs. API-579-1/ASME-FFS-1 joint edition — já documentado como INC-004 |
| PA-006 | lacunas_ausentes | baixa | `lacunas/` na raiz da norm_library está vazio; packs especializados não têm arquivos de lacuna documentados |
| PA-007 | nr05_sem_blocos | baixa | NR-05 raw disponível mas `blocos: 0` no version_registry — raw image-only ou sem processamento realizado |

**Nenhum achado de severidade alta.** Sistema operacional e íntegro.

---

## Ações Recomendadas

| Ação | Prioridade | Dependência |
|---|---|---|
| Criar `file_location_registry` cobrindo todos os raws (ou expandir `norm_source_registry`) | baixa | --- |
| Adicionar api570_2016, api571_2003, asme_bpv_v_2019 ao `norm_source_registry.json` | baixa | --- |
| Decidir se 268 Petrobras vol1/vol2 serão ingeridos como blocos | média | decisão do operador |
| Criar arquivos de lacunas para os packs especializados | baixa | --- |
| Verificar NR-05: é image-only ou tem texto? Criar blocos ou marcar como quarentena | baixa | --- |
