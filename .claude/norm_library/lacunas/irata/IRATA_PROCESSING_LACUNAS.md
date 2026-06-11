# IRATA PROCESSING LACUNAS
**Iteração:** 6.2f (atualizado) | **Data:** 2026-06-09 | **Gerado por:** CORE-OS / Claude Code
**Escopo:** Lacunas identificadas no processamento dos documentos IRATA ICOP/TACS/Safety Bulletins + Annex R

---

## Resumo de Lacunas

| ID | Categoria | Severidade | Documento | Descrição | Impacto | Status |
|---|---|---|---|---|---|---|
| LAC-IRATA-001 | traducao_pendente | crítica | ICOP TC-102ENG, TACS TC-101ENG | Blocos EN sem tradução operacional real — resumo PT-BR gerado por template | irata-agent não pode usar resumos EN como base de decisão sem revisão | pendente |
| LAC-IRATA-002 | segmentacao_toc | alta | ICOP EN/PT, TACS EN/PT | Entradas de tabela de conteúdo (TOC) foram capturadas como blocos — blocos com `......` no excerpt são TOC | Ruído na base: ~5–15% dos blocos são entradas de TOC | pendente |
| LAC-IRATA-003 | annex_r_resolvido | ~~crítica~~ **RESOLVIDO** | ICOP Annex R — Rescue and Evacuation Planning V001 (2024-10-03) | ~~Documento não baixado~~ **Baixado e processado em 6.2f** — 52 blocos rastreáveis | ~~Lacuna de firewall~~ Fechada — revisão técnica humana ainda recomendada | **resolvido_6.2f** |
| LAC-IRATA-004 | annex_s_ausente | média | ICOP Annex S — Working Over Water v001 | Documento não baixado — irata.org/downloads/25780 | Relevante para operações O&G offshore | pendente_download |
| LAC-IRATA-005 | safety_bulletins_pt_ausentes | média | SB-042 a SB-049 PT | Versões portuguesas dos Safety Bulletins não baixadas | Uso em campo Brasil preferível em PT | pendente_download |
| LAC-IRATA-006 | nrs_ausentes | alta | NR-01, NR-10, NR-20, NR-37 | gov.br bloqueia curl — NRs complementares ao acesso por corda ausentes | Base normativa incompleta para contextos elétricos, inflamáveis, offshore | pending_user_download |
| LAC-IRATA-007 | nbrs_privadas_ausentes | alta | NBR 15834, NBR 14629, NBR 15986, NBR 15837 | Normas ABNT privadas sem cópia autorizada | Rastreabilidade de EPI e sistemas de ancoragem fica dependente de NR-35 + ICOP | aguarda_operador |
| LAC-IRATA-008 | vigencia_nao_confirmada | alta | Todos os documentos IRATA | `vigente_nao_confirmada` para todos — não houve verificação DOU/irata.org em 2026-06-09 | Blocos não podem ser usados como base legal sem confirmação de vigência | pendente_verificacao |
| LAC-IRATA-009 | segmentacao_aproximada | média | Todos os PDFs | Segmentação por parágrafo/seção — não item-a-item (ICOP usa items como `1.4.2.7.1`) | `reference_precision: secao_aproximada` — não `item_exato` como NRs | estrutural_aceito |
| LAC-IRATA-010 | icop_topic_sheets_ausentes | baixa | IRATA Topic Sheets | Lista de topic sheets não acessada — irata.org/publications/topic-sheets/ | Complemento operacional não crítico | pendente |

---

## Detalhe por Lacuna

### LAC-IRATA-001 — Tradução Pendente (EN → PT)

**Documentos afetados:** ICOP TC-102ENG (1168 blocos), TACS TC-101ENG (632 blocos), SB-042-051 EN (177 blocos)
**Total blocos com tradução pendente:** ~1977 blocos (51% da base)

**Resumos PT-BR gerados por template** — não são traduções técnicas reais. Os templates cobrem:
- Requisitos `shall/must` → "Requisito obrigatório IRATA..."
- Proibições `shall not` → "Proibição normativa IRATA..."
- Resgate/emergência → "Requisito de resgate/emergência IRATA..."
- Ancoragem → "Requisito de ancoragem IRATA..."
- Certificação N1/N2/N3 → "Competência IRATA Nível X..."
- Demais → "[código:seção] Bloco extraído automaticamente..."

**Ação necessária:** Revisão técnica por técnico IRATA habilitado ou tradução via LLM com revisão humana.

**Mitigação atual:** Blocos EN têm `translation_status: nao_traduzido`, `human_review_required: true`, `review_reason: [vigencia_nao_confirmada, baixa_rastreabilidade]`. Os blocos PT (TC-102BRA, TC-101BRA) estão disponíveis como referência primária.

---

### LAC-IRATA-002 — Blocos TOC Capturados

**Evidência:** Excerpts como `"6.5 RIGGING FOR RESCUE AND HAULING .................................."` são entradas de sumário, não conteúdo técnico.

**Estimativa:** ~80–150 blocos TOC entre os 3879 extraídos (~2–4%)

**Impacto:** Baixo — esses blocos têm `confidence: referencial` e `human_review_required: true`. O filtro de índice for_irata_agent filtra por `block_type in [REQ, PROIB, RISK]` — blocos TOC classificados como NOTE não entram no índice crítico.

**Ação recomendada:** Em iteração futura, adicionar filtro `if '......' in excerpt: skip_block` ao extrator.

---

### LAC-IRATA-003 — ICOP Annex R Ausente (CRÍTICA)

**URL:** `https://irata.org/downloads/25779`
**Conteúdo:** Rescue and Evacuation Planning v001
**Impacto:** O plano de resgate é um requisito de firewall do irata-agent — sem ele, o agente não pode validar completude de plano de resgate. Declarado no AGENT.md como requisito crítico.

**Ação:** Download manual pelo operador → processar na próxima iteração.

---

### LAC-IRATA-006 — NRs Complementares Ausentes

**NRs em falta para acesso por corda completo:**

| NR | Domínio | Relevância IRATA |
|---|---|---|
| NR-01 (2022) | Gestão de Riscos (PGR/GRO) | Base do sistema de gestão de SST — contexto de toda APR |
| NR-10 (2023) | Segurança em Instalações Elétricas | Acesso em torres, subestações |
| NR-20 (2021) | Inflamáveis e Combustíveis | Acesso em tanques, refinarias |
| NR-37 (2024) | Plataformas Offshore | Acesso em offshore — especificidades ambientais |

**Motivo da ausência:** gov.br retorna HTTP 403 para curl — bloqueio anti-bot.
**Ação:** Operador baixa manualmente em: `https://www.gov.br/trabalho-e-emprego/pt-br/assuntos/inspecao-do-trabalho/seguranca-e-saude-no-trabalho`

---

### LAC-IRATA-007 — NBRs IRATA-Específicas Ausentes

**NBRs críticas para irata-n3:**

| NBR | Assunto | Prioridade |
|---|---|---|
| NBR 15834 | Sistemas de Acesso por Corda | P1 — mais relevante de todas |
| NBR 14629 | Cinturão Paraquedista (Arnês) | P1 |
| NBR 15986 | Sistemas de Ancoragem | P1 |
| NBR 15837 | Arnês de Corpo Inteiro | P2 |
| NBR 14626 | Trava-queda Retrátil | P2 |
| NBR 14628 | Absorvedor de Energia | P2 |

**Mitigação atual:** irata-agent usa NR-35 + ICOP + TACS como base primária. NBRs enriquecem rastreabilidade de EPI/equipamento mas não bloqueiam operação.

---

## Lacunas Resolvidas

| ID | Iteração | Descrição | Resolução |
|---|---|---|---|
| LAC-IRATA-PREV-001 | 6.2e | ICOP EN ausente da base | Baixado e processado — 1168 blocos |
| LAC-IRATA-PREV-002 | 6.2e | ICOP PT ausente da base | Baixado e processado — 1241 blocos |
| LAC-IRATA-PREV-003 | 6.2e | TACS EN ausente da base | Baixado e processado — 632 blocos |
| LAC-IRATA-PREV-004 | 6.2e | TACS PT ausente da base | Baixado e processado — 661 blocos |
| LAC-IRATA-PREV-005 | 6.2e | Safety Bulletins ausentes | Baixados (SB-042-051 EN) e processados — 177 blocos |
| **LAC-IRATA-003** | **6.2f** | **ICOP Annex R — Resgate ausente (CRÍTICA)** | **Baixado de irata.org (1.32 MB, 21 pp) + processado — 52 blocos. SHA256: fba58494ff75ec72ddb90f7097a8152411a2661dc38bbb95d1cbf14f3953431c** |

---

## Critério de Fechamento de Lacunas

| Lacuna | Critério de Fechamento |
|---|---|
| LAC-IRATA-001 | Revisão técnica confirmada por técnico IRATA ou tradução validada |
| LAC-IRATA-002 | Filtro TOC adicionado ao extrator + re-processamento |
| LAC-IRATA-003 | ✅ FECHADA em 6.2f — Annex R baixado e processado (52 blocos) |
| LAC-IRATA-004 | Download e processamento do Annex S (se escopo O&G) |
| LAC-IRATA-005 | Download e processamento dos SBs em PT |
| LAC-IRATA-006 | Download manual pelo operador + processamento NRs |
| LAC-IRATA-007 | Operador fornece cópias autorizadas NBRs + processamento |
| LAC-IRATA-008 | Verificação explícita de vigência em irata.org e/ou DOU |
| LAC-IRATA-009 | Re-processamento com segmentação item-a-item (Iteração futura) |
| LAC-IRATA-010 | Listar e baixar topic sheets relevantes |

---

*Próxima ação: revisão técnica LAC-001 e download Annex R (LAC-003).*
