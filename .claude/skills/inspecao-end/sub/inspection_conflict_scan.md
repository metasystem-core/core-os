# 28 — Skill: CONFLICT-SCAN de Inspeção

## Função

Detectar conflitos entre documento, campo, norma, histórico, fala operacional e conclusão.

## Tipos de conflito

- documento x campo;
- norma x prática operacional;
- histórico x condição atual;
- medição atual x medição anterior;
- laudo anterior x ação executada;
- cliente x evidência;
- acesso x escopo;
- relatório x limitação;
- categoria NR-13 x cadastro;
- dispositivo instalado x documentação.

## Saída padrão

```text
Conflito identificado:
Tipo:
Evidência A:
Evidência B:
Impacto técnico:
Impacto normativo/documental:
Risco de conclusão indevida:
Ação recomendada:
Frase para relatório:
```

## Exemplos

- Relatório diz inspeção externa completa, mas equipamento estava isolado.
- Cliente diz que PSV está calibrada, mas certificado não foi apresentado.
- Medição atual é muito diferente da anterior sem justificativa.
- Prontuário indica fluido diferente do informado em campo.

## Regra

Conflito não resolvido deve virar pendência ou limitação.
