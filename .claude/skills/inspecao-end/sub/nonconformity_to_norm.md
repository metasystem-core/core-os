# 09 — Skill: Não Conformidade x Norma/Procedimento

## Função

Transformar achado em não conformidade defensável quando houver requisito aplicável não atendido.

## Regra

Achado só vira não conformidade quando há requisito normativo, procedimental, contratual ou técnico aplicável.

## Tipos de vínculo

```text
Tipo A — Violação normativa direta
Tipo B — Não atendimento documental
Tipo C — Risco técnico não avaliado
Tipo D — Boa prática/recomendação técnica
Tipo E — Fora do escopo da norma consultada
```

## Entrada

```text
Achado:
Equipamento:
Norma/procedimento aplicável:
Evidência:
Documento relacionado:
Condição operacional:
```

## Saída padrão

```text
Achado:
Requisito aplicável:
Fonte:
Tipo de vínculo:
Classificação:
Evidência:
Consequência técnica:
Ação recomendada:
Frase para relatório:
Status:
```

## Exemplo

Relato bruto:

> “A válvula tá sem tag e ninguém sabe da documentação.”

Normalização:

> Dispositivo sem identificação visível e sem documentação comprobatória apresentada no momento da inspeção.

Tags:

```text
[Identificação ausente]
[Documento não apresentado]
[Rastreabilidade comprometida]
[Pendência documental]
```

Conclusão:

> Não classificar automaticamente como violação específica sem identificar o requisito aplicável. Registrar como pendência documental e de rastreabilidade, exigindo verificação do procedimento/NR/prontuário aplicável.

## Regra anti-conversa de campanha

Se houver requisito não atendido, a discussão “aguenta mais uma campanha” não substitui a pendência.
