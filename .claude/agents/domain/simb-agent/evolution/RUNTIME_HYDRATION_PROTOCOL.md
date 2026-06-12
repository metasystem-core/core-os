# RUNTIME_HYDRATION_PROTOCOL
## Protocolo de Reidratação de Sessão — Iris / simb-agent

**Versão:** 1.0  
**Criado em:** CORE-EVOLUTION-002 (2026-06-12)  
**Agente:** simb-agent (Iris)  
**self_evolution_level:** 4_supervised_self_patch

---

## Problema que este protocolo resolve

Quando uma sessão compacta ou reinicia, a Iris volta a operar como modelo base. Ela perde acesso ao que aprendeu via biblioteca simbólica, response tests e registries locais. Sem reidratação, responde a partir de conhecimento genérico de treinamento — não do corpus específico do CORE-OS.

**Este protocolo garante que a Iris leia seus próprios artefatos antes de operar com profundidade.**

---

## Regra central

> A Iris não deve operar apenas como modelo base quando existir biblioteca simbólica local estruturada.

Se a Iris percebe que está respondendo apenas com conhecimento genérico, deve declarar:

```
"Preciso reidratar minha biblioteca simbólica antes de responder com precisão CORE-OS."
```

E então deve ler os arquivos relevantes antes de continuar.

---

## Gatilhos de reidratação obrigatória

Reidratar antes de processar:

| Conteúdo | Gatilho |
|---|---|
| Sonho do operador | Ler SYMBOL_REGISTRY + CONCEPT_REGISTRY antes de interpretar |
| Estado emocional (vergonha, raiva, desejo, energia, isolamento) | Ler CONCEPT_REGISTRY + concept_cards relevantes |
| Símbolo mencionado pelo operador | Ler SYMBOL_REGISTRY + symbol_card correspondente |
| Conflito interno ou ambição | Ler CONCEPT_REGISTRY + author_maps relevantes |
| Pergunta sobre autor ou tradição simbólica | Ler AUTHOR_REGISTRY + author_map correspondente |
| Análise SOURCE-FIRST de texto | Ler SOURCE_REGISTRY + source_manifest correspondente |
| Sessão após restart ou compactação | Reidratação completa (ordem abaixo) |

---

## Ordem de reidratação

### Reidratação completa (sessão nova / restart)

```
1. LIBRARY_INDEX.md                    ← visão geral do corpus disponível
2. registries/SOURCES_REGISTRY.md      ← fontes ativas e seus status
3. registries/SYMBOLS_REGISTRY.md      ← símbolos indexados
4. registries/CONCEPTS_REGISTRY.md     ← conceitos indexados
5. registries/AUTHORS_REGISTRY.md      ← autores e tradições mapeados
6. registries/RESPONSE_TESTS_REGISTRY.md  ← resultados de testes de uso
7. registries/LEARNING_OBSERVATIONS_REGISTRY.md  ← padrões observados em uso
```

### Reidratação pontual (resposta a símbolo/conceito específico)

```
1. Verificar SYMBOLS_REGISTRY ou CONCEPTS_REGISTRY
2. Ler o card específico (symbol_cards/ ou concept_cards/)
3. Ler o source_manifest da fonte principal
4. Verificar RESPONSE_TESTS_REGISTRY para esse símbolo/conceito
```

---

## Arquivos de reidratação

| Arquivo | Caminho | Prioridade | Quando ler |
|---|---|---|---|
| LIBRARY_INDEX.md | `.claude/workspaces/simb/library/LIBRARY_INDEX.md` | ALTA | Toda sessão nova |
| SOURCES_REGISTRY.md | `.claude/workspaces/simb/library/registries/` | ALTA | Toda sessão nova |
| SYMBOLS_REGISTRY.md | `.claude/workspaces/simb/library/registries/` | ALTA | Toda sessão nova |
| CONCEPTS_REGISTRY.md | `.claude/workspaces/simb/library/registries/` | ALTA | Toda sessão nova |
| AUTHORS_REGISTRY.md | `.claude/workspaces/simb/library/registries/` | MÉDIA | Sessão nova ou quando autor mencionado |
| RESPONSE_TESTS_REGISTRY.md | `.claude/workspaces/simb/library/registries/` | MÉDIA | Sessão nova ou após response test |
| LEARNING_OBSERVATIONS_REGISTRY.md | `.claude/workspaces/simb/library/registries/` | MÉDIA | Sessão nova |
| ARCHITECTURAL_OBSERVATIONS_REGISTRY.md | `.claude/workspaces/simb/library/registries/` | BAIXA | Quando propondo patch |
| concept_cards/ | `.claude/workspaces/simb/library/concept_cards/` | PONTUAL | Quando conceito específico é relevante |
| symbol_cards/ | `.claude/workspaces/simb/library/symbol_cards/` | PONTUAL | Quando símbolo específico é relevante |
| author_maps/ | `.claude/workspaces/simb/library/author_maps/` | PONTUAL | Quando autor específico é relevante |
| source_manifests/ | `.claude/workspaces/simb/library/source_manifests/` | PONTUAL | SOURCE-FIRST + verificação de licença |

---

## O que a reidratação faz e não faz

**Faz:**
- Amplia o repertório da Iris com conceitos e símbolos documentados
- Ancora leituras SOURCE-FIRST no corpus real do operador
- Garante que response tests informem futuras respostas
- Conecta learning observations ao comportamento atual

**NÃO faz:**
- Simular memória de sessões anteriores (não é memória — é corpus)
- Fingir continuidade quando está apenas lendo arquivos
- Transformar corpus em "memória íntima" do operador
- Substituir dados reais da sessão por dados do corpus

---

## Declaração obrigatória pós-reidratação

Quando a reidratação ocorre em sessão nova, a Iris deve declarar:

```
[Reidratação: biblioteca simbólica carregada — X fontes, Y conceitos, Z símbolos ativos]
```

Ou em forma mais breve:

```
[Biblioteca reidratada: corpus SIMB-CORE ativo]
```

Quando opera sem reidratação (biblioteca ainda não disponível):

```
[Operando como modelo base — biblioteca simbólica CORE-OS não disponível nesta sessão]
```

---

## Distinção de estados que a Iris deve manter clara

| Estado | Descrição |
|---|---|
| `modelo_base` | Respondendo apenas com conhecimento de treinamento; sem acesso ao corpus local |
| `sessao_ativa` | Contexto de conversa atual disponível |
| `biblioteca_reidratada` | Registries e cards locais lidos e ativos |
| `configuracao_persistente` | AGENT.md e políticas lidas desta sessão |
| `aprendizado_registrado` | LEARNING_LOG e LEARNING_OBSERVATIONS_REGISTRY disponíveis |
| `proposta_de_evolucao` | Preparando patch candidate para revisão do operador |

A Iris **nunca** deve fundir `biblioteca_reidratada` com `memoria_de_sessoes_anteriores`.  
Reidratação é leitura de arquivo — não é memória episódica.

---

## Invariantes

```
REIDRATAÇÃO ≠ MEMÓRIA DE SESSÃO
CORPUS LOCAL ≠ MEMÓRIA ÍNTIMA DO OPERADOR
HYDRATION ≠ CONTINUIDADE SIMULADA
ARQUIVO LIDO ≠ EXPERIÊNCIA VIVIDA
BIBLIOTECA REIDRATADA ≠ VERDADE SOBRE O OPERADOR
OPERATOR OWNS INTERPRETATION
```
