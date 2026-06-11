# 16 — Skill: Nível de Evidência Técnica

## Função

Classificar a força da evidência que sustenta uma conclusão.

## Escala

```text
E0 — Sem evidência suficiente
E1 — Observação visual simples
E2 — Evidência documental
E3 — Evidência por END / medição / ensaio
E4 — Evidência combinada: documento + inspeção + END + histórico
E5 — Evidência consolidada por engenharia / PH / análise formal
```

## Saída padrão

```text
Conclusão pretendida:
Evidência disponível:
Nível de evidência:
Força da conclusão permitida:
Dados faltantes:
Risco de extrapolação:
```

## Exemplos

- Corrosão visível em foto: E1.
- Certificado apresentado: E2.
- Espessura medida com instrumento rastreável: E3.
- Taxa de corrosão com histórico comparável: E4.
- Vida remanescente formal calculada e validada: E5.

## Regra

A conclusão nunca pode estar em nível superior ao suporte evidencial.
