# Lacunas Gerais — norm_library

> Registrado em: 2026-05-11
> Operador: primário

---

## LACUNA-001 — NR-13 sem blocos

```yaml
lacuna_id: LACUNA-001
data: 2026-05-11
atualizado: 2026-05-11
pergunta: NR-13 está disponível para consulta?
dominio: inspecao-end
norma_candidata: NR-13 (Caldeiras, Vasos de Pressão, Tubulações e Tanques Metálicos de Armazenamento)
resultado: pdf_presente_sem_blocos
arquivo: raw/public_official/nr/nr-13-atualizada-2023-b.pdf (402KB, Portaria MTP 4.219/2022)
motivo_original: PDF não adicionado à biblioteca.
correcao: PDF depositado em sessão anterior. Texto extraível via pdfminer (confirmado).
acao_recomendada: >
  1. Rodar extract_norm_texts.py para NR-13 → extracted_text/NR-13-2023-001.txt
  2. Enviar para GPT com PROMPT_PARA_GPT.md → blocos JSONL
  3. Integrar blocos em blocks/inspecao-end/
status: parcialmente_resolvida
prioridade: CRÍTICA — blocos ausentes bloqueiam consultas normativas legais
```

## LACUNA-002 — NR-35 ausente da biblioteca

```yaml
lacuna_id: LACUNA-002
data: 2026-05-11
atualizado: 2026-05-11
pergunta: NR-35 está disponível para consulta?
dominio: shared / irata-n3
norma_candidata: NR-35 (Trabalho em Altura)
resultado: pdf_presente_sem_blocos
arquivo: raw/public_official/nr/nr-35-atualizada-2025-1.pdf (322KB, 2025)
motivo_original: PDF não adicionado à biblioteca.
correcao: PDF depositado em sessão anterior.
acao_recomendada: >
  1. Extrair texto via pdfminer
  2. Gerar blocos JSONL via GPT
  3. Integrar em blocks/shared/ (domínio irata-n3)
status: parcialmente_resolvida
prioridade: alta — IRATA-N3 opera sem base normativa NR local
```

## LACUNA-003 — Extração de texto de PDFs ✅ RESOLVIDA

```yaml
lacuna_id: LACUNA-003
data: 2026-05-11
pergunta: O sistema consegue ler os PDFs da biblioteca?
dominio: sistema
norma_candidata: todos os PDFs em raw/
resultado: resolvido
motivo_original: pdftoppm não disponível. Read tool falha em PDFs.
solucao: >
  pdfminer (Python) usado via _staging/extract_norm_texts.py
  39/40 PDFs extraídos com sucesso.
  1 falha: ASME-V_escaneado (sem camada de texto — confirmado esperado).
  Textos salvos em: .claude/norm_library/extracted_text/<source_id>.txt
data_resolucao: 2026-05-11
status: fechada
proximo_passo: gerar blocos jsonl a partir dos textos extraídos (norm-ingest)
```

## LACUNA-004 — Edições defasadas de normas críticas

```yaml
lacuna_id: LACUNA-004
data: 2026-05-11
pergunta: As edições na biblioteca são as mais recentes?
dominio: inspecao-end
norma_candidata: API-510, API-RP-571, API-RP-579
resultado: defasagem confirmada
motivo: >
  API-510: 8ª Ed (1997) na biblioteca; edição vigente é 11ª Ed (2022).
  API-RP-571: 1ª Ed (2003) na biblioteca; edição vigente é 3ª Ed (2020) — mecanismos adicionais.
  API-RP-579: 1ª Ed (2000) na biblioteca; substituída por API 579-1/ASME FFS-1 (2007+).
acao_recomendada: >
  Sinalizar em toda consulta que envolva essas normas que a edição pode estar defasada.
  Atualizar arquivos quando versões mais recentes estiverem disponíveis.
  Norm-nav deve alertar automaticamente ao usar blocos dessas normas.
status: aberta
prioridade: média — usar com alerta de defasagem; não bloquear uso operacional
```

## LACUNA-005 — ASME-V escaneado ilegível

```yaml
lacuna_id: LACUNA-005
data: 2026-05-11
pergunta: Arquivo ASME-V_escaneado-sem-texto-extraivel_VERIFICAR.pdf é utilizável?
dominio: inspecao-end
norma_candidata: ASME BPVC Section V
resultado: ilegível
motivo: PDF escaneado sem camada de texto — ilegível por sistema mesmo com pdftoppm.
acao_recomendada: >
  Preferir ASME-BPVC-V_2019_Nondestructive-Examination.pdf (source_id: ASME-BPVC-V-2019-001).
  Verificar conteúdo do escaneado manualmente para confirmar se é versão diferente.
  Aplicar OCR se necessário.
status: aberta
prioridade: baixa — ASME-BPVC-V-2019-001 já cobre esta norma
```

## LACUNA-006 — NR-33 sem blocos

```yaml
lacuna_id: LACUNA-006
data: 2026-05-11
atualizado: 2026-05-11
pergunta: NR-33 está disponível para consulta?
dominio: shared
norma_candidata: NR-33 (Segurança e Saúde nos Trabalhos em Espaços Confinados)
resultado: pdf_presente_sem_blocos
arquivo: raw/public_official/nr/nr-33-atualizada-2022-_retificada.pdf (346KB, 2022)
motivo_original: PDF não adicionado à biblioteca.
correcao: PDF depositado em sessão anterior.
acao_recomendada: >
  1. Extrair texto via pdfminer
  2. Gerar blocos JSONL via GPT
  3. Integrar em blocks/shared/
status: parcialmente_resolvida
prioridade: média — relevante para inspeção interna de tanques e vasos
```
