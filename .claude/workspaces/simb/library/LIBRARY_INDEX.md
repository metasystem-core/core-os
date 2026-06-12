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
| SOURCE_EVALUATION_TEMPLATE | v1.0 (SIMB-SOURCE-GOVERNANCE-001) | Formulário de avaliação de fonte (N0–N5) | `SOURCE_EVALUATION_TEMPLATE.md` |

---

## Governance de Fontes (SIMB-SOURCE-GOVERNANCE-001)

| política | função | caminho |
|---|---|---|
| SOURCE_WEIGHTING_POLICY | Régua N0–N5 — peso e destino de fontes | `SOURCE_WEIGHTING_POLICY.md` |
| SELF_ANALYSIS_TRIGGER_POLICY | Quando criar / não criar IRIS_SELF_ANALYSIS | `SELF_ANALYSIS_TRIGGER_POLICY.md` |
| SOURCE_EVALUATION_TEMPLATE | Formulário de avaliação individual de fonte | `SOURCE_EVALUATION_TEMPLATE.md` |
| IRIS_SELF_ANALYSIS_INDEX | Índice de todas as auto-análises + candidatos futuros | `evolution/IRIS_SELF_ANALYSIS_INDEX.md` |

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

| concept_id | name | sources | tradição | status | card_path |
|---|---|---|---|---|
| CON-SIMB-006 | Polo Norte/Sul do Mapa Natal | SRC-SIMB-003, SRC-SIMB-005 | astrologia_humanista | active | concept_cards/CON-006_polo-norte-sul.md |
| CON-SIMB-007 | Casas como Campos de Experiência | SRC-SIMB-003, SRC-SIMB-006 | astrologia_humanista | active | concept_cards/CON-007_casas-como-campos.md |
| CON-SIMB-008 | Ciclo de Saturno | SRC-SIMB-002, SRC-SIMB-005 | astrologia_humanista | active | concept_cards/CON-008_ciclo-saturno.md |
| CON-SIMB-009 | Quatro Níveis de Experiência | SRC-SIMB-005 | astrologia_humanista | active | concept_cards/CON-009_quatro-niveis.md |
| CON-SIMB-010 | Yang Way e Yin Way | SRC-SIMB-005 | astrologia_humanista | active | concept_cards/CON-010_yang-yin-way.md |
| CON-SIMB-011 | Signo vs. Símbolo | SRC-SIMB-005 | astrologia_humanista | active | concept_cards/CON-011_signo-vs-simbolo.md |
| CON-SIMB-012 | Alquimia do Significado | SRC-SIMB-005 | astrologia_humanista | active | concept_cards/CON-012_alquimia-significado.md |
| CON-SIMB-013 | Metamorfose Planetária | SRC-SIMB-003 | astrologia_humanista | active | concept_cards/CON-013_metamorfose-planetaria.md |
| CON-SIMB-014 | Maré Solar | SRC-SIMB-002 | astrologia_humanista | active | concept_cards/CON-014_mare-solar.md |
| CON-SIMB-015 | Gestalt do Mapa | SRC-SIMB-002 | astrologia_humanista | active | concept_cards/CON-015_gestalt-do-mapa.md |
| CON-SIMB-016 | Aspecto como Fase de Ciclo | SRC-SIMB-002 | astrologia_humanista | active | concept_cards/CON-016_aspecto-como-fase-de-ciclo.md |
| CON-SIMB-017 | Limites da Predição | SRC-SIMB-002 | astrologia_humanista | active | concept_cards/CON-017_limites-da-predicao.md |
| CON-SIMB-018 | Tríade Natal/Trânsitos/Progressões | SRC-SIMB-002 | astrologia_humanista | active | concept_cards/CON-018_triada-natal-transitos-progressoes.md |
| CON-SIMB-019 | Horária como Mediação Responsável | SRC-SIMB-002 | astrologia_humanista | active | concept_cards/CON-019_horaria-como-mediacao.md |
| CON-SIMB-020 | Ciclo Precessional como Quadro | SRC-SIMB-002 | astrologia_humanista | active | concept_cards/CON-020_ciclo-precessional-como-quadro.md |

### Self-Analysis Documents

| doc_id | title | sources | data | path |
|---|---|---|---|---|
| SA-001 | IRIS_SELF_ANALYSIS_001 | SRC-SIMB-001 (Neumann) | 2026-06-12 | IRIS_SELF_ANALYSIS_001.md |
| SA-002 | IRIS_SELF_ANALYSIS_002 | SRC-SIMB-005 (AoT) | 2026-06-12 | IRIS_SELF_ANALYSIS_002.md |
| SA-003 | IRIS_SELF_ANALYSIS_003 | SRC-SIMB-002 (Prática) + SRC-SIMB-003 (Casas) | 2026-06-12 | IRIS_SELF_ANALYSIS_003.md |

### Reading Notes

| rn_id | título | source_id | data | path |
|---|---|---|---|---|
| RN-20260612-001 | RN — Astrology of Transformation | SRC-SIMB-005 | 2026-06-12 | reading_notes/RN-20260612_rudhyar_astrology-of-transformation.md |
| RN-20260612-002 | RN — As Casas Astrológicas | SRC-SIMB-003 | 2026-06-12 | reading_notes/RN-20260612_rudhyar_casas-astrologicas.md |
| RN-20260612-003 | RN — A Prática da Astrologia | SRC-SIMB-002 | 2026-06-12 | reading_notes/RN-20260612_rudhyar_pratica-astrologia.md |

---

*Atualizado: 2026-06-12 — leituras SOURCE-FIRST: AoT, Casas, Prática completas*  
*Status SRC-002 corrigido para: source_first_complete*  
*Status SRC-003 corrigido para: source_first_complete*  
*Status SRC-005 corrigido para: source_first_complete*

### Planetarization of Consciousness — CON-021 a CON-031

| con_id | título | source_id | tradition | status | path |
|---|---|---|---|---|---|
| CON-SIMB-021 | Seed-Man (Homem-Semente) | SRC-SIMB-007 | filosofia_humanista | active | concept_cards/CON-021_seed-man-homem-semente.md |
| CON-SIMB-022 | Ego vs. Self (Distinção Operacional) | SRC-SIMB-007 | filosofia_humanista | active | concept_cards/CON-022_ego-vs-self-distino-operacional.md |
| CON-SIMB-023 | Ideity (Qualidade Única Insubstituível) | SRC-SIMB-007 | filosofia_humanista | active | concept_cards/CON-023_ideity-qualidade-nica-insubstituvel.md |
| CON-SIMB-024 | Dialética Tribal→Individual→Planetário | SRC-SIMB-007 | filosofia_humanista | active | concept_cards/CON-024_dialtica-tribalindividualplanetrio.md |
| CON-SIMB-025 | Consciência Eônica | SRC-SIMB-007 | filosofia_humanista | active | concept_cards/CON-025_conscincia-enica.md |
| CON-SIMB-026 | Verdade vs. Valor (Distinção Epistemológica) | SRC-SIMB-007 | epistemologia_pragmática | active | concept_cards/CON-026_verdade-vs-valor-distino-epistemolgica.md |
| CON-SIMB-027 | Rita e Moralidade Holárquica | SRC-SIMB-007 | filosofia_humanista | active | concept_cards/CON-027_rita-e-moralidade-holrquica.md |
| CON-SIMB-028 | Mal como Sombra Inevitável | SRC-SIMB-007 | filosofia_humanista | active | concept_cards/CON-028_mal-como-sombra-inevitvel.md |
| CON-SIMB-029 | Sociedade Plenária | SRC-SIMB-007 | filosofia_política | active | concept_cards/CON-029_sociedade-plenria.md |
| CON-SIMB-030 | Homem de Plenitude (Definição Completa) | SRC-SIMB-007 | filosofia_humanista | active | concept_cards/CON-030_homem-de-plenitude-definio-completa.md |
| CON-SIMB-031 | Globe como Símbolo / Encarnação Planetária | SRC-SIMB-007 | simbologia | active | concept_cards/CON-031_globe-como-smbolo-encarnao-planetria.md |

---

*SA-004 adicionado:*

| doc_id | title | sources | data | path |
|---|---|---|---|---|
| SA-004 | IRIS_SELF_ANALYSIS_004 | SRC-SIMB-007 (Planetarization) | 2026-06-12 | IRIS_SELF_ANALYSIS_004.md |

*RN-004 adicionado:*

| rn_id | título | source_id | data | path |
|---|---|---|---|---|
| RN-20260612-004 | RN — The Planetarization of Consciousness | SRC-SIMB-007 | 2026-06-12 | reading_notes/RN-20260612_rudhyar_planetarization.md |
| GAP-007 | GAP/Tension Map — Planetarization | SRC-SIMB-007 | 2026-06-12 | reading_notes/GAP_TENSION_rudhyar_planetarization.md |

---

*Atualizado: 2026-06-12 — Planetarization source_first_complete; CON-021 a CON-031 criados; SA-004 criado*

---

## Consolidação do Corpus Rudhyar — SIMB-RUDHYAR-CORPUS-001 (2026-06-12)

SA-002, SA-003 e SA-004 posicionados como artefatos de evolução em:
`.claude/agents/domain/simb-agent/evolution/`

Síntese unificada: `IRIS_RUDHYAR_CORPUS_SYNTHESIS.md`  
Índice de auto-análises: `IRIS_SELF_ANALYSIS_INDEX.md`  
Conflito de numeração documentado: `RUDHYAR_CARD_NUMBERING_CONFLICT_REPORT.md` — decisão do operador pendente antes de novos cards.
