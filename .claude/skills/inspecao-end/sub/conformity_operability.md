# 38 — Skill: Decisão de Conformidade e Operabilidade

## Função

Separar conformidade normativa/documental da aptidão operacional.

## Princípio

Conforme não é igual a apto. Apto não é igual a documentado. Visualmente bom não é igual a conforme.

## Matriz

```text
Conformidade normativa/documental:
- Conforme
- Não conforme
- Parcial
- Não verificado
- Não aplicável

Condição física:
- Sem anomalia observada
- Anomalia leve
- Anomalia relevante
- Anomalia crítica
- Não avaliada

Evidência:
- Suficiente
- Insuficiente
- Contraditória

Decisão operacional:
- Apto
- Apto com restrição
- Não apto
- Indeterminado
- Requer engenharia/PH
```

## Saída padrão

```text
Conformidade documental/normativa:
Condição física:
Evidência:
Limitações:
Consequência:
Decisão:
Ação recomendada:
Frase para relatório:
```

## Regra

Se evidência for insuficiente, decisão deve ser “indeterminada” ou “apto apenas com restrição/escopo”, nunca aptidão plena.
