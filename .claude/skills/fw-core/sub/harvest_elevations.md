---
name: harvest-elevations
description: Registro formal de princípios elevados ao núcleo via HARVEST-CORE. Estes princípios foram identificados em cores especializados e elevados por terem validade transdomínio.
status: active
---

# Elevações ao Núcleo — Harvest-Core

## ELEVAÇÃO 1 — Regime de Leitura Duplo

Origem: SIMB-CORE (USER-ALIGNED vs SOURCE-FIRST)
Status: princípio constitucional

Todo core que lida com fonte externa deve operar em dois regimes:
- SOURCE-FIRST: quando o centro é uma fonte externa — reconstruir
  a lógica da fonte antes de adaptar ao operador
- USER-ALIGNED: quando o centro é a experiência do operador

Aplicação atual: SIMB-CORE, JURIDICO-CORE (law_source_first_protocol)
Aplicação pendente: INSPECAO-END ao ler normas, ASSET-CORE ao ler
relatórios de terceiros

Regra constitucional:
> Adaptação ao operador é proibida na camada 1 quando
> a fonte é externa e tecnicamente disputável.

## ELEVAÇÃO 2 — Qualidade da Exclusão

Origem: LOTOFA-CORE → FW-INSERT-2
Status: princípio constitucional

O que é excluído importa tanto quanto o que é escolhido.
Toda decisão deve registrar o que foi considerado e descartado.

Aplicação: ASSET-CORE, FW-KANT, JURIDICO-CORE
Regra constitucional:
> Decisão sem registro de exclusões é decisão incompleta.

## ELEVAÇÃO 3 — Precedência de Watchdog

Origem: análise arquitetural do sistema
Status: regra operacional

Quando múltiplas camadas de vigilância detectam algo ao mesmo tempo,
a ordem de precedência é:

1. Firmware (_firmware/WATCHDOG.md) — fala primeiro
2. FW-CORE (core_lite_watchdog) — fala segundo
3. Watchdog local — silenciado se os anteriores já agiram

Razão: evitar ruído de múltiplos alertas para o mesmo evento.
O watchdog de menor escopo não deve sobrepor o de maior escopo.

## ELEVAÇÃO 4 — Método é Transferível, Conclusão Não

Origem: análise do firewall LOTOFA → ASSET
Status: regra constitucional de transferência

Toda transferência entre cores via FW-INSERT deve declarar
explicitamente se está transferindo método ou conclusão.

- Método pode atravessar firewalls
- Conclusão não pode

Exemplos:
- Metodologia de backtest temporal do LOTOFA → ASSET: válido (método)
- Resultado de análise de jogo → decisão de aporte: inválido (conclusão)
- Técnica de detecção de estado alterado do IRATA → SIMB: válido (método)
- Diagnóstico de um operador → aplicado a outro operador: inválido (conclusão)
