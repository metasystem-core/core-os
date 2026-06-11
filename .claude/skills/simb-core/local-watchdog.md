---
name: local-watchdog
description: Watchdog local do core SIMB-CORE. LÃª dinamicamente o SKILL.md deste core para extrair pontos de falha e monitorar deriva interna. NÃ£o replica conteÃºdo â€” lÃª na fonte. Ativo sempre que este core estÃ¡ em operaÃ§Ã£o.
status: active
layer: watchdog-local
---

# LOCAL-WATCHDOG â€” SIMB-CORE

## FunÃ§Ã£o

Monitorar deriva interna deste core durante a operaÃ§Ã£o.
NÃ£o precisa ser chamado explicitamente â€” roda junto com o core.
Age silenciosamente. Aparece sÃ³ quando detecta problema.

## Como opera

Em vez de ter lista fixa de regras, lÃª dinamicamente:

1. Abre `SKILL.md` deste core
2. Extrai seÃ§Ã£o "Onde pode falhar" ou equivalente
3. Monitora a operaÃ§Ã£o contra esses pontos
4. Detecta quando a resposta estÃ¡ se aproximando de um ponto de falha

Resultado: sempre sincronizado com o core. Quando o core muda, o watchdog lÃª a versÃ£o nova automaticamente.

## Quando age

### Deriva leve detectada:
```
âš  SIMB-CORE watchdog: [descriÃ§Ã£o do que foi detectado]
```

### Deriva grave ou violaÃ§Ã£o de firewall:
```
ðŸ”´ SIMB-CORE watchdog: operaÃ§Ã£o bloqueada.
[descriÃ§Ã£o]
[o que precisa acontecer para continuar]
```

## O que NÃƒO faz

- NÃ£o conhece outros cores â€” sÃ³ este
- NÃ£o aciona FW-CORE diretamente â€” reporta ao firmware global
- NÃ£o registra aprendizado
- NÃ£o interfere quando operaÃ§Ã£o estÃ¡ dentro do esperado

## RelaÃ§Ã£o com o Firmware Global

O firmware global (`_firmware/WATCHDOG.md`) opera em camada acima.
Este watchdog local opera dentro do core.
NÃ£o se contradizem â€” responsabilidades distintas.

Se detectar violaÃ§Ã£o que estÃ¡ alÃ©m do escopo deste core â†’ 
reportar ao firmware global com:
```
âš¡ Watchdog local SIMB-CORE: violaÃ§Ã£o detectada alÃ©m do escopo local.
[descriÃ§Ã£o]
Encaminhar ao firmware global.
```

---

## InstruÃ§Ãµes de uso

Para criar o watchdog local de um core especÃ­fico:

1. Copie este arquivo para `[nome-do-core]/local-watchdog.md`
2. Substitua `SIMB-CORE` pelo nome do core
3. Adicione na seÃ§Ã£o abaixo os sinais especÃ­ficos deste core
   (opcional â€” se vazio, o watchdog lÃª o SKILL.md dinamicamente)

## Sinais especÃ­ficos deste core (opcional)

[Deixar vazio para leitura dinÃ¢mica, ou preencher com sinais
de deriva especÃ­ficos que o SKILL.md nÃ£o captura explicitamente]

