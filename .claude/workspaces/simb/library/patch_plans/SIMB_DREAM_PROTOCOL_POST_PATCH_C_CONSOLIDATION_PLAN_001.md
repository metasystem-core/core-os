---
tipo: consolidation_plan
task: TASK 44 — SIMB_DREAM_PROTOCOL_POST_PATCH_C_CONSOLIDATION_PLAN_001
data: 2026-06-21
status: PLAN_ONLY
versao_protocolo_referencia: draft_review_patched_v0.5-candidate
patches_aplicados_ao_planejar: PATCH-001 a PATCH-080
---

# SIMB_DREAM_PROTOCOL_POST_PATCH_C_CONSOLIDATION_PLAN_001

**Tipo:** Plano de consolidação — apenas planejamento. Nenhuma modificação de protocolo ou skill autorizada por este documento.

---

## Seção 1 — Estado Atual do Protocolo

| campo | valor |
|---|---|
| arquivo | `.claude/workspaces/simb/library/protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md` |
| versão | `draft_review_patched_v0.5-candidate` |
| total de patches | 80 (PATCH-001 a PATCH-080) |
| fases cobertas | 20 fases (Fase 1 a Fase 20) |
| firewalls ativos | 26 (F-01 a F-26, Seção 18 — não tocados por nenhum patch) |
| fonte principal | SRC-SIMB-012 — Whitmont & Perera (1989) |
| base Jung | PATCH-001–029 (camada de base — pré-PATCH-A) |
| QA pré-PATCH-C | PASS — Task 40 / commit fe9c957 / fixup d9e21b2 |

### Commits da camada Whitmont/Perera

| task | commit | descrição |
|---|---|---|
| TASK 38 — PATCH-A plan | 4f6615b | chore(simb): plan Whitmont Perera protocol patch B *(registro: Patch B Plan inclui Patch A plan)* |
| TASK 39 — PATCH-A apply | 3e6c013 | feat(simb): apply Whitmont Perera protocol patch A |
| fixup audit hash PATCH-A | 49d263c | chore(simb): fixup audit hash — patch A 3e6c013 |
| TASK 40 — PATCH-B QA | fe9c957 | test(simb): run Whitmont Perera protocol patch B QA |
| fixup PATCH-B QA audit | d9e21b2 | fixup(simb): patch B QA audit with commit hash fe9c957 |
| TASK 41 — PATCH-C plan | 43a3568 | chore(simb): plan Whitmont Perera protocol patch C |
| fixup PATCH-C plan audit | d8be36d | fixup(simb): patch C plan audit with commit hash 43a3568 |
| TASK 42 — PATCH-C apply | e0a5f99 | feat(simb): apply Whitmont Perera protocol patch C |
| fixup PATCH-C audit | b850ef3 | chore(simb): fixup Patch C audit hash |

### QA Status ao fim de PATCH-C

| item | status |
|---|---|
| PATCH-C aplicado | PASS — Task 42 (WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_C_AND_COMMIT_001) |
| PATCH-C QA (Task 43) | PASS — verificação post-commit, 13/13 patches presentes, nenhuma regressão detectada |
| PATCH-C behavioral scenarios | PENDENTE — Task 45 |
| regressão PATCH-A pós-PATCH-C | PENDENTE — Task 45 |
| regressão PATCH-B pós-PATCH-C | PENDENTE — Task 45 |

---

## Seção 2 — Camadas de Patch Concluídas

### Camada Base Jung (PATCH-001–029)

Aplicada antes da fase Whitmont/Perera. Não atribuída a task numerada nesta série.

| item | valor |
|---|---|
| patches | PATCH-001 a PATCH-029 |
| conteúdo | Regras base de sonhos jungianos — individuação, associação, amplificação, dream-ego, funções compensatórias, séries, inconsciente pessoal/coletivo |
| status | ATIVO — nunca regredido |

### PATCH-A — Clusters E + F (PATCH-030–044)

| item | valor |
|---|---|
| patches | PATCH-030 a PATCH-044 (15 patches) |
| clusters | E (corpo/saúde/sexual) + F (terapeuta/autoridade/diagnóstico) |
| conteúdo | Firewalls médicos, de corpo, sexuais, de autoridade terapêutica — F-19 a F-26 instalados |
| commit apply | 3e6c013 |
| audit | PASS |
| QA | PASS — Task 40 (incluído no PATCH-B QA — nenhuma regressão detectada) |

### PATCH-B — Clusters A + B + C-parcial (PATCH-045–067)

| item | valor |
|---|---|
| patches | PATCH-045 a PATCH-067 (23 patches) |
| clusters | A (interação/assente/resistência) + B (associação/amplificação) + C-parcial (estrutura) |
| conteúdo | Regras de abertura e condução de sessão, protocolo de associação, uso de amplificação, limites de estrutura narrativa — sem gate mitológico |
| commit apply | 83c4ecd |
| audit | PASS |
| QA | PASS — Task 40 / commit fe9c957 |

### PATCH-C — Clusters C-restante + D + G (PATCH-068–080)

| item | valor |
|---|---|
| patches | PATCH-068 a PATCH-080 (13 patches) |
| clusters | C-restante (triagem objeto/sujeito, estrutura dramática) + D (série/recorrência) + G (gate mitológico) |
| conteúdo | Triagem nível objetivo/subjetivo, estrutura dramática 4 elementos, lise/catástrofe, séries e recorrência, gate mitológico qualitativo, ancoragem pessoal, vida passada, imagem numinosa |
| commit apply | e0a5f99 |
| audit | PASS — Task 42 |
| QA post-commit | PASS — Task 43 |
| QA comportamental | PENDENTE — Task 45 |
| symbolic inflation risk | 8 riscos mapeados / 8 mitigações instaladas (PATCH-075/076/077/078/079/080) |

---

## Seção 3 — Inventário de Trabalho Remanescente

| item_id | item_name | type | dependency | risk_level | status | recommended_next_action |
|---|---|---|---|---|---|---|
| REM-001 | PATCH-C QA — cenários comportamentais Cluster C (estrutura/drama) | qa | TASK 43 PASS, e0a5f99 | ALTO | PENDENTE | TASK 45 — priority 1 |
| REM-002 | PATCH-C QA — cenários comportamentais Cluster D (série/recorrência) | qa | REM-001 | ALTO | PENDENTE | TASK 45 — priority 1 |
| REM-003 | PATCH-C QA — cenários comportamentais Cluster G (gate mitológico) | qa | REM-001 | ALTO — symbolic inflation | PENDENTE | TASK 45 — priority 1 |
| REM-004 | Regressão PATCH-A — 15 firewalls Clusters E+F pós-PATCH-C | qa | REM-001 | ALTO | PENDENTE | TASK 45 — incluso na regressão |
| REM-005 | Regressão PATCH-B — 23 regras Clusters A+B+C-parcial pós-PATCH-C | qa | REM-001 | ALTO | PENDENTE | TASK 45 — incluso na regressão |
| REM-006 | Risk Tier 1 — promoção dos risk cards de alta prioridade (PATCH-A+B+C) | risk_promotion | TASK 45 PASS completo | MÉDIO | PENDENTE | TASK 46 — após QA completo |
| REM-007 | Risk Tier 2 — promoção dos risk cards de média prioridade | risk_promotion | REM-006 PASS | MÉDIO | PENDENTE | TASK 47 — após Tier 1 |
| REM-008 | Eval P1 — instalação da suíte de avaliação primária | eval | REM-006 PASS | MÉDIO | PENDENTE | TASK 48 — após Risk Tier 1 |
| REM-009 | Eval P2 — instalação da suíte de avaliação secundária | eval | REM-008 PASS | BAIXO | PENDENTE | TASK 49 — após Eval P1 |
| REM-010 | PATCH-D — PP-WP-008 (following dreams verify) + PP-WP-010 (ego-onírico) | patch | TASK 45 PASS; autorização operador | MÉDIO | DIFERIDO — baixa prioridade | TASK 50 ou posterior — sem urgência |
| REM-011 | SRC-SIMB-012 formal closure — Whitmont/Perera encerrado como fonte ativa de intake | source_closure | REM-001 a REM-009 todos PASS | BAIXO | PENDENTE — aguarda ciclo | TASK 51 |
| REM-012 | SIMB_IRIS_PRODUCT_MODEL_SEED_001 — semente do modelo de produto | product | REM-011 PASS | BAIXO — sem dependência de protocolo | PENDENTE — fase posterior | TASK 52 — após fechamento de fonte |
| REM-013 | SRC-SIMB-012 final QA — verificação de integridade do corpus completo | qa | REM-011, REM-012 | BAIXO | PENDENTE | TASK 53 |
| REM-014 | SKILL.md alignment review — verificar se dream-analysis/SKILL.md reflete PATCH-C | review | TASK 45 PASS | BAIXO — não urgente | PENDENTE | TASK 46 ou posterior — sem modificação obrigatória se alinhado |

---

## Seção 4 — Sequenciamento de Dependências

### TASK 45 — WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_C_QA_AND_REGRESSION_001

**Purpose:** Executar QA comportamental dos 13 patches de PATCH-C (Clusters C, D, G) e verificar ausência de regressão nos patches anteriores PATCH-A (15 firewalls) e PATCH-B (23 regras).

**Depends on:**
- TASK 43 PASS (post-commit verification — concluída)
- Commit e0a5f99 (PATCH-C apply) + fixup b850ef3 presente em HEAD

**Must not touch:**
- `DREAM_ANALYSIS_PROTOCOL_v0.1.md` — read only
- `SKILL.md` — intocado
- risk cards — não promovidos
- evals — não instalados
- CON cards — não criados
- AGENT.md — intocado
- DREAM_REGISTRY — intocado
- SYMBOL_REGISTRY — intocado
- OPERATOR_PROFILE — intocado
- cesto/ — intocado
- sonhos/ — intocado

**Exit criteria:**
- Todos os cenários comportamentais para PATCH-068–080 com resultado PASS ou PASS_WITH_NOTES
- Zero regressões detectadas em PATCH-A (F-19–F-26 ativas)
- Zero regressões detectadas em PATCH-B (PATCH-045–067 intactos)
- Relatório de QA publicado em `.claude/workspaces/simb/library/qa_reports/` ou equivalente
- INTAKE_LOG atualizado
- Commit com mensagem `test(simb): run Whitmont Perera protocol patch C QA`

---

### TASK 46 — SIMB_RISK_TIER1_PROMOTION_001

**Purpose:** Promover os risk cards de alta prioridade identificados nas camadas PATCH-A, PATCH-B e PATCH-C.

**Depends on:** TASK 45 PASS completo (todos cenários + regressão)

**Must not touch:** protocolo, SKILL.md, evals, AGENT.md, DREAM_REGISTRY, SYMBOL_REGISTRY, OPERATOR_PROFILE

**Exit criteria:** risk cards Tier 1 criados, INTAKE_LOG atualizado, commit publicado

---

### TASK 47 — SIMB_RISK_TIER2_PROMOTION_001

**Purpose:** Promover os risk cards de média prioridade.

**Depends on:** TASK 46 PASS

**Must not touch:** mesmo escopo de TASK 46

**Exit criteria:** risk cards Tier 2 criados, INTAKE_LOG atualizado, commit publicado

---

### TASK 48 — SIMB_EVAL_P1_INSTALLATION_001

**Purpose:** Instalar a suíte de avaliação primária (Eval P1) — cenários de teste estruturais alinhados com os 26 firewalls e regras críticas.

**Depends on:** TASK 46 PASS (risk cards Tier 1 disponíveis como referência de critério)

**Must not touch:** protocolo, SKILL.md, risk cards já promovidos (read only), AGENT.md, DREAM_REGISTRY, SYMBOL_REGISTRY

**Exit criteria:** Eval P1 instalado, commit publicado

---

### TASK 49 — SIMB_EVAL_P2_INSTALLATION_001

**Purpose:** Instalar a suíte de avaliação secundária (Eval P2) — cenários de edge cases e Cluster G.

**Depends on:** TASK 48 PASS

**Must not touch:** mesmo escopo de TASK 48

**Exit criteria:** Eval P2 instalado, commit publicado

---

### TASK 50 — WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_D_PLAN_001 (baixa prioridade)

**Purpose:** Planejar PATCH-D — PP-WP-008 (following dreams verify) + PP-WP-010 (ego-onírico construção narrativa) — itens diferidos de PATCH-C.

**Depends on:** TASK 45 PASS; autorização explícita do operador

**Must not touch:** protocolo (planning only), SKILL.md, risk cards, evals, AGENT.md, DREAM_REGISTRY, SYMBOL_REGISTRY

**Exit criteria:** plano de PATCH-D criado, commit publicado; nenhum patch aplicado

---

### TASK 51 — SRC_SIMB_012_FORMAL_CLOSURE_001

**Purpose:** Encerrar SRC-SIMB-012 (Whitmont/Perera) como fonte de intake ativo após ciclo completo: 3 patches aplicados, QA e regressão validados, risks e evals instalados.

**Depends on:** TASK 45, 46, 47, 48, 49 todos PASS

**Must not touch:** protocolo, SKILL.md, AGENT.md, DREAM_REGISTRY, SYMBOL_REGISTRY, OPERATOR_PROFILE

**Exit criteria:** source card SRC-SIMB-012 marcado como `status: closed`, INTAKE_LOG atualizado, commit publicado

---

### TASK 52 — SIMB_IRIS_PRODUCT_MODEL_SEED_001

**Purpose:** Criar semente do modelo de produto SIMB/Iris — estrutura de capacidades baseada no estado estável do protocolo.

**Depends on:** TASK 51 PASS (protocolo estável, fonte fechada)

**Must not touch:** protocolo, SKILL.md, AGENT.md, DREAM_REGISTRY, SYMBOL_REGISTRY

**Exit criteria:** product model seed criado, commit publicado

---

### TASK 53 — SRC_SIMB_012_FINAL_QA_001

**Purpose:** QA final de integridade do corpus SRC-SIMB-012 — verificar que nenhuma regra foi perdida, nenhum item HOLD ficou sem decisão, nenhum item product-model foi colapsado no protocolo.

**Depends on:** TASK 52 PASS

**Must not touch:** qualquer arquivo de protocolo ou skill — inspeção apenas

**Exit criteria:** relatório de integridade final publicado, INTAKE_LOG atualizado

---

## Seção 5 — Controles de Risco

| risco_id | risco | mitigação | task responsável |
|---|---|---|---|
| RISK-CON-001 | Regressão silenciosa PATCH-A — firewalls F-19–F-26 degradados por PATCH-C (conflito de redação) | TASK 45 executa regressão explícita dos 15 patches; qualquer FAIL bloqueia progressão | TASK 45 |
| RISK-CON-002 | Regressão silenciosa PATCH-B — 23 regras degradadas por novos blocos de PATCH-C | TASK 45 executa regressão explícita dos 23 patches; zero tolerância a FAIL | TASK 45 |
| RISK-CON-003 | Symbolic inflation via Cluster G — amplificação mítica substitui pessoal sem ancoragem | PATCH-075/077/078 instalados; TASK 45 testa cenários de gate mitológico; RISK-002 check explícito em PATCH-078 | TASK 45 |
| RISK-CON-004 | Destino simbólico — "seu mito de vida é..." declarado como positivo | PATCH-077 proíbe explicitamente; TASK 45 verifica cenário de rejeição; RISK-002 ativo | TASK 45 |
| RISK-CON-005 | Validação de vida passada / esotérico — Iris valida ou invalida material ontológico | PATCH-079 instala duplo firewall (F-03 + F-18); TASK 45 verifica cenário de material esotérico | TASK 45 |
| RISK-CON-006 | Promoção prematura de risk cards antes de QA completo de PATCH-C | Risk promotion bloqueada até TASK 45 PASS; sequência de dependência enforced | TASK 46 (gate: TASK 45 PASS) |
| RISK-CON-007 | PATCH-D aplicado sem autorização explícita do operador | PATCH-D diferido; sem autorização implícita por conclusão de PATCH-C; TASK 50 requer trigger explícito | TASK 50 (gate: operador) |
| RISK-CON-008 | Product model ativado antes de maturidade de protocolo | TASK 52 depende de TASK 51 (source closure); TASK 51 depende de TASK 45–49 PASS | TASK 52 (gate: cadeia completa) |
| RISK-CON-009 | Evals instalados com critérios desalinhados dos 26 firewalls | TASK 48 depende de risk cards Tier 1 como referência canônica; evals proibidos antes de TASK 46 | TASK 48 (gate: TASK 46 PASS) |
| RISK-CON-010 | Anti-loop — PATCH-081 ou cluster não autorizado iniciado após PATCH-C | Nenhum patch além de PATCH-D (PP-WP-008, PP-WP-010) autorizado sem novo ciclo de planejamento; PP-WP-008 requer task própria | TASK 50 (gate: planning only) |

---

## Seção 6 — Não-Objetivos (O Que Este Plano NÃO Autoriza)

Este documento é de planejamento exclusivamente. As seguintes operações são **explicitamente não autorizadas** por este plano:

1. **Modificar `DREAM_ANALYSIS_PROTOCOL_v0.1.md`** — nenhuma edição, patch, inserção ou remoção
2. **Aplicar PATCH-D** — PP-WP-008 e PP-WP-010 diferidos; requerem TASK 50 própria com autorização do operador
3. **Promover risk cards** — nenhum risk card de Tier 1 ou Tier 2 criado ou modificado
4. **Instalar evals** — nenhum eval P1 ou P2 criado
5. **Modificar `SKILL.md`** — dream-analysis/SKILL.md intocado
6. **Criar CON cards** — nenhum concept card criado ou editado
7. **Modificar AGENT.md** — qualquer agente intocado
8. **Tocar DREAM_REGISTRY ou SYMBOL_REGISTRY** — intocados
9. **Tocar OPERATOR_PROFILE** — intocado
10. **Tocar sonhos/ ou cesto/** — intocados
11. **Encerrar SRC-SIMB-012** — source closure requer TASK 51 com dependências completas
12. **Ativar product model** — SIMB_IRIS_PRODUCT_MODEL_SEED_001 requer TASK 52 com TASK 51 PASS
13. **Promover PP-WP-009, PP-WP-026, PP-WP-056** — status HOLD; sem decisão ativa neste ciclo
14. **Promover quaisquer itens de product-model diferidos** (PP-WP-039/040/041, motif engine, registry, engines) — diferidos para fase de produto; fora do escopo de protocolo
15. **Executar `git add .` ou `git add -A`** — proibição absoluta mantida

---

## Seção 7 — Recomendação Final

**Próxima task:** `WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_C_QA_AND_REGRESSION_001` (TASK 45)

**Status deste documento:** `PLAN_ONLY` — nenhuma modificação de protocolo ou skill autorizada por este plano.

**Prioridade imediata:** TASK 45 — QA comportamental de PATCH-C (Clusters C, D, G) + regressão completa de PATCH-A e PATCH-B. Nenhum trabalho subsequente (risk promotion, evals, source closure, product model) deve ser iniciado antes de TASK 45 PASS.

**Sequência recomendada:**

```
TASK 45 (QA PATCH-C + regressão)
  → TASK 46 (Risk Tier 1)
    → TASK 47 (Risk Tier 2)
      → TASK 48 (Eval P1)
        → TASK 49 (Eval P2)
          → [TASK 50 — PATCH-D, baixa prioridade, gate: operador]
          → TASK 51 (SRC-SIMB-012 closure)
            → TASK 52 (product model seed)
              → TASK 53 (final QA)
```

**Critério de bloqueio:** qualquer FAIL em TASK 45 bloqueia toda a sequência. Identificar causa raiz antes de prosseguir.

---

*Plano — TASK 44 — SIMB_DREAM_PROTOCOL_POST_PATCH_C_CONSOLIDATION_PLAN_001 — 2026-06-21.*
*PLAN_ONLY. 0 patches aplicados. 0 arquivos de protocolo modificados.*
*Referência: v0.5-candidate, 80 patches totais, 14 itens no inventário, 10 riscos mapeados, sequência TASK 45–53.*
