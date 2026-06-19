# OPERATOR COMMAND TEMPLATE — DO NOT AUTOEXECUTE

> **Este arquivo é um template de comando para o operador.**
> A Iris NÃO deve executar estes comandos automaticamente.
> Cada bloco requer aprovação explícita do operador antes de execução.

---

## STEP 1 — Depositar PDF (ação do operador)

Colocar o PDF em:
```
cesto/Anatomy of the psyche  alchemical symbolism in psychotherapy (Edinger, Edward F) (z-library.sk, 1lib.sk, z-lib.sk).pdf
```

---

## STEP 2 — Quality Audit do PDF (aprovação necessária)

Após depósito, o operador autoriza:

```
CORE-OS / SIMB — ANATOMY QUALITY AUDIT
Auditar estaticamente o PDF em cesto/.
Verificar: número de páginas, camada textual, qualidade de extração (amostra páginas 1, 50, 100, 150).
Atualizar 03_TEXT_EXTRACTION_REPORT.md com resultados reais.
Não gerar chunks ainda.
```

---

## STEP 3 — Geração de Chunks Privados (aprovação necessária)

Após quality audit PASS, o operador autoriza:

```
CORE-OS / SIMB — ANATOMY CHUNK GENERATION
Executar o script:
  python .claude/workspaces/simb/source_packs/EDINGER_ANATOMY_OF_THE_PSYCHE_LOW_CREDIT_PACK/tools/prepare_private_full_text_chunks.py \
    --pdf "cesto/Anatomy of the psyche  alchemical symbolism in psychotherapy (Edinger, Edward F) (z-library.sk, 1lib.sk, z-lib.sk).pdf" \
    --out ".claude/workspaces/simb/private_full_text_chunks/edinger_anatomy_of_the_psyche" \
    --chapter-map ".claude/workspaces/simb/source_packs/EDINGER_ANATOMY_OF_THE_PSYCHE_LOW_CREDIT_PACK/05_BLOCK_MAP.json"
Verificar git status após execução.
Confirmar que chunks são untracked/ignored.
```

---

## STEP 4 — Leitura Privada pela Iris (aprovação necessária)

Após chunks gerados:

```
CORE-OS / SIMB — ANATOMY PRIVATE READING
Iris: ler chunks privados de edinger_anatomy_of_the_psyche em ordem.
Regime: SOURCE-FIRST.
Não calibrar profile.md.
Produzir IRIS_SELF_ANALYSIS_00X.md conforme 09_SELF_ANALYSIS_PROMPT_FOR_IRIS.md.
```

---

## STEP 5 — Cards (aprovação necessária)

Após auto-análise aprovada pelo operador:

```
CORE-OS / SIMB — ANATOMY CARD CREATION
Criar cards sanitizados de Edinger/Anatomy.
Sem citações literais longas.
Sem texto bruto.
Aguardar aprovação antes de commitar.
```
