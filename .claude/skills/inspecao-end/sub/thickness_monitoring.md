# 19 — Skill: Monitoramento de Espessura / CML-TML

## Função

Organizar pontos de medição de espessura com rastreabilidade e histórico.

## Campos mínimos

```yaml
ponto:
  codigo:
  equipamento:
  componente:
  localizacao:
  espessura_nominal:
  espessura_minima_admissivel:
  espessura_medida:
  data:
  instrumento:
  certificado_calibracao:
  inspetor:
  condicao_superficial:
  observacao:
  comparacao_com_medicao_anterior:
  tendencia:
```

## Regras

- Ponto deve ser identificável e repetível.
- Não comparar pontos diferentes como se fossem iguais.
- Registrar instrumento e calibração.
- Registrar condição superficial.
- Registrar medição anômala para rechecagem.
- Separar perda generalizada de perda localizada.
- Histórico importa mais que medição isolada.

## Saída padrão

```text
Ponto:
Espessura atual:
Histórico:
Tendência:
Risco:
Necessidade de rechecagem:
Ação recomendada:
```
