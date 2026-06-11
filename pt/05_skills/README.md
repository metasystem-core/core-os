# pt/05_skills/ — Área de Refinamento e Exportação

## Propósito

Este diretório é a **área de staging e exportação pública** das skills do CORE-OS.

Ele contém versões refinadas, traduzidas ou simplificadas das skills operacionais do sistema — distintas das versões canônicas em `.claude/skills/`.

---

## Regra fundamental

> **Versão canônica e operacional:** `.claude/skills/`
> **Versão exportada / refinada:** `pt/05_skills/`

Nunca usar arquivos desta pasta como fonte de configuração ativa do sistema.
Toda alteração estrutural começa em `.claude/skills/` e pode ser refletida aqui depois de revisão.

---

## Estado atual (2026-06-09)

| Skill | Estado | Idioma | Observação |
|---|---|---|---|
| `simb-core/` | Tradução EN em andamento | EN | Versão PT canônica em `.claude/skills/simb-core/` |
| `fw-kant/SKILL.md` | Arquivo refinado | PT | |
| `asset-core/SKILL.md` | Arquivo refinado | PT | |
| `irata-n3/SKILL.md` | Arquivo refinado | PT | |
| `lotofa/SKILL.md` | Arquivo refinado | PT | |
| `juridico/SKILL.md` | Arquivo refinado | PT | |
| `inspecao-end/SKILL.md` | Arquivo refinado | PT | |
| `doc-inspecao/SKILL.md` | Arquivo refinado | PT | |
| `normative_patch/` | Especificação de módulo normativo | PT | |

### Arquivos removidos neste ciclo (staged delete)

Os seguintes arquivos planos (flat SKILL.md na raiz) foram removidos e substituídos pela estrutura de diretórios:
- `ASSET_CORE_SKILL.md`
- `FW_KANT_SKILL.md`
- `IRATA_N3_SKILL.md`
- `JURIDICO_SKILL.md`
- `LOTOFA_SKILL.md`

---

## Quando usar este diretório

- Preparar versão pública ou simplificada de uma skill para compartilhamento externo.
- Traduzir skills para inglês (versão international do sistema).
- Testar refinamento de SKILL.md antes de aplicar na versão operacional.
- Documentar proposta de nova skill antes da elevação formal via HARVEST-CORE.

## Quando NÃO usar

- Como fonte de roteamento do sistema (skill-router lê `.claude/skills/`, não aqui).
- Para incorporar regras novas ao sistema (isso vai via HARVEST-CORE + FW-CORE).
- Para substituir versões operacionais sem revisão e registro de versão.
