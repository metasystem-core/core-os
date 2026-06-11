# SKILL BATCH AUDIT — CORE-OS
**Data:** 2026-06-08  
**Modo:** BATCH REVIEW  
**Auditor:** SKILL-AUDITOR (operado por Claude Code)  
**Escopo:** 19 skills em `.claude/skills/`  
**Base mecânica:** `docs/reports/skill_frontmatter_scan.json`

---

## MATRIZ GERAL

| # | Skill | Score | Diagnóstico | Recomendação | Prioridade |
|---|---|---|---|---|---|
| 1 | `fw-core` | 4 | Forte, frontmatter incompleto | CORRIGIR | baixa |
| 2 | `asset-core` | 5 | Operacional robusta | MANTER | — |
| 3 | `simb-core` | 4 | Forte, sem watchdog externo | CORRIGIR | baixa |
| 4 | `juridico` | 3 | Operacional básica | EXPANDIR | média |
| 5 | `inspecao-end` | 3 | Funcional, outputs implícitos | EXPANDIR | média |
| 6 | `irata-n3` | 2 | Thin — safety-critical | EXPANDIR | alta |
| 7 | `fw-kant` | 3 | Concisa, proporcional | MANTER | — |
| 8 | `_firmware` | 4 | Forte — SKILL.md é summary | MANTER | — |
| 9 | `operator-lock` | 3 | Frontmatter não-padrão | CORRIGIR | média |
| 10 | `cognitive-logistics` | 2 | Rótulo de sub-skills sem detalhe | EXPANDIR | média |
| 11 | `cesto` | 4 | Forte, roteamento bem definido | MANTER | — |
| 12 | `skill-router` | 5 | Muito completo, dinâmico | MANTER | — |
| 13 | `doc-inspecao` | 5 | Melhor skill do sistema | MANTER | — |
| 14 | `core-intake` | 4 | Sólido, arquitetura clara | MANTER | — |
| 15 | `lotofa` | 4 | Bem estruturada, firewall ativo | MANTER | — |
| 16 | `core-self-audit` | 3 | Conteúdo forte, SEM frontmatter | CORRIGIR | alta |
| 17 | `context-mapper` | 3 | Conteúdo bom, SEM frontmatter | CORRIGIR | alta |
| 18 | `skill-auditor` | 4 | Recém instalada, bem estruturada | MANTER | — |
| 19 | `capability-gap-router` | 4 | Recém instalada, bem estruturada | MANTER | — |

---

## ACHADOS POR SKILL

---

### 1. fw-core — Score 4 — CORRIGIR

**Diagnóstico:** Forte. Pipeline de 13 passos, frases obrigatórias, identidade clara. Funciona como hub constitucional.

**Falhas:**
- Frontmatter falta `domain` e `risk_level`.
- Sem referência a watchdog local.
- Sem templates para output (decisão estrutural, conflict-scan, etc.).

**Recomendação:** CORRIGIR — adicionar `domain` e `risk_level` ao frontmatter. Templates opcionais no futuro.

---

### 2. asset-core — Score 5 — MANTER

**Diagnóstico:** Skill mais madura do sistema junto com `doc-inspecao`. Hierarquia constitucional, RAR/CCR, 5 zonas decisórias, regra de adaptação Brasil, lacuna operacional, decisão final classificada.

**Falhas:**
- Frontmatter falta `risk_level`.

**Recomendação:** MANTER. Única correção: adicionar `risk_level: high` ao frontmatter.

---

### 3. simb-core — Score 4 — CORRIGIR

**Diagnóstico:** Forte. 14 módulos internos, pipeline de 11 passos, regra SOURCE-FIRST, regra de sobrecarga, onde pode falhar.

**Falhas:**
- Frontmatter falta `risk_level`.
- Sem watchdog externo explícito (watchdog é interno ao módulo KANT-CORE — funcional mas não visível como arquivo separado).
- `profile.md` referenciado mas não auditável nesta passagem.

**Recomendação:** CORRIGIR — `risk_level` no frontmatter. Considerar separar watchdog externo se `profile.md` crescer.

---

### 4. juridico — Score 3 — EXPANDIR

**Diagnóstico:** Operacional básica. Pipeline de 10 passos, guardrails claros, identidade definida.

**Falhas:**
- Sem templates de saída (petição, laudo de risco, cronograma processual).
- Sem watchdog local.
- Sem formato de lacuna operacional.
- Sem seção "onde pode falhar".
- Frontmatter: `name: juridico-core` mas pasta é `juridico` — inconsistência.
- Falta `risk_level`.

**Recomendação:** EXPANDIR — adicionar template de análise processual, watchdog, seção de lacuna e corrigir `name` no frontmatter para `juridico`.

---

### 5. inspecao-end — Score 3 — EXPANDIR

**Diagnóstico:** Funcional. Escopo bem definido, quando ativar/evitar, estilo.

**Falhas:**
- Sem output contract explícito (quais artefatos gera).
- Sub-skills referenciadas no `skill-router` (`damage-mechanisms`, `ndt-selector`, `report-contract`, `finding-classifier`) mas não listadas no próprio SKILL.md.
- Sem watchdog local.
- Falta `risk_level` no frontmatter.
- Não declara relação com `doc-inspecao` e `irata-n3` (essa relação existe em `doc-inspecao` mas não aqui).

**Recomendação:** EXPANDIR — listar sub-skills disponíveis, adicionar output contract, referência cruzada com `doc-inspecao` e `irata-n3`.

---

### 6. irata-n3 — Score 2 — EXPANDIR (alta prioridade)

**Diagnóstico:** THIN para skill safety-critical. Tem estrutura obrigatória (6 passos) e regras críticas, mas está no nível mínimo para o domínio.

**Falhas graves:**
- Sem não-escopo explícito.
- Sem output contract (o que o N3 entrega: APR revisada? checklist? relatório de inspeção?).
- Sem watchdog explícito.
- Sem seção "onde pode falhar".
- Sem templates (APR, PT, AF, plano de resgate).
- Sem referência às normas: NR-35, IRATA ICOP, NBRs aplicáveis estão mencionadas mas não mapeadas.
- Falta `risk_level` no frontmatter.

**Risco de deixar assim:** Safety-critical improvisado. Domínio de vida humana, falha de checklist pode matar.

**Recomendação:** EXPANDIR urgente — ao menos adicionar: output contract, não-escopo, watchdog, seção de falhas, e referência aos templates de campo.

---

### 7. fw-kant — Score 3 — MANTER

**Diagnóstico:** Concisa mas proporcional ao papel. 7 testes, 5 outputs, estilo definido. É um filtro — não precisa ser pesado.

**Falhas:**
- Sem watchdog (mas sendo um filtro, o watchdog é ele mesmo).
- Sem exemplos de edge cases.
- Falta `risk_level` no frontmatter.

**Recomendação:** MANTER por proporcionalidade. Score 3 para filtro simples é adequado. Adicionar `risk_level` ao frontmatter.

---

### 8. _firmware / core-lite-watchdog — Score 4 — MANTER

**Diagnóstico:** SKILL.md funciona como summary que aponta para `WATCHDOG.md`. Tem função, ativação, verificações, escalamento. Frontmatter tem campos não-padrão (`layer`, `activation`) que fazem sentido para firmware.

**Falhas:**
- Sem `domain` no frontmatter.
- WATCHDOG.md não foi auditado aqui (arquivo separado).

**Recomendação:** MANTER. Adicionar `domain: firmware` ao frontmatter para compatibilidade com scanner.

---

### 9. operator-lock — Score 3 — CORRIGIR

**Diagnóstico:** Conteúdo sólido. Dois modos bem documentados, checklist, sinais de suspeita, tabela por core, onde pode falhar.

**Falhas:**
- Frontmatter usa `when_to_use` em vez de `description` — diverge do padrão.
- Falta `status`, `priority`, `core_type`, `domain`, `risk_level` no frontmatter.
- O scanner reporta como tendo frontmatter mas com campos faltando.

**Recomendação:** CORRIGIR frontmatter para padrão do sistema.

---

### 10. cognitive-logistics — Score 2 — EXPANDIR

**Diagnóstico:** É infraestrutura transversal importante, mas o SKILL.md é um rótulo de sub-skills sem detalhe operacional.

**Falhas:**
- Sub-skills apenas listadas, sem: quando ativar cada uma, outputs, integração.
- Sem pipeline de ativação.
- Sem watchdog.
- Sem output contract.
- Falta `domain` e `risk_level` no frontmatter.
- Frase constitucional forte mas skill operacional fraca.

**Recomendação:** EXPANDIR — adicionar pipeline de quando ativar cada sub-skill, output contract mínimo por sub-skill.

---

### 11. cesto — Score 4 — MANTER

**Diagnóstico:** Bem estruturada. Tabela de roteamento, processo de 7 passos, saída padrão, integração com cognitive-logistics, patch normativo. 

**Falhas:**
- Falta `risk_level` no frontmatter.
- Sem watchdog local.

**Recomendação:** MANTER. Adicionar `risk_level`.

---

### 12. skill-router — Score 5 — MANTER

**Diagnóstico:** Melhor skill de roteamento. 5 camadas, mapa de domínios completo, firewalls, patches normativos, leitura dinâmica do diretório, protocolo de atualização. 

**Falhas:**
- Falta `domain` e `risk_level` no frontmatter.
- Tabela de sub-skills (CAMADA 2) pode ficar desatualizada com novas skills — mas o mecanismo de leitura dinâmica mitiga isso.

**Recomendação:** MANTER. Adicionar `domain` e `risk_level` ao frontmatter.

---

### 13. doc-inspecao — Score 5 — MANTER

**Diagnóstico:** Skill mais completa do sistema. Dois modos, pipeline de 9 passos, formato de resposta completo, 8 sub-skills, norm library inteira mapeada (39 normas, ~1.126 blocos), separação epistêmica explícita, onde pode falhar.

**Falhas:**
- Falta `risk_level` no frontmatter.
- Alerta de vigência API 570 (4th/2016 vs 5th/2024) — documentado mas não resolvido.

**Recomendação:** MANTER. Adicionar `risk_level`. Planejar atualização da API 570 para 5th Edition quando disponível.

---

### 14. core-intake — Score 4 — MANTER

**Diagnóstico:** Arquitetura clara de 5 níveis, 7 adapters, 3 registries, 7 políticas, gate de aprovação humana.

**Falhas:**
- Falta `risk_level` no frontmatter.
- Adapters e políticas referenciados como arquivos mas não auditados aqui.

**Recomendação:** MANTER. Adicionar `risk_level`.

---

### 15. lotofa — Score 4 — MANTER

**Diagnóstico:** Bem estruturada para laboratório estatístico. Princípio E/H claro, pipeline de 10 passos, regras obrigatórias, firewall declarado, onde pode falhar.

**Falhas:**
- `src/lotofa_core/` Python package existente não está referenciado no SKILL.md (P07 pendente do audit anterior).
- CLI disponível mas não documentada aqui.

**Recomendação:** MANTER. Executar P07 — documentar `src/lotofa_core/` e CLI no SKILL.md.

---

### 16. core-self-audit — Score 3 — CORRIGIR (alta prioridade)

**Diagnóstico:** Conteúdo excelente. Pipeline de 17 passos, 8 categorias de achado, regras constitucionais robustas. Mas SEM frontmatter.

**Falha crítica:**
- **Sem frontmatter YAML.** O skill-router lê frontmatter dinamicamente — skill sem frontmatter é invisível para o roteamento automático.

**Recomendação:** CORRIGIR imediatamente — adicionar frontmatter padrão.

---

### 17. context-mapper — Score 3 — CORRIGIR (alta prioridade)

**Diagnóstico:** Conteúdo sólido. Pipeline de 14 passos, 11 categorias de extração, regras de preservação, relações com HARVEST-CORE e VERSIONING. Mas SEM frontmatter.

**Falha crítica:**
- **Sem frontmatter YAML.** Mesma situação que `core-self-audit`.

**Recomendação:** CORRIGIR imediatamente — adicionar frontmatter padrão.

---

### 18. skill-auditor — Score 4 — MANTER

**Diagnóstico:** Recém instalada. Frontmatter completo, 5 modos, classificação, score, proporcionalidade, proibições, runtime helper. Falta campo de uso real para validar.

**Recomendação:** MANTER. Validar em campo nas próximas sessões.

---

### 19. capability-gap-router — Score 4 — MANTER

**Diagnóstico:** Recém instalada. Frontmatter completo, 10 tipos de lacuna, fluxo criação/adaptação, proibições, output contract. Falta campo de uso real.

**Recomendação:** MANTER. Validar em campo nas próximas sessões.

---

## PATCHES PROPOSTOS

### P-SA-01 | CRÍTICO | Adicionar frontmatter a core-self-audit e context-mapper

**Problema:** Duas skills transversais sem frontmatter — invisíveis para roteamento dinâmico do skill-router.  
**Custo:** baixo  
**Risco de não fazer:** alto — skill-router ignora automaticamente  
**Ação:** Adicionar bloco `---` frontmatter padrão em ambas.

### P-SA-02 | ALTA | Expandir irata-n3

**Problema:** Skill safety-critical com score 2 — thin para domínio de vida humana.  
**Custo:** médio  
**Risco de não fazer:** alto — improviso em safety-critical  
**Ação:** Adicionar output contract, não-escopo, watchdog, seção de falhas, referências a templates de campo (APR, PT, AF, plano de resgate).

### P-SA-03 | MÉDIA | Corrigir frontmatter operator-lock

**Problema:** Campos não-padrão no frontmatter — `when_to_use` em vez de `description`, faltam `status`, `priority`, `core_type`, `domain`, `risk_level`.  
**Custo:** baixo  
**Ação:** Reescrever bloco frontmatter.

### P-SA-04 | MÉDIA | Expandir cognitive-logistics

**Problema:** Score 2 — infraestrutura importante com SKILL.md de rótulo.  
**Custo:** médio  
**Ação:** Detalhar quando ativar cada sub-skill e output contract mínimo.

### P-SA-05 | MÉDIA | Expandir juridico

**Problema:** Score 3 — falta template de análise processual, watchdog, formato de lacuna.  
**Custo:** médio  
**Ação:** Adicionar template de análise jurídica e corrigir `name` no frontmatter.

### P-SA-06 | MÉDIA | Expandir inspecao-end

**Problema:** Sub-skills não listadas no próprio SKILL.md, sem output contract.  
**Custo:** médio  
**Ação:** Listar sub-skills disponíveis, adicionar output contract, referência cruzada.

### P-SA-07 | BAIXA | Adicionar risk_level e domain faltantes

**Problema:** fw-core, asset-core, simb-core, fw-kant, cesto, skill-router, doc-inspecao, core-intake, lotofa, _firmware todos faltam `risk_level` ou `domain`.  
**Custo:** baixo  
**Ação:** Passagem rápida adicionando campos faltantes.

### P-SA-08 | BAIXA | Documentar src/lotofa_core/ em lotofa SKILL.md (P07)

**Problema:** Package Python operacional não referenciado na skill.  
**Custo:** baixo  
**Ação:** Adicionar seção de runtime no lotofa SKILL.md.

---

## RESUMO EXECUTIVO

**Skills prontas para uso sem ação imediata (score 4–5):** fw-core, asset-core, simb-core, cesto, skill-router, doc-inspecao, core-intake, lotofa, _firmware, skill-auditor, capability-gap-router — 11 de 19.

**Ação mais urgente:** P-SA-01 (frontmatter em core-self-audit e context-mapper) + P-SA-02 (irata-n3 safety-critical thin).

**Sistema geral:** Arquitetura sólida. Os dois gaps mais graves são estruturais (frontmatter ausente) e de proporcionalidade (irata-n3 thin). Não há skill que deva ser arquivada ou dividida. Não há redundância funcional relevante detectada.

**Próxima ação mínima recomendada:** Operador aprova P-SA-01 → Claude aplica (baixo custo, alto impacto). Depois, planejar P-SA-02 para irata-n3.
