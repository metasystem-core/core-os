---
tipo: integration_review_final
source_id: SRC-SIMB-011
task: TASK 21G — JUNG_DREAMS_FINAL_SOURCE_INTEGRATION_REVIEW_AND_COMMIT_001
data: 2026-06-20
status: complete
scope: todos os achados de Tasks 21A–21F — nenhuma leitura nova nesta task
nota: revisão de integração apenas — nenhum patch aplicado, nenhum card criado
---

# JUNG_DREAMS_FINAL_SOURCE_INTEGRATION_REVIEW_001

## 1. Identificação da Fonte

| Item | Valor |
|---|---|
| source_id | SRC-SIMB-011 |
| título | Dreams |
| autor | C. G. Jung (trans. R. F. C. Hull) |
| publicação | Princeton / Bollingen Series XX / CW Selected Vol. |
| ano | 1974 |
| origem | Compilação de CW Vols. 4, 8, 12, 16 |
| pages | ~380 pp PDF |
| source_class | primary_jungian_source |
| status anterior | phase_1_structure_read |
| status agora | read_complete / integration_reviewed / pending_promotion_patch |

---

## 2. Trajetória de Leitura Completa

| Part | Ensaios | §§ | PDF pp | Task | Findings | Status |
|---|---|---|---|---|---|---|
| Part I — Dreams and Psychoanalysis | The Analysis of Dreams + On the Significance of Number Dreams | §64–94, §129–153 | 27–44 | TASK 21F | 12 (histórico-críticos) | COMPLETE |
| Part II — Dreams and Psychic Energy | General Aspects of Dream Psychology + On the Nature of Dreams | §443–569 | 47–108 | TASK 21A | 18 (teoria central) | COMPLETE |
| Part III — The Practical Use of Dream-Analysis | (mesmo título) | §294–352 | 110–132 | TASK 21C | 9 (protocolo clínico) | COMPLETE |
| Part IV — Individual Dream Symbolism in Relation to Alchemy (Block 1) | Initial Dreams | §44–135 | 134–191 | TASK 21D | 18 (série alquímica) | COMPLETE |
| Part IV — Individual Dream Symbolism in Relation to Alchemy (Block 2) | The Symbolism of the Mandala | §122–331 | 193–321 | TASK 21E | 18 (mandala + Self) | COMPLETE |

**Todos os 6 ensaios de SRC-SIMB-011 foram processados. Nenhuma seção restante.**

---

## 3. Mapa de Estabilidade Cruzada

Princípios que aparecem em múltiplas partes são os mais sólidos para promoção.

| Princípio | Part I | Part II | Part III | Part IV B1 | Part IV B2 | Estabilidade |
|---|---|---|---|---|---|---|
| Sonho como produto autônomo e significativo | §65 | §443 | §305 | §44 | §122 | MÁXIMA — 5 partes |
| Anti-dicionário simbólico | (ausente — método inverso) | §475, §548 | §320, §335 | §49-50 | §200, §280 | ALTA — 4 partes |
| Contexto pessoal antes de coletivo | (ausente em Part I) | §463 | §295, §318 | §49, §78 | §200 | ALTA — 4 partes |
| Postura de ignorância metodológica | (ausente) | §533 | §296 | §57 | §274 | ALTA — 4 partes |
| Compensação como princípio | (wish-fulfillment em Part I) | §447, §488 | §330, §340 | §64 | §122 | ALTA (madura: 4 partes) |
| Série > sonho isolado | (ausente) | §526, §568 | §305, §327 | §44, §57 | §122, §325 | ALTA — 4 partes |
| Inação como resposta válida | (ausente) | §533 | §296 | §57 | §274 | MÉDIA — 3 partes |
| Nível subjetivo como default | (ausente) | §475, §510 | §315, §318 | (implícito) | (implícito) | MÉDIA — 2 explícitas |
| Função prospectiva ≠ profecia | (ausente) | §493 | §330, §341 | §88 | §307 | MÉDIA — 3 partes |
| Assentimento mútuo exigido | (contrário em Part I) | (princípio geral) | §295, §296 | §49-50 | (implícito) | MÉDIA |
| Self = incognoscível / Ding an sich | (ausente) | §517 | (implícito) | §62 | §280, §327 | ALTA — 3 partes explícitas |
| Mandala não é técnica | (N/A) | (N/A) | (N/A) | (N/A) | §123, §200 | Part IV B2 primária |
| Processo é espiral, não linear | (N/A) | §568 | (implícito) | §57, §60 | §325-326 | MÉDIA — 3 partes |

---

## 4. Trajetória Histórica: Part I → Parts II–IV

A leitura integral revela a magnitude da revisão de Jung entre 1909 e 1934–1945.

| Posição | Part I (Jung 1909) | Parts II–IV (Jung maduro, 1934–1945) |
|---|---|---|
| Estrutura do sonho | Manifesto / latente (façade) | Manifesto IS o sonho — sem façade |
| Função | Realização de desejo (Freud) | Compensação + função prospectiva |
| Método | Associação livre (sem retorno à imagem) | Amplificação dirigida (retorno à imagem) |
| Postura do intérprete | Expert decodificador | Ignorância metodológica; intérprete pode estar errado |
| Sexual | Chave interpretativa universal | Anti-reductivismo; símbolo como desconhecido |
| Nexo causal | Passado / conflito reprimido | Prospectivo + compensatório |
| Arquitetura psíquica | Id / ego / censor | Consciente / inconsciente pessoal / coletivo / Self |
| Validação | Analista deduz e "submete" | Assentimento genuíno do sonhador |

**Implicação para Iris:** Part I é material histórico-crítico valioso para *contextualizar* a evolução de Jung, mas não para *operar*. Qualquer conceito de Part I que sobreviva deve ser validado por presença no corpus maduro.

---

## 5. Sumário de Promoção

### 5.1 Protocol Notes (PP e PH)

| ID | Nome breve | Origem | Prioridade | Ação |
|---|---|---|---|---|
| PP-001 | Contexto antes da imagem | Task 21A/21B | IMEDIATA | Patch DREAM_ANALYSIS_PROTOCOL |
| PP-002 | Ignorância metodológica | Task 21A/21B | IMEDIATA | Patch DREAM_ANALYSIS_PROTOCOL |
| PP-003 | Nível subjetivo como default | Task 21A/21B | IMEDIATA | Patch protocolo + novo CON card |
| PP-004 | Não literalizar sexual | Task 21A/21B | IMEDIATA | Calibração firewall existente |
| PP-005 | Grande vs. pequeno sonho | Task 21A/21B | MÉDIA | Aguardar exemplo em uso |
| PP-006 | Série de sonhos longitudinal | Task 21A/21B | ALTA | Patch protocolo |
| PP-007 | Sonho reativo: não forçar | Task 21A/21B | MÉDIA | Aguardar Part III nuance ✓ (já lida) |
| PP-008 | Parar: contexto insuficiente | Task 21A/21B | ALTA | Patch protocolo |
| PP-009 | Assimetria etária (imago) | Task 21A/21B | ALTA | Calibração F-15/F-16 |
| PP-010 | Telepatia: reconhecer sem endossar | Task 21A/21B | MÉDIA | Calibração F-06 |
| PP-011 | Amplificação em ordem | Task 21A/21B | ALTA | Reforço CON-038 |
| PP-012 | Não prescrever ação | Task 21A/21B | IMEDIATA | Reforço F-04 no protocolo |
| PP-013 | Assentimento mútuo | Task 21C | IMEDIATA | Patch protocolo |
| PP-014 | Risco de sugestão | Task 21C | IMEDIATA | Patch protocolo |
| PP-015 | Contexto consciente como pré-requisito | Task 21C | IMEDIATA | Patch protocolo |
| PP-016 | Obscuridade = limitação do intérprete | Task 21C | IMEDIATA | Patch protocolo |
| PP-017 | Sonho isolado = baixa certeza | Task 21C | IMEDIATA | Patch protocolo |
| PP-018 | Manifesto IS o sonho | Task 21C | IMEDIATA | Patch protocolo (bloqueia PH-001) |
| PP-019 | Questão de compensação | Task 21C | ALTA | Patch protocolo |
| PP-020 | Símbolo como desconhecido para esta pessoa | Task 21C | ALTA | Patch protocolo |
| PP-021 | Assimilação ≠ substituição | Task 21C | ALTA | Patch protocolo |
| PP-022 | Anti-confirmação | Task 21D | IMEDIATA | Patch protocolo |
| PP-023 | Pessoal antes de coletivo | Task 21D | IMEDIATA | Patch protocolo |
| PP-024 | Sem amplificação sem série | Task 21D | IMEDIATA | Patch protocolo |
| PP-025 | Conflito não resolvido por interpretação | Task 21D | ALTA | Patch protocolo |
| PP-026 | Sem nomeação arquetípica antes de padrão | Task 21D | IMEDIATA | Patch protocolo |
| PP-027 | Sem mandala como técnica | Task 21E | IMEDIATA | Patch protocolo |
| PP-028 | Incompletude quaternária: notar sem nomear | Task 21E | ALTA | Patch protocolo |
| PP-029 | Centro é incognoscível | Task 21E | IMEDIATA | Patch protocolo |
| PP-030 | Recorrência = espiral, não regressão | Task 21E | ALTA | Patch protocolo |
| PP-031 | Voz autorizada = peso diferenciado | Task 21E | ALTA | Patch protocolo |
| PH-001 | Manifesto/latente HISTÓRICO | Task 21F | NÃO PROMOVER | Documentação histórica apenas |
| PH-002 | Wish-fulfillment HISTÓRICO | Task 21F | NÃO PROMOVER | Documentação histórica apenas |
| PH-003 | Resistência como indicador | Task 21F | MÉDIA | Verificar conflito com PP-014 antes |
| PH-004 | Números = aritmética pessoal | Task 21F | ALTA | Patch protocolo (sem dependência) |
| PH-005 | Free association HISTÓRICA | Task 21F | NÃO PROMOVER | Documentação histórica apenas |
| PH-006 | Censor freudiano HISTÓRICO | Task 21F | NÃO PROMOVER | Documentação histórica apenas |

**Contagem:** 12 patches IMEDIATOS, 11 ALTA, 5 MÉDIA, 4 NÃO PROMOVER.

### 5.2 Risk Cards

| Bloco | IDs | Count | Prioridade geral | Nota |
|---|---|---|---|---|
| Task 21A (teoria central) | RISK-JUNG-001 a RISK-JUNG-010 | 10 | 7 HIGH, 3 MEDIUM | RISK-001 (fixed symbol), RISK-002 (profetica), RISK-004 (telepatia), RISK-007 (projeção pessoa real) = HIGH imediato |
| Task 21C (prático) | RISK-JUNG-011 a RISK-JUNG-017 | 7 | 5 HIGH, 2 MEDIUM | RISK-015 (diagnóstico), RISK-017 (jargon loop) = HIGH imediato |
| Task 21D (Block 1) | RISK-JUNG-018 a RISK-JUNG-023 | 6 | 4 HIGH, 2 hold | RISK-018 (sombra como causa), RISK-019 (amplificação prematura) = HIGH |
| Task 21E (Block 2) | RISK-JUNG-024 a RISK-JUNG-028 | 5 | 4 HIGH, 1 hold | RISK-024 (mandala técnica), RISK-026 (inflação epistêmica) = HIGH |
| Task 21F (histórico) | RISK-H-001 a RISK-H-005 | 5 | 4 promover, 1 hold | RISK-H-001 (colapso histórico), RISK-H-004 (autoridade) = HIGH imediato |

**Total de risk cards gerados:** 33 (28 RISK-JUNG + 5 RISK-H)

### 5.3 CON Cards Identificados para Criação

| Conceito proposto | Origem | Dependência | Prioridade |
|---|---|---|---|
| Nível subjetivo vs. objetivo | Task 21A/21B (CC-JUNG-003) | PP-003 | HIGH |
| Imago e projeção | Task 21A/21B (CC-JUNG-004) | PP-003, PP-009 | HIGH |
| Função prospectiva | Task 21A/21B (CC-JUNG-002) | (nenhuma) | HIGH |
| Calibração CON-037 (3 modos compensação) | Task 21A/21B (CC-JUNG-001) | (nenhuma) | HIGH |
| Grande vs. pequeno sonho | Task 21A/21B (CC-JUNG-006) | (aguardar uso) | MÉDIA |
| Estrutura dramática do sonho | Task 21A/21B (CC-JUNG-005) | Part IV uso in vivo ✓ | MÉDIA |
| Sonho reativo | Task 21A/21B (CC-JUNG-008) | Part III ✓ lida | MÉDIA |
| Extensão CON-039 (série + individuação) | Task 21A/21B (CC-JUNG-011) | Part III ✓ lida | ALTA |
| Mandala e quaternidade | Task 21E | Block 2 ✓ lida | ALTA |
| Self = Ding an sich | Task 21E | Block 2 ✓ lida | ALTA |

---

## 6. O Que Não Deve Ser Aplicado Ainda

| Item | Razão |
|---|---|
| Patches no DREAM_ANALYSIS_PROTOCOL | Aguardam task de patch autorizada explicitamente |
| Criação de CON cards finais | Aguardam task de patch autorizada |
| Modificação da skill dream-analysis | Aguardam task de patch autorizada |
| Modificação do AGENT.md | Aguardam task de patch autorizada |
| Modificação de CONCEPTS_REGISTRY | Aguardam task de patch autorizada |
| Modificação de DREAM_REGISTRY | Aguardam task de patch autorizada |
| Promoção de PH-003 (resistência) | Verificar conflito com PP-014 antes |
| Promoção de RISK-H-005 (reductivismo) | Consolidar com RISK-JUNG-018/019 antes |

---

## 7. Laços de Reforço Cruzado

Pares de PP notes que se reforçam mutuamente — sugeridos para promoção conjunta:

- **PP-001 + PP-015** — contexto antes da imagem (Part II) + contexto como pré-requisito (Part III): mesma regra de dois ângulos
- **PP-002 + PP-016** — ignorância metodológica (Part II) + obscuridade = limitação do intérprete (Part III): mesma postura epistêmica
- **PP-013 + PP-014** — assentimento mútuo + risco de sugestão: par inseparável (Part III §295)
- **PP-023 + PP-026** — pessoal antes de coletivo + sem nomeação arquetípica antes de padrão: mesma regra de sequência (Part IV B1)
- **PP-024 + PP-011** — sem amplificação sem série (B1) + amplificação em ordem (Part II): mesma regra de amplificação
- **PP-027 + PP-029** — sem mandala como técnica + centro incognoscível: par do Block 2 (B2)
- **PH-004 + RISK-H-003** — números = aritmética pessoal (promotable) + risco de numerologia: promover juntos

---

## 8. Veredicto Final

**SRC-SIMB-011 é a fonte primária mais sólida e mais densamente fundamentada do corpus atual de SIMB.**

Enquanto Hall (SRC-SIMB-010) forneceu o framework operacional inicial (CON-036–039, protocolo v0.1), Jung direto fornece:
- Autoridade primária para cada regra já em uso
- Extensões críticas ausentes em Hall (nível subjetivo/objetivo, imago, função prospectiva, Self)
- Limites explícitos (o que não fazer, quando parar)
- Fundamento histórico para entender o que Iris *evita* (Part I)

A série de Tasks 21A–21F processou o livro integralmente com:
- 75+ findings com evidence_status explícito
- 33 risk cards (28 JUNG + 5 H)
- 31 protocol notes (PP-001 a PP-031) + 6 históricas (PH-001 a PH-006)
- 12 patches de prioridade IMEDIATA identificados
- 15 eval candidates definidos

**Nenhuma promoção deve ocorrer antes de task de patch autorizada pelo operador.**

---

*Revisão de integração final de SRC-SIMB-011. TASK 21G. 2026-06-20.*
*Derivado de: Tasks 21A, 21B, 21C, 21D, 21E, 21F.*
*Nenhuma leitura nova de fonte primária realizada nesta task.*
