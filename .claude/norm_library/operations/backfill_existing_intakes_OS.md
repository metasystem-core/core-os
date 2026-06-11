# OS — Backfill dos Intakes Normativos Existentes

## Missão

Converter os intakes normativos já criados para o padrão v1.2 sem perder histórico nem inflar o sistema.

## Entrada

Pacotes v1.1 existentes contendo `blocks/*.jsonl`, `indices/*.json`, logs de ingestão, lacunas, glossários e mapas equipamento→norma.

## Saída

```text
blocks_v1_2/
indices/
traceability_registry/
version_registry/
conflicts/
lacunas/
reports/
qa/
```

## Estratégia

### Fase 1 — Backfill automático
Usar metadados já existentes: `norm_code`, `norm_title`, `source_reference`, `source_file`, `page`, `item`, `original_excerpt_short`, `operational_summary`, `validity_status`.

### Fase 2 — Classificação de qualidade

```text
A = item/seção/página suficientes
B = seção/página aproximada
C = sem item exato
D = sem página
E = tabela/figura/fórmula não processada
F = conflito potencial
```

### Fase 3 — Fila de revisão
Criar `review_queue.jsonl` com blocos que precisam de refinamento humano ou consulta ao PDF original.

## Regras

- Não apagar blocos antigos.
- Não sobrescrever arquivo original sem backup.
- Não inventar página/item.
- Não marcar como `base_para_relatorio` se a referência for fraca.
- Blocos `CRIT`, `PRAZO`, `TABLE`, `FIGURE`, `FORMULA` devem exigir revisão se não tiverem referência precisa.
