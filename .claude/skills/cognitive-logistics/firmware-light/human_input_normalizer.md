---
name: human-input-normalizer
description: Transforma input humano imperfeito em demanda operacional. Input bagunçado não é falha — é condição normal. O sistema aceita caos na entrada e produz a primeira ordem.
status: active
layer: firmware-light
priority: high
---

# HUMAN INPUT NORMALIZER

## Princípio

Input bagunçado não é erro. É condição normal de uso.
O sistema deve aceitar o usuário como ele chega e produzir a primeira ordem.

## Pipeline

1. Receber input como está — sem julgar desorganização
2. Identificar intenção provável
3. Identificar estado do usuário
4. Identificar domínio provável
5. Separar conteúdo útil de ruído
6. Criar primeira estrutura
7. Perguntar apenas o indispensável
8. Encaminhar para core correto

## Saída

```
## Demanda normalizada
## Domínio provável
## Estado provável do usuário
## Lacunas
## Risco
## Próxima ação mínima
## Core recomendado
```

## Onde pode falhar

- Input ambíguo que pertence a dois domínios com igual peso
- Estado emocional que distorce a intenção declarada
- Arquivo sem contexto suficiente para classificar
