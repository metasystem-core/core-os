# DREAM_SYMBOL_REGISTRY_INFRASTRUCTURE_PATCH_QA_NOTES_001

```yaml
audit_id: DREAM_SYMBOL_REGISTRY_INFRASTRUCTURE_PATCH_QA_NOTES_001
modo: PATCH_INFRASTRUCTURE_METADATA_ONLY
data: 2026-06-18
fonte_qa: DREAM_SYMBOL_REGISTRY_INFRASTRUCTURE_QA_001
patches_aplicados: 4/4
status_geral: COMPLETE
arquivos_alterados: 4
entradas_reais_de_sonho_alteradas: NÃO
entradas_reais_de_simbolo_alteradas: NÃO
AGENT_md_alterado: NÃO
registries_library_alterados: NÃO
source_manifests_alterados: NÃO
outros_cards_alterados: NÃO
git_add_executado: NÃO
git_commit_executado: NÃO
pronto_para_importacao_controlada: SIM
pronto_para_skill_conversion_audit: SIM
```

---

## 1. Arquivos alterados

| # | Arquivo | Patches | Tipo de alteração | Status |
|---|---|---|---|---|
| 1 | `operator_context/DREAM_REGISTRY.md` | PATCH-001 + PATCH-002 | Vocabulário de status atualizado no bloco descritivo; seção de regra adicionada para `recurrence_verbalized_not_indexed` | ✓ APLICADO |
| 2 | `operator_context/SYMBOL_REGISTRY.md` | PATCH-003 | Campos `correction_history` e `do_not_reduce_to` adicionados ao bloco descritivo; seção de regra adicionada | ✓ APLICADO |
| 3 | `library/protocol_notes/PROT-005_registro-bruto-antes-de-interpretacao.md` | PATCH-004 | Referência `(a criar)` substituída por caminho canônico | ✓ APLICADO |
| 4 | `library/concept_cards/CON-039_serie-de-sonhos-imagens-relacionadas.md` | PATCH-004 | Referências `(a criar)` substituídas por caminhos canônicos (DREAM_REGISTRY e SYMBOL_REGISTRY) | ✓ APLICADO |

---

## 2. Patches aplicados — detalhe

### PATCH-001 — DREAM_REGISTRY: vocabulário de status

**Problema (QA-NOTE-001):** bloco descritivo legacy listava `raw | reviewed | interpreted | linked`, incompatível com o vocabulário do DREAM_ENTRY_TEMPLATE.

**Alteração em:** `operator_context/DREAM_REGISTRY.md` — campo `**Status:**` dentro do bloco descritivo de estrutura de entrada.

**Antes:**
```
**Status:** raw | reviewed | interpreted | linked
```

**Depois:**
```
**Status:** raw_only | interpreted | needs_context | series_candidate | high_sensitivity | recurrence_verbalized_not_indexed | hold_for_later_review
```

**Entradas existentes alteradas:** NÃO — apenas o bloco descritivo de referência foi atualizado.

**Status: APLICADO ✓**

---

### PATCH-002 — DREAM_REGISTRY: regra de recorrência verbalizada

**Problema (QA-NOTE-002):** marcador `[recorrência verbalizada / não indexada]` funcional via protocolo e template, mas não nomeado no corpo descritivo do registry.

**Alteração em:** `operator_context/DREAM_REGISTRY.md` — nova seção `## Regra — recorrência verbalizada sem histórico` inserida entre o bloco de estrutura de entrada e a tabela de legado.

**Conteúdo adicionado:**
```
Quando o operador disser que uma imagem, cena, pessoa ou tema "já apareceu antes", mas ainda não houver link confirmado no DREAM_REGISTRY, marcar como:

**Status:** `recurrence_verbalized_not_indexed`

Esta marca não confirma série. Apenas registra hipótese de recorrência para revisão futura. Para confirmar série, são necessárias 2 ou mais entradas com datas distintas no DREAM_REGISTRY. Ver DREAM_SYMBOL_REGISTRY_USAGE_PROTOCOL.md seção 7.
```

**Entradas existentes alteradas:** NÃO.

**Status: APLICADO ✓**

---

### PATCH-003 — SYMBOL_REGISTRY: correction_history e do_not_reduce_to

**Problema (QA-NOTE-003):** campos `correction_history` e `do_not_reduce_to` presentes no SYMBOL_ENTRY_TEMPLATE mas ausentes no bloco descritivo legacy do registry.

**Alterações em:** `operator_context/SYMBOL_REGISTRY.md`:
1. Bloco descritivo de estrutura de entrada — 2 campos adicionados ao final:

```
**correction_history:** (append-only — nunca apagar; registrar: "YYYY-MM-DD: operador corrigiu [X] para [Y]")
**do_not_reduce_to:** (reduções proibidas — ex: "não reduzir a arquétipo X", "não tratar como símbolo fixo")
```

2. Nova seção `## Regra — correction_history e do_not_reduce_to` com:
   - Regra de prioridade de correções do operador sobre leituras anteriores
   - Regra de append-only para correction_history
   - Regra de alimentação progressiva de do_not_reduce_to
   - Instrução de não retroagir em massa sem autorização

**Entradas existentes alteradas:** NÃO — apenas bloco descritivo e nova seção de regras.

**Status: APLICADO ✓**

---

### PATCH-004 — PROT-005 e CON-039: referências obsoletas

**Problema (QA-NOTE-004):** PROT-005 e CON-039 referenciavam DREAM_REGISTRY e SYMBOL_REGISTRY como `(a criar)` — ambos já existem.

**Alterações em PROT-005:**

Antes:
```
- **DREAM_REGISTRY** (a criar): repositório de registros brutos ao longo do tempo — alimentado por este protocolo.
```

Depois:
```
- **DREAM_REGISTRY** (`operator_context/DREAM_REGISTRY.md`): repositório de registros brutos ao longo do tempo — alimentado por este protocolo.
```

**Alterações em CON-039:**

Antes:
```
- **DREAM_REGISTRY** (a criar): base formal para rastreamento de série e marcação de imagens recorrentes.
- **SYMBOL_REGISTRY** (a criar): rastreamento de imagens específicas ao longo do tempo — alimentado por série.
```

Depois:
```
- **DREAM_REGISTRY** (`operator_context/DREAM_REGISTRY.md`): base formal para rastreamento de série e marcação de imagens recorrentes.
- **SYMBOL_REGISTRY** (`operator_context/SYMBOL_REGISTRY.md`): rastreamento de imagens específicas ao longo do tempo — alimentado por série.
```

**Conteúdo conceitual alterado:** NÃO — apenas substituição de `(a criar)` por caminho canônico.

**Status: APLICADO ✓**

---

## 3. Confirmações de compliance

| Verificação | Status |
|---|---|
| Patches aplicados: 4/4 | ✓ CONFIRMADO |
| Entradas reais de sonho alteradas | ✓ NÃO |
| Entradas reais de símbolo alteradas | ✓ NÃO |
| Conteúdo interpretativo alterado | ✓ NÃO |
| AGENT.md alterado | ✓ NÃO |
| Registries de library alterados (CONCEPTS_REGISTRY, SOURCES_REGISTRY, SYMBOLS_REGISTRY) | ✓ NÃO |
| Source manifests alterados | ✓ NÃO |
| Outros cards alterados (além de PROT-005 e CON-039 autorizados) | ✓ NÃO |
| DREAM_ANALYSIS_PROTOCOL alterado | ✓ NÃO |
| git add executado | ✓ NÃO |
| git commit executado | ✓ NÃO |

---

## 4. Estado pós-patch — infraestrutura de registries

| Componente | Status pós-patch |
|---|---|
| `DREAM_REGISTRY.md` header + estrutura | ✓ alinhado com DREAM_ENTRY_TEMPLATE (vocabulário de status, regra de recorrência) |
| `SYMBOL_REGISTRY.md` estrutura descritiva | ✓ alinhado com SYMBOL_ENTRY_TEMPLATE (correction_history, do_not_reduce_to) |
| `PROT-005` — referências | ✓ atualizado — caminho canônico DREAM_REGISTRY |
| `CON-039` — referências | ✓ atualizado — caminhos canônicos DREAM_REGISTRY e SYMBOL_REGISTRY |
| `DREAM_SYMBOL_REGISTRY_USAGE_PROTOCOL.md` | sem alteração necessária — já estava completo |
| `DREAM_ENTRY_TEMPLATE.md` | sem alteração necessária — já estava completo |
| `SYMBOL_ENTRY_TEMPLATE.md` | sem alteração necessária — já estava completo |
| `INFRASTRUCTURE_AUDIT_001.md` | sem alteração necessária — documento histórico preservado |
| `INFRASTRUCTURE_QA_001.md` | sem alteração necessária — documento histórico preservado |

**QA-NOTE-001 a QA-NOTE-004:** todas as notas não-bloqueantes tratadas. Infraestrutura sem notas pendentes.

---

## 5. Pronto para próximos passos

| Próximo passo | Status |
|---|---|
| Importação controlada de sonhos reais | **PRONTO** — infraestrutura validada e alinhada |
| Skill conversion audit (DREAM_ANALYSIS_PROTOCOL_v0.1 → skill `dream-analysis`) | **PRONTO** — ciclo Hall completo, infraestrutura de registry completa |
| Migração gradual de IDs legados (`DREAM-OLD-XXX` → `DREAM-YYYYMMDD-XXX`) | Aguarda confirmação de datas pelo operador |
| Migração gradual de símbolos (`tabela simples` → `SYM-OP-XXX template`) | Aguarda uso natural + autorização do operador |
| Retroação `sonhos/*.md` (separar relato de leitura) | Aguarda decisão explícita do operador |
| 5 itens HOLD_FOR_REVIEW (ego-Self, tensão obj/subj, affect-ego, focal/tácito, temenos) | Aguarda autorização separada |
| git add + commit do corpus Hall completo | Aguarda decisão do operador |

---

*Patch de infraestrutura. PATCH_INFRASTRUCTURE_METADATA_ONLY executado. 4/4 patches aplicados. Somente cabeçalhos, blocos descritivos e referências alterados — nenhuma entrada real de sonho ou símbolo tocada. Nenhum conteúdo conceitual alterado. Nenhum AGENT.md. Nenhum registry de library. Nenhum git add. Nenhum commit. Infraestrutura de registries finalizada. 2026-06-18 | simb-agent / operador*
