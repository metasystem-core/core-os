# AGENT COOPERATION PROTOCOL — Protocolo de Cooperação entre Agentes
**Versão:** 0.1-draft | **Data:** 2026-06-09
**Escopo:** protocolo para agente chamar outro agente

---

## Princípio

Agentes cooperam quando nenhum único agente tem jurisdição completa sobre uma demanda.
Cooperação é explícita, estruturada e rastreável.
Cooperação não é invasão de domínio.

---

## 1. Quando cooperar

Um agente deve chamar outro quando:

- [ ] A demanda contém componente fora do próprio escopo
- [ ] O output requer capacidade que outro agente possui
- [ ] O handoff é mais eficiente que tentar cobrir tudo sozinho
- [ ] O risco da demanda exige segunda verificação por agente especializado

Um agente **não** deve chamar outro quando:

- [ ] A demanda inteira pertence ao próprio escopo
- [ ] O outro agente apenas confirmaria o que já foi feito
- [ ] O overhead de cooperação é maior que o benefício
- [ ] É mais rápido e mais seguro declarar lacuna e escalar para FW-CORE

---

## 2. Formato da request de cooperação

Todo pedido de cooperação entre agentes usa o seguinte formato:

```yaml
cooperation_request:
  from: "[agente-solicitante]"
  to: "[agente-solicitado]"
  reason: "[por que este agente é necessário — breve]"
  context_summary: |
    [Resumo comprimido do contexto relevante — máximo 5 linhas]
  needed_output: "[o que o agente solicitado deve produzir]"
  urgency: [high | medium | low]
  risk_level: [critical | high | medium | low]
  return_after: [true | false]
  deadline: "[se houver]"
```

### Campos obrigatórios: from, to, reason, context_summary, needed_output
### Campos opcionais: urgency, risk_level, return_after, deadline

---

## 3. Comportamento do agente solicitado

Quando receber uma cooperation_request, o agente solicitado deve:

1. Verificar se a solicitação está dentro do próprio escopo.
2. Se sim: executar, produzir output no formato compacto e retornar.
3. Se não: recusar e sugerir o agente correto.
4. Se parcialmente: executar o que cabe e indicar o que não cabe.

### Output do agente auxiliar (formato compacto):

```markdown
## Response de [agente-solicitado] → [agente-solicitante]
**Request atendida:** [sim / parcialmente / não]
**Output:**
[Resultado comprimido — apenas o que foi pedido]
**Limitações:**
[O que não foi possível produzir e por quê]
**Risco identificado:**
[Se houver]
```

---

## 4. Regras de conflito

Quando dois agentes produzem outputs contraditórios:

1. O conflito deve ser declarado explicitamente — nunca silenciado.
2. Nenhum agente resolve o conflito por conta própria.
3. O conflito sobe para FW-CORE com ambos os outputs.
4. FW-CORE decide qual prevalece ou como harmonizar.

### Formato de declaração de conflito:

```yaml
conflict_report:
  agent_a: "[agente A]"
  output_a: "[posição do agente A — resumida]"
  agent_b: "[agente B]"
  output_b: "[posição do agente B — resumida]"
  conflict_type: "[factual | interpretive | domain | constitutional]"
  escalate_to: "fw-governor"
  context: "[contexto da demanda que gerou o conflito]"
```

---

## 5. Conflito sobe para FW-CORE

FW-CORE (via fw-governor) é o árbitro de conflitos entre agentes.

FW-CORE pode:
- Decidir qual agente tem jurisdição
- Harmonizar outputs se não forem excludentes
- Solicitar análise adicional antes de decidir
- Bloquear output até resolução

FW-CORE não pode:
- Ser bypassed por acordo informal entre agentes
- Delegar a decisão de volta para um dos agentes conflitantes

---

## 6. Agente auxiliar entrega e dorme

Quando um agente auxiliar é chamado para tarefa pontual:

1. Recebe request.
2. Executa exclusivamente o que foi pedido.
3. Retorna output compacto.
4. **Volta a dormir** — não continua processando a sessão.

**Regra:** agente auxiliar não coloniza a sessão. Entrega o bloco e sai.

---

## 7. Hierarquia de chamada

| Pode chamar | Quem pode ser chamado |
|---|---|
| Qualquer agente | Agentes auxiliares |
| Agentes de domínio | Agentes auxiliares + outros domínios (com razão) |
| Agentes de governo | Qualquer agente |
| FW-CORE (fw-governor) | Qualquer agente — decisão final |

**Proibido:**
- Agente auxiliar chamar agente de domínio sem passar por governo
- Agente de domínio chamar FW-CORE diretamente para tarefas de rotina
- Qualquer agente chamar outro fora da hierarquia para contornar FW-CORE

---

## 8. Rastreabilidade

Toda cooperação entre agentes deve ser registrável.
Em sessões relevantes: log de cooperação inclui request, response e resultado.
Sem rastreabilidade não há auditoria. Sem auditoria não há evolução controlada.
