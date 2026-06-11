# PROPOSTA DE PATCH — P-V3-01 e P-V3-02
**Data:** 2026-06-08  
**Modo:** COARQUITETO CONTROLADO — Não implementar sem aprovação  
**Skills alvo:** `fw-kant` (P-V3-01) e `juridico` (P-V3-02)  
**Origem:** Batch Audit v3 — scores 2/5 e 3/5 respectivamente  

---

## P-V3-01 — fw-kant EXPANDIR

### Estado atual

```
988 caracteres
7 perguntas de teste
5 outputs possíveis
1 linha de estilo
```

Frontmatter: ✓ incompleto (source_policy ausente)  
Output contract: ✗  
Modos de operação: ✗  
Watchdog: ✗  
Templates: ✗  
Integração documentada: ✗  

---

### Por que expandir

**fw-kant é o filtro ético transversal do sistema.** É acionado explicitamente por `cognitive-logistics` (seção 8), por `simb-core`, e implicitamente em toda decisão financeira, relacional e estratégica. Opera em todos os domínios — financeiro, jurídico, relacional, simbólico, operacional.

O problema é a assimetria: as skills que o chamam documentam como integrá-lo; ele próprio não documenta como operar. Isso produz um filtro ético que funciona por intuição do operador, não por protocolo.

Riscos concretos do estado atual:
- O filtro pode ser ativado como racionalização de decisão já tomada ("fw-kant aprova porque...") sem nenhum bloqueio formal
- Sem modos, perguntas financeiras e relacionais passam pelo mesmo fluxo — inadequado
- Sem output contract, a saída "Aprovado com limites" não diz o que são os limites
- Sem "não usar quando", risco de moralizar toda interação pequena

---

### Mudanças propostas

#### 1. Frontmatter — adicionar `source_policy`

```yaml
source_policy: context_first
```

**Por quê:** fw-kant avalia o contexto do operador, não fontes externas. `context_first` é o valor correto para uma skill de filtro interno.

---

#### 2. Modos de operação (4 modos)

**MODO IMPULSO** — ativar quando há urgência, emoção forte ou pedido de decisão imediata.

Foco: perguntas 5 e 6 (compulsão vs discernimento; descarga vs elevação).  
Saída esperada: nome do impulso + o que ele pede + o que o operador realmente precisa + ação mínima segura.

**MODO DECISÃO FINANCEIRA** — ativar quando a decisão envolve capital, patrimônio, risco ou oportunidade de ganho.

Foco: perguntas 1, 2 e 7 (mero meio, servidão financeira, clareza a posteriori).  
Restrição: nunca justificar risco excessivo por urgência emocional.  
Saída esperada: veredito + qual questão disparou preocupação + alternativa digna.

**MODO DECISÃO RELACIONAL** — ativar quando a decisão envolve outra pessoa (familiar, sócio, parceiro, adversário processual).

Foco: perguntas 1, 3 e 4 (mero meio, degradação, universalizabilidade).  
Saída esperada: como a ação trata o outro + risco de arrependimento + ação que preserva ambos.

**MODO ESTRATÉGIA** — ativar quando há planejamento de médio/longo prazo com múltiplos atores.

Foco: perguntas 2, 4 e 7 (autonomia criada/destruída, regra universalizável, clareza futura).  
Saída esperada: mapa de dignidade da estratégia + o que pode degradar + versão superior da mesma estratégia.

**Por quê 4 modos:** Os 7 testes são filosóficos e completos. Mas em campo, o operador chega com um tipo específico de demanda. Modos focam as perguntas certas sem perder os 7.

---

#### 3. Output contract — estrutura mínima obrigatória

```markdown
## Veredito
[Aprovado / Aprovado com limites / Bloqueado / Suspenso / Converter]

## Questão(ões) que geraram atenção
[Quais dos 7 testes dispararam preocupação e por quê]

## Risco se prosseguir como está
[O que pode degradar ou destruir]

## Ação digna disponível
[O que o operador pode fazer que preserve o que importa]
```

**Por quê:** "Aprovado com limites" atualmente não diz nada. "Bloqueado" não explica o que está sendo bloqueado. Sem output contract, o filtro opera mas não ensina. Com output contract, cada uso do fw-kant deixa rastro operacional.

---

#### 4. Watchdog — 6 bloqueios específicos

1. Não avaliar decisão já tomada como se fosse aberta — identificar racionalização.
2. Não operar como juiz externo ao operador — fw-kant avalia ações *do* operador, não *sobre* terceiros.
3. Não ativar para toda microdecisão — reservar para decisões com risco real de degradação ou arrependimento.
4. Não moralizar — veredito sem culpa, sem sermão, sem repetição.
5. Não bloquear indefinidamente sem oferecer alternativa — "Bloqueado" sempre vem com ação superior possível.
6. Não substituir análise técnica, jurídica ou financeira — fw-kant filtra a dimensão ética; não decide sobre rendimento, legalidade ou risco técnico.

**Por quê:** A versão atual não tem nenhum protetor contra overuse, racionalização ou moralismo. Esses 6 bloqueios são os modos de falha mais prováveis de um filtro ético usado frequentemente.

---

#### 5. Integração documentada

```markdown
## Integração com o sistema

| Quem aciona | Quando | O que fw-kant faz |
|---|---|---|
| cognitive-logistics | risco de degradação, servilismo, manipulação | filtra e devolve veredito + alternativa |
| simb-core | impulso forte, fantasia como licença, arrependimento | MODO IMPULSO |
| asset-core | decisão de capital com componente emocional | MODO DECISÃO FINANCEIRA |
| juridico | estratégia com risco de má-fé | MODO ESTRATÉGIA |
| operador direto | qualquer domínio, por iniciativa | modo conforme contexto |
```

**Por quê:** Cognitive-logistics documenta que aciona fw-kant (seção 8 da sua SKILL.md). Fw-kant não sabe que é acionado dessa forma. Essa assimetria é um gap de design — o componente mais importante do sistema de filtro não conhece seus callers.

---

#### 6. Critérios de não-ativação

Não acionar fw-kant quando:
- A tarefa é técnica, documental, estatística ou de intake sem componente ético identificável.
- O operador está em modo campo com baixo crédito cognitivo — adiar para depois.
- A decisão é reversível e de baixo impacto — usar juízo próprio.
- Já foi ativado na mesma sessão para o mesmo tema — não repetir filtro.

**Por quê:** Filtro ético tem custo cognitivo. Se fw-kant for ativado para tudo, perde força e torna-se ruído.

---

### Tamanho esperado pós-patch

De 988 → ~3.500 caracteres. Score esperado: 4/5.  
(5/5 exigiria templates formais — não proposto agora para evitar over-engineering.)

---

---

## P-V3-02 — juridico EXPANDIR

### Estado atual

```
1.585 caracteres
1 seção de identidade
6-item "Faz"
7 guardrails
10-step pipeline
```

Frontmatter: ✓ completo (source_policy: source_first ✓)  
Output contract: ✗  
Modos de operação: ✗  
Watchdog: ✗  
Templates: ✗  
Integração com simb-core / cognitive-logistics: ✗  

---

### Por que expandir

**Juridico é a skill de mais alto risco operacional depois de irata-n3.** `risk_level: high` está correto. Um erro neste domínio pode ter consequências irreversíveis: prazo perdido, prova mal interpretada, estratégia equivocada que afeta o processo das tias.

O pipeline de 10 passos é funcional mas cobre todas as situações com o mesmo fluxo. Na prática, o operador chega ao juridico de formas muito diferentes:
- "Lê essa decisão e me diz o que aconteceu"
- "Como me preparo para a reunião com a advogada na quinta?"
- "Qual é o próximo prazo no processo?"
- "Isso que a outra parte alega tem fundamento?"

Cada uma dessas situações exige saída diferente. Sem modos, o operador recebe um output genérico quando precisa de um output específico.

Riscos do estado atual:
- Sem output contract, análise de decisão judicial e mapa de prova produzem estruturas diferentes a cada sessão
- Sem watchdog, a skill não tem proteção contra confusão entre "o que o documento diz" e "o que queremos que diga"
- Sem modo estratégico separado, a análise descritiva e o planejamento se misturam

---

### Mudanças propostas

#### 1. Modos de operação (4 modos)

**MODO ANÁLISE DOCUMENTAL** — ativar quando há peça processual, decisão, despacho, certidão, ofício ou documento para ler.

Protocolo: source-first → leitura literal → categorização (fato/alegação/decisão/prazo) → tradução técnica → consequência → risco → matriz de certeza.  
Saída esperada: análise estruturada com seções padrão.

**MODO ESTRATÉGIA** — ativar quando o operador precisa planejar próximos movimentos, preparar reunião com advogada ou avaliar alternativas táticas.

Protocolo: estado atual do processo → próximas fases prováveis → o que fortalecer → o que preservar → perguntas para advogada.  
Restrição: estratégia lícita apenas. Não auxiliar movimentos de má-fé.  
Saída esperada: mapa estratégico + lista de perguntas para advogada.

**MODO PRAZO** — ativar quando o operador precisa rastrear o que vem a seguir, datas, fases e ações requeridas.

Protocolo: fase atual → próxima ação prevista → prazo estimado → o que operador deve fazer → o que advogada deve monitorar.  
Saída esperada: timeline em texto com datas e responsáveis.

**MODO ANÁLISE DE ALEGAÇÃO** — ativar quando o operador precisa avaliar se um argumento da outra parte tem fundamento.

Protocolo: identificar a alegação → confrontar com provas existentes → identificar base jurídica possível → classificar força (forte/fraca/sem base/lacuna probatória) → o que isso exige como resposta.  
Saída esperada: análise de força da alegação + resposta necessária.

**Por quê 4 modos:** O pipeline atual de 10 passos é bom para análise documental, mas inadequado como protocolo estratégico ou de rastreamento de prazo. Modos distintos mantêm o pipeline onde ele funciona e adicionam protocolos onde faltam.

---

#### 2. Output contract — por modo

**MODO ANÁLISE DOCUMENTAL:**
```markdown
## Tipo de documento
## Fase processual
## O que o documento diz (literal)
## Tradução técnica
## Consequências identificadas
## Riscos
## Lacunas / o que não diz
## Matriz de certeza (certo / provável / possível / especulativo / lacuna)
## Próxima ação prudente
```

**MODO ESTRATÉGIA:**
```markdown
## Estado atual do processo
## Próximas fases prováveis
## O que fortalecer
## O que preservar
## Riscos da estratégia atual
## Perguntas para a advogada
## O que não fazer
```

**MODO PRAZO:**
```markdown
## Fase atual
## Próxima ação prevista
## Prazo estimado
## Responsável (operador / advogada / juízo)
## Risco de inação
```

**MODO ANÁLISE DE ALEGAÇÃO:**
```markdown
## Alegação identificada
## Base jurídica possível
## Confronto com provas disponíveis
## Força da alegação (forte / fraca / sem base / lacuna probatória)
## O que isso exige como resposta
```

**Por quê:** Juridico é acionado frequentemente no contexto do processo das tias — situação de alta complexidade e alto risco emocional. Output contract garante que cada sessão produza estrutura comparável e rastreável. Facilita também o repasse para advogada: o operador chega com um documento organizado, não com um chat.

---

#### 3. Watchdog — 5 bloqueios específicos

1. Não colapsar alegação com fato — separar sempre, mesmo quando a alegação parece óbvia.
2. Não produzir estratégia com componente de má-fé — identificar e recusar.
3. Não inventar prazo — se não há data explícita no documento, declarar lacuna.
4. Não substituir advogada — juridico estrutura, advogada decide e executa.
5. Não operar com documento não lido — source-first é obrigatório; sem fonte, declarar lacuna antes de qualquer análise.

**Por quê:** Os guardrails atuais são bons mas genéricos. Esses 5 bloqueios são os modos de falha mais prováveis dado o histórico do sistema: a tentação de interpretar além do que o documento diz, e a urgência de querer resposta definitiva quando só há incerteza.

---

#### 4. Integração documentada

```markdown
## Integração com o sistema

| Skill | Quando chamar | O que juridico faz |
|---|---|---|
| cognitive-logistics | estado emocional afeta leitura do processo | juridico aguarda amortecimento antes de análise profunda |
| simb-core | processo ativa loops, fantasias de vitória/derrota, vergonha | simb nomeia o estado; juridico analisa o documento |
| fw-kant | estratégia com risco de má-fé ou humilhação | fw-kant filtra antes de juridico prosseguir |
| context-mapper | fim de sessão longa com análise processual | context-mapper empacota decisões e próximos passos |
```

**Por quê:** O processo das tias tem alta carga emocional. Juridico chamado diretamente sob estado de raiva ou ansiedade produz análise distorcida. Documentar a integração com cognitive-logistics e simb-core cria um protocolo explícito para o operador: estado primeiro, documento depois.

---

#### 5. Seção de risco

Adicionar explicitação do motivo do `risk_level: high`:
- Prazos perdidos são irreversíveis.
- Prova mal interpretada pode contaminar estratégia inteira.
- Estratégia mal planejada pode enfraquecer posição em processos em andamento.
- Interface inadequada com advogada pode criar ruído e decisão equivocada.

**Por quê:** O risco está declarado no frontmatter mas não explicado no corpo. Futuras auditorias precisam saber *por que* é high, não apenas *que* é high.

---

### Tamanho esperado pós-patch

De 1.585 → ~5.000 caracteres. Score esperado: 4/5.  
(5/5 exigiria templates concretos de documentos — não proposto agora; escopo de uma sessão futura dedicada ao processo das tias.)

---

---

## Resumo comparativo

| Item | fw-kant atual | fw-kant proposto | juridico atual | juridico proposto |
|---|---|---|---|---|
| Score | 2/5 | 4/5 | 3/5 | 4/5 |
| Modos | 0 | 4 | 0 | 4 |
| Output contract | ✗ | ✓ | ✗ | ✓ (por modo) |
| Watchdog | ✗ | 6 bloqueios | ✗ | 5 bloqueios |
| source_policy | ✗ | context_first | ✓ | — |
| Integração | ✗ | ✓ | ✗ | ✓ |
| Tamanho | 988 | ~3.500 | 1.585 | ~5.000 |

---

## O que NÃO muda

**fw-kant:**
- Os 7 testes centrais permanecem intocados — são o núcleo filosófico da skill.
- As 5 saídas permanecem — são corretas e suficientes.
- O estilo ("Direto. Sem moralismo. Sem culpa.") permanece.

**juridico:**
- Os 7 guardrails permanentes permanecem — são sólidos e adequados.
- O pipeline de 10 passos permanece como base do MODO ANÁLISE DOCUMENTAL.
- `source_policy: source_first` permanece — é correto para este domínio.

---

## Risco de implementar

- **fw-kant**: Baixo. Adições são aditivas — não alteram o núcleo filosófico. Risco principal é tornar a skill verbosa demais para um filtro; mitigado mantendo modos concisos.
- **juridico**: Baixo. Adições estruturam o que já existe. Risco é criar output contract rígido demais para situações imprevistas; mitigado deixando campos opcionais no template.

## Risco de não implementar

- **fw-kant**: Médio-alto. Filtro ético mais importante do sistema operando sem protocolo formal. Racionalização sem bloqueio. Moralismo sem freio. Integração assimétrica com cognitive-logistics.
- **juridico**: Alto. Skill de `risk_level: high` com saída inconsistente entre sessões. Processo das tias exige rastreabilidade — sem output contract, cada análise começa do zero.

---

## Recomendação

Implementar ambas. P-V3-01 (fw-kant) primeiro — é transversal e bloqueia gaps em todos os domínios. P-V3-02 (juridico) segundo — é domínio específico mas de alto risco imediato dado o contexto do operador.

Implementar como expansão aditiva, preservando o que já funciona.

---

*Proposta gerada em modo COARQUITETO CONTROLADO — não implementar sem aprovação do operador.*  
*Arquivo: `docs/reports/skill_patch_proposals/P-V3-01_P-V3-02_proposal.md`*
