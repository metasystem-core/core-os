# INSPECTION-AGENT — Source Recon

**Arquivo:** source recon — iteração 6.0
**Criado em:** 2026-06-09
**Criado por:** operador-primario
**Status:** recon completo — não implementado

---

## 1. Objetivo

Mapear as fontes de capacidade disponíveis para inspection-agent antes da elaboração do AGENT.md para review.

---

## 2. Core Parent

**`inspecao-end`** — Inspeção Técnica de Equipamentos Industriais

Função central: apoiar inspeção de equipamentos industriais, END/NDT, análise de integridade, mecanismos de dano, critérios de aceitação normativos e laudos técnicos.

**Risco:** `high`

Princípio declarado no SKILL.md:
> "Campo primeiro, laudo depois."

---

## 3. Sub-skills disponíveis

| Sub-skill | Localização | Função |
|---|---|---|
| `damage-mechanisms` | `inspecao-end/sub/` | Identificar e classificar mecanismos de dano prováveis pelo serviço/histórico |
| `ndt-selector` | `inspecao-end/sub/` | Selecionar método END adequado para o defeito/equipamento/norma |
| `report-contract` | `inspecao-end/sub/` | Estruturar laudo técnico de inspeção |
| `finding-classifier` | `inspecao-end/sub/` | Classificar achado por severidade e norma de referência |

**Nota:** A pasta `inspecao-end/sub/` é a mais rica do sistema — ~50 arquivos mapeados. As 4 sub-skills acima são as declaradas no SKILL.md principal. Os ~50 arquivos cobrem:

- mecanismos de dano (HIC, SSC, corrosão galvânica, fadiga, fluência, erosão, etc.)
- seleção de END (US imersão, TOFD, Phased Array, LP, PM, END visual, etc.)
- NR-13 (classificação, prazos, categorias, etc.)
- FMEA lite, RBI criticality, análise de consequência de falha
- evidence levels, níveis de incerteza, escopo de campo
- report building (campos mínimos de laudo, QA do laudo)
- field inspection protocols

---

## 4. Documento de referência consolidado

**`inspecao-end/INSPECAO_CORE_CONSOLIDADO.md`**

Documento de referência central do core. Cobre a síntese da arquitetura do INSPEÇÃO-CORE — mapeamento de sub-skills, relações internas, lógica de ativação e estrutura de output. Deve ser lido na iteração 6.5 antes de preencher AGENT.md.

---

## 5. Schemas disponíveis

| Schema | Localização |
|---|---|
| Schema 1 | `inspecao-end/schemas/` |
| Schema 2 | `inspecao-end/schemas/` |
| Schema 3 | `inspecao-end/schemas/` |

3 schemas — tipagem e validação de dados de inspeção. Verificar conteúdo exato em iteração 6.5.

---

## 6. Templates disponíveis

6 templates em `inspecao-end/templates/`. Verificar conteúdo exato em iteração 6.5, mas provável cobertura:

- laudo técnico de inspeção
- relatório de não conformidade
- checklist de campo
- dossiê por equipamento
- relatório de parada/manutenção
- registro de histórico

---

## 7. Exemplos disponíveis

4 exemplos em `inspecao-end/examples/`. Referência para QA textual.

---

## 8. Capacidade declarada

### O que o core suporta

- Classificar equipamento na NR-13
- Estruturar inspeção
- Verificar documentação
- Selecionar END
- Redigir laudo
- Transformar observação bruta em linguagem técnica
- Avaliar achado
- Mapear não conformidade
- Associar falha a norma/procedimento
- Navegar equipamentos de uma planta
- Montar histórico por equipamento
- Identificar pontos críticos
- Analisar possível modo de falha
- Organizar relatório de parada/manutenção/desmontagem

### Output contract da skill

Toda resposta operacional relevante deve conter:

1. Equipamento / TAG identificado
2. Norma de referência aplicada
3. Dados extraídos / observações de campo
4. Achados classificados (🔴 Crítico / 🟡 Atenção / 🔵 Observação)
5. Limitações da análise
6. Recomendação ou próximo passo

### O que o core não faz

- Não assina laudo
- Não emite ART
- Não substitui PH, engenheiro, responsável técnico ou procedimento interno
- Não inventa norma
- Não declara conformidade sem evidência
- Não libera equipamento crítico com pendência relevante
- Não executa RBI formal
- Não executa FMEA formal
- Não transforma opinião em conclusão
- Não trata experiência prática como prova suficiente

---

## 9. Base normativa

Compartilhada com doc-inspecao via `norm-nav`. Inclui:

- `norm_profile.yaml` próprio em `inspecao-end/norm_profile.yaml` — verificar em iteração 6.5
- Acesso ao `norm_library` completo (API, ASME, NR-13, etc.) via doc-inspecao

---

## 10. Lacunas identificadas

| Lacuna | Tipo | Impacto |
|---|---|---|
| ~50 sub-arquivos não foram lidos individualmente — apenas listados | informação | A resolver em iteração 6.5 com leitura de INSPECAO_CORE_CONSOLIDADO.md |
| 3 schemas e 6 templates não foram lidos — conteúdo desconhecido | informação | A verificar em iteração 6.5 |
| `norm_profile.yaml` não lido | informação | A verificar em iteração 6.5 |
| `finding-classifier` aparece em doc-inspecao e inspecao-end — possível duplicação | duplicação | Baixa — provavelmente mesma função, verificar se há diferença |
| Conclusão técnica exige dado de campo real — modelo não pode inferir sem evidência física | limitação estrutural | Crítica — declarar em AGENT.md |

---

## 11. Compatibilidade com AGENT.md skeleton

O AGENT.md skeleton do inspection-agent declara:
- `skills_used: [inspecao-end, doc-inspecao]`
- `can_call: [doc-agent, rag-agent, norm-agent]`
- `can_be_called_by: [operator, meta-router, fw-governor, irata-agent]`

**Avaliação:**
- `inspecao-end` é o core operacional. Rico e bem estruturado. Pronto para revisão.
- `doc-inspecao` como skill adicional é correto — análise documental complementa inspeção física.
- Chamado por `irata-agent` é crítico — inspeção em altura requer cooperação entre os dois.
- `norm-agent` como chamável é correto — inspection-agent consulta normas via norm-agent.
- `rag-agent` para consulta de histórico/laudo. Draft — sem implementação real ainda.

---

## 12. Avaliação de riqueza da fonte

`inspecao-end` é o core mais rico e maduro entre os três Field Ops agents:
- ~50 sub-arquivos
- 1 documento consolidado de referência
- 3 schemas de tipagem
- 6 templates
- 4 exemplos
- norm_profile.yaml próprio

**Conclusão:** inspection-agent tem a base mais sólida para review entre os três.

---

## 13. Próximos passos (Iteração 6.5)

1. Ler `INSPECAO_CORE_CONSOLIDADO.md` para mapeamento completo do core
2. Ler `norm_profile.yaml` para confirmar normas carregadas
3. Amostrar schemas e templates para confirmar cobertura
4. Definir cenários prioritários de QA (mecanismo de dano, seleção de END, laudo, NR-13)
5. Preencher AGENT.md com missão precisa, não-missão, limites, ciclo de vida, output contract
6. Propor QA-20260609-NNN para inspection-agent
