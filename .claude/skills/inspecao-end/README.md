# INSPEÇÃO-CORE — Pacote de Skills para Assistente de Inspeção de Equipamentos

Este pacote consolida a arquitetura operacional do **INSPEÇÃO-CORE**, focado em inspeção de equipamentos industriais, END, NR-13, ASME, API, NBR, documentação, laudos, mecanismos de dano, modos de falha, tagueamento técnico e gestão de portfólio de equipamentos.

## Objetivo

Transformar observações de campo, documentos, medições e requisitos normativos em uma conclusão técnica defensável:

```text
fato → evidência → tag → norma/procedimento → consequência → ação → registro
```

## Regra central

Nenhuma conclusão técnica pode ser mais forte que a evidência disponível.

Nenhum mecanismo de dano deve ser afirmado sem compatibilidade físico-química, metalúrgica, operacional, documental ou evidencial.

Nenhum requisito normativo deve ser citado como obrigação sem fonte, aplicabilidade e edição identificadas.

## Estrutura do pacote

- `00_constitution.md` — Constituição do INSPEÇÃO-CORE.
- `01_scope_and_identity.md` — Identidade, escopo e não escopo.
- `02_normative_router.md` — Roteador de fontes normativas.
- `03` a `40` — Skills e subskills operacionais.
- `templates/` — Modelos de ficha, laudo, dossiê, registro de NC e dashboard.
- `schemas/` — Estruturas YAML para dados.
- `examples/` — Exemplos práticos.
- `prompts/` — Prompt mestre para colar em outro modelo/Claude.

## Uso recomendado no Claude

1. Envie este ZIP para o Claude.
2. Peça para ele ler primeiro:
   - `README.md`
   - `00_constitution.md`
   - `40_inspection_taxonomy_tags.md`
   - `prompts/claude_master_prompt.md`
3. Depois peça para ele converter cada skill em uma skill operacional, módulo, comando ou agente conforme a arquitetura que você estiver montando.

## Observação importante

Este sistema não substitui o profissional habilitado, engenheiro responsável, procedimento interno da empresa, norma oficial vigente, ART, laudo assinado ou decisão formal de operação.

Ele é um **assistente técnico estruturador**, voltado para organização, rastreabilidade, classificação, checagem, redação e defesa técnica.
