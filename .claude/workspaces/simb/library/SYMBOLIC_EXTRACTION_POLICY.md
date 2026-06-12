# SYMBOLIC_EXTRACTION_POLICY
## Política de Extração Simbólica — Biblioteca SIMB

**Criado em:** SIMB-LIBRARY-001 (2026-06-12)

---

## Princípio fundamental

Extração é sempre **reformulação em palavras próprias**.  
Não é cópia. Não é transcrição. Não é OCR de capítulo.  
O agente lê, digere e reescreve em linguagem operacional.

---

## O que é permitido extrair

### 1. Conceitos em palavras próprias
- Definição curta do conceito no contexto da fonte
- Como o autor usa o conceito (sem copiar o texto)
- Por que pode ser útil para o SIMB
- Riscos de má interpretação

**Limite:** concept_card deve ter no máximo 300-400 palavras no corpo.

### 2. Símbolos recorrentes
- Nome do símbolo
- Campo temático (quais temas o símbolo toca na fonte)
- Como aparece na tradição da fonte
- O que o símbolo NÃO significa de forma definitiva

**Limite:** symbol_card deve ter no máximo 300-400 palavras no corpo.

### 3. Temas e tensões
- Polaridades principais da fonte (ex: luz/sombra, consciente/inconsciente)
- Tensões estruturais presentes no texto
- Perguntas que a fonte levanta

### 4. Perguntas úteis
- Perguntas de baixa pressão derivadas da fonte
- Sem presumir resposta
- Aplicáveis ao campo do operador sem forçar diagnóstico

### 5. Mapas de autor
- Tradição do autor, período, contexto
- Conceitos centrais e símbolos principais
- Risco de super-autoridade
- Como usar sem transformar em oráculo

### 6. Notas de leitura curtas
- Resumo em poucas frases do que foi lido
- O que chamou atenção
- O que pode ser explorado depois
- Riscos identificados

---

## O que é proibido extrair

| Proibição | Razão |
|---|---|
| Copiar capítulos ou páginas longas | Copyright e risco de confundir texto com análise |
| Copiar parágrafos sem marcação como citação | Copyright |
| Transformar símbolo em significado fixo e universal | Viola SYMBOL CARD ≠ FIXED MEANING |
| Transformar conceito em diagnóstico do operador | Viola CONCEPT CARD ≠ DIAGNOSIS |
| Misturar fonte com diário pessoal sem separação | Viola separação de camadas SOURCE-FIRST |
| Afirmar que sonho "significa" algo universalmente | Viola SIMB READING ≠ CLINICAL INTERPRETATION |
| Extrair protocolo clínico de texto psicológico | Viola therapeutic_confusion_risk |
| Usar extração esotérica como prova de fato | Viola mysticism_overreach_risk |
| Versionar PDF ou OCR longo | Viola RAW BOOK ≠ GIT CONTENT |

---

## Formato de extração por tipo

### Concept Card
```
Fonte → Identificar conceito relevante → Parafrasear em 3-5 frases → 
Contextualizar no corpo da obra → Declarar uso permitido → Declarar uso proibido → 
Declarar risk notes → Listar símbolos relacionados → Criar perguntas para o operador
```

### Symbol Card
```
Fonte(s) → Identificar símbolo recorrente → Mapear campo temático → 
Declarar tradições onde aparece → Declarar o que NÃO é significado fixo → 
Sugerir usos provisórios → Declarar usos proibidos → Criar perguntas de baixa pressão
```

### Reading Note
```
Leitura → Resumir em palavras próprias (máx. 1 parágrafo) → 
Listar conceitos capturados → Listar símbolos capturados → 
Explicar utilidade para o SIMB → Declarar riscos/flags → 
Indicar próximas extrações
```

### Author Map
```
Identificar autor → Resumir tradição e período → Listar conceitos centrais → 
Mapear campos simbólicos → Declarar riscos (super-autoridade, misticismo, etc.) → 
Definir como usar e como não usar
```

---

## Tamanho máximo de trechos literais

Se um trecho literal for absolutamente necessário para ancorar a leitura:

- **Máximo:** 2-3 frases
- **Formato obrigatório:**
  ```
  > "[trecho]" (AUTOR, Título, Ano, p. XX)
  ```
- **Proibido:** trechos sem marcação de citação
- **Proibido:** trechos de mais de 3 frases consecutivas

---

## Separação de camadas em extração HYBRID

Quando a extração mistura fonte externa com campo do operador:

```yaml
camada_fonte: "O que o texto diz"
camada_leitura: "O que o SIMB interpreta da fonte"
camada_aplicacao: "Como isso pode tocar o campo do operador (hipótese)"
camada_lacuna: "O que não pode ser afirmado sem mais dados"
```

Nunca fundir as camadas em uma única sentença sem marcação.

---

## Invariantes de extração

```
CONCEPT CARD ≠ DIAGNOSIS
SYMBOL CARD ≠ FIXED MEANING
EXCERPT ≠ FULL TEXT
READING ≠ CLINICAL INTERPRETATION
SOURCE SAYS ≠ OPERATOR MUST
AUTHOR ≠ ORACLE
TRADITION ≠ UNIVERSAL LAW
OPERATOR OWNS INTERPRETATION
```
