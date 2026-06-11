# Política — Não Apagar / Backup / Hash

## Regra dura

Não apagar arquivo normativo automaticamente.

## Antes de qualquer movimentação

Registrar:

- path original;
- path destino;
- tamanho;
- timestamp;
- SHA-256;
- classificação;
- norma associada;
- motivo da movimentação;
- move_session_id.

## Duplicatas

Duplicata não significa lixo.

Classificar duplicata como:

- exact_duplicate_same_hash;
- same_norm_different_file;
- same_norm_different_edition;
- possible_addendum;
- derived_processed_file;
- unknown_duplicate_candidate.

Somente `exact_duplicate_same_hash` pode ser candidato a arquivamento, nunca exclusão imediata.

## Versões antigas

Versões antigas devem ir para:

norm_library/raw/private_authorized/[publisher]/[norm_code]/historical/

ou estrutura equivalente.

## Arquivos problemáticos

Arquivos com erro de leitura vão para:

norm_library/quarantine/

com log de erro.
