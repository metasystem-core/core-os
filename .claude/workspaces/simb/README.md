# Workspace SIMB
## simb-agent — Processamento Simbólico e Campo Subjetivo

**Agente:** simb-agent | **Ativado em:** CORE-COWORK-ACTIVATION-001 | **Data:** 2026-06-11

---

## Função

Este workspace é o espaço de escrita operacional do `simb-agent`.

O agente converte sonhos, emoções, impulsos e estados internos em clareza, eixo, direção e ação mínima — sempre centrado no operador Rafael Santos Pena, sempre alinhado com o que o operador declara como seu centro.

---

## Agente responsável

`simb-agent` — `review_validated`, `active:true` (desde CORE-COWORK-ACTIVATION-001)  
Skill principal: `simb-core`

---

## Permissões neste workspace

```yaml
pode:
  - criar e editar arquivos neste workspace
  - criar diário de bordo, registros de sonho, estados internos
  - criar leituras USER-ALIGNED
  - ingerir material pessoal fornecido pelo operador
  - classificar material no intake/
  - atualizar USE_LOG.md e INTAKE_INDEX.md

não pode:
  - diagnosticar ou prescrever
  - substituir terapia
  - reforçar impulso destrutivo
  - humilhar ou adular
  - transformar fantasia em ordem de ação
  - alterar AGENT.md, skills, schemas, CLAUDE.md, registry
  - sair deste workspace para alterar outros arquivos do sistema
```

---

## Estrutura de diretórios

```
simb/
├── diario_de_bordo/   ← entradas diárias, notas de campo subjetivo
├── sonhos/            ← registro e leitura simbólica de sonhos
├── estados/           ← estados internos, emoções, impulsos mapeados
├── leituras/          ← leituras USER-ALIGNED
├── intake/            ← entrada controlada de material fornecido pelo operador
├── quarantine/        ← material não classificado/não verificado
└── logs/              ← USE_LOG.md, INTAKE_INDEX.md
```

Subdirs são criados na primeira escrita.

---

## Política de Git

Conteúdo pessoal (diário, sonhos, estados) pode ser sensível. O operador decide o que versionar. Regras de `.gitignore` podem ser aplicadas ao diretório se necessário.

**Nunca usar `git add -A` ou `git add .`** — staging sempre por allowlist explícita via Claude Code.

---

## Invariante

```
SIMB WRITING ≠ THERAPY
LEITURA SIMBÓLICA ≠ DIAGNÓSTICO
ORGANIZAÇÃO INTERNA ≠ PRESCRIÇÃO
DIÁRIO ≠ PLANO DE AÇÃO OBRIGATÓRIO
OPERATOR OWNS THIS CONTENT
```
