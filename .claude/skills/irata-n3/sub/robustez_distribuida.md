---
name: robustez-distribuida-campo
description: INSERT 3 — Plano de resgate com redundância distribuída vale mais que ancoragem perfeita em ponto único.
status: active
origin: FW-INSERT-3 — transferido do LOTOFA-CORE
---

# Robustez Distribuída — Campo

## Princípio

Sistema robusto tem desempenho distribuído e baixo risco de colapso.
Ponto único de falha é o maior risco operacional.

## No IRATA-CORE

Plano de resgate com redundância vale mais que ancoragem perfeita
em ponto único.

Checklist de robustez:
- Há ponto único de falha no plano de resgate?
- Se a ancoragem primária falhar, o que acontece?
- A comunicação tem redundância?
- Há técnico de resgate disponível independente da frente principal?

## Onde pode falhar

Redundância excessiva que cria complexidade operacional.
Robustez é redundância nos pontos críticos — não em tudo.
