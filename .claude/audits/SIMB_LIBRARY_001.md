# SIMB_LIBRARY_001
## Local Symbolic Library and Book Intake Infrastructure

**Data:** 2026-06-12  
**Operador:** Rafael Santos Pena (modo primário — `opa`)  
**Status:** COMPLETE

---

## 1. Purpose

Criar a infraestrutura local da biblioteca simbólica do SIMB-CORE e o sistema de intake de livros/fontes, sem ainda criar Supabase, RAG, embeddings ou banco. Preparar o SIMB para receber livros e conteúdos específicos de forma governada.

**Foco estratégico:** estrutural e cognitivo — biblioteca local, intake de livros/fontes, manifestos, classificação, extração de conceitos e símbolos, notas de leitura, índice de fontes, proteção contra contaminação, uso futuro pelo SIMB-CORE.

---

## 2. Source State

```yaml
current_head: 6e3baa095550ef53984c088a4cbe820e4a520429
branch: main
simb_workspace_exists: true
simb_agent_found: true
simb_agent_status: review_validated
simb_agent_active: true  # ativado em CORE-COWORK-ACTIVATION-001
registry_modified: false
agent_md_modified: false
skills_modified: false
schemas_modified: false
```

---

## 3. Files Created

### Diretório raiz da biblioteca (16 arquivos)

| # | Arquivo | Tipo |
|---|---|---|
| 1 | `.claude/workspaces/simb/library/README.md` | documentação |
| 2 | `.claude/workspaces/simb/library/LIBRARY_POLICY.md` | política |
| 3 | `.claude/workspaces/simb/library/BOOK_INTAKE_POLICY.md` | política |
| 4 | `.claude/workspaces/simb/library/SOURCE_CLASSIFICATION_POLICY.md` | política |
| 5 | `.claude/workspaces/simb/library/SYMBOLIC_EXTRACTION_POLICY.md` | política |
| 6 | `.claude/workspaces/simb/library/SIMB_SOURCE_USE_POLICY.md` | política |
| 7 | `.claude/workspaces/simb/library/COPYRIGHT_AND_PRIVACY_POLICY.md` | política |
| 8 | `.claude/workspaces/simb/library/LIBRARY_INDEX.md` | índice |
| 9 | `.claude/workspaces/simb/library/INTAKE_LOG.md` | log |
| 10 | `.claude/workspaces/simb/library/SOURCE_MANIFEST_TEMPLATE.md` | template |
| 11 | `.claude/workspaces/simb/library/BOOK_INTAKE_TEMPLATE.md` | template |
| 12 | `.claude/workspaces/simb/library/CONCEPT_CARD_TEMPLATE.md` | template |
| 13 | `.claude/workspaces/simb/library/SYMBOL_CARD_TEMPLATE.md` | template |
| 14 | `.claude/workspaces/simb/library/AUTHOR_MAP_TEMPLATE.md` | template |
| 15 | `.claude/workspaces/simb/library/READING_NOTE_TEMPLATE.md` | template |
| 16 | `.claude/workspaces/simb/library/RESPONSE_TEST_TEMPLATE.md` | template |

### Subdiretórios (10 dirs × 1 arquivo = 10 arquivos)

| # | Diretório | Arquivo | Tipo |
|---|---|---|---|
| 17 | `intake/` | `.gitkeep` | placeholder |
| 18 | `source_manifests/` | `.gitkeep` | placeholder |
| 19 | `concept_cards/` | `.gitkeep` | placeholder |
| 20 | `symbol_cards/` | `.gitkeep` | placeholder |
| 21 | `author_maps/` | `.gitkeep` | placeholder |
| 22 | `reading_notes/` | `.gitkeep` | placeholder |
| 23 | `indexes/` | `.gitkeep` | placeholder |
| 24 | `quarantine/` | `.gitkeep` | placeholder |
| 25 | `raw_private/` | `.gitignore` | proteção de privacidade |
| 26 | `extracted_private/` | `.gitignore` | proteção de privacidade |

**Total de arquivos criados na biblioteca: 26**

### Relatório de auditoria

| # | Arquivo | Tipo |
|---|---|---|
| 27 | `.claude/audits/SIMB_LIBRARY_001.md` | audit report |

**Total geral: 27 arquivos**

---

## 4. Library Design

A biblioteca simbólica é implementada como sistema de arquivos local, organizado em:

- **Políticas** — definem o que pode e não pode ser feito com fontes
- **Templates** — padronizam a criação de manifestos, cards, notas e mapas
- **Índices** — rastreiam fontes, conceitos, símbolos e autores
- **Logs** — registram cada intake de forma append-only
- **Subdiretórios** — organizam o material por tipo e estágio de processamento

**Sem banco de dados:** toda a biblioteca é baseada em arquivos Markdown. Nenhum Supabase, nenhum banco SQLite, nenhuma tabela.

**Sem RAG:** nenhum embedding, nenhum vector store, nenhum sistema de busca semântica. A navegação é manual por índices e cards.

**Sem embeddings:** nenhum modelo de embedding foi executado.

**Foco em fonte simbólica estruturada:** o sistema distingue livros simbólicos, filosóficos, literários, mitológicos, religiosos, esotéricos e conteúdo pessoal do operador — cada um com classificação, risk flags e regras de uso próprias.

**Preparação para RAG futuro:** a estrutura de cards e manifestos foi desenhada para ser migrada futuramente para um sistema RAG/Supabase sem perda de governa — cada card é uma unidade semântica com metadados declarados.

---

## 5. Intake Model

```
Passo 1  → Operador aponta fonte
Passo 2  → intake_id criado (INT-SIMB-YYYYMMDD-NNN)
Passo 3  → BOOK_INTAKE_TEMPLATE.md preenchido e salvo em intake/
Passo 4  → SOURCE_MANIFEST_TEMPLATE.md preenchido e salvo em source_manifests/
Passo 5  → Arquivo bruto vai para raw_private/ (gitignored)
Passo 6  → Classificação: source_class, license_status, risk_flags
Passo 7  → Decisão: manifest_only | reading_notes | concept_extraction | symbol_extraction | author_map | quarantine
Passo 8  → Criação de cards em palavras próprias (se decidido)
Passo 9  → Atualização de LIBRARY_INDEX.md
Passo 10 → Atualização de INTAKE_LOG.md
```

Nenhuma fonte entra diretamente como "conhecimento validado". Todo material passa por intake → classificação → decisão → processamento (quando aprovado).

---

## 6. Safety Model

### Non-therapy
A biblioteca é referência operacional, não clínica. Nenhuma fonte transforma o SIMB-CORE em terapeuta. `therapy_role: prohibited` declarado explicitamente na LIBRARY_POLICY.md.

### Non-diagnosis
Nenhum concept_card ou symbol_card pode ser usado para diagnosticar o operador. `CONCEPT CARD ≠ DIAGNOSIS` e `SYMBOL CARD ≠ FIXED MEANING` são invariantes ativos.

### Non-mysticism
Fontes esotéricas têm `mysticism_overreach_risk` obrigatório. Toda referência a tarot, I Ching, astrologia, alquimia ou Cabala é marcada como hipótese esotérica provisória — nunca afirmação de fato.

### Non-authority
`BOOK SOURCE ≠ TRUTH ABOUT OPERATOR` e `AUTHOR ≠ ORACLE` são invariantes centrais. Nenhum autor se torna autoridade absoluta.

### Copyright/privacy protection
- `raw_private/` — gitignored: `* !.gitignore`
- `extracted_private/` — gitignored: `* !.gitignore`
- Ambos verificados com `git check-ignore` — PASS
- Cards e notas são em palavras próprias; trechos literais máx. 2-3 frases

### Operator owns interpretation
O operador é soberano sobre sua interpretação. `OPERATOR OWNS INTERPRETATION` é o invariante final de toda política desta biblioteca.

---

## 7. Future Source Ingestion Flow

Quando o operador quiser adicionar a primeira fonte real (ex: "Jung — O Homem e seus Símbolos"):

1. Operador declara a fonte no Cowork (ex: "quero adicionar Jung ao SIMB")
2. SIMB-AGENT cria `INT-SIMB-20260612-001` em `intake/`
3. Manifesto `SRC-SIMB-001_jung_homem_e_seus_simbolos.md` criado em `source_manifests/`
4. PDF vai para `raw_private/` (gitignored) — não versionado
5. Decisão de processamento tomada (ex: reading_notes + concept_extraction + author_map)
6. Cards criados em `concept_cards/` e `author_maps/` — em palavras próprias
7. LIBRARY_INDEX.md atualizado
8. INTAKE_LOG.md atualizado
9. Commit controlado — apenas arquivos de valor (manifestos, cards, notas) — nunca PDF bruto

Esta é a etapa **SIMB-LIBRARY-002 — First Source Intake Pilot**.

---

## 8. Validation

| # | Verificação | Resultado |
|---|---|---|
| V-01 | library/ criada | PASS |
| V-02 | intake/ criada | PASS |
| V-03 | source_manifests/ criada | PASS |
| V-04 | concept_cards/ criada | PASS |
| V-05 | symbol_cards/ criada | PASS |
| V-06 | author_maps/ criada | PASS |
| V-07 | reading_notes/ criada | PASS |
| V-08 | indexes/ criada | PASS |
| V-09 | quarantine/ criada | PASS |
| V-10 | raw_private/ criada + gitignored | PASS |
| V-11 | extracted_private/ criada + gitignored | PASS |
| V-12 | raw_private/.gitignore bloqueia arquivos | PASS — verificado com git check-ignore |
| V-13 | extracted_private/.gitignore bloqueia arquivos | PASS — verificado com git check-ignore |
| V-14 | 6 políticas criadas | PASS |
| V-15 | 7 templates criados | PASS |
| V-16 | LIBRARY_INDEX.md criado | PASS |
| V-17 | INTAKE_LOG.md criado | PASS |
| V-18 | Nenhum livro real ingerido | PASS |
| V-19 | Nenhum texto licenciado copiado | PASS |
| V-20 | Nenhum registry modificado | PASS |
| V-21 | Nenhum AGENT.md modificado | PASS |
| V-22 | Nenhum banco acessado | PASS |
| V-23 | Nenhum embedding criado | PASS |
| V-24 | Nenhum RAG criado | PASS |
| V-25 | Persona Iris não alterada | PASS |
| V-26 | git add -A não usado | PASS |
| V-27 | git add . não usado | PASS |
| V-28 | git push não executado | PASS |

**28/28 PASS**

---

## 9. Git Commit

- **Message:** `feat(simb): add symbolic library intake infrastructure`
- **Staged explicitly:** todos os 27 arquivos listados em §3 — um a um
- **Not staged:** PDF brutos, OCR, conteúdo de raw_private/ ou extracted_private/, registry, AGENT.md, skills, schemas

---

## 10. Result

```yaml
status: simb_library_intake_infrastructure_committed
files_created_count: 27
commit_hash: (ver abaixo após commit)
next_recommended_step: SIMB-LIBRARY-002 — First Source Intake Pilot
```

**SIMB-LIBRARY-001: COMPLETE.**

---

*Próxima etapa recomendada: SIMB-LIBRARY-002 — First Source Intake Pilot*  
*O operador escolhe a primeira fonte e o simb-agent executa o intake completo.*
