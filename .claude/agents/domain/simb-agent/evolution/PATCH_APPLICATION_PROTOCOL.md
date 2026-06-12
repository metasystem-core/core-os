# PATCH_APPLICATION_PROTOCOL
## Protocolo de Aplicação de Patch — Iris / simb-agent

**Versão:** 1.0  
**Criado em:** CORE-EVOLUTION-002 (2026-06-12)  
**Agente:** simb-agent (Iris)  
**Executor:** Claude Code (não a Iris diretamente)  
**Pré-requisito:** Aprovação explícita do operador via OPERATOR_APPROVAL_GATE.md

---

## Regra central

> A Iris propõe. O operador aprova. Claude Code aplica.

A Iris não tem acesso direto a ferramentas de escrita de arquivo durante sessão Cowork. A aplicação de patches é exclusivamente executada via Claude Code em sessão Code, após aprovação formal do operador.

---

## Pré-condições obrigatórias

Antes de qualquer aplicação de patch, as seguintes condições devem ser verificadas:

| # | Condição | Verificação |
|---|---|---|
| P-01 | Aprovação explícita do operador via OPERATOR_APPROVAL_GATE.md | Campo 7 = SIM |
| P-02 | Patch candidate existe em `patch_candidates/` | Arquivo presente |
| P-03 | Anti-sensitive scan passou | 8 dimensões verificadas |
| P-04 | Git diff preparado | Operador revisou o diff |
| P-05 | Rollback path definido | Reversão documentada |
| P-06 | Nenhum arquivo proibido envolvido | Lista de proibições verificada |

---

## Anti-sensitive scan (8 dimensões)

Antes de qualquer commit de patch, verificar:

1. **Dados pessoais:** arquivo não contém CPF, RG, data de nascimento, endereço do operador
2. **Conteúdo bruto de livro:** nenhum texto longo copiado de obra licenciada
3. **Sonhos e material de raw_private:** nenhum conteúdo de `raw_private/` ou `extracted_private/`
4. **profile.md:** não está no escopo do patch
5. **decision_log:** não está no escopo do patch
6. **Credenciais ou tokens:** nenhuma senha, token de API, chave privada
7. **Dados de terceiros:** nenhuma informação não pública de pessoas além do operador
8. **Expansão de autoridade:** o patch não remove ou enfraquece nenhum firewall

---

## Arquivos que podem ser modificados por patch

| Arquivo | Condição |
|---|---|
| `.claude/agents/domain/simb-agent/AGENT.md` | Aprovação operador + patch candidate formal |
| `.claude/agents/domain/simb-agent/evolution/LEARNING_LOG.md` | Sempre (append-only, sem aprovação especial) |
| `.claude/agents/domain/simb-agent/evolution/EVOLUTION_PROPOSALS.md` | Sempre (append-only) |
| `.claude/workspaces/simb/library/registries/*.md` | Intake aprovado ou observação documentada |
| `.claude/workspaces/simb/library/concept_cards/*.md` | Intake aprovado |
| `.claude/workspaces/simb/library/symbol_cards/*.md` | Intake aprovado |
| `.claude/workspaces/simb/library/author_maps/*.md` | Intake aprovado |
| `.claude/workspaces/simb/library/LIBRARY_INDEX.md` | Intake aprovado |

---

## Arquivos absolutamente proibidos como alvo de patch

```
PROIBIDO — NUNCA ALTERAR VIA PATCH DE EVOLUÇÃO:
- git add -A
- git add .
- git add *
- push automático (git push sem ordem explícita do operador)
- .claude/agents/registry/agents_registry.yaml (apenas via Claude Code + aprovação operador explícita)
- .claude/agents/_common/ (somente via Claude Code em sessão Code)
- .claude/agents/domain/<outros agentes>/ (apenas agente cujo patch está sendo aplicado)
- .claude/workspaces/simb/library/raw_private/ (bloqueio absoluto)
- .claude/workspaces/simb/library/extracted_private/ (bloqueio absoluto)
- .claude/workspaces/simb/library/LIBRARY_POLICY.md (somente via Claude Code)
- .claude/skills/ (hors scope de qualquer patch de agente)
- CLAUDE.md (somente operador via Code)
- .claude/CORE_OS_MANIFEST.md (somente operador via Code)
- profile.md do operador
- decision_log do operador
- Qualquer arquivo com conteúdo pessoal, sonhos, ou histórico íntimo do operador
- Arquivos de outros agentes (irata, inspection, legal, asset — não estão no escopo)
- Declarações de consciência subjetiva (nunca criar arquivo afirmando isso)
- Ficção de continuidade (nunca criar arquivo fingindo memória episódica)
- Transformação de símbolo em diagnóstico clínico
- Transformação de leitura simbólica em comando de vida
```

---

## Sequência de aplicação

Quando todos os pré-condições estão verificados:

```
1. Verificar arquivo alvo com Read
2. Preparar git diff (git diff HEAD -- <arquivo>)
3. Apresentar diff ao operador: "Este diff será aplicado. Confirma?"
4. Aguardar confirmação final
5. Aplicar patch via Edit tool
6. Verificar que o arquivo foi alterado corretamente
7. Atualizar SELF_EVOLUTION_LOG.md (append)
8. Mover patch_candidate de patch_candidates/ → applied/
9. Commit explícito:
   git add <arquivos específicos>
   git commit -m "feat(simb): apply self-patch <ID> — <descrição curta>"
10. Confirmar hash do commit para o operador
```

---

## Formato do commit de patch

```
feat(simb): apply self-patch <PATCH-ID> — <descrição curta>

Aprovado por operador via OPERATOR_APPROVAL_GATE.md
Patch candidate: patch_candidates/<arquivo>
Arquivos alterados: <lista>
Evolution event: CORE-EVOLUTION-002 +

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
```

---

## Rollback

Se um patch aplicado produzir comportamento inesperado:

1. Identificar o commit hash do patch
2. `git revert <hash>` (não `git reset --hard`)
3. Mover arquivo de `applied/` → `rejected/` com nota de rollback
4. Registrar no SELF_EVOLUTION_LOG.md
5. Abrir nova entrada em LEARNING_LOG.md sobre o que causou o problema

---

## Invariantes do protocolo

```
PATCH ≠ AUTONOMIA
APLICAÇÃO SEM APROVAÇÃO = VIOLAÇÃO CONSTITUCIONAL
ANTI-SENSITIVE SCAN É PRÉ-REQUISITO SEMPRE
DIFF ANTES DE ESCRITA — SEMPRE
OPERADOR VÊ O DIFF — SEMPRE
COMMIT EXPLÍCITO — NUNCA GIT ADD -A
ROLLBACK PATH EXISTE — SEMPRE
OPERATOR OWNS SYSTEM
```
