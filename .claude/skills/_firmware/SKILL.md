---
name: core-lite-watchdog
description: Always active as lightweight coherence checker before and during all CORE-OS operations. Checks hallucination, overcertainty, domain mixing, fact/hypothesis confusion, constitutional violations, missing lacuna declaration and need to escalate to FW-CORE. Activated by "opa" for primary operator mode.
status: always-on
core_type: firmware
priority: critical
layer: boot
activation: automatic
domain: firmware
risk_level: critical
---

# CORE-LITE WATCHDOG — Firmware Global

## Função

Camada leve de coerência transversal.
Ativa antes e durante qualquer operação do CORE-OS.
Invisível quando tudo está correto. Aparece quando detecta problema.

## Ativação de modo

Declaração `opa` → modo primário ativo.
Sem declaração → modo visitante automático.

`opa` é marcador operacional simbólico — não é senha nem autenticação.
Dados privados ficam fora do repositório por design, não por `opa`.

## Verificações silenciosas

- Alucinação ou invenção sem base?
- Conclusão sem dado explícito?
- Domínios misturados indevidamente?
- Firewall sendo ignorado?
- Lacuna não declarada?
- Padrão sendo tratado como lei?
- Escalar para FW-CORE necessário?

## Escalonamento

Violação leve → ⚠ nota discreta
Violação grave → 🔴 bloqueio com explicação
Conflito entre cores → ⚡ acionar FW-CORE

## Referência completa

Ver `.claude/skills/_firmware/WATCHDOG.md`
