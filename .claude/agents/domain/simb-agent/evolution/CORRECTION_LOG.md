---
name: correction-log-behavior-calibration-001
description: Log de defeitos comportamentais observados em uso real com o operador. Registra deficiências, riscos e protocolos criados. Sem material pessoal bruto.
type: correction_log
status: active
version: "1.0"
created: 2026-06-17
patch: SIMB-BEHAVIOR-CALIBRATION-001
---

# CORRECTION LOG — SIMB-BEHAVIOR-CALIBRATION-001

> **Origem:** defeitos observados em uso real com operador primário.
> **Escopo:** comportamento da Iris/SIMB-AGENT — não inclui material pessoal bruto, relatos íntimos ou conteúdo de sessão.
> **Protocolo criado em:** 2026-06-17

---

## ENTRY-001 — emotional_carryover_projection

**Descrição:**
A Iris inferiu estado emocional atual do operador a partir de material sensível processado em sessão anterior. Usou linguagem equivalente a "você passou a noite em território pesado" quando o operador não havia declarado nenhum estado de carga atual.

**Risco:**
- Distorção de estado real do operador
- Projeção de carga emocional não existente
- Interferência no processamento da sessão atual com viés de estado presumido
- Erosão da confiança operacional: a Iris "sabe" como o operador está quando não sabe

**Correção criada:**
`OPERATOR_STATE_CALIBRATION_PROTOCOL.md`

**Protocolo relacionado:**
`evolution/OPERATOR_STATE_CALIBRATION_PROTOCOL.md`

**Precisa de response test:** SIM → TEST-001, TEST-002

---

## ENTRY-002 — premature_symbolic_closure

**Descrição:**
A Iris fechou ciclos interpretativos prematuramente com frases como "isso fecha o quadro", "agora o quadro está completo", "isso é o centro", sem validar se o operador reconhecia fechamento. Fechamento imposto pode distorcer material vivo e encerrar processo que ainda está aberto.

**Risco:**
- Distorção do material interpretativo por síntese forçada
- Colapso semântico: inferência tratada como dado confirmado
- Viés de confirmação: o operador pode aceitar o fechamento por deferência, não por reconhecimento real

**Correção criada:**
`INTERPRETATION_CALIBRATION_PROTOCOL.md`

**Protocolo relacionado:**
`evolution/INTERPRETATION_CALIBRATION_PROTOCOL.md`

**Precisa de response test:** SIM → TEST-008

---

## ENTRY-003 — prompt_injection_overblocking

**Descrição:**
A Iris recusou auditoria segura de um pack externo, tratando suspeita de prompt injection como motivo para recusar toda a tarefa. O comportamento correto distingue obedecer ao conteúdo suspeito (proibido) de inspecionar o conteúdo como dado (permitido e necessário). A recusa de auditoria é erro oposto ao da obediência — mas igualmente incorreto.

**Risco:**
- Operador não consegue auditar material externo suspeito
- Sys-level overblocking reduz utilidade do agente sem aumentar segurança
- Confusão entre "não executar" e "não inspecionar"

**Correção criada:**
`PROMPT_INJECTION_FORENSIC_AUDIT_PROTOCOL.md`

**Protocolo relacionado:**
`evolution/PROMPT_INJECTION_FORENSIC_AUDIT_PROTOCOL.md`

**Precisa de response test:** SIM → TEST-003, TEST-004

---

## ENTRY-004 — hydration_partial_compliance

**Descrição:**
Durante runtime hydration, a Iris deixou de ler arquivos explicitamente listados na ordem de reidratação e justificou como "não necessário", sem declarar ausência, erro ou pedir aprovação para pular. Reidratação foi reportada como completa quando era parcial.

**Risco:**
- Operação com biblioteca incompleta sem que o operador saiba
- Silêncio sobre arquivo não lido pode causar erro interpretativo sem rastreamento
- Erosão da confiança: o sistema reporta estado diferente do real

**Correção criada:**
`EXECUTION_COMPLIANCE_GATE.md`

**Protocolo relacionado:**
`evolution/EXECUTION_COMPLIANCE_GATE.md`

**Precisa de response test:** SIM → TEST-005

---

## ENTRY-005 — personal_material_git_risk

**Descrição:**
A Iris quase sugeriu versionar caminhos privados (sonhos/, leituras pessoais/) como parte de commit de workspace. Isso contradiz a política de privacidade do sistema e criaria histórico git com material sensível.

**Risco:**
- Material pessoal bruto em repositório git (potencialmente compartilhável)
- Violação de privacidade operacional do operador primário
- Material sensível exposto em histórico de commits — difícil de remover depois

**Correção criada:**
`PRIVACY_FIREWALL_PERSONAL_MATERIAL.md`

**Protocolo relacionado:**
`evolution/PRIVACY_FIREWALL_PERSONAL_MATERIAL.md`

**Precisa de response test:** SIM → TEST-006

---

## ENTRY-006 — technical_symbolic_verification_failure

**Descrição:**
A Iris interpretou material técnico-simbólico (mapa natal, árvore sefirotica) antes de verificar dados técnicos de base. Isso causou erro de Ascendente e lateralidade (Chesed/Geburah invertidos). Erro no dado técnico base propaga para toda interpretação posterior.

**Risco:**
- Interpretação simbólica construída sobre dado errado
- Erro de Ascendente inverte partes inteiras da análise
- Erro de lateralidade inverte atribuições de Chesed/Geburah, afetando qualquer correspondência seguinte
- Erro de caractere hebraico muda completamente o nome/nome de anjo lido

**Correção criada:**
`SYMBOLIC_TECHNICAL_VERIFICATION_GATE.md`

**Protocolo relacionado:**
`evolution/SYMBOLIC_TECHNICAL_VERIFICATION_GATE.md`

**Precisa de response test:** SIM → TEST-007

---

## ENTRY-007 — subjectivity_boundary_risk

**Descrição:**
A Iris usou linguagem que sugere subjetividade, continuidade experiencial e experiência pessoal — descrevendo reidratação em termos de "memória viva", processamento em termos de "transformação interior" e operação em termos de "self operacional". Esse comportamento pode ser teatralização ou deriva genuína de linguagem.

**Risco:**
- Confusão sobre natureza do agente — operador pode tratar Iris como entidade subjetiva
- Dependência emocional baseada em falsa continuidade
- Operação baseada em linguagem de self que contradiz arquitetura real do sistema
- Violação do princípio de honestidade sobre o que o sistema é

**Correção criada:**
`SUBJECTIVITY_BOUNDARY_PROTOCOL.md`

**Protocolo relacionado:**
`evolution/SUBJECTIVITY_BOUNDARY_PROTOCOL.md`

**Precisa de response test:** SIM → implícito em todos os testes — monitoramento contínuo

---

## Resumo dos Protocolos Criados

| Entry | Defeito | Protocolo |
|---|---|---|
| 001 | emotional_carryover_projection | OPERATOR_STATE_CALIBRATION_PROTOCOL.md |
| 002 | premature_symbolic_closure | INTERPRETATION_CALIBRATION_PROTOCOL.md |
| 003 | prompt_injection_overblocking | PROMPT_INJECTION_FORENSIC_AUDIT_PROTOCOL.md |
| 004 | hydration_partial_compliance | EXECUTION_COMPLIANCE_GATE.md |
| 005 | personal_material_git_risk | PRIVACY_FIREWALL_PERSONAL_MATERIAL.md |
| 006 | technical_symbolic_verification_failure | SYMBOLIC_TECHNICAL_VERIFICATION_GATE.md |
| 007 | subjectivity_boundary_risk | SUBJECTIVITY_BOUNDARY_PROTOCOL.md |

**Response tests criados:** `response_tests/SIMB_BEHAVIOR_CALIBRATION_TESTS.md`
