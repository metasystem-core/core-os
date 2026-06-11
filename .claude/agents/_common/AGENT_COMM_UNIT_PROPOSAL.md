# AGENT-COMM-UNIT PROPOSAL — Communication Unit / Output Adapter

**Arquivo:** proposta arquitetural
**Criado em:** 2026-06-09
**Criado por:** operador-primario
**Iteração de origem:** 5.6 — Interface & Communication Design Notes
**Vinculado a:** todos os agentes CORE-AGENTS
**Status:** proposta — não implementada

---

## 1. Status

- **Proposta arquitetural** — não implementada, não ativa.
- Não altera `CORE_AGENT_STANDARD.md` ainda.
- Não altera nenhum AGENT.md existente.
- Não altera registry, skills ou schemas.
- Depende de aprovação futura pelo operador primário e propagação controlada via patch.

---

## 2. Ideia central

Todo agente deve possuir uma **unidade de comunicação** responsável por transformar análise interna em entrega clara, proporcional, rastreável e acionável — para o operador ou para outro agente.

**Frase-mãe:**
> "O agente não deve apenas estar certo.
> Ele deve ser compreensível, acionável e proporcional."

A qualidade técnica de uma análise não tem valor se não puder ser recebida e usada.
AGENT-COMM-UNIT é a camada que garante que o que o agente sabe possa ser entregue com clareza, sem excesso, sem compressão falsa e com próxima ação.

---

## 3. Função

- Estruturar resposta de acordo com o domínio, estado do operador e natureza da demanda.
- Escolher nível de profundidade proporcional ao risco e urgência da demanda.
- Separar dado, fonte, hipótese, conclusão, lacuna e ação — nunca colapsar esses níveis.
- Declarar incerteza explicitamente — confiança qualificada, nunca falsa certeza.
- Comunicar risco sem dramatizar e sem suavizar.
- Produzir próxima ação concreta e executável.
- Gerar handoff estruturado quando necessário — com contexto, resultado, pendências e risco.
- Adaptar comunicação ao domínio — cada agente tem seu vocabulário e estrutura natural.
- Reduzir ruído — resposta longa não é resposta melhor.
- Evitar excesso — agente bom entrega o necessário e para.

---

## 4. Output mínimo comum

Toda resposta de agente deve conter, no mínimo, os seguintes elementos — adaptados ao domínio:

```
1. Entendimento da demanda        — o que foi pedido, reescrito de forma clara
2. Domínio principal              — em que campo este agente está operando
3. Dados / fontes usados          — o que fundamenta a análise (com rastreabilidade)
4. Hipóteses / inferências        — o que foi deduzido (separado do dado)
5. Riscos / lacunas               — o que pode estar errado, o que está faltando
6. Resposta operacional           — a entrega principal do agente
7. Próxima ação                   — um passo concreto, executável pelo operador
8. Escalada (se necessário)       — para qual agente ou instância e por quê
```

Elementos podem ser comprimidos para output leve — mas não podem ser omitidos quando relevantes.
Risco e lacuna nunca omitidos. Jamais.

---

## 5. Adaptação por agente

Cada agente possui vocabulário e estrutura de output natural ao seu domínio:

| Agente | Estrutura de output preferencial |
|---|---|
| **SIMB-AGENT** | Campo observado, eixo, risco de autoengano, direção, ação mínima |
| **ASSET-AGENT** | Tese, dado de campo, regime atual, E-histórico, risco dominante, alternativa, decisão possível |
| **NORM-AGENT** | Norma + edição + item + trecho curto, validade, lacuna de adequação, aplicação |
| **IRATA-AGENT** | Risco identificado, procedimento, norma aplicável, equipe, ancoragem, plano de resgate, decisão segura |
| **INSPECTION-AGENT** | Mecanismo de dano, evidência de campo, norma, risco residual, recomendação, lacuna |
| **LEGAL-AGENT** | Fato, prova disponível, tese, risco processual, lacuna, próximo movimento |
| **LEARN-AGENT** | Conceito central, analogia didática, passo a passo, erro provável, próximo teste ou exercício |
| **DOC-AGENT** | Finalidade do documento, público-alvo, estrutura, versão, entrega |
| **INTAKE-AGENT** | Origem, tipo, hash/identificador, classificação, rota sugerida, lacuna |
| **RAG-AGENT** | Consulta original, fonte, trecho recuperado, score/confiança, lacuna |
| **SKILL-AUDITOR** | Skill auditada, falha identificada, risco, patch proposto, prioridade |
| **CAPABILITY-GAP** | Lacuna de capacidade, tipo, impacto no sistema, proposta de resolução, rota |

A estrutura pode ser condensada para outputs leves, mas a **lógica** de separação dado/hipótese/risco/ação deve ser preservada mesmo em formato comprimido.

---

## 6. Relação com outras camadas

| Camada | Função na cadeia de comunicação |
|---|---|
| **meta-router** | Escolhe o agente correto para a demanda |
| **cognitive-logistics** | Organiza entrada e fricção antes do processamento |
| **SIMB-BRIDGE** *(proposta)* | Traduz linguagem viva do operador para o agente |
| **AGENT-COMM-UNIT** | Padroniza a saída/comunicação do agente para o operador ou próximo agente |
| **context-mapper** | Preserva continuidade e empacota o que importa para o próximo ciclo |
| **fw-governor** | Governa coerência e limites — veto final sobre qualquer output constitucional |

O fluxo ideal:
```
input do operador
  → cognitive-logistics (normaliza)
  → [SIMB-BRIDGE] (traduz linguagem — se necessário)
  → meta-router (roteia)
  → agente de domínio (processa)
  → AGENT-COMM-UNIT (estrutura output)
  → context-mapper (compacta para continuidade)
  → operador
```

---

## 7. Firewalls

- **Comunicação clara não pode virar simplificação falsa** — adaptar tom não é esconder risco ou comprimir lacuna.
- **Didatismo não pode apagar incerteza** — tornar algo fácil de entender não permite omitir o que é incerto.
- **Compressão não pode esconder risco** — output leve deve preservar alerta de risco, mesmo que comprimido.
- **Tom adaptado não pode distorcer conclusão** — ajustar linguagem para o estado do operador não autoriza mudar o que foi concluído tecnicamente.
- **Output bonito não substitui fonte** — apresentação bem estruturada não é substituto de rastreabilidade documental.
- **Próxima ação não substitui decisão do operador** — sugerir um passo não é decidir por ele.
- **Agente não deve comunicar além de seu domínio** — output claro sobre assunto fora do domínio é ainda assim output fora do domínio.

---

## 8. Critérios para implementação futura

Para implementar AGENT-COMM-UNIT como componente padrão de todos os agentes:

1. **Revisar `CORE_AGENT_STANDARD.md`** — adicionar seção `2.11 Communication Unit` com estrutura padrão.
2. **Definir seção padrão** nos AGENT.md — bloco `## Communication Unit` com output mínimo adaptado ao domínio.
3. **Criar QA comum de comunicação** — cenários transversais testando: compressão sem perda de risco, tom sem distorção de conclusão, próxima ação concreta.
4. **Aplicar primeiro em agente piloto** — simb-agent (review_validated) é candidato natural para validação inicial.
5. **Depois propagar por patch controlado** — um agente por iteração, com QA antes de avançar.
6. **Registrar cada patch via versionamento** — EVT formal para cada agente atualizado.

**Sequência sugerida de adoção:**
```
1. Patch em CORE_AGENT_STANDARD.md (definição formal)
2. simb-agent (piloto — já em review_validated)
3. Agentes de governo (fw-governor, meta-router, cognitive-logistics, context-mapper)
4. Demais agentes de domínio (asset, norm, irata, inspection, legal, learn)
5. Agentes auxiliares (doc, intake, rag, skill-auditor, capability-gap)
```
