# AGENT_EVOLUTION_PATCH_TEMPLATE
## Template de Patch Candidate — CORE-AGENTS

> **Uso:** Copiar este template para `evolution/patch_candidates/` do agente com nome `PATCH-<agent>-YYYYMMDD-NNN.md`.  
> Preencher todos os campos. Patch só pode ser aplicado após aprovação formal do operador.

---

```yaml
patch_id:                    # PATCH-<agent>-YYYYMMDD-NNN
agent:                       # nome do agente
date:                        # data de criação do patch candidate
proposed_by:                 # simb-agent | irata-agent | operador | etc.
self_evolution_level:        # nível atual do agente (2 ou 3)
source_event:                # referência ao evento/entrada no LEARNING_LOG
learning_source:             # uso_real | feedback_operador | erro_recorrente | lacuna_identificada | etc.
evidence:                    # referências concretas (data, sessão, log)
problem:                     # descrição clara do problema observado
proposed_change:             # o que será alterado e como
files_affected:              # lista de arquivos impactados
risk_level:                  # low | medium | high | critical
authority_change:            # true | false — esta mudança expande autoridade?
active_flag_change:          # true | false — altera campo active?
external_action_change:      # true | false — habilita ação externa?
database_or_rag_change:      # true | false — habilita banco/RAG?
operator_approval_required:  # sempre true
rollback_plan:               # como desfazer se necessário
validation_plan:             # como verificar que funcionou
expected_effect:             # o que muda no comportamento do agente
do_nothing_alternative:      # o que acontece se rejeitado
status:                      # proposed | under_review | approved | rejected | applied
```

---

## Proposed Patch

*Descrever o patch em linguagem humana. O que muda, onde muda, por que é necessário.*

*Incluir: contexto da mudança, comportamento atual problemático, comportamento desejado.*

---

## Diff Sketch

*Descrever o diff esperado sem aplicar automaticamente.*

*Formato sugerido:*

```
# Arquivo: <caminho/do/arquivo>

# Antes:
<trecho atual — copiado do arquivo>

# Depois:
<trecho proposto>
```

*Este sketch é referência para revisão — não é aplicação automática.*

---

## Risk Review

| Risco | Presente? | Mitigação |
|---|---|---|
| authority_creep | sim / não | |
| persona_drift | sim / não | |
| source_contamination | sim / não | |
| overfitting_to_one_case | sim / não | |
| operator_dependency | sim / não | |
| legal_financial_medical_overreach | sim / não | |
| cross_agent_contamination | sim / não | |
| prompt_injection_via_document | sim / não | |
| loss_of_simplicity | sim / não | |
| documentation_obesity | sim / não | |

---

## Validation

- [ ] Patch foi revisado por operador primário
- [ ] Diff está claro e legível
- [ ] Rollback path existe e foi documentado
- [ ] Nenhuma autoridade foi ampliada sem aprovação
- [ ] Nenhum firewall foi removido
- [ ] Proposta é baseada em evidência recorrente (não caso único)
- [ ] Files affected estão listados e acessíveis
- [ ] Patch não altera outro agente sem autorização
- [ ] Patch não modifica registry diretamente
- [ ] Patch não altera CLAUDE.md

---

## Operator Decision

*Registrar decisão do operador primário:*

- [ ] approved — aplicar via etapa controlada
- [ ] rejected — mover para rejected/ com nota
- [ ] revise — devolver ao agente com instruções

**Decision date:**  
**Decision note:**  
**Applied in commit:**  

---

*⚠️ PROPOSAL ≠ PATCH APPLIED | OPERATOR APPROVAL REQUIRED | ROLLBACK PATH REQUIRED*
