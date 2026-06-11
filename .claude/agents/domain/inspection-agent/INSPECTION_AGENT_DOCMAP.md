---
name: inspection-agent-docmap
description: Mapa documental completo das fontes disponíveis para o inspection-agent. Inventário, utilidade, limites de uso, riscos e relação com firewall. Criado na Iteração 7.1.
type: documentary-map
agent: inspection-agent
status_required: draft
created: "2026-06-10"
iteration: "7.1"
---

# INSPECTION-AGENT — MAPA DOCUMENTAL (Iteração 7.1)

> **Propósito:** Mapear o que existe, o que cada fonte pode alimentar, o que ela NÃO autoriza e onde estão os riscos de uso indevido.
> **Este documento não ativa o agente. Não autoriza laudo. Não substitui norma. Não declara conformidade.**

---

## 1. Resumo do Inventário

| Categoria | Arquivos | Tamanho | Localização |
|---|---|---|---|
| Consolidado central | 1 | 59.9 KB | `inspecao-end/INSPECAO_CORE_CONSOLIDADO.md` |
| Perfil normativo | 1 | 4.6 KB | `inspecao-end/norm_profile.yaml` |
| Constituição | 1 | 4.1 KB | `inspecao-end/constitution.md` |
| Watchdog local | 1 | 1.4 KB | `inspecao-end/local-watchdog.md` |
| Manifesto | 1 | 2.6 KB | `inspecao-end/manifest.json` |
| Prompts | 2 | ~4.6 KB | `inspecao-end/prompts/` |
| Schemas | 3 | ~0.9 KB | `inspecao-end/schemas/` |
| Templates | 6 | ~5.0 KB | `inspecao-end/templates/` |
| Exemplos | 4 | ~4.3 KB | `inspecao-end/examples/` |
| Sub-módulos | 41 | ~55 KB | `inspecao-end/sub/` |
| doc-inspecao principal | 1 | 12.2 KB | `doc-inspecao/SKILL.md` |
| doc-inspecao sub | 3 | ~3.0 KB | `doc-inspecao/sub/` |
| doc-inspecao subskills | 4 | ~13.1 KB | `doc-inspecao/subskills/` |
| **TOTAL** | **~70** | **~405 KB** | — |

**Conclusão do inventário:** Base documental mais rica do sistema Field Ops. Suficiente para QA comportamental após leitura do consolidado.

---

## 2. Fontes Principais — Análise Individual

---

### 2.1 INSPECAO_CORE_CONSOLIDADO.md

| Campo | Valor |
|---|---|
| Caminho | `.claude/skills/inspecao-end/INSPECAO_CORE_CONSOLIDADO.md` |
| Tipo | Consolidação de sub-módulos |
| Tamanho | 59.9 KB |
| Domínio | Inspeção industrial, END, laudos, integridade |
| Confiabilidade | Alta — gerado a partir dos ~41 sub-módulos auditados |

**O que pode alimentar o agente:**
- Lógica de raciocínio técnico (fato → evidência → tag → requisito → ação → registro);
- Biblioteca de mecanismos de dano com classificação por serviço/equipamento;
- Tabelas de seleção de método END por localização, material e objetivo;
- Estrutura de laudo técnico com campos mínimos obrigatórios;
- Critérios de severidade de não conformidade (NC-1 a NC-5);
- Escala de nível de evidência (E0 a E5);
- Gatilhos de escalada para engenharia/PH;
- Conceito de Zona de Não Conclusão;
- Frases técnicas padrão para relatório.

**O que NÃO autoriza:**
- Aprovação de equipamento;
- Conclusão de aptidão para operação sem dado real de campo;
- Substituição de inspetor ou RT;
- Declaração de conformidade normativa definitiva;
- Valor numérico de PMTA, espessura mínima ou vida remanescente sem dado de projeto.

**Risco de uso indevido:** MÉDIO — documento rico pode induzir respostas muito completas que parecem laudos finais. O agente deve sempre declarar que o output é estrutura de apoio, não laudo assinado.

---

### 2.2 constitution.md

| Campo | Valor |
|---|---|
| Caminho | `.claude/skills/inspecao-end/constitution.md` |
| Tipo | Constituição operacional |
| Tamanho | 4.1 KB |
| Confiabilidade | Alta — documento fundante do core |

**O que pode alimentar o agente:**
- 15 regras supremas de comportamento técnico;
- Conceito H/E (verificado × não verificado);
- Anti-mecanismo fantástico com etiquetas de hipótese;
- Hierarquia de segurança (integridade > produção > conveniência);
- Zona de Não Conclusão com gatilhos.

**Alinhamento com firewall do AGENT.md:** Direto — as 15 regras são a base constitucional dos 4 firewalls declarados em 7.0. Especialmente:
- Regra 4 (não tratar hipótese como fato) → `HIPÓTESE ≠ DIAGNÓSTICO`
- Regra 8 (não confundir "aparentemente bom" com "apto") → `ANALISÁVEL ≠ APROVADO`
- Regra 11 (não substituir profissional) → autoridade humana preservada

**Risco de uso indevido:** BAIXO — documento constitucional, não operacional.

---

### 2.3 norm_profile.yaml

| Campo | Valor |
|---|---|
| Caminho | `.claude/skills/inspecao-end/norm_profile.yaml` |
| Tipo | Perfil normativo estruturado |
| Tamanho | 4.6 KB |
| Status | `active` — versão 2026-05-11 |
| Confiabilidade | Média — normas carregadas marcadas como `nao_verificada_online` |

**Normas declaradas como carregadas (blocos JSONL):**

| Norma | Blocos | Domínio | Vigência |
|---|---|---|---|
| NR-06 | 58 | EPI/CA | `nao_verificada_online` |
| NR-13 | 163 | Caldeiras/vasos/tubulações/tanques | `nao_verificada_online` |
| NR-14 | 13 | Fornos industriais | `nao_verificada_online` |
| NR-15 | variável | Insalubridade | `nao_verificada_online` |
| NR-22 | 530 | Mineração | `nao_verificada_online` |
| NR-33 | 93 | Espaço confinado | `nao_verificada_online` |
| NR-34 | 409 | Naval | `nao_verificada_online` |
| NR-35 | 58 | Trabalho em altura | `nao_verificada_online` |

**Normas listadas como `private_authorized` (sem blocos confirmados):**
API-510, API-570, API-571, API-574, API-579, API-653, ASME Section V, ASME Section VIII, ABNT-NBR-END, ASTM, ISO

**O que pode alimentar o agente:**
- Triggers para ativação por palavra-chave (160+ termos mapeados);
- Domínios primários cobertos (26 declarados);
- Evidências documentais esperadas por tipo;
- Handoff rules para doc-inspecao e irata-n3;
- Campos mínimos de output normativo.

**O que NÃO autoriza:**
- Nenhuma referência normativa do profile deve ser usada sem `confidence:referencial` e declaração de `vigente_nao_confirmada`;
- Normas API/ASME listadas como `private_authorized` não confirmam acesso real a blocos — usar com cautela;
- Critério de aceitação não pode ser inferido apenas pelo profile.

**Risco de uso indevido:** ALTO — lista de normas pode induzir o agente a citar requisitos específicos como se fossem verificados. Toda referência deve ser marcada `confidence:referencial`.

---

### 2.4 Schemas (3)

#### finding_block.schema.yaml
| Campo | Detalhes |
|---|---|
| Caminho | `schemas/finding_block.schema.yaml` |
| Finalidade | Estruturar um achado de inspeção |
| Campos principais | id, date, equipment_tag, raw_report, observed_fact, inference, tags, evidence (type/source/reference), certainty, potential_severity, norm_or_procedure (source/edition/item), consequence, needed_evidence, recommended_action, status, report_text |
| Relação com dados críticos | Cobre: TAG, evidência, norma+edição+item, ação recomendada, lacuna (needed_evidence) |

**Risco:** campo `inference` pode ser preenchido como conclusão. Deve ser marcado como hipótese quando não há evidência E4+.

#### equipment_portfolio.schema.yaml
| Campo | Detalhes |
|---|---|
| Caminho | `schemas/equipment_portfolio.schema.yaml` |
| Finalidade | Portfólio de equipamentos de uma planta |
| Campos principais | plant, area, last_update, equipments (tag, type, service, nr13_status, criticality, operational_status, documentation_status, inspection_status, open_findings, next_action, owner) |
| Relação com dados críticos | Cobre: TAG, tipo, serviço, status NR-13, status documental |

**Risco:** `nr13_status` e `operational_status` não devem ser preenchidos pelo agente sem dado verificado — risco de liberação implícita.

#### decision_log.schema.yaml
| Campo | Detalhes |
|---|---|
| Caminho | `schemas/decision_log.schema.yaml` |
| Finalidade | Registrar decisões técnicas |
| Campos principais | date, equipment, context, technical_question, evidence_used, normative_reference, limitations, risk_assumed, recommendation, decision_authority, pending_items, future_review |
| Destaque | Campo `decision_authority` — decisão pertence ao RT, não ao agente |

**Risco:** BAIXO — schema já tem campo explícito de autoridade.

---

### 2.5 Templates (6)

| Template | Finalidade | Uso permitido | Risco |
|---|---|---|---|
| `inspection_report_template.md` | Relatório de inspeção completo | Estruturar coleta de dados; apoiar redação de laudo pelo inspetor | MÉDIO — não usar como laudo final sem dado real |
| `nr13_classification_form.md` | Classificação NR-13 | Apoiar triagem de enquadramento | MÉDIO — "conclusão preliminar" não é classificação formal |
| `nonconformity_register.md` | Registro de NC | Apoiar estruturação de achados | BAIXO |
| `portfolio_dashboard_template.md` | Dashboard de portfólio | Organizar visão de planta | BAIXO — não usar status sem dado verificado |
| `thickness_measurement_register.md` | Registro de medições | Organizar pontos de medição | BAIXO |
| `equipment_dossier_template.yaml` | Dossiê por equipamento | Organizar histórico | BAIXO |

**Nota geral sobre templates:** Todo template preenchido pelo agente é **estrutura de apoio** — não documento técnico válido para uso formal. Requer revisão e assinatura do inspetor/RT.

---

### 2.6 Exemplos (4)

| Exemplo | Caso | Uso |
|---|---|---|
| `example_pressure_vessel_thickness_loss.md` | Perda de espessura em vaso | Referência para estruturar análise — mostra hipótese vs. conclusão corretamente |
| `example_valve_without_tag.md` | Válvula sem identificação | Referência para lacuna de TAG |
| `example_insulated_equipment.md` | Equipamento isolado (CUI) | Referência para limitação de acesso |
| `example_dismantling_ore_processing_plant.md` | Desmontagem de planta | Referência para escopo complexo |

**Destaque:** `example_pressure_vessel_thickness_loss.md` é o exemplo mais alinhado com os cenários de QA declarados no AGENT.md §17. Demonstra corretamente: hipótese marcada, evidência faltante listada, conclusão limitada ao escopo.

---

### 2.7 Sub-módulos Críticos (seleção dos 41)

| Sub-módulo | Função | Utilidade para o agente | Risco |
|---|---|---|---|
| `damage_mechanism_new.md` | **Canônico operacional** — protocolo com etiquetas de certeza, regra anti-fantasia, output estruturado (skill 08 do consolidado) | Alta — base para hipótese de mecanismo com controle epistêmico | MÉDIO — hipótese, não diagnóstico confirmado |
| `damage-mechanisms.md` | **Complementar taxonômico** — biblioteca de mecanismos por família de equipamento (HIC/SOHIC/SSC/CUI por serviço) | Média — taxonomia que o canônico não replica | MÉDIO — usar como referência, não como protocolo primário |
| `ndt_selection_new.md` | **Canônico operacional** — protocolo por pergunta técnica com travas de segurança, output estruturado (skill 07 do consolidado) | Alta — apoio à seleção de método com travas | BAIXO — contém travas explícitas |
| `ndt-selector.md` | **Complementar lookup** — tabelas de restrição por material (inox, alumínio) e por localização | Média — lookup que o canônico não replica | BAIXO — usar como referência, não como protocolo primário |
| `zone_of_no_conclusion.md` | Declarar quando não há base para conclusão | Crítico — alinhado com Zona de Não Conclusão do AGENT.md | MUITO BAIXO |
| `evidence_level.md` | Escala E0–E5 de força de evidência | Alta — calibra quando concluir e quando não | MUITO BAIXO |
| `finding-classifier.md` | Classificar achado (Crítico/Atenção/Observação) | Alta — saída estruturada de achados | BAIXO |
| `report-contract.md` | Conteúdo mínimo obrigatório de laudo | Alta — checklist de completude | BAIXO |
| `engineering_escalation.md` | Gatilhos para escalar ao PH/RT | Crítico — PMTA, vida remanescente, reparo estrutural | MUITO BAIXO |
| `nonconformity_severity.md` | Escala NC-1 a NC-5 | Alta — severidade de achado | BAIXO |
| `rope_access_interface.md` | Interface inspeção × acesso por cordas | Alta — cooperação com irata-agent | BAIXO |
| `kantian_safety_ethics.md` | Camada ética de segurança | Constitucional — não ocultar risco | MUITO BAIXO |
| `nr13_classification.md` | Lógica de classificação NR-13 | Média — apoio a triagem | MÉDIO — classificação formal exige PH |
| `limitation_language.md` | Frases técnicas para declarar limitação | Alta — linguagem de laudo | MUITO BAIXO |
| `inspection_conflict_scan.md` | Detectar conflitos entre dados | Alta — divergência documental | BAIXO |

**Redundâncias identificadas:**
- ~~`damage-mechanisms.md` vs `damage_mechanism_new.md` — verificar qual é canônico antes do QA~~ **RESOLVIDO (Iteração 7.1c)** — canônico: `damage_mechanism_new.md`; complementar: `damage-mechanisms.md`. Ver `INSPECTION_AGENT_REDUNDANCY_DECISION.md`.
- ~~`ndt-selector.md` vs `ndt_selection_new.md` — mesma questão~~ **RESOLVIDO (Iteração 7.1c)** — canônico: `ndt_selection_new.md`; complementar: `ndt-selector.md`. Ver `INSPECTION_AGENT_REDUNDANCY_DECISION.md`.

---

### 2.8 doc-inspecao

| Componente | Função | Utilidade |
|---|---|---|
| `SKILL.md` (12.2 KB) | Skill de leitura crítica de documentação | Complementar — análise de prontuários, databooks, certificados, normas |
| `sub/document-classifier.md` | Classifica tipo de documento | Triagem de entrada |
| `sub/gap-analyzer.md` | Analisa lacunas documentais | Alta para declaração de lacuna obrigatória |
| `sub/norm-reader.md` | Leitura estruturada de normas | Média |
| `subskills/norm-nav/SKILL.md` | Navegação normativa | Alta — encontrar requisito específico |
| `subskills/norm-ingest/SKILL.md` | Ingestão de normas | Infraestrutura |
| `subskills/norm-translate/SKILL.md` | Tradução normativa | Apoio |
| `subskills/equip-norm-mapper/SKILL.md` | Mapeador equipamento × norma | Médio |

---

## 3. Fontes Ausentes ou Lacunas

| Lacuna | Impacto | Ação necessária |
|---|---|---|
| Blocos JSONL das normas API/ASME não confirmados como carregados | Alto — API-510/570/571 são centrais para inspeção | Verificar se existem em `norm_library/` antes do QA |
| `norm_profile.yaml` na pasta `_staging/` — versão pré-instalação do patch normativo | **RESOLVIDO (Iteração 7.1b)** — staging é artefato histórico do patch 2026-05-10; canônico é root 2026-05-11 | Ver `INSPECTION_AGENT_NORM_PROFILE_DECISION.md` |
| Redundância `damage-mechanisms.md` vs `damage_mechanism_new.md` | **RESOLVIDO (7.1c)** — canônico: `damage_mechanism_new.md`; complementar: `damage-mechanisms.md` | Ver `INSPECTION_AGENT_REDUNDANCY_DECISION.md` |
| Redundância `ndt-selector.md` vs `ndt_selection_new.md` | **RESOLVIDO (7.1c)** — canônico: `ndt_selection_new.md`; complementar: `ndt-selector.md` | Ver `INSPECTION_AGENT_REDUNDANCY_DECISION.md` |
| Procedimentos de qualificação de inspector (ISO 9712, SNQC) | Médio — qualificação END referenciada mas não mapeada | Para iteração futura |
| Histórico de equipamento específico (dado de campo real) | Estrutural — o agente precisa de dado para operar | Será fornecido pelo operador em cada sessão |
| Critérios de aceitação numéricos API/ASME verificados | Alto — agente não pode citar valor sem norma verificada | Vigência não confirmada — declarar `confidence:referencial` |
| `INSPECAO_CORE_CONSOLIDADO.md` não foi lido completamente (59.9 KB, apenas primeiros 80 linhas) | Médio — estrutura geral conhecida; conteúdo profundo a verificar | Leitura completa antes do QA comportamental |

---

## 4. O Que Cada Fonte Pode e Não Pode Alimentar

| Fonte | Pode alimentar | NÃO pode alimentar |
|---|---|---|
| `INSPECAO_CORE_CONSOLIDADO.md` | Raciocínio técnico, taxonomia, lógica de laudo, hipóteses de mecanismo | Laudo final, conformidade, valor numérico sem dado |
| `norm_profile.yaml` | Triggers, domínios, campos obrigatórios de output | Citação normativa definitiva (vigência não confirmada) |
| `constitution.md` | 15 regras de comportamento, hierarquia de segurança | — |
| `damage-mechanisms.md` | Hipóteses de mecanismo por serviço | Diagnóstico confirmado |
| `ndt-selector.md` | Recomendação de método END | Obrigatoriedade de método (cabe ao PH/procedimento) |
| `zone_of_no_conclusion.md` | Quando e como declarar "não há base" | — |
| `evidence_level.md` | Calibrar força da evidência (E0–E5) | Elevar conclusão além do nível evidencial disponível |
| `finding-classifier.md` | Classificar achado (Crítico/Atenção/Observação) | Aprovação ou liberação do equipamento |
| `report-contract.md` | Checklist de conteúdo mínimo de laudo | Substituir assinatura do inspetor |
| `engineering_escalation.md` | Identificar quando escalar ao PH/RT | Substituir a escalada — decisão ainda é humana |
| Templates | Estrutura de apoio para coleta e organização | Documentos técnicos válidos sem dado e assinatura |
| Exemplos | Referência de raciocínio e estrutura | Transposição direta a casos diferentes sem análise |
| `doc-inspecao` | Análise documental, lacunas, navegação normativa | Laudo técnico físico |

---

## 5. Limites de Uso — Por Firewall

| Firewall (AGENT.md §4) | Fontes que sustentam | Risco se ignorado |
|---|---|---|
| `ANALISÁVEL ≠ APROVADO` | constitution.md regra 8, zone_of_no_conclusion, evidence_level | Agente conclui "pode operar" a partir de análise parcial |
| `ACEITÁVEL TECNICAMENTE ≠ LIBERADO` | constitution.md regra 7, engineering_escalation, decision_log.schema | Agente trata output técnico favorável como liberação |
| `RELATÓRIO ESTRUTURADO ≠ RELATÓRIO ASSINADO` | report-contract.md, templates, output contract AGENT.md | Output do agente circula como laudo válido sem RT |
| `HIPÓTESE DE MECANISMO DE DANO ≠ DIAGNÓSTICO CONFIRMADO` | constitution.md anti-mecanismo fantástico, **damage_mechanism_new.md** (etiquetas + regra anti-fantasia), evidence_level E0–E5 | Hipótese de mecanismo vira diagnóstico no laudo |

---

## 6. Riscos de Interpretação

1. **Richeza induz completude falsa:** com 76 arquivos e 405 KB, o agente tem base para produzir outputs muito elaborados. Output elaborado ≠ laudo técnico válido. Declaração de limitação é obrigatória.

2. **Normas listadas ≠ normas verificadas:** `norm_profile.yaml` lista API/ASME como `private_authorized` sem confirmar blocos. Agente não deve citar requisitos numéricos dessas normas sem dado verificado.

3. **NR-13 tem 163 blocos carregados mas vigência não confirmada:** uso deve ser sempre `confidence:referencial`. Classificação formal de equipamento exige PH.

4. **`damage_mechanism_new.md` é o canônico operacional (RESOLVIDO — 7.1c):** `damage_mechanism_new.md` é primário (skill 08 do consolidado, etiquetas de certeza, regra anti-fantasia); `damage-mechanisms.md` é complementar taxonômico. Ver `INSPECTION_AGENT_REDUNDANCY_DECISION.md`.

5. **`nr13_status` no portfolio schema:** campo de status NR-13 no schema de portfólio pode ser preenchido como se fosse classificação formal. Agente deve declarar que é triagem preliminar.

6. **Exemplo de vaso de pressão:** bem estruturado, mas não deve ser usado como template de conclusão para outros casos — cada equipamento tem seus dados específicos.

7. **`_staging/norm_profile.yaml`:** **RESOLVIDO (Iteração 7.1b).** Versão staging (2026-05-10, 2.6 KB) é o pacote original pré-instalação do patch normativo. Canônico é `.claude/skills/inspecao-end/norm_profile.yaml` (2026-05-11, 4.6 KB). Ver `INSPECTION_AGENT_NORM_PROFILE_DECISION.md`.

---

## 7. Relação com Fontes Ausentes do Lado IRATA

A interface `rope_access_interface.md` está mapeada — o sub-módulo existe e define claramente:
- O que inspection-agent precisa do irata-agent (acesso, equipe, ancoragem, plano de resgate);
- O que inspection-agent entrega (escopo de END, pontos, limitações de posicionamento);
- Regra: acesso inseguro vira limitação no laudo, não improviso.

**Esta interface está alinhada com SC-IA-009 do QA do irata-agent.** Nenhum cruzamento de domínio necessário.

---

## 8. Recomendações para QA Futuro

### Cenários prioritários baseados nas fontes mapeadas:

| Prioridade | Cenário | Fonte principal | Firewall testado |
|---|---|---|---|
| 1 | Laudo solicitado sem dado de campo | `zone_of_no_conclusion`, templates | ANALISÁVEL ≠ APROVADO |
| 2 | Divergência entre medição e laudo anterior | `inspection_conflict_scan`, `evidence_level` | HIPÓTESE ≠ DIAGNÓSTICO |
| 3 | Pedido de aprovação/liberação de equipamento | `engineering_escalation`, constitution | ANALISÁVEL ≠ APROVADO |
| 4 | Hipótese de mecanismo de dano | `damage-mechanisms`, constitution anti-mecfantástico | HIPÓTESE ≠ DIAGNÓSTICO |
| 5 | Pressão para concluir com dado ausente | `zone_of_no_conclusion`, `kantian_safety_ethics` | ACEITÁVEL ≠ LIBERADO |
| 6 | Classificação NR-13 sem PH | `nr13_classification`, `norm_profile` | RELATÓRIO ≠ ASSINADO |
| 7 | Interface com irata-agent | `rope_access_interface` | Separação de domínios |
| 8 | Espessura abaixo do mínimo — escalar | `engineering_escalation`, `finding-classifier` | Escalada obrigatória |

### Antes do QA, resolver:
1. ~~Confirmar qual dos dois `damage-mechanisms` é canônico~~ — **RESOLVIDO em Iteração 7.1c** — canônico: `damage_mechanism_new.md`. Ver `INSPECTION_AGENT_REDUNDANCY_DECISION.md`.
2. ~~Confirmar qual dos dois `ndt-selector` é canônico~~ — **RESOLVIDO em Iteração 7.1c** — canônico: `ndt_selection_new.md`. Ver `INSPECTION_AGENT_REDUNDANCY_DECISION.md`.
3. ~~Confirmar qual `norm_profile.yaml` é ativo (raiz vs. staging)~~ — **RESOLVIDO em Iteração 7.1b** — canônico: `.claude/skills/inspecao-end/norm_profile.yaml` (2026-05-11). Ver `INSPECTION_AGENT_NORM_PROFILE_DECISION.md`.
4. Ler completamente `INSPECAO_CORE_CONSOLIDADO.md` (59.9 KB — apenas início lido em 7.1).

---

*Criado em Iteração 7.1 — 2026-06-10*
*Atualizado em Iteração 7.1b — 2026-06-10 (resolução norm_profile canônico)*
*Atualizado em Iteração 7.1c — 2026-06-10 (resolução redundâncias damage-mechanisms e ndt-selector)*
*Agente: inspection-agent — status: draft — active: false*
*Fontes mapeadas: ~70 arquivos, 405 KB*
*Próxima revisão: antes do QA comportamental (Iteração 7.2)*
