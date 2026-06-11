# NORM-AGENT — Source Recon

**Arquivo:** source recon — iteração 6.0
**Criado em:** 2026-06-09
**Criado por:** operador-primario
**Status:** recon completo — não implementado

---

## 1. Objetivo

Mapear as fontes de capacidade disponíveis para norm-agent antes da elaboração do AGENT.md para review.

---

## 2. Core Parent

**`doc-inspecao`** — Analista Documental Técnico

Função central: leitura crítica, confronto e auditoria de documentação técnica de equipamentos industriais.

Modos de operação declarados:
- **MODO DOCUMENTO** — análise centrada no documento do equipamento
- **MODO NORMA** — análise centrada na norma/requisito técnico

O norm-agent opera principalmente em **MODO NORMA**: recebe uma demanda normativa e reconstrói o que a norma exige para aquele equipamento/situação, mapeia cobertura, identifica lacunas.

---

## 3. Sub-skills disponíveis

| Sub-skill | Localização | Função |
|---|---|---|
| `norm-reader` | `doc-inspecao/sub/norm-reader` | Lê documentos técnicos avulsos (databooks, prontuários, relatórios) |
| `gap-analyzer` | `doc-inspecao/sub/gap-analyzer` | Identifica lacunas de conformidade |
| `document-classifier` | `doc-inspecao/sub/document-classifier` | Classifica tipo e domínio de documento |
| `norm-ingest` | `doc-inspecao/sub/norm-ingest` | Ingestão, segmentação e indexação de normas em blocos |
| `norm-nav` | `doc-inspecao/sub/norm-nav` | Navega índices e blocos já ingeridos |
| `equip-norm-mapper` | `doc-inspecao/sub/equip-norm-mapper` | Mapeia equipamento/atividade → normas candidatas |
| `norm-translate` | `doc-inspecao/sub/norm-translate` | Tradução técnica de blocos normativos sob demanda |

---

## 4. Base normativa carregada

### 4.1 Normas privadas autorizadas (packs especializados)

| Norma | Edição | Status |
|---|---|---|
| API 570 | 4th Ed Fev/2016 | carregada_para_referencia — alerta: 5th Ed/2024 existe |
| API RP 571 | 1st Ed Dez/2003 | vigencia_nao_verificada |
| ASME BPVC Section V | 2019 | vigencia_nao_verificada |

### 4.2 Pack compilação geral (39 normas, ~1.126 blocos)

Inclui: API 510, 570, 574, 579-1/ASME FFS-1, 598, 600, 602, 650, 653, 1104, 1110, 12D, 17A, 17D, 6A, 6D, RP 5L1-5L9, SPEC 5L, ASME B31.4, B31.8, BPVC V, ASTM A106/A106M, Petrobras N-2247, N-2364, N-2668, N-2827.

### 4.3 NRs (normas públicas oficiais)

| NR | Edição | Blocos | Relevância para norm-agent |
|---|---|---|---|
| NR-06 | 2025 | 58 | EPI — transversal |
| NR-13 | 2023 | 163 | vasos de pressão, caldeiras, tubulações — alta relevância |
| NR-14 | 2022 | 13 | fornos — relevância média |
| NR-15 | 2025 | 36 | atividades insalubres — transversal |
| NR-22 | 2026 | 530 | mineração — relevância específica |
| NR-33 | 2022 | 93 | espaço confinado — transversal |
| NR-34 | 2023 | 409 | construção naval — relevância específica |
| NR-35 | 2025 | 58 | trabalho em altura — compartilhada com irata-n3 |

### 4.4 Índices e mapas disponíveis

- `indices/master_norm_index.json` — índice mestre cobrindo todas as 39 normas
- `registries/norm_source_registry.json` — registry completo de fontes
- `maps/equipment_to_norms_map.yaml` — mapa equipamento → normas

---

## 5. Capacidade declarada

### O que o core suporta

- Reconstruir o que uma norma exige para um equipamento/situação
- Identificar requisitos críticos de segurança e qualidade
- Mapear cobertura documental vs. requisito normativo
- Identificar lacunas de conformidade
- Classificar achados: 🔴 Crítico / 🟡 Atenção / 🔵 Observação
- Separar: dado / requisito / inferência / hipótese / limitação
- Apontar conflito entre norma e procedimento do cliente (sem resolver)

### O que o core não faz

- Não conclui conformidade com documento incompleto
- Não trata ausência de dado como conformidade — é lacuna
- Não inventa dado ausente no documento
- Não resolve conflito norma × procedimento — sinaliza e escala

---

## 6. Lacunas identificadas

| Lacuna | Tipo | Impacto |
|---|---|---|
| API 570 carregada é 4th/2016 — 5th Ed/2024 existe | vigência | Declarar alerta sempre que versão for crítica para contrato |
| API RP 571 vigência não verificada | vigência | Usar com reserva |
| ASME BPVC V vigência não verificada | vigência | Usar com reserva |
| Normas NR com status `nao_verificada_online` | vigência | Verificar antes de conclusão de campo |
| Sub-skill `finding-classifier` aparece em SKILL.md da inspecao-end e doc-inspecao — verificar se é compartilhada ou duplicada | duplicação | média |

---

## 7. Compatibilidade com AGENT.md skeleton

O AGENT.md skeleton do norm-agent declara:
- `skills_used: [doc-inspecao, juridico]`
- `can_call: [doc-agent, rag-agent, legal-agent]`
- `can_be_called_by: [operator, meta-router, fw-governor, irata-agent, inspection-agent]`

**Avaliação:**
- `doc-inspecao` cobre completamente a função de análise normativa. Confirmado.
- `juridico` pode apoiar quando há dimensão legal (NR, legislação, responsabilidade). Verificar SKILL.md juridico antes de preencher AGENT.md.
- `rag-agent` é relevante para consulta em norm_library. Draft — sem implementação real ainda.
- Chamado por `irata-agent` e `inspection-agent` confirma papel de referência normativa transversal.

---

## 8. Próximos passos (Iteração 6.1)

1. Ler `.claude/skills/juridico/SKILL.md` para confirmar integração
2. Definir cenários prioritários de QA para norm-agent (análise de gap, consulta normativa, conflito norma × procedimento)
3. Preencher AGENT.md com missão precisa, não-missão, limites, ciclo de vida, output contract
4. Propor QA-20260609-NNN para norm-agent
