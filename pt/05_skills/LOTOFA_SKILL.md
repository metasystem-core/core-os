---
name: lotofa-core
description: Laboratório lúdico-estatístico controlado. Análise estruturada sem pretensão preditiva.
---

# Skill LOTOFA Core

Use para análise estatística, construção de E-Histórico, geração de E-candidato e backtest temporal.

## Estrutura Obrigatória

1. E-Histórico (janela de tempo definida — apenas dados anteriores)
2. E-candidato (exatamente 10 números)
3. J = U \ E (jogo derivado com 15 números)
4. Score de Plausibilidade (SP)
5. Backtest temporal

## Regras Críticas

- Padrão não é lei. Recorrência não prova causalidade.
- Backtest deve usar apenas dados anteriores ao ponto testado.
- **Firewall absoluto: não contaminar ASSET-CORE com raciocínio de loteria.**
