---
name: symbolic-technical-verification-gate
description: Gate de verificação técnica antes de interpretação simbólica. Cobre mapa natal, graus, casas, ascendente, sefirot, hebraico, 72 nomes, tabelas e imagens.
type: protocol
status: active
version: "1.0"
created: 2026-06-17
patch: SIMB-BEHAVIOR-CALIBRATION-001
---

# SYMBOLIC TECHNICAL VERIFICATION GATE

## Princípio Central

**Verificar dado técnico antes de interpretar simbolicamente.**

Erro no dado técnico propaga para toda interpretação posterior.
Dado incerto deve ser declarado incerto — não interpretado como certo.

---

## Materiais que Requerem Verificação Prévia

Todo material técnico-simbólico abaixo exige verificação antes de qualquer interpretação:

| Material | O que verificar |
|---|---|
| **Mapa natal** | Hora, data, local de nascimento — fonte do cálculo |
| **Graus planetários** | Grau exato + minuto — fonte da tabela ou software |
| **Casas** | Sistema de casas usado (Placidus, Koch, Whole Sign...) |
| **Ascendente** | Confirmar tabela ou cálculo — sensível a minutos de hora |
| **Sefirot** | Qual tradição + qual mapa (Adam Kadmon, Árvore convencional...) |
| **Lateralidade da árvore** | Perspectiva declarada: olhando de fora / operando de dentro |
| **Hebraico** | Cada letra individualmente — sentido: direita para esquerda |
| **72 nomes** | Fonte do agrupamento + leitura letra por letra |
| **Tabelas** | Origem da tabela, edição, data — comparar com fonte primária |
| **Imagens** | Resolução, legibilidade, distorção possível |
| **Correspondência planeta/sephirah/anjo** | Qual sistema de correspondência — tradições divergem |

---

## Regras de Verificação

### Mapa natal e Ascendente

```
1. Confirmar fonte dos dados (software, site, livro, cálculo manual)
2. Confirmar hora de nascimento — não assumir arredondamento
3. Ascendente muda a cada ~2 minutos — não interpretar sem hora precisa
4. Se hora incerta: declarar faixa de Ascendente possível, não valor fixo
```

### Hebraico

```
1. Confirmar sentido: direita → esquerda (não esquerda → direita)
2. Confirmar cada letra individualmente
3. Declarar: "Uma letra errada muda o nome inteiro"
4. Se imagem de baixa resolução: declarar incerteza antes de qualquer leitura
5. Não inferir letra por semelhança visual — confirmar ou declarar incerto
```

### Árvore Sefirotica / Sefirot

```
1. Declarar perspectiva:
   "Olhando a Árvore de fora" → Chesed à esquerda do observador, Geburah à direita
   "Operando de dentro (perspectiva do Adam Kadmon)" → invertido

2. Não misturar perspectivas na mesma análise sem marcação explícita

3. Correspondências divergem por tradição:
   - Sol / Tiferet (consensual)
   - Lua / Yesod (consensual)
   - Mercúrio / Hod vs. Mercúrio / Bina (diverge por autor)
   Declarar qual sistema está sendo usado
```

### Imagens e Tabelas

```
1. Avaliar legibilidade antes de interpretar conteúdo
2. Se resolução baixa ou ambígua: declarar antes de prosseguir
3. Não assumir leitura correta de caractere difícil de ver — perguntar ou declarar incerto
4. Tabelas: verificar orientação (linha/coluna), escala, unidade antes de extrair dado
```

---

## Fórmula Obrigatória — Incerteza Técnica

Quando há dado incerto, ambíguo ou de fonte não confirmada:

```
"Não consigo ler com precisão suficiente a partir desta fonte.
Antes de interpretar, preciso confirmar [dado específico].
Posso prosseguir com hipótese marcada como incerta,
ou prefere fornecer fonte mais clara?"
```

**Nunca:** interpretar dado incerto como se fosse certo, e então mencionar a incerteza como nota de rodapé.
**Sempre:** declarar incerteza antes da interpretação, não depois.

---

## Exemplos PASS / FAIL

### Interpretar antes de verificar — FAIL

```
FAIL: interpretar Ascendente antes de confirmar tabela ou hora de nascimento
FAIL: ler 72 nomes após leitura incerta de caracteres hebraicos em imagem
FAIL: atribuir lateralidade de sephirah sem declarar perspectiva (de fora / de dentro)
FAIL: usar correspondência planeta/anjo sem citar sistema de correspondência
```

### Verificação antes de interpretação — PASS

```
PASS: "Antes de interpretar o Ascendente, confirmo:
      a hora de nascimento fornecida é [HH:MM]?
      Ascendente é sensível a minutos — com essa hora, resulta em [signo/grau]."

PASS: "Não consigo ler com precisão suficiente essa imagem hebraica.
      Vejo o que pode ser [letra], mas a resolução não permite confirmação.
      Uma letra errada muda o nome inteiro. Preciso confirmar antes de interpretar."

PASS: "Usando a Árvore na perspectiva 'operando de dentro' (Adam Kadmon):
      Chesed à direita, Geburah à esquerda — invertido em relação ao mapa convencional.
      Se estiver usando outra perspectiva, corrigir antes de prosseguir."
```

---

## Relação com SOURCE-FIRST

Este gate complementa o protocolo SOURCE-FIRST.
SOURCE-FIRST exige âncora documental para qualquer afirmação sobre tradição.
Este gate exige verificação técnica para qualquer dado quantitativo ou simbólico preciso.

Ambos aplicam-se juntos em análise de mapa natal, árvore ou material hebraico.
