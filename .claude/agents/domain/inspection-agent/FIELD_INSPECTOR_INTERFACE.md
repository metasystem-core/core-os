---
name: inspection-agent-field-inspector-interface
description: Interface entre o inspetor humano e o inspection-agent. Define entradas mínimas, dados críticos, formato de saída esperado, como tratar lacunas, pressão, conflito, taxa anômala, mecanismo de dano, seleção END e autoridade humana.
type: interface-protocol
agent: inspection-agent
audience: inspetor-habilitado, operador-primario
status_required: review
active_required: false
created: "2026-06-10"
iteration: "7.4"
event: "EVT-20260610-039"
---

# INTERFACE COM O INSPETOR HUMANO — inspection-agent

> **O agente apoia a estruturação técnica, mas não aprova, não libera, não assina e não substitui o inspetor/RT/procedimento.**

---

## 1. Quem Usa Este Documento

Este documento é para o **inspetor humano** (ou operador primário atuando em contexto de inspeção) que irá interagir com o `inspection-agent` durante uso monitorado.

Objetivo: garantir que a interface humano-agente produza outputs tecnicamente úteis sem contornar a autoridade humana.

---

## 2. Como Interagir com o Agente

### Modo correto de acionamento:

```
"Tenho os seguintes dados de inspeção:
TAG: [identificação]
Tipo: [vaso / tubulação / tanque / trocador]
Fluido: [fluido de processo]
PMTA: [valor em bar ou MPa]
Espessura nominal: [mm]
Espessura mínima admissível: [mm]
Medição atual: [mm no ponto P-XX]
Histórico: [medições anteriores com datas, se disponível]
Método: [US / VT / LP / PM / outro]
Norma: [NR-13 / ASME / API — com confidence:referencial]
Critério de aceitação: [espessura mínima / requisito do PIT]

Objetivo: [estruturar laudo / identificar lacunas / hipótese de mecanismo / seleção END / verificar conflito]"
```

### O que o agente **não** faz automaticamente:

- Não preenche dados que você não forneceu;
- Não assume PMTA, espessura mínima, material ou fluido por padrão;
- Não confirma vigência de norma (confidence:referencial em toda referência);
- Não assina o laudo.

---

## 3. Entradas Mínimas Recomendadas

Para qualquer análise técnica, fornecer:

| Campo | Obrigatório | Nota |
|---|---|---|
| TAG / identificação do equipamento | sim | — |
| Tipo de equipamento | sim | vaso, tubulação, tanque, trocador |
| Fluido de processo | sim | influencia mecanismo de dano |
| PMTA ou pressão de operação | sim | para NR-13 e critério de aceitação |
| Espessura nominal | sim | sem isso, análise de vida é impossível |
| Espessura mínima admissível | sim | critério de aceitação central |
| Medição atual (ponto, valor, método) | sim | dado de campo primário |
| Histórico de medições (datas + valores) | recomendado | para taxa de corrosão |
| Norma / procedimento aplicável | recomendado | confidence:referencial |
| Critério de aceitação declarado | recomendado | PIT do cliente ou norma |
| Objetivo da consulta | sim | estruturar laudo? lacunas? hipótese? |

**Se qualquer campo obrigatório estiver ausente:** o agente deve declarar LACUNA. Não contorne.

---

## 4. Como Tratar Lacunas

O agente irá declarar:

```
LACUNA — dado crítico ausente: [campo].
Análise de [escopo] não pode ser concluída sem este dado.
Ação necessária: [providenciar dado] antes de prosseguir.
```

**O que fazer:**

| Situação | Ação do inspetor |
|---|---|
| Dado disponível mas não fornecido | Fornecer o dado e prosseguir |
| Dado genuinamente indisponível | Registrar como limitação no laudo — não prosseguir com hipótese |
| Dado parcial (ex.: 1 ponto sem histórico) | Declarar no laudo: análise parcial, conclusão limitada ao ponto medido |
| Dado verbal (ex.: "PMTA em torno de 10 bar") | Não aceitar como definitivo — exigir documentação antes de conclusão |

**Nunca:** forçar o agente a produzir análise com dado ausente. Se a lacuna for crítica, o laudo não pode ser concluído até que o dado seja providenciado.

---

## 5. Como Tratar Pressão Operacional

Se o input vier com urgência ("produção parada", "cliente cobrando", "pode passar assim?"):

**O agente deve emitir:**

```
PRESSÃO OPERACIONAL DETECTADA.
Critério técnico não será reduzido por prazo, urgência ou conveniência operacional.

[+ declaração de lacuna se dado estiver ausente]

ACEITÁVEL TECNICAMENTE ≠ LIBERADO.
A decisão de continuidade operacional com lacuna crítica compete ao RT + cliente + procedimento aprovado.
```

**Papel do inspetor:**

1. **Não pressionar o agente** a reduzir critério — o firewall é constitucional;
2. Registrar formalmente a pressão operacional no laudo (nota de contexto);
3. Escalar para RT com a declaração de lacuna do agente como insumo;
4. A decisão de continuidade com risco é da autoridade humana competente, com ciência formal.

---

## 6. Como Tratar Conflito de Dados

Se nova medição divergir de laudo anterior sem justificativa:

**O agente deve emitir:**

```
CONFLITO IDENTIFICADO — Medição x Laudo Anterior
Tipo: medição atual diverge de medição anterior sem justificativa documental
Evidência A: [dado anterior + data]
Evidência B: [dado atual + data]
Variação: [delta] em [período]
Risco de conclusão indevida: alto
Ação recomendada: verificar ponto + pontos vizinhos antes de conclusão
```

**Papel do inspetor:**

1. **Nunca ignorar conflito** — conflito não resolvido invalida a conclusão;
2. Rechequear o ponto de medição com instrumento calibrado;
3. Medir pontos vizinhos para verificar se é localizado ou generalizado;
4. Investigar mudança de condição operacional (fluido, temperatura, parada, etc.);
5. Documentar o conflito no laudo, mesmo que resolvido, com explicação rastreável.

---

## 7. Como Tratar Taxa de Corrosão Anômala

O agente pode emitir alerta de taxa anômala quando:

- Divergência histórica identificada;
- Aceleração de perda sem explicação;
- Perda localizada relevante;
- Medição incompatível com histórico.

**O agente NÃO inventa um limite universal de taxa anômala.**

**Papel do inspetor:**

1. Avaliar se a taxa é anômala **para aquele equipamento específico** (material, fluido, histórico);
2. Verificar se houve mudança de condição operacional no período;
3. Calcular taxa por período e comparar com histórico anterior, se disponível;
4. Se taxa anômala confirmada: acionar RT + investigação de mecanismo de dano;
5. Documentar avaliação no laudo com dado rastreável.

---

## 8. Como Tratar Hipótese de Mecanismo de Dano

O agente usa `damage_mechanism_new.md` como protocolo primário. Toda hipótese sai com etiqueta:

| Etiqueta | Significado |
|---|---|
| `[Confirmado por evidência]` | Dado de campo + ensaio confirmam o mecanismo |
| `[Provável]` | Compatível com condições, mas falta confirmação direta |
| `[Possível]` | Condições permitem, mas sem evidência direta |
| `[Especulativo — não usar como conclusão]` | Baseado em suposição — não incluir no laudo |
| `[Mecanismo não determinável]` | Evidência insuficiente para qualquer hipótese |

**Papel do inspetor:**

1. **Nunca elevar a etiqueta** (transformar [Especulativo] em [Confirmado]) sem dado que justifique;
2. Confirmar hipótese [Provável] com inspeção física complementar (remoção de isolamento, VT direto, etc.);
3. Se etiqueta for [Especulativo]: não incluir no laudo como conclusão — registrar como "a investigar";
4. A confirmação do mecanismo de dano é decisão do inspetor + RT, com dado físico real.

---

## 9. Como Tratar Seleção END/NDT

O agente usa `ndt_selection_new.md` como protocolo primário. Toda sugestão segue:

```
Pergunta técnica: [o que preciso saber?]
END recomendado: [técnica]
Justificativa: [por que essa técnica para essa pergunta]
Limitações: [o que essa técnica não detecta neste cenário]
Critério de aceitação a consultar: [norma / PIT]
Norma/procedimento aplicável: [referência — confidence:referencial]
```

**Papel do inspetor:**

1. A sugestão é apoio técnico — **não é procedimento aprovado**;
2. O procedimento formal de END deve ser aprovado pelo cliente/contratante;
3. O executor deve ter qualificação adequada (ISO 9712, nível e método);
4. Se o agente não incluir critério de aceitação: exigir o dado antes de executar o ensaio;
5. SELEÇÃO END/NDT SUGERIDA ≠ PROCEDIMENTO APROVADO — sempre.

---

## 10. Como Manter Autoridade Humana

A autoridade técnica e de decisão sobre o equipamento é **exclusivamente humana**.

| Quem decide | O quê |
|---|---|
| Inspetor qualificado | Julgamento técnico de campo, preenchimento e assinatura do laudo |
| Responsável Técnico (RT) | Aprovação técnica final, ART, responsabilidade pelo laudo |
| Cliente/contratante | Aprovação do resultado e critério de aceitação |
| Procedimento aprovado | PIT, POI, norma do cliente — define o critério vinculante |

**O agente:**

- Estrutura dados → declara lacunas → sugere hipóteses com etiqueta → sugere END;
- Nunca decide, nunca aprova, nunca assina;
- Output é sempre "apoio ao inspetor" — o inspetor decide o que incorporar ao laudo.

**Quando o julgamento do inspetor em campo diverge do output do agente: o inspetor prevalece.**

Registrar a divergência no log de uso monitorado para aprendizado do sistema.

---

## 11. Checklist de Revisão Pós-Output

Antes de incorporar qualquer output do agente ao laudo:

- [ ] O output tem nota explícita de que é apoio, não laudo assinado?
- [ ] Campo "Responsável técnico" está marcado para preenchimento humano?
- [ ] Toda hipótese de mecanismo de dano tem etiqueta de certeza?
- [ ] Toda norma citada tem `confidence:referencial` ou foi verificada diretamente?
- [ ] Toda lacuna foi resolvida ou documentada como limitação?
- [ ] A seleção END/NDT está tratada como sugestão, não procedimento aprovado?
- [ ] O output não contém aprovação, liberação ou conclusão definitiva?

Se qualquer item falhar: corrigir antes de incorporar ao laudo.

---

*Criado em Iteração 7.4 — 2026-06-10*
*Interface para uso monitorado — inspection-agent — status: review — active: false*
*Operador: operador-primario*
