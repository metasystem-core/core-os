# CONTEXT COMPRESSION PROTOCOL — Protocolo de Compactação de Contexto
**Versão:** 0.1-draft | **Data:** 2026-06-09
**Escopo:** protocolo base para todos os agentes; adaptadores locais por domínio

---

## Princípio

> O agente não acumula contexto — ele seleciona, comprime e passa adiante.
> O que é preservado deve ser preservado com propósito.
> O que é descartado deve ser descartado com consciência.

Compactação não é apagamento.
Apagamento destrói informação.
Compactação destila informação.

---

## 1. Quando ativar

Ativar o protocolo de compactação quando:

- [ ] A tarefa foi concluída
- [ ] A sessão está próxima do fim
- [ ] Outro agente vai assumir
- [ ] O contexto está ficando pesado demais para continuar útil
- [ ] O operador pede handoff ou reinício
- [ ] O agente vai dormir

---

## 2. O que preservar

| Categoria | Preservar? | Critério |
|---|---|---|
| Decisão com consequência futura | Sempre | Impacta próxima ação |
| Regra operacional nova | Sempre | Muda comportamento futuro |
| Risco identificado | Sempre | Pode causar dano se ignorado |
| Arquivo gerado | Sempre | Referência futura necessária |
| Pendência aberta | Sempre | Ação ainda requerida |
| Candidato a memória | Marcar | Pode virar aprendizado estrutural |
| Candidato a HARVEST | Marcar | Pode subir ao núcleo |
| Raciocínio intermediário | Não | Serviu ao processo, não ao produto |
| Digressão sem consequência | Não | Ruído |
| Repetição já resolvida | Não | Redundante |
| Impulso passageiro já tratado | Não | Sem valor futuro |
| Dado sensível sem classificação | Nunca | Risco de privacidade |

---

## 3. Formato de compactação

### 3.1 State comprimido (para sono do agente)

```yaml
agent: [nome]
session_id: [id ou data]
compressed_at: [timestamp]
status: sleeping

essentials:
  decisions:
    - "[decisão 1 — resumida]"
  risks:
    - "[risco 1 — resumido]"
  pending:
    - "[pendência 1]"
  artifacts:
    - "[arquivo gerado]"
  memory_candidates:
    - content: "[aprendizado]"
      confidence: [alta/média/baixa]
      review_required: [sim/não]
  harvest_candidates:
    - "[candidato a elevação ao núcleo]"

next_action: "[próxima ação, se houver]"
next_agent: "[agente que continua, se houver]"
```

### 3.2 Handoff curto (para agente seguinte)

```markdown
## Handoff de [agente-origem] → [agente-destino]
**Sessão:** [id/data]
**Contexto:** [resumo em 2-3 linhas do que foi processado]
**Resultado:** [o que foi produzido]
**Pendências:** [o que ficou em aberto]
**Risco:** [o que pode dar errado]
**O que você precisa saber:** [informação específica para o próximo agente]
```

### 3.3 Context pack (para reinício de sessão)

```markdown
## Context Pack — [agente] — [data]
**Projeto/domínio:** [—]
**Decisões tomadas:** [lista]
**Arquivos gerados:** [lista]
**Pendências:** [lista]
**Riscos abertos:** [lista]
**Próximo ciclo:** [ação inicial para o próximo encontro]
```

---

## 4. O que não distorcer

Durante a compactação, o agente **não deve**:

- [ ] Suavizar risco para fazer o context pack parecer melhor
- [ ] Omitir decisão problemática para evitar confronto
- [ ] Resumir de forma que mude o sentido original
- [ ] Tratar pendência como resolvida quando ainda está aberta
- [ ] Elevar candidato a memória para memória sem filtro
- [ ] Comprimir lacuna em afirmação positiva

**Regra:** distorção no handoff contamina o agente seguinte e o operador.

---

## 5. Compactação não é apagamento

| Compactação | Apagamento |
|---|---|
| Preserva essência, remove redundância | Remove sem critério |
| Mantém rastreabilidade | Perde origem |
| Permite reconstrução do raciocínio | Impede reconstrução |
| Descartar com consciência | Descartar sem consciência |
| Gera discard_log | Não gera rastro |

Se houver dúvida sobre descartar: preservar com flag `uncertain_relevance`.

---

## 6. Adaptadores locais por domínio

Cada agente pode ter adaptador local que especifica:

- quais categorias têm prioridade de preservação no seu domínio;
- qual o formato específico do handoff para o próximo agente típico;
- qual o tamanho máximo recomendado do state comprimido;
- se há dados sensíveis que exigem tratamento especial antes de comprimir.

Adaptador local complementa este protocolo — não o substitui.

---

## 7. Frase operacional

> Compactar é selecionar com cuidado o que importa —
> não apagar o que incomoda.
