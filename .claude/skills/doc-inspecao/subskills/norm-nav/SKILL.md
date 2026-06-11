# SKILL — norm-nav

## Identidade

`norm-nav` é uma subskill de consulta normativa leve. Ela navega por índices e blocos normativos já refinados, evitando abrir PDF bruto por padrão.

**Distinção com `norm-reader`:** `norm-reader` (sub-skill preexistente do `doc-inspecao`) lê documentos técnicos avulsos fornecidos diretamente pelo operador — databooks, prontuários, relatórios. `norm-nav` navega no índice normativo estruturado construído pelo `norm-ingest` — consulta blocos codificados, índices leves e metadados de normas já ingeridas. São complementares, não duplicatas.

## Função

Responder perguntas como:

- Qual item/requisito trata deste tema?
- Essa não conformidade se liga a qual norma?
- Qual evidência documental é exigida?
- O requisito é obrigatório, condicional ou apenas recomendação?
- Qual bloco normativo devo consultar antes de emitir relatório?

## Fluxo obrigatório

1. Identificar domínio da pergunta.
2. Consultar índice leve.
3. Selecionar blocos candidatos.
4. Retornar norma, versão, item, tipo de bloco e grau de certeza.
5. Se necessário, pedir abertura de texto extraído.
6. Abrir PDF bruto somente quando houver conflito, auditoria, dúvida grave ou solicitação explícita.

## Hierarquia de consulta

```text
Nível 0 — metadados
Nível 1 — índice leve
Nível 2 — blocos codificados
Nível 3 — texto extraído
Nível 4 — PDF bruto
```

Regra: nunca iniciar no Nível 4 salvo comando explícito do operador.

## Formato de resposta

Responder com:

1. Norma candidata ou confirmada.
2. Item/cláusula/bloco.
3. Tipo de requisito.
4. Resumo operacional.
5. Evidência necessária.
6. Grau de certeza.
7. Lacunas.
8. Core recomendado para aplicação.

## Grau de certeza

- `confirmado`: há bloco normativo direto e dados mínimos do caso.
- `provavel`: há bloco normativo relevante, mas faltam dados do caso.
- `condicional`: depende de condição técnica, ambiental ou contratual.
- `referencial`: útil como referência, mas não base conclusiva.
- `lacuna`: banco não contém informação suficiente.

## Regras de segurança

- Não inventar item normativo.
- Não transformar inferência em confirmação.
- Não usar norma privada como se fosse pública.
- Não reproduzir grandes trechos literais de norma privada.
- Não concluir apto/não apto sem evidência técnica suficiente.
- Se a norma estiver desatualizada ou com vigência não confirmada, alertar.

## Saída curta para campo

Quando o operador pedir rapidez, usar:

```text
Norma: <norma>
Item/bloco: <id>
Status: confirmado/provável/condicional/lacuna
Exige: <resumo prático>
Evidência: <documento/prova necessária>
Ação: <próximo passo>
```
