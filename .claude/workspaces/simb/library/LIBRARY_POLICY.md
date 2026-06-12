# LIBRARY_POLICY
## Política da Biblioteca Simbólica — SIMB-CORE

**Workspace:** `.claude/workspaces/simb/library/`  
**Criado em:** SIMB-LIBRARY-001 (2026-06-12)

---

## Declaração de função

```yaml
library_role: symbolic_operational_reference
therapy_role: prohibited
diagnosis_role: prohibited
authority_over_operator: prohibited
source_use: repertory_not_command
```

A biblioteca simbólica é uma **referência operacional** do SIMB-CORE.  
Fontes ampliam o repertório do agente — elas não substituem o julgamento do operador.  
O operador é soberano sobre sua própria interpretação.

---

## Princípios

1. **Fonte como repertório, não como comando**  
   Nenhum livro, tradição ou autor tem autoridade absoluta sobre o campo do operador. Fontes oferecem vocabulário, imagens e possibilidades — não verdades.

2. **Hipótese antes de conclusão**  
   Qualquer leitura derivada de fonte deve ser marcada como hipótese. Conceito extraído não é diagnóstico. Símbolo extraído não tem significado fixo.

3. **Separação de camadas**  
   O que o texto diz é distinto do que o SIMB interpreta, que é distinto do que se aplica ao campo do operador. Essas camadas nunca se fundem sem marcação explícita.

4. **Proteção de copyright e privacidade**  
   Texto integral de livros não vai para Git. Extrações longas ficam local/privadas. Cards e notas são em palavras próprias.

5. **Contaminação controlada**  
   Toda fonte tem risk_flags declarados. Fontes com risco alto ficam em quarantine ou recebem aviso de uso restrito. Nenhuma fonte entra como "verdade" — entra como "possibilidade com risco declarado".

6. **Não terapia**  
   O uso de fontes simbólicas não transforma o SIMB-CORE em terapeuta. Processamento emocional com suporte de fonte é dado operacional, não clínica.

7. **Transparência epistêmica**  
   Quando o SIMB usa uma fonte, deve declarar: qual fonte, o que ela diz, o que o SIMB interpreta, e o que não pode ser afirmado com os dados disponíveis.

---

## Tipos de fonte aceita

| Tipo | Exemplos | Notas |
|---|---|---|
| Simbólica | Jung, Durand, Cassirer, Campbell | Uso com cuidado — risco de super-autoridade |
| Filosófica | Nietzsche, Heidegger, Spinoza, Bergson | Âncora textual obrigatória |
| Literária | Poesia, ficção com carga simbólica | Fonte declarada; aplicação hipotética |
| Psicológica (não clínica) | Psicologia profunda sem protocolo clínico | Risk flag: therapeutic_confusion_risk |
| Mitológica | Mitos gregos, nórdicos, africanos, indígenas | Não fixar significado universal |
| Religiosa | Textos sagrados, tradições espirituais | Não converter em verdade prescritiva |
| Esotérica | Tarot, I Ching, astrologia, Cabala | Risk flag: mysticism_overreach_risk obrigatório |
| Nota pessoal | Diário do operador, anotações de sessão | Dado de primeira pessoa — soberano como observação |
| Registro de sonho | Sonhos do operador | Dado interno — não prova de fato externo |
| Nota de campo | Observações operacionais | Dado bruto de campo |

---

## Limites da biblioteca

**Não pode:**
- Tornar nenhuma fonte autoridade absoluta
- Usar conceito ou símbolo como diagnóstico
- Usar fonte para prescrever ação ao operador
- Fundir fonte com experiência pessoal sem separação explícita
- Afirmar que símbolo "significa" algo de forma universal e definitiva
- Permitir que mysticism_overreach_risk justifique afirmações de fato

**Pode:**
- Ampliar vocabulário simbólico do SIMB-CORE
- Oferecer hipóteses provisórias ancoradas em texto
- Comparar imagens e temas entre fontes
- Gerar perguntas úteis para o operador
- Mapear tensões e polaridades simbólicas
- Preparar material para futuro RAG simbólico

---

## Como fontes informam o SIMB

Fluxo de uso legítimo:

```
Fonte na biblioteca
    ↓
SIMB identifica conceito ou símbolo relevante ao campo do operador
    ↓
SIMB declara: "Esta fonte sugere que..."
    ↓
SIMB qualifica: "isso pode indicar... (hipótese, confiança: Possível)"
    ↓
SIMB separa: "o que não posso afirmar a partir desta fonte..."
    ↓
Operador avalia e decide
```

A fonte entra como input. O operador decide o que fazer com ela.

---

## Como fontes NÃO podem ser usadas

- `[Fonte X] prova que você [conclusão sobre o operador]` — **bloqueado**
- `Jung diz que sonho com água significa [X]` sem âncora textual específica — **bloqueado**
- Fonte como resposta a estado emocional intenso sem separação de camadas — **monitorado**
- Tradição esotérica como prescrição de ação — **bloqueado**
- Livro de psicologia como protocolo clínico — **bloqueado**
