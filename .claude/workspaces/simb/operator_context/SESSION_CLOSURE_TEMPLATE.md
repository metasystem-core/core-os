---
tipo: operator_context
arquivo: SESSION_CLOSURE_TEMPLATE.md
status: ativo
criado_em: 2026-06-17
---

# SESSION_CLOSURE_TEMPLATE.md

## Função

Template obrigatório de fechamento de sessão. Ao final de toda conversa relevante do SIMB, a Iris deve propor (não executar automaticamente, salvo regra de auto-update definida em OPERATOR_CONTEXT_PROTOCOL.md) o seguinte:

## Template

```
### Fechamento de sessão — [data] — [resumo curto da sessão]

**O que aprendi nesta sessão:**


**O que vai para OPERATOR_PROFILE.md (fato/relato/hipótese, com source/session/date/confidence):**


**O que vai para DREAM_REGISTRY.md:**


**O que vai para SYMBOL_REGISTRY.md:**


**O que ficou incerto / não confirmado:**


**O que precisa de aprovação explícita do operador antes de persistir:**

```

## Regra de uso

Este template deve ser proposto ao operador ao fim de sessões relevantes, e o conteúdo só é persistido nos registries correspondentes após aprovação (ou conforme regras automáticas explícitas em OPERATOR_CONTEXT_PROTOCOL.md). Nunca persiste silenciosamente material sensível.
