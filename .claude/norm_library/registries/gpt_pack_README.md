# Pacote de compilação normativa — para_gpt

Gerado em: 2026-05-11

Este pacote processa os arquivos `.txt` extraídos enviados em `para_gpt.zip` e gera blocos normativos `.jsonl` para uso no CORE-OS / Claude Code.

## Conteúdo

- `blocks/`: blocos JSONL por norma/documento.
- `indices/`: índice por norma + índice mestre.
- `registries/`: registry de fontes e schema refinado v1.1.
- `maps/`: mapas equipamento → normas e roteamento por core.
- `glossaries/`: glossário técnico EN/PT.
- `logs/`: logs de ingestão por norma.
- `lacunas/`: lacunas e pendências de validação.
- `patches/`: instruções para integração no Code.
- `qa/`: checklist de validação do pacote.

## Regra de uso

- Normas privadas/autorizadas: `permission_status = nao_redistribuir`.
- PDFs e textos brutos não foram incluídos no pacote de saída.
- Excertos literais foram limitados a títulos/fragmentos curtos.
- O pacote é para navegação, pré-triagem, rastreabilidade e consulta por IA.
- Para decisão técnica crítica, confirmar edição vigente e consultar o item original.

## Totais

- Documentos processados: 39
- Blocos gerados: 1126

## Separação de domínio

- `doc-inspecao`: camada documental, fonte, evidência, log e lacunas.
- `inspecao-end`: aplicação técnica para equipamentos, END, integridade, soldagem, tubulação, vasos, tanques e válvulas.
- `irata-n3`: não recebe estas normas como domínio primário; acionar apenas se a execução envolver acesso por cordas, altura, resgate ou ancoragem.
