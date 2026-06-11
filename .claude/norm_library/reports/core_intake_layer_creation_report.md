# Relatório — Criação da Camada CORE-INTAKE
Data: 2026-05-11 | Patch: core_intake_router_patch_v1_0

---

## OS-01 — Camada core-intake criada

### Estrutura instalada

```
.claude/skills/core-intake/
├── SKILL.md                          ← skill principal
├── material_classifier.yaml          ← taxonomia de tipos de material
├── core_routing_rules.yaml           ← regras de roteamento por tipo
├── processing_levels.yaml            ← níveis 0–4 de processamento
├── intake_manifest_schema.yaml       ← schema do manifest por arquivo
├── intake_queue_schema.yaml          ← schema da fila de processamento
├── adapter_contract_schema.yaml      ← contrato mínimo de todo adapter
├── core_destination_registry_schema.yaml
├── human_approval_rules.yaml         ← triggers de aprovação humana
├── policies/
│   ├── CACHE_HASH_POLICY.md
│   ├── MANIFEST_FIRST_POLICY.md
│   ├── PROCESSING_LEVELS_POLICY.md
│   ├── HUMAN_APPROVAL_POLICY.md
│   ├── SKILL_MD_DATA_SEPARATION_POLICY.md
│   ├── CORE_INTAKE_PRINCIPLES.md
│   └── CESTO_LIFECYCLE_POLICY.md
├── domain_adapters/
│   ├── norm_adapter.md               ← heavy — pipeline v1.2 intacto
│   ├── legal_adapter.md              ← medium
│   ├── asset_adapter.md              ← medium
│   ├── doc_inspecao_adapter.md       ← medium
│   ├── irata_adapter.md              ← medium
│   ├── simb_adapter.md               ← light
│   └── light_generic_adapter.md      ← light — fallback
└── registries/
    ├── intake_manifest_registry.jsonl ← inicializado vazio
    ├── intake_queue.jsonl             ← inicializado vazio
    └── core_destination_registry.json ← 9 entradas iniciais
```

## OS-02 — Manifest First Workflow

Registries criados e vazios. Prontos para receber entradas quando arquivos chegarem ao cesto.

Fluxo implementado: Nível 0 (hash/metadados) → classificação → duplicate check → roteamento → adapter.

## OS-03 — Roteamento geral e adapters

7 adapters instalados cobrindo todos os domínios do CORE-OS:
- norm, legal, asset, doc-inspecao, irata, simb, light-generic

Pipeline normativo v1.2 preservado sem simplificação no norm_adapter.

## OS-04 — CESTO_INTAKE_SKILL.md atualizado

Definição anterior: "Leitor universal de arquivos normativo-centrado"
Nova definição: "Camada geral de intake/input do CORE-OS — manifest, classificação, roteamento"

Frase constitucional inserida. Tabela de roteamento atualizada. Referência para core-intake adicionada.

## OS-05 — Domain adapter stubs

Todos os 7 adapters são stubs leves/médios, proporcionais ao domínio.
Apenas norm_adapter é heavy — por necessidade, não por padrão.

## CLAUDE.md

`core-intake` adicionado à tabela de skills.
Diretório `core-intake/` adicionado ao mapa de estrutura.

## Patch arquivado

`core_intake_router_patch_v1_0.zip` → `_historico/patches_aplicados/`
`core_intake_router_patch_v1_0.sha256` → `_historico/patches_aplicados/`

SHA256 verificado: ✅ 90e27bf84a2acaf88a9daf790b96a3900f0441104fd00597801cd2d14879da3f

## Cesto pós-patch

```
cesto/
├── processo das tias/   ← workflow jurídico ativo
├── _rejeitados/         ← vazia
├── CESTO_INTAKE_SKILL.md
└── README.md
```

✅ Limpo.
