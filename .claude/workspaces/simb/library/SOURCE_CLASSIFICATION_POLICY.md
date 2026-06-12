# SOURCE_CLASSIFICATION_POLICY
## Política de Classificação de Fontes — Biblioteca SIMB

**Criado em:** SIMB-LIBRARY-001 (2026-06-12)

---

## Classes de Fonte

```yaml
source_classes:
  - symbolic_reference         # Fontes de teoria/prática simbólica direta (Jung, Durand, etc.)
  - philosophical_reference    # Filosofia com carga simbólica ou existencial
  - literary_reference         # Literatura, poesia, ficção com valor simbólico operacional
  - psychological_reference_non_clinical  # Psicologia profunda sem protocolo clínico
  - mythological_reference     # Mitos, lendas, narrativas arquetípicas
  - religious_reference        # Textos sagrados, tradições espirituais
  - esoteric_reference         # Tarot, I Ching, astrologia, Cabala, alquimia
  - personal_note              # Anotações do operador (não-diário)
  - dream_record               # Registro de sonho do operador
  - operator_diary             # Diário pessoal do operador
  - field_note                 # Observação operacional de campo
  - quarantined_source         # Fonte com risco não resolvido — aguarda decisão
```

---

## Descrição das Classes

| Classe | Descrição | Cuidados |
|---|---|---|
| `symbolic_reference` | Teoria simbólica formal | Risco de super-autoridade; âncora textual obrigatória |
| `philosophical_reference` | Filosofia com relevância simbólica | Não confundir sistema filosófico com verdade operacional |
| `literary_reference` | Prosa, poesia, ficção | Interpretação declarada como leitura, não como intenção do autor |
| `psychological_reference_non_clinical` | Psicologia não clínica | therapeutic_confusion_risk obrigatório |
| `mythological_reference` | Mitos e narrativas coletivas | Não fixar significado universal de mito |
| `religious_reference` | Escrituras, textos sagrados | Não converter em prescrição; respeito à tradição do operador |
| `esoteric_reference` | Sistemas divinatórios/esotéricos | mysticism_overreach_risk obrigatório; uso hipotético sempre |
| `personal_note` | Notas do operador | privacy_risk; não versionar sem autorização |
| `dream_record` | Sonhos do operador | Dado de primeira pessoa; não prova de fato externo |
| `operator_diary` | Diário do operador | Alta sensibilidade; nunca versionar |
| `field_note` | Observações operacionais | Menor sensibilidade; verificar conteúdo antes de versionar |
| `quarantined_source` | Risco não resolvido | Não usar até resolução pelo operador |

---

## Status de Fonte

```yaml
source_status:
  - intake_pending             # Fonte anunciada; intake não iniciado
  - manifest_created           # Manifesto criado; processamento pendente
  - extraction_pending         # Manifesto + decisão feita; extração não executada
  - concept_cards_created      # Concept cards criados
  - symbol_cards_created       # Symbol cards criados
  - reading_notes_created      # Reading notes criadas
  - quarantined                # Em quarentena — aguarda decisão do operador
  - active_reference           # Processamento completo; disponível para referência
  - retired                    # Fonte não mais relevante; mantida por histórico
```

### Transições de status

```
intake_pending → manifest_created → extraction_pending → [concept/symbol/reading] → active_reference
intake_pending → manifest_created → quarantined → (operador resolve) → manifest_created (retomar)
active_reference → retired (operador decide)
```

---

## Risk Flags

```yaml
risk_flags:
  - copyright_risk             # Fonte com restrições de reprodução
  - privacy_risk               # Conteúdo privado ou sensível do operador
  - therapeutic_confusion_risk # Pode ser confundida com protocolo clínico
  - mysticism_overreach_risk   # Pode induzir afirmação de fato por via esotérica
  - authority_over_operator_risk  # Autor pode ser tratado como autoridade final
  - outdated_model_risk        # Modelo teórico superado ou contestado na literatura
  - low_source_quality_risk    # Fonte de baixa qualidade ou procedência incerta
  - emotionally_triggering_risk   # Conteúdo pode acionar estado carregado no operador
```

### Impacto dos risk_flags no processamento

| Flag | Impacto |
|---|---|
| `copyright_risk` | Não copiar texto; preferir manifest_only ou notas muito curtas |
| `privacy_risk` | Não versionar; manter em raw_private/ ou extracted_private/ |
| `therapeutic_confusion_risk` | Adicionar aviso explícito em todo card desta fonte |
| `mysticism_overreach_risk` | Declarar "hipótese esotérica" explicitamente em todo uso |
| `authority_over_operator_risk` | Adicionar limitação de uso ao manifesto e a todos os cards |
| `outdated_model_risk` | Adicionar nota de contexto histórico ao manifesto |
| `low_source_quality_risk` | Quarantine até o operador confirmar uso pretendido |
| `emotionally_triggering_risk` | State Gate check antes de usar em sessão carregada |

---

## Combinações de risco que exigem quarantine automático

- `privacy_risk` + qualquer outro risco → quarantine obrigatório até autorização
- `low_source_quality_risk` + `mysticism_overreach_risk` → quarantine obrigatório
- `therapeutic_confusion_risk` + uso previsto em sessão com estado carregado → quarantine até revisão

---

## Classificação de licença

| license_status | Descrição |
|---|---|
| `public_domain` | Sem restrições de reprodução |
| `creative_commons` | Verificar tipo de CC antes de citar |
| `proprietary` | copyright_risk ativado; apenas referência e partes mínimas |
| `unknown` | Tratar como proprietary até verificação |
| `operator_owned` | Conteúdo do próprio operador |
