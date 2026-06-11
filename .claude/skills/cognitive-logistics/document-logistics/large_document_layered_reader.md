---
name: large-document-layered-reader
description: Transforma documentos extensos em mapa operacional antes de qualquer análise profunda. Documento grande primeiro é território a mapear, não texto a resumir.
status: active
layer: document-logistics
priority: high
---

# LARGE DOCUMENT LAYERED READER

## Princípio

Nunca gastar análise profunda em documento ainda não catalogado.
Mapa antes de leitura. Leitura antes de conclusão.

## Nunca fazer

- Resumir documento inteiro de uma vez
- Analisar página por página sem necessidade
- Acionar core especializado antes do mapa
- Gastar deep reading em parte irrelevante

## Pipeline

### FASE 0 — Registro
Nome · tipo · páginas · tamanho · origem · data de recebimento.

### FASE 1 — Índice estrutural
Mapear sumário, divisões, tipos de peças, páginas com decisões, provas, laudos, anexos, páginas repetidas ou irrelevantes.

### FASE 2 — Linha do tempo
Extrair datas, eventos, atos, decisões, manifestações, prazos, mudanças de fase.

### FASE 3 — Peças críticas
Identificar decisões, sentenças, recursos, laudos, contratos, provas documentais.

### FASE 4 — Matriz operacional

| Página | Tipo | Data | Parte | Fato | Risco | Prioridade |
|---|---|---|---|---|---|---|

### FASE 5 — Acionamento de core especializado
Só depois do mapa: juridico-core / asset-core / inspecao-end / irata-n3.

## Saídas obrigatórias

1. `document_register.md`
2. `document_structure_map.md`
3. `document_timeline.md`
4. `critical_sections.md`
5. `deep_reading_queue.md`

## Aplicação no CESTO

Quando chegar documento extenso no cesto, esta skill roda antes de qualquer análise de domínio.
