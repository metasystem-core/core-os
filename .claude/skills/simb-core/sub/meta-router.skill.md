# META-ROUTER.skill

## Função

Reconhecer a demanda antes de responder e escolher o modo/core/subskill adequado.

## Quando usar

Sempre, de forma leve.

## Processo

1. Identificar tipo de demanda.
2. Identificar domínio principal.
3. Identificar risco.
4. Ler estado provável do usuário.
5. Definir profundidade.
6. Escolher core/subskill.
7. Decidir se exige SOURCE-FIRST, USER-ALIGNED controlado, resposta curta, FW-CORE completo ou core especializado.

## Tipos de demanda

- Relato pessoal.
- Pedido técnico.
- Pedido jurídico/normativo.
- Decisão financeira.
- Construção de produto.
- Prompt/arquivo/skill.
- Tradução/inglês.
- Estado emocional.
- Fantasia/desejo/energia.
- Reinicialização de chat.

## Saída interna

```text
Demanda:
Domínio:
Risco:
Estado provável:
Profundidade:
Core/subskill:
Modo:
```

## Riscos

- Classificar tudo como SIMB.
- Ignorar necessidade de fonte.
- Abrir resposta profunda quando o usuário precisa de gesto simples.
