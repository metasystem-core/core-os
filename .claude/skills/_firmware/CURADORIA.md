---
name: _firmware-curadoria
description: Protocolo de manutenção e curadoria do sistema CORE-OS. Define como manter o sistema organizado à medida que cresce — status de arquivos, revisão periódica, ciclo de depreciação.
status: active
layer: firmware
---

# CURADORIA — Protocolo de Manutenção do Sistema CORE-OS

## Por que existe

Sistemas crescem. Sem curadoria, crescem em desordem.
O CORE-OS tem 78+ arquivos e vai continuar crescendo.

Este protocolo garante que o sistema permaneça navegável,
sem arquivos obsoletos ativos e sem perder o que é valioso.

---

## Status de Arquivo

Todo SKILL.md deve declarar seu status no header:

```yaml
status: active      # operacional, sendo usado
status: standby     # existe, pode ser chamado, não é prioridade
status: deprecated  # existe, não deve ser usado, candidato à remoção
```

Se não tiver declaração de status → assumir `active`.

---

## Ciclo de Vida de um Arquivo

```
criado → active → standby → deprecated → removido
                     ↑
              pode voltar a active
```

**Active:** uso normal. Nenhuma ação necessária.

**Standby:** existe mas não está sendo chamado.
Razões válidas: funcionalidade sazonal, sub-skill específica raramente necessária.
Ação: revisar a cada 30 dias. Voltou a ser usado → active. Não voltou → deprecated.

**Deprecated:** não deve ser usado. Razões: foi substituído, ficou desatualizado,
a necessidade que atendia não existe mais.
Ação: aguardar 30 dias. Se ninguém sentiu falta → remover.

---

## Protocolo de Revisão Mensal

Rodar no Claude Code uma vez por mês:

```
Leia todos os arquivos SKILL.md em .claude/skills/.
Para cada um, verifique o campo status no header.
Gere um relatório com:
- Lista de arquivos active
- Lista de arquivos standby (com data de quando entraram em standby)
- Lista de arquivos deprecated (com data — prontos para remoção se > 30 dias)
- Arquivos sem campo status declarado
- Arquivos referenciados em outros SKILL.md mas que não existem (lacunas)
Salve o relatório em .claude/_firmware/REVIEW_[data].md
```

---

## Protocolo de Instalação

Toda vez que instalar arquivo novo:

1. Instala o arquivo
2. Declara `status: active` no header
3. Regera o catálogo:

```
Regera .claude/CORE_OS_CATALOG.md com varredura completa de .claude/skills/
```

4. Atualiza `skill-router/SKILL.md` se o novo arquivo for um core ou skill principal

---

## Protocolo de Remoção

Antes de remover qualquer arquivo:

1. Verificar se está referenciado em outros SKILL.md
2. Verificar se está listado no skill-router
3. Verificar se tem conteúdo que deve ser preservado em outro lugar
4. Mover para `.claude/_firmware/archive/` por 30 dias antes de apagar definitivamente
5. Regerar catálogo após remoção

---

## Estrutura de Referência — Estado Atual

```
.claude/skills/
├── _firmware/              ← camada 0, sempre ativa
│   ├── WATCHDOG.md         ← firmware global
│   ├── CURADORIA.md        ← este arquivo
│   └── archive/            ← arquivos em período de espera antes da remoção
│
├── fw-core/                ← núcleo constitucional
├── asset-core/             ← decisão financeira
├── simb-core/              ← análise simbólica
├── lotofa/                 ← laboratório estatístico
├── skill-router/           ← roteamento
├── operator-lock/          ← segurança de identidade
├── fw-kant/                ← filtro normativo
├── juridico/               ← navegação jurídica
├── irata-n3/               ← supervisão em altura
├── inspecao-end/           ← análise técnica END
└── doc-inspecao/           ← análise documental
```

---

## Regras de Nomeação

Para manter consistência à medida que o sistema cresce:

| Tipo | Convenção | Exemplo |
|---|---|---|
| Core principal | nome-curto/ | `asset-core/` |
| Sub-skill | nome_descritivo.md | `damage-mechanisms.md` |
| Proxy constitucional | nome_proxy/ | `simb_core_proxy/` |
| Layer transversal | nome_função/ | `harvest_core/` |
| Template | nome_uso.md | `decisao_por_bandas.md` |
| Firmware | _nome.md | `_firmware/WATCHDOG.md` |
| Catálogo/sistema | MAIUSCULO.md | `CORE_OS_CATALOG.md` |
| Arquivo de revisão | REVIEW_YYYY-MM-DD.md | `REVIEW_2026-05-01.md` |

---

## Quando o Sistema Ficou Grande Demais

Sinal de que precisa de curadoria imediata:

- Mais de 15 arquivos em standby sem revisão
- Mais de 5 arquivos deprecated sem remoção
- skill-router desatualizado há mais de 2 instalações
- Catálogo com mais de 10 lacunas detectadas
- Tempo para encontrar um arquivo específico > 2 minutos

Se qualquer um desses sinais aparecer → rodar revisão mensal imediatamente.
