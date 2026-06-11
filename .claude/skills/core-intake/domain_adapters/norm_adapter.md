# Adapter — Normativo

## Papel
Rota especializada para normas técnicas, regulamentos, procedimentos normativos e manuais com função normativa.

## Processador
Acionar pipeline normativo v1.2:
- norm-ingest
- norm-nav
- norm-translate
- norm-diff
- norm-merge
- norm-conflict-scan

## Exigências preservadas
- traceability_reference
- citation_export
- versioning
- conflict_scan
- permission_status
- validity_status
- norm_source_registry
- file_location_registry
- blocks JSONL
- indices
- lacunas
- logs

## Observação
Este adapter é pesado por necessidade. Não simplificar.
