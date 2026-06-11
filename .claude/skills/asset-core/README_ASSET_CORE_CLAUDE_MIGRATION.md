# README — ASSET-CORE para Claude Code

**Data:** 2026-05-01  
**Objetivo:** pacote de migração do ASSET-CORE para uso como skill principal + sub-skills no Claude Code.

## Estrutura recomendada

Este pacote foi organizado para funcionar como um sistema modular:

1. `asset_core_main_skill.md`  
   Skill principal. Deve ficar leve, constitucional e roteadora.

2. `asset_router.md`  
   Meta-skill de roteamento. Decide quais sub-skills consultar conforme o contexto.

3. Sub-skills especializadas  
   Arquivos auxiliares chamados apenas quando o contexto exige.

4. `manifest.json` e `manifest.yaml`  
   Mapa das skills, gatilhos e dependências.

5. `validation_tests.md`  
   Testes/checklists para evitar uso inválido do core.

## Princípio central

O ASSET-CORE não existe para prever futuro.  
Ele existe para decidir sob incerteza preservando:

> sobrevivência > controle de risco > liquidez > convexidade > retorno

## Atualização incorporada

O Valuation Orchestrator foi corrigido para operar por padrão com **adaptação Brasil**:

- CDI/Selic;
- NTN-B;
- inflação;
- indexadores;
- risco Brasil;
- liquidez;
- tributação;
- governança;
- risco estatal/regulatório;
- ciclicidade setorial;
- exposição cambial/commodity;
- prêmio de risco acima do CDI.

Nenhum valuation importado deve ser aplicado cru.
