# SKILL — norm-ingest

## Identidade

`norm-ingest` é uma subskill de `doc-inspecao` para ingestão, triagem, segmentação, codificação e alocação de documentos normativos.

Não é core independente.
Não decide conformidade final.
Não interpreta norma fora do seu domínio técnico.
Não substitui o texto normativo original.

## Quando ativar

Ativar quando um arquivo no `cesto/` ou no fluxo documental for identificado como:

- norma regulamentadora;
- norma técnica pública;
- norma técnica privada com acesso autorizado;
- procedimento interno;
- manual de fabricante;
- instrução técnica de Corpo de Bombeiros;
- regulamento técnico;
- material normativo de cliente;
- código técnico aplicável a inspeção, END, acesso por cordas ou segurança operacional.

## Quando não ativar

Não ativar para:

- consulta simples já coberta por `norm-nav`;
- pergunta jurídica geral;
- relatório técnico comum sem nova fonte normativa;
- documento pessoal;
- arquivo financeiro;
- documento sem conteúdo normativo.

## Fluxo obrigatório

1. Identificar tipo de fonte.
2. Identificar domínio primário e secundário.
3. Identificar idioma.
4. Identificar versão/data/status se disponível.
5. Classificar permissão de uso.
6. Segmentar o conteúdo.
7. Gerar blocos normativos curtos.
8. Atribuir códigos únicos.
9. Alocar os blocos no domínio correto.
10. Atualizar índices leves.
11. Registrar log de ingestão.
12. Registrar lacunas.

## Filtros obrigatórios

### Tipo de fonte

- `publica_oficial`
- `privada_autorizada`
- `manual_fabricante`
- `procedimento_cliente`
- `lei_regulamento`
- `material_didatico`
- `desconhecida`

### Domínio

- `shared`
- `irata-n3`
- `inspecao-end`
- `doc-inspecao`
- `juridico`
- `ambigua`

### Status normativo

- `vigente_confirmada`
- `vigente_nao_confirmada`
- `revogada`
- `substituida`
- `historica`
- `desconhecida`

Se a vigência não for identificada, a norma pode ser indexada, mas não pode ser usada como base conclusiva sem alerta.

### Tipo de bloco

- `DEF` — definição
- `REQ` — requisito obrigatório
- `PROIB` — proibição
- `COND` — condição de aplicação
- `DOC` — documento exigido
- `PRAZO` — periodicidade ou validade
- `COMP` — competência ou qualificação
- `CRIT` — critério de aceitação/rejeição
- `EVID` — evidência necessária
- `RISK` — risco associado
- `PROC` — procedimento
- `EXC` — exceção
- `NOTE` — nota explicativa
- `TABLE` — tabela
- `ANNEX` — anexo

## Regra de copyright/licença

Se a fonte for `privada_autorizada`, o sistema pode gerar:

- referência;
- código interno;
- resumo operacional;
- checklist derivado;
- vínculo item → tema → evidência.

O sistema não deve gerar:

- reprodução integral;
- grandes trechos literais;
- norma completa traduzida;
- exportação pública de texto protegido;
- pacote redistribuível com conteúdo privado.

## Saídas esperadas

Para cada norma/documento ingerido, gerar:

- `blocks/<norma>_blocks.jsonl`
- `indices/<norma>_index.json`
- `ingestion_logs/<norma>_ingestion_log.md`
- `lacunas/<norma>_lacunas.md`
- atualização em `version_registry/norm_source_registry.yaml`
- atualização opcional em `equipment_norm_maps/`

## Regra de alocação

Normas de acesso por cordas, trabalho em altura, ancoragem, resgate, supervisão, equipamentos de rope access e equipe suspensa vão para `irata-n3`.

Normas de vasos, caldeiras, tubulações, tanques, END/NDT, API, ASME, ABNT técnica de inspeção, mecanismos de dano, critérios de aceitação e integridade vão para `inspecao-end`.

Normas sobre documentação, certificado, prontuário, databook, evidência, rastreabilidade, relatório ou auditoria documental vão para `doc-inspecao`.

Normas gerais de SST como NR-01, NR-06, NR-10, NR-12, NR-20, NR-33 e NR-35 podem entrar em `shared`, com perfis de uso específicos por core.

Normas com domínio `juridico` (leis, decretos, regulamentos) são reconhecidas e indexadas, mas **não roteadas diretamente para o `juridico-core`** — o `juridico-core` não possui `norm_profile` neste patch. Encaminhar para `skill-router` para decisão de roteamento. Registrar como lacuna se não houver decisão.

## Convenção de nomenclatura de arquivos de blocos

Usar slug lowercase, sem espaços, sem acentos, sem pontos intermediários:

- `nr-35_blocks.jsonl`
- `api-510_blocks.jsonl`
- `asme-section-viii-div1_blocks.jsonl`
- `irata-icop_blocks.jsonl`
- `nr-13_blocks.jsonl`

Padrão: `<slug-da-norma>_blocks.jsonl`

## Saída mínima do log

Todo processamento deve terminar com:

- fonte;
- domínio;
- status de vigência;
- tipo de permissão;
- idioma;
- número de blocos criados;
- lacunas;
- próximos passos.
