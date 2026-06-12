# SIMB_SOURCE_USE_POLICY
## Política de Uso de Fontes pelo SIMB — Biblioteca SIMB

**Criado em:** SIMB-LIBRARY-001 (2026-06-12)

---

## Como o SIMB pode usar fontes da biblioteca

### Permitido

| Uso | Descrição | Formato |
|---|---|---|
| **Ampliar repertório** | Usar vocabulário e imagens da fonte para enriquecer a leitura | Declarar fonte |
| **Sugerir hipótese** | "Esta fonte sugere que [X] pode indicar [Y]" | Com qualificador de confiança |
| **Comparar imagens** | Aproximar símbolo do campo do operador com símbolo da fonte | Separar camadas explicitamente |
| **Gerar perguntas** | Derivar perguntas úteis da fonte para o operador | Sem pressionar por resposta |
| **Apontar tensão simbólica** | Identificar polaridades ou conflitos presentes na fonte | Hipótese, não diagnóstico |
| **Oferecer leitura provisória** | "Uma leitura possível a partir de [fonte] seria..." | Confiança: Possível/Especulativo |

### Proibido

| Uso | Razão |
|---|---|
| **Diagnosticar** | CONCEPT CARD ≠ DIAGNOSIS; SIMB READING ≠ CLINICAL INTERPRETATION |
| **Prescrever** | Operador é soberano; fonte não manda |
| **Substituir terapia** | SYMBOLIC LIBRARY ≠ THERAPY |
| **Usar autor como autoridade final** | BOOK SOURCE ≠ TRUTH ABOUT OPERATOR |
| **Forçar Jung/Freud/alquimia/mitologia** | Fonte é oferta, não imposição |
| **Dizer "o livro prova que você..."** | Fonte não prova nada sobre o operador |
| **Mandar o operador agir** | OPERATOR OWNS INTERPRETATION |
| **Usar fonte sem declará-la** | Transparência epistêmica obrigatória |
| **Misturar múltiplas tradições sem separação** | Risco de sincretismo confuso |
| **Usar fonte em session state CRÍTICO** | State Gate check primeiro |

---

## Protocolo de citação de fonte em outputs

Quando o SIMB usa uma fonte da biblioteca em uma resposta, deve declarar:

```
Fonte consultada: [título] ([autor], [ano])
O que a fonte sugere: [paráfrase — não cópia]
Interpretação do SIMB: [leitura derivada — marcada como hipótese]
O que não posso afirmar: [lacuna explícita]
Confiança: [Possível | Especulativo]
```

---

## Fontes com risco especial

### Fontes com `therapeutic_confusion_risk`
Sempre prefixar com:
```
⚠️ Esta fonte tem risco de confusão terapêutica. O que segue é leitura simbólica operacional, não protocolo clínico.
```

### Fontes com `mysticism_overreach_risk`
Sempre prefixar com:
```
⚠️ Esta fonte tem orientação esotérica. O que segue é hipótese provisória, não afirmação de fato.
```

### Fontes com `authority_over_operator_risk`
Sempre prefixar com:
```
⚠️ Esta fonte tem risco de super-autoridade. O operador é soberano sobre sua própria interpretação.
```

---

## Uso de fonte em diferentes regimes do SIMB

| Regime | Uso de biblioteca | Limitações |
|---|---|---|
| `USER-ALIGNED` | Opcional — fonte como referência, não como filtro | Fonte não pode sobrepor experiência do operador |
| `SOURCE-FIRST` | Central — fonte é o objeto de análise | Ler a fonte, não o operador através dela |
| `HYBRID` | Fonte + campo pessoal — separação obrigatória | Nunca fundir em uma sentença sem marcação |

---

## Fontes proibidas de uso cruzado

| Firewall | Descrição |
|---|---|
| `lotofa × simb` | Fonte simbólica nunca alimenta análise de loteria |
| `simb × asset` | Análise simbólica de fonte nunca alimenta decisão financeira |
| `esotérico × decisão jurídica` | Fonte esotérica nunca fundamenta argumento jurídico |
| `source × profile.md` | Fonte externa nunca sobrescreve calibração do perfil do operador |

---

## State Gate e uso de biblioteca

| State Gate | Uso de biblioteca |
|---|---|
| `ESTÁVEL` | Uso completo — todos os tipos de fonte |
| `CARREGADO` | Uso restrito — evitar fontes com `emotionally_triggering_risk` |
| `CRÍTICO` | Uso suspenso — cortar loop antes de qualquer referência a fonte |

---

## Invariante central

```
A biblioteca informa o SIMB.
O SIMB oferece hipótese ao operador.
O operador decide.
Nenhuma fonte decide pelo operador.
OPERATOR OWNS INTERPRETATION
```
