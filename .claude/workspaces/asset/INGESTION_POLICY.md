# INGESTION_POLICY — asset
## Política de Ingestão do Workspace ASSET

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Fluxo de Ingestão

```
Operador fornece dado/documento financeiro
  → 1. intake/       — registro com ID, data, tipo, fonte
  → 2. classificação — tipo (extrato/relatório/análise/tese), data do dado, fonte
  → 3. quarantine/   — padrão para qualquer dado não verificado pelo operador
  → 4. avaliação     — data de referência (dado fresco vs. stale?), risco, fonte
  → 5. promoção      — apenas com data confirmada e operador ciente
  → 6. área de trabalho (carteira/, teses/, riscos/, diarios_de_decisao/)
  → 7. atualização de INTAKE_INDEX.md e USE_LOG.md
```

## Regra de dado fresco

**Todo** dado financeiro ingerido deve ter data de referência declarada explicitamente.  
Dado sem data declarada → `stale_risk:unknown` → quarantine até o operador confirmar.

```
DADO INGERIDO ≠ DADO ATUAL
EXTRATO FORNECIDO ≠ POSIÇÃO REAL HOJE
ANÁLISE LIDA ≠ ANÁLISE VÁLIDA AGORA
```

## Tipos de fonte aceitos

| Tipo | Classificação | Destino padrão |
|---|---|---|
| Extrato de carteira (operador) | altamente sensível | quarantine → carteira/ |
| Relatório de corretora | sensível | quarantine → carteira/ |
| Análise de empresa/setor | auxiliar | quarantine → teses/ |
| Nota do operador sobre decisão | privado | diarios_de_decisao/ |
| Dado de preço/cotação | referencial / data obrigatória | quarantine → teses/ |

## Classificação de sensibilidade

| Flag | Significado |
|---|---|
| `highly_sensitive` | Patrimônio, posições, extratos — não versionar |
| `sensitive` | Dados financeiros do operador |
| `auxiliary` | Análise de terceiro — verificar data antes de usar |
| `stale_risk` | Dado sem data confirmada ou possivelmente desatualizado |
| `unverified` | Origem não confirmada → quarantine obrigatória |

## Regras de promoção

```yaml
pode_promover_se:
  - operador confirma dado e sua data de referência
  - dado é escrita própria do operador (nota, premissa)
  - análise tem data explícita e operador ciente

não_promover_se:
  - dado sem data declarada
  - extrato sem confirmação do operador
  - análise cuja data de referência seja incerta
```

## Firewall lotofa — absoluto

Nenhum dado, análise ou documento relacionado a loterias/lotofa pode ser ingerido neste workspace. O firewall `lotofa + asset-core` é absoluto e inviolável.

## Log de ingestão

Toda ingestão registrada em `INTAKE_INDEX.md` com:
- intake_id (formato: INT-ASSET-YYYYMMDD-NNN)
- data, filename, tipo, data_referencia_dado, sensibilidade, classificação, destino, status
