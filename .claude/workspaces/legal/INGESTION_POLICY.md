# INGESTION_POLICY — legal
## Política de Ingestão do Workspace LEGAL

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Fluxo de Ingestão

```
Operador fornece documento jurídico
  → 1. intake/       — registro com ID, data, tipo, origem processual
  → 2. classificação — tipo (petição/decisão/contrato/intimação), sensibilidade, provenance
  → 3. quarantine/   — padrão OBRIGATÓRIO para todo documento jurídico
  → 4. avaliação     — autenticidade declarada, risco, contexto processual
  → 5. promoção      — apenas se: operador confirma + documento do próprio processo
  → 6. área de trabalho (casos/, linhas_do_tempo/, matrizes_de_prova/)
  → 7. atualização de INTAKE_INDEX.md e USE_LOG.md
```

## Regra de quarentena — OBRIGATÓRIA

**Todo** documento jurídico entra obrigatoriamente no `quarantine/` antes de qualquer uso.

O agente NÃO usa conteúdo jurídico sem que o operador confirme:
1. que o documento é legítimo e pertence ao processo
2. que o agente pode ler/organizar o conteúdo

## Tipos de fonte aceitos

| Tipo | Classificação | Destino padrão |
|---|---|---|
| Petição/peça do processo | altamente sensível | quarantine → casos/ |
| Decisão/sentença/acórdão | altamente sensível | quarantine → casos/ |
| Intimação/notificação | altamente sensível | quarantine → casos/ |
| Contrato (fornecido pelo operador) | altamente sensível | quarantine → casos/ |
| E-mail jurídico | sensível | quarantine → casos/ |
| Nota do operador sobre o caso | privado | quarantine → casos/ |
| Jurisprudência (referência auxiliar) | auxiliar | quarantine → matrizes_de_prova/ |

## Classificação de sensibilidade

| Flag | Significado |
|---|---|
| `highly_sensitive` | Documento processual real — não redistribuir, não versionar |
| `sensitive` | Informação jurídica do operador |
| `auxiliary` | Jurisprudência ou doutrina de referência |
| `unverified` | Origem não confirmada → quarantine obrigatória |

## Regras de promoção

```yaml
pode_promover_se:
  - operador confirma que documento é legítimo
  - documento pertence ao processo do operador
  - agente usa apenas para organizar, não para concluir

não_promover_se:
  - documento de terceiro sem autorização
  - documento cuja autenticidade não foi confirmada
  - jurisprudência como tese definitiva sem validação do advogado
```

## Restrições críticas do firewall legal

```
Documento ingerido ≠ prova suficiente
Documento organizado ≠ estratégia processual
Prazo lido ≠ prazo forense confirmado
Fato narrado ≠ fato provado
INGESTION ≠ TRUSTED LEGAL CORPUS
```

## Log de ingestão

Toda ingestão registrada em `INTAKE_INDEX.md` com:
- intake_id (formato: INT-LEG-YYYYMMDD-NNN)
- data, filename, tipo, sensibilidade, processo_referenciado, destino, status
