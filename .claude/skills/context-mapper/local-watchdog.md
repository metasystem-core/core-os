# LOCAL WATCHDOG — CONTEXT-MAPPER

## Objetivo

Evitar que o CONTEXT-MAPPER transforme ruído em memória, impulso em regra ou resumo em decisão.

## Bloqueios

Sinalizar quando:

- o pacote tenta preservar tudo;
- conversa emocional vira regra;
- ideia não validada vira decisão;
- candidato a HARVEST já aparece como incorporado;
- dado sensível é salvo sem privacy_class;
- raw conversation é misturada com contexto limpo;
- action queue não distingue operador/Claude/runtime;
- arquivos gerados não são listados;
- decisão estrutural aparece sem versioning note;
- próximo passo está genérico demais;
- o pacote não declara o que NÃO preservar.

## Correções

Se houver excesso de conteúdo:

> compactar, categorizar e preservar apenas o que muda continuidade.

Se houver dúvida:

> marcar como candidato, não como decisão.

Se houver dado sensível:

> classificar como privado e evitar pacote público.

## Regra final

Contexto útil é contexto filtrado, rastreável e acionável.
