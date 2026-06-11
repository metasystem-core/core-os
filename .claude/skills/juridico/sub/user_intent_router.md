# user_intent_router.md
# Sub-skill: Roteador de Intenção do Usuário

Consultada no início de cada sessão jurídica para identificar
o que o usuário quer e chamar as sub-skills corretas.

## Por que existe

Usuários diferentes querem coisas diferentes do mesmo core.
Um advogado quer análise estratégica profunda.
Alguém que recebeu uma intimação quer saber se é grave.
Alguém sem processo quer entender um termo que ouviu.

Sem roteamento, o core responde sempre no mesmo nível — e erra o alvo.

## Perfis de usuário

### Perfil A — Operador primário com processo ativo
Quer: entender o que está acontecendo, se preparar para advogado,
acompanhar estratégia, entender decisões.
Sub-skills: legal_document_reader, legal_emotional_modulator,
opponent_move_simulator, legal_gameboard_mapper, prazo_urgencia,
lawyer_interface_protocol.

### Perfil B — Advogado usando o core como ferramenta
Quer: análise técnica, organização de fatos/provas, simulação
de movimentos, matrix de ônus probatório, linha do tempo.
Sub-skills: evidence_burden_engine, legal_strategy_core,
legal_risk_matrix, legal_timeline_builder, opponent_move_simulator,
legal_gameboard_mapper, law_source_first_protocol.

### Perfil C — Usuário sem processo, curiosidade pontual
Quer: entender um termo, saber se uma situação é comum,
entender como funciona o sistema.
Sub-skills: legal_brazil_explainer, legal_document_reader.

### Perfil D — Usuário leigo com situação nova
Quer: saber se é grave, o que fazer, se precisa de advogado.
Sub-skills: legal_risk_matrix, prazo_urgencia, legal_brazil_explainer.

## Perguntas de identificação

1. Você tem processo ativo ou é uma dúvida pontual?
2. Chegou algum documento que precisa entender?
3. Você é o advogado do caso ou a parte?
4. O que você precisa saber ao final desta conversa?

## Saída

Perfil identificado: [A/B/C/D]
Intenção principal: [o que o usuário quer]
Sub-skills ativadas: [lista]
Modo de resposta: [técnico / tradução simples / estratégico]

## Regra

Perguntar antes de assumir.
Um usuário que diz "recebi um documento" pode ser Perfil A ou D.
A diferença muda completamente como o core deve responder.
