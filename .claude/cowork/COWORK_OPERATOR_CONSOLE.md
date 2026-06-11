# COWORK_OPERATOR_CONSOLE
## Console Operacional do CORE-OS

**Versão:** 1.0 | **Data:** 2026-06-11 | **Ativado em:** CORE-COWORK-ACTIVATION-001

---

## O que é o Cowork

Claude Cowork é o **cockpit operacional** do CORE-OS — o lugar onde o operador usa o sistema vivo dia a dia.

Claude Code é a **oficina estrutural** — onde a anatomia do sistema é criada, cirurgiada e evoluída.

```
COWORK = vida operacional
CODE   = anatomia do sistema
```

O Cowork opera **sobre** arquivos locais. Não os substitui, não os reescreve, não os governa. Ele produz a vida que flui através da estrutura que o Code constrói.

---

## Hierarquia soberana

```
Operador Rafael Santos Pena
  → decide
  → aprova uso
  → valida outputs
  → tem palavra final

FW-CORE (fw-governor)
  → árbitro constitucional
  → resolve conflitos
  → governa agentes

CORE-OS files (Git)
  → memória versionada soberana
  → anatomia que não se dobra ao uso

Workspaces
  → órgãos em uso ativo
  → produto do trabalho operacional

Cowork
  → cockpit onde tudo é acionado
  → não é fonte soberana
  → não substitui os arquivos de design
```

---

## Cowork NÃO é

```
Cowork NÃO é fonte soberana — Git é.
Cowork NÃO altera AGENT.md — Code altera.
Cowork NÃO altera skills — Code altera.
Cowork NÃO altera schemas — Code altera.
Cowork NÃO altera CLAUDE.md — Code altera.
Cowork NÃO altera registry — Code altera.
Cowork NÃO substitui operador — operador decide.
Cowork NÃO substitui advogado, médico ou supervisor IRATA.
```

---

## O que o operador faz no Cowork

| Ação | Agente | Workspace |
|---|---|---|
| Escrever diário, registrar sonho, clareza interna | simb-agent | `.claude/workspaces/simb/` |
| Preparar trabalho em altura, APR, checklist | irata-agent | `.claude/workspaces/irata/` |
| Organizar inspeção, relatório técnico | inspection-agent | `.claude/workspaces/inspection/` |
| Organizar processo, linha do tempo, matriz de prova | legal-agent | `.claude/workspaces/legal/` |
| Diário de decisão, tese, mapa de risco de carteira | asset-agent | `.claude/workspaces/asset/` |

---

## Como chamar um agente no Cowork

1. Declarar contexto: domínio do pedido.
2. O agente responde dentro do seu domínio.
3. O agente pode criar arquivos no próprio workspace.
4. O operador valida o output.
5. O agente registra a ação no `USE_LOG.md` do workspace.

Para roteamento detalhado: `COWORK_ROUTING_PROTOCOL.md`

---

## Limites permanentes do Cowork

```
Agentes ativados no Cowork NÃO podem:
  - alterar AGENT.md
  - alterar skills
  - alterar schemas
  - alterar CLAUDE.md
  - alterar registry
  - executar SQL
  - acessar banco
  - ativar conectores externos
  - criar embeddings
  - acessar RAG não autorizado
  - fazer git push
  - decidir por conta própria sem operador

OPERATOR OWNS SYSTEM
OPERATOR OWNS DECISION
COWORK IS A TOOL
```
