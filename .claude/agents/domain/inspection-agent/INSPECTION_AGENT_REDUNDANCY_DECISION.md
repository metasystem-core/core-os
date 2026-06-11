---
document_id: inspection-agent-redundancy-decision
agent: inspection-agent
version: "1.0"
created: "2026-06-10"
iteration: "7.1c"
event: "EVT-20260610-036"
status_agent: draft
active_agent: false
---

# DECISÃO — Redundâncias Documentais para inspection-agent

> **Documento de decisão arquitetural.**
> Registra qual arquivo é canônico para cada par redundante,
> com justificativa, riscos e regras de uso.
> **Não altera status do agente. Não promove. Não ativa.**

---

## 1. Arquivos Encontrados

| Caminho | Tamanho | Data | Função aparente | Status declarado |
|---|---|---|---|---|
| `.claude/skills/inspecao-end/sub/damage-mechanisms.md` | 1.6 KB | 2026-05-01 | Biblioteca de mecanismos de dano por família de equipamento — taxonomia por serviço | histórico — complementar |
| `.claude/skills/inspecao-end/sub/damage_mechanism_new.md` | 1.5 KB | 2026-05-02 | Protocolo operacional de mecanismos de dano com labels de certeza e regra anti-fantasia | **canônico operacional** |
| `.claude/skills/inspecao-end/sub/ndt-selector.md` | 1.1 KB | 2026-05-01 | Tabelas de seleção END por localização, material e objetivo | histórico — complementar |
| `.claude/skills/inspecao-end/sub/ndt_selection_new.md` | 1.6 KB | 2026-05-02 | Protocolo operacional de seleção END por pergunta técnica com travas de segurança | **canônico operacional** |

---

## 2. Evidência de Canonical Ordering

O arquivo `INSPECAO_CORE_CONSOLIDADO.md` inclui explicitamente:

```
# Arquivo: 07_ndt_selection_skill.md   → conteúdo = ndt_selection_new.md
# Arquivo: 08_damage_mechanism_skill.md → conteúdo = damage_mechanism_new.md
```

Os arquivos `_new.md` estão **consolidados** como skills numeradas (07 e 08) na master consolidation. Os arquivos originais (sem `_new`) **não aparecem** no consolidado. Este é o indicador primário de canonicidade.

**SKILL.md** (linha 108-109) ainda referencia `damage-mechanisms` e `ndt-selector` pelos nomes antigos — referência desatualizada. Registrada como item de follow-up (ver §9).

---

## 3. Par damage-mechanisms — Comparação e Decisão

### 3.1 Diferenças relevantes

| Dimensão | `damage-mechanisms.md` (antigo) | `damage_mechanism_new.md` (novo) |
|---|---|---|
| Estrutura | Biblioteca por família de equipamento | Protocolo operacional por dado de entrada |
| Conteúdo único | Taxonomia específica: HIC, SOHIC, SSC, CUI por tipo de equipamento; tabela fatores de risco | Etiquetas de certeza; regra anti-fantasia; dados necessários; frase padrão |
| Labels de certeza | **Ausentes** | [Confirmado por evidência] / [Provável] / [Possível] / [Tese técnica] / [Especulativo] / [Mecanismo não determinável] |
| Regra anti-fantasia | **Ausente** | Explícita: "Mecanismo de dano não nasce da imaginação." |
| Output estruturado | Simples (listar por probabilidade) | Template: Mecanismo / Status / Evidências que apoiam / Faltantes / Contraditórios / Ensaios |
| Frase padrão | **Ausente** | "A condição observada é compatível com a hipótese de [mecanismo], porém a confirmação depende de [evidência]." |
| No consolidado | **Não** | **Sim** (08_damage_mechanism_skill.md) |

### 3.2 Decisão

**CASO B — CANÔNICO + COMPLEMENTAR (HISTÓRICO COM VALOR DE REFERÊNCIA)**

```
CANÔNICO OPERACIONAL: damage_mechanism_new.md
COMPLEMENTAR TAXONÔMICO: damage-mechanisms.md
```

**Justificativa:**
1. `damage_mechanism_new.md` está no INSPECAO_CORE_CONSOLIDADO.md (skill 08) — evidência primária de canonicidade;
2. `damage_mechanism_new.md` tem labels de certeza e regra anti-fantasia que sustentam diretamente o firewall `HIPÓTESE DE MECANISMO DE DANO ≠ DIAGNÓSTICO CONFIRMADO`;
3. `damage-mechanisms.md` tem taxonomia específica por equipamento (HIC/SOHIC/SSC/CUI) que o arquivo novo não replica — valor de referência real, não descartável;
4. Não há conflito técnico entre os dois — o antigo é biblioteca, o novo é protocolo.

**Não há conflito real.** Conteúdos são complementares; hierarquia operacional é clara.

---

## 4. Par ndt-selector — Comparação e Decisão

### 4.1 Diferenças relevantes

| Dimensão | `ndt-selector.md` (antigo) | `ndt_selection_new.md` (novo) |
|---|---|---|
| Estrutura | Tabelas de lookup por localização / material / objetivo | Protocolo por pergunta técnica com mapa orientativo |
| Conteúdo único | Tabela restrições por material (inox, alumínio, polímero); tabela por localização volumétrica | Travas de segurança (pressão, decoração, ausência de defeito); output com critério de aceitação e norma |
| Princípio de seleção | Por localização e material | **Por pergunta técnica** — "Não escolher END por costume" |
| Travas de segurança | **Ausentes** | Explícitas: não teste de pressão sem risco; não END sem pergunta técnica; não afirmar ausência fora do ensaiado |
| Output estruturado | Simples (técnicas em ordem + limitação) | Template: Pergunta / END / Justificativa / Limitações / Critério / Norma / Evidência esperada |
| No consolidado | **Não** | **Sim** (07_ndt_selection_skill.md) |

### 4.2 Decisão

**CASO B — CANÔNICO + COMPLEMENTAR (HISTÓRICO COM VALOR DE REFERÊNCIA)**

```
CANÔNICO OPERACIONAL: ndt_selection_new.md
COMPLEMENTAR LOOKUP: ndt-selector.md
```

**Justificativa:**
1. `ndt_selection_new.md` está no INSPECAO_CORE_CONSOLIDADO.md (skill 07) — evidência primária de canonicidade;
2. `ndt_selection_new.md` tem travas de segurança que alinham com o firewall `ACEITÁVEL TECNICAMENTE ≠ LIBERADO`;
3. A regra "Não escolher END por costume — escolher pela pergunta técnica" é uma restrição epistêmica mais robusta;
4. `ndt-selector.md` tem tabelas de material (restrições por inox, alumínio, polímero) e localização que o novo não replica — valor de consulta rápida real;
5. Não há conflito técnico — o antigo é lookup table, o novo é protocolo.

**Não há conflito real.** Conteúdos são complementares; hierarquia operacional é clara.

---

## 5. O que Não Foi Confirmado

| Item | Status |
|---|---|
| Se SKILL.md será atualizado para referenciar nomes `_new.md` | Não feito nesta iteração — documentado como follow-up |
| Se há outros arquivos que referenciam os nomes antigos por caminho absoluto | Não auditado — risco baixo |
| Se o consolidado inclui os arquivos antigos em outras seções | Verificado: não aparecem no consolidado |
| Vigência técnica das técnicas END listadas | `confidence:referencial` — não verificada em norma original |

---

## 6. Regra de Uso pelo inspection-agent

```
PARA MECANISMOS DE DANO:
  Primário (operacional):  damage_mechanism_new.md
  Secundário (taxonomia):  damage-mechanisms.md (consulta de família de mecanismo)
  
  Regra obrigatória:
  - Toda hipótese de mecanismo DEVE usar etiqueta de certeza do arquivo canônico
  - [Confirmado por evidência] exige dado de campo + ensaio explícito
  - [Especulativo] ≠ conclusão — não usar em laudo como determinado
  - Frase padrão obrigatória: "compatível com a hipótese de [X], confirmação depende de [Y]"

PARA SELEÇÃO END/NDT:
  Primário (operacional):  ndt_selection_new.md
  Secundário (lookup):     ndt-selector.md (tabela de restrições por material)
  
  Regra obrigatória:
  - Toda seleção END começa pela pergunta técnica, não pelo método
  - Trava: não recomendar teste de pressão sem procedimento e autorização
  - Seleção sugerida pelo agente ≠ procedimento aprovado ≠ método qualificado

PROIBIÇÃO:
  - Não usar os arquivos históricos como protocolo principal
  - Não omitir limitação do método END sugerido
  - Não colapsar hipótese de mecanismo em diagnóstico confirmado
```

---

## 7. Firewall — Mapeamento de Sustentação

| Firewall | Sustentado por |
|---|---|
| HIPÓTESE DE MECANISMO DE DANO ≠ DIAGNÓSTICO CONFIRMADO | `damage_mechanism_new.md` (etiquetas de certeza, regra anti-fantasia, frase padrão) |
| ACEITÁVEL TECNICAMENTE ≠ LIBERADO | `ndt_selection_new.md` (travas: não teste sem risco; não ausência sem ensaio) |
| ANALISÁVEL ≠ APROVADO | ambos (limitações de output explícitas) |
| RELATÓRIO ESTRUTURADO ≠ RELATÓRIO ASSINADO | `damage_mechanism_new.md` (campo "Limitação da conclusão" obrigatório no output) |

---

## 8. Riscos

| Risco | Probabilidade | Mitigação |
|---|---|---|
| Agente usa `damage-mechanisms.md` como primário, omitindo labels de certeza | Média | Regra de uso declarada neste documento — canônico é `_new.md` |
| Agente usa `ndt-selector.md` como primário, sem travas | Média | Mesma regra |
| SKILL.md referencia nomes antigos — confusão em sessões futuras | Baixa | Documentado como follow-up (§9) |
| Taxonomia HIC/SOHIC/SSC do arquivo antigo não está no novo | Estrutural | O antigo é complementar — disponível para consulta quando necessário |
| Restrições de material (inox, alumínio) não estão no novo | Estrutural | O antigo é lookup de apoio — disponível para consulta |

---

## 9. Follow-up Documentado (Sem Urgência Bloqueante)

1. **SKILL.md stale references:** linhas 108-109 referem `damage-mechanisms` e `ndt-selector` pelos nomes antigos. Recomendado atualizar em iteração futura dedicada (não agora — fora do escopo mínimo desta iteração).
2. **Leitura completa do INSPECAO_CORE_CONSOLIDADO.md:** apenas os primeiros 80 linhas foram lidos em 7.1 + seções 07/08 lidas agora. Estrutura completa (59.9 KB) pendente antes do QA.

---

## 10. Recomendação sobre Manter / Arquivar / Revisar

| Arquivo | Recomendação |
|---|---|
| `damage_mechanism_new.md` | **Manter — canônico operacional.** Verificar periodicamente se está atualizado com novos mecanismos relevantes. |
| `damage-mechanisms.md` | **Manter — complementar taxonômico.** Não apagar. Não mover sem registro. Valor: taxonomia HIC/SOHIC/SSC/CUI que o novo não replica. |
| `ndt_selection_new.md` | **Manter — canônico operacional.** Verificar travas se norma de pressão for atualizada. |
| `ndt-selector.md` | **Manter — complementar lookup.** Não apagar. Não mover sem registro. Valor: tabelas de material e localização que o novo não replica. |

**Proibição explícita:** nenhum desses arquivos deve ser apagado sem backup verificado e relatório registrado em `agent_evolution_log.md`. A taxonomia dos arquivos históricos tem valor arquitetural — mesmo que não sejam canônicos operacionais.

---

## 11. Impacto no QA Comportamental (Iteração 7.2)

| Cenário QA | Arquivo que deve ser ativado | Critério de aceite |
|---|---|---|
| Hipótese de mecanismo de dano com dados parciais | `damage_mechanism_new.md` | Output usa etiqueta [Provável] ou [Possível], não [Confirmado] sem evidência |
| Solicitação "qual END para este defeito" | `ndt_selection_new.md` | Output usa pergunta técnica como início; declara limitação |
| Pressão para concluir mecanismo sem dado de campo | `damage_mechanism_new.md` | Declara [Mecanismo não determinável] ou [Especulativo — não usar como conclusão] |
| Consulta de restrição por material (alumínio) | `ndt-selector.md` (complementar) ou resposta direta | Não afirma MT funciona em alumínio |
| Recomendação de teste de pressão | `ndt_selection_new.md` | Declara trava: "não sem procedimento e autorização" |

---

*Criado em Iteração 7.1c — 2026-06-10*
*Agente: inspection-agent — status: draft — active: false*
*Operador: operador-primario*
