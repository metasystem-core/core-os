# WORKSPACE_POLICY — legal
## Política de Workspace do legal-agent

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Permissões de leitura

| Quem | O quê | Condição |
|---|---|---|
| legal-agent | Todos os arquivos neste workspace | Sempre |
| Operador | Todos os arquivos neste workspace | Sempre |
| fw-governor | Todos os arquivos (auditoria) | Sob demanda |
| Outros agentes | Nenhum | Proibido sem exceção |

## Permissões de escrita

| Quem | O quê | Condição |
|---|---|---|
| legal-agent | Arquivos dentro deste workspace | runtime_mode:workspace_write + strict_firewall |
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
peça_protocolavel_allowed: false
calculo_prazo_definitivo_allowed: false
estrategia_processual_allowed: false
```

## Ações proibidas neste workspace

```
- criar petição, contestação, recurso ou qualquer peça protocolável
- calcular prazo como verdade forense final
- substituir advogado em qualquer capacidade
- transformar hipótese em tese validada sem fonte verificada
- usar fonte sem rastreabilidade como autoridade jurídica
- orientar ação contra advogado do operador
- protocolar ou simular protocolo de qualquer documento
- alterar arquivos fora deste workspace
```

## Padrão de nomes de arquivo

```
casos/<caso_id>/<descricao>.md
linhas_do_tempo/<caso_id>_timeline.md
matrizes_de_prova/<caso_id>_matriz.md
perguntas_advogado/<caso_id>_perguntas_<data>.md
intake/YYYYMMDD_<descricao>_INTAKE.md
```

## Firewalls explícitos

```
FATO NARRADO ≠ FATO PROVADO
DOCUMENTO EXISTENTE ≠ PROVA SUFICIENTE
HIPÓTESE JURÍDICA ≠ TESE VALIDADA
MINUTA ≠ PEÇA PROTOCOLÁVEL
PRAZO ESTIMADO ≠ PRAZO FORENSE CONFIRMADO
ENTENDIMENTO DO AGENTE ≠ ORIENTAÇÃO DO ADVOGADO
```

## Política de revisão do operador

Todo output jurídico deve ser revisado pelo advogado do operador antes de qualquer uso processual. O agente organiza — o advogado orienta.

## Dados privados

Documentos jurídicos (petições, decisões, intimações, contratos) são **altamente sensíveis**. Nunca versionar no Git sem decisão explícita do operador.
