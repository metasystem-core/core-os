# BOOK_INTAKE_POLICY
## Política de Intake de Livros e Fontes — Biblioteca SIMB

**Criado em:** SIMB-LIBRARY-001 (2026-06-12)

---

## Fluxo de Intake

Toda fonte entra pela biblioteca através de um processo formal de 13 passos.  
Nenhuma fonte é usada sem intake completo.

```
Passo 1  → Operador fornece ou aponta a fonte
Passo 2  → Criar intake_id (formato: INT-SIMB-YYYYMMDD-NNN)
Passo 3  → Criar source_manifest (usando SOURCE_MANIFEST_TEMPLATE.md)
Passo 4  → Registrar metadados: título, autor, ano, edição, idioma
Passo 5  → Registrar localização local privada (raw_private/ ou extracted_private/)
Passo 6  → Classificar fonte: source_class (ver SOURCE_CLASSIFICATION_POLICY.md)
Passo 7  → Classificar licença e copyright: license_status, copyright_risk
Passo 8  → Classificar sensibilidade: privacy_risk, outros risk_flags
Passo 9  → Decisão de processamento (ver abaixo)
Passo 10 → Criar cards curtos em palavras próprias (se decidido em Passo 9)
Passo 11 → Evitar texto integral — fragmentos mínimos e marcados como citação
Passo 12 → Atualizar LIBRARY_INDEX.md (linha na tabela Sources)
Passo 13 → Atualizar INTAKE_LOG.md (linha na tabela de intake)
```

---

## Decisão de Processamento (Passo 9)

Após classificação, decidir uma ou mais ações:

| Ação | Quando usar | Output |
|---|---|---|
| `manifest_only` | Fonte com copyright_risk alto ou conteúdo sensível; apenas registrar existência | source_manifest sem cards |
| `reading_notes` | Leitura geral; nenhum conceito ou símbolo específico para extrair ainda | reading_note em `reading_notes/` |
| `concept_extraction` | Conceitos claramente extraíveis e úteis para o SIMB | concept_cards em `concept_cards/` |
| `symbol_extraction` | Símbolos recorrentes ou relevantes para leitura do campo do operador | symbol_cards em `symbol_cards/` |
| `author_map` | Autor com múltiplas fontes ou relevância estrutural para o SIMB | author_map em `author_maps/` |
| `quarantine` | Fonte com risco alto não resolvido; aguardar decisão do operador | intake_pending em quarantine/ |

Mais de uma ação pode ser executada para a mesma fonte.

---

## Regras de copyright e privacidade no intake

- **Texto integral** — nunca copiado para arquivos versionados
- **PDF bruto** — armazenado apenas em `raw_private/` (gitignored)
- **OCR ou extração longa** — armazenado apenas em `extracted_private/` (gitignored)
- **Trechos** — máximo 2-3 frases por card; claramente marcados como citação com fonte
- **Cards e notas** — sempre em palavras próprias; parafraseiam, não copiam
- **Conteúdo do operador** — diários, sonhos, notas pessoais: nunca versionados sem autorização explícita

---

## Formatos de ID

| Tipo | Formato | Exemplo |
|---|---|---|
| intake_id | `INT-SIMB-YYYYMMDD-NNN` | `INT-SIMB-20260612-001` |
| source_id | `SRC-SIMB-NNN` | `SRC-SIMB-001` |
| concept_id | `CON-SIMB-NNN` | `CON-SIMB-001` |
| symbol_id | `SYM-SIMB-NNN` | `SYM-SIMB-001` |
| author_id | `AUT-SIMB-NNN` | `AUT-SIMB-001` |
| reading_note_id | `RN-SIMB-YYYYMMDD-NNN` | `RN-SIMB-20260612-001` |

---

## Nomes de arquivo

| Tipo | Padrão de nome | Exemplo |
|---|---|---|
| source_manifest | `SRC-NNN_<autor>_<título_curto>.md` | `SRC-001_jung_arquétipos.md` |
| concept_card | `CON-NNN_<conceito>.md` | `CON-001_individuação.md` |
| symbol_card | `SYM-NNN_<símbolo>.md` | `SYM-001_sombra.md` |
| author_map | `AUT-NNN_<autor>.md` | `AUT-001_jung.md` |
| reading_note | `RN-YYYYMMDD_<título_curto>.md` | `RN-20260612_símbolos_da_transformação.md` |

---

## Atualização de índices

Todo intake deve atualizar dois arquivos:

1. **LIBRARY_INDEX.md** — tabela Sources: nova linha com source_id, title, author, tradition, source_class, status, risk_flags, manifest_path
2. **INTAKE_LOG.md** — nova linha com intake_id, date, operator_request, source_title, source_type, action, status, files_created, risk_flags, next_action

Esses arquivos são append-only. Nunca deletar linhas.

---

## Invariantes de intake

```
RAW BOOK ≠ GIT CONTENT
EXCERPT ≠ FULL TEXT
QUARANTINE ≠ MEMORY
INTAKE ≠ VALIDATED KNOWLEDGE
COPYRIGHT_RISK ≠ BLOQUEIO TOTAL — pode fazer manifest_only
MANIFEST ≠ USO AUTORIZADO — uso requer decision_step completo
```
