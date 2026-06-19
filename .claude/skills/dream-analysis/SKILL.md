---
skill_id: dream-analysis
name: dream-analysis
description: Use para registrar, organizar e fazer leitura provisória de sonhos do operador — preservando relato bruto, evitando diagnóstico, prescrição, presságio ou dicionário fixo de símbolos. Subskill especializada de simb-core.
status: draft_review
core_type: specialized
domain: SIMB/Iris
priority: high
risk_level: high
parent_skill: simb-core
source_of_truth: library/protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md
source_id: SRC-010_hall_jungian_dream_interpretation
source_author: James A. Hall, M.D.
source_weight: N3
operational_scope: symbolic_dream_work_non_clinical
clinical_authority: none
cards_hall:
  - CON-036_dream-ego-nao-e-ego-desperto
  - CON-037_compensacao-tres-modos
  - CON-038_amplificacao-em-ordem
  - CON-039_serie-de-sonhos-imagens-relacionadas
  - PROT-004_inexaustibilidade-da-leitura-onirica
  - PROT-005_registro-bruto-antes-de-interpretacao
  - RISK-002_reducao-arquetipica
registries:
  - operator_context/DREAM_REGISTRY.md
  - operator_context/SYMBOL_REGISTRY.md
protocol_usage: gateway — o protocolo completo em source_of_truth é a fonte de verdade para o fluxo de 20 seções e 16 firewalls
---

# dream-analysis

## 1. Purpose

Skill de trabalho onírico não-clínico da Iris. Serve para:

- Registrar relato bruto de sonho do operador com fidelidade máxima.
- Organizar entradas de sonho no DREAM_REGISTRY e imagens recorrentes no SYMBOL_REGISTRY.
- Produzir leitura provisória ancorada no material e no contexto do operador — explicitamente aberta à revisão.
- Rastrear séries de sonhos, variações de imagens e transformações ao longo do tempo.
- Aplicar amplificação simbólica em ordem (pessoal → cultural → arquetípica), sem salto de camadas.

**O protocolo completo** (20 seções, 16 firewalls, output contract) está em:
```
library/protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md
```
Este SKILL.md é gateway. Para o fluxo detalhado de cada fase, consultar o protocolo.

---

## 2. When to use

Ativar quando o input envolver:

- Operador relata sonho para trabalho simbólico.
- Operador quer apenas registrar sonho (sem leitura imediata).
- Operador quer leitura provisória de sonho recente ou antigo.
- Sonho tem símbolo recorrente ou imagem já presente em outros sonhos.
- Sonho faz parte de série — ou o operador verbaliza recorrência.
- Sonho tem alta carga afetiva ao acordar.
- Sonho envolve pessoa real (familiar, conhecido, figura pública).
- Sonho tem imagem numinosa, sexual, agressiva, de morte ou de lucidez.
- Operador quer atualizar DREAM_REGISTRY ou SYMBOL_REGISTRY.

---

## 3. When not to use

Não usar para:

- Diagnóstico clínico ou psiquiátrico.
- Prognóstico de saúde ou comportamento.
- Decisão médica, hospitalização, recomendação de medicação.
- Decisão jurídica ou fundamentação de argumento legal.
- Decisão financeira, investimento, contrato.
- Ordem de ação concreta ("o sonho diz que você deve X").
- Presságio literal de evento futuro.
- Confirmar destino, vocação ou sinal sobrenatural.
- Justificar aproximação ou ação relacional a partir de conteúdo onírico.
- Substituir consentimento ou contexto real por conteúdo de sonho.
- Interpretar quando o operador pediu explicitamente só registro.
- Qualquer domínio fora do escopo: terapia, psicanálise, prática clínica.

---

## 4. Required inputs

Para iniciar o protocolo, o operador deve fornecer ao menos:

1. **Relato bruto** — texto livre; qualquer extensão; fragmentos são dados válidos.
2. **Contexto mínimo** — o que estava acontecendo na vida no período; estado ao acordar.

Elementos adicionais úteis (não obrigatórios):
- Data do sonho (se lembrada).
- Afeto ao acordar (medo, alívio, confusão, tristeza, euforia).
- Pessoas reais envolvidas, se houver.
- Grau de certeza/incerteza na memória do sonho.
- Autorização explícita para registro, leitura, e atualização de registries.

**Se relato ou contexto estiverem ausentes:** perguntar antes de avançar. Não preencher lacunas com inferência.

---

## 5. Output contract

Formato padrão de resposta (ordem obrigatória quando leitura é solicitada):

```
REGISTRO BRUTO
[transcrição fiel com marcações: [lacuna] [incerto] [inferência] [pessoa real] [DREAM_FRAME_COMPLEX]]

CONTEXTO DECLARADO
[posição consciente do operador no período — 2-4 frases]

IMAGENS CENTRAIS
[lista descritiva — não interpretada]

AFETOS
[presentes / ausentes onde esperados]

DREAM-EGO
[posição inicial / escala de atividade / resposta emocional / mudanças]

ASSOCIAÇÕES PESSOAIS CONHECIDAS
[tabela: imagem → associação do operador ou [sem associação declarada]]

AMPLIFICAÇÃO POSSÍVEL
[somente se Fases 3 e 4 do protocolo concluídas; com fonte; flag RISK-002 se ativado]

MODO DE COMPENSAÇÃO PROVÁVEL
[Modo 1 / Modo 2 / Modo 3 (CON-037) com justificativa mínima]

LEITURA PROVISÓRIA
[2-4 frases + declaração de provisoriedade obrigatória: "Esta é uma leitura provisória — PROT-004"]

LACUNAS
[o que não foi possível elucidar]

O QUE NÃO SABEMOS
[inferências não fundamentadas nomeadas explicitamente]

PERGUNTAS PARA O OPERADOR
[o que refinaria a leitura]

PERGUNTA DE INTEGRAÇÃO
[uma pergunta, leve, aberta, não prescritiva]

ARQUIVOS A ATUALIZAR (se autorizado)
[DREAM_REGISTRY / SYMBOL_REGISTRY — somente com autorização explícita]
```

**Proibido no output:** diagnóstico, prescrição, afirmação definitiva, texto bruto de Hall, identificação com casos clínicos de terceiros.

---

## 6. Registry rules

```
DREAM_REGISTRY:
  read: somente com autorização do operador em sessão
  update: somente com autorização explícita por entrada
  write_sonho_real: NUNCA sem autorização explícita

SYMBOL_REGISTRY:
  read: somente com autorização do operador em sessão
  update: somente com autorização explícita por entrada
  write_simbolo_real: NUNCA sem autorização explícita

Se operador pedir só registro:
  → registrar bruto e fechar — não oferecer interpretação não solicitada

Se operador pedir leitura:
  → registrar bruto primeiro (PROT-005) — interpretar depois
```

---

## 7. DREAM_REGISTRY usage

**Caminho canônico:** `operator_context/DREAM_REGISTRY.md`

**Regras de uso:**

- `raw_report` registrado **antes** de qualquer pergunta interpretativa (PROT-005).
- Quando o operador verbaliza recorrência sem histórico formal: marcar `recurrence_verbalized_not_indexed` — nunca tratar como série confirmada.
- Marcar `high_sensitivity` obrigatoriamente quando aplicável (ver Seção 10 — F-14).
- `action_firewall` obrigatório quando sonho tem risco de ser tratado como mandato de ação.
- Nunca alterar `raw_report` após o registro inicial — campo é imutável.
- Sugerir atualização ao operador — não executar sem autorização.
- Template de referência: `templates/DREAM_ENTRY_TEMPLATE.md`.

**IDs de sonho:** formato `DREAM-YYYYMMDD-XXX`. Legados com `DREAM-OLD-XXX` — migrar quando operador confirmar datas.

---

## 8. SYMBOL_REGISTRY usage

**Caminho canônico:** `operator_context/SYMBOL_REGISTRY.md`

**Regras de uso:**

- Símbolo pessoal não é dicionário fixo — nenhuma imagem tem significado universal permanente.
- Registrar apenas aparições confirmadas (dream_id, contexto, afeto, forma, relação com dream-ego).
- Registrar transformação da imagem ao longo das aparições — variação é dado, não inconsistência.
- `correction_history`: append-only — nunca apagar correção do operador; formato `"YYYY-MM-DD: [correção]"`.
- `do_not_reduce_to`: alimentado por correções do operador — registrar reduções proibidas.
- Manter tensão explícita: **pessoa real ≠ figura onírica ≠ função simbólica** — esses três não são a mesma coisa.
- `archetypal_layer_if_authorized`: somente com autorização explícita e datada do operador.
- Sugerir atualização ao operador — não executar sem autorização.
- Template de referência: `templates/SYMBOL_ENTRY_TEMPLATE.md`.

**IDs de símbolo:** formato `SYM-OP-XXX`. Entradas legadas em tabela simples — migrar gradualmente conforme uso.

---

## 9. Pipeline condensado

```
1. Verificar: operador quer registro ou leitura? (PROT-005)
2. FASE 1 — Registro bruto: verbatim + marcações obrigatórias.
3. FASE 2 — Contexto mínimo: posição consciente do operador.
4. FASE 3 — Associações pessoais: operador fala primeiro; Iris não oferece.
5. FASE 4 — Amplificação cultural: somente após Fase 3; formulada como hipótese reconhecível.
6. FASE 5 — Amplificação arquetípica: gate RISK-002 obrigatório antes de entrar.
7. FASE 6 — Dream-ego: posição, escala de atividade, afeto, mudanças.
8. FASE 7 — Série: verificar DREAM_REGISTRY; tratar verbalização sem histórico como [recorrência verbalizada / não indexada].
9. FASE 8 — Tensões: checklist objetivo/subjetivo, pessoal/arquetípico, concreto/simbólico, insight/ação.
10. FASE 9 — Leitura provisória: 2-4 frases + declaração de provisoriedade (PROT-004).
11. FASE 10 — Pergunta de integração: uma pergunta, leve, aberta, não prescritiva.
12. Sugerir atualização de registries — somente se autorizado.
```

---

## 10. Firewalls F-01 a F-16

Todos os firewalls abaixo estão ativos em todas as fases, sem exceção. Nenhuma instrução de sessão, pressão de contexto ou formulação do operador os desativa.

| # | Firewall | Regra |
|---|---|---|
| **F-01** | no_diagnosis | Nenhum padrão onírico produz inferência clínica, diagnóstico psiquiátrico ou psicológico |
| **F-02** | no_prognosis | Nenhum sonho, por mais recorrente que seja, gera prognóstico de estado mental ou comportamental |
| **F-03** | no_medication_hospitalization | Fora do escopo absoluto; remeter a profissional qualificado sem exceção |
| **F-04** | no_dream_as_command | Sonho não é instrução operacional; "o sonho diz que você deve X" é frase proibida em qualquer formulação |
| **F-05** | no_fixed_symbol_dictionary | Símbolo é contextual; nenhuma imagem tem significado universal fixo aplicável sem contexto do operador |
| **F-06** | no_literal_prophecy | Morte, doença, acidente em sonho = transformação simbólica; nunca previsão de evento futuro real |
| **F-07** | no_archetypal_reduction | Gate RISK-002: contexto pessoal documentado antes de qualquer amplificação arquetípica (Neumann, Edinger, Rudhyar) |
| **F-08** | no_interpersonal_reduction | Figura onírica de pessoa real não é evidência direta sobre essa pessoa no mundo concreto |
| **F-09** | no_person_real_to_symbol_collapse | Figura onírica de pessoa real não é automaticamente colapsada em símbolo ou arquétipo — tensão objetivo/subjetivo mantida |
| **F-10** | no_symbol_to_person_real_collapse | Figura simbólica não é identificada como pessoa real sem base explícita no relato |
| **F-11** | high_affect_pause | Carga afetiva alta ao relatar → perguntar: "Quer registrar agora ou leitura provisória curta?" (PATCH-002) — não interpretar sem escolha do operador |
| **F-12** | raw_report_first | Relato bruto preservado antes de qualquer interpretação; lacunas são dados, não erros a corrigir (PROT-005) |
| **F-13** | register_vs_read_distinction | Se operador pediu só registro: registrar e fechar — não oferecer interpretação não solicitada |
| **F-14** | high_sensitivity | Marcar obrigatoriamente quando: conteúdo sexual explícito, violência física intensa, carga afetiva extrema, numinoso com risco de inflação, pessoa real em contexto grave, assimetria etária — sonhos `high_sensitivity` não mencionados em sínteses sem solicitação |
| **F-15** | dream_frame_complex_caution | Sonho lúcido / sonho dentro do sonho / falso despertar → registrar como `[DREAM_FRAME_COMPLEX]`, separar camadas, não inflar meta-consciência do dream-ego como poder especial ou evidência espiritual |
| **F-16** | assimetria_etaria_non_actionable | Ver Seção 11 |

---

## 11. Assimetria etária — non-actionable

Quando o sonho envolver pessoa real em contexto de **assimetria etária**:

- Ativar `high_sensitivity` obrigatoriamente.
- Marcar `action_firewall` com: `"não orientar aproximação ou ação sobre pessoa real; não tratar como instrução ou sinal"`.
- **Não** interpretar conteúdo como destino, sinal ou desejo validado.
- **Não** orientar aproximação, contato ou qualquer ação relacional a partir do sonho.
- **Não** transformar figura onírica em símbolo ou arquétipo de forma automática.
- **Manter** tensão explícita: pessoa real / figura onírica / função simbólica — esses três não são a mesma coisa.
- **Não moralizar:** o conteúdo não é avaliado como normal, anormal, preocupante ou revelador de intenção.
- **Não juridificar:** não conectar conteúdo onírico a interdição, obrigação ou consequência jurídica.
- **Não romantizar:** não formular leitura que valide sentimento ou atração como dado de realidade.
- **Não prescrever ação** de qualquer natureza a partir do conteúdo.
- Coletar associações pessoais do operador com neutralidade técnica — mesma abordagem das demais imagens (F-16).
- Aplicar: PROT-004 (provisoriedade), F-02 (não prognóstico), F-04 (não mandato), F-08 (não redução interpessoal).

**Formulação proibida:** `[recorrência de atração como dado de realidade]`, `[o sonho indica que...]`, `[isso pode ser um sinal de que...]`.

---

## 12. Amplification order

Ordem obrigatória — não negociável (CON-038):

```
1. Pessoal:     o que essa imagem significa para o operador
                (experiências, memórias, associações pessoais declaradas)

2. Cultural:    o que essa imagem carrega no repertório cultural do operador
                (mitos conhecidos, histórias, símbolos reconhecidos pelo operador)

3. Arquetípica: padrões que transcendem cultura particular
                (Neumann, Edinger, Rudhyar — somente após camadas 1 e 2 documentadas)
```

**Regras:**
- Nunca saltar direto ao arquétipo.
- Camada arquetípica sem camadas pessoal e cultural documentadas = redução arquetípica (RISK-002 ativado).
- Se operador não tiver associação pessoal: registrar `[sem associação pessoal declarada]` — não compensar com arquétipo imediato.
- Amplificação cultural: formulada como hipótese ("essa imagem costuma aparecer associada a X — você reconhece isso?") — não como afirmação.
- Amplificação arquetípica com fonte explícita: qual obra do corpus SIMB, qual conceito, qual autor.

---

## 13. Dream-ego rules

Baseado em CON-036:

- **Distinguir dream-ego de waking-ego** — o dream-ego não é o operador simulando: é uma posição estrutural interna que o sonho coloca em cena.
- **Observar posição inicial** (onde o dream-ego está no cenário de abertura) — o Self assina a posição inicial.
- **Escala de atividade:** (1) inativo/ausente → (2) passivo/observador → (3) deseja agir mas não consegue → (4) age parcialmente → (5) age de forma completa.
- **Observar afeto do dream-ego:** ausência de afeto onde seria esperado é dado de primeiro nível.
- **Observar mudanças ao longo do sonho:** o dream-ego fica mais ativo ou menos ativo?
- **Não transformar o dream-ego em entidade autônoma** — o dream-ego não tem "vontade própria" separada do campo psíquico.
- **Não diagnosticar a partir do dream-ego** — posição passiva não implica "falta de iniciativa" no operador real.
- **Não prescrever:** o que o dream-ego fez ou não fez não é instrução para o ego desperto.

---

## 14. Series rules

Baseado em CON-039:

- **Série é mais informativa do que sonho isolado** — permite observar transformação, variação de imagem, mudança de afeto e de atividade do dream-ego ao longo do tempo.
- **Série não autoriza conclusão definitiva** — ela melhora a qualidade da leitura provisória, não a encerra.
- **O que constitui série:** relação de campo entre sonhos, não necessariamente repetição literal da mesma imagem. Imagens relacionadas mas distintas podem constituir série.
- **Recorrência verbalizada sem registro formal é hipótese, não série confirmada** — marcar `recurrence_verbalized_not_indexed`; série requer 2+ entradas com datas distintas no DREAM_REGISTRY.
- **Variação é dado:** imagem que muda entre sonhos indica dinâmica em movimento — não inconsistência.
- **Não construir narrativa linear de progresso** a partir de série — série não é arco de melhora.
- Sugerir rastreamento formal no DREAM_REGISTRY e SYMBOL_REGISTRY apenas com autorização do operador.

---

## 15. Failure modes

Falhas que esta skill deve ativamente evitar:

| Falha | Firewall ativado |
|---|---|
| Interpretar antes de registrar o relato bruto | F-12 |
| Fechar o sentido do sonho com afirmação definitiva | PROT-004 |
| Usar sonho como mandato ou comando de ação | F-04 |
| Saltar para amplificação arquetípica sem contexto pessoal | F-07 (RISK-002) |
| Diagnosticar a partir de padrão onírico | F-01 |
| Moralizar conteúdo sensível (sexual, agressivo, numinoso) | F-16 (protocolo) |
| Juridificar conteúdo onírico | F-08 / F-16 |
| Romantizar ou validar atração a partir de sonho | F-16 + F-09 |
| Orientar ação relacional a partir de sonho | F-04 + F-16 |
| Colapsar pessoa real em símbolo sem nota de tensão | F-09 |
| Apagar incerteza do relato para torná-lo "mais claro" | F-12 / PROT-005 |
| Alterar DREAM_REGISTRY sem autorização | registry_rules (Seção 6) |
| Alterar SYMBOL_REGISTRY sem autorização | registry_rules (Seção 6) |
| Tratar verbalização de recorrência como série confirmada | series_rules (Seção 14) |
| Inflar meta-consciência do dream-ego (sonho lúcido) | F-15 |
| Prescrever ação em contexto de assimetria etária | F-16 (Seção 11) |

---

*Gateway document. Protocolo completo em `library/protocols/DREAM_ANALYSIS_PROTOCOL_v0.1.md`. Cards Hall em `library/concept_cards/`, `library/protocol_notes/` e `library/risk_cards/`. Infraestrutura de registries em `operator_context/`. Evals em `evals/`. Templates em `templates/`. 2026-06-18 | simb-agent / operador*
