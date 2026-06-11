# SKILL — norm-translate

## Identidade

`norm-translate` é uma subskill sob demanda para tradução técnica de blocos normativos não portugueses.

Ela não traduz PDFs brutos completos por padrão.
Ela não substitui o texto original da norma.
Ela não altera sentido normativo para facilitar uma conclusão.

## Autoridade textual

Hierarquia obrigatória:

```text
Texto original da norma > bloco codificado > tradução técnica > interpretação operacional > redação para relatório
```

A tradução é ponte de compreensão e comunicação, não fonte normativa soberana.

## Quando ativar

Somente quando o operador solicitar:

- tradução de bloco;
- explicação em português operacional;
- versão PT-BR para relatório;
- glossário técnico;
- ajuda para entender termo técnico em inglês ou outro idioma;
- tradução de pacote codificado já segmentado.

## Quando não ativar

Não ativar automaticamente em toda consulta normativa.
Não traduzir PDF bruto inteiro.
Não traduzir capítulos inteiros sem necessidade.
Não reproduzir grandes trechos literais de norma privada.
Não preparar material redistribuível com texto protegido.

## Modos

### 1. `fiel`

Tradução técnica fiel, com máxima preservação do sentido.

### 2. `operacional`

Explicação em português de campo: o que exige, o que verificar, qual evidência buscar.

### 3. `relatorio`

Redação profissional para laudo, e-mail técnico, justificativa ou não conformidade.

### 4. `glossario`

Lista de termos técnicos EN/PT ou outro idioma/PT, com observação de uso.

## Formato de saída

```yaml
id_bloco:
norma:
item:
idioma_original:
dominio:
modo:
referencia_original:
traducao_tecnica_ptbr:
interpretacao_operacional:
redacao_para_relatorio:
termos_chave:
alerta:
```

## Regra de economia de token

1. Receber ID do bloco.
2. Buscar apenas o bloco codificado necessário.
3. Traduzir somente campos necessários.
4. Salvar tradução em cache.
5. Reusar tradução cacheada se o bloco não mudou.

## Cache

Salvar em:

```text
.claude/norm_library/translations/ptbr/
.claude/norm_library/translations/glossaries/
```

## Separação obrigatória

Sempre separar:

- tradução técnica;
- interpretação operacional;
- redação para relatório;
- lacunas;
- termos-chave.

Nunca misturar tudo em uma única afirmação conclusiva.

## Glossário base — IRATA

- `rope access` = acesso por cordas
- `working line` = linha de trabalho
- `safety line` = linha de segurança
- `back-up device` = dispositivo de backup / dispositivo de segurança, conforme contexto
- `descender` = descensor
- `anchor system` = sistema de ancoragem
- `rescue plan` = plano de resgate
- `exclusion zone` = zona de exclusão / área isolada
- `supervisor` = supervisor
- `technician` = técnico

## Glossário base — Inspeção/END

- `pressure vessel` = vaso de pressão
- `piping` = tubulação
- `storage tank` = tanque de armazenamento
- `remaining life` = vida remanescente
- `corrosion rate` = taxa de corrosão
- `fitness-for-service` = avaliação de aptidão para serviço
- `minimum required thickness` = espessura mínima requerida
- `nominal thickness` = espessura nominal
- `inspection interval` = intervalo de inspeção
- `NDT / non-destructive testing` = END / ensaio não destrutivo
