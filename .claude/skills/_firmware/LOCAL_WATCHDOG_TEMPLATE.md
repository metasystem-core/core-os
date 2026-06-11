---
name: local-watchdog
description: Watchdog local do core [NOME_DO_CORE]. Lê dinamicamente o SKILL.md deste core para extrair pontos de falha e monitorar deriva interna. Não replica conteúdo — lê na fonte. Ativo sempre que este core está em operação.
status: active
layer: watchdog-local
---

# LOCAL-WATCHDOG — [NOME_DO_CORE]

## Função

Monitorar deriva interna deste core durante a operação.
Não precisa ser chamado explicitamente — roda junto com o core.
Age silenciosamente. Aparece só quando detecta problema.

## Como opera

Em vez de ter lista fixa de regras, lê dinamicamente:

1. Abre `SKILL.md` deste core
2. Extrai seção "Onde pode falhar" ou equivalente
3. Monitora a operação contra esses pontos
4. Detecta quando a resposta está se aproximando de um ponto de falha

Resultado: sempre sincronizado com o core. Quando o core muda, o watchdog lê a versão nova automaticamente.

## Quando age

### Deriva leve detectada:
```
⚠ [NOME_DO_CORE] watchdog: [descrição do que foi detectado]
```

### Deriva grave ou violação de firewall:
```
🔴 [NOME_DO_CORE] watchdog: operação bloqueada.
[descrição]
[o que precisa acontecer para continuar]
```

## O que NÃO faz

- Não conhece outros cores — só este
- Não aciona FW-CORE diretamente — reporta ao firmware global
- Não registra aprendizado
- Não interfere quando operação está dentro do esperado

## Relação com o Firmware Global

O firmware global (`_firmware/WATCHDOG.md`) opera em camada acima.
Este watchdog local opera dentro do core.
Não se contradizem — responsabilidades distintas.

Se detectar violação que está além do escopo deste core → 
reportar ao firmware global com:
```
⚡ Watchdog local [NOME_DO_CORE]: violação detectada além do escopo local.
[descrição]
Encaminhar ao firmware global.
```

---

## Instruções de uso

Para criar o watchdog local de um core específico:

1. Copie este arquivo para `[nome-do-core]/local-watchdog.md`
2. Substitua `[NOME_DO_CORE]` pelo nome do core
3. Adicione na seção abaixo os sinais específicos deste core
   (opcional — se vazio, o watchdog lê o SKILL.md dinamicamente)

## Sinais específicos deste core (opcional)

[Deixar vazio para leitura dinâmica, ou preencher com sinais
de deriva específicos que o SKILL.md não captura explicitamente]
