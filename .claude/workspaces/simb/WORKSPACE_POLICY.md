# WORKSPACE_POLICY — simb
## Política de Workspace do simb-agent

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Permissões de leitura

| Quem | O quê | Condição |
|---|---|---|
| simb-agent | Todos os arquivos neste workspace | Sempre |
| Operador | Todos os arquivos neste workspace | Sempre |
| fw-governor | Todos os arquivos (auditoria) | Sob demanda |
| Outros agentes | Nenhum | Proibido |

## Permissões de escrita

| Quem | O quê | Condição |
|---|---|---|
| simb-agent | Arquivos dentro deste workspace | runtime_mode:workspace_write |
| Operador (via Code) | Qualquer arquivo | Sempre — operador é soberano |
| Outros agentes | Nenhum | Proibido |

## Limites

```yaml
max_file_size_per_entry: "sem limite formal — bom senso"
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
- diagnóstico ou prescrição médica/psicológica
- reforço de impulso autodestrutivo
- humilhação ou adulação
- transformação de fantasia em plano de ação obrigatório
- alteração de arquivos fora deste workspace
- leitura de profile.md em modo visitante
```

## Padrão de nomes de arquivo

```
diario_de_bordo/YYYYMMDD_<tema>.md
sonhos/YYYYMMDD_<titulo>.md
estados/YYYYMMDD_<estado>.md
leituras/YYYYMMDD_<tema>_leitura.md
intake/YYYYMMDD_<descricao>_INTAKE.md
```

## Política de revisão do operador

O operador pode revisar, editar, apagar ou mover qualquer arquivo deste workspace a qualquer momento. O agente não questiona o operador sobre seus próprios registros.

## Dados privados

Conteúdo pessoal (diário, sonhos, estados) é considerado sensível. Não versionar no Git sem decisão explícita do operador.
