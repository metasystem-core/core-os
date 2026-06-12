# Biblioteca Simbólica — SIMB-CORE
## Symbolic Library — Local Reference Infrastructure

**Workspace:** `.claude/workspaces/simb/library/`  
**Agente responsável:** simb-agent  
**Criado em:** SIMB-LIBRARY-001 (2026-06-12)

---

## O que é esta biblioteca

A biblioteca simbólica do SIMB-CORE é uma coleção local de manifestos de fontes, cards de conceito, cards de símbolo, mapas de autor e notas de leitura derivados de livros, tradições e textos que o operador escolheu trazer para informar o trabalho simbólico.

Ela é uma **referência operacional** — não um repositório de verdades.

---

## Para que serve

- Ampliar o repertório simbólico do SIMB-CORE com conteúdo específico escolhido pelo operador
- Oferecer vocabulário, conceitos e imagens de fontes documentadas
- Ancorar leituras SOURCE-FIRST em material que o operador realmente leu ou quer explorar
- Preparar o terreno para um futuro RAG simbólico (ainda não implementado)
- Registrar de forma estruturada o que foi lido, extraído e como pode ser usado

---

## O que esta biblioteca NÃO é

Esta biblioteca **não é terapia**.

- Livros e fontes informam leituras — eles não mandam no operador
- Nenhuma fonte se torna autoridade absoluta
- Nenhum símbolo tem significado fixo e universal
- Nenhum conceito extraído funciona como diagnóstico
- O operador sempre possui a interpretação final

---

## Sobre conteúdo bruto e licenciado

- **PDFs e livros brutos** ficam em `raw_private/` — **não versionados no Git**
- **OCR e extrações longas** ficam em `extracted_private/` — **não versionadas no Git**
- Esses dois diretórios têm `.gitignore` que bloqueia todo o conteúdo
- O que vai para Git: manifestos, cards curtos, índices e notas — todos em palavras próprias, sem texto integral copiado
- Trechos literais devem ser mínimos e claramente marcados como citação

---

## Sobre banco de dados e RAG

Esta biblioteca é **local e estruturada em arquivos**. Ela prepara a base para uma futura implementação de RAG simbólico com Supabase, mas:
- Nenhum banco de dados existe ainda
- Nenhum embedding foi criado
- Nenhum RAG está ativo
- A futura migração para banco será uma etapa separada com governança própria

---

## Estrutura de diretórios

```
library/
├── README.md                           ← este arquivo
├── LIBRARY_POLICY.md                   ← função, princípios, limites
├── BOOK_INTAKE_POLICY.md               ← fluxo de entrada de livro/fonte
├── SOURCE_CLASSIFICATION_POLICY.md     ← classes, status, risk flags
├── SYMBOLIC_EXTRACTION_POLICY.md       ← o que pode e não pode extrair
├── SIMB_SOURCE_USE_POLICY.md           ← como SIMB usa as fontes
├── COPYRIGHT_AND_PRIVACY_POLICY.md     ← proteção de conteúdo privado/licenciado
├── LIBRARY_INDEX.md                    ← índice de fontes, conceitos, símbolos
├── INTAKE_LOG.md                       ← log de intake — append-only
├── SOURCE_MANIFEST_TEMPLATE.md         ← template de manifesto de fonte
├── BOOK_INTAKE_TEMPLATE.md             ← template de intake de livro
├── CONCEPT_CARD_TEMPLATE.md            ← template de card de conceito (v2.0 — Neumann Runtime Grammar)
├── SYMBOL_CARD_TEMPLATE.md             ← template de card de símbolo (v2.0 — Neumann Runtime Grammar)
├── CARD_SCHEMA_NOTES.md                ← documentação dos campos dos templates v2.0
├── AUTHOR_MAP_TEMPLATE.md              ← template de mapa de autor
├── READING_NOTE_TEMPLATE.md            ← template de nota de leitura
├── RESPONSE_TEST_TEMPLATE.md           ← template de teste de resposta SIMB
├── intake/                             ← entrada bruta de material a processar
├── source_manifests/                   ← manifestos criados por fonte
├── concept_cards/                      ← cards de conceito extraídos
├── symbol_cards/                       ← cards de símbolo extraídos
├── author_maps/                        ← mapas de autor
├── reading_notes/                      ← notas de leitura curtas
├── indexes/                            ← índices derivados, listas, mapas temáticos
├── quarantine/                         ← material em espera de classificação
├── raw_private/                        ← arquivos brutos (gitignored)
└── extracted_private/                  ← extrações longas (gitignored)
```

---

## Invariantes

---

## Governance de Fontes

A biblioteca opera com uma régua de peso de fontes definida em:

- [`SOURCE_WEIGHTING_POLICY.md`](SOURCE_WEIGHTING_POLICY.md) — níveis N0 (rejeitar) a N5 (patch candidate); critérios de promoção para self-analysis
- [`SELF_ANALYSIS_TRIGGER_POLICY.md`](SELF_ANALYSIS_TRIGGER_POLICY.md) — quando criar e quando não criar IRIS_SELF_ANALYSIS; estados possíveis; protocolo de recomendação
- [`SOURCE_EVALUATION_TEMPLATE.md`](SOURCE_EVALUATION_TEMPLATE.md) — formulário de avaliação de fonte com campos de relevância, novelty, impacto operacional, risco, redundância e decisão do operador

**Índice de auto-análises:** `.claude/agents/domain/simb-agent/evolution/IRIS_SELF_ANALYSIS_INDEX.md`

**Regra central:** a Iris pode avaliar e recomendar o nível de uma fonte — mas não pode criar self-analysis, aplicar patch ou alterar protocolo sem aprovação explícita do operador.

---

## Templates de Card

Os templates de concept_card e symbol_card foram atualizados para a **Neumann Runtime Grammar** (SIMB-LIBRARY-003A). A versão v2.0 adiciona campos para análise de estágio de desenvolvimento, raiz arquetípica, leitura estrutural + genética, riscos de literalização e guardas de não-interpretação.

Documentação completa dos campos: [`CARD_SCHEMA_NOTES.md`](CARD_SCHEMA_NOTES.md)

Cards existentes (CON-001 a CON-031) mantêm o schema v1.0. A migração para v2.0 será feita gradualmente — novos cards usam v2.0 desde a criação.

---

## Corpus Rudhyar — Auto-Análises Consolidadas (SIMB-RUDHYAR-CORPUS-001)

SA-001 (Neumann), SA-002 (AoT), SA-003 (Prática), SA-004 (Planetarization) estão posicionados como artefatos de evolução da Iris em `.claude/agents/domain/simb-agent/evolution/`. Os documentos em `library/` são as cópias de origem. Síntese operacional em `IRIS_RUDHYAR_CORPUS_SYNTHESIS.md`. Conflito de numeração de cards documentado — aguardando decisão do operador antes de novos cards.

---

```
BOOK SOURCE ≠ TRUTH ABOUT OPERATOR
SYMBOLIC LIBRARY ≠ THERAPY
CONCEPT CARD ≠ DIAGNOSIS
SYMBOL CARD ≠ FIXED MEANING
SOURCE INGESTION ≠ VALIDATED KNOWLEDGE
RAW BOOK ≠ GIT CONTENT
EXCERPT ≠ FULL TEXT
QUARANTINE ≠ MEMORY
SIMB READING ≠ CLINICAL INTERPRETATION
OPERATOR OWNS INTERPRETATION
```

---

## Registries locais

A pasta `registries/` contém índices detalhados com metadados estruturados para cada dimensão da biblioteca. São complementares ao `LIBRARY_INDEX.md` (índice de consulta rápida) — enquanto o índice oferece visão geral, os registries oferecem rastreabilidade e memória operacional.

| registry | escopo | arquivo |
|---|---|---|
| SOURCES_REGISTRY | Fontes ingeridas com metadados completos | `registries/SOURCES_REGISTRY.md` |
| CONCEPTS_REGISTRY | Concept cards com tags temáticas | `registries/CONCEPTS_REGISTRY.md` |
| SYMBOLS_REGISTRY | Symbol cards com morfologias oníricas | `registries/SYMBOLS_REGISTRY.md` |
| AUTHORS_REGISTRY | Autores ingeridos e pendentes | `registries/AUTHORS_REGISTRY.md` |
| RESPONSE_TESTS_REGISTRY | Testes de fidelidade de uso | `registries/RESPONSE_TESTS_REGISTRY.md` |
| INGESTION_DECISIONS_REGISTRY | Raciocínio por trás de cada decisão de intake | `registries/INGESTION_DECISIONS_REGISTRY.md` |
| LEARNING_OBSERVATIONS_REGISTRY | Observações do SIMB sobre aprendizado (modo primário) | `registries/LEARNING_OBSERVATIONS_REGISTRY.md` |
| ARCHITECTURAL_OBSERVATIONS_REGISTRY | Memória de design — para patches via Claude Code | `registries/ARCHITECTURAL_OBSERVATIONS_REGISTRY.md` |

*Todos os registries são append-only.*
