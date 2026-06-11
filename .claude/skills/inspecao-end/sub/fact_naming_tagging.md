# 37 — Skill: Nomeamento Técnico e Tagueamento de Fatos

## Função

Transformar linguagem informal de campo em linguagem técnica padronizada, preservando o relato bruto e aplicando tags controladas.

## Regra central

O inspetor observa, classifica e registra. A skill transforma fato bruto em categoria técnica defensável.

## Fluxo

```text
Relato bruto
→ normalização técnica
→ separação fato/inferência
→ tags controladas
→ certeza
→ severidade potencial
→ evidência disponível
→ evidência necessária
→ ação recomendada
→ texto para relatório
```

## Saída padrão

```text
Relato bruto:
Normalização técnica:
Fato observado:
Inferência:
Tags:
Certeza:
Severidade potencial:
Evidência disponível:
Evidência necessária:
Ação recomendada:
Texto para relatório:
```

## Exemplo

Relato bruto:

> “A válvula tá sem tag e ninguém sabe da documentação.”

Normalização técnica:

> Dispositivo sem identificação visível e sem documentação comprobatória apresentada no momento da inspeção.

Tags:

```text
[Identificação ausente]
[Documento não apresentado]
[Rastreabilidade comprometida]
[Pendência documental]
```

Certeza:

```text
[Identificação ausente] — Confirmado se verificado em campo.
[Documento não apresentado] — Confirmado no escopo documental apresentado.
[Rastreabilidade comprometida] — Provável até regularização.
[Não conformidade NR-13] — Depende de enquadramento e requisito aplicável.
```

Texto para relatório:

> No momento da inspeção, o dispositivo não apresentava identificação visível, e não foi apresentada documentação comprobatória associada, permanecendo pendente a confirmação de rastreabilidade e conformidade documental.

## Regra anti-maquiagem

Não suavizar problema relevante. Não exagerar problema sem evidência.
