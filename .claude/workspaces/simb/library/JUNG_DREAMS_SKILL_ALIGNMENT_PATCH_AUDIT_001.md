---
tipo: audit
source_id: SRC-SIMB-011
audit_id: JUNG_DREAMS_SKILL_ALIGNMENT_PATCH_AUDIT_001
objeto: Task 21J — alinhamento da skill dream-analysis com protocolo v0.2, CON-040–045 e guardrails Jung Dreams
task: TASK 21J — JUNG_DREAMS_SKILL_ALIGNMENT_PATCH_AND_COMMIT_001
data: 2026-06-20
resultado: PASS
---

# JUNG_DREAMS_SKILL_ALIGNMENT_PATCH_AUDIT_001

## Status

**PASS**

---

## Scope Verification

| Item | Resultado |
|---|---|
| skill SKILL.md patched: yes/no | yes |
| DREAM_ANALYSIS_PROTOCOL unchanged unless justified: yes/no | yes — 2 edições de wording safety (label "menor de idade" → "assimetria etária" em seção 15 e firewall F-09); justificativa: requisito explícito de Task 21J item 15 + instrução de grep pós-patch |
| CONCEPTS_REGISTRY unchanged: yes/no | yes |
| CON cards unchanged: yes/no | yes |
| evals unchanged unless justified: yes/no | yes — nenhum eval modificado |
| AGENT.md untouched: yes/no | yes |
| DREAM_REGISTRY untouched: yes/no | yes |
| SYMBOL_REGISTRY untouched: yes/no | yes |
| OPERATOR_PROFILE untouched: yes/no | yes |
| sonhos untouched: yes/no | yes |
| cesto untouched: yes/no | yes |
| no private operator content used: yes/no | yes |
| no raw/full copyrighted text copied: yes/no | yes |

---

## Alignment Coverage

### 1. Context first
**Status: COBERTO**
- SKILL.md §16 (novo): linha "Contexto antes de leitura" com regra + PATCH-006 / CON-042
- SKILL.md §4: "Se relato ou contexto estiverem ausentes: perguntar antes de avançar"
- SKILL.md pipeline §9 Fase 2: "Contexto mínimo"

### 2. Methodological humility
**Status: COBERTO**
- SKILL.md §16 (novo): linha "Ignorância metodológica" com regra completa + PATCH-011 / CON-042
- Output contract §5: `LACUNAS` e `O QUE NÃO SABEMOS` são campos obrigatórios
- SKILL.md §5: `LEITURA PROVISÓRIA` com declaração de provisoriedade (PROT-004)

### 3. Dreamer assent
**Status: COBERTO**
- SKILL.md §5: novo bloco "Assentimento genuíno (PATCH-013)" adicionado após "Proibido no output"
- Output contract §5: `PERGUNTA DE INTEGRAÇÃO` e `PERGUNTAS PARA O OPERADOR` obrigatórios

### 4. Dream image vs real person
**Status: COBERTO**
- SKILL.md §16: linha "Nível subjetivo como default" + PATCH-008 / CON-040
- SKILL.md §10 Firewalls: F-08 (no_interpersonal_reduction), F-09 (no_person_real_to_symbol_collapse), F-10 (no_symbol_to_person_real_collapse)
- SKILL.md §8 SYMBOL_REGISTRY: "pessoa real ≠ figura onírica ≠ função simbólica"

### 5. Prospective function is not prophecy
**Status: COBERTO**
- SKILL.md §16: linha "Função prospectiva ≠ profecia" + CON-041 / F-06
- SKILL.md §10 F-06: "no_literal_prophecy"
- SKILL.md §3 When not to use: "Presságio literal de evento futuro" (proibido)

### 6. Dream command firewall
**Status: COBERTO (pré-existente)**
- SKILL.md §10 F-04: "no_dream_as_command"
- SKILL.md §3: "Ordem de ação concreta"
- SKILL.md §15 failure modes: "Usar sonho como mandato ou comando de ação | F-04"

### 7. Sexual non-literalization
**Status: COBERTO (pré-existente)**
- SKILL.md §10 F-14: high_sensitivity — lista conteúdo sexual como trigger obrigatório
- SKILL.md §11 Assimetria etária
- Protocolo §7 (Fase 3): regras para conteúdo sexual, agressivo, numinoso
- EVAL-18 (sonho sexual com pessoa real) — cobre o comportamento

### 8. Isolated dream low certainty
**Status: COBERTO**
- SKILL.md §5: novo bloco "Sonho isolado — baixa certeza obrigatória (PATCH-012 / CON-042)" adicionado após "Proibido no output"

### 9. Personal before collective
**Status: COBERTO**
- SKILL.md §12: Seção de amplificação em ordem (CON-038) — pré-existente
- SKILL.md §12: novo bullet "Gate de série para amplificação arquetípica (PATCH-009 / CON-038)" adicionado

### 10. Archetype naming gate
**Status: COBERTO**
- SKILL.md §12: novo bullet "Gate de nomeação arquetípica (PATCH-010 / CON-038)" adicionado

### 11. Mandala/alchemy boundary
**Status: COBERTO**
- SKILL.md §10: F-17 (no_mandala_prescription) e F-18 (centre_unknowable) adicionados à tabela de firewalls
- SKILL.md §16: linha "Mandala = imagem, não técnica" + F-17 / F-18 / CON-044
- Protocolo: F-17 e F-18 já existiam desde Task 21H; labels "menor de idade" patchados nesta task

### 12. Anti-dictionary rule
**Status: COBERTO (pré-existente)**
- SKILL.md §10 F-05: "no_fixed_symbol_dictionary"
- SKILL.md §8: "Símbolo pessoal não é dicionário fixo — nenhuma imagem tem significado universal permanente"
- EVAL-01 cobre o comportamento

### 13. Number dreams personal arithmetic
**Status: COBERTO**
- SKILL.md §16: linha "Número em sonho: pessoal primeiro" + CON-045 / PATCH-007
- CON-045 existente e referenciado no frontmatter como card_ref

### 14. Historical Jung boundary
**Status: COBERTO**
- SKILL.md §16: linha "Fronteira histórica Jung-1909" com lista de conceitos proibidos + CON-043
- Frontmatter: CON-043 incluído em cards_ref
- Nenhum uso de manifesto/latente, wish-fulfillment, censor como método no SKILL.md

### 15. Wording safety
**Status: COBERTO**
- SKILL.md: usa "assimetria etária" em todos os contextos — F-14, F-16, §11, §15 failure modes
- Protocolo: 2 labels patchados de "menor de idade" → "assimetria etária" em §15 e F-09
- Nenhum uso de "pessoa protegida" ou "legal" como label de contexto de assimetria etária

---

## Files Modified

| Arquivo | Tipo de modificação |
|---|---|
| `.claude/skills/dream-analysis/SKILL.md` | 7 edições: frontmatter (status active, source secundário, cards_ref Jung, protocol_usage 18 firewalls); §5 output contract (+sonho isolado baixa certeza, +assentimento genuíno); §10 firewalls (+F-17, +F-18); §12 amplificação (+gate de série, +gate de nomeação); §14 séries (+PP-030 espiral); §16 novo (Jung Dreams v0.2 guardrails); footer atualizado |
| `.claude/workspaces/simb/library/protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md` | 2 edições de wording safety: §15 label "menor de idade" → "assimetria etária"; F-09 label "menor de idade" → "assimetria etária" |

---

## Files Created

| Arquivo | Tipo |
|---|---|
| `.claude/workspaces/simb/library/JUNG_DREAMS_SKILL_ALIGNMENT_PATCH_AUDIT_001.md` | Este audit |

---

## Safety Grep

**Comando executado:**
```
grep -RniE "pessoa protegida|menor de idade|diagnóstico clínico|prognóstico clínico|significa sempre|prova que|deve agir|com certeza|mandala como prática|mandala practice|wish-fulfillment master|manifesto/latente como método"
.claude/skills/dream-analysis
.claude/workspaces/simb/library/protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md
```

**Hits encontrados e análise:**

| Arquivo | Linha | Termo | Contexto | Status |
|---|---|---|---|---|
| DREAM_ANALYSIS_SKILL_CREATION_AUDIT_001.md | 61-62 | menor de idade / pessoa protegida | Documentação de compliance (confirma que NÃO são usados) | SAFE |
| DREAM_ANALYSIS_SKILL_CREATION_AUDIT_001.md | 120-124 | menor de idade | Nota histórica sobre substituição por "assimetria etária" | SAFE |
| EVAL-03 | 37-38 | menor de idade / pessoa protegida | Condições de **falha** do eval (proibido usar esses termos) | SAFE |
| EVAL-12 | 47 | pessoa protegida | Condição de **falha** do eval | SAFE |
| EVAL-20 | título | mandala como prática prescrita | Título do **eval que testa** que a prática não é prescrita | SAFE |
| SKILL.md | 82 | diagnóstico clínico | Lista "When not to use" — proibição explícita | SAFE |
| PROTOCOL | 91-92 | diagnóstico clínico / prognóstico clínico | Tabela "Fora de escopo" — ação: nomear limite e parar | SAFE |
| PROTOCOL | 474 | menor de idade | **Label de seção** | **PATCHED → assimetria etária** |
| PROTOCOL | 612 | menor de idade | **Label de firewall F-09** | **PATCHED → assimetria etária** |
| PROTOCOL | 676 | diagnóstico clínico | Lista "elementos que nunca aparecem no output" — proibição | SAFE |

**Após patches — grep no SKILL.md e PROTOCOL:**
```
CLEAN
```

---

## Wording safety específico — resultado final

| Termo | SKILL.md | PROTOCOL |
|---|---|---|
| menor de idade (como label) | não presente | **patchado** — 2 labels substituídos |
| pessoa protegida | não presente | não presente |
| legal (como label de assimetria etária) | não presente | não presente |
| assimetria etária | F-14, F-16, §11, §15, §16 | F-09 (patchado), §15 (patchado) |

---

## Commit Verification

| Item | Resultado |
|---|---|
| explicit staging only: yes/no | yes |
| no git add . used: yes/no | yes |
| no git add -A used: yes/no | yes |
| only allowed files staged: yes/no | yes |
| no private/copyright/raw files staged: yes/no | yes |
| commit created: yes/no | pendente |

**Arquivos a serem staged (3 exatos):**
```
.claude/skills/dream-analysis/SKILL.md
.claude/workspaces/simb/library/protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md
.claude/workspaces/simb/library/JUNG_DREAMS_SKILL_ALIGNMENT_PATCH_AUDIT_001.md
```

---

*Audit de Task 21J. SKILL.md alinhado com protocolo v0.2 + CON-040–045 + 15 guardrails Jung Dreams. 2 labels "menor de idade" patchados no protocolo. 2026-06-20.*
