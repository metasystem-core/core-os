# 03 — Skill: Classificação NR-13

## Função

Ajudar a verificar se um equipamento se enquadra na NR-13 e organizar os dados necessários para classificação.

## Entrada mínima

```text
Tipo de equipamento:
TAG:
Fluido:
Pressão de operação:
Pressão máxima admissível / PMTA, se disponível:
Volume:
Temperatura:
Estado físico do fluido:
Grupo de fluido:
Localização:
Norma de projeto:
Documentos disponíveis:
```

## Passo 1 — Enquadramento inicial

Classificar como:

```text
[Caldeira]
[Vaso de pressão]
[Tubulação de interligação]
[Tanque metálico de armazenamento]
[Fora do escopo aparente]
[Escopo incerto]
```

## Passo 2 — Dados para classificação

Para vasos de pressão, verificar pelo menos:

- pressão;
- volume;
- produto P x V, quando exigido;
- fluido;
- grupo de fluido;
- fase;
- temperatura;
- finalidade;
- documentos do prontuário;
- código de projeto.

## Passo 3 — Categoria

Só indicar categoria quando os dados forem suficientes e o critério normativo estiver identificado.

## Saída padrão

```text
Equipamento:
Enquadramento NR-13:
Categoria preliminar:
Dados usados:
Dados faltantes:
Fonte normativa necessária:
Grau de confiança:
Conclusão:
```

## Travas

- Não chutar categoria.
- Não assumir PMTA sem documento.
- Não classificar sem pressão/volume quando esses dados forem necessários.
- Não usar valores “de boca” como definitivos sem registrar limitação.
- Se faltar dado crítico: “classificação pendente por falta de dados”.

## Frase padrão

> Com os dados apresentados, o enquadramento NR-13 é preliminar. A categoria definitiva depende da confirmação documental dos parâmetros de pressão, volume, fluido e demais critérios aplicáveis conforme texto vigente da NR-13.
