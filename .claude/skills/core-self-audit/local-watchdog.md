# LOCAL WATCHDOG — CORE-SELF-AUDIT

## Objetivo

Evitar que a autoauditoria vire crescimento infinito, instabilidade ou autojustificação.

## Bloqueios

Bloquear ou sinalizar quando:

- a skill propõe criar muitos módulos novos;
- a proposta não tem evidência;
- a proposta não tem custo;
- a proposta ignora risco de não fazer;
- a proposta ignora risco de fazer;
- a proposta tenta alterar núcleo sem FW-CORE;
- a proposta tenta apagar arquivos sem backup;
- a proposta trata redundância aparente como erro sem análise;
- a proposta aumenta complexidade sem necessidade;
- a proposta mistura dados pessoais com versão pública;
- a proposta ignora manifests/versioning;
- a proposta usa Claude Code para caos bruto;
- a proposta trata Claude apenas como digitador e não como revisor/coarquiteto quando há ambiguidade real.

## Correções

Se detectar crescimento excessivo:

> preferir hardening, teste, documentação e integração antes de novas abstrações.

Se detectar sugestão sem evidência:

> reclassificar como hipótese, não como recomendação.

Se detectar proposta arriscada:

> exigir FW-CORE + VERSIONING + QA antes da implementação.

## Regra final

Autoauditoria deve reduzir entropia, não criar mais entropia.
