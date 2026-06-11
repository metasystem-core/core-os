# Ingestion Log - API 570 4th Edition 2016

Data: 2026-05-10
Arquivo fonte carregado pelo operador: API 570 - 4th Ed - February 2016.pdf
SHA256 local: 875bdc051b62c313505ce88af518942b58f567d32b46092b6a7f4228a56e74ce
Domínio primário: inspecao-end
Domínio secundário: doc-inspecao
Status de acesso: private_authorized_by_operator

## Decisão de arquitetura
Este pacote NÃO cria novo core. Ele alimenta a biblioteca normativa consumida por:
- doc-inspecao/norm-nav
- doc-inspecao/equip-norm-mapper
- inspecao-end

## Saídas geradas
- blocks/api570_2016_blocks.jsonl: 86 blocos resumidos e codificados
- indices/api570_2016_index.json
- equipment_norm_maps/api570_equipment_to_norms.yaml
- version_registry/api570_version_registry.yaml
- translations/glossaries/api570_glossary_en_pt.yaml
- lacunas/api570_2016_lacunas.md

## Política de copyright
O PDF bruto não foi copiado para este pacote. Blocos são resumos operacionais em PT-BR com referência de seção/página aproximada. O texto original integral não foi reproduzido.

## Alerta de vigência
O arquivo carregado é 4th Edition/2016. Há indicação oficial de API 570 5th Edition/2024. O sistema deve bloquear afirmação de vigência atual se a versão exigida não for confirmada.

## Uso recomendado
1. Copiar a pasta .claude/norm_library/ para o projeto CORE-OS.
2. Manter o PDF bruto localmente em raw/private_authorized/API/, fora do GitHub.
3. Usar norm-nav/equip-norm-mapper para consultar blocos.
4. Acionar norm-translate apenas sob solicitação para blocos específicos.
