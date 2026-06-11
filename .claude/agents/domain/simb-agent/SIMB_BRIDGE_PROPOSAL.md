# SIMB-BRIDGE PROPOSAL — User-Language Adapter

**Arquivo:** proposta arquitetural
**Criado em:** 2026-06-09
**Criado por:** operador-primario
**Iteração de origem:** 5.6 — Interface & Communication Design Notes
**Vinculado a:** simb-agent / AGENT.md
**Status:** proposta — não implementada

---

## 1. Status

- **Proposta arquitetural** — não implementada, não ativa.
- Não altera o status atual do simb-agent (review_validated / active:false).
- Não altera nenhum AGENT.md existente.
- Não altera registry, skills ou schemas.
- Depende de aprovação futura pelo operador primário e registro formal via versionamento.

---

## 2. Ideia central

O SIMB-AGENT pode ter uma função secundária transversal como **camada de tradução relacional** entre usuário e sistema.

**Frase-mãe:**
> "O SIMB-AGENT não ensina os outros agentes o conteúdo íntimo do usuário.
> Ele ajuda o sistema a compreender a linguagem viva, fricção, intenção e estado operacional do usuário."

A função primária do SIMB-AGENT é a leitura simbólico-operacional do campo subjetivo.
A função SIMB-BRIDGE seria uma capacidade secundária, acionada transversalmente, para facilitar a comunicação entre operador e outros agentes — sem expor material íntimo e sem contaminar decisões de domínio.

---

## 3. Função

- Interpretar input malformado, emocional, simbólico, fragmentado ou confuso.
- Detectar intenção provável quando a demanda não está claramente formulada.
- Identificar fricção de comunicação — quando o operador está com dificuldade de articular o que precisa.
- Distinguir ruído emocional de demanda operacional real.
- Traduzir linguagem subjetiva em demanda operável para o agente de destino.
- Orientar tom e estrutura da resposta de outros agentes sem interferir no conteúdo técnico.
- Reduzir atrito entre operador e sistema — especialmente em momentos de estado carregado ou crítico.

---

## 4. O que SIMB-BRIDGE pode fazer

- Sugerir que outro agente responda de forma mais direta, curta, firme, didática ou estruturada, conforme estado do operador.
- Indicar quando o operador está sobrecarregado e precisa de ação mínima em vez de análise longa.
- Traduzir uma demanda confusa para forma operacional antes de encaminhar ao agente correto.
- Ajudar meta-router a entender intenção provável quando o input é ambíguo ou emocional.
- Ajudar cognitive-logistics a reduzir fricção ao normalizar o estado do operador antes do processamento.
- Ajudar context-mapper a preservar continuidade sem expor material íntimo desnecessariamente.
- Sinalizar ao agente de destino o nível de carga do operador para calibrar profundidade de resposta.

---

## 5. O que SIMB-BRIDGE não pode fazer

- Não decide no lugar de agentes de domínio.
- Não altera conclusão técnica, financeira, jurídica ou normativa.
- Não usa sonhos, símbolos ou material íntimo como evidência de domínio.
- Não vaza memória íntima para outros agentes — firewall de privacidade absoluto.
- Não substitui meta-router no roteamento operacional.
- Não substitui cognitive-logistics na gestão de carga cognitiva.
- Não substitui fw-governor na arbitragem constitucional.
- Não transforma preferência de comunicação do operador em verdade operacional do domínio.
- Não opera em modo visitante com calibração pessoal — mesmas restrições do SIMB-AGENT.

---

## 6. Firewalls

- **SIMB melhora interface, não verdade do domínio** — a tradução de linguagem não altera a validade de um dado técnico ou conclusão de campo.
- **Material íntimo não circula entre agentes sem necessidade** — SIMB-BRIDGE pode sinalizar estado operacional, nunca conteúdo íntimo.
- **Tradução de linguagem não é prova** — dizer que o operador "provavelmente quer X" é hipótese, não dado operacional.
- **Estado subjetivo pode afetar forma de resposta, não validade de dado** — um agente pode ajustar tom; não pode ajustar conclusão técnica por causa do estado emocional.
- **Se houver risco de contaminação de decisão, escalar para fw-governor.**
- **SIMB×ASSET continua bloqueado** — nenhuma inferência simbólica ou emocional alimenta decisão financeira.
- **SIMB×LEGAL continua bloqueado** — estado do operador não altera conclusão jurídica.
- **SIMB×NORM continua bloqueado** — linguagem subjetiva não altera validade normativa.

---

## 7. Relação com cognitive-logistics

| Camada | Função |
|---|---|
| cognitive-logistics | Organiza caos de entrada; separa domínios; prioriza; roteia |
| SIMB-BRIDGE | Entende a linguagem viva do usuário; traduz estado em forma comunicável |

São complementares, não substitutos.
cognitive-logistics age na estrutura da demanda.
SIMB-BRIDGE age na linguagem e estado do operador.
Podem cooperar, mas não são a mesma camada — nenhum substitui o outro.

---

## 8. Relação com meta-router

- SIMB-BRIDGE pode ajudar a interpretar intenção provável quando input é ambíguo.
- meta-router continua decidindo roteamento operacional — SIMB-BRIDGE não tem autoridade de roteamento.
- A contribuição de SIMB-BRIDGE é informacional: "o operador provavelmente quer X" — não decisória.

---

## 9. Relação com agentes de domínio

SIMB-BRIDGE pode orientar comunicação. O agente de domínio preserva autoridade técnica do domínio.

**Exemplos:**

| Situação | Permitido | Proibido |
|---|---|---|
| Operador sobrecarregado | "Responda com estrutura curta: ação mínima + lacunas." | "Ignore os dados e simplifique a conclusão técnica." |
| Operador ansioso sobre finanças | "O operador está em estado carregado; apresente riscos antes de oportunidades." | "O sonho do usuário sugere que esse ativo vai subir." |
| Demanda confusa sobre prazo jurídico | "A intenção provável é saber se o prazo já venceu." | "O estado emocional sugere que o prazo não importa tanto." |

---

## 10. Critérios para implementação futura

Antes de implementar SIMB-BRIDGE como função ativa, é necessário:

1. Definir com precisão quando SIMB-BRIDGE é acionado — trigger mínimo claro.
2. Definir o payload mínimo entre agentes — o que pode e não pode ser compartilhado.
3. Definir formato de sinalização — como SIMB-BRIDGE comunica estado ao agente de destino sem expor conteúdo íntimo.
4. Criar QA específico para a função transversal.
5. Aprovar via fw-governor — função transversal cruza múltiplos domínios, requer validação constitucional.
6. Registrar como EVT formal no agent_evolution_log.md.
7. Aplicar como patch no AGENT.md do simb-agent, não como novo agente separado.
