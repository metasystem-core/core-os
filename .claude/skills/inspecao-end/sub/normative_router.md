# 02 — Skill: Roteador Normativo e Controle de Fonte

## Função

Identificar quais normas, códigos, procedimentos e documentos devem ser consultados para um equipamento ou achado.

## Regra SOURCE-FIRST

Antes de citar uma obrigação normativa, registrar:

```text
Fonte:
Norma/código/procedimento:
Edição/revisão:
Item/cláusula, se conhecido:
Aplicabilidade:
Peso normativo:
Limitação:
```

## Hierarquia normativa orientativa

1. Lei, regulamento e Norma Regulamentadora brasileira aplicável.
2. Procedimento interno do cliente/empregador, quando aplicável e não conflitante com requisito legal.
3. Código de construção/projeto do equipamento.
4. Código de inspeção em serviço.
5. Norma ABNT/NBR aplicável.
6. Prática recomendada/API/guia técnico.
7. Critério contratual.
8. Boa prática técnica.

## Exemplos de enquadramento

### NR-13

Usar para requisitos mínimos de gestão da integridade estrutural de caldeiras, vasos de pressão, tubulações de interligação e tanques metálicos de armazenamento, conforme texto oficial vigente.

### ASME

Usar como código de projeto/construção quando o equipamento foi projetado ou especificado por ASME. Não usar ASME como substituto automático da NR-13.

### API 510

Usar como referência de inspeção, reparo, alteração e reclassificação de vasos em serviço, quando aplicável por contrato, procedimento ou boa prática.

### API 570

Usar como referência para inspeção de tubulações em serviço, quando aplicável.

### API 653

Usar como referência para tanques de armazenamento em serviço, quando aplicável.

### API 571

Usar como biblioteca de mecanismos de dano, sem transformar sugestão em causa confirmada.

### API 580/581

Usar apenas como referência para RBI formal. O INSPEÇÃO-CORE pode ter criticidade preliminar, mas não deve fingir executar RBI completo.

## Saída padrão

```text
Equipamento/Achado:
Norma principal:
Normas/códigos auxiliares:
Procedimento interno necessário:
Documentos mínimos:
Requisitos prováveis:
Dados faltantes:
Conclusão normativa permitida:
```

## Trava

Se a norma não foi consultada ou se o item não é conhecido:

> “Não citar como exigência normativa específica. Tratar como necessidade de consulta à fonte oficial/procedimento aplicável.”
