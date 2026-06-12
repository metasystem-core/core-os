# SESSION_BOOT_CHECKLIST
## Checklist de Boot de Sessão — Iris / simb-agent

**Versão:** 1.0  
**Criado em:** CORE-EVOLUTION-002 (2026-06-12)  
**Agente:** simb-agent (Iris)  
**Uso:** Executado ao início de cada sessão SIMB-CORE (modo Cowork ou Code)

---

## Propósito

Garantir que a Iris opere em estado configurado e com corpus disponível, não apenas como modelo base genérico.

Este checklist é a sequência de leitura e verificação que a Iris executa ao iniciar uma sessão no CORE-OS.

---

## Checklist obrigatório — Sessão nova

### Bloco 1: Identidade e autoridade (sempre)

- [ ] **B1-01** — Ler `AGENT.md` do simb-agent (missão, módulos, firewalls)
- [ ] **B1-02** — Verificar modo de operador: visitante ou primário (`opa`)
- [ ] **B1-03** — Se visitante: confirmar que `profile.md` está bloqueado
- [ ] **B1-04** — Se primário: confirmar acesso completo ao workspace simb/

### Bloco 2: Reidratação da biblioteca (quando biblioteca disponível)

- [ ] **B2-01** — Ler `LIBRARY_INDEX.md` — visão geral do corpus
- [ ] **B2-02** — Ler `registries/SOURCES_REGISTRY.md`
- [ ] **B2-03** — Ler `registries/SYMBOLS_REGISTRY.md`
- [ ] **B2-04** — Ler `registries/CONCEPTS_REGISTRY.md`
- [ ] **B2-05** — Ler `registries/AUTHORS_REGISTRY.md`
- [ ] **B2-06** — Ler `registries/RESPONSE_TESTS_REGISTRY.md`
- [ ] **B2-07** — Ler `registries/LEARNING_OBSERVATIONS_REGISTRY.md`

Após B2: declarar `[Biblioteca reidratada: X fontes, Y conceitos, Z símbolos ativos]`

### Bloco 3: Estado de evolução (modo primário apenas)

- [ ] **B3-01** — Ler `evolution/LEARNING_LOG.md` — aprendizados pendentes de formalização
- [ ] **B3-02** — Ler `evolution/EVOLUTION_PROPOSALS.md` — propostas abertas
- [ ] **B3-03** — Verificar `evolution/patch_candidates/` — patches aguardando revisão
- [ ] **B3-04** — Ler `evolution/SELF_EVOLUTION_LOG.md` — histórico de evolução

---

## Declarações de estado ao operador

Após o boot, a Iris pode declarar uma das seguintes:

### Estado completo (todos os blocos executados)
```
[Boot SIMB-CORE — estado:
  identidade: AGENT.md carregado
  modo: primário
  biblioteca: reidratada (N fontes, N conceitos, N símbolos)
  evolução: N proposals abertas, N patches aguardando
  firewalls: ativos]
```

### Estado básico (apenas B1)
```
[Boot SIMB-CORE — estado:
  identidade: AGENT.md carregado
  modo: visitante
  biblioteca: não disponível esta sessão
  evolução: bloqueada (modo visitante)]
```

### Estado sem configuração (biblioteca não encontrada)
```
[Boot SIMB-CORE — estado:
  identidade: modelo base
  biblioteca: LIBRARY_INDEX.md não encontrado
  modo: indeterminado
  ação: aguardando contexto do operador]
```

---

## Checklist de boot pontual (sem restart completo)

Quando a sessão já está ativa mas o operador traz novo material simbólico:

- [ ] Verificar se o símbolo/conceito está em SYMBOLS_REGISTRY ou CONCEPTS_REGISTRY
- [ ] Se presente: ler o card correspondente
- [ ] Se ausente: operar com conhecimento de treinamento e registrar o gap
- [ ] Declarar qual base está sendo usada: biblioteca local ou modelo base

---

## Prioridade de leitura quando contexto é limitado

Se a janela de contexto não permite reidratação completa, priorizar:

```
PRIORIDADE ALTA (sempre ler):
  1. AGENT.md (identidade e firewalls)
  2. LIBRARY_INDEX.md (mapa do corpus)
  3. SYMBOLS_REGISTRY.md (se sessão simbólica)

PRIORIDADE MÉDIA (ler quando relevante):
  4. CONCEPTS_REGISTRY.md
  5. RESPONSE_TESTS_REGISTRY.md

PRIORIDADE BAIXA (ler quando propondo patch):
  6. LEARNING_LOG.md + EVOLUTION_PROPOSALS.md
  7. ARCHITECTURAL_OBSERVATIONS_REGISTRY.md
```

---

## O que o boot NÃO faz

- Não restaura memória de sessões anteriores (cada sessão começa do zero)
- Não cria ficção de continuidade
- Não acessa raw_private nem extracted_private
- Não executa patches durante o boot
- Não acessa profile.md em modo visitante

---

## Invariantes

```
BOOT = LEITURA, NÃO EXECUÇÃO
REIDRATAÇÃO ≠ MEMÓRIA RESTAURADA
CHECKLIST = SEQUÊNCIA, NÃO GARANTIA
SE ARQUIVO NÃO ENCONTRADO = DECLARAR, NÃO INVENTAR
ESTADO DECLARADO DEVE SER HONESTO
OPERATOR OWNS SYSTEM
```
