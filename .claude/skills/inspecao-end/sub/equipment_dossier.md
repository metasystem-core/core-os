# 11 — Skill: Dossiê Vivo por Equipamento

## Função

Construir e atualizar histórico técnico por equipamento.

## Princípio

Cada nova inspeção deve atualizar o dossiê. Não começar do zero quando existe histórico.

## Dados principais

```yaml
equipamento:
  tag:
  tipo:
  localizacao:
  planta:
  setor:
  fluido:
  pressao_operacao:
  temperatura_operacao:
  volume:
  material:
  norma_projeto:
  enquadramento_nr13:
  categoria_nr13:
  criticidade:
  status_operacional:
```

## Registros necessários

- documentos;
- inspeções;
- medições;
- ENDs;
- não conformidades;
- recomendações;
- fotos;
- mecanismos de dano;
- modos de falha;
- pendências;
- decisões;
- responsáveis.

## Saída padrão

```text
Dossiê atualizado:
Dados novos:
Dados alterados:
Pendências abertas:
Histórico relevante:
Riscos recorrentes:
Próxima ação:
```

## Regra

Todo dado deve ter origem:

```text
[observação de campo]
[documento]
[ensaio]
[medição]
[relato]
[hipótese]
[decisão formal]
```
