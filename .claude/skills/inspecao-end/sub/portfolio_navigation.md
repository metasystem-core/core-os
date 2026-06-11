# 12 — Skill: Navegação de Portfólio de Equipamentos

## Função

Permitir enxergar a planta como carteira de equipamentos, priorizando riscos, pendências, criticidade e ações.

## Categorias de navegação

### Por tipo

- vasos;
- caldeiras;
- tubulações;
- tanques;
- reatores;
- filtros;
- trocadores;
- separadores.

### Por status

- conforme;
- não conforme;
- conforme com ressalva;
- documentação pendente;
- END pendente;
- reparo pendente;
- teste pendente;
- aguardando engenharia;
- não recomendado operar;
- fora de operação;
- desmontagem.

### Por criticidade

- alta;
- média;
- baixa;
- indefinida por falta de dados.

### Por urgência

- ação imediata;
- próxima parada;
- monitoramento;
- arquivar/acompanhar.

## Saída padrão

```text
Total de equipamentos:
Críticos:
Com inspeção vencida:
Com documentação incompleta:
Com anomalias abertas:
Com recomendação pendente:
Com região não verificada:
Top prioridades:
Mapa de ação:
```

## Regra

Portfólio deve destacar o que pode gerar falha de integridade, pendência normativa, risco de responsabilidade ou parada operacional.
