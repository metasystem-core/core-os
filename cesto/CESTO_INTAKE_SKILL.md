---
name: cesto-intake
description: Camada geral de intake/input do CORE-OS. Recebe qualquer material bruto, gera manifest, classifica, detecta duplicatas, roteia para o adapter/core correto e mantém o cesto limpo.
status: active
patch_version: v1.0 (2026-05-11)
---

# CESTO — Camada de Intake Geral

## Frase Constitucional

> Todo material entra pelo cesto, mas nada mora no cesto.
> O cesto registra, classifica e encaminha.
> O core especializado processa.
> A library guarda.
> O registry prova.

## Função

O cesto é a porta de entrada do CORE-OS para qualquer tipo de material.

Não faz análise profunda por padrão.
Não substitui nenhum core especializado.
É **content-light e routing-smart**.

## Processo Obrigatório

1. **Manifest + SHA-256** (Nível 0) — nome, extensão, tamanho, hash, data
2. **Classificação** (Nível 1) — tipo de material, domínio, confiança
3. **Verificação de duplicata** — hash já no registry? não reprocessar
4. **Roteamento** — adapter/core correto via `core_routing_rules.yaml`
5. **Encaminhar ao core** — com manifest e contexto mínimo
6. **Atualizar registry** — `intake_manifest_registry.jsonl`
7. **Limpar cesto** — após processamento, mover para library ou _historico

## Classificação por Domínio

| Tipo de material | Core de destino | Profundidade |
|---|---|---|
| Norma técnica, regulamento, procedimento normativo | norm-intake → norm_library | heavy |
| Documento jurídico, decisão, intimação, evidência | legal-intake → legal_library | medium |
| Laudo, databook, certificado, prontuário, relatório de inspeção | doc-inspecao-intake → inspection_library | medium |
| APR, PT, plano de resgate, plano de ancoragem, checklist IRATA | irata-intake → irata_library | medium |
| Extrato, carteira, FII, nota de corretagem, relatório financeiro | asset-intake → .claude/data/carteira/ | medium |
| Relato, sonho, diário, nota pessoal | simb-intake → simb_library | light |
| Patch, skill config, log do sistema | core-os-intake → _historico/patches_aplicados/ | light |
| Desconhecido / baixa confiança | human-review → quarantine | light |

## Manifest Mínimo

```json
{
  "asset_id": "...",
  "file_name": "...",
  "sha256": "...",
  "file_type": "...",
  "size_bytes": 0,
  "detected_domain": "...",
  "material_type": "...",
  "confidence": "alta|media|baixa",
  "current_status": "received|classified|routed|...",
  "proposed_destination": "...",
  "processor_required": "...",
  "human_review_required": false
}
```

## Regras

- Nunca processar profundamente antes do manifest
- Hash já conhecido = não reprocessar
- Prazo detectado = verificar antes de qualquer outra análise
- Arquivo não reconhecido → quarantine com nota do motivo
- Norma técnica → pipeline normativo v1.2 preservado integralmente
- Conteúdo privado → não expor sem autorização

## Aprovação humana

Não precisa: gerar manifest, calcular hash, classificar, sugerir destino.
Precisa: apagar, sobrescrever, mover lote, merge, marcar versão substituída, expor privado.

## Referência

Skill completa: `.claude/skills/core-intake/SKILL.md`
Routing rules: `.claude/skills/core-intake/core_routing_rules.yaml`
Adapters: `.claude/skills/core-intake/domain_adapters/`
Registries: `.claude/skills/core-intake/registries/`
