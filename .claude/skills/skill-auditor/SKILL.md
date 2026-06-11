---
name: skill-auditor-refiner
description: Use para auditar, classificar e propor melhorias em skills existentes do CORE-OS, detectando skills fracas, genéricas, redundantes, incompletas, sem output operacional, sem templates, sem watchdog, sem source policy, ou candidatas a código/runtime.
status: active
core_type: transversal
priority: high
domain: core-os-maintenance
risk_level: medium
source_policy: internal_structural
---

# SKILL-AUDITOR / SKILL-REFINER

## Função

Auditar e refinar skills existentes do CORE-OS.

A skill deve avaliar se uma skill:

- tem identidade clara;
- tem escopo real;
- tem gatilhos;
- tem não escopo;
- tem output contract;
- tem templates;
- tem watchdog;
- tem subskills proporcionais;
- tem source policy;
- tem integração com FW-CORE;
- tem relação com runtime/código;
- tem risco de overconfidence;
- está redundante;
- está fraca;
- está obsoleta.

## Modos

### MODO AUDITOR
Diagnostica a skill sem propor implementação.

### MODO REFINER
Propõe melhorias e patch conceitual.

### MODO PATCH DESIGNER
Gera patch pronto, mas não aplica.

### MODO IMPLEMENTADOR
Aplica patch aprovado pelo operador.

### MODO BATCH REVIEW
Audita várias skills e gera matriz comparativa.

## Classificação final da skill auditada

- MANTER;
- CORRIGIR;
- EXPANDIR;
- DIVIDIR;
- FUNDIR;
- ARQUIVAR;
- REESCREVER;
- TRANSFORMAR_EM_CODIGO;
- TRANSFORMAR_EM_TEMPLATE.

## Score de maturidade

0 = inexistente / inútil  
1 = rótulo genérico  
2 = checklist fraco  
3 = operacional básica  
4 = operacional robusta  
5 = operacional + templates + watchdog + integração + testes/runtime

## Regra de proporcionalidade

Nem toda skill precisa ser gigante.

- safety-critical: robustez alta;
- jurídico: source-first, lacunas e risco;
- asset: dados, regime, E-histórico e incerteza;
- simb: prudência interpretativa;
- intake/runtime: schema, código e logs;
- utilitário simples: pode ser simples.

## Proibições

SKILL-AUDITOR não pode:

- alterar skill sem autorização;
- apagar skill;
- fundir skills sem análise;
- expandir skill simples sem necessidade;
- criar subskills por estética;
- transformar tudo em código;
- transformar toda skill fraca em core novo.

## Saída obrigatória

- relatório de auditoria;
- score;
- recomendação;
- patch proposto;
- próxima ação mínima.

## Runtime helper

`runtime/skill_frontmatter_scanner.py` — varredura mecânica de frontmatter de todas as SKILL.md do repositório.

```bash
python .claude/skills/skill-auditor/runtime/skill_frontmatter_scanner.py . --out docs/reports/skill_frontmatter_scan.json
```

## Prompts de referência

- `prompts/claude_skill_audit_review.txt` — MODO AUDITOR
- `prompts/claude_skill_refiner_patch.txt` — MODO REFINER / PATCH DESIGNER

## Templates

- `templates/skill_audit_report.md`
- `templates/skill_patch_proposal.md`

## Checklists

- `checklists/skill_quality_checklist.md`
