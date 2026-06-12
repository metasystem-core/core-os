# Book Intake — <title>

> **Template:** Usar ao iniciar intake de livro ou fonte. Salvar em `intake/` com nome `INT-SIMB-YYYYMMDD-NNN_<título_curto>.md`.

---

## Intake Metadata

```
intake_id:
date:
operator_request:
source_id:            # a ser criado no manifesto
title:
author:
language:
source_class:         # ver SOURCE_CLASSIFICATION_POLICY.md
status:               # intake_pending
```

---

## Source Handling

```
raw_file_received:       # true | false
raw_file_location:       # raw_private/<filename> | não_disponível
extracted_text_created:  # true | false
extracted_text_location: # extracted_private/<filename> | não_disponível
git_safe:                # true | false — indica se algum conteúdo real vai ao Git
copyright_risk:          # true | false
privacy_risk:            # true | false
```

---

## Risk Flags Identificados

- [ ] copyright_risk
- [ ] privacy_risk
- [ ] therapeutic_confusion_risk
- [ ] mysticism_overreach_risk
- [ ] authority_over_operator_risk
- [ ] outdated_model_risk
- [ ] low_source_quality_risk
- [ ] emotionally_triggering_risk

---

## Processing Decision

- [ ] manifest only
- [ ] create reading note
- [ ] create concept cards
- [ ] create symbol cards
- [ ] create author map
- [ ] quarantine

---

## Notes

*Resumo curto do que será feito e por quê.*

---

## Files to Create

| Tipo | ID previsto | Caminho previsto |
|---|---|---|
| source_manifest | SRC-SIMB-NNN | source_manifests/SRC-NNN_... |
| reading_note | RN-SIMB-... | reading_notes/... |
| concept_card | CON-SIMB-NNN | concept_cards/CON-NNN_... |
| symbol_card | SYM-SIMB-NNN | symbol_cards/SYM-NNN_... |
| author_map | AUT-SIMB-NNN | author_maps/AUT-NNN_... |

---

## Next Action

*Próximo passo concreto.*

---

*Criado em: AAAA-MM-DD | Por: simb-agent / operador*
