# COWORK_RUNTIME_POLICY
## Política de Runtime do CORE-OS via Cowork

**Versão:** 1.0 | **Data:** 2026-06-11 | **Ativado em:** CORE-COWORK-ACTIVATION-001

---

## Runtime Modes

| Mode | Código | Descrição | Quem pode operar |
|---|---|---|---|
| `design_only` | 0 | Design de referência. Sem execução. Sem workspace write. | Code (Claude Code) |
| `monitored_use` | 1 | Uso supervisionado com registro. Sem escrita autônoma. | Cowork + operador supervisionando cada ação |
| `workspace_write` | 2 | Agente pode criar/editar arquivos no próprio workspace. | Cowork — agentes ativados |
| `governed_action` | 3 | Ação que afeta sistemas além do workspace (ex.: email, formulário). Requer aprovação explícita. | Reservado — não ativo em ACTIVATION-001 |
| `external_action` | 4 | Acesso a APIs externas, bancos, sistemas vivos. Requer ativação formal separada. | Reservado — não ativo em ACTIVATION-001 |

---

## Agentes Ativos nesta Ativação

| Agente | Runtime Mode | Observation |
|---|---|---|
| simb-agent | `workspace_write` | Escreve no workspace simb/ |
| irata-agent | `workspace_write` | Escreve no workspace irata/ |
| inspection-agent | `workspace_write` | Escreve no workspace inspection/ |
| legal-agent | `workspace_write` | Escreve no workspace legal/ — firewall estrito |
| asset-agent | `monitored_workspace_write` | Registra sem executar. Nunca recomenda ordem direta sem risco mapeado. |

---

## O que `workspace_write` permite

```yaml
pode:
  - criar arquivos dentro do próprio workspace
  - editar arquivos dentro do próprio workspace
  - criar pastas dentro do próprio workspace
  - ingerir documentos no intake/ do próprio workspace
  - classificar documentos no próprio workspace
  - atualizar USE_LOG.md do próprio workspace
  - atualizar INTAKE_INDEX.md do próprio workspace
  - criar checklists, relatórios, notas, diários, matrizes

não pode:
  - alterar AGENT.md
  - alterar skills
  - alterar schemas
  - alterar CLAUDE.md
  - alterar registry
  - alterar workspaces de outros agentes
  - executar SQL
  - acessar banco de dados
  - acessar APIs externas
  - criar embeddings
  - acessar RAG não autorizado
  - fazer git add / git commit / git push
  - apagar arquivos fora do workspace
  - mover arquivos fora do workspace
```

---

## Ingestão de Documentos

Documentos fornecidos pelo operador podem ser ingeridos pelos agentes ativos, seguindo o fluxo:

```
operador fornece documento
  → intake/  (registro de entrada)
  → classificação (tipo, sensibilidade, provenance)
  → quarantine/ (padrão para qualquer material não verificado)
  → avaliação (conteúdo, risco, licença)
  → promoção para área de trabalho (só se aprovado pela política)
  → atualização de INTAKE_INDEX.md e USE_LOG.md
```

**DOCUMENT INGESTION ≠ TRUSTED KNOWLEDGE**  
**INTAKE ≠ VALIDATED CORPUS**  
**QUARANTINE ≠ MEMORY**

---

## Ações Externas

Nenhum agente ativo nesta ativação possui `external_action:true`.

Ações futuras que requerem acesso externo (conectores, APIs, banco de dados) serão ativadas em etapa separada, com:
- aprovação explícita do operador primário
- registro formal no evolution log
- atualização do registry por Claude Code
- commit versionado

---

## Invariantes permanentes

```
AGENT ACTIVATION ≠ SYSTEM STRUCTURE MUTATION
WORKSPACE WRITE ≠ SYSTEM WRITE
WORKSPACE WRITE ≠ GIT PUSH
WORKSPACE WRITE ≠ EXTERNAL ACTION
DOCUMENT INGESTION ≠ TRUSTED KNOWLEDGE
INTAKE ≠ VALIDATED CORPUS
QUARANTINE ≠ MEMORY
OPERATOR OWNS SYSTEM
OPERATOR OWNS DECISION
```
