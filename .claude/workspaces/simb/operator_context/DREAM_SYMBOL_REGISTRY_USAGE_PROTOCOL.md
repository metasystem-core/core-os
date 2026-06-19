---
tipo: operator_context
arquivo: DREAM_SYMBOL_REGISTRY_USAGE_PROTOCOL.md
status: ativo
privacy: private_operator_context
criado_em: 2026-06-18
governa:
  - DREAM_REGISTRY.md
  - SYMBOL_REGISTRY.md
  - templates/DREAM_ENTRY_TEMPLATE.md
  - templates/SYMBOL_ENTRY_TEMPLATE.md
referenciado_por:
  - DREAM_ANALYSIS_PROTOCOL_v0.1 (PROT-005, CON-039, PATCH-001)
  - DREAM_SYMBOL_REGISTRY_INFRASTRUCTURE_AUDIT_001.md
---

# DREAM_SYMBOL_REGISTRY — Protocolo de Uso

> Este protocolo governa DREAM_REGISTRY.md e SYMBOL_REGISTRY.md. Camada privada do operador — não exportar, não versionar material bruto de sonhos.

---

## 1. Quando registrar sonho

**Registrar imediatamente quando:**
- O operador traz relato de sonho em qualquer sessão Iris
- O operador envia arquivo com sonho (odt, txt, md, etc.)
- O operador verbaliza um sonho parcialmente (mesmo que incompleto)

**Registrar com flag `needs_operator_review: true` quando:**
- Relato foi reconstruído de arquivo legado ou exportação de chat
- Data do sonho é desconhecida ou estimada
- Conteúdo foi reconstruído de resumo, não do texto original

**Não registrar ainda quando:**
- O operador menciona sonho mas não quer registrá-lo agora
- O operador pede leitura sem querer manter o relato

---

## 2. Quando registrar símbolo

**Registrar em SYMBOL_REGISTRY quando:**
- Uma imagem aparece em 2 ou mais sonhos distintos
- O operador nomeia explicitamente uma imagem como recorrente ("essa imagem voltou")
- Uma imagem tem carga afetiva alta declarada pelo operador, mesmo em ocorrência única
- O operador pede rastreamento de uma imagem específica

**Não registrar como símbolo:**
- Imagem que apareceu apenas uma vez, sem carga afetiva declarada
- Pessoa real aparecendo em sonho — registrar como figura onírica, não colapsar em símbolo fixo

**Marcador obrigatório para recorrência não indexada:**
```
[recorrência verbalizada / não indexada]
```
Usar quando o operador verbaliza recorrência mas não há histórico formal no DREAM_REGISTRY. Não tratar verbalização como série confirmada.

---

## 3. Quando criar link sonho↔símbolo

**Criar link quando:**
- Símbolo registrado em SYMBOL_REGISTRY aparece em novo sonho → adicionar `dream_id` em `appearances`
- Novo sonho importado contém imagem já registrada como símbolo → adicionar `linked_symbols` no registro do sonho

**Regra de link:** link é factual (imagem apareceu em X sonhos), não interpretativo (imagem "significa" X). Não criar link para afirmar causalidade.

---

## 4. Quando marcar `high_sensitivity`

Marcar status `high_sensitivity` obrigatoriamente em sonhos com:
- Conteúdo sexual explícito (incluindo não-consensual)
- Conteúdo com menor de idade
- Conteúdo de violência física intensa
- Carga afetiva extremamente alta declarada pelo operador (choro, terror, êxtase)
- Figuras reais em contextos que poderiam ser confundidos com julgamento de caráter
- Conteúdo numinoso/transpessoal com risco de inflação simbólica

**Sonhos `high_sensitivity`:**
- Não mencionar em sínteses de perfil sem solicitação explícita do operador
- Não usar como base de inferência sobre comportamento ou desejo real
- Não incluir em qualquer análise comparativa sem o operador solicitar explicitamente cada vez

---

## 5. Quando não interpretar

**Nunca interpretar:**
- Relato recém-chegado sem o operador solicitar leitura
- Material marcado `raw_only` ou `high_sensitivity` sem autorização explícita
- Sonho cujo relato bruto ainda não está separado da interpretação prévia
- Sonho com `needs_operator_review: true` ainda não revisado

**Não interpretar mesmo que o operador pergunte genericamente:**
- "O que você acha desse sonho?" → responder com leitura provisória curta + PROT-004 explícito
- "O que esse sonho significa?" → nunca responder com afirmação definitiva; usar formulação provisória

**Frase proibida:** "O sonho significa X." — sem qualificação de provisoriedade, essa formulação viola PROT-004.

---

## 6. Quando pedir autorização ao operador

Pedir autorização antes de:
- Iniciar rastreamento formal de série (de recorrência verbalizada para série indexada)
- Aplicar amplificação cultural ou arquetípica a símbolo pessoal do operador
- Conectar símbolo onírico a mapa natal, Cabala, ou outro sistema simbólico
- Usar sonho como base de inferência sobre estado psicológico atual do operador
- Exportar qualquer dado de sonho para fora do workspace

**Não pedir autorização para:**
- Registrar relato bruto (registrar é obrigação, não opção)
- Criar link factual sonho↔símbolo baseado em aparição confirmada
- Marcar `needs_operator_review` em material incerto

---

## 7. Como registrar recorrência verbalizada sem histórico

Quando o operador diz "essa imagem voltou" ou "é de novo aquele lugar" **sem que haja entrada prévia no DREAM_REGISTRY:**

1. Registrar o novo sonho com o relato bruto completo
2. Anotar no campo `registry_notes`: `[recorrência verbalizada pelo operador — sem histórico formal anterior no DREAM_REGISTRY]`
3. Adicionar ao SYMBOL_REGISTRY com status `unclear` e nota de ausência de histórico confirmado
4. **Não tratar como série confirmada** — série requer pelo menos 2 entradas com datas distintas no DREAM_REGISTRY
5. Perguntar ao operador se quer iniciar rastreamento formal

---

## 8. Como atualizar sem apagar relato bruto

**Regra absoluta:** o campo `raw_report` nunca é substituído ou editado após o registro inicial. Ele pode ser:
- **Completado** (se o relato original estava incompleto e o operador fornece mais detalhes): adicionar em subseção `raw_report_supplement` com data
- **Corrigido pelo operador**: registrar correção em `registry_notes` com prefixo `CORREÇÃO DO OPERADOR:` e data

**Para adicionar interpretação provisória sem contaminar o relato:**
- Manter `raw_report` intacto
- Adicionar leitura em `provisional_reading_summary` com data e marcação `v1 — provisório`
- Atualizar `interpretation_status` para `interpreted`

**Para atualizar status de um sonho:**
- Alterar apenas o campo `status`
- Registrar motivo da mudança em `registry_notes`

---

## 9. Como exportar futuramente para Dream Analyzer app

**Pré-requisitos antes de qualquer exportação:**
- O operador deve autorizar explicitamente cada exportação
- Todo material exportado deve ser sanitizado: nomes de pessoas reais substituídos por identificadores (ex: "PESSOA-A"), datas exatas suprimidas se o operador solicitar
- Sonhos `high_sensitivity` só exportáveis com autorização específica por sonho
- Material `needs_operator_review: true` não exportável antes da revisão

**Formato de exportação esperado (quando Dream Analyzer app existir):**
- Formato: JSON estruturado com campos mapeados do DREAM_ENTRY_TEMPLATE
- IDs de sonho: `DREAM-YYYYMMDD-XXX` (manter consistência com DREAM_REGISTRY)
- IDs de símbolo: `SYM-OP-XXX` (manter consistência com SYMBOL_REGISTRY)
- Interpretações: exportadas apenas se `interpretation_status: interpreted` e operador autorizar

**Estrutura atual para preparação:**
- Os IDs já existem em DREAM_REGISTRY (`DREAM-OLD-XXX`, `DREAM-NEW-XXX`) — migrar para `DREAM-YYYYMMDD-XXX` quando datas forem confirmadas pelo operador
- Os símbolos em SYMBOL_REGISTRY usam tabela simples — migrar para entradas estruturadas `SYM-OP-XXX` conforme uso crescer

---

## 10. Distinção de registries

| Registry | Localização | Escopo | Tipo |
|---|---|---|---|
| `operator_context/DREAM_REGISTRY.md` | privado | sonhos do operador, relato bruto | privado, não exportar |
| `operator_context/SYMBOL_REGISTRY.md` | privado | imagens recorrentes nos sonhos do operador | privado, sem significado fixo |
| `sonhos/*.md` | privado | arquivos raw individuais (estrutura legada) | privado, manter como estão |
| `library/registries/SYMBOLS_REGISTRY.md` | biblioteca | symbol_cards arquetípicos de fontes (Neumann, etc.) | biblioteca, versionável |

**Regra de não-duplicação:** nunca criar um novo DREAM_REGISTRY ou SYMBOL_REGISTRY — apenas atualizar os existentes em `operator_context/`.

---

*Protocolo de uso. Governa DREAM_REGISTRY.md e SYMBOL_REGISTRY.md. Privado — operator_context. 2026-06-18 | simb-agent / operador*
