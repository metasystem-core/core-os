# SIMB_SOURCE_GOVERNANCE_001
## Source Weighting and Self-Analysis Trigger Protocol

**Data:** 2026-06-12  
**Operador:** Rafael Santos Pena (modo primário — `opa`)  
**Status:** COMPLETE  
**Precedente:** SIMB-RUDHYAR-CORPUS-001 (adc22c7)

---

## 1. Objetivo

Criar uma camada de discernimento para a Iris avaliar quais fontes merecem apenas nota, quais merecem cards, quais merecem self-analysis e quais podem gerar proposta de evolução. Finalidade: impedir que a biblioteca simbólica vire um Frankenstein de autores, mantendo crescimento vivo, seletivo e governado.

---

## 2. Arquivos Criados

| # | Arquivo | Caminho | Função |
|---|---|---|---|
| 1 | `SOURCE_WEIGHTING_POLICY.md` | `.claude/workspaces/simb/library/` | Régua N0–N5 com critérios de promoção, bloqueio e saída de avaliação |
| 2 | `SELF_ANALYSIS_TRIGGER_POLICY.md` | `.claude/workspaces/simb/library/` | Quando criar/não criar self-analysis; estados; protocolo de recomendação |
| 3 | `SOURCE_EVALUATION_TEMPLATE.md` | `.claude/workspaces/simb/library/` | Formulário completo de avaliação individual de fonte |
| 4 | `SIMB_SOURCE_GOVERNANCE_001.md` | `.claude/audits/` | Este arquivo de auditoria |

**Total de novos arquivos: 4**

---

## 3. Arquivos Modificados

| Arquivo | Modificação |
|---|---|
| `evolution/IRIS_SELF_ANALYSIS_INDEX.md` | v1.0 → v1.1: commits_relacionados adicionados a SA-001..004; seção Future Self-Analysis Candidates adicionada com tabela vazia e links para políticas |
| `library/LIBRARY_INDEX.md` | Adicionada linha SOURCE_EVALUATION_TEMPLATE em Templates; adicionada seção "Governance de Fontes" com tabela de 4 políticas |
| `library/README.md` | Adicionada seção "Governance de Fontes" antes da seção de Templates de Card |
| `registries/INGESTION_DECISIONS_REGISTRY.md` | DEC-005, DEC-006, DEC-007 adicionados — decisões de governance |
| `registries/LEARNING_OBSERVATIONS_REGISTRY.md` | OBS-005, OBS-006 adicionados — aprendizado sistêmico e calibração |
| `registries/ARCHITECTURAL_OBSERVATIONS_REGISTRY.md` | ARCH-006, ARCH-007, ARCH-008 adicionados — decisões arquiteturais de governance |

**Total de arquivos modificados: 6**

---

## 4. Conteúdo das Políticas Criadas

### SOURCE_WEIGHTING_POLICY.md

| Seção | Conteúdo |
|---|---|
| Níveis N0–N5 | Descrição, critérios e destino de cada nível |
| N0 | Reject/Quarantine — fonte fraca, fora de escopo, contaminante |
| N1 | Reading Note — útil como referência, sem força operacional |
| N2 | Cards — conceitos/símbolos úteis sem alterar protocolo |
| N3 | Self-Analysis Candidate — muda modus operandi; requer aprovação do operador |
| N4 | Response Test Required — risco que precisa ser testado antes de patch |
| N5 | Patch Candidate — altera protocolo/runtime/schema; exige IRIS SELF-REWRITE REQUEST |
| Critérios de promoção | 7 critérios fortes (CF-01 a CF-07); 6 critérios médios (CM-01 a CM-06) |
| Critérios de bloqueio | 10 critérios (B-01 a B-10) — quando NÃO gerar self-analysis |
| Saída obrigatória | Campos YAML: source_id, authority_level, novelty_score, operational_impact, risk_score, redundancy_score, recommended_level, justification, operator_decision_required, next_action |

### SELF_ANALYSIS_TRIGGER_POLICY.md

| Seção | Conteúdo |
|---|---|
| Definição | Self-analysis = diagnóstico do modus operandi, não resumo de livro |
| Quando criar | Checklist de 6 gatilhos com perguntas de diagnóstico |
| Quando NÃO criar | 7 situações de bloqueio com motivo |
| Formato obrigatório | Estrutura de 7 seções para todo documento IRIS_SELF_ANALYSIS |
| Estados | candidate → approved → complete → integrated / rejected / deferred |
| Protocolo de recomendação | Formato IRIS SELF-ANALYSIS RECOMMENDATION (Iris → Operador) |

### SOURCE_EVALUATION_TEMPLATE.md

| Seção | Conteúdo |
|---|---|
| §1 Relevance | authority_level e justificativa |
| §2 Novelty | novelty_score (0–5) — o que acrescenta ao existente |
| §3 Operational Impact | 6 gatilhos de self-analysis com sim/não/parcial; operational_impact (0–5) |
| §4 Risk | 7 tipos de risco com presença e mitigação; risk_score (0–5) |
| §5 Redundancy | redundancy_score (0–5) — sobreposição com fontes existentes |
| §6 Recommended Level | Tabela com 4 pontuações; nível recomendado N0–N5 |
| §7 Justification | Critérios fortes/médios satisfeitos + bloqueios presentes |
| §8–§11 | Decisões: self-analysis / cards / response tests / patch candidate |
| §12 Operator Decision | Checkbox de decisão formal com espaço para observações |

---

## 5. IRIS_SELF_ANALYSIS_INDEX — Atualização (v1.0 → v1.1)

| Mudança | Detalhes |
|---|---|
| commits_relacionados adicionados a SA-001 | `86c1d24` + `a5f0c0b` + `996cb6e` |
| commits_relacionados adicionados a SA-002 | `adc22c7` |
| commits_relacionados adicionados a SA-003 | `adc22c7` |
| commits_relacionados adicionados a SA-004 | `adc22c7` |
| Future Self-Analysis Candidates adicionado | Tabela vazia append-only + links para políticas |

---

## 6. Verificações de Escopo

| Verificação | Status |
|---|---|
| Nenhum card novo criado | CONFIRMADO |
| Nenhuma fonte nova ingerida | CONFIRMADO |
| AGENT.md não modificado | CONFIRMADO — escopo não justificou alteração |
| agents_registry.yaml não modificado | CONFIRMADO |
| raw_private/ não tocado | CONFIRMADO |
| extracted_private/ não tocado | CONFIRMADO |
| cesto/ não tocado | CONFIRMADO |
| sonhos/ não tocado | CONFIRMADO |
| profile.md não tocado | CONFIRMADO |
| Nenhum texto bruto/licenciado/pessoal versionado | CONFIRMADO |
| autonomous_self_patch continua false | CONFIRMADO — invariante absoluto preservado |
| Nenhuma self-analysis nova criada | CONFIRMADO |
| Nenhum patch aplicado | CONFIRMADO |
| git add -A não usado | CONFIRMADO |
| git add . não usado | CONFIRMADO |
| git push não executado | CONFIRMADO |

**15/15 PASS**

---

## 7. Arquivos Staged para Este Commit

```
.claude/workspaces/simb/library/SOURCE_WEIGHTING_POLICY.md
.claude/workspaces/simb/library/SELF_ANALYSIS_TRIGGER_POLICY.md
.claude/workspaces/simb/library/SOURCE_EVALUATION_TEMPLATE.md
.claude/workspaces/simb/library/LIBRARY_INDEX.md
.claude/workspaces/simb/library/README.md
.claude/workspaces/simb/library/registries/INGESTION_DECISIONS_REGISTRY.md
.claude/workspaces/simb/library/registries/LEARNING_OBSERVATIONS_REGISTRY.md
.claude/workspaces/simb/library/registries/ARCHITECTURAL_OBSERVATIONS_REGISTRY.md
.claude/agents/domain/simb-agent/evolution/IRIS_SELF_ANALYSIS_INDEX.md
.claude/audits/SIMB_SOURCE_GOVERNANCE_001.md
```

**Total: 10 arquivos**

---

## 8. Result

```yaml
status: source_governance_protocol_created
arquivos_criados: 4
arquivos_modificados: 6
niveis_N0_a_N5: criados em SOURCE_WEIGHTING_POLICY.md
criterios_fortes: 7 (CF-01 a CF-07)
criterios_medios: 6 (CM-01 a CM-06)
criterios_de_bloqueio: 10 (B-01 a B-10)
iris_self_analysis_index_atualizado: v1.0 → v1.1
commits_adicionados: SA-001..004
future_candidates_section: criada (tabela vazia)
cards_novos: 0
fontes_novas: 0
self_analysis_nova: 0
agent_md_tocado: false
registry_global_tocado: false
autonomous_self_patch: false (confirmado)
commit_message: "feat(simb): add source governance for self-analysis"
```

**SIMB-SOURCE-GOVERNANCE-001: COMPLETE.**
