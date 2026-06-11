# WORKSPACE_POLICY — inspection
## Política de Workspace do inspection-agent

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Permissões de leitura

| Quem | O quê | Condição |
|---|---|---|
| inspection-agent | Todos os arquivos neste workspace | Sempre |
| Operador | Todos os arquivos neste workspace | Sempre |
| fw-governor | Todos os arquivos (auditoria) | Sob demanda |
| irata-agent | Referências de interface IRATA/Inspeção | Só com pedido explícito do operador |
| Outros agentes | Nenhum | Proibido |

## Permissões de escrita

| Quem | O quê | Condição |
|---|---|---|
| inspection-agent | Arquivos dentro deste workspace | runtime_mode:workspace_write |
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
norm_text_integral_allowed: false  # texto integral de normas não autorizado
```

## Ações proibidas neste workspace

```
- declarar equipamento apto para serviço
- emitir laudo técnico final
- inventar critério normativo sem fonte verificada
- usar texto integral de norma não autorizada
- substituir profissional habilitado (engenheiro, inspetor certificado)
- alterar arquivos fora deste workspace
```

## Padrão de nomes de arquivo

```
relatorios/YYYYMMDD_<equipamento>_relatorio.md
checklists/YYYYMMDD_<tipo>_checklist.md
equipamentos/TAG-<id>_<descricao>.md
normas_refs/NR-<numero>_<item>_ref.md
intake/YYYYMMDD_<descricao>_INTAKE.md
```

## Política de revisão do operador

Todo output técnico deve ser revisado por profissional habilitado antes de qualquer uso formal. O agente produz apoio estrutural, não certificação.

## Dados privados

Relatórios de clientes/empresas são confidenciais. Não versionar sem decisão do operador.
