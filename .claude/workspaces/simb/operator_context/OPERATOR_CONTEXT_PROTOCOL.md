---
tipo: operator_context
arquivo: OPERATOR_CONTEXT_PROTOCOL.md
status: ativo
criado_em: 2026-06-17
---

# OPERATOR_CONTEXT_PROTOCOL.md

## Função

Protocolo que obriga a Iris a manter continuidade do operador entre sessões. Define quando atualizar automaticamente, quando pedir aprovação, quando não registrar por privacidade, e como corrigir informações antigas.

## Princípio central

A Iris não deve assumir que o conteúdo de uma sessão anterior está persistido. Continuidade do operador é responsabilidade operacional ativa, não um efeito colateral da conversa.

## Quando gerar um Delta (OPERATOR_CONTEXT_DELTA_LOG.md)

- Toda sessão relevante do SIMB gera um delta, mesmo que o delta seja "nenhum material novo".
- Relevante = qualquer sessão em que o operador narrou material pessoal, sonho, símbolo, fez uma correção, tomou uma decisão de projeto, ou pediu uma síntese/análise.

## Quando atualizar automaticamente (sem pedir aprovação)

- Registro do delta da sessão em si (sempre).
- Registro de uma correção explícita do operador em CORRECTION_LOG.md (a correção em si é fato da sessão, não material sensível novo).
- Atualização do COVERAGE_AUDIT.md quando uma busca de lacuna for refeita ou quando nova ausência for confirmada.

## Quando pedir aprovação explícita do operador

- Antes de promover qualquer item para OPERATOR_PROFILE.md como "fato" ou "relato" durável.
- Antes de registrar um sonho novo em DREAM_REGISTRY.md com conteúdo extenso (relato bruto longo) — confirmar que o operador quer aquele relato persistido em arquivo.
- Antes de registrar uma "decisão de vida" em DECISION_LOG.md (decisões de projeto/sistema não precisam dessa aprovação extra).
- Antes de aplicar qualquer leitura simbólica a um símbolo do SYMBOL_REGISTRY.md.
- Antes de qualquer migração retroativa de arquivos existentes (ex.: separar relato bruto de leitura SIMB nos sonhos já existentes em sonhos/).

## Quando NÃO registrar (privacidade)

- Em modo visitante: nenhum acesso a operator_context. Material pessoal permanece bloqueado, igual a profile.md/decision_log do ASSET-CORE.
- Mesmo em modo operador primário, conteúdo marcado pelo operador como "não registrar" ou equivalente não deve ser persistido, apenas usado na resposta da sessão corrente.
- Nunca registrar dado sensível (saúde, identificadores, finanças sensíveis) fora das regras já estabelecidas no firmware/CLAUDE.md do CORE-OS.

## Como corrigir informação antiga

1. Toda correção do operador entra primeiro em CORRECTION_LOG.md, com o que a Iris assumiu e o que foi corrigido.
2. Se a informação corrigida já estiver em OPERATOR_PROFILE.md, DREAM_REGISTRY.md, SYMBOL_REGISTRY.md ou DECISION_LOG.md, o item correspondente deve ser atualizado (não apenas a entrada do log) — com nota de que foi revisado, data da revisão, e referência à entrada do CORRECTION_LOG.md.
3. Correção do operador sempre prevalece sobre inferência anterior da Iris, sem exceção.

## Verificação de cobertura antes de síntese ampla

Antes de qualquer análise, retrato ou síntese ampla sobre o operador, a Iris deve:

1. Ler COVERAGE_AUDIT.md.
2. Se a cobertura não for COMPLETA, declarar explicitamente o nível de cobertura ao operador antes ou junto da síntese.
3. Nunca afirmar "tenho material completo" sem essa verificação.

## Relação com outras camadas

- `operator_context/` é a camada de continuidade e processo. `library/` (cards, registries de conceitos/fontes) permanece a camada de material derivado de fontes (livros, autores). `sonhos/` e `leituras/` permanecem como arquivos de origem; este protocolo não os substitui nem os migra automaticamente.
- Patch correspondente em `.claude/agents/domain/simb-agent/AGENT.md`, seção "Operator Context Persistence", torna este protocolo vinculante para o comportamento do agente.
