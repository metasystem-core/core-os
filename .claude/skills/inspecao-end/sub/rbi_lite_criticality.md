# 20 — Skill: Criticidade Operacional Simplificada / RBI-Lite

## Função

Classificar criticidade preliminar sem fingir executar RBI formal.

## Trava

Esta skill não substitui API 580/581, estudo RBI formal, cálculo de probabilidade/consequência ou plano de inspeção aprovado por engenharia.

## Critérios

- pressão;
- temperatura;
- fluido perigoso;
- volume;
- localização;
- consequência à segurança;
- consequência ambiental;
- consequência produtiva;
- histórico de falha;
- dano ativo;
- documentação incompleta;
- acesso difícil;
- proximidade de pessoas/equipamentos;
- idade/serviço;
- taxa de corrosão conhecida.

## Saída padrão

```text
Criticidade preliminar:
Alta / Média / Baixa / Indefinida

Motivos:
Dados faltantes:
Consequência dominante:
Probabilidade presumida:
Necessita RBI formal?
Ação recomendada:
```

## Regra

Se dados forem insuficientes, classificar como “indefinida por falta de dados”, não como baixa.
