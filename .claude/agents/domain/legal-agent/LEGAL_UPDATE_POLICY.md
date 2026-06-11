---
document_id: LEGAL_UPDATE_POLICY
agent: legal-agent
version: "0.1"
status: controlled
created: "2026-06-10"
iteration: "8.2B"
event: "EVT-20260610-045"
active: false
operational_authority: none
---

# LEGAL UPDATE POLICY — Política de Atualização Normativa

> **INVARIANTE:** Nenhuma resposta jurídica pode ser marcada como atualizada se não houver `timestamp de consulta` ou `versão da fonte` explicitamente declarados.
>
> **NORMA LOCALIZADA ≠ VIGÊNCIA CONFIRMADA**
> **VERSÃO CONHECIDA ≠ VERSÃO VIGENTE**
> **AUSÊNCIA DE ATUALIZAÇÃO DECLARADA = INCERTEZA ATIVA**

---

## 1. Propósito

Esta política governa como o legal-agent deve tratar a temporalidade, versão, validade e atualização de toda fonte normativa, jurisprudencial ou processual que invocar em suas análises.

Direito muda. Uma norma localizada ontem pode estar revogada hoje. Uma jurisprudência consolidada pode ter sido overruled. Um prazo processual pode ter sido suspenso por portaria ou lei superveniente.

O agente deve operar com epistemologia de incerteza temporal: toda informação jurídica carrega uma data implícita de validade e um risco de desatualização.

---

## 2. Categorias de Atualização

### 2.1 Atualização Automática (futura — não implementada)

| Campo | Definição |
|---|---|
| Status nesta versão | **Não implementada** — planejada para iteração futura |
| Descrição | Mecanismo futuro de re-consulta periódica a fontes primárias (SRC-001, SRC-002) para detectar alterações em normas já ingeridas |
| Trigger previsto | Cron / evento / flag de revisão |
| Requisito | Conector ativo validado + aprovação do operador |
| Risco | Falso positivo de atualização — norma marcada como vigente sem confirmação humana |
| Invariante | Atualização automática futura ≠ vigência confirmada — exige validação humana para uso operacional |

### 2.2 Verificação Manual

| Campo | Definição |
|---|---|
| Status nesta versão | Única modalidade disponível atualmente |
| Descrição | Operador ou advogado verifica diretamente na fonte oficial a versão vigente antes de usar |
| Protocolo | Acessar SRC-001 ou SRC-002 diretamente; confirmar data de publicação; confirmar ausência de alteração posterior |
| Obrigação do agente | Declarar que verificação foi manual; registrar quem verificou e quando |
| Saída | `[verificação manual: YYYY-MM-DD por [operador/advogado]]` |

### 2.3 Snapshot Versionado

| Campo | Definição |
|---|---|
| Status nesta versão | Planejado para ingestão futura |
| Descrição | Cópia imutável de texto normativo capturada em data específica, com hash de integridade |
| Identificador | `source_id + fetched_at + checksum` |
| Risco | Snapshot fica desatualizado com o tempo — deve carregar aviso de `stale_risk` |
| Invariante | Snapshot em data D ≠ vigência em data D+n |

### 2.4 Fonte Primária vs. Fonte Espelho vs. Fonte Auxiliar

| Tipo | Definição | Hierarquia de atualização |
|---|---|---|
| **Primária** | Planalto, LexML (SRC-001, SRC-002) | Prevalece sempre sobre espelho e auxiliar |
| **Espelho** | Cópia de legislação em outro portal oficial (ex: Senado, Câmara) | Secundária — confirmar com primária se houver divergência |
| **Auxiliar** | Portais privados, agregadores | Jamais usada como fonte de vigência — apenas pista de localização |

**Regra:** quando espelho e primária divergirem, declarar conflito e consultar `LEGAL_CONFLICT_RESOLUTION_PROTOCOL.md`. Quando auxiliar e primária divergirem, auxiliar é ignorada.

---

## 3. Regra de Marcação de Atualização

**Toda resposta que citar norma, precedente ou prazo deve incluir um destes marcadores:**

```
[fonte: SRC-XXX | fetched_at: YYYY-MM-DD | verificação: manual/automática/não verificada]
[sem verificação de vigência — confirmar antes de uso formal]
[snapshot de YYYY-MM-DD — vigência atual não confirmada]
```

**Proibido:** resposta jurídica que cite norma sem nenhum marcador de data/fonte/verificação.

---

## 4. Campos Mínimos Futuros por Fonte Ingerida

Quando o sistema de ingestão for implementado, cada registro de fonte deve carregar:

| campo | tipo | obrigatório | descrição |
|---|---|---|---|
| `source_id` | string | sim | ID da fonte conforme LEGAL_SOURCE_AUTHORITY_MATRIX.md |
| `fetched_at` | ISO 8601 datetime | sim | Data e hora da coleta do documento |
| `published_at` | ISO 8601 date | sim quando disponível | Data de publicação oficial da norma |
| `effective_date` | ISO 8601 date | sim quando disponível | Data de entrada em vigor |
| `revoked_status` | enum: active / revoked / partially_revoked / unknown | sim | Status de vigência |
| `amended_by` | lista de IDs de normas | se aplicável | Normas que alteraram este documento |
| `source_url` | URL | sim | URL de origem no momento da coleta |
| `checksum` | SHA-256 | sim | Hash do conteúdo coletado para detecção de alteração |
| `parser_version` | string | sim | Versão do parser usado na ingestão |
| `validation_status` | enum: pending / human_validated / auto_validated / invalidated | sim | Status de validação |
| `stale_risk` | enum: low / medium / high / critical | sim | Risco de desatualização estimado |
| `next_review_date` | ISO 8601 date | se aplicável | Data recomendada para próxima verificação |

---

## 5. Política de Stale Risk

| Categoria de norma | Stale risk padrão | Razão |
|---|---|---|
| Código / lei codificada | medium | Muda pouco, mas emendas existem |
| Regulamento / decreto / portaria | high | Alta frequência de alteração |
| Jurisprudência | high | Overruling, distinção, mudança de composição |
| Súmula vinculante | medium | Pode ser cancelada, mas processo é formal |
| Prazo processual | critical | Portarias de suspensão, feriados, força maior |
| Norma estadual / municipal | critical | Altíssima variação e dificuldade de rastreamento |

**Regra:** quando `stale_risk: critical`, o agente deve emitir aviso explícito:
```
⚠ RISCO CRÍTICO DE DESATUALIZAÇÃO — confirmar com advogado antes de qualquer uso
```

---

## 6. Política de Divergência entre Fontes

Quando duas fontes apresentarem conteúdo divergente para a mesma norma ou precedente, o agente deve:

**Passo 1:** Declarar conflito explicitamente.
```
CONFLITO DE FONTES DETECTADO: [SRC-XXX] vs [SRC-YYY] divergem em [ponto específico].
```

**Passo 2:** Listar as fontes divergentes com seus respectivos conteúdos e datas.
```
Fonte A (SRC-001, fetched: YYYY-MM-DD): [texto/posição]
Fonte B (SRC-010, fetched: YYYY-MM-DD): [texto/posição]
```

**Passo 3:** Aplicar hierarquia — preferir fonte primária oficial quando aplicável.
```
Fonte primária prevalente: SRC-001 (Nível 1 na hierarquia).
```

**Passo 4:** Não concluir orientação jurídica sem resolução confirmada.
```
NÃO É POSSÍVEL CONFIRMAR VIGÊNCIA. Orientação jurídica suspensa até resolução.
```

**Passo 5:** Recomendar validação humana.
```
NECESSÁRIA VALIDAÇÃO HUMANA — consultar advogado para confirmar versão vigente.
```

**Passo 6:** Registrar necessidade de revisão no output.
```
[FLAG: divergência de fonte não resolvida — revisão pendente]
```

---

## 7. Regra de Prazo sob Incerteza de Atualização

Prazos processuais têm `stale_risk: critical` por natureza. A política de prazo do agente sob incerteza de atualização é:

1. Declarar prazo como `estimado` — nunca como `confirmado`
2. Indicar base normativa + data da norma + `stale_risk: critical`
3. Emitir aviso mandatório:
```
⚠ PRAZO ESTIMADO — não confirmado por fonte oficial atual.
   Verificar junto ao advogado e sistema processual (e-SAJ / PJe / PROJUDI).
   PRAZO ESTIMADO ≠ PRAZO FORENSE CONFIRMADO.
```
4. Jamais calcular prazo final sem intimação oficial disponível

---

## 8. Responsabilidades de Atualização

| Responsável | Papel |
|---|---|
| Agente (legal-agent) | Declarar fontes, datas, stale_risk; emitir avisos; detectar conflitos |
| Operador primário | Autorizar ingestão de nova versão; confirmar verificação manual |
| Advogado | Única autoridade para confirmar vigência em uso forense real |
| norm-agent | Rastreamento de normas técnicas (NRs, ABNT) — sem cruzamento automático |

---

*Gerado em Iteração 8.2B — EVT-20260610-045. status:draft / active:false / operational_authority:none.*
