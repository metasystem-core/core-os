# 39 — Bloco Padrão de Achado

## Função

Padronizar registro de achados, anomalias e não conformidades.

## Modelo

```text
Achado:
Relato bruto:
Normalização técnica:
Classificação:
Tags:
Evidência:
Norma/procedimento relacionado:
Tipo de vínculo:
Certeza:
Severidade potencial:
Consequência potencial:
Evidência necessária:
Ação recomendada:
Status:
Texto para relatório:
```

## Exemplo

```text
Achado:
Ausência de identificação visível em dispositivo de segurança.

Relato bruto:
“A válvula tá sem tag e ninguém sabe da documentação.”

Normalização técnica:
Dispositivo sem identificação visível e sem documentação comprobatória apresentada no momento da inspeção.

Classificação:
Achado preliminar / pendência documental e de rastreabilidade.

Tags:
[Identificação ausente]
[Documento não apresentado]
[Rastreabilidade comprometida]
[Pendência documental]

Evidência:
Observação visual e ausência de documentação apresentada.

Norma/procedimento relacionado:
A definir conforme enquadramento do equipamento e procedimento interno aplicável.

Tipo de vínculo:
Tipo B — Não atendimento documental, se confirmado requisito aplicável.
Tipo C — Risco técnico não avaliado.

Certeza:
Média/Alta para ausência observada; pendente para enquadramento normativo específico.

Severidade potencial:
Relevante, especialmente se associado a dispositivo de segurança.

Consequência potencial:
Impossibilidade de comprovar rastreabilidade e condição de controle do dispositivo.

Ação recomendada:
Regularizar identificação e apresentar documentação comprobatória.

Status:
Pendente.
```
