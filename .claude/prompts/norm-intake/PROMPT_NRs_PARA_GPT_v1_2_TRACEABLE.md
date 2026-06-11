# Prompt — Lote NRs v1.2 TRACEABLE

Você vai segmentar textos de Normas Regulamentadoras brasileiras (NRs) em blocos operacionais estruturados, seguindo o schema normativo v1.2.

## Contexto

As NRs são atos normativos públicos oficiais do Ministério do Trabalho e Emprego (MTE/MTb/MTP). Devem ser tratadas como fonte pública oficial, com referência rastreável ao arquivo, item, seção, página quando possível, portaria/atualização quando identificada e status de vigência.

## Objetivo

Gerar blocos JSONL pequenos, autônomos e úteis para consulta por IA, relatório, checklist e resposta a fiscal/cliente.

Cada bloco deve permitir responder:

1. Qual norma?
2. Qual edição/versão?
3. Qual item/seção?
4. Onde está no arquivo?
5. O que exige?
6. Qual evidência comprova?
7. Qual core deve usar?
8. Qual o limite da conclusão?

## Saída obrigatória por NR

Para cada NR processada, gerar:

- `<slug>_blocks.jsonl`
- `<slug>_index.json`
- `<slug>_source_registry.json`
- `<slug>_ingestion_log.md`
- `<slug>_lacunas.md`
- `<slug>_qa_traceability.md`

Compactar tudo em:

`nr_batch_norm_ingestion_packs_v1_2_traceable.zip`

## Prioridade do lote

1. NR-13
2. NR-35
3. NR-33
4. NR-06
5. NR-15
6. NR-22
7. NR-34
8. NR-14
9. demais NRs, se houver

## Mapa inicial de NRs

| Arquivo provável | norm_code | domain_primary | route_to_core | source_type | permission_status |
|---|---|---|---|---|---|
| NR-13*.txt/pdf | NR-13 | inspecao-end | ["doc-inspecao","inspecao-end"] | publica_oficial | uso_publico_referenciado |
| NR-35*.txt/pdf | NR-35 | shared | ["doc-inspecao","irata-n3","shared"] | publica_oficial | uso_publico_referenciado |
| NR-33*.txt/pdf | NR-33 | shared | ["doc-inspecao","inspecao-end","irata-n3","shared"] | publica_oficial | uso_publico_referenciado |
| NR-06*.txt/pdf | NR-06 | shared | ["doc-inspecao","irata-n3","inspecao-end","shared"] | publica_oficial | uso_publico_referenciado |
| NR-14*.txt/pdf | NR-14 | inspecao-end | ["doc-inspecao","inspecao-end"] | publica_oficial | uso_publico_referenciado |
| NR-15*.txt/pdf | NR-15 | shared | ["doc-inspecao","inspecao-end","shared"] | publica_oficial | uso_publico_referenciado |
| NR-22*.txt/pdf | NR-22 | shared | ["doc-inspecao","irata-n3","inspecao-end","shared"] | publica_oficial | uso_publico_referenciado |
| NR-34*.txt/pdf | NR-34 | shared | ["doc-inspecao","irata-n3","inspecao-end","shared"] | publica_oficial | uso_publico_referenciado |

## Campos obrigatórios do bloco v1.2

Cada linha JSONL deve conter:

```json
{
  "id": "",
  "norm_code": "",
  "norm_title": "",
  "source_type": "publica_oficial",
  "permission_status": "uso_publico_referenciado",
  "language_original": "pt-BR",
  "language_output": "pt-BR",
  "domain_primary": "",
  "route_to_core": [],
  "block_type": "",
  "normative_strength": "",
  "topic": "",
  "equipment_tags": [],
  "activity_tags": [],
  "risk_tags": [],
  "document_tags": [],
  "source_reference": {
    "file_path": "",
    "page": null,
    "item": ""
  },
  "traceability_reference": {
    "norm_code": "",
    "norm_title": "",
    "edition": null,
    "publication_date": null,
    "portaria": null,
    "source_file": "",
    "source_file_hash": null,
    "page_pdf": null,
    "page_printed": null,
    "section": null,
    "subsection": null,
    "paragraph": null,
    "table": null,
    "figure": null,
    "annex": null,
    "excerpt_short": "",
    "excerpt_hash": null,
    "reference_precision": ""
  },
  "original_excerpt_short": "",
  "operational_summary": "",
  "evidence_required": [],
  "applies_to": [],
  "missing_data_to_confirm": [],
  "confidence": "",
  "validity_status": "vigente_nao_confirmada",
  "citation_export": {
    "short": "",
    "report_ptbr": "",
    "internal": ""
  },
  "versioning": {
    "norm_version_id": "",
    "block_version": "1.2",
    "supersedes_block_id": null,
    "superseded_by_block_id": null,
    "change_type": "novo"
  },
  "conflict_scan": {
    "conflict_checked": false,
    "potential_conflicts": [],
    "conflict_status": "nao_verificado"
  },
  "use_level": "",
  "human_review_required": false,
  "legal_reference": null,
  "notes": ""
}
```

## Valores permitidos

### block_type
DEF | REQ | PROIB | COND | DOC | PRAZO | COMP | CRIT | EVID | RISK | PROC | EXC | NOTE | TABLE | ANNEX

### normative_strength
obrigatorio | recomendado | permitido | informativo | nao_determinado

### confidence
confirmado | provavel | condicional | referencial

### reference_precision
item_exato | secao_exata | tabela_exata | figura_exata | anexo_exato | pagina_aproximada | inferido_por_contexto | lacuna

### use_level
consulta_rapida | apoio_operacional | base_para_relatorio | exige_revisao_humana | nao_usar_como_fundamento_forte

### validity_status
vigente_confirmada | vigente_nao_confirmada | historica | substituida | revogada | desconhecida

## Regras gerais

1. Cada bloco = uma ideia normativa autônoma.
2. Priorizar REQ, COMP, DOC, PRAZO, CRIT, PROIB, EVID e PROC.
3. `source_reference.item` deve conter o número do item da NR sempre que existir.
4. `traceability_reference` é obrigatório.
5. `citation_export` é obrigatório.
6. Se não houver página identificável, usar `page_pdf: null` e `reference_precision: item_exato` se o item estiver claro.
7. Se nem item nem página forem claros, usar `reference_precision: lacuna` e `use_level: nao_usar_como_fundamento_forte`.
8. `original_excerpt_short` pode ter até 5 linhas por ser fonte pública oficial, mas deve continuar curto e focado.
9. `operational_summary` deve explicar o que verificar em campo/documento.
10. Não confundir recomendação com obrigação.
11. Se o item exigir dado externo para aplicar, preencher `missing_data_to_confirm`.
12. Se o bloco for base para relatório/fiscalização, `use_level` deve ser `base_para_relatorio` somente com referência suficiente.
13. Se envolver critério técnico crítico, cálculo, prazo de inspeção ou decisão de aptidão, marcar `human_review_required: true` quando houver ambiguidade.
14. Integrar com CORE-INTAKE: NRs entram como `material_type: norma_tecnica` e processador `norm-intake`.

## Prioridades NR-13

Focar em:

1. COMP — PH, profissional habilitado, engenheiro, SPIE, organismo de inspeção, operador.
2. DOC — prontuário, registro de segurança, projeto, relatórios, ART, documentação de tubulações/tanques.
3. PRAZO — inspeções inicial, periódica, extraordinária, interna, externa, teste hidrostático.
4. REQ — instalação, operação, manutenção, segurança.
5. CRIT — critérios de enquadramento, categoria, fluido, PMTA, limites.
6. PROIB — operar sem documentação/condições mínimas quando a norma assim estabelecer.
7. RISK — grave e iminente risco, ruptura, explosão, vazamento, acidente.
8. DEF — caldeira, vaso de pressão, tubulação, tanque metálico, fluido.

## Prioridades NR-35

Focar em:

1. COMP — capacitação, responsabilidades, trabalhador autorizado, supervisão.
2. DOC — AR, PT, procedimento operacional, registros de treinamento.
3. REQ — planejamento, organização, execução, EPI, sistema de proteção contra queda, ancoragem.
4. PRAZO — treinamento, reciclagem, validade/condições.
5. PROC — emergência, salvamento, resgate, comunicação.
6. PROIB — trabalho sem condições mínimas, sem autorização, sem controle de risco.

## Prioridades NR-33

Focar em:

1. DEF — espaço confinado, trabalhador autorizado, vigia, supervisor de entrada.
2. COMP — capacitações e papéis.
3. DOC — PET, cadastro de espaços confinados, procedimentos.
4. REQ — controle atmosférico, isolamento, ventilação, resgate.
5. PROC — entrada, monitoramento, emergência.
6. RISK — atmosfera perigosa, engolfamento, deficiência/enriquecimento de oxigênio.

## Exemplo de bloco v1.2

```json
{"id":"NR13-DOC-PRONTUARIO-VP-001","norm_code":"NR-13","norm_title":"NR 13 - Caldeiras, Vasos de Pressão, Tubulações e Tanques Metálicos de Armazenamento","source_type":"publica_oficial","permission_status":"uso_publico_referenciado","language_original":"pt-BR","language_output":"pt-BR","domain_primary":"inspecao-end","route_to_core":["doc-inspecao","inspecao-end"],"block_type":"DOC","normative_strength":"obrigatorio","topic":"prontuario_vaso_pressao","equipment_tags":["vaso_pressao"],"activity_tags":["inspecao","documentacao"],"risk_tags":["ruptura","explosao"],"document_tags":["prontuario_vp"],"source_reference":{"file_path":"norm_library/raw/public_official/NR/NR-13/NR-13-2023.pdf","page":null,"item":"13.x.x"},"traceability_reference":{"norm_code":"NR-13","norm_title":"NR 13 - Caldeiras, Vasos de Pressão, Tubulações e Tanques Metálicos de Armazenamento","edition":"2023","publication_date":null,"portaria":null,"source_file":"norm_library/raw/public_official/NR/NR-13/NR-13-2023.pdf","source_file_hash":null,"page_pdf":null,"page_printed":null,"section":"13.x","subsection":"13.x.x","paragraph":null,"table":null,"figure":null,"annex":null,"excerpt_short":"Todo vaso de pressão deve possuir prontuário...","excerpt_hash":null,"reference_precision":"item_exato"},"original_excerpt_short":"Todo vaso de pressão deve possuir prontuário...","operational_summary":"Verificar se o vaso de pressão possui prontuário completo e compatível com a NR-13 antes de concluir conformidade documental.","evidence_required":["prontuário do vaso de pressão","categoria do vaso","PMTA documentada","dados de fabricação"],"applies_to":["vasos de pressão sujeitos à NR-13"],"missing_data_to_confirm":["categoria do vaso","PMTA","fluido","volume"],"confidence":"confirmado","validity_status":"vigente_nao_confirmada","citation_export":{"short":"NR-13, item 13.x.x.","report_ptbr":"Referência: NR-13, item 13.x.x.","internal":"NR-13:13.x.x"},"versioning":{"norm_version_id":"NR-13:2023","block_version":"1.2","supersedes_block_id":null,"superseded_by_block_id":null,"change_type":"novo"},"conflict_scan":{"conflict_checked":false,"potential_conflicts":[],"conflict_status":"nao_verificado"},"use_level":"base_para_relatorio","human_review_required":false,"legal_reference":null,"notes":"Confirmar item exato e portaria antes de uso crítico."}
```

## O que não fazer

- Não gerar texto corrido fora do JSONL.
- Não juntar vários requisitos em um bloco só.
- Não declarar vigência confirmada sem fonte oficial.
- Não classificar como base para relatório bloco sem referência rastreável.
- Não misturar NR-35/IRATA com Inspeção-END sem rota explícita.
- Não sobrescrever blocos antigos sem versioning/diff quando houver versão anterior.
