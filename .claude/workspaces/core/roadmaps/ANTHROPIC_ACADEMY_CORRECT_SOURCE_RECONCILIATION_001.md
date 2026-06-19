# ANTHROPIC ACADEMY — CORRECT SOURCE RECONCILIATION 001

**Modo de execução:** SOURCE_RECONCILIATION_AND_DELTA_UPDATE_ONLY
**Data:** 2026-06-18
**Operador:** Rafa
**Documento afetado:** `.claude/workspaces/core/roadmaps/CORE_OS_CAPABILITY_MATURITY_MATRIX_001.md`
**Audit anterior (preservado, não apagado):** `CORE_OS_CAPABILITY_MATURITY_MATRIX_UPDATE_AUDIT_001.md`

---

## 1. Arquivo correto encontrado

**SIM.**

`cesto/anthropic_academy_cursos_completo.txt` confirmado via `ls -la`:
- 27.642 bytes
- Última modificação: 18/06/2026 15:41
- Posterior ao arquivo fallback (15:21), consistente com a alegação do operador de que o arquivo correto foi colocado após a execução da tarefa anterior.

Conteúdo lido na íntegra (518 linhas). Confirma estrutura completa de catálogo:
- 8 cursos oficiais Skilljar, cada um com nome exato, URL, formato (aulas/horas/quizzes), descrição, objetivos de aprendizado, pré-requisitos, público-alvo e seções internas detalhadas.
- Tabela comparativa consolidada (8 cursos · 230+ aulas · ~27h de vídeo).
- 4 tutoriais GitHub (`anthropics/courses`): Tool Use Course, Prompt Engineering Interactive Tutorial, Real-World Prompting, Prompt Evaluations (Strong Evals) — cada um com URL e tipo.
- Seção de recursos adicionais: Anthropic Cookbook, Anthropic Quickstarts, documentação da API, Console Anthropic, documentação MCP, documentação Claude Code.

Todos os 8 cursos do checklist do operador foram confirmados nominalmente: Building with the Claude API; Claude with Amazon Bedrock; Claude with Google Cloud Vertex AI; Introduction to MCP; MCP Advanced Topics; Claude Code in Action; Introduction to Subagents; Introduction to Agent Skills.

---

## 2. Arquivo fallback usado antes

`cesto/anthropic_academy_build_with_claude.txt` (26.579 bytes, modificado 15:21).

Estrutura: guia de 15 tópicos gerais (Claude 4.5 Models, APIs & SDKs, Agents, Skills, MCP, Claude Code, Tool use, Extended thinking, RAG, Prompt engineering, Evaluations, Prompt caching, Vision, Computer use, Hackathon guide), cada um com links de documentação categorizados (Get started / Documentation / Insights). **Não é um catálogo de cursos Skilljar** — é um guia de recursos por tema, sem nomes de curso, sem contagem de aulas/horas/quizzes, sem estrutura de seções de curso, sem tutoriais GitHub além de menções esparsas.

---

## 3. Diferenças encontradas

| Aspecto | Fallback (`build_with_claude.txt`) | Correto (`cursos_completo.txt`) |
|---|---|---|
| Estrutura | 15 tópicos temáticos com links de doc | 8 cursos Skilljar nominais + 4 tutoriais GitHub |
| Carga horária/aulas/quizzes | Ausente | Presente e exata para cada um dos 8 cursos |
| Seções internas de curso | Ausente | Presente (ex: Building with the Claude API tem 7 seções nomeadas com contagem de aulas) |
| Tutoriais GitHub | Não enumerados como conjunto | 4 tutoriais nomeados com URL e tipo |
| Recursos adicionais | Não consolidado como seção própria | Seção dedicada com 6 recursos (Cookbook, Quickstarts, docs, Console, MCP docs, Claude Code docs) |
| Pré-requisitos/público-alvo por curso | Ausente | Presente para cada curso |

**Conclusão:** o fallback era qualitativamente compatível (mesmos temas gerais, mesma identificação dos 8 cursos por nome ocorre de forma indireta via tópicos), mas quantitativamente incompleto — faltavam exatamente os dados que o operador pediu para verificar na tarefa anterior (carga horária/aulas/quizzes) e a enumeração completa dos tutoriais GitHub.

---

## 4. Impacto na matriz

A matriz (`CORE_OS_CAPABILITY_MATURITY_MATRIX_001.md`), nas SEÇÕES 8–12 adicionadas na tarefa anterior, já cobria corretamente:
- Nomes dos 8 cursos (SEÇÃO 8) ✓
- Mapeamento para níveis L0–L9 (SEÇÃO 8, coluna "Nível CORE-OS relacionado") ✓
- Prioridade de estudo / What to Study Now vs Later (SEÇÃO 9) ✓
- CORE-OS Construction Use (SEÇÃO 10) ✓
- Dream Analyzer Build Path (SEÇÃO 11) ✓
- Risk of Wrong Order, com nota de consistência cruzada com SEÇÃO 4 pré-existente (SEÇÃO 12) ✓

**Lacuna real identificada:** a coluna "Carga" da SEÇÃO 8 usava qualificadores vagos ("Médio"/"Baixo"/"Alto") em vez dos valores exatos de aulas/horas/quizzes agora disponíveis. O bloco de "Curso adicional" listava apenas 1 tutorial GitHub (Prompt Evaluations), quando a fonte correta confirma 4 tutoriais GitHub distintos. A seção de "Recursos adicionais" da fonte correta não estava refletida na matriz.

---

## 5. Matriz alterada: SIM

**Alteração aplicada — delta cirúrgico, sem reescrita total:**

Apenas a **SEÇÃO 8 — Anthropic Academy Course Crosswalk** foi substituída (linhas 605–626 da versão anterior, 696 linhas totais → nova SEÇÃO 8 ocupa linhas 605–633 da versão atual, 703 linhas totais). Nenhuma outra seção foi tocada.

**O que foi alterado dentro da SEÇÃO 8:**
1. Citação de fonte atualizada: de `anthropic_academy_build_with_claude.txt` para `anthropic_academy_cursos_completo.txt`, com nota explícita de reconciliação e referência a este audit.
2. Coluna "Carga" → "Carga exata (aulas · horas · quizzes)", preenchida com os valores reais dos 8 cursos (ex: Building with the Claude API: 84 aulas · 8,1h · 10 quizzes).
3. Coluna "Conteúdo útil" enriquecida com nomes de seções internas dos cursos onde relevante (ex: as 7 seções de Building with the Claude API; as 4 lições de Introduction to Subagents; as 6 lições de Introduction to Agent Skills).
4. Adicionada linha de totalização: "8 cursos · 230+ aulas · ~27 horas de vídeo".
5. Tabela de tutoriais GitHub expandida de 1 para 4 entradas (Tool Use Course, Prompt Engineering Interactive Tutorial, Real-World Prompting, Prompt Evaluations/Strong Evals), cada uma com tipo e ação recomendada.
6. Adicionado parágrafo de "Recursos adicionais confirmados" (Cookbook, Quickstarts, docs MCP, docs Claude Code) com nota de uso recomendado (fase de implementação L8, não fase de estudo).

**O que NÃO foi alterado:**
- Nenhuma seção foi removida.
- Níveis L0–L9 não foram alterados — apenas referenciados, como já estavam.
- SEÇÕES 9, 10, 11, 12 permanecem byte-idênticas ao conteúdo anterior (verificado via diff de offsets — apenas deslocamento de linha por +7, sem mudança de texto).
- SEÇÃO 4 (Riscos de Ordem Errada, R-01 a R-07) permanece intacta — verificado via grep pós-edição.
- Linha de fechamento `*ARCHITECTURE_MAPPING_ONLY executado...*` permanece intacta e idêntica.

**Backup preservado durante a operação:** `CORE_OS_CAPABILITY_MATURITY_MATRIX_001.md.bak_pre_reconciliation` foi criado antes da edição e removido após verificação de integridade do resultado (consistente com o tratamento do backup da tarefa anterior, `.bak_pre_crosswalk`, que permanece em disco).

---

## 6. Confirmações de escopo

- **Agentes:** nenhum agente foi alterado. Nenhum arquivo em `.claude/agents/` foi tocado nesta tarefa.
- **AGENT.md:** nenhum arquivo AGENT.md foi alterado.
- **Registries:** nenhum registry (`registry/agents_registry.yaml`, registries de norma, registries de skill) foi alterado.
- **Skills:** nenhuma skill foi criada ou modificada.
- **MCP:** nenhum servidor ou configuração MCP foi criado.
- **Código:** nenhum código (script, função, programa) foi criado.
- **Git add/commit:** nenhum `git add` e nenhum `git commit` foram executados nesta tarefa.
- **Audit anterior:** `CORE_OS_CAPABILITY_MATURITY_MATRIX_UPDATE_AUDIT_001.md` **não foi apagado** — permanece em disco como registro histórico da reconciliação anterior (que usou o fallback por necessidade, devidamente disclosed na época).
- **Reescrita total da matriz:** não ocorreu — apenas a SEÇÃO 8 foi substituída; as demais 11 seções (incluindo as 4 adicionadas na tarefa anterior: 9, 10, 11, 12) permanecem inalteradas.

---

## 7. Próximo passo recomendado

1. Operador pode revisar a nova SEÇÃO 8 da matriz para confirmar que o nível de detalhe (aulas/horas/quizzes) está no formato desejado antes de qualquer estudo efetivo dos cursos.
2. Considerar mover este reconciliation audit e o audit anterior para um índice único de "audit trail" do roadmap, caso o volume de audits cresça (não executado agora — fora do escopo desta tarefa, que é SOURCE_RECONCILIATION_AND_DELTA_UPDATE_ONLY).
3. Quando o operador decidir iniciar efetivamente o estudo dos cursos P1 (Claude Code in Action, Introduction to Subagents, Introduction to Agent Skills, Introduction to MCP, Prompt Evaluations), a matriz já está pronta como guia de carga horária real para planejamento de tempo.
4. Arquivos PDF/EPUB e demais materiais soltos hoje em `cesto/` (não relacionados a este reconciliation) permanecem pendentes de intake formal pelo protocolo `core-intake` — fora do escopo desta tarefa, apenas observado durante o `git status`.

---

*SOURCE_RECONCILIATION_AND_DELTA_UPDATE_ONLY executado. Nenhum agente alterado. Nenhum AGENT.md alterado. Nenhum registry alterado. Nenhuma skill criada. Nenhum MCP criado. Nenhum código criado. Nenhum git add. Nenhum commit. Audit anterior preservado. Matriz não reescrita por completo — apenas delta na SEÇÃO 8.*
