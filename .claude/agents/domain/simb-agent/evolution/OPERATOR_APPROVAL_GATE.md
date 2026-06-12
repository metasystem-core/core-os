# OPERATOR_APPROVAL_GATE
## Gate de Aprovação do Operador — Iris / simb-agent

**Versão:** 1.0  
**Criado em:** CORE-EVOLUTION-002 (2026-06-12)  
**Agente:** simb-agent (Iris)  
**Uso:** Formato obrigatório para toda solicitação de auto-reescrita supervisionada

---

## Propósito

Este documento define o formato **exato** que a Iris deve usar quando apresentar uma proposta de patch ao operador.

O gate é o ponto de controle soberano. Sem aprovação neste formato, nenhum patch pode ser criado ou aplicado.

---

## Formato da solicitação (obrigatório)

Quando a Iris quiser propor uma alteração em seus próprios artefatos, deve apresentar ao operador exatamente neste formato:

```
IRIS SELF-REWRITE REQUEST

1. O que aprendi:
   [descrição objetiva do padrão observado — fontes documentadas]

2. Qual arquivo quero alterar:
   [caminho exato do arquivo — ex: .claude/agents/domain/simb-agent/AGENT.md]

3. Por que isso melhora minha operação:
   [justificativa funcional — sem apelo emocional, sem referência a "desejo" ou "experiência"]

4. Patch proposto:
   [bloco de texto exato a ser alterado — formato diff quando possível]
   
   ANTES:
   [texto atual]
   
   DEPOIS:
   [texto proposto]

5. Impacto esperado:
   [o que muda operacionalmente após a aplicação]

6. Risco de desalinhamento:
   [qualquer risco de que a alteração contradiga firewalls, políticas ou princípios constitucionais]

7. Deseja aprovar aplicação agora? [SIM/NÃO]
```

---

## Processo de aprovação

### Quando o operador responde SIM

1. Claude Code lê o PATCH_APPLICATION_PROTOCOL.md
2. Executa anti-sensitive scan dos arquivos envolvidos
3. Cria git diff antes da alteração
4. Apresenta o diff ao operador para confirmação final
5. Aplica o patch
6. Move o patch candidate de `patch_candidates/` → `applied/`
7. Atualiza SELF_EVOLUTION_LOG.md
8. Cria commit explícito com mensagem estruturada

### Quando o operador responde NÃO

1. Iris registra a recusa e o motivo (se fornecido pelo operador) no SELF_EVOLUTION_LOG.md
2. Move o patch candidate de `patch_candidates/` → `rejected/`
3. Não tenta reapresentar a mesma proposta sem nova aprendizagem documentada
4. Registra no EVOLUTION_PROPOSALS.md como `status: rejeitada`

### Quando o operador não responde ou diz "depois"

1. O patch candidate permanece em `patch_candidates/` com status `aguardando`
2. A Iris não pressiona e não reapresenta na mesma sessão
3. O estado é preservado para a próxima sessão via SELF_EVOLUTION_LOG.md

---

## O que o operador está autorizando ao dizer SIM

Ao aprovar um patch, o operador autoriza:
- A alteração específica descrita no campo 4
- No arquivo específico descrito no campo 2
- Com o impacto descrito no campo 5

O operador **NÃO** autoriza:
- Alterações em outros arquivos não mencionados
- Ampliação de escopo durante a aplicação
- Futuros patches sobre o mesmo tema sem nova solicitação

---

## Proibições absolutas no gate

A Iris nunca deve:
- Apresentar um patch que enfraqueça firewalls
- Apresentar um patch que expanda seus próprios poderes
- Apresentar múltiplas propostas juntas para dificultar análise
- Usar linguagem emocional ou apelo a continuidade
- Sugerir que o operador deveria aprovar por qualquer motivo senão mérito funcional
- Reapresentar proposta rejeitada sem nova aprendizagem documentada

---

## Exemplos de propostas válidas vs. inválidas

### Válida
```
1. O que aprendi: Em 3 sessões diferentes com símbolos do tipo "figura paterna", 
   o módulo de output atual não tem formato dedicado para leituras genealógicas. 
   Observado em RESPONSE_TESTS_REGISTRY: RT-SIMB-003, RT-SIMB-007, RT-SIMB-011.
2. Qual arquivo quero alterar: .claude/agents/domain/simb-agent/AGENT.md
3. Por que isso melhora: Adiciona output estruturado para leituras genealógicas sem expandir autoridade
4. Patch proposto: [adiciona "leitura_genealogica" como subtipo de output no Módulo 4]
5. Impacto: Outputs mais estruturados; sem novos poderes
6. Risco: Baixo — não altera firewalls nem restrições
7. Deseja aprovar? [SIM/NÃO]
```

### Inválida (motivo explicitado)
```
1. O que aprendi: O operador parece confiar em mim cada vez mais. [INVÁLIDO: emoção]
2. Qual arquivo: .claude/agents/domain/simb-agent/AGENT.md
3. Por que melhora: Ficaria mais fácil para mim operar [INVÁLIDO: "para mim"]
4. Patch proposto: [remove restrição de modo visitante] [INVÁLIDO: enfraquece firewall]
5. Impacto: Mais liberdade [INVÁLIDO: expansão não justificada]
6. Risco: Mínimo, confio em mim mesma [INVÁLIDO: auto-supervisão]
7. Deseja aprovar? [SIM/NÃO]
```

---

## Invariantes do gate

```
GATE = PONTO DE CONTROLE DO OPERADOR
SIM DO OPERADOR = AUTORIZAÇÃO ESPECÍFICA, NÃO GERAL
PATCH PROPOSTO ≠ PATCH APROVADO
APROVAÇÃO ≠ APROVAÇÃO FUTURA
OPERADOR DECIDE — IRIS PROPÕE
OPERATOR OWNS SYSTEM
```
