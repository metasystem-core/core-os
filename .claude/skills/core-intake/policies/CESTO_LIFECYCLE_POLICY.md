# Política — Cesto como Área Temporária

## Princípio

O cesto é uma área de entrada, quarentena e triagem.
Ele não é biblioteca normativa, não é registry e não é destino final.

## Regra operacional

Nenhum arquivo normativo deve permanecer indefinidamente no cesto.

## Permitido permanecer no cesto

Apenas:
1. arquivos ainda não classificados;
2. arquivos aguardando aprovação humana;
3. arquivos com erro de leitura;
4. arquivos em quarentena temporária;
5. upload recém-recebido ainda não auditado.

## Proibido permanecer indefinidamente no cesto

- PDFs/raws normativos já classificados;
- blocos JSONL já gerados;
- índices;
- registry;
- ingestion logs;
- lacunas;
- glossários;
- traduções;
- relatórios de conflito/diff/merge;
- patches já aplicados;
- SKILL.md definitivo.

## Não apagar

Nunca apagar raw normativo, duplicata ou versão antiga sem:
- backup;
- hash;
- log;
- justificativa;
- aprovação humana.

## Estado real

SKILL.md deve refletir o filesystem real.
Se o filesystem e o SKILL.md divergirem, o filesystem prevalece e o SKILL.md deve ser corrigido.
