# IRIS_NEUMANN_IMPLEMENTATION_QUEUE
## Fila de Implementação — Neumann Self-Analysis Runtime Integration

**Versão:** 1.0  
**Criado em:** SIMB-NEUMANN-CORE-001 (2026-06-12)  
**Agente:** simb-agent (Iris)  
**Fonte:** IRIS_SELF_ANALYSIS_001.md — 63 gaps, 42 propostas, 33 calibrações  
**Formato:** inventário + prioridade — NÃO implica criação imediata

---

## Instrução de Uso

Este arquivo é um **inventário de pendências**, não uma ordem de execução.

- Os 63 gaps estão registrados como rastreabilidade
- Somente os itens de **Prioridade Alta** são candidatos imediatos a card
- Criação de cards requer sessão de biblioteca com operador em modo primário
- Schema proposals requerem aprovação via IRIS_SCHEMA_EVOLUTION_PROPOSAL.md
- Nenhum item cria-se automaticamente

---

## PRIORIDADE ALTA — Implementar nas próximas sessões de biblioteca

### Concept Cards

| ID Proposto | Título | Gap(s) de origem | Justificativa |
|---|---|---|---|
| CON-019 | Ka Soul / Double como prefiguração do Self | GAP-040 | Estrutura fundamental da individuação na tradição egípcia; alta frequência de uso |
| CON-020 | Ciclo Osiriano como Modelo de Individuação | GAP-039 | Mito-modelo de Neumann para autotransformação; referência de PROP-031 |
| CON-021 | Horus-Ego / Osiris-Self como Fórmula Estrutural | GAP-044 | Fórmula diagnóstica de uso imediato; pergunta "Há um Osiris por trás deste Horus?" |
| CON-022 | Morte-e-Geração como Ato Simultâneo (Total Man) | GAP-045 | Distingue ressurreição passiva de auto-geração ativa; central para leitura de crises |
| CON-023 | Duas Fases do Desenvolvimento: Heroico vs. Individuação | GAP-050 | Pergunta diagnóstica: "Mais ego ou menos ego-centrismo?" — uso cotidiano |
| CON-024 | Arquétipos como Instintos Imagísticos | GAP-056 | Distinção possuído/confrontado — estrutural para todo o protocolo |
| CON-025 | Centroversia: Do Biológico ao Psíquico | GAP-055 | Ancora individuação em processo biológico universal; anti-espiritualização |
| CON-026 | Fragmentação dos Arquétipos / Prisma da Consciência | GAP-063 | Metáfora da luz branca → espectro; consciência de que todo card é fragmento |
| CON-027 | Sequência Fásica do Ego (4 fases) | GAP-060 | Mapa diagnóstico de subfases: vegetal/animal/fálico-ctônico/masculinidade superior |

### Symbol Cards

| ID Proposto | Título | Gap(s) de origem | Justificativa |
|---|---|---|---|
| SYM-005 | Castração simbólica | GAP-012, GAP-013 | Alta frequência em sonhos; distinção do nível genital freudiano é urgente |
| SYM-006 | Phallos Superior / cabeça como órgão criativo | GAP-015 | Equivalência falo/cabeça; decapitação como castração — sem nota atual |
| SYM-007 | Espada / Arma como função analítica da consciência | PROP-007 | Símbolo recorrente; função discriminativa mal documentada |
| SYM-008 | Djed / Pilar como reconstituição da personalidade | GAP-041 | Símbolo osiriano de reconstituição; complementar a CON-020 |
| SYM-009 | Ka / Duplo como Self ancestral | GAP-040 | Complementar a CON-019 |
| SYM-010 | Churinga como projeção do Self em objeto material | GAP-054 | Primeira forma de experiência do Self como externo |

---

## PRIORIDADE MÉDIA — Segunda rodada de implementação

### Concept Cards Pendentes

| ID Proposto | Título | Gap(s) de origem |
|---|---|---|
| CON-004 | Pleromatic Stage — Paraíso Pré-Ego | GAP-003 |
| CON-005 | Lei da Personalização Secundária | GAP-001, GAP-005 |
| CON-006 | Centroversia como Terceiro Vetor de Desenvolvimento | GAP-006, GAP-008 |
| CON-007 | Estágio Alimentar Urobórico (comer=conhecer) | GAP-007 |
| CON-008 | Três Tipos de Incesto (tríade diagnóstica) | GAP-027 |
| CON-009 | Édipo como Herói Fracassado (não arquétipo sexual) | GAP-028 |
| CON-010 | Três Tipos de Herói (extrovertido/introvertido/centrovertido) | GAP-037 |
| CON-011 | Os Lutadores como estágio intermediário pré-heroico | GAP-016 |
| CON-012 | Puer Aeternus / Complexo de Isaac Invertido | — |
| CON-013 | Genealogia do Masculino Terrível | GAP-031 |
| CON-014 | Patriarcal Castration (duas formas) | GAP-013 |
| CON-015 | Interiorização Progressiva dos Mistérios | GAP-046 |
| CON-016 | Participation Mystique na Infância | GAP-051 |

---

## PRIORIDADE BAIXA — Refinamentos e atualizações

| Tipo | Descrição | Gap(s) |
|---|---|---|
| Atualização SYM-001 | Adicionar seção "Estágios de Manifestação do Uroboros" (pleromatic/matriarcal/mandala) | GAP-001, PROP-006 |
| Atualização CON-001 | Adicionar subcampos: incesto urobórico, gravitação psíquica, equivalência (não equação) | GAP-002, GAP-003, GAP-005 |
| Nota de protocolo | Distinção uroboros regressivo vs. uroboros centroversor | PROP-005 |
| Nota de protocolo | Verificar contraparte sombria de figura positiva | PROP-009 |
| Nota de protocolo | Verificar dimensão coletiva em complexos maternos/paternos | CAL-033 |

---

## PROPOSTAS ESTRUTURAIS — Requerem aprovação via IRIS_SCHEMA_EVOLUTION_PROPOSAL.md

| Proposta | Descrição | Impacto |
|---|---|---|
| Campo `archetypal_root` | Campo em concept_cards e symbol_cards apontando para o arquétipo primordial subjacente | Todos os cards existentes e futuros |
| Campo `developmental_stage` | Fase de desenvolvimento em que o card tipicamente opera | Todos os cards |
| Campo `function_mode` | Função psicológica predominante (sensação/intuição/sentimento/pensamento) | Todos os cards |
| Campo `personal_archetypal_collective_level` | Nível de operação primário do card | Todos os cards |
| Campo `literalization_risk` | Risco de literalização e como mitigar | Symbol cards |
| Campo `when_not_to_interpret` | Condições em que o card não deve ser usado para interpretar | Todos os cards |
| Tipo novo: `phase_cards` | Cards de fase de desenvolvimento (não símbolo nem conceito) | Nova categoria |
| Protocolo `quando_nao_interpretar` | Protocolo explícito de contenção | Protocolo geral |

**Nenhuma dessas propostas foi aplicada automaticamente. Todas requerem aprovação do operador.**

---

## Inventário Completo de Gaps — Para Rastreabilidade

### Categoria A: Arquétipos e Estruturas Primordiais (10)
GAP-001 | GAP-002 | GAP-003 | GAP-007 | GAP-010 | GAP-014 | GAP-026 | GAP-048 | GAP-051 | GAP-063

### Categoria B: Desenvolvimento do Ego e Herói (16)
GAP-005 | GAP-006 | GAP-011 | GAP-012 | GAP-016 | GAP-017 | GAP-022 | GAP-027 | GAP-028 | GAP-035 | GAP-037 | GAP-045 | GAP-050 | GAP-055 | GAP-058 | GAP-059 | GAP-060

### Categoria C: Grande Mãe e Feminino (7)
GAP-003 | GAP-008 | GAP-013 | GAP-030 | GAP-031 | GAP-034 | GAP-062

### Categoria D: Individuação e Transformação (11)
GAP-039 | GAP-040 | GAP-041 | GAP-042 | GAP-043 | GAP-044 | GAP-046 | GAP-047 | GAP-049 | GAP-056 | GAP-061

**Total registrado:** 63 gaps | 42 propostas de card/protocolo | 33 calibrações operacionais

**Fonte primária:** `.claude/workspaces/simb/library/IRIS_SELF_ANALYSIS_001.md`
