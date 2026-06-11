# IRATA LOCAL NORM COVERAGE MATRIX
**Iteração:** 6.2d | **Data:** 2026-06-09 | **Gerado por:** CORE-OS / Claude Code
**Base auditada:** `.claude/norm_library/` + `.claude/skills/irata-n3/`

> Matriz de cobertura normativa local para o domínio IRATA-CORE.
> Vigência: `nao_verificada_online` para todas as normas — confirmar antes de uso crítico.
> Normas privadas: não redistribuir texto integral. Apenas sumário operacional.

---

## Legenda

- **formato:** raw_pdf / processed_blocks / registry / skill / template / lacuna
- **rastreabilidade:** completa / parcial / ausente
- **vigência:** confirmada / nao_confirmada / nao_aplicavel / desconhecida
- **permission_status:** publico_oficial / privada_autorizada / privado_nao_baixar / ausente
- **utilidade:** crítica / alta / média / baixa

---

## Seção 1 — IRATA International

| Código / Documento | Categoria | Encontrado Localmente | Local | Formato | Processamento | Rastreabilidade | Vigência | Permission | Utilidade | Lacuna | Próxima Ação |
|---|---|---|---|---|---|---|---|---|---|---|---|
| IRATA ICOP / TC-102ENG V002 | IRATA | **SIM** (novo) | `raw_public_sources/IRATA_ICOP_TC-102ENG_V002.pdf` | raw_pdf | nao_processado | ausente | nao_confirmada | publico_oficial | **crítica** | Sem blocos | Processar em blocos (Iteração 6.2e) |
| IRATA ICOP / TC-102BRA V001 | IRATA | **SIM** (novo) | `raw_public_sources/IRATA_ICOP_TC-102BRA_V001.pdf` | raw_pdf | nao_processado | ausente | nao_confirmada | publico_oficial | **crítica** | Sem blocos | Processar em blocos (Iteração 6.2e) |
| IRATA TACS / TC-101ENG V006 | IRATA | **SIM** (novo) | `raw_public_sources/IRATA_TACS_TC-101ENG_V006.pdf` | raw_pdf | nao_processado | ausente | nao_confirmada | publico_oficial | **crítica** | Sem blocos | Processar em blocos (Iteração 6.2e) |
| IRATA TACS / TC-101BRA V006 | IRATA | **SIM** (novo) | `raw_public_sources/IRATA_TACS_TC-101BRA_V006.pdf` | raw_pdf | nao_processado | ausente | nao_confirmada | publico_oficial | **crítica** | Sem blocos | Processar em blocos (Iteração 6.2e) |
| IRATA Safety Bulletins 042–051 (EN) | IRATA | **SIM** (novo) | `raw_public_sources/safety_bulletins/` | raw_pdf (10 arquivos) | nao_processado | ausente | nao_confirmada | publico_oficial | alta | Sem blocos | Processar seletivamente (6.2e) |
| IRATA ICOP Annex R — Rescue | IRATA | NÃO | — | lacuna | — | ausente | nao_confirmada | publico_oficial | alta | Não baixado | Baixar e processar (6.2e) |
| IRATA ICOP Annex S — Over Water | IRATA | NÃO | — | lacuna | — | ausente | nao_confirmada | publico_oficial | média | Não baixado | Baixar se O&G scope |
| IRATA Topic Sheets | IRATA | NÃO | — | lacuna | — | ausente | nao_confirmada | publico_oficial | média | Não baixados | Listar e baixar (6.2e) |
| IRATA irata_proxy SKILL.md | IRATA/Skill | **SIM** (preexistente) | `.claude/skills/fw-core/sub/irata_proxy/SKILL.md` | skill | processado | parcial | nao_aplicavel | interno | média | Proxy leve | Manter como está |

---

## Seção 2 — Normas Regulamentadoras (NRs)

### NRs Presentes — Raw PDF + Blocos Processados

| Norma | Edição | Categoria | Local Raw | Blocos (public_official) | Blocos (irata-n3) | Rastreabilidade | Vigência | Permission | Utilidade IRATA | Próxima Ação |
|---|---|---|---|---|---|---|---|---|---|---|
| NR-35 | 2025 | NR/público | `raw/public_official/nr/nr-35-atualizada-2025-1.pdf` | `nr_35_blocks.jsonl` (58 blocos) | `nr_35_2025_blocks.jsonl` (57 blocos) | **completa** | nao_confirmada | publico_oficial | **crítica** — trabalho em altura | Verificar vigência antes de uso formal |
| NR-33 | 2022 | NR/público | `raw/public_official/nr/nr-33-atualizada-2022-_retificada.pdf` | `nr_33_blocks.jsonl` (93 blocos) | — | **completa** | nao_confirmada | publico_oficial | alta — espaço confinado | Verificar vigência |
| NR-06 | 2025 | NR/público | `raw/public_official/nr/nr-06-atualizada-2025-ii.pdf` | `nr_06_blocks.jsonl` (58 blocos) | — | **completa** | nao_confirmada | publico_oficial | **crítica** — EPI/CA | Verificar vigência |
| NR-13 | 2023 | NR/público | `raw/public_official/nr/nr-13-atualizada-2023-b.pdf` | `nr_13_blocks.jsonl` (163 blocos) | — | **completa** | nao_confirmada | publico_oficial | média — caldeiras/interface inspeção | Verificar vigência |
| NR-22 | 2026 | NR/público | `raw/public_official/nr/nr-22-atualizada-2026.pdf` | `nr_22_blocks.jsonl` (530 blocos) | — | **completa** | nao_confirmada | publico_oficial | baixa — mineração | Manter como está |
| NR-34 | 2023 | NR/público | `raw/public_official/nr/nr-34-atualizada-2023-2.pdf` | `nr_34_blocks.jsonl` (409 blocos) | — | **completa** | nao_confirmada | publico_oficial | baixa — naval | Manter como está |
| NR-14 | 2022 | NR/público | `raw/public_official/nr/nr-14-atualizada-2022.pdf` | `nr_14_blocks.jsonl` (13 blocos) | — | completa | nao_confirmada | publico_oficial | baixa | Manter |
| NR-15 | 2025 | NR/público | `raw/public_official/nr/nr-15-atualizada-2025.pdf` + anexos | `nr_15_blocks.jsonl` + anexos 12/13/13A | — | completa | nao_confirmada | publico_oficial | baixa — insalubridade | Manter |
| NR-05 | 2023 | NR/público | `raw/public_official/nr/NR05atualizada2023.pdf` | — | — | parcial | nao_confirmada | publico_oficial | baixa | Sem blocos processados |

### NRs Ausentes — Prioritárias para IRATA

| Norma | Descrição | Categoria | Status | Utilidade IRATA | Próxima Ação |
|---|---|---|---|---|---|
| NR-01 | Disposições Gerais e Gerenciamento de Riscos | NR/público | **ausente** | alta — base obrigatória PGR | pending_user_download (gov.br bloqueou curl) |
| NR-07 | PCMSO — Programa de Controle Médico | NR/público | **ausente** | média — aptidão médica para altura | pending_user_download |
| NR-10 | Segurança em Instalações Elétricas | NR/público | **ausente** | alta — ambientes industriais/tensão | pending_user_download |
| NR-12 | Segurança no Trabalho com Máquinas | NR/público | **ausente** | média — interface com manutenção | pending_user_download |
| NR-18 | Construção Civil | NR/público | **ausente** | média — obras/andaimes | pending_user_download |
| NR-20 | Inflamáveis e Combustíveis | NR/público | **ausente** | alta — O&G / refinaria / atm explosiva | pending_user_download |
| NR-23 | Proteção Contra Incêndios | NR/público | **ausente** | média — plano de emergência | pending_user_download |
| NR-26 | Sinalização de Segurança | NR/público | **ausente** | média — isolamento de área | pending_user_download |
| NR-37 | Plataformas de Petróleo Offshore | NR/público | **ausente** | alta — O&G offshore | pending_user_download |

---

## Seção 3 — ABNT / NBR

### NBRs IRATA-Específicas (EPI anti-queda, acessos, ancoragem)

| Norma | Descrição | Categoria | Encontrado Localmente | Local | Formato | Vigência | Permission | Utilidade | Lacuna | Ação |
|---|---|---|---|---|---|---|---|---|---|---|
| NBR 15986 | Sistemas de Ancoragem | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | **crítica** | AUSENTE | Operador deve fornecer cópia autorizada |
| NBR 15836 | Conectores — Anéis e Ganchos | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | **crítica** | AUSENTE | Operador deve fornecer cópia autorizada |
| NBR 15837 | Arnês de Corpo Inteiro | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | **crítica** | AUSENTE | Operador deve fornecer cópia autorizada |
| NBR 14626 | Dispositivo Trava-queda Retrátil | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | **crítica** | AUSENTE | Operador deve fornecer cópia autorizada |
| NBR 14627 | Trava-queda Guiado em Linha Rígida | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | alta | AUSENTE | Operador deve fornecer cópia autorizada |
| NBR 14628 | Absorvedor de Energia | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | alta | AUSENTE | Operador deve fornecer cópia autorizada |
| NBR 14629 | Cinturão Paraquedista | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | **crítica** | AUSENTE | Operador deve fornecer cópia autorizada |
| NBR 15834 | Sistemas de Acesso por Corda | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | **crítica** | AUSENTE | Operador deve fornecer cópia autorizada |
| NBR 16325 | Cadeira Suspensa para Trabalho | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | média | AUSENTE | Operador deve fornecer cópia autorizada |
| NBR 16489 | Conectores — Mosquetões | ABNT/privada | NÃO | — | lacuna | desconhecida | privado_nao_baixar | alta | AUSENTE | Operador deve fornecer cópia autorizada |

### NBRs Presentes na Base (foco em inspeção — utilidade IRATA parcial)

| Norma | Descrição Resumida | Local | Processamento | Vigência | Utilidade IRATA | Obs |
|---|---|---|---|---|---|---|
| ABNT-NBR-ISO-2408 | Cordas de Aço | `raw/private_authorized/ABNT/ABNT-NBR-ISO-2408/` | raw_pdf | nao_confirmada | alta — cabo de aço como sistema de ancoragem fixo | privada_autorizada — não redistribuir |
| NBRs IEC-60079-x (série) | Atmosferas Explosivas | `raw/private_authorized/ABNT/` + blocks | processado | nao_confirmada | alta — ambientes Atex em O&G | privada_autorizada |
| NBR 13541–13545 (série) | Manômetros / equipamentos de pressão | `raw/private_authorized/ABNT/` + blocks | processado | nao_confirmada | baixa | privada_autorizada |

---

## Seção 4 — Petrobras / Cliente

| Norma/Procedimento | Descrição | Categoria | Encontrado | Local | Formato | Utilidade IRATA | Obs |
|---|---|---|---|---|---|---|---|
| N-2910 | Segurança nos Trabalhos em Altura | Petrobras/privada | **SIM** (catálogo) | `norm_library/indices/petrobras_catalog_shared_irata-n3.md` | catálogo (sem PDF) | **crítica** | Apenas catalogada — sem texto completo carregado |
| N-2162 | Permissão para Trabalho (PT) | Petrobras/privada | SIM (catálogo) | `norm_library/indices/petrobras_catalog_shared_irata-n3.md` | catálogo (sem PDF) | alta | Apenas catalogada |
| N-2349 | (título abreviado) | Petrobras/privada | SIM (catálogo) | idem | catálogo | média | Apenas catalogada |
| N-2637 | (título abreviado) | Petrobras/privada | SIM (catálogo) | idem | catálogo | média | Apenas catalogada |
| Procedimento cliente específico | APR/PT operação | Cliente/privada | NÃO | — | lacuna | crítica — necessário para campo real | Deve ser fornecido pelo operador por projeto |

---

## Seção 5 — Documentos de Skill / Templates / Checklists

| Item | Tipo | Local | Formato | Rastreabilidade | Utilidade | Obs |
|---|---|---|---|---|---|---|
| procedimento_acesso_template.md | Template | `irata-n3/templates/` | skill_template | ausente | **crítica** | Template de plano de acesso |
| plano_resgate_template.md | Template | `irata-n3/templates/` | skill_template | ausente | **crítica** | Template de plano de resgate |
| plano_ancoragem_template.md | Template | `irata-n3/templates/` | skill_template | ausente | **crítica** | Template de ancoragem |
| matriz_equipe_certificacao_template.md | Template | `irata-n3/templates/` | skill_template | ausente | alta | Matriz de equipe IRATA |
| matriz_equipamentos_template.csv | Template | `irata-n3/templates/` | skill_template | ausente | alta | Rastreabilidade de equipamentos |
| relatorio_supervisao_diaria_template.md | Template | `irata-n3/templates/` | skill_template | ausente | alta | Relatório N3 diário |
| pacote_documental_cliente_template.md | Template | `irata-n3/templates/` | skill_template | ausente | alta | Pacote documental |
| matriz_lacunas_bloqueios_template.md | Template | `irata-n3/templates/` | skill_template | ausente | alta | Matriz de lacunas |
| checklist_liberacao_frente.md | Template/Checklist | `irata-n3/templates/` | skill_template | ausente | **crítica** | Checklist de liberação |
| irata_n3_document_review_checklist.md | Checklist | `irata-n3/checklists/` | skill_checklist | ausente | alta | Revisão documental N3 |
| field_quick_checklist.md | Checklist | `irata-n3/checklists/` | skill_checklist | ausente | alta | Campo rápido |
| norm_profile.yaml | Registry | `irata-n3/norm_profile.yaml` | yaml_registry | completa | alta | Perfil normativo da skill |
| nr_public_profile.md | Registry | `irata-n3/norm_profiles/` | profile | parcial | média | Perfil público NRs |
| petrobras_catalog_shared_irata-n3.md | Catálogo | `norm_library/indices/` | índice | parcial | alta | 10 normas Petrobras catalogadas |

---

## Resumo de Cobertura

```
=== IRATA ===
ICOP (TC-102): PRESENTE raw — não processado (baixado nesta iteração)
TACS (TC-101): PRESENTE raw — não processado (baixado nesta iteração)
Safety Bulletins 042–051: PRESENTE raw EN — não processado
Topic Sheets: AUSENTE — pending

=== NRs ===
Presentes com blocos: NR-35, NR-33, NR-06, NR-13 (4 críticas disponíveis)
Presentes raw apenas: NR-05
Ausentes P0/P1 IRATA: NR-01, NR-10, NR-37, NR-20 (4 críticas ausentes)
Ausentes P2 IRATA: NR-07, NR-12, NR-18, NR-23, NR-26

=== ABNT/NBR específicas IRATA ===
EPI anti-queda (NBR 15986, 15836, 15837, 14626-9, 15834, 16489, 16325): TODAS AUSENTES
NBR-ISO-2408 (corda de aço): presente raw — não processado

=== Templates/Checklists ===
9 templates: presentes na skill — sem rastreabilidade normativa
2 checklists: presentes na skill — sem rastreabilidade normativa
```

---

*Próxima ação: processar ICOP + TACS em blocos rastreáveis (Iteração 6.2e) + operador fornecer NBRs privadas autorizadas.*
