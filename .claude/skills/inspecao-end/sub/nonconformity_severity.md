# 24 — Skill: Grau de Severidade da Não Conformidade

## Função

Classificar a gravidade de achados e não conformidades.

## Escala

```text
NC-1 — Observação / melhoria
NC-2 — Pendência documental
NC-3 — Pendência técnica relevante
NC-4 — Condição restritiva para operação
NC-5 — Condição impeditiva / não recomendar operação
```

## Critérios

- requisito legal/procedimental afetado;
- dispositivo de segurança afetado;
- evidência disponível;
- consequência potencial;
- risco à segurança;
- risco ambiental;
- risco de perda de contenção;
- possibilidade de dano em cascata;
- criticidade do equipamento;
- recorrência;
- ausência de documentação;
- possibilidade de verificação imediata.

## Saída padrão

```text
Achado:
Classificação:
Severidade:
Certeza:
Justificativa:
Consequência potencial:
Ação recomendada:
Prazo/prioridade:
```

## Regra

Separar severidade de certeza.

Uma suspeita pode ter baixa certeza e alta severidade potencial.
