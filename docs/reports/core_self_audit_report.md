# CORE-SELF-AUDIT REPORT

## 1. Escopo da auditoria

**Data:** 2026-06-08  
**Responsável:** CORE-SELF-AUDIT (Claude Code, modo primário)  
**Modo:** auditoria estrutural completa  
**Pastas/arquivos auditados:** raiz completa do repo (3816 arquivos, 2.1 GB)

---

## 2. Estado geral do sistema

**Classificação: funcional com sinais de acúmulo**

O núcleo operacional (`.claude/skills/`) está sólido e coerente. As skills principais têm SKILL.md, firewalls declarados, e separação de domínio. O firmware funciona. Os dados privados estão majoritariamente bem protegidos.

Problemas reais:
- A **raiz do repo acumulou lixo de trabalho** que não tem lugar definido.
- Há um **worktree abandonado** com dezenas de arquivos duplicados.
- `cesto/processo das tias/` está **exposto sem gitignore** — risco jurídico concreto.
- `core_registry.json` foi deletado — manifesto central missing.
- `_staging/` se tornou um segundo repositório paralelo não integrado.

O sistema não está crítico. Está **pesado e com entropia acumulada** — situação normal após ciclos intensos de desenvolvimento. Limpeza controlada resolve 80% em 1-2 sessões.

---

## 3. Achados principais

| ID | Categoria | Prioridade | Custo | Risco | Descrição |
|---|---|---|---|---|---|
| A1 | RISCO_DETECTADO | crítica | baixo | crítico | `cesto/processo das tias/` sem gitignore |
| A2 | RISCO_DETECTADO | alta | baixo | alto | `core_registry.json` deletado |
| B1 | MELHORIA_NECESSARIA | alta | baixo | médio | Worktree abandonado com ~100+ arquivos duplicados |
| B2 | MELHORIA_NECESSARIA | alta | médio | médio | `_staging/` não integrado — é um repo paralelo |
| C1 | MELHORIA_NECESSARIA | média | baixo | baixo | Raiz poluída com lixo de trabalho |
| C2 | MELHORIA_NECESSARIA | média | baixo | baixo | `.gitignore` com lacunas |
| D1 | DUPLICACAO | média | baixo | baixo | `manifest.json` vs `manifest_v2.json` em asset-core |
| D2 | DUPLICACAO | baixa | baixo | baixo | `manifest_deprecated.json` em fw-core e juridico |
| E1 | LACUNA | média | baixo | baixo | `src/lotofa_core/` não documentado em SKILL.md |
| E2 | LACUNA | média | baixo | baixo | `core-self-audit` sem manifest.json |
| E3 | LACUNA | baixa | baixo | baixo | Maioria das skills sem local-watchdog |
| E4 | LACUNA | baixa | baixo | baixo | Sem changelog global do sistema |
| F1 | RISCO_DETECTADO | baixa | baixo | baixo | `src/__pycache__/` no repo sem gitignore |

---

## 4. Melhorias necessárias

| Item | Evidência | Impacto | Risco se não fizer | Ação recomendada | Critério de sucesso |
|---|---|---|---|---|---|
| A1: cesto/processo das tias sem gitignore | Arquivos de processo real + `_dados/ESTRATEGIA.md` no cesto, sem entrada no .gitignore | Se repo for publicado ou compartilhado, estratégia jurídica fica exposta | Exposição de dado jurídico sensível | Adicionar `cesto/processo das tias/` ao .gitignore E mover conteúdo para `.claude/data/juridico/` | Arquivos não rastreados pelo git, acessíveis apenas localmente |
| A2: core_registry.json deletado | `D core_registry.json` no git status | Sistema sem catálogo central de cores — perda de rastreabilidade | Futuras sessões sem mapeamento de cores disponíveis | Verificar se foi substituído por outro mecanismo; se não, recriar | Catálogo central existente e atualizado |
| B1: worktree abandonado | `.claude/worktrees/infallible-mayer-928950/` com 7+ SKILL.md e conteúdo EN duplicado | Confusão de contexto, custo de indexação, SKILL.md duplicados inflam contagem | Acumulação contínua | Verificar se worktree pode ser removido; se sim, limpar via `git worktree remove` | Nenhum worktree ativo com conteúdo duplicado |
| B2: _staging paralelo | `_staging/` tem SKILL.md próprio, CORE_OS_MANIFEST.md próprio, hierarquia `.claude/` própria com `cognitive_logistics_extract/` não instalado | Conteúdo instalável pendente há tempo indefinido | Perda de melhorias que ficaram em staging | Fazer triagem: instalar o que está pendente, arquivar o resto | `_staging/` vazio ou apenas com pacotes claramente marcados como pendentes |

---

## 5. Melhorias recomendadas

**C1 — Raiz poluída**

Arquivos sem lugar definido na raiz: `feedbackgpt.md`, `para_gpt/`, `para_gpt.zip`, `outputs/`, `_audit_unpack/`, `CORE_OS_SELF_AUDIT_PACK.zip`, `core_os_norm_module_patch.zip`.

Ação: mover `feedbackgpt.md` para `_historico/` ou `.claude/data/`; mover `para_gpt/` e `para_gpt.zip` para `_historico/`; mover `outputs/` para `_historico/` ou arquivar; deletar `_audit_unpack/` e os `.zip` já instalados após confirmação.

**C2 — Lacunas no .gitignore**

Ausentes: `cesto/processo das tias/`, `src/__pycache__/`, `_audit_unpack/`, `outputs/`, `*.pyc`.

**D1 — manifest.json vs manifest_v2.json no asset-core**

Verificar se `manifest.json` está obsoleto. Se sim, renomear `manifest_v2.json` para `manifest.json` e arquivar o antigo.

---

## 6. Melhorias opcionais

- Criar local-watchdog para skills que não têm: `fw-core`, `cognitive-logistics`, `core-intake`, `cesto`, `inspecao-end`, `irata-n3`, `doc-inspecao`.
- Criar `manifest.json` canônico para `core-self-audit`.
- Criar changelog global do sistema (uma linha por versão/evento relevante).
- Documentar `src/lotofa_core/` no `SKILL.md` do lotofa com seção "Runtime CLI".

---

## 7. Duplicações detectadas

| Item A | Item B | Diferença real? | Recomendação |
|---|---|---|---|
| `.claude/skills/` SKILL.md (15 operacionais) | `pt/05_skills/` + `en/05_skills/` (14 arquivos) | SIM — operacional vs versão pública release | NAO_MEXER — são camadas distintas por design |
| `asset-core/manifest.json` | `asset-core/manifest_v2.json` | Provável — v2 substitui v1 | Verificar e consolidar se v1 está obsoleto |
| `.claude/worktrees/infallible-mayer-928950/en/05_skills/` | `en/05_skills/` | NÃO — cópia de worktree | Worktree deve ser removido |
| `fw-core/manifest.json` | `fw-core/manifest_deprecated.json` | NÃO — deprecated explícito | Mover deprecated para `_archive/` |
| `_historico/zip_extracts/` | `.claude/norm_library/` | Provavelmente — conteúdo já processado e integrado | Verificar; se sim, arquivar ou deletar os ZIPs brutos |
| `_staging/norm_patch_extract/.claude/` | `.claude/norm_library/` | Possivelmente — patch não instalado | Triagem: instalar ou arquivar |

---

## 8. Lacunas reais

1. **`core_registry.json` deletado** — sem catálogo central de cores ativo.
2. **`src/lotofa_core/`** existe como pacote Python funcional mas o `SKILL.md` do lotofa não documenta isso — usuário não sabe que pode rodar CLI.
3. **`_staging/cognitive_logistics_extract/`** — conteúdo de skill (cognitive-logistics) que pode ser uma versão mais atualizada da skill, não comparado com a versão instalada em `.claude/skills/cognitive-logistics/`.
4. **Lifecycle do `cesto/`** não definido — arquivos entram mas não há protocolo de saída automático após processamento.
5. **Nenhum `core-self-audit` manifest.json** — skill instalada sem manifesto de skill.

---

## 9. Skills candidatas a código

| Skill | Por que virar código | Módulo sugerido | Prioridade |
|---|---|---|---|
| `lotofa` | FEITO — `src/lotofa_core/` existe. Pendente: documentação no SKILL.md | CLI já existe | alta (documentar) |
| `cognitive-logistics` | output_compression_protocol e friction_budget são lógica, não texto | módulo Python de scoring/routing | baixa |
| `core-self-audit` | scanner.py já existe; classificação de achados poderia ser automatizada | extender scanner | média |

---

## 10. Skills candidatas a template

- `core-intake`: o manifest gerado por cada intake poderia ter template canônico — já existe `intake_manifest_schema.yaml`.
- `juridico`: peças processuais recorrentes (contestação, recurso) poderiam ser templates.

---

## 11. Skills candidatas a arquivamento

- `operator-lock` — SKILL.md existe mas na listagem do sistema aparece como "---" (standby/migrado para firmware). Candidato a `_archive/`.
- `_staging/SKILL.md` — SKILL.md na raiz do staging sem função clara.
- `fw-core/manifest_deprecated.json` e `juridico/manifest_deprecated.json` — mover para `_archive/`.

---

## 12. Riscos de custo/crédito

- **`_staging/cognitive_logistics_extract/`**: se esse conteúdo for uma versão atualizada da skill, processar via Claude para comparar e decidir — custo médio mas único.
- **`_historico/zip_extracts/`**: conteúdo de normas API já processadas — se Claude precisar rever esses ZIPs, custo alto. Manter apenas o que está em `.claude/norm_library/`.
- **Sem MockProvider em nenhuma skill** — qualquer teste de skill consome Claude. Risco de custo alto para testes repetitivos.
- **`src/lotofa_core/` com CLI e backtest** — tudo offline. Bom.

---

## 13. Riscos de privacidade

| Risco | Arquivo | Severidade | Mitigação |
|---|---|---|---|
| Processo judicial real + estratégia | `cesto/processo das tias/_dados/ESTRATEGIA.md` | CRÍTICO | Adicionar ao .gitignore imediatamente |
| Carteira real (FII docs, decisões) | `.claude/data/carteira/` | BAIXO | Já está no .gitignore ✓ |
| Normas privadas/licenciadas | `.claude/norm_library/raw/private_authorized/` | BAIXO | Já está no .gitignore ✓ |
| Script de análise da carteira | `_staging/analise_carteira.py` | MÉDIO | Verificar se acessa dados reais; adicionar ao .gitignore |

---

## 14. Riscos de usabilidade

- **`_staging/` opaco**: qualquer colaborador (ou Claude em nova sessão) olha `_staging/` e não sabe o que está pendente vs já integrado vs descartado.
- **Raiz poluída**: `feedbackgpt.md`, `para_gpt/`, `outputs/` na raiz criam ruído para qualquer tool que leia o repo.
- **`core_registry.json` deletado**: se alguma skill ou prompt referencia esse arquivo, quebra silenciosamente.

---

## 15. Conflitos constitucionais

Nenhum detectado no núcleo operacional. O firmware, firewalls e hierarquia de decisão estão coerentes.

Atenção potencial:
- `_staging/CORE_OS_MANIFEST.md` e `_staging/SKILL.md` criam um "segundo sistema" que pode conflitar com o manifesto soberano se Claude ler `_staging/` como parte do sistema operacional.

---

## 16. Propostas de patch

| Patch | Arquivos afetados | Custo | Risco | Precisa Claude Code? |
|---|---|---|---|---|
| P01: Adicionar cesto/processo das tias ao .gitignore | `.gitignore` | baixo | baixo | sim |
| P02: Remover worktree abandonado | `.claude/worktrees/infallible-mayer-928950/` | baixo | baixo | sim (`git worktree remove`) |
| P03: Limpar raiz (mover lixo de trabalho) | `feedbackgpt.md`, `para_gpt/`, `outputs/`, `_audit_unpack/`, zips | baixo | baixo | sim |
| P04: Complementar .gitignore | `.gitignore` | baixo | baixo | sim |
| P05: Triagem de `_staging/` | `_staging/` inteiro | médio | médio | sim + operador decide |
| P06: Recriar ou mapear substituto de core_registry.json | `core_registry.json` | médio | baixo | sim |
| P07: Documentar src/lotofa_core no SKILL.md do lotofa | `.claude/skills/lotofa/SKILL.md` | baixo | baixo | sim |

---

## 17. O que NÃO mexer

- `.claude/skills/` — estrutura operacional funcionando.
- `.claude/norm_library/raw/private_authorized/` — normas técnicas corretamente segregadas e gitignored.
- `.claude/data/` — dados do operador, corretamente gitignored.
- `src/lotofa_core/` — código funcional, não mexer sem QA.
- `pt/` e `en/` — versão pública do sistema (release v0.1) — separação intencional.
- `fw-core/layers/` e `fw-core/sub/` — arquitetura estabelecida.
- `_firmware/WATCHDOG.md` — camada 0, não mexer.

---

## 18. Próxima ação mínima

**Patch P01 — imediato, baixo risco:**
```
Adicionar ao .gitignore:
cesto/processo das tias/
_staging/analise_carteira.py
src/__pycache__/
*.pyc
_audit_unpack/
outputs/
```

Isso resolve o risco de privacidade mais crítico sem tocar em nada estrutural.

**Patch P02 — próxima sessão:**
```
git worktree list
git worktree remove .claude/worktrees/infallible-mayer-928950
```

**Patch P03 — depois do P02:**
Limpar raiz movendo `feedbackgpt.md`, `para_gpt/`, `para_gpt.zip`, `outputs/` para `_historico/`.

**Triagem de `_staging/` (P05) — sessão dedicada, operador decide:**
Itens identificados como pendentes de decisão:
- `_staging/cognitive_logistics_extract/` — instalar ou arquivar?
- `_staging/norm_patch_extract/` — instalar subskills do doc-inspecao ou arquivar?
- `_staging/petrobras_ingest/` — tudo já foi integrado ao norm_library?
