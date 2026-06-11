# ASSET-CORE Automation Layer

Camada de coleta, organização e roteamento de dados para o ASSET-CORE.

## Princípio

Automação coleta e organiza.
ASSET-CORE decide.
Operador executa ou não.

## Fluxo

Sinal externo → Gateway → Triage → Parser → Validator → ASSET-CORE → Decision

## Dados

Dados reais de carteira em `.claude/data/schemas/`
Nunca sobem para o GitHub.

## Fases de implementação

Fase 1 — Email: alertas de plataforma por email (viável agora)
Fase 2 — Documentos públicos: CVM, Fundos.NET, RI por ticker
Fase 3 — Carteira pessoal: CSV manual → normalizado
Fase 4 — Correlações: PETR4, VALE3, FIIs
Fase 5 — WhatsApp: fase futura
