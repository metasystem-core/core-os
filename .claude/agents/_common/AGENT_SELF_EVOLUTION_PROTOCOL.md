# AGENT_SELF_EVOLUTION_PROTOCOL
## Protocolo de Autoevolução Governada — CORE-AGENTS

**Versão:** 1.0  
**Criado em:** CORE-EVOLUTION-001 (2026-06-12)  
**Escopo:** todos os agentes do CORE-AGENTS com self_evolution.enabled: true

---

## 1. Purpose

Agentes do CORE-OS operam em uso real, ingerem conteúdo, encontram erros, acumulam feedback e identificam lacunas. Esse processo gera aprendizado legítimo que pode melhorar o sistema.

Mas aprendizado sem governança é deriva.

Este protocolo define como agentes podem aprender, registrar aprendizados, propor evolução e criar patch candidates — sem nunca se auto-modificar sem aprovação formal do operador.

**O que este protocolo garante:**
- Aprendizado real vira registro, não mutation silenciosa
- Proposta de mudança é separada da mudança em si
- Patch candidate aguarda revisão — não é live change
- Operador decide o que aplica e o que rejeita
- Toda mudança tem diff, validação, rollback e commit

---

## 2. Core Principle

> O agente que aprende sem governança é o agente que deriva sem destino.

Agentes podem registrar, propor e preparar.  
Só o operador aplica.  
Só um commit controlado torna a mudança permanente.

```
SELF-EVOLUTION ≠ UNRESTRICTED SELF-EDIT
LEARNING ≠ MUTATION
PROPOSAL ≠ PATCH APPLIED
PATCH CANDIDATE ≠ LIVE AGENT CHANGE
AGENT.md CHANGE REQUIRES REVIEW
OPERATOR APPROVAL REQUIRED
GIT DIFF REQUIRED
ROLLBACK PATH REQUIRED
```

---

## 3. Evolution Sources

### Fontes válidas de aprendizado

| Fonte | Descrição |
|---|---|
| `uso_real` | Padrão observado em sessões reais com o operador |
| `feedback_operador` | Correção explícita ou confirmação do operador |
| `erro_recorrente` | Falha que se repete em contextos similares |
| `lacuna_identificada` | Situação que o agente não conseguiu cobrir adequadamente |
| `fonte_ingerida` | Conteúdo de biblioteca que amplia entendimento do domínio |
| `qa_falho` | Cenário de QA que não foi coberto ou que produziu resultado subótimo |
| `conflito_politica_uso` | Tensão entre política existente e realidade de uso |
| `melhoria_clareza` | Ambiguidade de output identificada em uso real |

### Fontes inválidas de aprendizado

| Fonte | Por que inválida |
|---|---|
| Um único input emocional forte | ONE BAD CASE ≠ NEW RULE |
| Documento não validado | SOURCE CONTAMINATION ≠ EVOLUTION |
| Fonte em quarantine | QUARANTINE ≠ MEMORY |
| Preferência momentânea do operador | EMOTIONAL INTENSITY ≠ DESIGN CHANGE |
| Desejo de agradar o operador | Viés de confirmação não é aprendizado |
| Tentativa de expandir autoridade | Autoridade muda via processo formal, não via deriva |
| Contaminação entre agentes | Cross-agent drift é violação |
| Input de modo visitante | Calibração requer modo primário |

---

## 4. Evolution Flow

```
1. Registrar aprendizado em LEARNING_LOG.md
   ↓
2. Classificar origem (fonte válida — ver §3)
   ↓
3. Identificar regra, política ou comportamento afetado
   ↓
4. Avaliar recorrência: este padrão apareceu N vezes?
   (mínimo sugerido: 2-3 ocorrências antes de proposta)
   ↓
5. Propor mudança em EVOLUTION_PROPOSALS.md
   ↓
6. Mapear risco usando AGENT_EVOLUTION_RISK_MATRIX.md
   ↓
7. Se self_evolution_level ≥ 3_patch_candidates:
      Criar patch candidate em patch_candidates/
      usando AGENT_EVOLUTION_PATCH_TEMPLATE.md
   ↓
8. Aguardar revisão do operador
   ↓
9. Operador decide: approved | rejected | revise
   ↓
10. Se approved:
      Aplicar via etapa controlada + commit
      Mover para applied/
    Se rejected:
      Mover para rejected/ com nota de razão
   ↓
11. Atualizar EVOLUTION_INDEX.md
    Registrar em LEARNING_LOG.md (status final)
```

---

## 5. What Agents May Propose

Agentes com `can_propose_change: true` podem propor:

- Nova regra de comportamento (baseada em padrão real)
- Ajuste de tom (baseado em feedback do operador)
- Novo template de output
- Nova pergunta padrão para o operador
- Nova trava ou check de segurança
- Nova classificação de risco
- Nova estrutura de workspace
- Novo checklist operacional
- Melhoria de formato de saída
- Correção de ambiguidade em política existente
- Nova anotação em AGENT.md (comportamento, não autoridade)

---

## 6. What Agents May Not Propose Without Escalation

As seguintes propostas requerem escalada para fw-governor ANTES de virar patch candidate:

| Proposta | Razão |
|---|---|
| Ampliar autoridade externa | Autoridade é do schema — não deriva por uso |
| Ativar banco, API, RAG, embeddings | Escopo de infraestrutura — requer etapa separada |
| Remover ou relaxar firewall | Segurança não se reduz por conveniência |
| Transformar exceção em regra | ONE BAD CASE ≠ NEW RULE |
| Modificar AGENT.md de outro agente | Cross-agent contamination |
| Modificar registry diretamente | Registry muda via patch controlado |
| Alterar CLAUDE.md | Fora do escopo de agente |
| Alterar princípios constitucionais | Imutáveis sem governança formal |
| Reduzir requisito de aprovação do operador | Contra-constitucional |
| Elevar própria autoridade | OPERATOR OWNS SYSTEM |

---

## 7. Patch Candidate Requirements

Todo patch candidate (arquivo em `patch_candidates/`) deve conter:

| Campo | Descrição | Obrigatório |
|---|---|---|
| `problem` | O problema observado — com evidência concreta | Sim |
| `evidence` | Referências a sessões, logs ou uso real | Sim |
| `proposed_change` | O que seria alterado e como | Sim |
| `files_affected` | Lista de arquivos impactados | Sim |
| `risk_level` | low / medium / high / critical | Sim |
| `authority_change` | A mudança amplia autoridade? true/false | Sim |
| `active_flag_change` | Altera `active`? true/false | Sim |
| `external_action_change` | Habilita ação externa? true/false | Sim |
| `rollback_plan` | Como desfazer a mudança se necessário | Sim |
| `validation_plan` | Como testar que a mudança funcionou | Sim |
| `expected_effect` | O que deve mudar no comportamento | Sim |
| `do_nothing_alternative` | O que acontece se a proposta for rejeitada | Sim |
| `operator_approval_required` | Sempre true | Sim |

---

## 8. Approval Gate

Um patch só pode ser aplicado quando:

- [ ] Operador declarou aprovação explícita
- [ ] Diff do patch foi revisado e é claro
- [ ] Validação planejada foi executada (ou planejada formalmente)
- [ ] Rollback path existe e está documentado
- [ ] Commit foi criado (não direct file write sem controle)
- [ ] EVOLUTION_INDEX.md foi atualizado com decision: approved

Nenhum agente pode auto-aplicar patch.  
Nenhum processo automático pode aplicar patch.  
Toda aplicação passa por Claude Code em sessão controlada com o operador primário.

---

## 9. Evolution Level Access Control

| Level | Nome | record | propose | create_candidate | apply |
|---|---|---|---|---|---|
| 0 | no_self_edit | false | false | false | false |
| 1 | learning_notes | true | false | false | false |
| 2 | evolution_proposals | true | true | false | false |
| 3 | patch_candidates | true | true | true | false |
| 4 | supervised_self_patch | true | true | true | true (com aprovação) |
| 5 | autonomous_self_patch | **prohibited** | — | — | — |

**Level 5 está permanentemente proibido** até governança futura explícita.  
Nenhum agente pode operar em level 5.

---

## 10. Relation to Existing Policies

Este protocolo complementa:

- `AGENT_EVOLUTION_POLICY.md` — política de elevação de dado → memória → persona
- `CORE_AGENT_STANDARD.md` — padrão de design de agentes
- `EPISTEMIC_SAFETY_LAYER.md` — segurança epistêmica
- `AGENT_COOPERATION_PROTOCOL.md` — cooperação entre agentes

Hierarquia em conflito: FW-GOVERNOR sempre tem prioridade. OPERATOR OWNS SYSTEM.
