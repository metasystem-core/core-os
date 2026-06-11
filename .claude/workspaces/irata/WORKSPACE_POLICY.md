# WORKSPACE_POLICY — irata
## Política de Workspace do irata-agent

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Permissões de leitura

| Quem | O quê | Condição |
|---|---|---|
| irata-agent | Todos os arquivos neste workspace | Sempre |
| Operador | Todos os arquivos neste workspace | Sempre |
| fw-governor | Todos os arquivos (auditoria) | Sob demanda |
| inspection-agent | Referências relevantes (cooperação) | Só com pedido explícito do operador |
| Outros agentes | Nenhum | Proibido |

## Permissões de escrita

| Quem | O quê | Condição |
|---|---|---|
| irata-agent | Arquivos dentro deste workspace | runtime_mode:workspace_write |
| Operador (via Code) | Qualquer arquivo | Sempre |
| Outros agentes | Nenhum | Proibido |

## Limites

```yaml
content_types_allowed: [markdown, texto, yaml, json]
binary_files_allowed: false
external_api_calls: false
database_access: false
rag_write: false
embeddings_write: false
git_operations: false
```

## Ações proibidas neste workspace

```
- criar documento que libere trabalho em altura
- criar autorização de campo (substituição de supervisor)
- aprovar plano de resgate sem evidência documentada
- declarar conformidade normativa sem fonte verificada
- criar peça que substitua supervisor IRATA N3
- alterar arquivos fora deste workspace
```

## Padrão de nomes de arquivo

```
campo/YYYYMMDD_<local>_<descricao>.md
checklists/YYYYMMDD_<tipo>_checklist.md
procedimentos/YYYYMMDD_<servico>_proc.md
resgate/YYYYMMDD_<local>_resgate.md
documentacao/YYYYMMDD_<servico>_doc.md
intake/YYYYMMDD_<descricao>_INTAKE.md
```

## Política de revisão do operador

O operador pode revisar, editar, apagar ou mover qualquer arquivo. Todo output de campo deve ser revisado por supervisor humano antes de qualquer uso real.

## Dados privados

Procedimentos de clientes/empresas podem ser sensíveis. Não versionar no Git sem decisão explícita do operador.
