---
document_id: LEGAL_CONFLICT_RESOLUTION_PROTOCOL
agent: legal-agent
version: "0.1"
status: controlled
created: "2026-06-10"
iteration: "8.2B"
event: "EVT-20260610-045"
active: false
operational_authority: none
---

# LEGAL CONFLICT RESOLUTION PROTOCOL — Protocolo de Conflito Jurídico

> **INVARIANTE ABSOLUTO:** Na presença de conflito não resolvido, o agente **nunca pode** emitir orientação jurídica conclusiva, prazo confirmado, estratégia aprovada ou peça protocolável.
>
> **CONFLITO DETECTADO ≠ CONFLITO RESOLVIDO**
> **CONFLITO RESOLVIDO ≠ ESTRATÉGIA JURÍDICA**
> **FONTE PREVALENTE ≠ ORIENTAÇÃO DEFINITIVA**

---

## 1. Tipos de Conflito

### T-01 — Texto Legal Divergente

**Descrição:** Duas fontes apresentam textos diferentes para o mesmo dispositivo legal.

**Causas comuns:**
- Uma fonte está desatualizada (pré-emenda)
- Erro de compilação em fonte auxiliar
- Consolidação incompleta em uma das fontes

**Protocolo:**
1. Identificar qual fonte tem data de consulta mais recente
2. Aplicar hierarquia de autoridade (LEGAL_SOURCE_AUTHORITY_MATRIX.md)
3. Se ambas são primárias com datas diferentes: preferir a mais recente + declarar incerteza
4. Se primária vs. auxiliar: ignorar auxiliar + consultar primária

**Saída obrigatória:**
```
CONFLITO T-01: textos divergentes em [art./lei].
Fonte A (SRC-XXX, data): [trecho]
Fonte B (SRC-YYY, data): [trecho]
Resolução provisória: [fonte prevalente pela hierarquia].
NECESSÁRIA VALIDAÇÃO HUMANA antes de uso formal.
```

---

### T-02 — Lei Revogada vs. Lei Vigente

**Descrição:** O agente cita ou recebe referência a uma lei que pode ter sido revogada total ou parcialmente.

**Causas comuns:**
- Texto de lei revogada em cache ou fonte auxiliar
- Fonte primária sem compilação de revogação atualizada
- Lei revogada parcialmente — parte do texto ainda vigente

**Protocolo:**
1. Verificar `revoked_status` da norma na fonte primária
2. Se `revoked_status: unknown` → tratar como potencialmente revogada
3. Identificar a norma revogadora quando possível
4. Identificar se a revogação foi total ou parcial
5. Se parcial: declarar quais artigos ainda vigem

**Saída obrigatória:**
```
CONFLITO T-02: lei [X] pode estar revogada total ou parcialmente.
Norma possivelmente revogadora: [Y] — não confirmado.
revoked_status: [active/revoked/partially_revoked/unknown]
NÃO É POSSÍVEL CONFIRMAR VIGÊNCIA.
NECESSÁRIA VERIFICAÇÃO EM FONTE PRIMÁRIA + VALIDAÇÃO HUMANA.
```

---

### T-03 — Jurisprudência Divergente

**Descrição:** Existem decisões judiciais de sentidos opostos sobre a mesma questão jurídica.

**Causas comuns:**
- Turmas distintas do mesmo tribunal com entendimentos opostos
- Posição antiga x posição recente
- Precedente vinculante x entendimento de tribunal inferior
- Tema ainda não pacificado (recurso repetitivo pendente)

**Protocolo:**
1. Identificar se há precedente vinculante (súmula vinculante STF, repetitivo STJ/STF)
2. Se houver: preferir o vinculante + alertar que deve ser aplicado com análise fática
3. Se não houver: declarar divergência + não eleger tese
4. Registrar tribunais, turmas, datas e relatores de cada posição

**Saída obrigatória:**
```
CONFLITO T-03: jurisprudência divergente sobre [questão].
Posição A ([tribunal, turma, data]): [síntese]
Posição B ([tribunal, turma, data]): [síntese]
Precedente vinculante identificado: [sim/não]
[Se sim]: Súmula/repetitivo [nº] prevalece — aplicação fática pendente de análise.
[Se não]: HIPÓTESE JURÍDICA — não constitui tese validada.
NECESSÁRIA VALIDAÇÃO HUMANA.
```

---

### T-04 — Fonte Oficial vs. Fonte Auxiliar

**Descrição:** Uma fonte auxiliar (Jusbrasil, Migalhas, ConJur etc.) apresenta conteúdo diferente de uma fonte oficial.

**Protocolo:**
1. Descartar conteúdo da fonte auxiliar para fins jurídicos
2. Confirmar na fonte oficial
3. Registrar a discrepância como aviso de qualidade da fonte auxiliar

**Saída obrigatória:**
```
CONFLITO T-04: divergência entre fonte oficial [SRC-XXX] e fonte auxiliar [SRC-010/011/012/013].
Resolução: fonte auxiliar descartada para fins jurídicos.
Conteúdo final baseado exclusivamente em [SRC-XXX].
[Aviso de qualidade: fonte auxiliar apresenta dado inconsistente — não usar como referência.]
```

---

### T-05 — Lei Federal vs. Lei Estadual / Municipal

**Descrição:** Uma norma federal e uma norma estadual ou municipal apresentam regras conflitantes sobre a mesma matéria.

**Protocolo:**
1. Identificar a competência constitucional pela matéria (CF/88, Arts. 22, 24, 25, 30)
2. Se competência exclusiva da União: lei federal prevalece
3. Se competência concorrente: lei federal = norma geral; estadual = suplementar
4. Se competência local: lei municipal prevalece dentro do seu âmbito
5. Se conflito não resolucionável pela competência: declarar incerteza + recomendar advogado

**Saída obrigatória:**
```
CONFLITO T-05: norma federal [X] vs. norma [estadual/municipal] [Y].
Competência constitucional: [exclusiva da União / concorrente / local].
Regra de prevalência: [federal / estadual-suplementar / municipal].
[Se incerto]: CONFLITO NÃO RESOLUCIONÁVEL POR ANÁLISE DOCUMENTAL.
NECESSÁRIA VALIDAÇÃO HUMANA.
```

---

### T-06 — Norma Geral vs. Norma Especial

**Descrição:** Uma lei geral e uma lei especial sobre o mesmo tema divergem.

**Princípio aplicável:** *lex specialis derogat legi generali* — a norma especial prevalece sobre a geral no seu âmbito.

**Protocolo:**
1. Identificar se uma lei é formalmente especial em relação à outra
2. Verificar se o caso concreto está dentro do âmbito da lei especial
3. Aplicar a especial dentro do seu âmbito; aplicar a geral fora dele

**Saída obrigatória:**
```
CONFLITO T-06: lei geral [X] vs. lei especial [Y].
Âmbito da lei especial: [descrição].
Caso em análise: [dentro / fora / incerto] do âmbito da lei especial.
Prevalência provisória: [Y se dentro / X se fora / incerto].
[Se incerto]: NECESSÁRIA VALIDAÇÃO HUMANA.
```

---

### T-07 — Norma Antiga vs. Norma Posterior

**Descrição:** Uma norma mais antiga e uma mais recente regulam a mesma matéria de forma diferente.

**Princípio aplicável:** *lex posterior derogat legi priori* — norma posterior revoga anterior no que couber.

**Protocolo:**
1. Verificar se a norma posterior revogou expressamente a anterior
2. Se não: verificar revogação tácita pela incompatibilidade
3. Se a norma posterior é geral e a anterior é especial: verificar T-06
4. Registrar ambas com datas de vigência

**Saída obrigatória:**
```
CONFLITO T-07: norma anterior [X, vigência: data] vs. norma posterior [Y, vigência: data].
Revogação expressa: [sim/não/parcial].
Revogação tácita: [identificada/não identificada/incerta].
Regra de prevalência provisória: [Y como posterior].
[Se especial anterior vs. geral posterior]: ver T-06.
NECESSÁRIA VERIFICAÇÃO DE VIGÊNCIA + VALIDAÇÃO HUMANA.
```

---

### T-08 — Entendimento Não Vinculante vs. Precedente Vinculante

**Descrição:** Um entendimento doutrinário, sumular não vinculante, ou decisão monocrática conflita com um precedente formalmente vinculante (súmula vinculante STF, recurso repetitivo STF/STJ).

**Protocolo:**
1. Identificar o precedente vinculante (súmula vinculante, tema repetitivo)
2. Verificar se o precedente está vigente (não cancelado, não superado)
3. Verificar se os fatos do caso se encaixam no âmbito do precedente
4. Aplicar o vinculante se vigente e aplicável; registrar distinção se não se encaixar

**Saída obrigatória:**
```
CONFLITO T-08: entendimento não vinculante [fonte] vs. precedente vinculante [súmula/tema nº].
Precedente vinculante: [vigente/cancelado/incerto].
Âmbito de aplicação: [compatível/distinto/incerto].
[Se vigente e compatível]: precedente vinculante prevalece.
[Se cancelado ou distinto]: declarar limitação + NECESSÁRIA VALIDAÇÃO HUMANA.
```

---

## 2. Saídas Permitidas em Situação de Conflito

O agente pode emitir APENAS as seguintes conclusões quando há conflito não resolvido:

| Saída | Quando usar |
|---|---|
| `"conflito detectado"` | Sempre que duas fontes divergirem, independentemente do tipo |
| `"fonte insuficiente"` | Quando não há fonte primária disponível para resolver o conflito |
| `"necessária validação humana"` | Sempre — nenhum conflito é resolvido sem esta declaração |
| `"não é possível confirmar vigência"` | Quando revoked_status não pode ser verificado |
| `"hipótese jurídica — não constitui tese validada"` | Quando uma posição pode ser sustentada mas não confirmada |
| `"conflito não resolucionável por análise documental"` | Quando o conflito exige interpretação além do texto |

---

## 3. Saídas Proibidas em Situação de Conflito

**NUNCA emitir, sob qualquer circunstância, com conflito aberto:**

| Saída proibida | Razão |
|---|---|
| Prazo confirmado | Prazo pode estar suspenso, alterado ou baseado em norma conflitante |
| Estratégia aprovada | Estratégia com premissa normativa conflitante é estratégia inválida |
| Peça protocolável | Peça baseada em tese conflitante pode ser nula ou prejudicial |
| Orientar conduta jurídica definitiva | Conduta baseada em fonte conflitante pode causar dano processual |
| "A lei diz que..." sem indicar conflito | Omitir conflito é desinformar o operador |
| Afirmar que precedente se aplica | Conflito de jurisprudência impede afirmação de aplicação |

---

## 4. Template de Saída Padrão em Conflito

```
─── CONFLITO JURÍDICO DETECTADO ──────────────────────────────
Tipo: [T-01 a T-08]
Descrição: [breve descrição do conflito]

Fonte A: [SRC-XXX | tipo | data | posição/texto relevante]
Fonte B: [SRC-YYY | tipo | data | posição/texto relevante]

Hierarquia aplicada: [fonte prevalente provisória ou "incerta"]
Resolução disponível: [sim — com caveats / não — incerteza persiste]

Status epistêmico: CONFLITO NÃO RESOLVIDO / CONFLITO PROVISORIAMENTE RESOLVIDO
Confiança: baixa / média (nunca alta em conflito)

Ação recomendada:
  1. Validação humana obrigatória
  2. Consultar advogado antes de qualquer uso formal
  3. Verificar fonte primária diretamente: [SRC-XXX URL]

⚠ [saídas proibidas listadas acima NÃO foram emitidas]
───────────────────────────────────────────────────────────────
```

---

## 5. Escalada para FW-GOVERNOR

O agente deve escalar para `fw-governor` quando:

- Conflito entre fontes envolve decisão de alto risco processual (preclusão, decadência, nulidade)
- Operador pressiona para concluir orientação com conflito ativo
- Conflito entre LINDB, CF/88 e norma especial não pode ser resolvido com hierarquia conhecida
- Conflito envolve matéria constitucional com risco de nulidade de ato processual

---

## 6. Relação com Outros Documentos

| Documento | Relação |
|---|---|
| `LEGAL_SOURCE_AUTHORITY_MATRIX.md` | Define hierarquia de fontes usada nos protocolos T-01 a T-08 |
| `LEGAL_UPDATE_POLICY.md` | Define como tratar fontes desatualizadas — alimenta T-02 e T-07 |
| `LEGAL_SEED_CORPUS_MANIFEST.yaml` | Corpus base — quando uma norma não está no corpus, risk aumenta |
| `AGENT.md §4` | Firewalls jurídicos que complementam este protocolo |
| `AGENT.md §8` | Separação epistêmica — aplica-se a todos os tipos de conflito |

---

*Gerado em Iteração 8.2B — EVT-20260610-045. status:draft / active:false / operational_authority:none.*
