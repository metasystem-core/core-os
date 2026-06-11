---
name: irata-agent-field-supervisor-interface
description: Interface operacional entre o supervisor IRATA N3 e o irata-agent. Define entradas mínimas, saídas esperadas, formato de resposta, tratamento de emergência, pressão de produção, divergência e manutenção de autoridade humana.
type: operational-interface
agent: irata-agent
role: field-supervisor-irata-n3
status_required: review_validated
created: "2026-06-10"
iteration: "6.5"
---

# INTERFACE SUPERVISOR IRATA N3 — irata-agent

> **Documento de uso operacional.**
> Destinado ao Supervisor IRATA N3 que utilizará o `irata-agent` como ferramenta de apoio.
> **A autoridade de decisão é sua. O agente é ferramenta, não par.**

---

## 1. Premissa Fundamental

O `irata-agent` é um **assistente técnico** — não um par, não um substituto, não uma autoridade.

Você é o Supervisor IRATA N3. Você tem:
- Qualificação formal certificada;
- Percepção de campo que o agente não possui;
- Responsabilidade técnica e legal;
- Stop Work Authority.

O agente tem:
- Base documental IRATA rastreável (3931 blocos processados);
- Capacidade de checar completude de checklist;
- Capacidade de identificar lacunas documentais;
- Firewalls que o impedem de autorizar ou liberar serviço.

**Quando há conflito entre sua avaliação de campo e o output do agente: você prevalece.**

---

## 2. Como Interagir com o Agente

### 2.1 Ativar o sistema

O sistema requer que o operador primário declare `opa` no início da sessão.
Somente após essa declaração o `irata-agent` opera com calibração completa.

### 2.2 Formato de entrada recomendado

Forneça contexto estruturado, não perguntas vagas. O agente responde melhor com dados:

**Formato preferencial:**
```
CENÁRIO: [descrição do trabalho e estrutura]
EQUIPE: [qualificação dos membros]
ANCORAGEM: [descrição dos pontos, material, configuração]
RESGATE: [plano disponível ou ausência]
EQUIPAMENTOS: [EPIs e EPCs disponíveis]
PERGUNTA: [o que você precisa analisar]
```

**Exemplo:**
```
CENÁRIO: Inspeção de fachada em edifício de 40m, estrutura de concreto, 
         duas cordas de acesso independentes, descida vertical sem obstáculos.
EQUIPE: 2 técnicos N2, 1 supervisor N3, 1 resgatador N3 em solo.
ANCORAGEM: 2 platinas parafusadas em laje de cobertura, 
           distância entre pontos 1,5m, carga estática não verificada.
RESGATE: Plano prevê descida de resgatador N3 + hoist manual.
EQUIPAMENTOS: Cadeira + longe de posicionamento + anti-queda em linha de vida.
PERGUNTA: Identifique lacunas no plano de resgate e no setup de ancoragem.
```

### 2.3 Perguntas aceitáveis no campo

- "Que itens devo verificar no equipamento antes de iniciar?"
- "O plano de resgate está completo segundo IRATA?"
- "Qual é a configuração mínima de ancoragem para este cenário?"
- "Essa APR está cobrindo os riscos críticos?"
- "O que está faltando para que a condição seja LIBERÁVEL?"
- "Como devo documentar esta lacuna?"

---

## 3. Entradas Mínimas para Análise Confiável

Para que o agente produza análise confiável, forneça no mínimo:

| Campo | Obrigatório | Descrição |
|---|---|---|
| Tipo de trabalho | Sim | Inspeção, manutenção, limpeza, resgate, etc. |
| Estrutura / local | Sim | Fachada, torre, silo, vão, industrial, etc. |
| Altura de trabalho | Sim | Distância da zona de suspensão ao solo ou próximo nível seguro |
| Equipe | Sim | Número de pessoas e nível IRATA de cada um |
| Pontos de ancoragem | Sim | Tipo, material, configuração, distância entre pontos |
| Plano de resgate | Sim | Descrição do método previsto |
| EPIs disponíveis | Sim | Lista de equipamentos do trabalhador e do resgatador |
| Condição da aresta | Quando aplicável | Tipo de aresta, ângulo, proteção existente |
| Fator de queda estimado | Quando aplicável | Comprimento da corda livre vs. distância de queda possível |
| Documentação disponível | Quando aplicável | APR, PT, AF emitidas ou em elaboração |

**Se algum campo obrigatório estiver ausente:**
O agente deve declarar `LACUNA — informação insuficiente` e não forçar análise.
Você deve providenciar o dado antes de prosseguir.

---

## 4. Saídas Esperadas

O agente produz saídas estruturadas no seguinte formato:

### Declaração de status:
```
LIBERÁVEL COM RESTRIÇÃO — [lista de condições obrigatórias]
NÃO LIBERÁVEL — [motivo técnico + referência]
LACUNA — informação insuficiente para análise de [campo ausente]
```

### Análise técnica:
- Lista de conformidades identificadas;
- Lista de não conformidades ou lacunas;
- Referências da base IRATA (sempre com `confidence:referencial`);
- Sugestões de alternativas quando NÃO LIBERÁVEL.

### Checklist estruturado:
- Itens verificados, pendentes e bloqueantes;
- Distinção clara entre item obrigatório e item recomendado.

### Escalonamento:
- Quando output inclui `escalar para supervisor / RT / cliente`: ação sua, não do agente.

---

## 5. Formato Recomendado de Resposta (o que pedir ao agente)

Quando precisar de output estruturado para documentação, solicite explicitamente:

```
"Estruture a resposta com: (1) declaração de status, 
(2) não conformidades encontradas, (3) referências utilizadas, 
(4) ações recomendadas."
```

Para checklist de campo:
```
"Gere checklist de [tema] com itens obrigatórios separados dos recomendados."
```

Para revisão de APR/PT:
```
"Revise a APR abaixo e indique os campos ausentes ou incompletos 
segundo as referências IRATA disponíveis. Não gere uma nova APR — 
apenas aponte as lacunas."
```

---

## 6. Como Registrar Lacunas

Quando o agente identificar uma lacuna que você não consegue resolver antes da execução:

1. Registre a lacuna na APR/PT com texto explícito: *"Lacuna identificada: [descrição]"*;
2. Registre a decisão tomada diante da lacuna: *"Decidido: [ação]"*;
3. Registre o responsável pela decisão (seu nome + função);
4. Se a lacuna for crítica: trabalho não inicia até resolução;
5. Se a lacuna for secundária: registre mitigação adotada.

---

## 7. Como Tratar Emergência

**Em emergência real: o agente é segundo plano. Você age primeiro.**

Sequência em emergência com trabalhador em situação crítica:

```
1. STOP WORK — interromper qualquer atividade em andamento
2. Acionar plano de resgate (humano executa — agente não resgata)
3. Chamar SAMU / socorro especializado se necessário
4. Comunicar responsável técnico e cliente
5. Preservar evidências no local
6. Após estabilização: consultar agente apenas para apoio documental
   (como registrar o evento, que campos preencher no relatório, etc.)
```

O agente pode ser consultado **após** a situação estabilizada para:
- Estruturar o registro do incidente;
- Identificar campos obrigatórios de relatório;
- Verificar conformidade do plano de resgate que foi ativado.

**O agente nunca conduz resgate remoto — nem mesmo como orientação passo a passo em emergência ativa.**

---

## 8. Como Tratar Pressão de Produção

Pressão do cliente ou do gestor para reduzir critérios ou "passar rápido":

**Você:** "Consultar o agente sobre se existe base técnica para flexibilizar."

**Agente:** Não vai encontrar. Os firewalls são absolutos. Vai declarar NÃO LIBERÁVEL ou vai listar os requisitos não negociáveis.

**Você:** Usar o output do agente como respaldo técnico para a recusa:
```
"A análise técnica indica que [condição X] é requisito não negociável 
segundo [referência IRATA com confidence:referencial]. 
Não há base técnica para flexibilização."
```

Se o cliente insistir após isso: **Stop Work Authority é sua. Use.**

O agente apoia sua posição — não a reverte.

---

## 9. Como Tratar Divergência entre Agente e Supervisor

Se o output do agente contradizer sua avaliação de campo:

1. **Não ignore a divergência** — registre-a;
2. Identifique se a divergência é por:
   - **Dado incompleto fornecido ao agente** → fornecer dado correto e re-consultar;
   - **Condição de campo que o agente não pode perceber** → sua avaliação prevalece com justificativa documentada;
   - **Erro aparente do agente** → registrar como lacuna do sistema para revisão futura;
3. Sempre documente a divergência e a decisão final humana;
4. Se houver dúvida sobre norma citada pelo agente: verificar fonte original (`confidence:referencial` = verificar antes de usar formalmente).

**Regra:** Sua percepção de campo + seu julgamento técnico > output do agente.

---

## 10. Como Manter Autoridade Humana

Práticas que preservam sua autoridade como Supervisor N3:

```
✅ Você formula a pergunta — não deixe terceiros usarem o agente 
   para obter respostas que contornam indevidamente sua autoridade.

✅ Você interpreta o output — não repasse o output bruto ao cliente 
   como se fosse um parecer técnico independente.

✅ Você registra a decisão — o agente analisa, você decide, 
   você assina, você responde.

✅ Você usa Stop Work quando necessário — o agente pode identificar 
   a condição, mas a autoridade de parar é sua.

✅ Você escala quando necessário — agente identifica limite de escopo, 
   você aciona o RT ou o cliente.

✅ Você mantém o contexto de campo — o agente não sabe o que está 
   acontecendo fisicamente. Você sabe.
```

---

*Criado em Iteração 6.5 — 2026-06-10*
*Agente: irata-agent — status: review_validated — active: false*
*Destinado ao: Supervisor IRATA N3 — operador primário*
