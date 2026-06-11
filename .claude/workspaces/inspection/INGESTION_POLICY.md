# INGESTION_POLICY — inspection
## Política de Ingestão do Workspace INSPECTION

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Fluxo de Ingestão

```
Operador fornece documento técnico
  → 1. intake/       — registro com ID, data, tipo, origem
  → 2. classificação — técnico/normativo/relatório/evidência, licença, sensibilidade
  → 3. quarantine/   — padrão para qualquer material não verificado
  → 4. avaliação     — conteúdo, risco, provenance (norma oficial/cliente/privado)
  → 5. promoção      — só se aprovado pela política abaixo
  → 6. área de trabalho (relatorios/, checklists/, equipamentos/, normas_refs/)
  → 7. atualização de INTAKE_INDEX.md e USE_LOG.md
```

## Tipos de fonte aceitos

| Tipo | Classificação | Destino padrão |
|---|---|---|
| Relatório de inspeção anterior | confidencial | quarantine → relatorios/ |
| Ficha de equipamento | privado | quarantine → equipamentos/ |
| NR/norma técnica (referência) | oficial / potencial licenciado | quarantine → normas_refs/ |
| Procedimento de inspeção | privado | quarantine → checklists/ |
| Manual de equipamento | referencial | quarantine → equipamentos/ |
| Laudo anterior (referência) | confidencial | quarantine → relatorios/ |
| Foto/evidência de campo | privado | quarantine → relatorios/ |

## Classificação de sensibilidade

| Flag | Significado |
|---|---|
| `confidential` | Pertence a cliente — não redistribuir |
| `licensed` | Norma técnica sob licença — uso local somente, sem reprodução integral |
| `referential` | Pode ser usado como referência local |
| `official` | Fonte oficial pública (NR Ministério do Trabalho, etc.) |
| `unverified` | Origem não confirmada → quarantine obrigatória |

## Regras de promoção

```yaml
pode_promover_se:
  - documento é do próprio operador ou cliente que autorizou uso
  - norma: uso local referencial — sem texto integral não autorizado
  - operador confirma origem e uso autorizado

não_promover_se:
  - texto integral de norma licenciada sem autorização
  - documento de cliente sem autorização explícita
  - material de origem desconhecida
```

## Restrição crítica

Nenhum documento ingerido substitui a análise presencial do profissional habilitado. O agente organiza — o inspetor certifica.

## Log de ingestão

Toda ingestão registrada em `INTAKE_INDEX.md` com:
- intake_id (formato: INT-INSP-YYYYMMDD-NNN)
- data, filename, tipo, sensibilidade, classificação, destino, status
