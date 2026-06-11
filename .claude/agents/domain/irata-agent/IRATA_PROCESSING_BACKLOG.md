# IRATA PROCESSING BACKLOG
**Iteração:** 6.2f (atualizado) | **Data:** 2026-06-09 | **Gerado por:** CORE-OS / Claude Code

> Backlog ordenado por prioridade de processamento.
> Processamento = conversão de raw_pdf para blocos rastreáveis via schema norm_library.
> **Iteração 6.2e CONCLUÍDA** — ICOP EN/PT + TACS EN/PT + Safety Bulletins 042-051 processados: 3879 blocos.
> **Iteração 6.2f CONCLUÍDA** — ICOP Annex R Rescue processado: 52 blocos. LAC-IRATA-003 fechada. Total: 3931 blocos.

---

## Prioridade Crítica — Processar antes do AGENT.md review final

| Prioridade | Documento | Status | Fonte | Caminho Local | Processamento Necessário | Schema | Tags | Agente Responsável | Risco | Bloqueia AGENT.md | Obs |
|---|---|---|---|---|---|---|---|---|---|---|---|
| P0 | IRATA ICOP EN (TC-102ENG V002) | ✅ **processado** — 1168 blocos | irata.org | `blocks/IRATA/irata_icop_tc102eng_blocks.jsonl` | Revisão técnica humana (LAC-IRATA-001) | norm_library v1.2 | irata, icop, rope_access, supervision, rescue, anchor, ppe | irata-agent | crítico | **parcial** | Processado em 6.2e. Revisão técnica pendente. |
| P0 | IRATA ICOP PT (TC-102BRA V001) | ✅ **processado** — 1241 blocos | irata.org | `blocks/IRATA/irata_icop_tc102bra_blocks.jsonl` | Revisão técnica humana | norm_library v1.2 | irata, icop, rope_access, pt_br | irata-agent | crítico | **parcial** | Processado em 6.2e. Revisão técnica pendente. |
| P0 | IRATA TACS EN (TC-101ENG V006) | ✅ **processado** — 632 blocos | irata.org | `blocks/IRATA/irata_tacs_tc101eng_blocks.jsonl` | Revisão técnica humana (LAC-IRATA-001) | norm_library v1.2 | irata, tacs, certification, levels, n1, n2, n3 | irata-agent | crítico | **parcial** | Processado em 6.2e. Revisão técnica pendente. |
| P0 | IRATA TACS PT (TC-101BRA V006) | ✅ **processado** — 661 blocos | irata.org | `blocks/IRATA/irata_tacs_tc101bra_blocks.jsonl` | Revisão técnica humana | norm_library v1.2 | irata, tacs, certification, pt_br | irata-agent | crítico | **parcial** | Processado em 6.2e. Revisão técnica pendente. |
| P0 | Safety Bulletins EN 042–051 | ✅ **processado** — 177 blocos | irata.org | `blocks/IRATA/irata_safety_bulletins_042_051_blocks.jsonl` | Revisão técnica humana | norm_library v1.2 | irata, safety_bulletin | irata-agent | alto | não | Processado em 6.2e. |
| P0 | ICOP Annex R — Rescue and Evacuation Planning V001 | ✅ **processado** — 52 blocos (6.2f) | irata.org | `blocks/IRATA/irata_icop_annex_r_rescue_blocks.jsonl` | Revisão técnica humana | norm_library v1.2 | irata, icop, rescue, emergency, suspension_trauma | irata-agent | crítico | **parcial** | LAC-IRATA-003 FECHADA. SHA256: fba584... |

---

## Prioridade Alta — Processar na Iteração 6.2e junto com ICOP/TACS

| Prioridade | Documento | Status | Fonte | Caminho Local | Processamento | Tags | Risco | Bloqueia AGENT.md |
|---|---|---|---|---|---|---|---|---|
| P1 | NR-35 (2025) — irata-n3 blocks | processado parcial | norm_library | `blocks/irata-n3/nr_35_2025_blocks.jsonl` (57 blocos) | Verificar completude vs. `public_official` (58 blocos) | nr35, work_at_height, ppe, rope_access | alto | parcial |
| P1 | NR-35 (2025) — public_official | processado | norm_library | `public_official/NRs/blocks/nr_35_blocks.jsonl` (58 blocos) | Confirmar roteamento para irata-n3 | nr35, work_at_height | alto | não |
| P1 | IRATA Safety Bulletins 042–051 (EN) | raw_pdf — pronto | irata.org | `raw_public_sources/safety_bulletins/` | Processar seletivamente: SB-044 (rope failure), SB-045 (fall), SB-048 (anchor), SB-050 (confined space) | irata, safety_bulletin, field_safety, rope_access | alto | não |
| P1 | ICOP Annex R — Rescue Planning v001 | não baixado | irata.org/downloads/25779 | — | Baixar + processar | irata, icop, rescue, emergency | crítico | **SIM** — plano de resgate é firewall do agente |
| P1 | NR-06 (2025) | processado | public_official | `public_official/NRs/blocks/nr_06_blocks.jsonl` (58 blocos) | Verificar roteamento irata-n3 | nr06, ppe, ca, work_at_height | alto | não |
| P1 | NR-33 (2022) | processado | public_official | `public_official/NRs/blocks/nr_33_blocks.jsonl` (93 blocos) | Verificar roteamento irata-n3 | nr33, confined_space, rescue | alto | não |

---

## Prioridade Média — Processar para completude da base

| Prioridade | Documento | Status | Fonte | Caminho | Processamento | Tags | Risco | Bloqueia AGENT.md |
|---|---|---|---|---|---|---|---|---|
| P2 | NR-01 (2022+) | ausente | gov.br | — | pending_user_download → processar | nr01, general_safety, pgr | médio | não |
| P2 | NR-10 (Elétrica) | ausente | gov.br | — | pending_user_download → processar | nr10, electrical_safety, work_at_height | médio | não |
| P2 | NR-37 (Offshore) | ausente | gov.br | — | pending_user_download → processar | nr37, offshore, work_at_height | médio | não |
| P2 | NR-20 (Inflamáveis) | ausente | gov.br | — | pending_user_download → processar | nr20, flammable, atex | médio | não |
| P2 | IRATA Topic Sheets | não baixado | irata.org/publications/topic-sheets/ | — | Listar títulos → baixar relevantes → processar | irata, topic_sheet | médio | não |
| P2 | IRATA Safety Bulletins PT (042–049) | não baixado | irata.org | — | Baixar → processar (opcional se EN processado) | irata, safety_bulletin, pt_br | baixo | não |
| P2 | ICOP Annex S — Working Over Water | não baixado | irata.org/downloads/25780 | — | Baixar + processar se scope O&G | irata, icop, over_water | baixo | não |
| P2 | Petrobras N-2910 — Altura | catálogo apenas | petrobras | catálogo sem PDF | Operador deve fornecer PDF → processar | petrobras, work_at_height | alto | não |

---

## Prioridade Baixa — Normas privadas ABNT (dependem de cópia autorizada do operador)

| Prioridade | Documento | Status | Ação Necessária | Tags | Obs |
|---|---|---|---|---|---|
| P3 | NBR 15986 — Ancoragem | privado_ausente | Operador fornece PDF autorizado → processar | anchorage, ppe | Sem isso: irata-agent usa NR-35 + ICOP como referência |
| P3 | NBR 14629 — Arnês | privado_ausente | Operador fornece PDF autorizado → processar | harness, ppe | Crítico para rastreabilidade de EPI |
| P3 | NBR 15837 — Arnês corpo inteiro | privado_ausente | Operador fornece PDF autorizado → processar | harness, ppe | Idem |
| P3 | NBR 14626 — Trava-queda retrátil | privado_ausente | Operador fornece PDF autorizado → processar | fall_arrest, ppe | |
| P3 | NBR 14628 — Absorvedor de energia | privado_ausente | Operador fornece PDF autorizado → processar | energy_absorber, ppe | |
| P3 | NBR 15836 — Conectores | privado_ausente | Operador fornece PDF autorizado → processar | connectors, ppe | |
| P3 | NBR 16489 — Mosquetões | privado_ausente | Operador fornece PDF autorizado → processar | carabiners, ppe | |
| P3 | NBR 15834 — Acesso por corda | privado_ausente | Operador fornece PDF autorizado → processar | rope_access | Mais relevante de todas — considera para P2 |
| P3 | NBR 16325 — Cadeira suspensa | privado_ausente | Operador fornece PDF autorizado → processar | chair, work_at_height | |
| P3 | ABNT NBR ISO 2408 — Cordas de aço | privado_raw | `raw/private_authorized/ABNT/ABNT-NBR-ISO-2408/ABNT NBR ISO 2408 2009.pdf` | rope_standard | Raw disponível — não redistribuir |

---

## Schema Recomendado para ICOP/TACS

O schema v1.2 da norm_library foi desenvolvido para NRs brasileiras. Para ICOP/TACS (documentos IRATA ingleses com estrutura própria), adaptar:

```yaml
irata_block_schema:
  norma: "IRATA-ICOP" ou "IRATA-TACS"
  codigo: "TC-102ENG" ou "TC-101ENG" etc.
  secao: "Section X" ou "Chapter X"
  item: "X.Y.Z"
  bloco_id: "ICOP-TC102ENG-S03-01"
  tipo: REQ / PROC / DEF / NOTE / RISK / COMP / PROIB
  conteudo_pt: "[tradução/resumo operacional]"
  conteudo_en: "[texto original — não redistribuir integral]"
  tags: [irata, icop, rescue, anchor, etc.]
  risco: crítico / alto / médio / baixo
  permission_status: publico_oficial
  vigencia: nao_confirmada
  route_to: [irata-n3, norm-agent]
```

---

## Notas Transversais

- **IRATA ICOP/TACS são publico_oficial** — freely downloadable conforme declaração do site irata.org. Não há restrição de redistribuição declarada, mas verificar terms of use antes de qualquer publicação externa.
- **NRs bloqueadas no gov.br** — download manual necessário. Operador pode baixar diretamente em: https://www.gov.br/trabalho-e-emprego/pt-br/assuntos/inspecao-do-trabalho/seguranca-e-saude-no-trabalho
- **NBRs privadas** — irata-agent pode operar com NR-35 + ICOP + TACS como base primária. NBRs enriquecem mas não bloqueiam operação.
- **Vigência**: todo bloco processado deve declarar `vigencia: nao_confirmada` até verificação explícita no DOU/portal oficial.

---

*Próxima iteração: 6.2e — processar ICOP + TACS + ICOP Annex R em blocos rastreáveis.*
