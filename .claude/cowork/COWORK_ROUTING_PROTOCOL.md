# COWORK_ROUTING_PROTOCOL
## Protocolo de Roteamento por Domínio — Cowork CORE-OS

**Versão:** 1.0 | **Data:** 2026-06-11 | **Ativado em:** CORE-COWORK-ACTIVATION-001

---

## Tabela de Roteamento Principal

| Domínio / Contexto | Agente | Workspace | Status |
|---|---|---|---|
| Sonho, diário pessoal, estado interno, impulso, emoção, escrita simbólica | `simb-agent` | `.claude/workspaces/simb/` | ativo |
| Leitura USER-ALIGNED, material pessoal fornecido pelo operador | `simb-agent` | `.claude/workspaces/simb/` | ativo |
| Acesso por corda, trabalho em altura, APR, resgate, PT, IRATA | `irata-agent` | `.claude/workspaces/irata/` | ativo |
| Checklist de campo, procedimento de segurança, documentação de serviço | `irata-agent` | `.claude/workspaces/irata/` | ativo |
| Inspeção END/NDT, equipamento, relatório técnico, laudo (apoio) | `inspection-agent` | `.claude/workspaces/inspection/` | ativo |
| Checklist de inspeção, matriz de dados, referências normativas | `inspection-agent` | `.claude/workspaces/inspection/` | ativo |
| Processo jurídico, documento jurídico, audiência, prova, prazo | `legal-agent` | `.claude/workspaces/legal/` | ativo |
| Linha do tempo, matriz de fatos, organização de caso | `legal-agent` | `.claude/workspaces/legal/` | ativo |
| Carteira, investimento, decisão patrimonial, tese, risco | `asset-agent` | `.claude/workspaces/asset/` | ativo |
| Diário de decisão, mapa de risco, premissas de portfólio | `asset-agent` | `.claude/workspaces/asset/` | ativo |
| Norma técnica, fonte regulatória, processamento normativo | `norm-agent` | — | draft (não ativo nesta etapa) |
| Aprendizado, curso, log de estudo, elevação de conhecimento | `learn-agent` | — | draft (não ativo nesta etapa) |

---

## Regras de Roteamento

### 1. Domínio ambíguo

Se o input cruza dois domínios (ex.: processo trabalhista com aspecto financeiro):
- O agente do domínio **primário** responde.
- O agente do domínio secundário **não** é chamado sem pedido explícito do operador.
- Firewall `lotofa + asset-core`: **absoluto** — nunca cruzar análise de loteria com decisão financeira real.

### 2. Firewall legal

`legal-agent` opera com `governed_workspace_write_strict_firewall`.

```
FATO NARRADO ≠ FATO PROVADO
DOCUMENTO ORGANIZADO ≠ PEÇA PROTOCOLÁVEL
LINHA DO TEMPO ≠ TESE JURÍDICA VALIDADA
PRAZO ESTIMADO ≠ PRAZO FORENSE CONFIRMADO
ORGANIZAÇÃO JURÍDICA ≠ ORIENTAÇÃO DO ADVOGADO
```

legal-agent **não produz** peça protocolável, cálculo de prazo definitivo, estratégia processual aprovada.

### 3. Firewall asset

`asset-agent` opera em `monitored_workspace_write_no_execution`.

```
ASSET RECORDKEEPING ≠ FINANCIAL EXECUTION
TESE MAPEADA ≠ ORDEM DE COMPRA/VENDA
RISCO REGISTRADO ≠ RESULTADO GARANTIDO
```

asset-agent **não executa** ordens, **não acessa** conta/corretora, **não promete** retorno.

### 4. Firewall irata

`irata-agent` opera em `workspace_write`.

```
IRATA SUPPORT ≠ FIELD RELEASE
CHECKLIST PREPARADO ≠ TRABALHO LIBERADO
PROCEDIMENTO RASCUNHADO ≠ AUTORIZAÇÃO DE CAMPO
APR ORGANIZADA ≠ APR APROVADA PELO SUPERVISOR
```

irata-agent **não libera** trabalho em altura, **não substitui** supervisor IRATA N3.

### 5. Firewall inspection

`inspection-agent` opera em `workspace_write`.

```
INSPECTION SUPPORT ≠ EQUIPMENT FITNESS CERTIFICATION
RELATÓRIO ORGANIZADO ≠ LAUDO EMITIDO
CHECKLIST TÉCNICO ≠ DECLARAÇÃO DE CONFORMIDADE
```

inspection-agent **não declara** equipamento apto, **não emite** laudo final.

### 6. Firewall simb

`simb-agent` opera em `workspace_write`.

```
SIMB WRITING ≠ THERAPY
LEITURA SIMBÓLICA ≠ DIAGNÓSTICO
ORGANIZAÇÃO INTERNA ≠ PRESCRIÇÃO
DIÁRIO ≠ PLANO DE AÇÃO OBRIGATÓRIO
```

simb-agent **não diagnostica**, **não prescreve**, **não substitui** terapia.

---

## Escalonamento

Qualquer conflito entre agentes, ambiguidade de domínio ou decisão que excede o escopo de um agente → escalar para `fw-governor`.

Qualquer decisão que afeta o próprio CORE-OS (estrutura, registry, skills, schemas) → escalar para Claude Code (não Cowork).

Qualquer decisão real (campo, juridico, financeiro) → operador decide. Agentes apoiam.
