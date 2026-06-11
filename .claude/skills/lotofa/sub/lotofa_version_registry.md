# Sub-skill: lotofa_version_registry

## Função específica
Registrar versões, parâmetros, arquivos e resultados do LOTOFA-CORE.

## Quando consultar
Sempre que uma nova versão for criada, comparada, promovida ou descartada.

## Campos obrigatórios

```yaml
name:
date:
status:
dataset_hash:
parameters:
generated_files:
audit_files:
summary_metrics:
reason_created:
reason_kept_or_discarded:
known_failure_modes:
```

## Estados possíveis

- draft;
- experiment;
- reference_baseline;
- stable_reference;
- deprecated;
- discarded;
- needs_audit.

## Regra crítica

Nenhum set deve existir sem versão, parâmetros mínimos e dataset de origem.
