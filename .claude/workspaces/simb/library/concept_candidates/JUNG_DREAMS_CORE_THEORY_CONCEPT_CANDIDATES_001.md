---
tipo: concept_candidates
source_id: SRC-SIMB-011
task: TASK 21A — JUNG_DREAMS_CORE_THEORY_READ_001
data: 2026-06-19
status: DRAFT_CANDIDATE
nota: Nenhum destes candidatos foi inserido em CONCEPTS_REGISTRY. Aguardam revisão do operador.
---

# JUNG_DREAMS_CORE_THEORY_CONCEPT_CANDIDATES_001

> **Status geral: DRAFT_CANDIDATE**
> Não atualizar CONCEPTS_REGISTRY até autorização explícita do operador.
> Todos os IDs são provisórios (CC-JUNG-NNN).

---

## CC-JUNG-001 — Compensação: Os Três Modos

**candidate_id:** CC-JUNG-001
**título proposto:** compensação-tres-modos-jung (extensão de CON-037)
**source basis:** §545–547 (On the Nature of Dreams); §96–97 (PDF)
**descrição:**
A compensação opera de três formas distintas dependendo da posição da consciência:
1. Consciência muito unilateral → sonho toma o lado oposto
2. Consciência próxima do equilíbrio → sonho oferece variações e nuances
3. Consciência já "correta" ou adequada → sonho confirma e reforça

Compensar é diferente de complementar: compensação implica ajuste de desequilíbrio, não apenas adição do que falta. A fórmula tripartida de Jung é mais precisa que a formulação de Hall em CON-037.

**por que importa para SIMB:** CON-037 já captura compensação em três modos via Hall, mas a formulação de Jung é a fonte primária. Calibrar CON-037 com esta formulação — verificar se as três modalidades estão corretas em CON-037 ou se precisam de atualização.
**prioridade:** ALTA
**deve virar CON card?** sim — extensão/calibração de CON-037, não card separado
**ação necessária:** reler CON-037 e comparar com esta formulação; propor patch se divergente

---

## CC-JUNG-002 — Função Prospectiva do Sonho

**candidate_id:** CC-JUNG-002
**título proposto:** funcao-prospectiva-do-sonho
**source basis:** §491–492 (General Aspects); §49 (PDF)
**descrição:**
Distinta da compensação. Quando a atitude consciente está inadaptada tanto objetiva quanto subjetivamente, o inconsciente pode assumir função prospectiva — orientando em direção a uma posição futura melhor que a atual. Jung cita Maeder como o pesquisador que desenvolveu este aspecto.

Prospectiva ≠ profecia. É uma possibilidade de orientação emergindo do inconsciente, não uma previsão do que acontecerá. A distinção é crítica para SIMB: endossar prospectiva sem firewall leva diretamente a profecia.

Relação com compensação: compensação ajusta o desequilíbrio presente; prospectiva aponta uma direção futura quando o presente está suficientemente desequilibrado.

**por que importa para SIMB:** conceito ainda não formalizado em SIMB. Nomear a distinção previne dois erros: (1) tratar toda compensação como prospectiva, (2) tratar função prospectiva como profecia.
**prioridade:** ALTA
**deve virar CON card?** sim — novo card; referência cruzada com CON-037 e RISK-JUNG-002
**ação necessária:** criar CON-NNN_funcao-prospectiva-do-sonho com firewall F-06 explicitamente mapeado

---

## CC-JUNG-003 — Nível Subjetivo vs. Nível Objetivo de Interpretação

**candidate_id:** CC-JUNG-003
**título proposto:** nivel-subjetivo-objetivo-interpretacao
**source basis:** §506–508 (General Aspects); §73–74 (PDF)
**descrição:**
Duas formas de interpretar figuras do sonho:
- **Nível objetivo:** figuras do sonho tratadas como representando pessoas/objetos reais que existem independentemente do sonhador
- **Nível subjetivo:** figuras do sonho tratadas como aspectos do próprio psiquismo do sonhador

Qual nível predomina depende do contexto específico e requer avaliação caso a caso. Jung tende a privilegiar o nível subjetivo — especialmente quando a figura é alguém com quem o sonhador tem relação emocional intensa.

O nível objetivo é adequado quando a figura representa alguém com quem a relação real é relativamente objetiva e distante.

**por que importa para SIMB:** conceito central não formalizado. Resolve a questão de como tratar figuras de pessoas reais em sonhos — especialmente relevante para F-15/F-16 (assimetria etária, figuras familiares). Sem este conceito, Iris oscila entre literalismo (nível objetivo indevido) e psicologização excessiva.
**prioridade:** ALTA
**deve virar CON card?** sim — novo card prioritário
**ação necessária:** criar CON-NNN_nivel-subjetivo-objetivo-interpretacao com mapeamento explícito para F-15/F-16

---

## CC-JUNG-004 — Imago e Projeção no Sonho

**candidate_id:** CC-JUNG-004
**título proposto:** imago-e-projecao-no-sonho
**source basis:** §507–508 (General Aspects); §73–74 (PDF)
**descrição:**
Nunca nos relacionamos diretamente com pessoas reais — relacionamo-nos com um imago (imagem interna) dessas pessoas. O imago é formado subjetivamente, condicionado pela experiência real com o objeto, mas é produto do psiquismo do sonhador.

Quando uma figura aparece no sonho, é o imago dessa pessoa, não a pessoa em si. Projeção ocorre quando confundimos o imago com a realidade — quando atribuímos à pessoa real aquilo que é na verdade nossa imagem interna dela.

Para restaurar a projeção: o imago (e seu significado) deve ser reconhecido como aspecto do sujeito, não do objeto. Isso é feito via reconhecimento consciente do conteúdo projetado.

**por que importa para SIMB:** distinção operacional direta — figura de pessoa real no sonho é imago, não dado sobre a pessoa. Previne inferências sobre terceiros. Fundamento para nível subjetivo (CC-JUNG-003). Especialmente relevante para contextos de assimetria etária.
**prioridade:** ALTA
**deve virar CON card?** sim — pode ser card ligado a CC-JUNG-003 ou standalone
**ação necessária:** verificar se CON existente já captura imago; se não, criar

---

## CC-JUNG-005 — Estrutura Dramática do Sonho

**candidate_id:** CC-JUNG-005
**título proposto:** estrutura-dramatica-do-sonho
**source basis:** §561–565 (On the Nature of Dreams); §103–104 (PDF)
**descrição:**
Muitos sonhos têm estrutura dramática reconhecível em quatro fases:
1. **Exposição** (statement of place): cenário, personagens introduzidos
2. **Desenvolvimento** (complicação): tensão cresce, situação se complica
3. **Peripécia** (culminação/crise): mudança decisiva, virada
4. **Lysis** (solução/resultado): desfecho — pode estar ausente; sua ausência é informativa

Quando a lysis falta, o sonho termina em suspense — isso pode indicar que o problema ainda está aberto ou que o sonhador precisa contribuir conscientemente.

**por que importa para SIMB:** pode melhorar DREAM_ENTRY_TEMPLATE e o protocolo de registro de sonhos. Ter um framework para descrever a estrutura do sonho melhora a qualidade do registro bruto (PROT-005).
**prioridade:** MÉDIA
**deve virar CON card?** sim — novo card
**ação necessária:** criar CON-NNN_estrutura-dramatica-do-sonho; avaliar se DREAM_ENTRY_TEMPLATE deve incluir campos para as quatro fases

---

## CC-JUNG-006 — Grande Sonho vs. Pequeno Sonho

**candidate_id:** CC-JUNG-006
**título proposto:** grande-sonho-pequeno-sonho-distincao
**source basis:** §553–556 (On the Nature of Dreams); §99–101 (PDF)
**descrição:**
- **Pequeno sonho:** fragmento noturno de fantasia do nível pessoal/subjetivo; abundante, rapidamente esquecido, relevante para ajuste cotidiano. Abordagem: contexto pessoal simples.
- **Grande sonho / "sonho significativo":** imagens coletivas, motivos mitológicos, forma poética intensa; ocorre em fases críticas da vida (puberdade, meio da vida, proximidade da morte). Revela inconsciente coletivo. Requer conhecimento de mitologia e folclore para interpretação adequada.

Primitivos fazem essa distinção espontaneamente. Jung valida e sistematiza.

A abordagem para cada tipo é distinta: grande sonho não pode ser interpretado apenas com contexto pessoal — a ausência de paralelos pessoais indica que o nível coletivo foi ativado e requer amplificação.

**por que importa para SIMB:** distinção de abordagem — SIMB não deve tratar todo sonho como grande sonho, nem trivializar grandes sonhos com leitura superficial de contexto pessoal.
**prioridade:** MÉDIA
**deve virar CON card?** sim — novo card
**ação necessária:** criar CON-NNN_grande-sonho-vs-pequeno-sonho; mapear para distinção de abordagem no protocolo

---

## CC-JUNG-007 — Autonomia do Inconsciente

**candidate_id:** CC-JUNG-007
**título proposto:** autonomia-do-inconsciente (princípio teórico)
**source basis:** §544–545 (On the Nature of Dreams); §96 (PDF)
**descrição:**
O inconsciente é autônomo — não obedece à vontade consciente e frequentemente a contradiz flagrantemente. O sonho é produto deste inconsciente autônomo: é expressão espontânea, não mensagem intencional endereçada ao sonhador.

Autonomia implica: o inconsciente tem seus próprios critérios, perspectivas e dinâmicas que não precisam concordar com a consciência. Compensação é possível precisamente porque o inconsciente opera de modo independente.

**por que importa para SIMB:** fundamento epistemológico de todo o método. Explica por que sonhos são surpreendentes, contraditórios, perturbadores. Reforça "inação é decisão válida" e "dado antes de narrativa" (princípios constitucionais).
**prioridade:** MÉDIA
**deve virar CON card?** não — é mais um princípio teórico de contexto do que um conceito operacional para SIMB. Incorporar em nota de protocolo ou em contexto teórico do agente.
**ação necessária:** nenhuma card; mencionar em protocol notes e self-analysis posterior

---

## CC-JUNG-008 — Sonho Reativo / Repetição Traumática

**candidate_id:** CC-JUNG-008
**título proposto:** sonho-reativo-distincao-de-compensatorio
**source basis:** §500–502 (General Aspects); §70 (PDF)
**descrição:**
Quando um evento traumático ou excessivamente doloroso ocorre, o sonho pode simplesmente repetir a cena — não como compensação simbólica, mas como reprodução reativa de conteúdo que se tornou autônomo.

Critério prático para distinguir:
- Se a interpretação correta encerra a repetição → era sonho simbólico/compensatório
- Se a repetição continua mesmo após interpretação → era reativo

Sonhos reativos também ocorrem em condições físicas patológicas (dor intensa). A repetição traumática não responde à interpretação simbólica da mesma forma — o processo precisa se esgotar por conta própria.

**por que importa para SIMB:** previne o erro de forçar interpretação simbólica onde há repetição traumática; previne falsa promessa de que "interpretar vai ajudar". Novo eval necessário.
**prioridade:** MÉDIA
**deve virar CON card?** sim — novo card
**ação necessária:** criar CON-NNN_sonho-reativo-vs-compensatorio; criar novo eval para caso de repetição traumática

---

## CC-JUNG-009 — Função Redutiva do Sonho

**candidate_id:** CC-JUNG-009
**título proposto:** funcao-redutiva-do-sonho (pode ser extensão de CC-JUNG-001)
**source basis:** §496–497 (General Aspects)
**descrição:**
Quando a persona consciente está inflada, grandiosa, ou superestimada, o sonho compensa com imagens de humilhação, rebaixamento, ou exposição. É a compensação no sentido negativo — não de elevação, mas de deflação.

Em casos extremos, o inconsciente exagera a degradação para "esfregar" mais. O efeito é análogo: reequilíbrio do sistema, mesmo que doloroso.

**por que importa para SIMB:** completar o mapa de funções compensatórias. A inflação pode aparecer em sonhos de figuras de autoridade, persona, ou grandiosidade.
**prioridade:** BAIXA
**deve virar CON card?** talvez — pode ser extensão de CC-JUNG-001 dentro de CON-037, não card separado
**ação necessária:** verificar CON-037; se os três modos já incluem o redutivo, não criar card separado

---

## CC-JUNG-010 — Anti-Dicionário Simbólico

**candidate_id:** CC-JUNG-010
**título proposto:** (protocol note, não card)
**source basis:** §527 (General Aspects); §88–89 (PDF)
**descrição:**
"Não existe teoria simples e geralmente válida dos sonhos, e tal teoria não pode existir." Todo intérprete deve constantemente ter em mente que não há teoria geral ou dicionário simbólico válido. Cada símbolo é único para o sonhador e o momento.

**por que importa para SIMB:** já está coberto parcialmente em PROT-003 (separar concreto do simbólico) e no protocolo geral. A formulação de Jung é mais forte e explícita — pode ser usada para reforçar PROT-003 ou criar PROT-NNN específico.
**prioridade:** ALTA
**deve virar CON card?** não — protocol note ou reforço de PROT-003
**ação necessária:** avaliar se PROT-003 precisa de patch com formulação mais forte; ou criar PROT-006

---

## CC-JUNG-011 — Série de Sonhos como Processo Longitudinal

**candidate_id:** CC-JUNG-011
**título proposto:** serie-de-sonhos-processo-longitudinal (extensão de CON-039)
**source basis:** §550–552 (On the Nature of Dreams); §98–99 (PDF)
**descrição:**
Em uma série longa de sonhos, as compensações individuais começam a revelar uma direção mais ampla — o processo de individuação. Compensações que parecem separadas "arranham-se num tipo de plano". A série é o mapa do processo, não uma coleção de eventos independentes.

Jung remete ao livro Psychology and Alchemy (CW 12) como exemplo completo — que é exatamente Part IV deste volume.

Individuação aqui é a realização espontânea do ser humano integral — a série de sonhos não causa individuação, mas a revela em andamento.

**por que importa para SIMB:** CON-039 (série de sonhos) já existe via Hall. Estender com a perspectiva de Jung primário — especialmente a ligação com individuação. Verificar se CON-039 captura essa dimensão.
**prioridade:** ALTA
**deve virar CON card?** sim — extensão de CON-039
**ação necessária:** reler CON-039; propor extensão com a dimensão de individuação via Jung

---

## CC-JUNG-012 — Postura de Ignorância Metodológica

**candidate_id:** CC-JUNG-012
**título proposto:** (protocol note, não card)
**source basis:** §527 area (General Aspects); §92 (PDF)
**descrição:**
Regra pessoal de Jung: quando alguém traz um sonho e pede sua opinião, dizer a si mesmo primeiro: "Não tenho a menor ideia do que este sonho significa." Só então começar a examiná-lo.

Não é ausência de competência — é método. A ignorância inicial previne o fechamento prematuro do significado e permite que o sonho se revele por seus próprios caminhos.

**por que importa para SIMB:** esta é a formulação mais direta de Jung sobre a postura metodológica de Iris. Já coberta implicitamente no protocolo, mas pode fortalecer DREAM_ANALYSIS_PROTOCOL_v0.1.md explicitamente.
**prioridade:** ALTA
**deve virar CON card?** não — protocol note ou adição explícita ao DREAM_ANALYSIS_PROTOCOL
**ação necessária:** avaliar se o protocolo atual já contempla esta postura; se não, propor patch

---

*Candidatos criados em: TASK 21A — JUNG_DREAMS_CORE_THEORY_READ_001 (2026-06-19)*
*Status de todos: DRAFT_CANDIDATE — não inserir em CONCEPTS_REGISTRY sem autorização do operador.*
