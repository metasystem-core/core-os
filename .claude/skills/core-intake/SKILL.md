---
name: core-intake
description: Camada geral de intake/input do CORE-OS. Recebe qualquer material, gera manifest, classifica, detecta duplicatas, roteia para o adapter/core correto e mantém o cesto limpo.
status: active
core_type: infrastructure
priority: high
domain: intake_routing
risk_level: low
patch_version: v1.0 (2026-05-11)
---

# CORE-INTAKE — Camada Geral de Intake

## Frase Constitucional

> Todo material entra pelo cesto, mas nada mora no cesto.
> O cesto registra, classifica e encaminha.
> O core especializado processa.
> A library guarda.
> O registry prova.

## Função

O core-intake é a camada de triagem e roteamento do CORE-OS.

Não faz análise profunda por padrão.
Não substitui nenhum core especializado.
Aciona o adapter correto e passa o controle.

## Princípios

1. **Leveza** — começar por metadados/hash. Processar profundamente só quando necessário.
2. **Economia** — não abrir PDF grande se nome/hash já classificam.
3. **Especialização proporcional** — normas exigem pipeline pesado; outros materiais usam adapters leves/médios.
4. **Verdade operacional** — estado real vem do filesystem + registries, não do SKILL.md.
5. **Não contaminação** — generalizar o cesto não reduz rigor normativo.

## Fluxo Obrigatório

```
cesto
  ↓ manifest + sha256 (Nível 0)
  ↓ material_classifier (Nível 1)
  ↓ duplicate check
  ↓ core_routing_rules
  ↓ adapter especializado (Nível 3–4 se necessário)
  ↓ library adequada
  ↓ registry atualizado
  ↓ cesto limpo
```

## Níveis de Processamento

| Nível | Descrição | Custo |
|---|---|---|
| 0 | Metadados: nome, extensão, tamanho, hash, pasta, data | mínimo |
| 1 | Identificação leve: título, sumário, palavras-chave | baixo |
| 2 | Extração parcial de campos úteis para roteamento | médio |
| 3 | Intake especializado via adapter | médio-alto |
| 4 | Deep processing: blocos, diff/merge, análise integral | alto — não usar por padrão |

**Regra:** nunca começar pelo Nível 4 por padrão.

## Roteamento por Tipo

| Tipo de material | Processor | Destino |
|---|---|---|
| norma_tecnica, regulamento, procedimento_normativo | norm-intake | norm_library |
| documento_juridico, evidencia_juridica, peticao, decisao, certidao | legal-intake | legal_library |
| documento_inspecao, databook, certificado, prontuario, laudo | doc-inspecao-intake | inspection_library |
| documento_irata, plano_resgate, plano_ancoragem, APR, PT | irata-intake | irata_library |
| dado_financeiro, extrato, carteira, relatorio_fii | asset-intake | asset_library |
| relato, sonho, diario, nota_subjetiva | simb-intake | simb_library |
| patch_code, skill_config, log_sistema | core-os-intake | core_os_registry |
| unknown / baixa confiança | human-review | quarantine |

## Adapters disponíveis

| Adapter | Arquivo | Profundidade |
|---|---|---|
| norm_adapter | `domain_adapters/norm_adapter.md` | heavy — pipeline v1.2 intacto |
| legal_adapter | `domain_adapters/legal_adapter.md` | medium |
| asset_adapter | `domain_adapters/asset_adapter.md` | medium |
| doc_inspecao_adapter | `domain_adapters/doc_inspecao_adapter.md` | medium |
| irata_adapter | `domain_adapters/irata_adapter.md` | medium |
| simb_adapter | `domain_adapters/simb_adapter.md` | light |
| light_generic_adapter | `domain_adapters/light_generic_adapter.md` | light |

## Registries

| Registry | Caminho | Função |
|---|---|---|
| intake_manifest_registry | `registries/intake_manifest_registry.jsonl` | histórico de todos os arquivos recebidos |
| intake_queue | `registries/intake_queue.jsonl` | fila de processamento pendente |
| core_destination_registry | `registries/core_destination_registry.json` | mapa tipo → destino |

## Políticas

| Política | Arquivo |
|---|---|
| Manifest First | `policies/MANIFEST_FIRST_POLICY.md` |
| Cache + SHA-256 | `policies/CACHE_HASH_POLICY.md` |
| Processing Levels | `policies/PROCESSING_LEVELS_POLICY.md` |
| Human Approval | `policies/HUMAN_APPROVAL_POLICY.md` |
| SKILL.md ≠ banco de dados | `policies/SKILL_MD_DATA_SEPARATION_POLICY.md` |
| Cesto Lifecycle | `policies/CESTO_LIFECYCLE_POLICY.md` |
| Core-Intake Principles | `policies/CORE_INTAKE_PRINCIPLES.md` |

## Quando ativar aprovação humana

**Não precisa:**
- gerar manifest
- calcular hash
- classificar preliminarmente
- criar fila de processamento
- sugerir destino

**Precisa sempre:**
- apagar arquivo
- sobrescrever arquivo
- mover lote grande
- merge destrutivo
- marcar versão como substituída
- usar low-traceability como fonte forte
- expor conteúdo privado

## Onde pode falhar

- Material ambíguo entre domínios (ex.: documento técnico com conteúdo jurídico).
- Nome de arquivo sem informação suficiente para classificação Nível 0.
- Hash desconhecido + conteúdo sem texto extraível.
- Adapter especializado não disponível para o domínio detectado.
