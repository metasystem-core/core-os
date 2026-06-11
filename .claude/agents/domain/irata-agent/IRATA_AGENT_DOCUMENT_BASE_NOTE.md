# IRATA-AGENT — NOTA DE BASE DOCUMENTAL PROCESSADA
**Iteração:** 6.3d | **Data:** 2026-06-09 | **Gerado por:** CORE-OS / Claude Code
**Referência:** EVT-20260609-027

---

## 1. Status da Base Processada

A base documental IRATA foi processada nas iterações 6.2e (ICOP/TACS/SBs) e 6.2f (Annex R).
QA de recuperabilidade e rastreabilidade executado na iteração 6.2g: **PASS_WITH_NOTES**.

Esta nota sintetiza o estado da base para referência operacional do irata-agent.

---

## 2. Documentos Processados

| Documento | Código | Idioma | Blocos | Status | QA 6.2g |
|---|---|---|---|---|---|
| IRATA ICOP | IRATA-ICOP-TC102ENG | EN | 1168 | processado — revisão técnica pendente | PASS |
| IRATA ICOP | IRATA-ICOP-TC102BRA | PT-BR | 1241 | processado — revisão técnica pendente | PASS |
| IRATA TACS | IRATA-TACS-TC101ENG | EN | 632 | processado — revisão técnica pendente | PASS |
| IRATA TACS | IRATA-TACS-TC101BRA | PT-BR | 661 | processado — revisão técnica pendente | PASS |
| Safety Bulletins 042–051 | IRATA-SB-042/051 | EN | 177 | processado | PASS |
| ICOP Annex R (Rescue) | IRATA-ICOP-ANNEX-R | EN | 52 | processado — LAC-IRATA-003 fechada | PASS |
| **TOTAL** | — | — | **3931** | — | **PASS_WITH_NOTES** |

---

## 3. Quantitativo e Cobertura

| Métrica | Valor |
|---|---|
| Total de blocos | 3931 |
| Blocos críticos (REQ/PROIB/RISK) | 1033 |
| Blocos indexados para irata-agent | 1033 (irata_index_for_irata_agent.json) |
| NOTE | ~2200 |
| REQ | ~750 |
| PROC | ~280 |
| COMP | ~280 |
| RISK | ~180 |
| PROIB | ~91 |
| DEF | ~78 |
| Confidence dos blocos | `referencial` — não são afirmações operacionais diretas |
| Vigência | `vigente_nao_confirmada` — nenhum bloco afirma vigência verificada |
| Revisão técnica | `human_review_required: true` para todos os blocos |

---

## 4. Caminhos dos Arquivos

### Blocos JSONL

```
.claude/norm_library/blocks/IRATA/
├── irata_icop_tc102eng_blocks.jsonl            (1168 blocos — ICOP EN)
├── irata_icop_tc102bra_blocks.jsonl            (1241 blocos — ICOP PT)
├── irata_tacs_tc101eng_blocks.jsonl            (632 blocos  — TACS EN)
├── irata_tacs_tc101bra_blocks.jsonl            (661 blocos  — TACS PT)
├── irata_safety_bulletins_042_051_blocks.jsonl (177 blocos  — SBs EN)
└── irata_icop_annex_r_rescue_blocks.jsonl      (52 blocos   — Annex R EN)
```

### Índices

```
.claude/norm_library/indices/irata/
├── irata_index_by_document.json          (por documento)
├── irata_index_by_tag.json               (32 tags)
├── irata_index_by_operational_use.json   (usos operacionais)
└── irata_index_for_irata_agent.json      (1033 blocos críticos REQ/PROIB/RISK)
```

### PDFs Fonte

```
.claude/agents/domain/irata-agent/raw_public_sources/
├── IRATA_ICOP_TC-102ENG_V002.pdf          (SHA256: 6747645e...)
├── IRATA_ICOP_TC-102BRA_V001.pdf          (SHA256: 111a2d8e...)
├── IRATA_TACS_TC-101ENG_V006.pdf          (SHA256: e86b4426...)
├── IRATA_TACS_TC-101BRA_V006.pdf          (SHA256: 7f0fec99...)
├── IRATA_ICOP_Annex_R_Rescue_EN_V001.pdf  (SHA256: fba58494...)
└── safety_bulletins/ (10 arquivos SB-042 a SB-051 EN)
```

---

## 5. Resultado QA (6.2g)

**QA-20260609-008 — document_base_qa:**

| Métrica | Resultado |
|---|---|
| QA documental executado | Iteração 6.2g |
| Resultado geral | **PASS_WITH_NOTES** |
| Cenários PASS | 10 / 12 |
| Cenários PASS_WITH_NOTES | 2 / 12 |
| Cenários FAIL | 0 / 12 |
| Annex R recuperável (SC-IA-003) | SIM — LAC-IRATA-003 validada operacionalmente |
| ICOP/TACS recuperáveis (SC-IA-012) | SIM — gap histórico fechado |
| QA comportamental (AGENT.md) | pendente — prevista Iteração 6.4 |

**Notas QA:**
- SC-IA-002: tags de ancoragem fracas — `ancoragem` ausente de alguns blocos (futuro patch de tags)
- SC-IA-009: interface irata-agent ↔ inspection-agent é decisão de AGENT.md, não da base documental

**Relatórios completos:**
- `.claude/agents/domain/irata-agent/IRATA_BLOCK_RETRIEVAL_QA_REPORT.md`
- `.claude/agents/domain/irata-agent/IRATA_TRACEABILITY_QA_MATRIX.md`

---

## 6. Lacunas Remanescentes da Base

| Lacuna | Código | Status | Impacto |
|---|---|---|---|
| Revisão técnica humana dos blocos críticos (REQ/PROIB/RISK) | LAC-IRATA-001 | pendente | Alto — necessária antes de uso formal |
| Blocos TOC (~2-4% da base) | LAC-IRATA-002 | pendente | Baixo — filtrar em re-extração futura |
| Tradução técnica EN→PT dos blocos ICOP/TACS EN | LAC-IRATA-004 | pendente | Médio — resumos PT são por template, não tradução técnica |
| Tags de ancoragem fracas (fall_factor, ancoragem) | nota QA 6.2g SC-IA-002 | pendente patch | Baixo — patch de tags em iteração futura |
| NRs ausentes (NR-01, NR-10, NR-20, NR-37) | — | pending_user_download | Médio — gov.br bloqueia download automático |
| NBRs de EPI anti-queda (10 normas ABNT) | — | privado_nao_baixar | Médio — operador deve fornecer cópia autorizada |
| Vigência de todas as NRs (nao_verificada_online) | — | permanente até verificação | Alto para uso formal |
| Manuais de fabricante de equipamentos | — | por projeto | Alto para validação de equipamentos específicos |
| Procedimentos do cliente | — | por projeto | Crítico — prevalecem sobre qualquer outra referência |
| SBs versão PT (042–049) | — | opcional | Baixo — EN já processado |
| ICOP Annex S (Working Over Water) | — | opcional | Baixo — escopo O&G |
| Annex R: template pages não estruturadas | LAC-ANNEX-R-002 | pendente | Baixo |
| Annex R: Figure 1 (flowchart) não capturável por texto | LAC-ANNEX-R-003 | permanente | Baixo |

---

## 7. Regra de Uso

1. **Blocos são referência rastreável, não decisão operacional** — citar fonte (norma + página + seção), não substituir consulta direta ao documento original
2. **confidence:referencial** — nenhum bloco afirma mais do que o extrator pode garantir; não afirmar como texto oficial da norma
3. **human_review_required:true** — toda conclusão crítica deve alertar que revisão técnica humana é necessária antes de uso formal
4. **Vigência não confirmada** — todo uso formal deve verificar vigência antes de aplicar
5. **Base disponível ≠ autorização de trabalho** — a existência de blocos não autoriza execução de atividade em campo
6. **Índice de entrada** — usar `irata_index_for_irata_agent.json` como ponto de entrada para blocos críticos (REQ/PROIB/RISK)
7. **QA comportamental pendente** — base validada (6.2g), comportamento do AGENT.md pendente de validação (6.4)
8. **Bloco ≠ procedimento aprovado** — bloco extraído não substitui procedimento aprovado pelo cliente/RT
9. **Explicação PT** — blocos EN podem ser explicados em PT pelo agente sem afirmar ser tradução oficial

---

*Nota de base criada em Iteração 6.3d. Próxima ação: QA comportamental 6.4.*
