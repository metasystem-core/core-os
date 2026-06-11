# NORM MODULE v1.2 — Traceability, Versioning, Diff/Merge and Conflict Scan Patch

Data: 2026-05-11

Este pacote atualiza o módulo normativo do CORE-OS/Claude Code de **v1.1 operacional** para **v1.2 auditável**.

## Objetivo

Transformar os blocos normativos já gerados em uma base mais defensável para uso técnico, com:

- rastreabilidade forte por norma, edição, item/seção, página, tabela/figura/anexo;
- exportação de citação pronta para relatório/fiscalização;
- versionamento de normas e blocos;
- comparação entre normas repetidas/atualizadas;
- merge controlado sem apagar histórico;
- varredura de conflito entre normas, procedimentos, critérios e manuais;
- fila de lacunas/revisão humana para blocos fracos ou críticos.

## Regra central

> Bloco sem referência rastreável é útil para estudo e navegação, mas não deve ser usado como fundamento técnico forte em relatório, liberação operacional ou resposta a fiscalização.

## Não fazer

- Não reprocessar todos os PDFs brutos cegamente.
- Não sobrescrever blocos antigos sem versionamento.
- Não apagar norma antiga ao receber norma nova.
- Não declarar conflito resolvido automaticamente se houver risco técnico/material.
- Não reproduzir texto integral de normas privadas/autorizadas.
- Não misturar IRATA-N3 com Inspeção-END.

## Fazer

1. Preservar os blocos v1.1 já gerados.
2. Aplicar backfill dos campos v1.2.
3. Marcar lacunas de rastreabilidade.
4. Criar registros de versão por norma.
5. Criar mapa bloco→fonte.
6. Criar relatórios de QA.
7. Rodar diff/merge quando uma norma repetida/atualizada for enviada.
8. Rodar conflict-scan quando houver divergência entre fontes.

## Pacotes já mencionados para correção/backfill

- API 510
- API 520
- API 570
- API RP 571
- API 574
- API 598
- API 650
- API 653
- ASME BPVC Section V
- NRs
- pacote `para_gpt`
- demais pacotes já ingeridos no padrão v1.1
