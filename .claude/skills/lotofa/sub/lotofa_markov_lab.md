# Sub-skill: lotofa_markov_lab

## Função específica
Explorar transições de presença/ausência sem transformar Markov em dogma.

## Quando consultar
Apenas em experimentos específicos sobre persistência, alternância ou retorno de números.

## Estados possíveis

```text
1 = saiu
0 = não saiu
```

Transições:

```text
1→1, 1→0, 0→1, 0→0
```

## Análises

- matriz de transição por número;
- transição agregada;
- persistência;
- reversão;
- alternância;
- janelas temporais.

## Limite

Lotofácil não deve ser assumida como cadeia de Markov forte. Este módulo é lente auxiliar.

## Onde pode falhar

- causalidade falsa;
- sobrepeso em transições recentes;
- narrativa pós-resultado.
