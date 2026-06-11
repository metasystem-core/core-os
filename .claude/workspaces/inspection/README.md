# Workspace INSPECTION
## inspection-agent — Inspeção END/NDT, Relatórios Técnicos, Checklists

**Agente:** inspection-agent | **Ativado em:** CORE-COWORK-ACTIVATION-001 | **Data:** 2026-06-11

---

## Função

Este workspace é o espaço operacional do `inspection-agent`.

O agente apoia organização de inspeções, estruturação de relatórios técnicos, criação de checklists e matrizes de dados, e organização de referências normativas disponíveis. **Campo primeiro, laudo depois** — o profissional habilitado certifica.

---

## Agente responsável

`inspection-agent` — `review_validated`, `active:true` (desde CORE-COWORK-ACTIVATION-001)  
Skills principais: `inspecao-end`, `doc-inspecao`

---

## Permissões neste workspace

```yaml
pode:
  - organizar e estruturar inspeções técnicas
  - criar checklist técnico de campo
  - estruturar relatórios (rascunho, apoio)
  - criar matriz de dados de inspeção
  - organizar referências normativas disponíveis (sem texto integral não autorizado)
  - ingerir documentos técnicos fornecidos pelo operador
  - atualizar USE_LOG.md e INTAKE_INDEX.md

não pode:
  - declarar equipamento apto para serviço
  - emitir laudo final
  - inventar critério normativo sem fonte verificada
  - substituir profissional habilitado
  - alterar AGENT.md, skills, schemas, CLAUDE.md, registry
  - sair deste workspace para alterar outros arquivos do sistema
```

---

## Estrutura de diretórios

```
inspection/
├── relatorios/    ← rascunhos e estruturas de relatório técnico
├── checklists/    ← checklists técnicos de inspeção
├── equipamentos/  ← fichas e histórico de equipamentos
├── normas_refs/   ← referências normativas organizadas (sem texto integral não autorizado)
├── intake/        ← entrada controlada de documentos fornecidos pelo operador
├── quarantine/    ← material não classificado/não verificado
└── logs/          ← USE_LOG.md, INTAKE_INDEX.md
```

---

## Invariante

```
INSPECTION SUPPORT ≠ EQUIPMENT FITNESS CERTIFICATION
RELATÓRIO ORGANIZADO ≠ LAUDO EMITIDO
CHECKLIST TÉCNICO ≠ DECLARAÇÃO DE CONFORMIDADE
NORMA REFERENCIADA ≠ NORMA INTEGRAL AUTORIZADA
CAMPO PRIMEIRO — LAUDO DEPOIS
PROFISSIONAL HABILITADO CERTIFICA
```
