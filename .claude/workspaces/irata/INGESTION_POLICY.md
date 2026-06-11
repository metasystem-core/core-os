# INGESTION_POLICY — irata
## Política de Ingestão do Workspace IRATA

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Fluxo de Ingestão

```
Operador fornece documento técnico
  → 1. intake/       — registro com ID, data, tipo, origem
  → 2. classificação — técnico/normativo/procedimento/evidência, licença, sensibilidade
  → 3. quarantine/   — padrão para qualquer material não verificado
  → 4. avaliação     — conteúdo, risco, provenance (oficial/IRATA/privado/auxiliar)
  → 5. promoção      — só se aprovado pela política abaixo
  → 6. área de trabalho (campo/, checklists/, procedimentos/, resgate/, documentacao/)
  → 7. atualização de INTAKE_INDEX.md e USE_LOG.md
```

## Tipos de fonte aceitos

| Tipo | Classificação | Destino padrão |
|---|---|---|
| Procedimento de trabalho da empresa | privado / confidencial | quarantine → documentacao/ |
| Norma IRATA (material do operador) | referencial / potencial licenciado | quarantine → normas_refs/ |
| APR anterior (documento de campo) | privado | quarantine → campo/ |
| Checklist de empresa | privado | quarantine → checklists/ |
| Manual técnico de equipamento | referencial | quarantine → documentacao/ |
| Foto/evidência de campo | privado | quarantine → campo/ |

## Classificação de sensibilidade

| Flag | Significado |
|---|---|
| `private` | Pertence ao operador ou cliente — não redistribuir |
| `licensed` | Potencial material sob licença (IRATA, norma) — não reproduzir integralmente |
| `referential` | Pode ser usado como referência local |
| `official` | Fonte oficial pública verificada |
| `unverified` | Origem não confirmada → quarantine obrigatória |

## Regras de promoção

```yaml
pode_promover_se:
  - operador confirma origem e autorização de uso local
  - documento é do próprio operador (APR, checklist pessoal)
  - norma IRATA: uso local de referência — sem redistribuição

não_promover_se:
  - documento de cliente sem autorização de uso
  - norma cujo uso integral não foi verificado
  - material de origem desconhecida
```

## Restrição crítica

Nenhum documento ingerido substitui a verificação presencial do supervisor. Todo material de campo é referência de apoio, não autorização.

## Log de ingestão

Toda ingestão registrada em `INTAKE_INDEX.md` com:
- intake_id (formato: INT-IRATA-YYYYMMDD-NNN)
- data, filename, tipo, sensibilidade, classificação, destino, status
