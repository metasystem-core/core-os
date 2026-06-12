# Source Manifest — <title>

> **Template:** Usar ao criar manifesto de nova fonte. Preencher todos os campos. Salvar em `source_manifests/` com nome `SRC-NNN_<autor>_<título_curto>.md`.

---

```yaml
source_id:
title:
author:
year:
edition:
language:
source_type:             # livro | artigo | texto_sagrado | oralidade | video | outro
source_class:            # ver SOURCE_CLASSIFICATION_POLICY.md
tradition:               # ex: psicologia_junguiana | mitologia_grega | taoismo | etc.
local_raw_path:          # raw_private/<filename> — ou "não_disponível"
local_extracted_path:    # extracted_private/<filename> — ou "não_disponível"
license_status:          # public_domain | creative_commons | proprietary | unknown | operator_owned
copyright_risk:          # true | false
privacy_risk:            # true | false
therapeutic_confusion_risk:    # true | false
mysticism_overreach_risk:      # true | false
authority_over_operator_risk:  # true | false
outdated_model_risk:           # true | false
low_source_quality_risk:       # true | false
emotionally_triggering_risk:   # true | false
status:                  # ver SOURCE_CLASSIFICATION_POLICY.md — source_status
allowed_use:             # lista de usos permitidos
prohibited_use:          # lista de usos proibidos
notes:                   # notas livres sobre a fonte
```

---

## Resumo da fonte

*Paráfrase curta em palavras próprias — o que é este texto/autor.*

---

## Por que está na biblioteca SIMB

*Justificativa: por que essa fonte pode informar leituras simbólicas.*

---

## Risk Notes

*Expansão dos risk_flags relevantes — como monitorar o risco no uso.*

---

## Processing Plan

- [ ] manifest_only
- [ ] reading_notes
- [ ] concept_extraction
- [ ] symbol_extraction
- [ ] author_map
- [ ] quarantine

---

## Files Created

| Tipo | ID | Caminho |
|---|---|---|
| — | — | — |

---

*Criado em: AAAA-MM-DD | Por: simb-agent / operador*
