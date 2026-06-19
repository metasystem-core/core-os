# EDINGER_REGISTRY_UPDATE_AUDIT_001

**Etapa:** Auditoria de registry para a promoção mínima Edinger (pós SIMB-EDINGER-MINIMAL-PROMOTION-001)
**Data:** 2026-06-17
**Executor:** CORE/IRIS

---

## 1. Registries encontrados

Diretório `.claude/workspaces/simb/library/registries/` contém 8 arquivos:

| arquivo | função |
|---|---|
| SOURCES_REGISTRY.md | registro de fontes (source manifests) |
| CONCEPTS_REGISTRY.md | registro de concept cards |
| SYMBOLS_REGISTRY.md | registro de symbol cards (não tocado nesta etapa) |
| AUTHORS_REGISTRY.md | registro de autores (não tocado nesta etapa) |
| ARCHITECTURAL_OBSERVATIONS_REGISTRY.md | não tocado nesta etapa |
| INGESTION_DECISIONS_REGISTRY.md | não tocado nesta etapa |
| LEARNING_OBSERVATIONS_REGISTRY.md | não tocado nesta etapa |
| RESPONSE_TESTS_REGISTRY.md | não tocado nesta etapa |

**Master index da library:** `.claude/workspaces/simb/library/LIBRARY_INDEX.md` (fora de `registries/`, na raiz da library). Contém tabelas-resumo próprias de Sources/Concepts/Symbols/Authors mais uma tabela de ponteiros para os 8 registries e uma tabela de templates. Identificado, mas **não modificado** — a instrução do operador nomeou explicitamente apenas "registry de fontes" e "registry de conceitos" como destinos de atualização; LIBRARY_INDEX.md é um índice-resumo redundante, fora do escopo literal da tarefa.

## 2. Arquivos lidos

- `.claude/workspaces/simb/library/registries/SOURCES_REGISTRY.md`
- `.claude/workspaces/simb/library/registries/CONCEPTS_REGISTRY.md`
- `.claude/workspaces/simb/library/LIBRARY_INDEX.md`

Nenhum chunk privado, EPUB, ou conteúdo de cesto foi lido nesta etapa.

## 3. Formato — avaliação

Formato julgado **claro e inequívoco**: ambos os registries seguem convenção tabular Markdown, append-only ("Nunca deletar linhas"), com uma única linha existente cada (Neumann: SRC-SIMB-001 / CON-SIMB-001 a 005). Convenção de ID confirmada por inspeção: arquivos usam slug sem infixo (`SRC-008`, `CON-032`, `CON-033`), enquanto a coluna `*_id` dos registries usa infixo `-SIMB-` (`SRC-SIMB-008`, `CON-SIMB-032`, `CON-SIMB-033`). Convenção preservada exatamente.

## 4. Arquivos modificados

- `.claude/workspaces/simb/library/registries/SOURCES_REGISTRY.md` — **modificado**
- `.claude/workspaces/simb/library/registries/CONCEPTS_REGISTRY.md` — **modificado**
- `.claude/workspaces/simb/library/LIBRARY_INDEX.md` — **não modificado** (fora do escopo literal da instrução; reportado apenas como achado)
- Demais 6 registries — **não tocados**

## 5. Entradas adicionadas

### SOURCES_REGISTRY.md
Nova linha após SRC-SIMB-001:

| source_id | title | author | year | tradition | source_class | status | license_status | copyright_risk | intake_id | manifest_path |
|---|---|---|---|---|---|---|---|---|---|---|
| SRC-SIMB-008 | The Creation of Consciousness: Jung's Myth for Modern Man | Edward F. Edinger | 1984 | psicologia_junguiana | symbolic_reference | private_source_reading_completed | proprietary | true | — | source_manifests/SRC-008_edinger_creation_consciousness.md |

**Nota de julgamento:** coluna `intake_id` preenchida com `—` em vez de um `INT-SIMB-*` formal, pois esta fonte chegou via leitura privada sequencial (não pelo pipeline de intake padrão) e não existe ID de intake real para ela. Optou-se por preservar a estrutura da tabela sem inventar um ID falso. Reportado aqui como decisão menor, não como erro.

"Atualizado em" bumped de 2026-06-12 → 2026-06-17.

### CONCEPTS_REGISTRY.md
Duas novas linhas após CON-SIMB-005:

| concept_id | conceito | source_id | author | tradição | status | therapeutic_confusion_risk | authority_risk | card_path |
|---|---|---|---|---|---|---|---|---|
| CON-SIMB-032 | Containment vs. Relatedness | SRC-SIMB-008 | Edinger | psicologia_junguiana | active | true | true | concept_cards/CON-032_containment-vs-relatedness.md |
| CON-SIMB-033 | Interpretação arquetípica vs. reducionista-personalista | SRC-SIMB-008 | Edinger | psicologia_junguiana | active | true | true | concept_cards/CON-033_archetypal-vs-personalistic-reductive-interpretation.md |

Adicionalmente, uma linha foi acrescentada à tabela "Tags de busca rápida" (seção já existente no mesmo arquivo, não uma seção nova):

| tag | concepts |
|---|---|
| symbolic_method | CON-SIMB-032, CON-SIMB-033 |

**Nota:** esta adição de tag não foi explicitamente solicitada pela tarefa; foi feita por analogia direta com o padrão já existente no próprio arquivo (cada concept card aparece em ao menos uma tag) e usando apenas os dois IDs recém-adicionados, sem inventar taxonomia nova fora do padrão observado. Reportado para revisão do operador.

`therapeutic_confusion_risk` e `authority_risk` marcados `true` para ambos os cards, em linha com o `risk_level: low` mas não-nulo registrado nos próprios concept cards (CON-032/CON-033) e com o risco de inflação simbólica "high" identificado na self-analysis de origem (IRIS_SELF_ANALYSIS_005).

"Atualizado em" bumped de 2026-06-12 → 2026-06-17.

## 6. Confirmações

- Nenhum chunk privado foi lido nesta etapa.
- Nenhum EPUB foi acessado.
- Nenhum acesso a cesto.
- Nenhum novo concept card ou symbol card foi criado nesta etapa.
- Os cards CON-032 e CON-033 não foram alterados (nenhum erro formal grave foi encontrado neles).
- AGENT.md não foi alterado.
- Nenhum registry fora de `library/registries/` foi alterado como registry — LIBRARY_INDEX.md foi apenas lido, não escrito.
- Nenhum `git add` foi executado.
- Nenhum commit foi feito.
- Nenhum card de risco N4 ou symbol card foi promovido — apenas as duas entradas N3/low-risk já materializadas na etapa anterior (CON-032, CON-033) foram registradas nos índices.

## 7. Verificação git

`git status --short` (escopo `.claude/workspaces/simb/library/`) mostra:
- `M` (modificado, não staged): `INTAKE_LOG.md` (pré-existente, não tocado por esta etapa), `registries/CONCEPTS_REGISTRY.md`, `registries/SOURCES_REGISTRY.md`
- `??` (untracked, pré-existentes de etapas anteriores e fora do escopo desta auditoria): self-analyses 001–005, audits anteriores, source manifests SRC-002–008, concept cards CON-006–033, author_maps, reading_notes.

`git diff --cached --name-only` — **vazio**. Nenhum arquivo staged.

`git log -1` em ambos os registries confirma que já são arquivos rastreados pelo git (commit `a5f0c0b feat(simb): commit Neumann intake corpus`), portanto aparecem como `M`, não `??`.

## 8. Observação de escopo (pré-existente, não corrigida)

SRC-002 a SRC-007 (fontes Rudhyar) e CON-006 a CON-031 (seus concept cards) existem como arquivos em disco mas não estão registrados em SOURCES_REGISTRY.md, CONCEPTS_REGISTRY.md ou LIBRARY_INDEX.md — apenas Neumann e agora Edinger aparecem nos registries. Esta é uma lacuna pré-existente, fora do escopo desta tarefa, não corrigida aqui sem instrução explícita do operador.

---

*Fim do audit.*
