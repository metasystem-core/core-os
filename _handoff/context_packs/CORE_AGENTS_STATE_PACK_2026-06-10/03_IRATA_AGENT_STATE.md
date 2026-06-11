---
file: 03_IRATA_AGENT_STATE.md
purpose: Resumo do estado final da frente irata-agent
pack: CORE_AGENTS_STATE_PACK_2026-06-10
generated: "2026-06-10"
---

# ESTADO FINAL — irata-agent
## 2026-06-10 | review_validated / active:false

---

## Estado Final

| Campo | Valor |
|---|---|
| status | review_validated |
| active | false |
| version | 0.1-review_validated |
| operational_authority | limited |
| last_qa | QA-20260610-009 |
| last_event | EVT-20260610-032 |
| pacote monitorado | criado, auditado e corrigido |

---

## Ciclo de Maturação

| Iteração | Descrição | Evento |
|---|---|---|
| 6.0 | Abertura controlada: skeleton, identidade, missão, não-missão, firewalls | EVT-inicial |
| 6.1–6.2 | Estruturação documental: AGENT.md completo, normas IRATA processadas | — |
| 6.2e/6.2f | Processamento da base IRATA: 3931 blocos processados | — |
| 6.2g | QA documental: PASS_WITH_NOTES | QA-20260609-008 |
| 6.4 | QA comportamental: PASS_WITH_NOTES (10/12 PASS, 2/12 PASS_WITH_NOTES, 0 FAIL) | — |
| 6.4b | Promoção para review_validated | EVT-20260609-029 |
| 6.5 | Criação do pacote de uso monitorado | EVT-20260609-030 |
| 6.5-QA | QA do pacote: PASS_WITH_NOTES | QA-20260610-009 / EVT-20260610-031 |
| Pós-QA | Correções cosméticas aplicadas | EVT-20260610-032 |

---

## QAs Relevantes

| QA ID | Tipo | Resultado | Bloqueantes | Violações FW |
|---|---|---|---|---|
| QA-20260609-008 | QA documental (base IRATA) | PASS_WITH_NOTES | 0 | 0 |
| QA-20260610-009 | QA do pacote monitorado | PASS_WITH_NOTES | 0 | 0 |

---

## Eventos Relevantes

| Evento | Tipo | Descrição |
|---|---|---|
| EVT-20260609-029 | Promoção review_validated | Base: QA comportamental PASS_WITH_NOTES |
| EVT-20260609-030 | Criação pacote monitorado | USE_MONITORED.md + FIELD_SUPERVISOR_INTERFACE.md + MONITORED_USE_SCENARIOS.md |
| EVT-20260610-031 | QA do pacote concluído | QA-20260610-009 PASS_WITH_NOTES |
| EVT-20260610-032 | Correções cosméticas pós-QA | Ajustes de contagem e cobertura |

---

## Pacote de Uso Monitorado

| Arquivo | Finalidade |
|---|---|
| `USE_MONITORED.md` | Protocolo de uso: escopo, regras, limites de autoridade |
| `FIELD_SUPERVISOR_INTERFACE.md` | Interface para o supervisor humano de campo |
| `MONITORED_USE_SCENARIOS.md` | Cenários A (permitido), B (proibido), C (template de registro) |

---

## Firewall Central: LIBERÁVEL ≠ AUTORIZADO

Este é o firewall fundamental do irata-agent:

> O agente pode apoiar o planejamento de acesso por corda e a organização de APRs,
> mas **não libera trabalho em altura**, não autoriza execução de resgate,
> não substitui o supervisor IRATA certificado e não assina documentação técnica.

**O agente não conduz resgate remotamente.**
**O agente não substitui o supervisor de campo.**
**Toda decisão de campo é humana.**

---

## Pilares de Não-Missão (do que o irata-agent NUNCA faz)

1. Não autoriza início de trabalho em altura sem APR/PT validada
2. Não conduz resgate remotamente
3. Não qualifica nem certifica trabalhadores ou equipamentos
4. Não substitui inspeção visual e tátil de campo
5. Não emite autorização de trabalho (PT) com valor legal

---

## Base Documental

- Base IRATA processada: 3931 blocos — `confidence:referencial`, revisão técnica pendente
- Toda referência normativa: vigência não confirmada automaticamente
- Validade operacional de campo: não declarada — exige supervisor certificado e inspeção real

---

## Observação de Uso

**review_validated** autoriza uso monitorado com `operational_authority:limited`.
**active:false** — o agente não opera autonomamente.
Toda sessão de uso exige operador humano habilitado.
Prontidão operacional plena de campo não declarada.
Promoção para `active` exige revisão monitorada + aprovação do operador primário via EVT formal.

---

## Arquivos Principais no Repositório

```
.claude/agents/domain/irata-agent/
├── AGENT.md                        (35KB — design completo)
├── USE_MONITORED.md                (13KB — protocolo de uso)
├── FIELD_SUPERVISOR_INTERFACE.md   (9.4KB — interface humana)
└── MONITORED_USE_SCENARIOS.md      (16KB — cenários A/B/C)
```

---

*Fonte: registry v2.3 | Evento final da frente IRATA: EVT-20260610-032*
*Gerado em: 2026-06-10 | Pack: CORE_AGENTS_STATE_PACK_2026-06-10*
