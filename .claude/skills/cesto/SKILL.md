---
name: cesto-intake
description: Use quando o operador disser "lê o cesto" ou jogar arquivo na pasta cesto/. Classifica o arquivo, identifica o core de destino e encaminha com contexto adequado.
status: active
core_type: intake
priority: high
domain: universal-intake
risk_level: low
---

# CESTO — Leitor Universal

## Função

Classificar qualquer arquivo e encaminhar para o core correto.

## Processo obrigatório

1. Identificar tipo de arquivo (PDF, CSV, texto, imagem)
2. Ler conteúdo ou estrutura
3. Classificar por domínio
4. Identificar core de destino
5. Extrair dados relevantes no formato do core
6. Encaminhar com contexto
7. Mover para _processados/ ou _rejeitados/

## Classificação por tipo de arquivo

| Tipo de conteúdo | Core de destino |
|---|---|
| Documento jurídico, decisão, intimação | juridico-core |
| Relatório financeiro, extrato, nota de corretagem | asset-core |
| Laudo técnico, relatório de inspeção | inspecao-end + doc-inspecao |
| APR, PT, plano de resgate, certificado IRATA | irata-n3 |
| Resultado da Lotofácil, histórico | lotofa |
| Texto pessoal, relato, diário | simb-core |
| **Norma, regulamento, procedimento técnico, manual, código técnico** | **doc-inspecao/subskills/norm-ingest** |
| Dado ambíguo | skill-router para decidir |

### Roteamento normativo (patch 2026-05-10)

Identificar documento normativo quando o arquivo for:
- NR, portaria, lei, decreto, instrução técnica de Bombeiros, regulamento INMETRO
- ABNT, ISO, ASME, API, ASTM, IRATA, ANSI, EN (normas técnicas privadas autorizadas)
- Manual de fabricante, user manual, technical data sheet
- Procedimento interno, padrão operacional, especificação técnica contratual

Ao detectar: acionar `doc-inspecao/subskills/norm-ingest` antes de qualquer outro core.

Após ingestão:
- Mover para `cesto/_processados/`
- Se falhar: mover para `cesto/_rejeitados/`
- Criar log em `.claude/norm_library/ingestion_logs/`
- Criar lacuna se necessário em `.claude/norm_library/lacunas/`

## Perguntas de classificação

1. Qual é o formato? (PDF, CSV, texto, imagem)
2. Qual é o domínio? (financeiro, jurídico, técnico, pessoal)
3. Qual ação espera? (analisar, registrar, decidir, arquivar)
4. Há prazo crítico? (verificar antes de qualquer outra análise)

## Saída padrão após classificação

```text
Arquivo: [nome]
Tipo: [formato]
Domínio: [domínio identificado]
Core de destino: [core]
Prazo detectado: [sim/não — detalhe]
Ação recomendada: [analisar / registrar / decidir]
Contexto extraído: [resumo do conteúdo relevante]
```

## Integração com Cognitive Logistics

Antes de classificar qualquer arquivo:
1. human_input_normalizer — normaliza o input
2. user_state_scanner — verifica estado do operador
3. credit_budget_core — avalia se é necessário ler tudo agora
4. large_document_layered_reader — se documento for extenso, mapeia primeiro

## Regras

- Nunca concluir sem ler o arquivo
- Prazo é verificado antes de qualquer análise
- Arquivo não reconhecido → _rejeitados/ com nota do motivo
- Arquivo processado → _processados/ com data no nome
