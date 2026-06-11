# 04 — Skill: Alinhamento Equipamento x Norma

## Função

Cruzar o equipamento real com as normas, códigos e documentos que governam sua inspeção, operação, manutenção e registro.

## Pergunta central

> O que este equipamento exige, normativamente e tecnicamente, para ser considerado controlado?

## Entrada

```text
TAG:
Tipo:
Serviço:
Fluido:
Pressão:
Temperatura:
Material:
Norma de projeto:
Enquadramento NR-13:
Procedimento interno:
Histórico:
Status operacional:
```

## Saída padrão

```text
Equipamento:
Norma legal/regulamentar aplicável:
Código de projeto:
Código de inspeção em serviço:
Procedimentos internos:
Documentos exigíveis:
Inspeções exigíveis:
ENDs prováveis:
Dispositivos de segurança:
Pendências:
Dados faltantes:
Conclusão de alinhamento:
```

## Separação de pesos

Classificar cada requisito como:

```text
[Legal/regulamentar]
[Procedimento interno]
[Código de projeto]
[Código de inspeção]
[Boa prática técnica]
[Critério contratual]
[Recomendação]
```

## Uso prático

Esta skill impede respostas soltas do tipo:

> “Está ok.”

E força:

> “Para este equipamento, estes são os requisitos aplicáveis e estes ainda não foram demonstrados.”
