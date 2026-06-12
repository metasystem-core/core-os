# LIBRARY_INDEX
## Índice da Biblioteca Simbólica — SIMB-CORE

**Workspace:** `.claude/workspaces/simb/library/`
**Criado em:** SIMB-LIBRARY-001 (2026-06-12)
**Atualizado em:** 2026-06-12 — INT-SIMB-20260612-001

---

> Este índice é derivado — append-only. Nunca deletar linhas.
> Fonte primária de detalhes: manifestos em `source_manifests/`.

---

## Sources

| source_id | title | author | tradition | source_class | status | risk_flags | manifest_path |
|---|---|---|---|---|---|---|---|
| SRC-SIMB-001 | The Origins and History of Consciousness | Erich Neumann | psicologia_junguiana | symbolic_reference | concept_cards_created | copyright, therapeutic_confusion, authority_over_operator, outdated_model | source_manifests/SRC-001_neumann_origens-historia-consciencia.md |

---

## Concepts

| concept_id | conceito | source_id | status | card_path |
|---|---|---|---|---|
| CON-SIMB-001 | Uroboros | SRC-SIMB-001 | active | concept_cards/CON-001_uroboros.md |
| CON-SIMB-002 | Grande Mãe | SRC-SIMB-001 | active | concept_cards/CON-002_grande-mae.md |
| CON-SIMB-003 | Mito do Herói | SRC-SIMB-001 | active | concept_cards/CON-003_mito-do-heroi.md |
| CON-SIMB-004 | Centroversão | SRC-SIMB-001 | active | concept_cards/CON-004_centroversao.md |
| CON-SIMB-005 | Separação dos Sistemas | SRC-SIMB-001 | active | concept_cards/CON-005_separacao-dos-sistemas.md |

---

## Symbols

| symbol_id | símbolo | temas | source_refs | status | card_path |
|---|---|---|---|---|---|
| SYM-SIMB-001 | Uroboros | indiferenciação, ciclo, fusão, regressão | SRC-SIMB-001 | active | symbol_cards/SYM-001_uroboros.md |
| SYM-SIMB-002 | Dragão | resistência, guardião, confronto, limiar | SRC-SIMB-001 | active | symbol_cards/SYM-002_dragao.md |
| SYM-SIMB-003 | Tesouro Difícil de Alcançar | meta, anima, completude, busca | SRC-SIMB-001 | active | symbol_cards/SYM-003_tesouro-dificil-de-alcancar.md |

---

## Authors

| author_id | autor | tradição | source_refs | map_path |
|---|---|---|---|---|
| AUT-SIMB-001 | Erich Neumann | psicologia_junguiana | SRC-SIMB-001 | author_maps/AUT-001_neumann.md |

---

*Entradas são adicionadas a cada intake completo de nova fonte.*
*Formato de IDs: SRC-SIMB-NNN, CON-SIMB-NNN, SYM-SIMB-NNN, AUT-SIMB-NNN*

---

## Registries

Índices detalhados com rastreabilidade operacional — complementam as tabelas acima.

| registry | escopo | caminho |
|---|---|---|
| SOURCES_REGISTRY | fontes + metadados de intake | `registries/SOURCES_REGISTRY.md` |
| CONCEPTS_REGISTRY | concept cards + tags temáticas | `registries/CONCEPTS_REGISTRY.md` |
| SYMBOLS_REGISTRY | symbol cards + morfologias oníricas | `registries/SYMBOLS_REGISTRY.md` |
| AUTHORS_REGISTRY | autores ingeridos e pendentes | `registries/AUTHORS_REGISTRY.md` |
| RESPONSE_TESTS_REGISTRY | testes de fidelidade SIMB | `registries/RESPONSE_TESTS_REGISTRY.md` |
| INGESTION_DECISIONS_REGISTRY | decisões e justificativas de intake | `registries/INGESTION_DECISIONS_REGISTRY.md` |
| LEARNING_OBSERVATIONS_REGISTRY | observações de aprendizado (modo primário) | `registries/LEARNING_OBSERVATIONS_REGISTRY.md` |
| ARCHITECTURAL_OBSERVATIONS_REGISTRY | memória de design (patches via Claude Code) | `registries/ARCHITECTURAL_OBSERVATIONS_REGISTRY.md` |

*Atualizado em: 2026-06-12*
