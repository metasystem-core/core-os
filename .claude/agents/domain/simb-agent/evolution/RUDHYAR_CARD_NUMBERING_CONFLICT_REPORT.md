# RUDHYAR CARD NUMBERING CONFLICT REPORT
## Relatório de Conflito de Numeração — Corpus Rudhyar × Corpus Neumann

**Versão:** 1.0  
**Criado em:** SIMB-RUDHYAR-CORPUS-001 (2026-06-12)  
**Agente:** simb-agent (Iris)  
**Status:** DOCUMENTADO — NÃO RESOLVIDO (requer decisão arquitetural do operador)

---

## 1. Problema

Existe conflito entre os IDs de cards propostos/criados durante o corpus Rudhyar e os IDs de cards pendentes propostos no corpus Neumann (SA-001).

### Linha do tempo dos conflitos:

**SA-001 (Neumann)** — propôs cards pendentes: CON-019 a CON-027  
**SA-002 (AoT)** — criou cards CON-007 a CON-013; propôs pendentes CON-014 a CON-016  
**SA-003 (Prática)** — criou cards CON-014 a CON-020 ← **colisão com SA-002 pending e com SA-001 pending**  
**SA-004 (Planetarization)** — criou cards CON-021 a CON-031 ← **colisão total com SA-001 pending**

### Mapa de colisões:

| ID | Proposto por SA-001 (Neumann pending) | Tomado por (Rudhyar corpus) |
|---|---|---|
| CON-014 | Pendente SA-002 (Alma de Diamante, AoT) | **SA-003: Maré Solar (Prática)** |
| CON-015 | Pendente SA-002 (Self como Princípio, AoT) | **SA-003: Gestalt do Mapa (Prática)** |
| CON-016 | Pendente SA-002 (Holárquico vs Hierárquico, AoT) | **SA-003: Aspecto como Fase de Ciclo (Prática)** |
| CON-017 | (neutro — não explicitamente proposto) | **SA-003: Limites da Predição (Prática)** |
| CON-018 | (neutro) | **SA-003: Tríade Natal/Trânsitos/Progressões** |
| CON-019 | **Neumann pending (SA-001)** | **SA-003: Horária como Mediação Responsável** |
| CON-020 | **Neumann pending (SA-001)** | **SA-003: Ciclo Precessional como Quadro** |
| CON-021 | **Neumann pending (SA-001)** | **SA-004: Seed-Man / Homem-Semente** |
| CON-022 | **Neumann pending (SA-001)** | **SA-004: Ego vs. Self (Distinção Operacional)** |
| CON-023 | **Neumann pending (SA-001)** | **SA-004: Ideity** |
| CON-024 | **Neumann pending (SA-001)** | **SA-004: Dialética Tribal→Individual→Planetário** |
| CON-025 | **Neumann pending (SA-001)** | **SA-004: Consciência Eônica** |
| CON-026 | **Neumann pending (SA-001)** | **SA-004: Verdade vs. Valor** |
| CON-027 | **Neumann pending (SA-001)** | **SA-004: Rita e Moralidade Holárquica** |

**Estado atual dos cards Neumann pendentes:**
- Nenhum dos 9 cards pendentes de Neumann (CON-019 a CON-027) foi criado
- Seus IDs foram usados pelo corpus Rudhyar (SA-003 e SA-004)
- Os 3 cards pendentes de AoT (CON-014 a CON-016) também não foram criados; IDs tomados

**Próximo ID disponível:** CON-032

---

## 2. Risco

| Risco | Descrição | Impacto |
|---|---|---|
| Colisão de IDs | Um ID aponta para cards de fontes diferentes | Baixo — já materializado; colisão não duplica arquivos, apenas exige renumeração dos pending |
| Registry ambíguo | CONCEPTS_REGISTRY pode ter IDs inconsistentes com os cards criados | Médio — registry precisa refletir estado real |
| Perda de rastreabilidade | Cards pendentes Neumann sem IDs reservados | Médio — próximos cards Neumann precisarão de IDs novos (CON-032+) |
| Cards de fontes diferentes competindo pela mesma numeração | SA_003 e SA_001 pending apontam para IDs idênticos | Resolvido de facto — Rudhyar ganhou; Neumann pending vai para CON-032+ |
| Inconsistência de IRIS_NEUMANN_IMPLEMENTATION_QUEUE.md | O documento lista CON-019 a CON-027 como IDs pendentes dos cards Neumann | Médio — o arquivo precisa ser atualizado para refletir novos IDs |

---

## 3. Opções de Resolução

### Opção A — Numeração Global Contínua (atual, mantida por padrão)

**Descrição:** manter CON-001, CON-002 etc. globalmente sem prefixo de corpus. Exige registry central forte. Os cards Neumann pendentes simplesmente recebem os próximos IDs disponíveis (CON-032+).

**Vantagens:**
- Sem renomeação de arquivos existentes
- Compatível com estado atual
- Mais simples de implementar agora

**Desvantagens:**
- Não é evidente de qual corpus vem cada card pelo ID
- Requer CONCEPTS_REGISTRY rigoroso para rastrear origem
- Cresce indefinidamente sem agrupamento

**Próxima ação se esta opção for escolhida:**
- Atualizar IRIS_NEUMANN_IMPLEMENTATION_QUEUE.md para usar CON-032+ para os cards Neumann pendentes
- Certificar que CONCEPTS_REGISTRY tem campo `source_id` e `tradition` para distinguir corpus

---

### Opção B — Prefixo por Fonte/Corpus

**Descrição:** distinguir cards por corpus no ID. Ex:
- NEU-CON-001 (Neumann concept card)
- RUD-CON-001 (Rudhyar concept card)
- RUD-SYM-001 (Rudhyar symbol card)

**Vantagens:**
- ID auto-explicativo — origem imediatamente visível
- Reduz risco de colisão futura ao adicionar novos corpus
- Mais robusto para biblioteca grande

**Desvantagens:**
- Requer renomeação de TODOS os arquivos existentes (CON-001 a CON-031)
- Requer atualização de LIBRARY_INDEX, CONCEPTS_REGISTRY, todos os cross-references
- Disruptivo — não recomendado sem planejamento extenso
- Quebra a convenção de ID do template v2.0

**Próxima ação se esta opção for escolhida:**
- Criar MIGRATION_PLAN.md antes de qualquer renomeação
- Executar migração em tarefa separada com rollback planejado

---

### Opção C — Prefixo por Domínio + Sequência Global (recomendado)

**Descrição:** manter prefixo `CON-SIMB-NNN` e `SYM-SIMB-NNN` (já em uso nos IDs do LIBRARY_INDEX), com sequência global contínua. A origem fica no campo `source_id` de cada card — não no ID.

**Vantagens:**
- Compatível com o sistema atual (`CON-SIMB-001` etc. já no LIBRARY_INDEX)
- Sem renomeação de arquivos (os arquivos usam `CON-NNN` nos filenames; os IDs formais nos registros usam `CON-SIMB-NNN`)
- Distingue o domínio (SIMB) de outros domínios futuros
- Evita colisão apenas pelo controle rigoroso do registry

**Desvantagens:**
- Ainda requer registry rigoroso para distinguir corpus dentro do domínio SIMB
- Não soluciona a distinção Neumann/Rudhyar no ID (solução: campo no registry)

**Próxima ação se esta opção for escolhida:**
- Nenhuma renomeação necessária — status quo mantido
- Atualizar IRIS_NEUMANN_IMPLEMENTATION_QUEUE.md para CON-032+ (próximos Neumann pending)
- Certificar CONCEPTS_REGISTRY com campos `source_id` e `tradition`

---

## 4. Recomendação Preliminar

**Opção C — Prefixo por Domínio + Sequência Global**

**Justificativa:**
1. Compatível com o sistema atual sem disrupção
2. A distinção de corpus é feita pelo campo `source_id` nos cards e no registry — que já existe
3. Os arquivos existentes (CON-001 a CON-031) não precisam ser renomeados
4. Os cards Neumann pendentes simplesmente receberão CON-032 em diante
5. A Opção B (renomeação total) seria necessária apenas se o volume de corpus crescesse a ponto de o registry ser insuficiente para rastreamento — o que não é o caso agora

**O que fazer imediatamente após decisão do operador:**
1. Atualizar IRIS_NEUMANN_IMPLEMENTATION_QUEUE.md: substituir CON-019..027 por CON-032..040 (próximos 9 IDs)
2. Atualizar CONCEPTS_REGISTRY para incluir os cards CON-006 a CON-031 com campos `source_id` e `tradition`
3. Criar os cards Neumann pendentes com CON-032+

---

## 5. Próxima Ação

**Esta resolução requer decisão explícita do operador antes de qualquer renumeração.**

Formato de decisão (via OPERATOR_APPROVAL_GATE.md ou mensagem direta):

```
DECISÃO ARQUITETURAL — CARD NUMBERING
Opção escolhida: [A / B / C]
Observações adicionais: [opcional]
Autorizo aplicação: [SIM / NÃO]
```

Enquanto não houver decisão:
- Nenhum card Neumann novo será criado
- A fila de implementação em IRIS_NEUMANN_IMPLEMENTATION_QUEUE.md permanece com IDs desatualizados (CON-019..027)
- Os cards Rudhyar existentes (CON-006..031) permanecem intocados

---

## Invariantes

```
CONFLITO DOCUMENTADO ≠ CONFLITO RESOLVIDO
RENUMERAÇÃO REQUER APROVAÇÃO EXPLÍCITA DO OPERADOR
CARDS EXISTENTES NÃO SÃO RENOMEADOS SEM ORDEM
REGISTRY CENTRAL É A FONTE DE VERDADE
OPERATOR OWNS NAMING CONVENTION
```
