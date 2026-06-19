---
source_id: SRC-SIMB-011
author: C. G. Jung (Carl Gustav Jung, 1875–1961)
title: Dreams
translator: R. F. C. Hull
publisher: Princeton University Press / Bollingen (Bollingen Series XX)
copyright: 1974 (compilation); essays from Collected Works Vols. 4, 8, 12, 16
source_type: primary_jungian_source
domain: dreams / analytical psychology / symbolic interpretation
status: intake_started
intake_id: INT-SIMB-20260619-009
created_at: 2026-06-19
---

# SRC-SIMB-011 — Dreams (C. G. Jung)

## Identificação

- **source_id:** SRC-SIMB-011
- **author:** C. G. Jung
- **title:** Dreams
- **translator:** R. F. C. Hull
- **publisher:** Princeton University Press / Bollingen Series XX
- **copyright:** 1974 (compilação); textos originais de datas anteriores
- **edition:** Princeton/Bollingen paperback
- **contents:** Seleção de ensaios dos Collected Works (CW):
  - CW Vol. 4: "The Analysis of Dreams" + "On the Significance of Number Dreams"
  - CW Vol. 8: "General Aspects of Dream Psychology" + "On the Nature of Dreams"
  - CW Vol. 12: "Individual Dream Symbolism in Relation to Alchemy"
  - CW Vol. 16: "The Practical Use of Dream-Analysis"

---

## Arquivo

- **selected_file_path:** `cesto/Dreams (Jung, C. G. (Carl Gustav), 1875-1961) (z-library.sk, 1lib.sk, z-lib.sk) (1).pdf`
- **private_raw_path:** `.claude/workspaces/simb/library/raw_private/SRC-SIMB-011_jung_dreams.pdf`
- **sha256:** `ef421f949127aac111bcd143d56bab8dcd450a020c11783b59bacd933a1f6259`
- **size_bytes:** 28628192 (27.31 MB)
- **page_count:** 380 (confirmado via pdfplumber — TASK 19B)

---

## Qualidade de extração

- **text_layer:** presente e extraível — confirmado via pdfplumber (TASK 19B)
- **extraction_quality:** funcional; artefatos de encoding em smart quotes (substituídos por ?) mas texto principal legível
- **ocr_required:** não — texto nativo extraível sem OCR
- **extraction_recommendation:** usar pdfplumber; pypdf e PyPDF2 não disponíveis neste ambiente

---

## Tratamento de copyright

- **raw_pdf:** privado apenas — armazenado em `raw_private/` (.gitignore presente)
- **texto_integral_extraído:** privado apenas — se extraído, armazenar em `private_full_text_chunks/` (.gitignore presente)
- **o que pode ser commitado:**
  - este manifest (SRC-SIMB-011_jung_dreams.md) ✓
  - cards de conceito derivados (CON-NNN) ✓
  - notas de protocolo (PROT-NNN) ✓
  - risk cards (RISK-NNN) ✓
  - reading notes (paráfrases + referências, não cópia de texto) ✓
  - audits de sessão ✓
- **o que NÃO pode ser commitado:**
  - PDF original ✗
  - texto integral ou chunks de texto bruto ✗
  - parágrafos longos copiados literalmente ✗

---

## Relação com SIMB

### Por que esta fonte

Jung é a autoridade primária da psicologia analítica e do método de interpretação de sonhos que informa toda a estrutura SIMB/Iris. Hall (SRC-010) e Edinger (SRC-008/009) são fontes secundárias que comentam Jung. A leitura direta de Jung fornece:

- Linguagem original dos conceitos (em tradução canônica Hull)
- Distinção explícita entre nível objetivo/subjetivo de interpretação
- Relação entre compensação e função prospectiva do sonho
- Fundamento para o princípio "imagem antes de objeto"
- Calibração da profundidade histórica dos conceitos usados por Hall

### Contribuição esperada para dream-analysis skill

- Reforço do princípio de não-literalização (CON candidato)
- Distinção ego/self no contexto onírico
- Função compensatória do sonho como eixo central (extensão de CON-037)
- Amplificação com ancoragem pessoal antes de arquetípica (reforço de CON-038)
- Interpretação de série de sonhos como processo (reforço de CON-039)
- Nível objetivo vs. subjetivo — conceito central não extraído ainda
- Uso prático vs. teórico da análise (CW Vol. 16)
- Risco da iatrogenia simbólica — Jung menciona explicitamente

### Relação com fontes existentes

| Fonte | Relação |
|---|---|
| SRC-010 Hall | Hall comenta e sistematiza Jung; Jung é a fonte primária |
| SRC-008 Edinger Creation | Edinger usa Jung como substrato; Jung é mais direto |
| SRC-009 Edinger Anatomy | Idem — alquimia como linguagem simbólica, Jung como origem |

---

## Riscos conhecidos desta fonte

| Risco | Descrição |
|---|---|
| over_literalization | Sonhos específicos citados como exemplos podem ser retirados de contexto |
| diagnostic_misuse | Jung integrava análise de sonhos em contexto clínico; SIMB não é clínico |
| mystical_certainty | Linguagem de Jung às vezes carrega certeza que SIMB não pode replicar |
| prophecy_telepathy_overconfidence | Jung discute sonhos telepáticos e proféticos — requer firewall F-06 |
| sexual_concretism | Análise freudo-junguiana de simbolismo sexual — requer F-09/F-10 |
| authority_inflation | Jung como figura de autoridade pode suprimir leitura contextual |
| dream_as_command | Passagens sobre "o inconsciente diz X" requerem F-04 ativo |
| archetypal_reduction | Amplificação arquetípica prematura sem ancoragem pessoal — F-07/RISK-002 |

---

## Recomendação de processamento

- **abordagem:** leitura faseada por parte (ver reading plan JUNG_DREAMS_READING_PLAN_001.md)
- **proibido:** dump de sumarização integral do livro em uma sessão
- **entregáveis por fase:** apenas concept cards, protocol notes, risk cards, reading notes com paráfrase
- **chunks privados:** se extrair texto, criar chunks em `private_full_text_chunks/SRC-SIMB-011_jung_dreams/` (não commitar)
- **calibração da skill:** após leitura completa, avaliar upgrades de evals e protocol notes

---

*Manifest criado em: TASK 19A — JUNG_DREAMS_SOURCE_INTAKE_001 (2026-06-19)*
