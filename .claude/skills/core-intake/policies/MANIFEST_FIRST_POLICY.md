# Política — Manifest First

## Regra

Todo arquivo recebido no cesto deve gerar manifest antes de qualquer processamento profundo.

## Por quê

- economiza tokens;
- evita reprocessamento;
- detecta duplicatas;
- cria trilha de auditoria;
- permite roteamento barato.

## Cache

Se `sha256` já existe:
- não reprocessar;
- recuperar estado anterior;
- criar link/alias se necessário;
- registrar duplicata.

## Exceção

Processamento profundo pode ocorrer antes do manifest apenas se:
- arquivo não permite hash/metadado simples;
- há erro de leitura;
- operador pediu explicitamente análise imediata.
