# CORE/IRIS — Edinger Anatomy Registry Update Audit 001

## 1. Status

Concluído. Patch mínimo aplicado em `CONCEPTS_REGISTRY.md` e `SOURCES_REGISTRY.md`. Nenhum registry de `protocol_notes` ou `risk_cards` criado — sem suporte de formato existente. `LIBRARY_INDEX.md` identificado mas não modificado, por risco de conflito com formato já desatualizado. Nenhum card alterado. Nenhum AGENT.md alterado. Nenhum git add/commit executado.

---

## 2. Registries encontrados em `.claude/workspaces/simb/library/registries/`

| arquivo | escopo |
|---|---|
| `ARCHITECTURAL_OBSERVATIONS_REGISTRY.md` | memória de design |
| `AUTHORS_REGISTRY.md` | autores ingeridos |
| `CONCEPTS_REGISTRY.md` | concept cards + tags |
| `INGESTION_DECISIONS_REGISTRY.md` | decisões de intake |
| `LEARNING_OBSERVATIONS_REGISTRY.md` | observações de aprendizado |
| `RESPONSE_TESTS_REGISTRY.md` | testes de fidelidade |
| `SOURCES_REGISTRY.md` | fontes + metadados de intake |
| `SYMBOLS_REGISTRY.md` | symbol cards |

Adicionalmente, fora de `registries/` mas relevante: `LIBRARY_INDEX.md` (raiz de `library/`) — índice agregador que duplica parcialmente o conteúdo de `SOURCES_REGISTRY.md` e `CONCEPTS_REGISTRY.md`.

**Não existe** registry para `protocol_notes/` nem para `risk_cards/` — nenhum arquivo, nenhuma seção, nenhuma referência a `PROT-` ou `RISK-` em qualquer registry existente (confirmado via grep).

---

## 3. Mapeamento — quais registries cobrem o quê

- **sources** → `SOURCES_REGISTRY.md` (formato claro, tabela única, IDs no padrão `SRC-SIMB-NNN`).
- **concept cards** → `CONCEPTS_REGISTRY.md` (formato claro, tabela única + tabela de tags, IDs no padrão `CON-SIMB-NNN`).
- **protocol notes** → nenhum registry. Sem precedente.
- **risk cards** → nenhum registry. Sem precedente.
- **library index / master index** → `LIBRARY_INDEX.md` existe, mas está desatualizado (última atualização: 2026-06-12) e não inclui o batch Edinger anterior (CON-032, CON-033, SRC-008), que já está pendente de sincronização antes mesmo desta tarefa. Tratado como formato incerto/risco de conflito — não modificado.

---

## 4. Relatório pré-edição (antes de qualquer patch)

- **Arquivos encontrados:** listados na Seção 2.
- **Já modificados no git status (antes desta tarefa):** `CONCEPTS_REGISTRY.md` e `SOURCES_REGISTRY.md` — ambos já traziam, como alteração preexistente não commitada, o batch anterior CON-032/CON-033/SRC-008 (Edinger — *Creation of Consciousness*). `LIBRARY_INDEX.md` não estava modificado (sem alterações pendentes).
- **Formato claro?** Sim, para `CONCEPTS_REGISTRY.md` e `SOURCES_REGISTRY.md` — tabela markdown simples, uma linha por entidade, convenção de ID consistente (`CON-SIMB-NNN` referenciando o arquivo `CON-NNN_*.md`; `SRC-SIMB-NNN` referenciando `SRC-NNN_*.md`). Esse padrão "ID curto no arquivo, ID com infixo `-SIMB-` no registry" já estava em uso antes desta tarefa (visível em CON-032/033 e SRC-008) e foi seguido exatamente.
- **Suporte para `protocol_notes/` e `risk_cards/`?** Não. Nenhuma estrutura, tabela ou convenção prévia.

---

## 5. Registries lidos

- `CONCEPTS_REGISTRY.md` (leitura completa)
- `SOURCES_REGISTRY.md` (leitura completa)
- `LIBRARY_INDEX.md` (leitura completa, para fins de identificação — não editado)
- Demais registries listados na Seção 2 não foram lidos (fora de escopo: não cobrem sources/concepts/protocol_notes/risk_cards).

---

## 6. Registries modificados

| arquivo | ação |
|---|---|
| `CONCEPTS_REGISTRY.md` | append de 2 linhas na tabela principal (CON-SIMB-034, CON-SIMB-035) + append de 1 linha na tabela de tags (`alchemical_operation`) + atualização da tag `symbolic_method` para incluir as duas novas entradas. Alterações preexistentes (CON-SIMB-032, CON-SIMB-033) preservadas integralmente. |
| `SOURCES_REGISTRY.md` | append de 1 linha na tabela principal (SRC-SIMB-009). Alteração preexistente (SRC-SIMB-008) preservada integralmente. |

`LIBRARY_INDEX.md` — **não modificado** (ver Seção 7, justificativa).

---

## 7. Entradas adicionadas

**CONCEPTS_REGISTRY.md:**

| concept_id | conceito | source_id | status | card_path |
|---|---|---|---|---|
| CON-SIMB-034 | Coagulatio — dar corpo a um padrão simbólico | SRC-SIMB-009 | review | concept_cards/CON-034_coagulatio-dar-corpo-a-padrao-simbolico.md |
| CON-SIMB-035 | Sublimatio — ganhar distância sem perder o corpo | SRC-SIMB-009 | review | concept_cards/CON-035_sublimatio-distancia-sem-perder-corpo.md |

Campos `therapeutic_confusion_risk` e `authority_risk` definidos como `true`/`true` para ambas — consistente com o padrão já aplicado a CON-032/033 (mesma fonte, mesma tradição, mesmo nível de cautela), já que os cards de origem não possuem esses dois campos explicitamente (usam um schema de campos diferente: `risks`, `mandatory_firewall`, etc.). `status: review` usado (não `active`), refletindo fielmente o `status: review` declarado nos próprios cards CON-034/CON-035 — nenhuma promoção de status foi feita nesta etapa.

**SOURCES_REGISTRY.md:**

| source_id | title | status |
|---|---|---|
| SRC-SIMB-009 | Anatomy of the Psyche: Alchemical Symbolism in Psychotherapy | private_source_reading_completed |

Status copiado fielmente do manifest (`SRC-009_edinger_anatomy_of_the_psyche.md`), sem alteração.

---

## 8. Entradas não adicionadas e motivo

- **PROT-001, PROT-002, PROT-003 (protocol_notes):** não adicionadas. Não existe registry para este tipo de card. Criar um registry novo agora seria invenção de estrutura fora do escopo desta tarefa (regra: "não inventar registry novo nesta etapa").
- **RISK-001 (risk_cards):** não adicionada, pelo mesmo motivo.
- **LIBRARY_INDEX.md — nenhuma entrada para SRC-009, CON-034, CON-035, PROT-001/002/003, RISK-001:** não adicionada. Este índice já estava desatualizado antes desta tarefa (não reflete CON-032/033/SRC-008, que são anteriores e já confirmados como aprovados). Tentar adicionar apenas o lote Edinger Anatomy criaria uma sincronização parcial e inconsistente, misturando-se de forma confusa com a defasagem preexistente. Risco de conflito classificado como real — tratado conforme a regra "se o formato estiver incerto ou se houver risco de conflito com modificações preexistentes, não modificar e criar relatório apenas".

---

## 9. Suporte para protocol_notes / risk_cards

**Não.**

```yaml
architecture_extension_pending_registry_support: true
pending_types:
  - protocol_notes
  - risk_cards
```

---

## 10. Confirmações

- **Cards não alterados:** confirmado. Nenhum arquivo em `concept_cards/`, `protocol_notes/` ou `risk_cards/` foi modificado nesta etapa — apenas lido para extração de metadados (card_id, source_id, status, title).
- **AGENT.md não alterado:** confirmado. Nenhum arquivo `AGENT.md` foi acessado.
- **Chunks/PDF/cesto não acessados:** confirmado. Nenhum arquivo em `private_full_text_chunks/`, `cesto/`, `sonhos/`, ou qualquer material pessoal/jurídico/financeiro foi acessado nesta etapa.
- **Nenhum git add/commit:** confirmado — ver Seção 11.
- **Registry global fora da library:** não tocado.

---

## 11. Git status

```
git status --short -- .claude/workspaces/simb/library/registries/
 M .claude/workspaces/simb/library/registries/CONCEPTS_REGISTRY.md
 M .claude/workspaces/simb/library/registries/SOURCES_REGISTRY.md

git diff --cached --name-only
(vazio)
```

Apenas os dois arquivos patcheados aparecem como modificados dentro de `registries/`. Nada staged, nada commitado.

---

## 12. Recomendação de próximo passo

1. Operador revisa o patch aplicado em `CONCEPTS_REGISTRY.md` e `SOURCES_REGISTRY.md` (diff pequeno, isolado, sem mistura com alterações preexistentes).
2. Decisão separada e explícita sobre `LIBRARY_INDEX.md`: ou (a) sincronizá-lo formalmente em lote único (cobrindo o débito acumulado desde CON-006 em diante, não só Edinger Anatomy), ou (b) deprecá-lo a favor dos registries individuais como fonte única de verdade.
3. Decisão formal sobre criar `PROTOCOL_NOTES_REGISTRY.md` e `RISK_CARDS_REGISTRY.md` como extensão estrutural — fora do escopo desta tarefa, requer ativação explícita do operador (per `CLAUDE.md`: "mudança estrutural do sistema deve ser feita no Claude Code com patch versionado").
4. Se os itens 1–3 forem aprovados, autorizar etapa futura de `git add` + commit controlado cobrindo todo o lote Edinger Anatomy (cards + manifest + registries + audits).

Nenhuma dessas quatro ações foi executada nesta etapa.

---

*Criado em: 2026-06-17 | Por: simb-agent / operador*
