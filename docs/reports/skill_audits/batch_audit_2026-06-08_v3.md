# BATCH AUDIT — CORE-OS Skills
**Data:** 2026-06-08  
**Versão:** v3  
**Scanner:** skill_frontmatter_scan_v3.json (98 SKILL.md encontrados)  
**Escopo:** 19 skills principais em `.claude/skills/`  
**Modo:** SKILL-AUDITOR — BATCH REVIEW  

---

## Delta desde v2

| Evento | Resultado |
|---|---|
| irata-n3 upgrade | 2 → 5 ✓ confirmado |
| cognitive-logistics refinement (v3 novo) | 2 → 5 ✓ instalado nesta sessão |
| P-SA-01 (frontmatter core-self-audit, context-mapper) | ✓ aplicado |
| P-SA-03 (operator-lock frontmatter padrão) | ✓ aplicado |
| P-SA-05 (juridico name fix) | ✓ aplicado |
| P-SA-06 (inspecao-end output contract) | ✓ aplicado |
| P-SA-07 (risk_level em 11 skills) | ✓ aplicado |
| P-SA-08 (lotofa runtime disponível) | ✓ aplicado |

---

## Matriz de skills — v3

| # | Skill | Score | Frontmatter | source_policy | Tamanho | Classificação |
|---|---|---|---|---|---|---|
| 01 | _firmware | 3 | ✓ (incompleto¹) | ✗ | 1.389 | MANTER |
| 02 | asset-core | 4 | ✓ | ✗ | 3.772 | MANTER |
| 03 | capability-gap-router | 5 | ✓ completo | ✓ | 2.907 | MANTER |
| 04 | cesto | 3 | ✓ (name errado²) | ✗ | 3.051 | CORRIGIR |
| 05 | cognitive-logistics | 5 | ✓ completo | ✓ | 15.208 | MANTER |
| 06 | context-mapper | 3 | ✓ | ✗ | 3.248 | MANTER |
| 07 | core-intake | 4 | ✓ | ✗ | 4.792 | MANTER |
| 08 | core-self-audit | 4 | ✓ | ✗ | 3.584 | MANTER |
| 09 | doc-inspecao | 4 | ✓ | ✗ | 11.802 | MANTER |
| 10 | fw-core | 3 | ✓ | ✗ | 1.583 | MANTER³ |
| 11 | fw-kant | 2 | ✓ | ✗ | 988 | EXPANDIR |
| 12 | inspecao-end | 4 | ✓ completo | ✓ | 3.555 | MANTER |
| 13 | irata-n3 | 5 | ✓ completo | ✓ | 7.404 | MANTER |
| 14 | juridico | 3 | ✓ completo | ✓ | 1.585 | EXPANDIR |
| 15 | lotofa | 3 | ✓ (name errado⁴) | ✗ | 2.668 | CORRIGIR |
| 16 | operator-lock | 4 | ✓⁵ | ✗ | 3.547 | MANTER |
| 17 | simb-core | 4 | ✓ | ✗ | 6.062 | MANTER |
| 18 | skill-auditor | 4 | ✓ completo | ✓ | 2.872 | MANTER |
| 19 | skill-router | 5 | ✓⁵ | ✗ | 9.654 | MANTER |

**Média do sistema: 3.8/5** (v2: ~3.2 — melhoria de +0.6 nesta sessão)

---

## Notas de frontmatter

**¹ _firmware** — `source_policy` ausente. Nome declarado é "core-lite-watchdog" (inconsistência com pasta `_firmware`).

**² cesto** — `name: cesto-intake` mas pasta e CLAUDE.md referenciam como "cesto". Inconsistência no skill-router dinâmico.

**³ fw-core** — SKILL.md é intencionalmente thin (dispatcher). Conteúdo real distribuído em 16 subskills em `sub/` e 5 camadas em `layers/`. Arquitetura válida; `source_policy` ausente é o único gap real no main skill.

**⁴ lotofa** — `name: lotofa-core` mas pasta e CLAUDE.md referenciam como "lotofa".

**⁵ operator-lock e skill-router** — Scanner reportou `has_frontmatter: false` (falso negativo). Leitura direta confirma frontmatter correto em ambos. Causa provável: BOM (Byte Order Mark) UTF-8 no início do arquivo — scanner usa `r"^---\n"` que não casa com `﻿---\n`. Não é gap real nas skills; é gap no scanner.

---

## Análise qualitativa — skills críticas

### fw-kant (Score 2 → EXPANDIR)

**Gap**: Única skill com score 2. Conteúdo funcional mas mínimo: 7 perguntas de teste + 5 outputs possíveis. Ausência de:
- modos de operação por contexto (decisão financeira vs relacional vs estratégica)
- output contract estruturado
- watchdog específico
- templates de avaliação
- integração com cognitive-logistics documentada

**Risco de não expandir**: FW-Kant é acionado transversalmente por cognitive-logistics, simb-core e asset-core. Skill thin significa que o filtro ético mais importante do sistema opera sem protocolo formal.

### juridico (Score 3 → EXPANDIR)

**Gap**: Pipeline de 10 passos funciona, mas falta:
- output contract (o que deve ser produzido em cada tipo de demanda)
- templates (petição, timeline processual, mapa de prova)
- modos distintos (análise de documento / estratégia / interface com advogado)
- integração com contexto do processo das tias

**Risco de não expandir**: Domínio de alto risco (`risk_level: high`). Skill thin em domínio de alto risco é inconsistência de design.

### cesto e lotofa (name inconsistency)

Ambas declaram `name` diferente do identificador real. Skill-router dinâmico lê o campo `name` do frontmatter para construir a biblioteca. Se o nome não bate com o path, o roteamento pode produzir inconsistência na resolução de ambiguidade.

---

## source_policy — gap sistêmico

11 das 19 skills carecem de `source_policy`. Campo recomendado pelo scanner mas com impacto real: sem ele, o sistema não sabe qual protocolo de fonte usar para cada skill.

**Valor padrão sugerido por domínio:**

| Skill | source_policy sugerida |
|---|---|
| asset-core | `source_first` |
| cesto | `context_first` |
| context-mapper | `context_first` |
| core-intake | `context_first` |
| core-self-audit | `internal_structural` |
| doc-inspecao | `source_first` |
| fw-core | `internal_structural` |
| fw-kant | `context_first` |
| lotofa | `source_first` |
| simb-core | `context_first` |
| _firmware | `internal_structural` |

---

## Subskills sem frontmatter (36 arquivos)

Scanner identificou 36 SKILL.md de subskills sem frontmatter padrão. Não são auditadas como skills primárias mas impactam a visibilidade no skill-router dinâmico caso ele evolua para varredura recursiva.

| Grupo | Qtd | Impacto atual |
|---|---|---|
| irata-n3/sub/ | 9 | Baixo — acessadas via skill pai |
| fw-core/sub/ | 16 | Baixo — acessadas via skill pai |
| fw-core/layers/ | 5 | Baixo — idem |
| doc-inspecao/subskills/ | 4 | Baixo — idem |
| asset-core/automation/ | 2 | Baixo — idem |

---

## Patches recomendados — v3

| ID | Skill | Tipo | Prioridade | Descrição |
|---|---|---|---|---|
| P-V3-01 | fw-kant | EXPANDIR | ALTA | Adicionar modos, output contract, watchdog e templates. Skill de maior risco/impacto com menor conteúdo. |
| P-V3-02 | juridico | EXPANDIR | ALTA | Adicionar output contract, templates e modos. Domínio high-risk com skill thin. |
| P-V3-03 | cesto | CORRIGIR | MÉDIA | Corrigir `name: cesto-intake` → `name: cesto` para consistência com roteamento dinâmico. |
| P-V3-04 | lotofa | CORRIGIR | MÉDIA | Corrigir `name: lotofa-core` → `name: lotofa`. Adicionar `source_policy`. |
| P-V3-05 | 11 skills | FRONTMATTER | MÉDIA | Adicionar `source_policy` nas 11 skills que carecem do campo. |
| P-V3-06 | scanner | RUNTIME | BAIXA | Atualizar `skill_frontmatter_scanner.py` para usar `encoding="utf-8-sig"` e eliminar falsos negativos por BOM. |
| P-V3-07 | subskills (36) | FRONTMATTER | BAIXA | Adicionar frontmatter mínimo nas subskills. Só relevante se skill-router evoluir para varredura recursiva. |

---

## Saúde do sistema — visão geral

```
Skills score 5/5:  capability-gap-router, cognitive-logistics, irata-n3, skill-router  (4/19 — 21%)
Skills score 4/5:  asset-core, core-intake, core-self-audit, doc-inspecao,              (8/19 — 42%)
                   inspecao-end, operator-lock, simb-core, skill-auditor
Skills score 3/5:  _firmware, cesto, context-mapper, fw-core, juridico, lotofa          (6/19 — 32%)
Skills score 2/5:  fw-kant                                                              (1/19 —  5%)

Média: 3.8/5
Nenhuma skill em score 0 ou 1
Nenhuma skill classificada como DEPRECAR ou SUBSTITUIR
```

---

## Prioridade de execução

1. **P-V3-01 + P-V3-02** (fw-kant + juridico EXPANDIR) — Maior impacto no sistema por serem skills transversais e de alto risco com conteúdo thin.
2. **P-V3-03 + P-V3-04** (name fixes em cesto e lotofa) — Quick fixes com impacto direto no roteamento dinâmico.
3. **P-V3-05** (source_policy em batch) — Melhoria estrutural sistêmica.
4. **P-V3-06** (scanner BOM fix) — Melhoria de observabilidade.
5. **P-V3-07** (subskills frontmatter) — Opcional, baixa urgência.

---

*Gerado por SKILL-AUDITOR — BATCH REVIEW — CORE-OS v3 — 2026-06-08*
