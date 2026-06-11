---
document_id: LEGAL_SOURCE_AUTHORITY_MATRIX
agent: legal-agent
version: "0.1"
status: controlled
created: "2026-06-10"
iteration: "8.2B"
event: "EVT-20260610-045"
active: false
operational_authority: none
---

# LEGAL SOURCE AUTHORITY MATRIX — Matriz de Autoridade de Fontes Jurídicas

> **INVARIANTE ABSOLUTO:** Fonte oficial mapeada pode sustentar pesquisa, mas **não autoriza orientação jurídica operacional** sem validação humana ou estágio futuro formalmente aprovado.
>
> **FONTE MAPEADA ≠ FONTE CONSULTADA ≠ ORIENTAÇÃO JURÍDICA ≠ PRAZO CONFIRMADO ≠ VIGÊNCIA GARANTIDA**

---

## 1. Hierarquia de Autoridade

```
NÍVEL 1 — NORMATIVA PRIMÁRIA          ← maior autoridade epistêmica
  Planalto / Portal da Legislação
  LexML Brasil

NÍVEL 2 — LEGISLATIVA / PROCESSUAL
  Senado Federal Dados Abertos
  Câmara dos Deputados Dados Abertos

NÍVEL 3 — JURISPRUDENCIAL VINCULANTE
  STF (súmulas vinculantes, acórdãos)
  STJ Dados Abertos

NÍVEL 4 — PROCESSUAL / METADADOS
  CNJ DataJud

NÍVEL 5 — PUBLICAÇÃO OFICIAL
  Diário Oficial da União / Imprensa Nacional (DOU)

NÍVEL 6 — FONTE REGIONAL (FUTURA)
  Tribunais Regionais (TRTs, TRFs, TJs)
  Procuradorias Estaduais

NÍVEL 7 — AUXILIAR / NÃO AUTORITATIVA ← menor autoridade epistêmica
  Jusbrasil, Escavador, Migalhas, ConJur, outras
```

**Regra de hierarquia:** quando duas fontes divergem, a de nível inferior não pode sobrepor a de nível superior. Ver `LEGAL_CONFLICT_RESOLUTION_PROTOCOL.md`.

---

## 2. Definição de Categorias

| Categoria | Definição | Uso operacional |
|---|---|---|
| **Normativa primária** | Texto legal oficial publicado por órgão com competência legislativa ou regulatória federal | Sustenta análise com indicação de fonte e data de consulta |
| **Legislativa/processual** | Bases de dados dos poderes legislativos que publicam texto de lei aprovado | Sustenta análise, sujeita a confirmação de versão vigente |
| **Jurisprudencial** | Decisões, súmulas e precedentes de tribunais superiores | Sustenta hipótese, nunca afirma tese sem qualificação e data |
| **Processual/metadados** | Dados sobre andamento processual, mas sem texto de decisão completo | Referência de situação, não fonte de mérito |
| **Publicação oficial** | Publicações em diário oficial — normas, editais, atos administrativos | Sustenta pesquisa de publicação, não de interpretação |
| **Regional (futura)** | Tribunais e órgãos estaduais/regionais — mapeamento pendente | Fonte futura — não disponível operacionalmente nesta versão |
| **Auxiliar/não autoritativa** | Portais privados, agregadores, blogs jurídicos, feeds | Jamais base final — somente pista para localizar fonte primária |

---

## 3. Matriz de Fontes

> Tabela de referência. Nenhuma fonte está ativa operacionalmente. Acesso e uso dependem de iteração futura com aprovação do operador e implementação de conectores.

| source_id | nome | instituição mantenedora | tipo | autoridade operacional | acesso previsto | formato provável | uso permitido | uso proibido | risco | prioridade |
|---|---|---|---|---|---|---|---|---|---|---|
| SRC-001 | Planalto / Portal da Legislação | Presidência da República | Normativa primária | referencial (não operacional) | HTML / busca pública | HTML estruturado | Localizar texto vigente de lei federal; confirmar numeração | Afirmar vigência sem data de consulta; substituir LexML sem verificação | Atualização com lag; formato HTML variável | P1 |
| SRC-002 | LexML Brasil | Senado Federal / ILB | Normativa primária | referencial (não operacional) | XML-SRU / API pública | XML (LexML) | Recuperar texto estruturado de lei; comparar versões; identificar alterações | Ingerir sem parser validado; usar dados de cache antigo sem revalidação | Parser complexo; versões podem não cobrir normas recentes | P1 |
| SRC-003 | Senado Federal Dados Abertos | Senado Federal | Legislativa | referencial (não operacional) | CKAN / API REST / CSV | JSON / XML / CSV | Consultar histórico legislativo; identificar autoria de PL; verificar votações | Usar como fonte de texto de lei vigente sem cruzar com Planalto/LexML | Dados legislativos ≠ texto promulgado vigente | P2 |
| SRC-004 | Câmara dos Deputados Dados Abertos | Câmara dos Deputados | Legislativa | referencial (não operacional) | API REST / JSON | JSON | Consultar tramitação; identificar autoria; histórico de votações | Usar como fonte definitiva de texto legal sem validação cruzada | Mesmo risco do Senado; dados ≠ texto promulgado | P2 |
| SRC-005 | CNJ DataJud | CNJ | Processual/metadados | referencial (não operacional) | API pública / CKAN | JSON | Consultar andamento de processos por número; estatísticas de tribunais | Extrair texto de decisões; calcular prazo forense; substituir consulta ao advogado | Metadados de situação processual ≠ teor da decisão | P2 |
| SRC-006 | STJ Dados Abertos / Jurisprudência | STJ | Jurisprudencial vinculante | referencial (não operacional) | Portal público / API | HTML / JSON | Localizar acórdãos, súmulas, precedentes vinculantes | Afirmar que precedente se aplica sem análise fática; usar sem número e data | Jurisprudência evolui; overruling não capturado sem atualização | P1 |
| SRC-007 | STF — Jurisprudência e Súmulas Vinculantes | STF | Jurisprudencial vinculante | fonte futura a mapear | Portal público | HTML / PDF | Localizar súmulas vinculantes, ADI/ADC, decisões plenárias | Aplicar súmula sem verificar vigência e cancellamento; usar ADI sem data | Súmula pode ser cancelada; decisão liminar ≠ definitiva | P1 |
| SRC-008 | Diário Oficial da União / Imprensa Nacional | Casa Civil / Imprensa Nacional | Publicação oficial | referencial (não operacional) | Portal público / API DOU | HTML / XML | Localizar publicação de norma, edital, ato administrativo federal | Extrair texto normativo sem cruzar com Planalto/LexML; afirmar vigência pela data de publicação | DOU ≠ compilação vigente; emendas publicadas separadamente | P2 |
| SRC-009 | Tribunais Regionais (TRTs, TRFs, TJs estaduais) | Tribunais Regionais | Regional (futura) | fonte futura — não mapeada nesta versão | Variável por tribunal | Variável | Futuro: localizar jurisprudência regional relevante | Usar nesta versão como base jurisprudencial sem mapeamento individual | Alta heterogeneidade de APIs; scraping arriscado | P3 |
| SRC-010 | Jusbrasil | Jusbrasil (privado) | Auxiliar/não autoritativa | **zero — jamais fonte primária** | Portal privado | HTML | Pista de localização de jurisprudência; localizar número de processo para busca em fonte oficial | Citar como fonte; afirmar vigência; usar ementa resumida sem confirmar texto original | Agregador privado: dados podem ser incompletos, desatualizados ou mal indexados | Aux |
| SRC-011 | Escavador | Escavador (privado) | Auxiliar/não autoritativa | **zero — jamais fonte primária** | Portal privado | HTML | Localização inicial de partes em processos públicos | Afirmar resultado processual; usar sem cruzar com fonte oficial | Agrega dados públicos com processamento próprio; não substitui pesquisa oficial | Aux |
| SRC-012 | Migalhas | Migalhas (privado) | Auxiliar/não autoritativa | **zero** | Portal editorial | HTML | Acompanhar notícias sobre mudanças legislativas e jurisprudenciais | Usar como fonte de texto legal ou precedente; afirmar vigência normativa | Conteúdo editorial, não oficial; delay e seleção editoriais | Aux |
| SRC-013 | ConJur | Consultor Jurídico (privado) | Auxiliar/não autoritativa | **zero** | Portal editorial | HTML | Acompanhar tendências doutrinárias e repercussões de decisões | Usar como fonte primária de qualquer decisão ou norma | Mesmos riscos de Migalhas; opinião doutrinária ≠ precedente | Aux |

---

## 4. Regras de Uso por Categoria

### 4.1 Fontes Primárias (SRC-001, SRC-002)

- Uso permitido: localizar texto vigente, confirmar numeração, comparar versões
- Obrigação: sempre indicar URL + data de consulta
- Proibição: afirmar vigência sem verificar se houve alteração posterior à data de consulta
- Regra de saída: toda resposta com base em fonte primária deve incluir `[fonte: SRC-XXX, consultada: YYYY-MM-DD, versão confirmada: sim/não]`

### 4.2 Fontes Jurisprudenciais (SRC-006, SRC-007)

- Uso permitido: localizar acórdão, súmula, precedente; sustentar hipótese jurídica
- Obrigação: citar número, tribunal, data, relator quando disponível
- Proibição: afirmar que precedente se aplica sem análise fática; usar súmula cancelada
- Regra de saída: `HIPÓTESE JURÍDICA SUSTENTADA EM [SRC-006/007] — NÃO CONSTITUI TESE VALIDADA`

### 4.3 Fontes Auxiliares (SRC-010 a SRC-013)

- Uso permitido: pista de localização; verificar se há cobertura para guiar busca em fonte oficial
- Proibição absoluta: usar como fonte final; citar como base jurídica; afirmar vigência
- Regra de saída: qualquer informação de fonte auxiliar deve ser marcada como `[fonte auxiliar — verificar em fonte oficial antes de usar]`

### 4.4 Fontes Futuras (SRC-007, SRC-009)

- Status: mapeadas como futuras — sem conector, sem acesso ativo
- Uso: referência de design apenas
- Proibição: tratar como ativas nesta versão

---

## 5. Invariantes desta Matriz

```
FONTE MAPEADA ≠ FONTE CONSULTADA
FONTE CONSULTADA ≠ VIGÊNCIA CONFIRMADA
VIGÊNCIA CONFIRMADA ≠ ORIENTAÇÃO JURÍDICA OPERACIONAL
PRECEDENTE LOCALIZADO ≠ TESE APLICÁVEL
PUBLICAÇÃO DOU ≠ TEXTO CONSOLIDADO
FONTE AUXILIAR ≠ BASE JURÍDICA
```

---

*Gerado em Iteração 8.2B — EVT-20260610-045. status:draft / active:false / operational_authority:none.*
