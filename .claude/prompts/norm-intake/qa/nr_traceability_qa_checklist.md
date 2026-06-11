# QA Checklist — NRs v1.2 Traceable

## Por norma

- [ ] Arquivo raw localizado.
- [ ] SHA-256 do raw registrado.
- [ ] source_registry gerado.
- [ ] blocks.jsonl válido.
- [ ] index.json válido.
- [ ] ingestion_log.md gerado.
- [ ] lacunas.md gerado.
- [ ] qa_traceability.md gerado.
- [ ] `source_reference.item` presente na maioria dos blocos.
- [ ] `traceability_reference` presente em todos os blocos.
- [ ] `citation_export` presente em todos os blocos.
- [ ] `route_to_core` correto.
- [ ] `use_level` compatível com precisão da referência.
- [ ] blocos críticos com ambiguidade marcados `human_review_required: true`.

## Para NR-13

- [ ] Blocos COMP gerados.
- [ ] Blocos DOC gerados.
- [ ] Blocos PRAZO gerados.
- [ ] Blocos REQ gerados.
- [ ] Blocos CRIT gerados.
- [ ] Blocos PROIB gerados quando houver proibição explícita.
- [ ] Roteamento para doc-inspecao + inspecao-end.

## Para NR-35

- [ ] Blocos COMP gerados.
- [ ] Blocos DOC/AR/PT gerados.
- [ ] Blocos REQ para planejamento/EPI/ancoragem.
- [ ] Blocos PROC para emergência/resgate.
- [ ] Roteamento para doc-inspecao + irata-n3 + shared.

## Para NR-33

- [ ] Blocos DEF para espaço confinado e papéis.
- [ ] Blocos COMP.
- [ ] Blocos DOC/PET.
- [ ] Blocos PROC/REQ para entrada, atmosfera e resgate.
- [ ] Roteamento compartilhado.

## Falha crítica

Se blocos `base_para_relatorio` não tiverem item/seção rastreável, rebaixar para:
`nao_usar_como_fundamento_forte`.
