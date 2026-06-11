# INGESTION_POLICY — simb
## Política de Ingestão do Workspace SIMB

**Versão:** 1.0 | **Data:** 2026-06-11

---

## Fluxo de Ingestão

```
Operador fornece documento/material
  → 1. intake/       — registro de entrada com ID, data, origem
  → 2. classificação — tipo, sensibilidade, provenance declarada
  → 3. quarantine/   — padrão para qualquer material não verificado
  → 4. avaliação     — conteúdo, risco, natureza do material
  → 5. promoção      — só se aprovado pela política abaixo
  → 6. área de trabalho (diario_de_bordo/, sonhos/, estados/, leituras/)
  → 7. atualização de INTAKE_INDEX.md e USE_LOG.md
```

## Tipos de fonte aceitos

| Tipo | Classificação | Destino padrão |
|---|---|---|
| Escrita pessoal do operador | sensível / privado | diario_de_bordo/ ou estados/ |
| Registro de sonho | privado | sonhos/ |
| Nota emocional/impulso | privado | estados/ |
| Material para leitura simbólica | privado / a classificar | leituras/ após classificação |
| Documento externo fornecido | a classificar | quarantine/ até avaliação |

## Classificação de sensibilidade

| Flag | Significado |
|---|---|
| `private` | Conteúdo pessoal do operador — não versionar |
| `sensitive` | Conteúdo emocional/psicológico — não versionar |
| `auxiliary` | Material de referência fornecido para leitura |
| `unverified` | Material de origem desconhecida → quarantine obrigatória |

## Regras de promoção (quarantine → área de trabalho)

```yaml
pode_promover_se:
  - operador declara material como seguro para uso
  - conteúdo é escrita própria do operador
  - material não contém conteúdo de terceiros com direitos não resolvidos

não_promover_se:
  - material de origem desconhecida
  - conteúdo que reforce impulso destrutivo
  - material de terceiros sem consentimento
```

## Quando NÃO ingerir

```
- material que o operador não forneceu explicitamente
- conteúdo que substitua acompanhamento terapêutico formal
- dados de outros sistemas sem autorização do operador
```

## Log de ingestão

Toda ingestão é registrada em `INTAKE_INDEX.md` com:
- intake_id (formato: INT-SIMB-YYYYMMDD-NNN)
- data
- descrição do material
- tipo
- sensibilidade
- destino
- status
