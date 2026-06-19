# OPERATOR COMMAND TEMPLATE — DO NOT AUTOEXECUTE

> **Este arquivo é um template de comando para o operador.**
> A Iris NÃO deve executar estes comandos automaticamente.
> Cada bloco requer aprovação explícita do operador antes de execução.

---

## STEP 1 — PDF já depositado (ação concluída)

PDF confirmado em:
```
cesto/Jungian dream interpretation  a handbook of theory and practice (Hall, James A. (James Albert), 1934-) (z-library.sk, 1lib.sk, z-lib.sk).pdf
```
Quality audit: PASS_WITH_NOTES (2026-06-17)

---

## STEP 2 — Geração de Chunks Privados (aprovação necessária)

Após autorização do operador:

```
CORE-OS / SIMB — HALL CHUNK GENERATION
Executar o script:
  python .claude/workspaces/simb/source_packs/HALL_JUNGIAN_DREAM_INTERPRETATION_LOW_CREDIT_PACK/tools/prepare_private_full_text_chunks.py \
    --pdf "cesto/Jungian dream interpretation  a handbook of theory and practice (Hall, James A. (James Albert), 1934-) (z-library.sk, 1lib.sk, z-lib.sk).pdf" \
    --out ".claude/workspaces/simb/private_full_text_chunks/hall_jungian_dream_interpretation" \
    --chapter-map ".claude/workspaces/simb/source_packs/HALL_JUNGIAN_DREAM_INTERPRETATION_LOW_CREDIT_PACK/05_BLOCK_MAP.json"
Verificar git status após execução.
Confirmar que chunks são untracked/ignored.
```

---

## STEP 3 — Leitura Privada pela Iris (aprovação necessária)

Após chunks gerados:

```
CORE-OS / SIMB — HALL PRIVATE READING
Iris: ler chunks privados de hall_jungian_dream_interpretation em ordem.
Rota: conforme 06_READING_ROUTE_FOR_IRIS.md
Regime: SOURCE-FIRST.
Não calibrar profile.md.
Não analisar sonhos do operador.
Produzir IRIS_SELF_ANALYSIS_00X_hall_jungian_dream.md conforme 09_SELF_ANALYSIS_PROMPT_FOR_IRIS.md.
```

---

## STEP 4 — Self-Analysis (aprovação necessária)

Após leitura completa:

```
CORE-OS / SIMB — HALL SELF-ANALYSIS
Iris: produzir self-analysis conforme prompt em 09_SELF_ANALYSIS_PROMPT_FOR_IRIS.md.
Não acessar profile.md.
Não analisar sonhos do operador.
Não criar cards automaticamente.
Aguardar aprovação do operador antes de qualquer output versionável.
```

---

## STEP 5 — Cards (aprovação necessária)

Após self-analysis aprovada pelo operador:

```
CORE-OS / SIMB — HALL CARD CREATION
Criar cards sanitizados a partir dos candidatos confirmados em 08_CARD_CANDIDATE_INDEX.md.
Sem citações literais longas.
Sem texto bruto.
Sem casos clínicos de pacientes.
Sem linguagem diagnóstica como operação SIMB.
Aguardar aprovação antes de commitar.
```

---

## STEP 6 — DREAM_ANALYSIS_PROTOCOL (aprovação necessária)

Após cards aprovados:

```
CORE-OS / SIMB — DREAM_ANALYSIS_PROTOCOL v0.1
Rascunhar protocolo de análise de sonhos baseado em:
- Hall (teoria e técnica)
- Firewalls clínicos documentados no pack
- Experiência de self-analysis
Formato: .claude/workspaces/simb/library/protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md
Aguardar aprovação antes de qualquer ação subsequente.
```
