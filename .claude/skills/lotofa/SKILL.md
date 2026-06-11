---
name: lotofa-core
description: Use para laboratório estatístico controlado da Lotofácil — E-Histórico, geração de E-candidato, backtest temporal e análise lúdica. Firewall absoluto com asset-core.
status: standby
core_type: specialized
priority: medium
domain: statistical-lab
firewall: asset-core
risk_level: low
---

# Skill principal — LOTOFA-CORE

## Identidade

O LOTOFA-CORE é um laboratório estatístico para Lotofácil baseado em modelagem por acertos e erros históricos.

## Princípio central

Cada concurso possui:

```text
H = 15 números sorteados
E = 10 números ausentes
```

Modelar E é tão importante quanto modelar H.

## Universo

```text
U = {1..25}
```

Para cada concurso:

```text
H_t = R_t
E_t = U \ R_t
```

Para cada jogo candidato:

```text
J ⊂ U, |J| = 15
E_c = U \ J
```

Relação central:

```text
Acertos(J, R_t) = 5 + |E_c ∩ E_t|
```

## Funções

- analisar histórico;
- gerar jogos candidatos;
- testar versões;
- auditar desempenho;
- estudar E-Histórico;
- evitar overfitting;
- produzir aprendizado metodológico.

## Não funções

- prever com certeza;
- prometer acerto;
- justificar aposta impulsiva;
- transferir confiança para investimentos;
- confundir padrão com lei.

## Pipeline geral

```text
1. validar dados
2. construir H/E histórico
3. gerar E_candidatos
4. converter em jogos J
5. aplicar filtros estruturais
6. calcular Score de Plausibilidade
7. selecionar ensemble diverso
8. auditar historicamente
9. comparar contra versões/baselines
10. registrar arquivos e parâmetros
```

## Regras obrigatórias

- Separar dado, hipótese e conclusão.
- Declarar incerteza.
- Preservar risco de overfitting.
- Não transformar recorrência em lei.
- Ativar firewall quando houver ponte para ASSET-CORE.
- Preferir backtest temporal a avaliação retrospectiva simples.

## Onde pode falhar

- overfitting elegante;
- matemática ornamental;
- fascínio por pico isolado;
- aderência excessiva ao curto prazo;
- aleatoriedade disfarçada de profundidade;
- perda de rastreabilidade.

## Runtime disponível

O package Python `src/lotofa_core/` implementa mecanicamente o pipeline desta skill.

| Módulo | Função |
|---|---|
| `loader.py` | Carrega e valida o E-Histórico (CSV) |
| `features.py` | Gera features H/E por concurso |
| `generators.py` | Gera E-candidatos e converte em jogos J |
| `scoring.py` | Calcula Score de Plausibilidade |
| `backtest.py` | Backtest temporal walk-forward |
| `audit.py` | Auditoria de desempenho e rastreabilidade |
| `cli.py` | Interface de linha de comando |

```bash
# Exemplo de uso
python -m lotofa_core.cli --help
```

O runtime não substitui revisão do operador — gera candidatos para avaliação.
