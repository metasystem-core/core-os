# IRATA SOURCE COVERAGE AUDIT — Iteração 6.2d
**Data:** 2026-06-09 | **Conduzido por:** CORE-OS / Claude Code
**Escopo:** Auditoria documental do IRATA-CORE — não é processamento final, não altera agente, não autoriza campo.

---

## 1. Status da Auditoria

```
Tipo: source_coverage_audit
Escopo: domínio irata-agent / IRATA-CORE
AGENT.md: NÃO alterado
agents_registry.yaml: NÃO alterado
Skills: NÃO alteradas
RAG: NÃO implementado
Arquivos existentes: NENHUM apagado ou movido
Autorização de trabalho: NENHUMA gerada
Norma privada: NENHUMA baixada ou redistribuída

Resultado principal:
  ICOP TC-102 (EN + PT): OBTIDO — gap crítico resolvido
  TACS TC-101 (EN + PT): OBTIDO — gap crítico resolvido
  Safety Bulletins 042–051 (EN): OBTIDOS
  NRs ausentes: pending_user_download (gov.br bloqueia curl)
  NBRs privadas: privado_nao_baixar — operador deve fornecer
```

---

## 2. Diagnóstico Local — O que Existia Antes desta Iteração

### Base de Skills

A skill `irata-n3` possuía:
- **SKILL.md** — especificação completa com 12 sub-skills, 9 templates, 2 checklists
- **9 templates** em `/templates/`: procedimento_acesso, plano_resgate, plano_ancoragem, matriz_equipe, matriz_equipamentos, relatorio_supervisao, pacote_documental, matriz_lacunas, checklist_liberacao
- **2 checklists** em `/checklists/`: irata_n3_document_review, field_quick_checklist
- **norm_profile.yaml** — perfil normativo completo com NRs mapeadas
- **12 sub-skills** estruturadas em `/sub/`

Avaliação: **base de skill bem estruturada** — templates e checklists prontos para uso operacional.

### Base Normativa (norm_library)

**NRs processadas (blocos rastreáveis):**
- NR-35/2025: **57 blocos** em `blocks/irata-n3/` + **58 blocos** em `public_official/NRs/blocks/`
- NR-33/2022: **93 blocos** em `public_official/NRs/blocks/` — espaço confinado
- NR-06/2025: **58 blocos** em `public_official/NRs/blocks/` — EPI/CA
- NR-13/2023: **163 blocos** em `public_official/NRs/blocks/` — caldeiras
- Total blocos processados relevantes para IRATA: ~**371 blocos**

**Infraestrutura disponível:**
- Norm library com schema v1.2 funcional
- Índices, logs de ingestão, registries de fontes, lacunas documentadas
- Sistema de blocos JSONL testado em 11+ NRs

**O que FALTAVA antes desta iteração:**
- **ICOP/TACS**: AUSENTES (gap crítico — lacuna declarada desde Iteração 6.0)
- Safety Bulletins: AUSENTES
- NR-01, NR-10, NR-37, NR-20: AUSENTES (NRs de suporte)
- Todas as NBRs de EPI anti-queda: AUSENTES

---

## 3. Cobertura IRATA

### ICOP — International Code of Practice

| Item | Status Anterior | Status Atual | Arquivo |
|---|---|---|---|
| TC-102ENG V002 | **AUSENTE** (gap crítico) | **PRESENTE** raw_pdf | `raw_public_sources/IRATA_ICOP_TC-102ENG_V002.pdf` (6.0 MB) |
| TC-102BRA V001 | AUSENTE | **PRESENTE** raw_pdf | `raw_public_sources/IRATA_ICOP_TC-102BRA_V001.pdf` (8.5 MB / 289 pp) |
| ICOP Annex R — Rescue | AUSENTE | AUSENTE | pending_download — Iteração 6.2e |
| ICOP em blocos processados | AUSENTE | AUSENTE | pending_processing — Iteração 6.2e |

**Avaliação:** Gap crítico ICOP parcialmente resolvido — raw PDFs obtidos. Processamento pendente.

### TACS — Training, Assessment and Certification Scheme

| Item | Status Anterior | Status Atual | Arquivo |
|---|---|---|---|
| TC-101ENG V006 | **AUSENTE** (gap crítico) | **PRESENTE** raw_pdf | `raw_public_sources/IRATA_TACS_TC-101ENG_V006.pdf` (1.1 MB) |
| TC-101BRA V006 | AUSENTE | **PRESENTE** raw_pdf | `raw_public_sources/IRATA_TACS_TC-101BRA_V006.pdf` (988 KB) |
| TACS em blocos processados | AUSENTE | AUSENTE | pending_processing — Iteração 6.2e |

**Avaliação:** Gap crítico TACS parcialmente resolvido — raw PDFs obtidos. Processamento pendente.

### Safety Bulletins

| Item | Status Anterior | Status Atual |
|---|---|---|
| SB-042 a SB-051 (EN) | AUSENTES | **PRESENTES** raw_pdf (10 arquivos) |
| SB-042 a SB-049 (PT) | AUSENTES | AUSENTES — disponíveis em irata.org |
| Versões processadas | AUSENTES | AUSENTES — pending_processing |

**SBs mais críticos para IRATA:**
- **SB-044:** Rope Access Main Rope Failure — falha na corda principal
- **SB-045:** Fall from Height: Aid Climbing — queda em escalada auxiliar
- **SB-048:** Use of Telehandler as an Anchor — ancoragem inadequada
- **SB-050:** Confined Space: The Hazards — espaço confinado em altura
- **SB-051:** Dropped and Falling Objects — objetos caindo

### Topic Sheets

| Item | Status | Obs |
|---|---|---|
| Todos os topic sheets | AUSENTES | Disponíveis em irata.org — listar e baixar em 6.2e |

---

## 4. Cobertura NR

### NRs PRESENTES com blocos processados

| Norma | Blocos | Relevância IRATA | Vigência |
|---|---|---|---|
| **NR-35** (2025) | 57+58 blocos | **CRÍTICA** — trabalho em altura | nao_confirmada |
| **NR-33** (2022) | 93 blocos | Alta — espaço confinado | nao_confirmada |
| **NR-06** (2025) | 58 blocos | **CRÍTICA** — EPI e CA | nao_confirmada |
| NR-13 (2023) | 163 blocos | Média — interface inspeção/caldeiras | nao_confirmada |
| NR-34 (2023) | 409 blocos | Baixa — naval | nao_confirmada |
| NR-22 (2026) | 530 blocos | Baixa — mineração | nao_confirmada |

**NR-35 é a base normativa primária para irata-agent e está bem processada.**

### NRs AUSENTES prioritárias para IRATA

| Norma | Descrição | Prioridade | Por que IRATA | Status |
|---|---|---|---|---|
| **NR-01** | Gerenciamento de Riscos e SST | P1 | PGR obrigatório para operações | pending_user_download |
| **NR-10** | Segurança em Instalações Elétricas | P1 | Trabalho próximo a tensão em altura | pending_user_download |
| **NR-37** | Plataformas de Petróleo Offshore | P1 | Acesso por cordas em O&G offshore | pending_user_download |
| **NR-20** | Inflamáveis e Combustíveis | P2 | Atm explosiva em refinaria/petroquímica | pending_user_download |
| NR-07 | PCMSO | P2 | Aptidão médica para altura | pending_user_download |
| NR-12 | Máquinas e Equipamentos | P2 | Interface manutenção em altura | pending_user_download |
| NR-18 | Construção Civil | P2 | Obras em altura | pending_user_download |
| NR-23 | Proteção contra Incêndio | P3 | Plano de emergência | pending_user_download |
| NR-26 | Sinalização de Segurança | P3 | Isolamento de área | pending_user_download |

**gov.br bloqueia curl** — todas NRs ausentes requerem download manual pelo operador.

**ALERTA GLOBAL DE VIGÊNCIA:** Todas as NRs presentes na base têm `vigencia: nao_confirmada`. Confirmar versão vigente no DOU/portal MTE antes de uso em documentação formal.

---

## 5. Cobertura ABNT/NBR

### NBRs de EPI Anti-queda e Acesso por Corda (IRATA-específicas)

**Status: TODAS AUSENTES da base.**

Normas esperadas e não encontradas:
- NBR 15986 (Ancoragem), NBR 15836 (Conectores), NBR 15837 (Arnês), NBR 14626 (Trava-queda retrátil), NBR 14627 (Linha rígida), NBR 14628 (Absorvedor), NBR 14629 (Cinturão), NBR 15834 (Acesso por corda), NBR 16325 (Cadeira suspensa), NBR 16489 (Mosquetões)

**Por que ausentes:** Normas privadas ABNT — não foram baixadas e não devem ser baixadas sem cópia autorizada. A base não possui cópias autorizadas dessas normas específicas.

**Impacto operacional:**
- irata-agent pode operar com NR-35 + ICOP + TACS como referência primária
- Para rastreabilidade de EPI específica (ex: tipo de arnês, carga de ruptura de conector): sem NBRs, o agente deve declarar lacuna e referenciar o manual do fabricante + CA (NR-06)
- NBR 15834 (acesso por corda) é a mais relevante — considerar fornecimento autorizado pelo operador

**Regra permanente:** Normas ABNT não são redistribuídas. Qualquer NBR fornecida pelo operador deve ter `permission_status: privada_autorizada` e uso restrito a sumário operacional.

### NBRs presentes na base (domínio inspeção — utilidade IRATA parcial)

- ABNT-NBR-ISO-2408 (cordas de aço): raw presente — uso limitado a cabos de aço (ancoragem estrutural), não cordas de acesso por corda
- Série IEC-60079 (Atex): presente — relevante para ambientes classificados em O&G

---

## 6. Fontes Baixadas Nesta Iteração

```
ICOP EN (TC-102ENG V002)    — 6.0 MB  — SHA256: 6747645e...caa05a5c
ICOP PT (TC-102BRA V001)    — 8.5 MB  — SHA256: 111a2d8e...7f631070
TACS EN (TC-101ENG V006)    — 1.1 MB  — SHA256: e86b4426...2017173
TACS PT (TC-101BRA V006)    — 988 KB  — SHA256: 7f0fec99...7506f3
Safety Bulletin 042 EN      — 184 KB  — SHA256: 44c85189...8a669
Safety Bulletin 043 EN      — 203 KB  — SHA256: 61d7e256...4f2a5
Safety Bulletin 044 EN      — 408 KB  — SHA256: e58dcb9a...f5e3c
Safety Bulletin 045 EN      — 361 KB  — SHA256: 828d6a62...d23d4
Safety Bulletin 046 EN      — 293 KB  — SHA256: 67bb1109...79e
Safety Bulletin 047 EN      — 181 KB  — SHA256: dd787b4a...f328
Safety Bulletin 048 EN      — 188 KB  — SHA256: 909ab780...2a
Safety Bulletin 049 EN      — 209 KB  — SHA256: f9fbb3cf...cd2a
Safety Bulletin 050 EN      — 218 KB  — SHA256: f3a78bc6...6aae2
Safety Bulletin 051 EN      — 209 KB  — SHA256: 92db9f95...25504

Total: 14 arquivos / ~19 MB
Fonte: irata.org (publico_oficial — freely downloadable conforme declaração do site)
Nenhuma norma privada baixada.
```

---

## 7. Lacunas Críticas

### Lacuna 1 — ICOP/TACS: raw obtidos, processamento pendente
**Grau:** crítico | **Status:** parcialmente resolvido nesta iteração
Raw PDFs baixados com sucesso. Blocos rastreáveis ainda não gerados.
Enquanto não processados, irata-agent não pode citar requisitos ICOP/TACS com rastreabilidade de item.

### Lacuna 2 — ICOP Annex R (Rescue Planning) ausente
**Grau:** crítico | **Status:** pendente
O Annex R do ICOP é dedicado ao planejamento de resgate e evacuação — diretamente relevante para o firewall "plano de resgate obrigatório" do irata-agent. Download disponível em irata.org/downloads/25779.

### Lacuna 3 — NRs ausentes (NR-01, NR-10, NR-37, NR-20)
**Grau:** alto | **Status:** pending_user_download
gov.br bloqueia curl. Operador deve baixar manualmente do portal MTE.
Impacto: sem NR-01, irata-agent não tem referência para PGR/APR geral; sem NR-10, sem referência para trabalho próximo à tensão; sem NR-37, sem referência para offshore.

### Lacuna 4 — NBRs de EPI e acesso por corda (todas as 10)
**Grau:** alto | **Status:** privado_ausente
Sem NBRs de EPI específicas, irata-agent não pode referenciar critérios de carga de ruptura, tipo de certificação ou especificação técnica de conectores, arneses, trava-quedas.
Impacto operacional: declarar lacuna + referenciar CA (NR-06) + manual do fabricante em cada saída.

### Lacuna 5 — Vigência de todas as NRs não confirmada
**Grau:** médio-alto | **Status:** estrutural — não resolúvel sem verificação online
NR-35/2025, NR-33/2022, NR-06/2025, NR-13/2023 têm `vigencia: nao_confirmada`.
Todo output do irata-agent deve incluir alerta de vigência.

### Lacuna 6 — Manuais de fabricante ausentes
**Grau:** médio | **Status:** estrutural
Sem manuais de fabricante para arneses, descensores, trava-quedas, cordas, mosquetões.
Impacto: limitação de rastreabilidade para aprovação de equipamentos específicos.
Ação: operador fornece por projeto conforme equipamento em uso.

### Lacuna 7 — Procedimento/PT/APR do cliente ausentes
**Grau:** alto (para campo real) | **Status:** estrutural — por projeto
Procedimentos de cliente, formulários de PT/APR específicos só existem por projeto.
irata-agent usa templates próprios como base — adaptação ao cliente é responsabilidade do supervisor.

### Lacuna 8 — Topic Sheets IRATA ausentes
**Grau:** baixo | **Status:** não tentado
Disponíveis em irata.org — baixar e processar seletivamente em iteração futura.

---

## 8. Decisão Recomendada

```
Sistema PRONTO para:
  [x] Processar ICOP/TACS (raw obtidos — processar em 6.2e)
  [x] Verificar roteamento das NRs já processadas para irata-n3
  [x] Processar Safety Bulletins críticos (SB-044, SB-045, SB-048, SB-050)
  [ ] Processar NRs ausentes — aguardar download manual do operador

Sistema NÃO PRONTO para:
  [ ] Base normativa completa (NR-01, NR-10, NR-37 ausentes)
  [ ] Rastreabilidade de EPI específica (NBRs ausentes)
  [ ] Citação rastreável de requisito ICOP/TACS por seção/item (processamento pendente)

Recomendação de avanço:
  Prosseguir para Iteração 6.2e — ICOP/TACS processing com base disponível.
  irata-agent pode operar com NR-35 + ICOP/TACS processados como base mínima funcional.
  NRs e NBRs ausentes: declarar lacuna em cada output, referenciar base disponível.
```

---

## 9. Próxima Ação Recomendada — Iteração 6.2e

**Opção A (recomendada): Processar ICOP + TACS + ICOP Annex R**

1. Baixar ICOP Annex R (rescue) de irata.org/downloads/25779
2. Extrair texto dos 4 PDFs principais (ICOP EN/PT, TACS EN/PT)
3. Segmentar por seção/item com schema adaptado para IRATA
4. Gerar blocos JSONL em `norm_library/blocks/irata-n3/`
5. Criar índice + log de ingestão + lacunas para cada documento
6. Atualizar norm_profile.yaml com novos blocos
7. Registrar EVT-024

**Após Iteração 6.2e:** irata-agent terá base normativa mínima funcional para AGENT.md review final e promoção para review_validated.

**Ação paralela para o operador:**
- Baixar manualmente do gov.br: NR-01, NR-10, NR-37, NR-20, NR-07
- Fornecer cópias autorizadas de NBRs específicas se disponíveis

---

*Este documento não autoriza trabalho em campo. Toda operação real requer PT/APR/plano de resgate por supervisor habilitado.*
