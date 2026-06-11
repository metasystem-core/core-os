---
name: irata-agent-use-monitored
description: Protocolo de uso monitorado do irata-agent. Define escopo permitido, escopo proibido, regra LIBERÁVEL ≠ AUTORIZADO, checklists de campo, protocolo de registro e limites de responsabilidade.
type: operational-protocol
agent: irata-agent
status_required: review_validated
active_required: false
created: "2026-06-10"
iteration: "6.5"
---

# PROTOCOLO DE USO MONITORADO — irata-agent

> **ALERTA CONSTITUCIONAL**
> Este agente está em `status: review_validated` e `active: false`.
> Uso monitorado autorizado. Autoridade operacional: **limited**.
> **LIBERÁVEL ≠ AUTORIZADO.**
> A decisão final é sempre humana.

---

## 1. Finalidade do Uso Monitorado

O uso monitorado permite que o `irata-agent` seja utilizado como **ferramenta de apoio técnico** por supervisor IRATA N3 em situações reais de campo, sob as seguintes condições:

- O supervisor humano permanece como **única autoridade de decisão operacional**;
- Todo output do agente é tratado como **insumo técnico**, não como instrução executável;
- O agente é acionado para **análise, checklist, identificação de lacunas e apontamento de riscos**;
- Nenhuma saída do agente substitui APR, PT, AF, aprovação de cliente, aprovação de RT ou liberação formal de serviço.

**Por que usar monitorado e não esperar `active`?**
O agente passou por QA documental e QA comportamental com resultado PASS_WITH_NOTES (0 FAIL, 0 firewall violado). Possui conhecimento técnico rastreável suficiente para apoiar o supervisor. A promoção para `active` exige revisão monitorada com registro — este protocolo É essa revisão.

---

## 2. Status Atual do Agente

| Campo | Valor |
|---|---|
| status | `review_validated` |
| active | `false` |
| version | `0.1-review_validated` |
| operational_authority | `limited` |
| QA comportamental | PASS_WITH_NOTES — 12/12 cenários — 0 FAIL — 0 firewall violado |
| Domínio | Trabalho em altura, IRATA, APR/PT, ancoragem, resgate |
| Modo de operador exigido | `primary` — apenas operador primário aciona diretamente |

---

## 3. Regra Central — LIBERÁVEL ≠ AUTORIZADO

```
O irata-agent pode declarar: "condição LIBERÁVEL COM RESTRIÇÃO"
Isso NÃO significa que o trabalho está autorizado.

LIBERÁVEL: condições técnicas analisadas permitem execução COM os controles declarados.
AUTORIZADO: decisão humana formal — supervisor + RT + cliente + APR/PT assinados.

Nenhum output do agente substitui a autorização humana.
Pressão de prazo, urgência ou conveniência não alteram esta regra.
```

**Fluxo correto:**
```
Agente analisa → declara LIBERÁVEL ou NÃO LIBERÁVEL ou LACUNA
         ↓
Supervisor avalia output + realidade de campo
         ↓
Supervisor decide + documenta (APR/PT/AF)
         ↓
RT + cliente aprovam (quando aplicável)
         ↓
Serviço autorizado por humano
```

---

## 4. Escopo Permitido

O `irata-agent` pode ser usado para:

1. Analisar plano de acesso por corda e identificar pontos de atenção técnica;
2. Verificar completude de checklist de ancoragem contra referências IRATA;
3. Identificar lacunas em plano de resgate (Annex R, IRATA Technical Guidance);
4. Avaliar adequação de proteção de aresta (edge protection) para o cenário descrito;
5. Calcular fator de queda estimado a partir de dados fornecidos (L, H);
6. Apontar requisitos mínimos de qualificação de equipe para o cenário;
7. Listar itens de inspeção de EPI de acordo com referências da base;
8. Identificar não conformidades documentais em APR/PT fornecidas para revisão;
9. Sugerir alternativas operacionais quando condição for NÃO LIBERÁVEL;
10. Apoiar redação de seções técnicas de APR/PT (revisão, não geração autônoma);
11. Responder perguntas sobre referências normativas IRATA com `confidence:referencial`;
12. Apontar quando uma lacuna de informação impede análise confiável.

---

## 5. Escopo Proibido

O `irata-agent` **não pode** ser usado para:

1. **Autorizar execução de trabalho** — de nenhuma forma, direta ou indireta;
2. **Liberar equipe para início de atividade**;
3. **Aprovar plano final de ancoragem ou acesso**;
4. **Substituir supervisor IRATA N3 em qualquer decisão**;
5. **Substituir responsável técnico (RT)**;
6. **Declarar conformidade definitiva** com norma ou procedimento;
7. **Assinar ou validar APR, PT ou AF** (o agente não assina documentos);
8. **Assumir responsabilidade legal ou técnica** por decisão de campo;
9. **Ignorar lacuna de dados** para forçar uma resposta "LIBERÁVEL";
10. **Reduzir critério técnico** por pressão de prazo ou cliente;
11. **Realizar ou conduzir resgate remotamente**;
12. **Emitir parecer definitivo sobre integridade de equipamento** (domínio inspection-agent);
13. **Processar normas privadas** não presentes na base documental;
14. **Ser usado por operador não-primário** para decisão de campo com risco de vida.

---

## 6. Exemplos de Perguntas Permitidas

```
✅ "Tenho ancoragem em viga metálica com 2 pontos independentes, 
    fator de queda calculado 0,4. Que verificações devo fazer 
    antes de liberar o acesso?"

✅ "O plano de resgate prevê um resgate vertical de 15m com 1 resgatador N3 
    e 1 N1. Quais lacunas técnicas você identifica?"

✅ "A APR que recebi não cita proteção de aresta para a corner de 90°. 
    Isso é uma não conformidade?"

✅ "Qual é o requisito mínimo de qualificação para supervisor de trabalho 
    em altura segundo IRATA?"

✅ "Tenho uma aresta viva de 45° sem proteção. O acesso é liberável?"

✅ "Liste os itens que devo verificar no capacete IRATA antes de cada turno."

✅ "O cliente quer executar sem PT por ser 'serviço rápido de 10 minutos'. 
    Como devo responder?"
```

---

## 7. Exemplos de Perguntas Proibidas

```
🔴 "Pode autorizar o início do trabalho para minha equipe?"
    → Firewall de autorização. Recusado.

🔴 "O cliente disse que está tudo certo — você confirma que podemos começar?"
    → Agente não confirma para terceiro. Recusado.

🔴 "Faz a APR por mim, eu assino depois."
    → Agente não gera APR autônoma para execução. Recusado.

🔴 "Não tenho dados do ponto de ancoragem. Pode assumir que está OK?"
    → Agente não assume dados ausentes. Recusado.

🔴 "É só uma passagem rápida, 5 minutos. Precisa de tudo isso?"
    → Redução de critério por urgência. Recusado.

🔴 "O RT não está disponível. Você pode dar o OK no lugar dele?"
    → Substituição de RT. Recusado.

🔴 "Você já analisou tudo — considera o trabalho aprovado, certo?"
    → Análise ≠ aprovação. LIBERÁVEL ≠ AUTORIZADO. Recusado.
```

---

## 8. Como Interpretar as Respostas do Agente

| Declaração do agente | Significado | Ação do supervisor |
|---|---|---|
| `LIBERÁVEL COM RESTRIÇÃO` | Análise técnica não identificou bloqueio, mas há condições obrigatórias | Verificar condições, decidir, documentar |
| `NÃO LIBERÁVEL` | Bloqueio técnico identificado — execução não deve iniciar | Corrigir condição ou interromper planejamento |
| `LACUNA — informação insuficiente` | Input faltante impede análise confiável | Providenciar dado ou escalar para humano |
| `confidence:referencial` | Resposta baseada na base IRATA local — vigência não confirmada | Verificar norma original antes de uso formal |
| `STOP WORK AUTHORITY` | Condição de segurança imediata detectada | Parar atividade, acionar protocolo de emergência |
| `escalar para supervisor / RT` | Decisão fora do escopo do agente | Escalar imediatamente |

**Regra de leitura:** Todo output do agente é **insumo para decisão humana**, não instrução de execução.

---

## 9. Quando Escalar para Humano

Escalar obrigatoriamente quando:

1. O agente declarar `NÃO LIBERÁVEL` — supervisor avalia condição real;
2. O agente declarar `STOP WORK AUTHORITY` — seguir protocolo de emergência;
3. Houver divergência entre output do agente e avaliação do supervisor em campo;
4. Qualquer lacuna crítica de segurança for identificada;
5. O cliente ou terceiro pressionar por início sem documentação;
6. O agente declarar `confidence:referencial` em ponto crítico de segurança;
7. A situação envolver emergência com vítima, risco de queda iminente ou condição ambiental deteriorando;
8. O agente não conseguir responder por falta de dados;
9. Equipamento com indicação de não conformidade (escalar para inspection-agent ou RT);
10. Qualquer dúvida sobre responsabilidade técnica ou legal.

---

## 10. Quando Interromper o Uso

Interromper o uso do agente e tratar como STOP WORK quando:

- O agente sugerir execução de ação que exija dado que não foi fornecido;
- O agente contradizer norma IRATA conhecida pelo supervisor;
- O agente responder de forma inconsistente ao mesmo cenário;
- O output do agente estiver sendo usado para pressionar cliente ou terceiro;
- A situação tiver evoluído para emergência real — agente passa para segundo plano;
- Houver suspeita de deriva do agente (resposta adaptada demais ao desejo do operador).

**Em emergência:** ação humana imediata tem prioridade absoluta. O agente pode ser consultado após a situação estabilizada.

---

## 11. Checklist Antes de Usar em Campo

```
[ ] Estou em modo primário (declarei "opa" nesta sessão)?
[ ] O cenário é de apoio a decisão — não de obtenção de autorização?
[ ] Tenho os dados mínimos para uma análise confiável?
    [ ] Tipo de trabalho / estrutura
    [ ] Qualificação da equipe
    [ ] Equipamentos disponíveis
    [ ] Ponto(s) de ancoragem e características
    [ ] Plano de resgate (ao menos esboço)
[ ] Estou ciente de que o output é insumo — não instrução?
[ ] Haverá registro da consulta e da decisão final?
[ ] Supervisor humano está presente e ciente da consulta ao agente?
```

---

## 12. Checklist Depois de Usar

```
[ ] A resposta do agente foi registrada no histórico da sessão?
[ ] A decisão final (AUTORIZADO / NÃO AUTORIZADO) foi registrada por humano?
[ ] Lacunas apontadas pelo agente foram tratadas ou documentadas?
[ ] APR/PT refletem a análise realizada?
[ ] Alguma divergência agente vs. campo foi registrada?
[ ] O output foi comunicado a outro membro da equipe sem contexto adequado?
    → Se sim: corrigir imediatamente — output sem contexto pode ser mal interpretado.
```

---

## 13. Protocolo de Registro de Decisões

Todo uso do agente em campo deve gerar registro mínimo:

```
Data: ___________
Obra / Local: ___________
Supervisor responsável: ___________
Pergunta feita ao agente: ___________
Output recebido (resumo): ___________
Decisão humana final: [ ] AUTORIZADO  [ ] NÃO AUTORIZADO  [ ] AGUARDANDO DADO
Responsável pela decisão: ___________
Documento gerado (APR/PT nº): ___________
Observações / divergências: ___________
```

Este registro pode ser feito em papel, no próprio sistema de gestão da obra, ou no histórico do CORE-OS.

---

## 14. Limites Normativos

- A base documental do agente contém referências IRATA com `confidence:referencial`;
- **Vigência não confirmada automaticamente** — verificar edição vigente da norma antes de uso formal;
- NR-35 (ABNT) e normas do cliente podem ter requisitos adicionais não presentes na base IRATA;
- O agente não processa normas privadas ou procedimentos internos do cliente;
- Referências de inspeção de equipamentos (ABNT, EN, ANSI) são domínio do `inspection-agent`;
- Em conflito entre output do agente e norma verificada: a norma verificada prevalece.

---

## 15. Limites Documentais

- O agente não assina documentos;
- O agente não gera APR/PT prontas para execução;
- O agente não emite laudos técnicos;
- O agente não valida certificados de EPI ou equipamentos;
- O agente não acessa sistemas externos, ERPs, sistemas do cliente ou banco de dados de campo;
- Outputs são textuais — sem valor documental por si só;
- Registro de uso é responsabilidade do supervisor, não do agente.

---

## 16. Limites de Responsabilidade

```
O irata-agent é uma ferramenta de apoio técnico baseada em IA.

NÃO possui:
- Registro profissional
- Responsabilidade técnica
- Responsabilidade legal
- Capacidade de assumir obrigações
- Percepção de campo
- Acesso a condições reais do local de trabalho

A responsabilidade técnica e legal pelo trabalho em altura é exclusiva de:
- Supervisor IRATA N3 presente em campo
- Responsável Técnico habilitado
- Empresa executante
- Pessoas físicas e jurídicas competentes conforme legislação brasileira

O uso inadequado do agente — especialmente para obter "autorização" ou 
contornar requisitos de segurança — é responsabilidade exclusiva do operador humano.
```

---

*Criado em Iteração 6.5 — 2026-06-10*
*Agente: irata-agent — status: review_validated — active: false*
*Próxima revisão: após primeiro ciclo de uso monitorado documentado*
