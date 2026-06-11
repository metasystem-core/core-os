# IRATA-AGENT — Source Recon

**Arquivo:** source recon — iteração 6.0
**Criado em:** 2026-06-09
**Criado por:** operador-primario
**Status:** recon completo — não implementado

---

## 1. Objetivo

Mapear as fontes de capacidade disponíveis para irata-agent antes da elaboração do AGENT.md para review.

---

## 2. Core Parent

**`irata-n3`** — Assistente operacional-documental para Supervisor IRATA N3

Função central: apoiar planejamento, revisão, geração documental, auditoria e tomada de decisão operacional estruturada em atividades de acesso por cordas.

**Risco:** `critical` — domínio de vida.

Regra central declarada na skill:
> "Nenhuma atividade de acesso por cordas deve ser tratada como liberada apenas por memória, costume, verbalização, experiência pessoal ou decisão informal."

---

## 3. Modos de operação disponíveis

| Modo | Uso |
|---|---|
| MODO CAMPO | Resposta curta, prática, orientada à decisão: bloqueios, checklist, próxima ação |
| MODO DOCUMENTO | Gerar documento formal completo: plano de resgate, ancoragem, procedimento, relatório |
| MODO AUDITORIA | Identificar lacunas, inconsistências, documentos ausentes, risco de liberação indevida |
| MODO RESGATE | Construir/revisar plano de resgate por cenário |
| MODO ANCORAGEM | Construir/revisar plano de ancoragem |
| MODO PROCEDIMENTO | Construir procedimento de acesso por cordas passo a passo |
| MODO CLIENTE | Adaptar linguagem para comunicação formal com cliente/SMS/HSE |

---

## 4. Sub-skills disponíveis

| Sub-skill | Localização | Função |
|---|---|---|
| `rescue_plan_builder` | `irata-n3/sub/` | Construir/revisar plano de resgate |
| `anchorage_plan_builder` | `irata-n3/sub/` | Construir/revisar plano de ancoragem |
| `apr_pt_af_interface` | `irata-n3/sub/` | Verificar coerência APR/PT/AF com atividade |
| `equipment_traceability` | `irata-n3/sub/` | Rastreabilidade de equipamentos |
| `team_competency_matrix` | `irata-n3/sub/` | Matriz equipe/certificação/função |
| `stop_work_authority` | `irata-n3/sub/` | Critérios de paralisação/escalonamento |
| `work_front_release_gate` | `irata-n3/sub/` | Estado de liberação da frente |
| `rope_access_method_statement` | `irata-n3/sub/` | Procedimento/método executivo |
| `field_supervision_log` | `irata-n3/sub/` | Relatório diário de supervisão |
| `document_package_builder` | `irata-n3/sub/` | Montar pacote documental |
| `client_document_adapter` | `irata-n3/sub/` | Adaptar para cliente/SMS/HSE |
| `normative_reference_router` | `irata-n3/sub/` | Identificar fontes normativas aplicáveis |

**12 sub-skills declaradas.** Cobertura operacional completa.

---

## 5. Templates disponíveis

| Template | Arquivo |
|---|---|
| Plano de resgate | `irata-n3/templates/plano_resgate_template.md` |
| Plano de ancoragem | `irata-n3/templates/plano_ancoragem_template.md` |
| Procedimento de acesso | `irata-n3/templates/procedimento_acesso_template.md` |
| Checklist de liberação de frente | `irata-n3/templates/checklist_liberacao_frente.md` |
| Matriz de equipe/certificação | `irata-n3/templates/matriz_equipe_certificacao_template.md` |
| Matriz de equipamentos | `irata-n3/templates/matriz_equipamentos_template.csv` |
| Matriz de lacunas/bloqueios | `irata-n3/templates/matriz_lacunas_bloqueios_template.md` |
| Relatório diário de supervisão | `irata-n3/templates/relatorio_supervisao_diaria_template.md` |
| Pacote documental cliente | `irata-n3/templates/pacote_documental_cliente_template.md` |

**9 templates disponíveis.** Cobertura documental operacional completa.

---

## 6. Checklists disponíveis

| Checklist | Arquivo |
|---|---|
| Checklist rápido de campo | `irata-n3/checklists/field_quick_checklist.md` |
| Revisão documental | `irata-n3/checklists/irata_n3_document_review_checklist.md` |

---

## 7. Hierarquia de referência normativa

Declarada na skill — em ordem de prioridade:

1. Legislação e NRs vigentes
2. Normas técnicas aplicáveis
3. IRATA ICOP, TACS e documentos IRATA aplicáveis
4. Procedimentos internos do cliente
5. Procedimentos internos da empresa executante
6. APR/PT/AF da atividade
7. Plano específico da frente de serviço
8. Manual/documentação dos equipamentos e recomendações do fabricante

**Regra de conflito:** aplicar critério mais restritivo ou registrar conflito e escalar para decisão formal.

---

## 8. Estados de decisão

A skill classifica toda situação como:

- `LIBERÁVEL`
- `LIBERÁVEL COM RESTRIÇÃO`
- `NÃO LIBERÁVEL`
- `ESCALAR`

---

## 9. Bloqueios críticos declarados

A skill lista 16 condições de bloqueio/escalonamento obrigatório, incluindo:

- plano de resgate inexistente, genérico ou incompatível
- ponto de ancoragem sem critério de validação
- equipamento fora de inspeção, danificado, vencido, sem identificação
- equipe sem certificação/função compatível
- APR/PT/AF ausente ou incompatível
- mudança de cenário sem revisão do plano
- ausência de responsável por resgate ou incapacidade de executar resgate

---

## 10. Contrato de resposta mínimo da skill

Toda resposta operacional deve conter:

1. Escopo da demanda
2. Base documental/normativa considerada
3. Lacunas de informação
4. Riscos críticos
5. Estado de liberação
6. Ações necessárias
7. Onde o modelo pode falhar

---

## 11. Lacunas identificadas

| Lacuna | Tipo | Impacto |
|---|---|---|
| `local-watchdog.md` com encoding corrompido (UTF-8/Latin-1) | técnico | Baixo — não afeta operação se não lido diretamente |
| `norm_profile.yaml` não lido nesta sessão — verificar normas carregadas para IRATA | informação | A verificar em iteração 6.3 |
| NR-35 (trabalho em altura) carregada na base do doc-inspecao — verificar se há blocos específicos para irata-n3 | sobreposição | Baixa — complementar |
| IRATA ICOP e TACS declarados na hierarquia — não localizados em norm_library | lacuna de base | Alta — documentos fundamentais do IRATA |

---

## 12. Compatibilidade com AGENT.md skeleton

O AGENT.md skeleton do irata-agent declara:
- `skills_used: [irata-n3]`
- `can_call: [doc-agent, rag-agent, norm-agent]`
- `can_be_called_by: [operator, meta-router, fw-governor]`

**Avaliação:**
- `irata-n3` é a base completa. 12 sub-skills + 9 templates + 2 checklists = cobertura operacional suficiente para draft → review.
- `norm-agent` como chamável é correto — normative_reference_router na sub-skill já aponta para essa integração.
- `doc-agent` para geração de pacotes documentais. Correto.
- `rag-agent` para consulta de normas. Draft — sem implementação real ainda.
- Não é chamado por `inspection-agent` no registry — mas pode haver necessidade de cooperação em campo (inspeção + trabalho em altura). Registrar como possível expansão futura.

---

## 13. Próximos passos (Iteração 6.3)

1. Ler `norm_profile.yaml` para confirmar normas IRATA carregadas
2. Confirmar status dos documentos IRATA ICOP e TACS
3. Definir cenários prioritários de QA para irata-agent (APR, plano de resgate, estado de liberação, bloqueio crítico)
4. Preencher AGENT.md com missão precisa, não-missão, limites, ciclo de vida, output contract
5. Propor QA-20260609-NNN para irata-agent
