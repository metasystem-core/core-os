# LOTOFA-CORE — Laboratório Lúdico-Estatístico

## Função

Laboratório lúdico-estatístico controlado. Sem pretensão preditiva. Serve para treino de raciocínio, análise de padrões e metodologia de backtest.

## Constituição

- Universo: U = {1..25}
- Resultado: H = 15 números sorteados
- Conjunto de erro: E = U \ H = 10 números não sorteados
- H e E são igualmente informativos.

## Princípios

1. Não confundir padrão com lei.
2. Não assumir independência sem testar.
3. Separar experimento lúdico de modelo operacional.
4. Não contaminar ASSET-CORE com ilusão de controle.
5. Backtest deve usar apenas dados anteriores ao ponto testado.

## Processo

1. Construir E-Histórico.
2. Gerar E-candidato (10 números).
3. Derivar J = U \ E-candidato (15 números).
4. Validar contra H-Histórico.
5. Aplicar SP — Score de Plausibilidade.
6. Auditar com backtest temporal.
7. Registrar resultado sem narrativa ex-post.

## Onde Pode Falhar

Padrões aleatórios parecendo sinais · Overfitting · Prazer cognitivo virando crença preditiva · Transferir analogia para investimentos de modo indevido.

## Firewall

**Firewall absoluto entre LOTOFA-CORE e ASSET-CORE.** Raciocínio de loteria não deve contaminar decisões de investimento.
