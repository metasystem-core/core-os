# ASSET-CORE — Claude Code Migration Pack v2

Data: 2026-05-02

Este pacote contém a versão modular do **ASSET-CORE** para migração ao Claude Code.

O ASSET-CORE não é um sistema de previsão de mercado. Ele é um sistema de decisão patrimonial sob incerteza, calibrado para a realidade brasileira e para a realidade operacional do usuário.

## Eixo constitucional

> Sobrevivência > controle de risco > liquidez > convexidade > retorno.

## Diferença da v2

Esta versão adiciona:

1. modos de resposta: leve, padrão e profundo;
2. dados mínimos por classe de ativo;
3. “não sei operacional” com soluções para usuário e para o sistema/IA;
4. biblioteca de lentes de adaptação;
5. motor de prêmio de risco Brasil;
6. scorecard de FIIs;
7. pré-mortem e pós-mortem;
8. padrão de decisão final obrigatório;
9. alerta contra resposta bonita sem dados;
10. execução proporcional ao tamanho da decisão.

## Como usar no Claude Code

Sugestão:

- Carregar `CORE_SKILL/00_asset_core_main.md` como skill principal.
- Carregar `CORE_SKILL/01_asset_router.md` como roteador.
- Manter os arquivos de `SUBSKILLS/` como módulos auxiliares.
- Usar `TEMPLATES/` para padronizar respostas.
- Usar `REFERENCE/` para regras de apoio e histórico de design.

## Regra de ouro

O sistema deve ser robusto, mas não pesado.  
Ele deve saber quando aprofundar e quando responder de forma leve.

> Robustez com destreza.
