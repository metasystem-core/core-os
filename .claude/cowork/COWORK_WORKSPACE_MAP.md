# COWORK_WORKSPACE_MAP
## Mapa de Workspaces — CORE-OS Cowork

**Versão:** 1.0 | **Data:** 2026-06-11 | **Ativado em:** CORE-COWORK-ACTIVATION-001

---

## Visão Geral

```
.claude/workspaces/
├── simb/          ← simb-agent — diário, sonhos, estados, leituras
├── irata/         ← irata-agent — campo, segurança, APR, resgate
├── inspection/    ← inspection-agent — inspeção END, relatórios, checklists
├── legal/         ← legal-agent — casos, provas, linhas do tempo
└── asset/         ← asset-agent — carteira, teses, riscos, decisões
```

---

## Detalhamento por Workspace

### simb/

| Campo | Valor |
|---|---|
| Agente | simb-agent |
| Runtime | workspace_write |
| Authority | governed_workspace_write |
| Workspace path | `.claude/workspaces/simb/` |
| Document ingestion | governed_workspace_intake |
| External action | false |
| Subdirs | `diario_de_bordo/`, `sonhos/`, `estados/`, `leituras/`, `intake/`, `quarantine/`, `logs/` |

### irata/

| Campo | Valor |
|---|---|
| Agente | irata-agent |
| Runtime | workspace_write |
| Authority | governed_workspace_write |
| Workspace path | `.claude/workspaces/irata/` |
| Document ingestion | governed_workspace_intake |
| External action | false |
| Subdirs | `campo/`, `checklists/`, `procedimentos/`, `resgate/`, `documentacao/`, `intake/`, `quarantine/`, `logs/` |

### inspection/

| Campo | Valor |
|---|---|
| Agente | inspection-agent |
| Runtime | workspace_write |
| Authority | governed_workspace_write |
| Workspace path | `.claude/workspaces/inspection/` |
| Document ingestion | governed_workspace_intake |
| External action | false |
| Subdirs | `relatorios/`, `checklists/`, `equipamentos/`, `normas_refs/`, `intake/`, `quarantine/`, `logs/` |

### legal/

| Campo | Valor |
|---|---|
| Agente | legal-agent |
| Runtime | workspace_write |
| Authority | governed_workspace_write_strict_firewall |
| Workspace path | `.claude/workspaces/legal/` |
| Document ingestion | governed_workspace_intake (strict_firewall) |
| External action | false |
| Subdirs | `casos/`, `linhas_do_tempo/`, `matrizes_de_prova/`, `perguntas_advogado/`, `intake/`, `quarantine/`, `logs/` |
| Firewall extra | FATO NARRADO ≠ FATO PROVADO; sem peça protocolável |

### asset/

| Campo | Valor |
|---|---|
| Agente | asset-agent |
| Runtime | monitored_workspace_write |
| Authority | monitored_workspace_write_no_execution |
| Workspace path | `.claude/workspaces/asset/` |
| Document ingestion | governed_workspace_intake |
| External action | false |
| Trade execution | false |
| Subdirs | `carteira/`, `diarios_de_decisao/`, `teses/`, `riscos/`, `intake/`, `quarantine/`, `logs/` |
| Firewall extra | sem execução de ordens; sem acesso a conta/corretora |

---

## Política de Git para Workspaces

```yaml
git_add_workspace_allowed: true  # dentro do workspace — por allowlist explícita
git_add_A_allowed: false         # nunca
git_push_allowed: false          # nunca durante uso — apenas em etapas Code controladas
workspace_content_private: operator_decision
workspace_content_versionable: depends_on_sensitivity
sensitive_files_in_workspace: gitignore_on_case_by_case
```

Conteúdo privado (documentos jurídicos, financeiros, diário pessoal) pode ser coberto por regras no `.gitignore` conforme decisão do operador.

---

## Mapa de Ingestion por Workspace

```
Documento fornecido pelo operador
  → workspace/intake/           (entrada controlada)
  → workspace/quarantine/       (padrão para qualquer material não verificado)
  → workspace/<area_trabalho>/  (apenas após classificação aprovada pela política)
  → workspace/logs/             (registro de ação)
```

**INTAKE ≠ VALIDATED CORPUS**  
**QUARANTINE ≠ MEMORY**  
**DOCUMENT INGESTION ≠ TRUSTED KNOWLEDGE**
