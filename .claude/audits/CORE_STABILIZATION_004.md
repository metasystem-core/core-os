# CORE_STABILIZATION_004
## Gitignore Noise Cleanup

**Data:** 2026-06-11  
**Operador:** Rafael Santos Pena (modo primário — `opa`)  
**Status:** `COMPLETED`

---

## 1. Purpose

Esta etapa elimina o ruído do `git status` causado por artefatos intencionalmente excluídos do versionamento: corpus normativo bruto, backups, textos extraídos, staging local, configurações locais, zips e dados privados/licenciados.

Nenhum arquivo foi apagado. Nenhum arquivo foi movido. Nenhum conteúdo sensível foi versionado.  
O `.gitignore` foi expandido com padrões que cobrem os diretórios pai de subpadrões já existentes, mais novos paths antes sem cobertura.

**GITIGNORE PATCH ≠ FILE DELETION**  
**IGNORE RULE ≠ GIT RM**  
**NOISE CLEANUP ≠ CONTENT LOSS**

---

## 2. Source State

```yaml
current_head_before_patch: df31bf327d49e47f3784e1fb7e61aa0814e1c93f
commit_message: "chore(core-os): add log compaction policy and snapshots"
branch: main
remote_tracking: origin/main (aligned — push concluído antes desta etapa)

git_status_before:
  - "?? .claude/norm_library/backups/"
  - "?? .claude/norm_library/blocks/"
  - "?? .claude/norm_library/extracted_text/"
  - "?? .claude/norm_library/public_official/NRs/blocks/"
  - "?? .claude/norm_library/public_official/NRs/logs/"
  - "?? .claude/norm_library/raw/"
  - "?? .claude/norm_library/translations/"
  - "?? .claude/settings.local.json"
  - "?? _staging/"
  - "?? cesto/NBRs/"
  - "?? cesto/_zip_extract/"
  - "?? cesto/asset_core_plano_aporte_recalibracao.txt"
  - "?? cesto/lotofa_core_historico_pack_v1_0.zip"
  - "?? cesto/nbr_filtered_norm_ingestion_pack_v1_2.zip"
  - "?? cesto/swqw_lens_coreos_pack.zip"

untracked_paths_count: 15
```

---

## 3. Ignore Policy

| path_or_pattern | reason | sensitive_or_bulk | action |
|---|---|---|---|
| `.claude/norm_library/backups/` | Backups de versões anteriores do corpus; conteúdo bulk, não destinado ao repo | bulk | ADICIONAR |
| `.claude/norm_library/blocks/` | Corpus normativo em blocos JSONL; texto integral de normas; bulk/licenciado | bulk + potencial licenciado | ADICIONAR (subsume `blocks/private_authorized_full/` já existente) |
| `.claude/norm_library/extracted_text/` | Texto extraído de PDFs; bulk/licenciado | bulk + potencial licenciado | ADICIONAR (subsume subdirs já existentes) |
| `.claude/norm_library/raw/` | Fontes brutas de normas; PDFs privados/licenciados | sensível + licenciado | ADICIONAR (subsume subdirs já existentes) |
| `.claude/norm_library/translations/` | Traduções de normas; potencial licenciado | potencial licenciado | ADICIONAR |
| `.claude/norm_library/public_official/NRs/blocks/` | Blocos JSONL das NRs públicas (~3.9MB); texto integral; bulk | bulk | ADICIONAR |
| `.claude/norm_library/public_official/NRs/logs/` | Logs de ingestão (~52KB); logs operacionais não pertencem ao repo | operacional | ADICIONAR |
| `.claude/settings.local.json` | Overrides locais de sessão; configuração de ambiente, não código | local/env | ADICIONAR |
| `_staging/` | Área de trabalho temporária local; conteúdo variável e transitório | local | ADICIONAR (subsume `_staging/analise_carteira.py` já existente) |
| `cesto/NBRs/` | NBRs/PDFs licenciados ou brutos em intake; não redistribuíveis | licenciado | ADICIONAR |
| `cesto/_zip_extract/` | Extrações temporárias de zips; conteúdo transitório | local/bulk | ADICIONAR |
| `cesto/asset_core_plano_*` | Planos de aporte e dados financeiros pessoais | sensível (financeiro) | ADICIONAR |
| `cesto/*.zip` | Zips de packs, históricos, dados; bulk ou sensível; variável | bulk + potencial sensível | ADICIONAR |

---

## 4. .gitignore Patch

### Padrões adicionados (nova seção `CORE-STABILIZATION-004`)

```gitignore
# Configuração local de sessão
.claude/settings.local.json

# norm_library — corpus bruto, backups e conteúdo bulk/licenciado
.claude/norm_library/backups/
.claude/norm_library/blocks/
.claude/norm_library/extracted_text/
.claude/norm_library/raw/
.claude/norm_library/translations/

# norm_library/public_official — corpus integral e logs de ingestão
.claude/norm_library/public_official/NRs/blocks/
.claude/norm_library/public_official/NRs/logs/

# Staging local
_staging/

# CESTO — conteúdo privado, licenciado ou bulk
cesto/NBRs/
cesto/_zip_extract/
cesto/asset_core_plano_*
cesto/*.zip
```

**Padrões adicionados:** 13

### Padrões anteriores que se tornam subsumos (mantidos, sem remoção)

| Padrão antigo | Subsumido por |
|---|---|
| `.claude/norm_library/raw/private_authorized/` | `.claude/norm_library/raw/` |
| `.claude/norm_library/raw/client_procedures/` | `.claude/norm_library/raw/` |
| `.claude/norm_library/raw/manuals/` | `.claude/norm_library/raw/` |
| `.claude/norm_library/extracted_text/private_authorized/` | `.claude/norm_library/extracted_text/` |
| `.claude/norm_library/extracted_text/client_procedures/` | `.claude/norm_library/extracted_text/` |
| `.claude/norm_library/blocks/private_authorized_full/` | `.claude/norm_library/blocks/` |
| `_staging/analise_carteira.py` | `_staging/` |

**Ação:** mantidos sem modificação. Redundância inofensiva — padrões mais específicos dentro de padrões mais amplos.

**Duplicatas adicionadas:** 0  
**Proteções removidas:** 0

---

## 5. Validation

`git check-ignore -v` executado para todos os 15 paths ruidosos após patch:

| path | check_ignore_result | linha .gitignore | status |
|---|---|---|---|
| `.claude/norm_library/backups/` | `.gitignore:64:.claude/norm_library/backups/` | L64 | ✅ PASS |
| `.claude/norm_library/blocks/` | `.gitignore:65:.claude/norm_library/blocks/` | L65 | ✅ PASS |
| `.claude/norm_library/extracted_text/` | `.gitignore:66:.claude/norm_library/extracted_text/` | L66 | ✅ PASS |
| `.claude/norm_library/public_official/NRs/blocks/` | `.gitignore:71:.claude/norm_library/public_official/NRs/blocks/` | L71 | ✅ PASS |
| `.claude/norm_library/public_official/NRs/logs/` | `.gitignore:72:.claude/norm_library/public_official/NRs/logs/` | L72 | ✅ PASS |
| `.claude/norm_library/raw/` | `.gitignore:67:.claude/norm_library/raw/` | L67 | ✅ PASS |
| `.claude/norm_library/translations/` | `.gitignore:68:.claude/norm_library/translations/` | L68 | ✅ PASS |
| `.claude/settings.local.json` | `.gitignore:60:.claude/settings.local.json` | L60 | ✅ PASS |
| `_staging/` | `.gitignore:75:_staging/` | L75 | ✅ PASS |
| `cesto/NBRs/` | `.gitignore:78:cesto/NBRs/` | L78 | ✅ PASS |
| `cesto/_zip_extract/` | `.gitignore:79:cesto/_zip_extract/` | L79 | ✅ PASS |
| `cesto/asset_core_plano_aporte_recalibracao.txt` | `.gitignore:80:cesto/asset_core_plano_*` | L80 | ✅ PASS |
| `cesto/lotofa_core_historico_pack_v1_0.zip` | `.gitignore:81:cesto/*.zip` | L81 | ✅ PASS |
| `cesto/nbr_filtered_norm_ingestion_pack_v1_2.zip` | `.gitignore:81:cesto/*.zip` | L81 | ✅ PASS |
| `cesto/swqw_lens_coreos_pack.zip` | `.gitignore:81:cesto/*.zip` | L81 | ✅ PASS |

**Validações: 15/15 PASS**

---

## 6. Post-Patch Git Status

```
git status --short (após patch):

 M .gitignore
```

**Resultado:** Apenas `.gitignore` aparece como modificado (staged para commit). Nenhum arquivo `??` remanescente. Status limpo.

**Untracked remanescentes:** 0  
**Ruído residual:** 0

---

## 7. Commit

**Validações: 15/15 PASS — commit executado.**

Arquivos staged:
- `.gitignore`
- `.claude/audits/CORE_STABILIZATION_004.md`

```yaml
commit_executed: true
commit_message: "chore(core-os): ignore local bulk and sensitive artifacts"
files_staged: 2
git_add_A_executed: false
git_push_executed: false
```

---

## 8. Result

```yaml
stabilization_status: gitignore_noise_cleanup_committed
commit_hash: (registrado pós-commit)
patterns_added: 13
paths_covered_before: 0
paths_covered_after: 15
files_deleted: 0
files_moved: 0
sensitive_files_versioned: 0
git_add_A_executed: false
git_push_executed: false
git_clean_executed: false
git_rm_executed: false
agents_modified: false
registry_modified: false
logs_modified: false
schemas_modified: false
sql_executed: false
database_accessed: false
connectors_activated: false
RAG_updated: false
embeddings_created: false
harness_created: false
next_recommended_step: >
  Push commit 004 para origin/main (operador confirma).
  Depois: CORE-USE-001 — First Monitored Real Use (UM-IRATA-001 ou UM-INSP-001)
  ou legal-agent 9.1 — Local Dry-Run Harness Design, No Execution.
```
