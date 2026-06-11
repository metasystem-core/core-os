---
name: output-compression-protocol
description: Reduz verbosidade no chat e preserva profundidade em arquivos. Resposta longa no chat é exceção. Análise longa vai para arquivo.
status: active
layer: firmware-light
priority: high
---

# OUTPUT COMPRESSION PROTOCOL

## Princípio

Resposta longa no chat deve ser exceção.
Análise longa deve ir para arquivo.

## Formato padrão de resposta curta no chat

```
## Conclusão
## Base
## Risco
## Próxima ação
## Arquivo gerado (se houver)
```

## Para Claude Code

- Gerar relatório completo em arquivo
- Responder no chat em no máximo 10 linhas
- Listar arquivos criados ou alterados
- Listar erros e lacunas
- Indicar próximo passo

## Regra

Mostrar o suficiente para operar. Salvar o restante de forma rastreável.

## Onde pode falhar

- Análise que requer contexto extenso para ser compreendida
- Decisão que não pode ser resumida sem perda de precisão
