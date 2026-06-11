# Sub-skill: lotofa_e_historico

## Função específica
Construir e analisar o E-Histórico: os conjuntos de 10 números ausentes em cada concurso.

## Quando consultar
Quando o modelo precisar gerar jogos pela lógica dos 10 erros ou investigar padrões de ausência.

## Conceito central

```text
U = {1..25}
E_t = U \ R_t
|E_t| = 10
```

Para um jogo candidato:

```text
E_c = U \ J
Acertos(J, R_t) = 5 + |E_c ∩ E_t|
```

## Conteúdo da análise

- frequência de ausência por número;
- coausência de pares;
- coausência de trios se necessário;
- distribuição por faixas;
- paridade do erro;
- distância entre erros históricos;
- clusters de erro;
- janelas curta/média/longa;
- aderência de E_candidatos ao histórico.

## Saída

- tabela de frequências de ausência;
- matriz de coausência;
- score SP_E;
- diagnóstico de regimes de erro.

## Cuidado crítico

E-Histórico informa estrutura, mas não cria causalidade. Não transformar recorrência em lei.
