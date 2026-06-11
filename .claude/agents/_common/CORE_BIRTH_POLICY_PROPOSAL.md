# CORE BIRTH POLICY PROPOSAL — Innate Cores and Domain-Core Instantiation

**Arquivo:** proposta arquitetural
**Criado em:** 2026-06-09
**Criado por:** operador-primario
**Iteração de origem:** 6.0b — Core Birth / Domain-Core Instantiation Policy
**Vinculado a:** CORE_AGENT_STANDARD.md, AGENT_COMM_UNIT_PROPOSAL.md, SIMB_BRIDGE_PROPOSAL.md
**Status:** proposta — não implementada

---

## 1. Status

- **proposta arquitetural** — não implementada, não ativa;
- não altera registry;
- não altera agentes;
- depende de aprovação futura via FW-GOVERNOR / VERSIONING / QA.

---

## 2. Frase-mãe

> Os únicos cores verdadeiramente inatos são os de constituição, circulação, segurança epistêmica e interface humana.
> Todo core especializado deve nascer da necessidade real do operador, das fontes disponíveis, do escopo definido e de validação governada.

---

## 3. Ideia central

O CORE-OS não deve nascer com todos os cores possíveis como se fossem universais.

Ele deve nascer com um núcleo estrutural mínimo e seguro, capaz de:

- governar;
- rotear;
- preservar coerência;
- detectar lacunas;
- entender a linguagem do operador;
- comunicar-se bem;
- criar novos cores de forma controlada quando houver necessidade real.

---

## 4. Cores inatos / system-native cores

São cores ou camadas que fazem parte da arquitetura mínima de qualquer instalação CORE-OS.

Incluem:

- FW-CORE / fw-governor;
- META-ROUTER;
- cognitive-logistics;
- context-mapper;
- CORE-LITE WATCHDOG;
- CONFLICT-SCAN;
- EPISTEMIC SAFETY;
- HARVEST-CORE;
- VERSIONING;
- CAPABILITY-GAP;
- AGENT-COMM-UNIT, se aprovado futuramente;
- SIMB-KERNEL / SIMB-BRIDGE como camada de interface humana, se aprovado futuramente.

**Função:**

- proteger coerência;
- preservar rastreabilidade;
- evitar falsa certeza;
- reduzir fricção;
- entender o operador;
- permitir evolução governada.

---

## 5. Cores especializados / domain-specific cores

Não devem ser considerados inatos universais.

**Exemplos:**

- ASSET-CORE;
- IRATA-CORE;
- INSPECTION-CORE;
- LEGAL-CORE;
- NORM-CORE especializado;
- LEARN-CORE;
- LOTOFA-CORE;
- TRADE-CORE;
- outros cores técnicos ou pessoais.

Esses cores dependem de:

- realidade do usuário;
- profissão;
- país/jurisdição;
- fontes disponíveis;
- normas;
- documentos;
- workflows;
- riscos;
- repetição de demandas;
- capacidade de execução;
- autorização do operador.

---

## 6. Regra sobre SIMB

**SIMB não cria cores.**

SIMB pode:

- detectar necessidade recorrente;
- perceber fricção do operador;
- traduzir linguagem confusa em demanda operável;
- sugerir que uma lacuna pode exigir novo core;
- informar variáveis humanas relevantes para um agente de domínio.

SIMB não pode:

- criar core sozinho;
- alterar domínio técnico;
- contaminar decisão financeira, jurídica, normativa ou operacional;
- usar sonho/símbolo como evidência de domínio;
- substituir Capability-Gap;
- substituir FW-GOVERNOR;
- substituir QA;
- substituir aprovação do operador.

---

## 7. Natureza do usuário vs. natureza do core

**Regra central:**

> A natureza do usuário não altera a natureza do core.
> Mas a realidade do usuário pode ser variável legítima dentro do core.

**Exemplo ASSET:**

❌ Errado:
"Usuário tem ansiedade com dinheiro, então ASSET-CORE vira SIMB-CORE financeiro."

✅ Certo:
"Usuário tem ansiedade com dinheiro. ASSET-CORE continua usando dados, risco, liquidez, E-histórico, valuation e regime. Mas considera ansiedade, tolerância a drawdown e risco de abandono da estratégia como variáveis de execução."

---

## 8. Personalização sem contaminação de domínio

**Princípio:**

> Personalização sem contaminação de domínio.

### ASSET

**Pode:**

- considerar tolerância emocional;
- reduzir volatilidade;
- favorecer simplicidade;
- priorizar liquidez;
- ajustar tamanho de posição;
- propor renda fixa se o risco de execução for alto.

**Não pode:**

- usar sonho como tese de investimento;
- invalidar dado financeiro por estado emocional;
- transformar ansiedade em verdade de mercado.

### IRATA

**Pode:**

- considerar cansaço/sobrecarga para reforçar checklist e dupla checagem.

**Não pode:**

- ignorar lacuna de ancoragem porque o operador é experiente;
- liberar trabalho sem plano de resgate.

### LEGAL

**Pode:**

- adaptar tom de comunicação se o operador está com raiva.

**Não pode:**

- transformar sensação de injustiça em força jurídica.

### INSPECTION

**Pode:**

- adaptar output para campo, curto e rastreável.

**Não pode:**

- declarar aptidão sem evidência.

---

## 9. Pipeline de nascimento de um core especializado

Um core especializado só pode nascer por processo governado:

1. uso real / demanda recorrente;
2. SIMB-BRIDGE ou cognitive-logistics percebe padrão de necessidade;
3. meta-router identifica domínio;
4. capability-gap classifica a lacuna;
5. harvest-core propõe elevação;
6. fw-governor valida risco, escopo e necessidade;
7. fontes mínimas são identificadas;
8. design base é criado;
9. AGENT.md é preenchido para review;
10. QA textual é executado;
11. operador aprova;
12. status evolui por versionamento.

**Nenhum core nasce por impulso isolado.**

---

## 10. Critérios mínimos para criar novo core

Antes de criar um novo core, deve haver:

- necessidade recorrente ou impacto alto;
- escopo claro;
- domínio definido;
- fontes disponíveis ou lacunas declaradas;
- risco classificado;
- não-escopo explícito;
- relação com cores existentes;
- decisão sobre se é core, agent, skill, workflow ou apenas template;
- QA previsto;
- aprovação do operador.

---

## 11. Quando NÃO criar um core

Não criar core quando:

- for uma demanda isolada;
- for apenas uma preferência temporária;
- for impulso emocional;
- puder ser resolvido com skill existente;
- puder ser resolvido por agente existente;
- não houver fonte suficiente;
- o domínio estiver mal definido;
- o risco de contaminação entre domínios for alto;
- o custo de manutenção superar o benefício.

---

## 12. Relação com AGENT-COMM-UNIT

AGENT-COMM-UNIT, se aprovado, é candidato a camada inata/comum porque todo agente precisa comunicar bem.

Mas sua implementação deve ser comum, controlada e adaptável por domínio.

---

## 13. Relação com SIMB-BRIDGE

SIMB-BRIDGE, se aprovado, é candidato a camada de interface humana.

Ele ajuda o sistema a entender a linguagem do operador, mas não muda a verdade dos domínios.

---

## 14. Riscos se mal aplicado

Riscos:

- psicologizar todos os domínios;
- criar cores demais;
- criar agentes por empolgação;
- transformar estado emocional em evidência;
- vazar memória íntima entre agentes;
- substituir fonte por personalização;
- gerar dependência excessiva do sistema;
- perder rastreabilidade;
- causar persona drift.

---

## 15. Formulação final

> O CORE-OS nasce com núcleos constitucionais, circulação, segurança epistêmica e interface humana.
> Os cores especializados nascem da realidade concreta do operador, quando há necessidade recorrente, fonte suficiente, domínio definido e validação governada.
> O SIMB não cria cores: ele percebe necessidades, traduz a linguagem do usuário e informa variáveis humanas relevantes, sem contaminar a verdade própria de cada domínio.

---

## 16. Recomendação futura

Esta proposta deve ser avaliada futuramente para possível incorporação em:

- CORE_AGENT_STANDARD.md;
- AGENT_COMM_UNIT_PROPOSAL.md;
- SIMB_BRIDGE_PROPOSAL.md;
- capability-gap agent;
- harvest-core policy;
- versioning policy.
