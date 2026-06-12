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

## Templates

| template | versão | descrição | caminho |
|---|---|---|---|
| CONCEPT_CARD_TEMPLATE | v2.0 (SIMB-LIBRARY-003A) | Template de card de conceito com Neumann Runtime Grammar | `CONCEPT_CARD_TEMPLATE.md` |
| SYMBOL_CARD_TEMPLATE | v2.0 (SIMB-LIBRARY-003A) | Template de card de símbolo com Neumann Runtime Grammar | `SYMBOL_CARD_TEMPLATE.md` |
| CARD_SCHEMA_NOTES | v1.0 | Documentação dos campos dos templates v2.0 | `CARD_SCHEMA_NOTES.md` |

---

## Batch Rudhyar — adicionado 2026-06-12

### Sources

| source_id | title | author | tradition | source_class | status | risk_flags | manifest_path |
|---|---|---|---|---|---|---|---|
| SRC-SIMB-002 | A Prática da Astrologia | Dane Rudhyar | astrologia_humanista | symbolic_reference | manifest_only | copyright, mysticism_overreach | source_manifests/SRC-002_rudhyar_pratica-astrologia.md |
| SRC-SIMB-003 | As Casas Astrológicas (PT) | Dane Rudhyar | astrologia_humanista | symbolic_reference | manifest_only+concept_extraction | copyright, authority_over_operator | source_manifests/SRC-003_rudhyar_casas-astrologicas-pt.md |
| SRC-SIMB-004 | Astrology for New Minds | Dane Rudhyar | astrologia_humanista | symbolic_reference | manifest_only | copyright, mysticism_overreach, low_source_quality | source_manifests/SRC-004_rudhyar_astrology-new-minds.md |
| SRC-SIMB-005 | Astrology of Transformation | Dane Rudhyar | astrologia_humanista | symbolic_reference | manifest_only+concept_extraction | copyright, mysticism_overreach, authority_over_operator | source_manifests/SRC-005_rudhyar_astrology-of-transformation.md |
| SRC-SIMB-006 | The Astrological Houses (EN) | Dane Rudhyar | astrologia_humanista | symbolic_reference | manifest_only | copyright, authority_over_operator | source_manifests/SRC-006_rudhyar_astrological-houses-en.md |
| SRC-SIMB-007 | The Planetarization of Consciousness | Dane Rudhyar | astrologia_humanista | symbolic_reference | manifest_only | copyright, mysticism_overreach_HIGH, outdated_model | source_manifests/SRC-007_rudhyar_planetarization-of-consciousness.md |

### Author Maps

| author_id | name | tradition | sources_count | path |
|---|---|---|---|---|
| AUT-SIMB-002 | Dane Rudhyar | astrologia_humanista | 6 | author_maps/AUT-002_rudhyar.md |

### Concept Cards — batch Rudhyar

| concept_id | name | sources | tradição | path |
|---|---|---|---|---|
| CON-SIMB-006 | Casas como Campos de Experiência | SRC-003, SRC-006 | astrologia_humanista | concept_cards/CON-006_casas-como-campos-de-experiencia.md |
| CON-SIMB-007 | Quatro Níveis de Experiência (Rudhyar) | SRC-005 | astrologia_humanista | concept_cards/CON-007_quatro-niveis-experiencia-rudhyar.md |
| CON-SIMB-008 | Progressões vs Transits | SRC-005 | astrologia_humanista | concept_cards/CON-008_progressoes-vs-transits.md |
