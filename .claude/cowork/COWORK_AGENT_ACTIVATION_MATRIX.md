# COWORK_AGENT_ACTIVATION_MATRIX
## Matriz de Ativação de Agentes — CORE-OS Cowork

**Versão:** 1.0 | **Data:** 2026-06-11 | **Ativado em:** CORE-COWORK-ACTIVATION-001

---

> Fonte de verdade de status e campos de autoridade: `registry/agents_registry.yaml`  
> Este arquivo é referência de navegação, não de execução.

---

## Agentes Ativos — Workspace Pilot

| Agente | Anterior status | Anterior active | Novo active | Runtime Mode | Operational Authority | Workspace | External Action | Trade Exec |
|---|---|---|---|---|---|---|---|---|
| simb-agent | review_validated | false | **true** | workspace_write | governed_workspace_write | `.claude/workspaces/simb/` | false | N/A |
| irata-agent | review_validated | false | **true** | workspace_write | governed_workspace_write | `.claude/workspaces/irata/` | false | N/A |
| inspection-agent | review_validated | false | **true** | workspace_write | governed_workspace_write | `.claude/workspaces/inspection/` | false | N/A |
| legal-agent | draft | false | **true** | workspace_write | governed_workspace_write_strict_firewall | `.claude/workspaces/legal/` | false | N/A |
| asset-agent | draft | false | **true** | monitored_workspace_write | monitored_workspace_write_no_execution | `.claude/workspaces/asset/` | false | false |

---

## O que `active:true` significa nesta ativação

```yaml
pode:
  - ser chamado no Cowork
  - responder dentro do domínio
  - criar registros no próprio workspace
  - ingerir documentos fornecidos pelo operador (fluxo intake → quarantine → classificação)
  - classificar material
  - gerar artefatos de trabalho
  - atualizar USE_LOG.md e INTAKE_INDEX.md do workspace
  - operar dentro da ramificação própria de workspace

não pode (permanece proibido após active:true):
  - alterar AGENT.md
  - alterar skills
  - alterar schemas
  - alterar CLAUDE.md
  - alterar registry
  - executar SQL
  - acessar banco
  - acessar API externa
  - criar embeddings
  - ativar RAG
  - fazer git push
  - apagar/mover arquivos fora do workspace
  - tomar decisão jurídica/financeira/campo em nome do operador
```

---

## Agentes Não Ativados nesta Etapa

| Agente | Status | active | Razão |
|---|---|---|---|
| fw-governor | active (governo) | (implícito) | Governo — sempre disponível |
| meta-router | active (governo) | (implícito) | Governo — sempre disponível |
| cognitive-logistics | active (governo) | (implícito) | Governo — sempre disponível |
| context-mapper | active (governo) | (implícito) | Governo — sempre disponível |
| norm-agent | review_validated | false | Não incluído no workspace pilot inicial |
| learn-agent | draft | false | Requer ativação separada |
| doc-agent | draft | false | Auxiliar — ativação conforme demanda |
| intake-agent | draft | false | Auxiliar — ativação conforme demanda |
| rag-agent | draft | false | RAG não implementado |
| skill-auditor | draft | false | Bloqueado visitante |
| capability-gap | draft | false | Detecção passiva |

---

## Firewalls Ativos

| Firewall | Proteção |
|---|---|
| `lotofa + asset-core` | Nunca cruzar análise de loteria com decisão financeira real — **absoluto** |
| `legal strict firewall` | FATO NARRADO ≠ FATO PROVADO; peça protocolável proibida |
| `asset no execution` | Sem execução de ordens, sem acesso a conta/corretora |
| `irata field release` | Checklist ≠ liberação de campo; supervisor IRATA decide |
| `inspection certification` | Relatório organizado ≠ laudo emitido; profissional habilitado decide |
| `simb no diagnosis` | Leitura simbólica ≠ diagnóstico; terapeuta decide |

---

## Invariantes

```
AGENT ACTIVATION ≠ SYSTEM STRUCTURE MUTATION
WORKSPACE WRITE ≠ SYSTEM WRITE
active:true ≠ operational_authority irrestrita
active:true ≠ external_action permitida
active:true ≠ pode alterar AGENT.md ou registry
OPERATOR OWNS SYSTEM
OPERATOR OWNS DECISION
```
