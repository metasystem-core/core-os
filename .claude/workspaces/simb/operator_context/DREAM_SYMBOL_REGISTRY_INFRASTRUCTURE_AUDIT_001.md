# DREAM_SYMBOL_REGISTRY_INFRASTRUCTURE_AUDIT_001

```yaml
audit_id: DREAM_SYMBOL_REGISTRY_INFRASTRUCTURE_AUDIT_001
modo: REGISTRY_INFRASTRUCTURE_CREATE_OR_RECONCILE_ONLY
data: 2026-06-18
resultado_preflight: AMBOS_EXISTEM
modo_ativado: RECONCILE
arquivos_criados: 3
arquivos_reconciliados: 2
arquivos_preservados: todos_os_demais
sonhos_reais_importados: NÃO
simbolos_reais_importados: NÃO
AGENT_md_alterado: NÃO
registries_conceituais_alterados: NÃO
git_add_executado: NÃO
git_commit_executado: NÃO
pronto_para_qa_infraestrutura: SIM
```

---

## 1. Preflight — arquivos encontrados

| Arquivo | Localização | Status encontrado | Ação |
|---|---|---|---|
| `DREAM_REGISTRY.md` | `operator_context/DREAM_REGISTRY.md` | **EXISTE** — 382 linhas, 34+ sonhos | RECONCILE — não sobrescrever |
| `SYMBOL_REGISTRY.md` | `operator_context/SYMBOL_REGISTRY.md` | **EXISTE** — 86 linhas, 20+ símbolos | RECONCILE — não sobrescrever |
| `SONHOS_INDEX.md` | `sonhos/SONHOS_INDEX.md` | EXISTE — 4 arquivos raw indexados | PRESERVAR — estrutura paralela legada |
| `sonhos/*.md` | `sonhos/` | 4 arquivos raw de sonhos | PRESERVAR — não alterar |
| `library/registries/SYMBOLS_REGISTRY.md` | biblioteca | EXISTE — symbol_cards arquetípicos | PRESERVAR — distinto do SYMBOL_REGISTRY de operador |
| `operator_context/OPERATOR_CONTEXT_PROTOCOL.md` | `operator_context/` | EXISTE | PRESERVAR |
| templates/ dir | `operator_context/templates/` | NÃO EXISTIA | CRIAR |

---

## 2. Decisão de localização canônica

**DREAM_REGISTRY:** `operator_context/DREAM_REGISTRY.md`

**Justificativa:** arquivo já existia com dados substantivos (34+ sonhos, incluindo importações de ODT de 2016). Mover ou duplicar seria destrutivo. Localização `operator_context/` é correta — sonhos são material privado do operador, não biblioteca pública/conceitual.

**SYMBOL_REGISTRY:** `operator_context/SYMBOL_REGISTRY.md`

**Justificativa:** arquivo já existia com 20+ símbolos rastreados. Mesmo argumento acima.

**Distinção importante preservada:**

| Registry | Caminho | Escopo |
|---|---|---|
| DREAM_REGISTRY.md | `operator_context/` | Sonhos pessoais — privado, não exportar |
| SYMBOL_REGISTRY.md | `operator_context/` | Símbolos pessoais recorrentes — privado, sem dicionário fixo |
| SYMBOLS_REGISTRY.md | `library/registries/` | Symbol cards arquetípicos de biblioteca (Neumann, etc.) — diferente |

---

## 3. Arquivos reconciliados (headers atualizados)

### 3.1 DREAM_REGISTRY.md

**Alteração:** header YAML expandido com campos de privacidade e rastreabilidade.

**Campos adicionados:**
```yaml
privacy: private_operator_context
no_public_export: true
raw_report_preserved: true
interpretation_separated: true
atualizado_em: 2026-06-18
protocol_ref: DREAM_SYMBOL_REGISTRY_USAGE_PROTOCOL.md
template_ref: templates/DREAM_ENTRY_TEMPLATE.md
linked_from: DREAM_ANALYSIS_PROTOCOL_v0.1 / PROT-005 / CON-039 / PATCH-001
```

**Conteúdo existente:** integralmente preservado — 34+ registros de sonhos (DREAM-OLD-001 a DREAM-OLD-034, DREAM-NEW-001, DREAM-RECENTE-001 a -004), notas de importação, observações gerais, seções de sonhos buscados e não encontrados.

### 3.2 SYMBOL_REGISTRY.md

**Alteração:** header YAML expandido com campos de privacidade e distinção de registries.

**Campos adicionados:**
```yaml
privacy: private_operator_context
no_fixed_dictionary: true
recurrence_tracking_only: true
no_public_export: true
atualizado_em: 2026-06-18
protocol_ref: DREAM_SYMBOL_REGISTRY_USAGE_PROTOCOL.md
template_ref: templates/SYMBOL_ENTRY_TEMPLATE.md
nota_duplicacao: Este arquivo rastreia símbolos pessoais do operador em sonhos. Distinto de library/registries/SYMBOLS_REGISTRY.md
```

**Conteúdo existente:** integralmente preservado — 20+ entradas de símbolos em tabelas.

---

## 4. Arquivos criados

| # | Arquivo | Tipo | Status |
|---|---|---|---|
| 1 | `operator_context/DREAM_SYMBOL_REGISTRY_USAGE_PROTOCOL.md` | Protocolo de uso (10 seções) | ✓ CRIADO |
| 2 | `operator_context/templates/DREAM_ENTRY_TEMPLATE.md` | Template de entrada de sonho | ✓ CRIADO |
| 3 | `operator_context/templates/SYMBOL_ENTRY_TEMPLATE.md` | Template de entrada de símbolo | ✓ CRIADO |
| 4 | Este audit | DREAM_SYMBOL_REGISTRY_INFRASTRUCTURE_AUDIT_001.md | ✓ CRIADO |

---

## 5. Conteúdo dos arquivos criados

### DREAM_SYMBOL_REGISTRY_USAGE_PROTOCOL.md (10 seções)

1. Quando registrar sonho
2. Quando registrar símbolo
3. Quando criar link sonho↔símbolo
4. Quando marcar high_sensitivity
5. Quando não interpretar
6. Quando pedir autorização
7. Como registrar recorrência verbalizada sem histórico
8. Como atualizar sem apagar relato bruto
9. Como exportar futuramente para Dream Analyzer app
10. Distinção de registries

### DREAM_ENTRY_TEMPLATE.md

Campos cobertos:
`dream_id`, `date_reported`, `date_dreamed`, `source`, `status`, `needs_operator_review`, `raw_report`, `remembered_uncertainty`, `immediate_affect`, `waking_context`, `people_real`, `people_dream_figures`, `places`, `central_images`, `dream_ego_position`, `dream_ego_action`, `body_somatic_notes`, `substances_sleep_context_if_provided`, `interpretation_status`, `provisional_reading_summary`, `open_questions`, `linked_symbols`, `linked_dreams`, `registry_notes`, `privacy_level`, `action_firewall`

### SYMBOL_ENTRY_TEMPLATE.md

Campos cobertos:
`symbol_id`, `label`, `first_seen`, `last_seen`, `status`, `appearances` (com subfields: `dream_id`, `context`, `affect`, `image_form`, `dream_ego_relation`), `operator_associations`, `cultural_layer_if_relevant`, `archetypal_layer_if_authorized`, `transformations_over_time`, `linked_symbols`, `linked_people_real`, `risk_notes`, `correction_history`, `do_not_reduce_to`, `current_reading`, `reading_status`

---

## 6. Notas de reconciliação — estado atual vs. spec

| Aspecto | Estado atual do DREAM_REGISTRY | Alinhamento com spec |
|---|---|---|
| Estrutura de entrada | Campos simplificados (relato bruto, status, origem, observações) | Parcial — template formal agora em `templates/DREAM_ENTRY_TEMPLATE.md`; entradas existentes pré-datam o template e foram preservadas |
| IDs de sonhos | Mistura de `DREAM-OLD-XXX`, `DREAM-NEW-XXX`, `DREAM-RECENTE-XXX` | Migrar para `DREAM-YYYYMMDD-XXX` quando datas forem confirmadas pelo operador — não retroativo automaticamente |
| Relato bruto separado | Maioria sim, alguns arquivos em `sonhos/` misturam relato e interpretação | DREAM_REGISTRY já documenta isso; retroação requer decisão explícita do operador |
| Firewalls de conteúdo sensível | Presentes informalmente | Formalizado em `DREAM_ENTRY_TEMPLATE.md` (`high_sensitivity`, `action_firewall`) |

| Aspecto | Estado atual do SYMBOL_REGISTRY | Alinhamento com spec |
|---|---|---|
| Estrutura de entrada | Tabelas simples (símbolo, onde apareceu, associação, confiança) | Parcial — template formal agora em `templates/SYMBOL_ENTRY_TEMPLATE.md` |
| IDs de símbolos | Sem IDs formais, apenas labels | Migrar para `SYM-OP-XXX` conforme uso crescer — não retroativo automaticamente |
| Transformações ao longo do tempo | Ausente no formato atual | Novo campo em template |
| Correction_history | Registradas em notas/tabelas | Formalizado no template |

---

## 7. Confirmações de compliance

| Verificação | Status |
|---|---|
| Nenhum sonho real importado nesta operação | ✓ CONFIRMADO |
| Nenhum símbolo real registrado nesta operação | ✓ CONFIRMADO |
| AGENT.md não alterado | ✓ CONFIRMADO |
| concept cards não alterados | ✓ CONFIRMADO |
| protocol notes não alterados | ✓ CONFIRMADO |
| risk cards não alterados | ✓ CONFIRMADO |
| source manifests não alterados | ✓ CONFIRMADO |
| SOURCES_REGISTRY.md não alterado | ✓ CONFIRMADO |
| CONCEPTS_REGISTRY.md não alterado | ✓ CONFIRMADO |
| SYMBOLS_REGISTRY.md (biblioteca) não alterado | ✓ CONFIRMADO |
| sonhos/*.md não alterados | ✓ CONFIRMADO |
| SONHOS_INDEX.md não alterado | ✓ CONFIRMADO |
| git add não executado | ✓ CONFIRMADO |
| git commit não executado | ✓ CONFIRMADO |

---

## 8. Próximos passos recomendados

1. **QA da infraestrutura** — verificar se DREAM_REGISTRY e SYMBOL_REGISTRY são consistentes com o protocolo de uso criado.
2. **Migração gradual de IDs** — quando o operador confirmar datas dos sonhos antigos, migrar `DREAM-OLD-XXX` → `DREAM-YYYYMMDD-XXX`.
3. **Migração gradual de símbolos** — quando novos símbolos forem adicionados, usar template `SYM-OP-XXX`. Entradas existentes em tabela podem ser migradas incrementalmente.
4. **Retroação `sonhos/*.md`** — decidir se os 4 arquivos raw serão mantidos como estão ou migrados para DREAM_REGISTRY no formato template. Requer decisão explícita do operador.
5. **Skill conversion audit** — DREAM_ANALYSIS_PROTOCOL_v0.1 → skill `dream-analysis` (ainda pendente da lista Hall).
6. **5 itens HOLD_FOR_REVIEW** — ego-Self spiration, tensão objetivo/subjetivo, affect-ego, focal/tácito, temenos.

---

*Infraestrutura de registries. REGISTRY_INFRASTRUCTURE_CREATE_OR_RECONCILE_ONLY executado. Modo RECONCILE ativado (ambos já existiam). 2 headers reconciliados, 3 arquivos criados, todos os demais preservados. Nenhum dado de sonho ou símbolo importado/alterado. Nenhum git add. Nenhum commit. 2026-06-18 | simb-agent / operador*
