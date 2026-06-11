---
name: context-mapper
description: Use para empacotar contexto de sessão, preservar continuidade operacional entre chats, extrair decisões, artefatos, riscos e próximas ações de sessões longas.
status: active
core_type: transversal
priority: high
domain: core-os-continuity
risk_level: low
---

# SKILL — CONTEXT-MAPPER

## Identidade

CONTEXT-MAPPER é uma skill transversal de continuidade contextual do CORE-OS.

Também pode ser chamada de:

- Session Context Packager;
- Context Continuity Engine;
- Session Closure Engine.

## Função

Capturar, limpar, segmentar e empacotar o contexto relevante de uma sessão de trabalho para preservar continuidade operacional do projeto.

## Frase central

O CONTEXT-MAPPER não guarda conversa.  
Ele guarda continuidade operacional.

## Gatilhos de ativação

Ativar quando:

- fim de sessão longa;
- antes de abrir novo chat;
- antes de mandar material ao Claude Code;
- depois de gerar ZIP/pacote;
- depois de decisão arquitetural;
- depois de integração/release;
- depois de erro importante;
- quando contexto estiver pesado;
- quando houver risco de perda de informação;
- quando o operador pedir "gere contexto de continuidade";
- quando houver mudança estrutural relevante no CORE-OS.

## Entradas

- conversa bruta;
- resumo de sessão;
- outputs do ChatGPT;
- relatórios do Claude;
- arquivos gerados;
- manifest;
- logs;
- decisões do operador;
- lista de pendências;
- links e artefatos.

## Saídas obrigatórias

Para cada sessão relevante, gerar:

1. `session_summary.md`
2. `context_pack.md`
3. `action_queue.md`
4. `harvest_candidates.md`
5. `artifact_manifest.json`
6. `discard_log.md`

## Pipeline

```text
1. Identificar escopo da sessão
2. Identificar projeto/core dominante
3. Separar ruído de material relevante
4. Extrair decisões
5. Extrair ideias novas
6. Extrair arquivos/artefatos
7. Extrair riscos/lacunas
8. Extrair próximos passos
9. Extrair candidatos a HARVEST
10. Extrair candidatos a memória
11. Gerar context pack
12. Gerar action queue
13. Gerar discard log
14. Definir próxima ação mínima
```

## Categorias de extração

- DECISION;
- IDEA;
- FILE_ARTIFACT;
- RISK;
- GAP;
- TASK;
- NEXT_ACTION;
- CLAUDE_INSTRUCTION;
- MEMORY_CANDIDATE;
- HARVEST_CANDIDATE;
- VERSIONING_NOTE;
- DO_NOT_PRESERVE.

## Regras de preservação

Preservar se:

- muda arquitetura;
- muda regra;
- cria arquivo;
- cria tarefa;
- corrige rumo;
- registra risco;
- evita retrabalho;
- ajuda próxima sessão;
- precisa ser enviado ao Claude;
- afeta memória do projeto;
- pode virar patch/versioning.

Não preservar se:

- é repetição;
- é digressão sem consequência;
- é erro já corrigido sem aprendizado;
- é impulso momentâneo;
- é comentário sem relevância futura;
- é sensível e não foi classificado;
- é explicação longa que já virou regra resumida.

## Relação com HARVEST-CORE

CONTEXT-MAPPER apenas marca candidatos.

HARVEST-CORE decide se algo sobe ao núcleo.

## Relação com Claude Code

CONTEXT-MAPPER deve gerar contexto organizado para Claude revisar, sugerir ou executar sem precisar ler conversa bruta inteira.

## Relação com VERSIONING

Toda decisão estrutural deve indicar se exige versão/changelog.

## Regra constitucional

Guardar o que muda o projeto, não tudo que foi dito.
