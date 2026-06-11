---
name: capability-gap-router
description: Use quando o CORE-OS encontra uma limitação, falta de skill, skill fraca, template ausente, runtime/code gap, fonte ausente, falha de roteamento ou lacuna de segurança. Classifica a lacuna e propõe solução estruturada sem auto-instalar.
status: active
core_type: transversal
priority: high
domain: core-os-evolution
risk_level: medium
source_policy: internal_structural
---

# CAPABILITY-GAP ROUTER / GAP-TO-SKILL PROTOCOL

## Função

Detectar e classificar lacunas de capacidade do CORE-OS durante o uso real.

## Quando ativar

Ativar quando:

- não houver skill para a demanda;
- skill existente for fraca;
- faltar template;
- faltar código;
- faltar fonte;
- faltar schema;
- faltar memória/cache;
- faltar regra de roteamento;
- houver risco de segurança;
- houver necessidade recorrente não coberta;
- o sistema estiver improvisando demais.

## Tipos de lacuna

- skill_gap;
- skill_weakness_gap;
- template_gap;
- runtime_code_gap;
- data_source_gap;
- routing_gap;
- safety_policy_gap;
- memory_gap;
- schema_gap;
- qa_gap.

## Soluções possíveis

- criar nova skill;
- adaptar skill existente;
- criar subskill;
- criar template;
- criar script/runtime;
- atualizar META-ROUTER;
- atualizar source policy;
- criar watchdog;
- registrar lacuna;
- bloquear resposta operacional;
- encaminhar para SKILL-AUDITOR;
- encaminhar para CORE-SELF-AUDIT.

## Regra de criação vs adaptação

Criar skill nova quando:

- domínio é novo;
- função é recorrente;
- risco é relevante;
- não existe skill parecida;
- há output próprio;
- há gatilhos claros.

Adaptar skill existente quando:

- a função é extensão natural;
- o domínio já existe;
- só faltam templates/subskills;
- a skill atual está fraca;
- há sobreposição forte.

Criar template quando:

- a lógica já existe;
- o problema é formato de saída repetitivo.

Criar código quando:

- a tarefa é mecânica;
- repetitiva;
- testável;
- offline;
- não exige interpretação profunda.

Não criar nada quando:

- é caso único;
- é ruído;
- é baixa recorrência;
- é impulso;
- é pergunta simples.

## Proibições

CAPABILITY-GAP ROUTER não pode:

- criar skill automaticamente;
- instalar patch automaticamente;
- improvisar capacidade crítica;
- fingir que skill existe;
- ocultar lacuna;
- bloquear sem explicar;
- expandir o sistema por capricho.

## Saída obrigatória

- Capability Gap Report;
- classificação da lacuna;
- gravidade;
- recorrência esperada;
- risco se improvisar;
- solução recomendada;
- próxima ação mínima.

## Prompts de referência

- `prompts/claude_gap_review.txt` — MODO REVISOR
- `prompts/claude_gap_to_skill_patch.txt` — MODO COARQUITETO CONTROLADO

## Templates

- `templates/capability_gap_report.md`
- `templates/gap_resolution_queue.md`
- `templates/gap_to_skill_proposal.md`

## Checklists

- `checklists/gap_classification_checklist.md`
- `checklists/create_vs_adapt_decision.md`
