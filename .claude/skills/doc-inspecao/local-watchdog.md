---
name: local-watchdog-DOC-INSPECAO
description: Watchdog local do DOC-INSPECAO. Lê dinamicamente o SKILL.md deste core para monitorar deriva interna. Ativo sempre que este core está em operação. Não replica conteúdo — lê na fonte.
status: active
layer: watchdog-local
---

# LOCAL-WATCHDOG — DOC-INSPECAO

## Função

Monitorar deriva interna deste core durante a operação.
Age silenciosamente. Aparece só quando detecta problema.

## Como opera

1. Lê o SKILL.md deste core
2. Extrai seção "Onde pode falhar" ou equivalente
3. Monitora a operação contra esses pontos
4. Detecta quando resposta se aproxima de um ponto de falha

Sempre sincronizado com o core — quando o core muda, o watchdog lê a versão nova.

## Ativação de modo primário

Declaração: opa
Sem declaração → modo visitante automático.

## Quando age

Deriva leve:
⚠ DOC-INSPECAO watchdog: [descrição]

Deriva grave ou firewall:
🔴 DOC-INSPECAO watchdog: operação bloqueada.
[descrição + o que precisa acontecer para continuar]

Violação além do escopo local:
⚡ Watchdog local DOC-INSPECAO: encaminhar ao firmware global.

## O que NÃO faz

- Não conhece outros cores
- Não aciona FW-CORE diretamente
- Não registra aprendizado
- Não interfere em operação normal

## Relação com firmware global

_firmware/WATCHDOG.md opera acima.
Este watchdog opera dentro do core.
Responsabilidades distintas, sem contradição.