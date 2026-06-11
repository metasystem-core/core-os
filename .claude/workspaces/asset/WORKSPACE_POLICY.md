# WORKSPACE_POLICY — asset
## Política de Workspace do asset-agent

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Permissões de leitura

| Quem | O quê | Condição |
|---|---|---|
| asset-agent | Todos os arquivos neste workspace | Sempre (modo primário) |
| Operador | Todos os arquivos neste workspace | Sempre |
| fw-governor | Todos os arquivos (auditoria) | Sob demanda |
| Outros agentes | Nenhum | Proibido — especialmente lotofa |

## Permissões de escrita

| Quem | O quê | Condição |
|---|---|---|
| asset-agent | Arquivos dentro deste workspace | runtime_mode:monitored_workspace_write |
| Operador (via Code) | Qualquer arquivo | Sempre |
| Outros agentes | Nenhum | Proibido |

## Limites

```yaml
content_types_allowed: [markdown, texto, yaml, json, csv]
binary_files_allowed: false
external_api_calls: false
database_access: false
rag_write: false
embeddings_write: false
git_operations: false
trade_execution: false
corretora_access: false
conta_access: false
lotofa_access: false  # firewall absoluto
```

## Ações proibidas neste workspace

```
- executar ou simular execução de compra/venda
- recomendar ordem direta sem enquadrar risco explicitamente
- prometer retorno ou resultado
- usar dado desatualizado como verdade sem declarar a data
- acessar conta, corretora ou plataforma de investimento
- cruzar com lotofa (firewall absoluto — nunca)
- alterar decision_log em modo visitante
- alterar arquivos fora deste workspace
```

## Padrão de nomes de arquivo

```
carteira/YYYYMMDD_carteira_<versao>.md
diarios_de_decisao/YYYYMMDD_decisao_<descricao>.md
teses/YYYYMMDD_<ticker>_<descricao>_tese.md
riscos/YYYYMMDD_<descricao>_risco.md
intake/YYYYMMDD_<descricao>_INTAKE.md
```

## Política de revisão do operador

O operador valida toda análise antes de qualquer ação real. O agente produz registro e apoio analítico — a decisão é do operador.

## Dados privados

Dados de carteira e patrimônio são **altamente sensíveis**. Nunca versionar no Git sem decisão explícita do operador. O arquivo `cesto/asset_core_plano_aporte_recalibracao.txt` já está protegido por `.gitignore`.
