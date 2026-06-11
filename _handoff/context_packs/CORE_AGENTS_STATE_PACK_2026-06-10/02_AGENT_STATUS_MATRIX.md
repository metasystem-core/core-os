---
file: 02_AGENT_STATUS_MATRIX.md
purpose: Matriz de status de todos os agentes principais do CORE-AGENTS
pack: CORE_AGENTS_STATE_PACK_2026-06-10
generated: "2026-06-10"
---

# MATRIZ DE STATUS — CORE-AGENTS
## Estado em 2026-06-10 | Pós-Iteração 7.5

---

## Agentes Governamentais

| Agente | Status | Active | Version | Op. Authority | Last Event | Observação |
|---|---|---|---|---|---|---|
| `fw-governor` | active | — | 0.1-active | full | — | Árbitro constitucional. Governa conflitos, escaladas, princípios. |
| `meta-router` | active | — | 0.1-active | limited | — | Roteamento de demandas. Delega para agente/skill correto. |
| `cognitive-logistics` | active | — | 0.1-active | limited | — | Gestão de contexto e carga cognitiva de sessão. |
| `context-mapper` | active | — | 0.1-active | limited | — | Empacotamento de contexto para continuidade. |

> Os agentes governamentais `active` são infraestrutura do sistema — não são agentes de domínio.

---

## Agentes de Domínio Validados (review_validated)

| Agente | Status | Active | Version | Op. Authority | Last QA | Last Event | Pack Monitorado | Observação |
|---|---|---|---|---|---|---|---|---|
| `norm-agent` | review_validated | false | 0.1-review_validated | limited | QA-20260609-007 | EVT-20260609-021 | — | SOURCE-FIRST obrigatório. Norma privada não redistribuída. confidence:referencial. |
| `irata-agent` | review_validated | false | 0.1-review_validated | limited | QA-20260610-009 | EVT-20260610-032 | Criado + QA | LIBERÁVEL ≠ AUTORIZADO. Prontidão operacional plena de campo não declarada. |
| `inspection-agent` | review_validated | false | 0.3-review_validated | none | QA-20260610-011 | EVT-20260610-042 | Criado + QA + correções | Ciclo completo 7.0→7.5. 5 firewalls. 8 cenários A + 7 B + template C. |

---

## Agentes de Domínio em Draft

| Agente | Status | Version | Observação |
|---|---|---|---|
| `simb-agent` | draft | 0.1-draft | Processamento simbólico, perfil do operador. |
| `asset-agent` | draft | 0.1-draft | Análise financeira, decisão de investimento. |
| `legal-agent` | draft | 0.1-draft | Documentos jurídicos, prazos, intimações. |
| `learn-agent` | draft | 0.1-draft | Registro de aprendizado — bloqueado em modo visitante. |

---

## Agentes Auxiliares

| Agente | Status | Observação |
|---|---|---|
| `doc-agent` | draft | Geração e estruturação de documentos. |
| `intake-agent` | draft | Intake universal de arquivos. |
| `rag-agent` | draft | Recuperação de informação (RAG). |
| `skill-auditor` | draft | Auditoria e refinamento de skills. |
| `capability-gap` | draft | Detecção de lacunas de capacidade. |

---

## Regras Globais de Status

| Regra | Descrição |
|---|---|
| `draft` | Design inicial. Nenhuma autoridade operacional. Sem QA formal. |
| `review` | Abertura controlada. QA comportamental realizado. active:false preservado. |
| `review_validated` | QA completo (comportamental + pacote monitorado). Uso monitorado autorizado com operador humano. active:false preservado. |
| `active` | Apenas agentes governamentais. Jamais ativado por prompt externo. Exige aprovação formal do operador primário. |

**Regra transversal:** `review_validated` NÃO implica `active:true`. A promoção para `active` é um evento separado, formal, aprovado pelo operador primário via EVT registrado.

---

*Fonte: `.claude/agents/registry/agents_registry.yaml` versão 2.3-inspection-review-validated*
*Gerado em: 2026-06-10 | Pack: CORE_AGENTS_STATE_PACK_2026-06-10*
