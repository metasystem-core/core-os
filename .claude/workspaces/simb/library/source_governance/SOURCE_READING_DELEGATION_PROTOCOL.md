# SOURCE_READING_DELEGATION_PROTOCOL

> Modo de criação: ARCHITECTURE_AND_POLICY_ONLY. Nenhuma fonte lida, nenhum chunk ou card criado neste ato.

## 1. Propósito

Definir quando ChatGPT processa uma fonte, quando Claude/Cowork integra um pacote já processado, e quando Claude/Cowork pode solicitar leitura adicional parcial ou completa.

## 2. Papéis

### ChatGPT

Função:

- leitor/arquiteto principal;
- decide profundidade inicial da fonte;
- gera pacotes condensados;
- compara com corpus já existente;
- identifica lacunas, riscos, redundâncias e candidatos;
- decide se deve recomendar leitura total, parcial ou apenas triagem.

### Claude/Cowork

Função:

- oficina local;
- integra arquivos no CORE-OS;
- cria manifests, registries, audits e templates;
- audita paths, consistência e git status;
- não lê fonte bruta por padrão;
- pode solicitar leitura adicional se detectar necessidade técnica.

### Operador

Função:

- autoriza full reading;
- aprova promoção;
- decide tradeoff entre custo, profundidade e urgência.

## 3. Regra principal

Claude/Cowork não deve ler livro inteiro por padrão.

O fluxo padrão é:

1. ChatGPT processa a fonte.
2. ChatGPT gera pacote condensado.
3. Claude/Cowork lê o pacote.
4. Claude/Cowork integra ou audita.
5. Claude/Cowork só pede leitura adicional se o pacote não for suficiente.

## 4. Modos de leitura

- **LEVEL 0 — NO_READ** — Fonte reconhecida, mas não processada.
- **LEVEL 1 — MANIFEST_ONLY** — Apenas metadados.
- **LEVEL 2 — TRIAGE** — Sumário, prefácio, introdução, conclusão, índice e prospectus.
- **LEVEL 3 — TARGETED_READING** — Leitura de capítulos específicos com pergunta operacional clara.
- **LEVEL 4 — PARTIAL_SOURCE_FIRST** — Leitura parcial estruturada com self-analysis limitado.
- **LEVEL 5 — FULL_SOURCE_FIRST** — Leitura integral com chunks, self-analysis, audit e candidatos.

## 5. Critérios para ChatGPT recomendar full reading

Full reading só deve ser recomendado se ao menos um critério forte estiver presente:

- a fonte pode virar protocolo;
- a fonte pode virar skill;
- a fonte corrige firewall crítico;
- a fonte é canônica para lacuna estrutural;
- a fonte fundamenta produto;
- a fonte altera arquitetura da Iris;
- a fonte resolve tensão entre fontes existentes;
- a fonte exige leitura contextual inteira para não distorcer.

## 6. Critérios para Claude/Cowork solicitar leitura adicional

Claude/Cowork pode solicitar leitura parcial ou completa quando, após ler o pacote processado:

- houver lacuna operacional concreta;
- o pacote não permitir criar manifest seguro;
- houver contradição entre self-analysis e cards propostos;
- houver risco de promoção indevida;
- houver capítulo citado como importante mas não processado;
- houver inconsistência entre fonte, registry e protocolo;
- for necessário validar uma passagem contra o texto bruto;
- a fonte for candidata a protocolo/skill e o pacote estiver insuficiente.

## 7. Formato obrigatório de solicitação de leitura adicional

Claude/Cowork deve criar uma READING_ESCALATION_REQUEST com:

- source_id_candidate:
- fonte:
- tipo de leitura solicitada:
  - TARGETED_READING
  - PARTIAL_SOURCE_FIRST
  - FULL_SOURCE_FIRST
- motivo:
- capítulos/seções necessários:
- risco de não ler:
- custo estimado:
  - low
  - medium
  - high
- alternativa mais barata:
- recomendação:
- requer autorização do operador: sim

## 8. Proibições

Claude/Cowork não deve:

- iniciar full reading sem autorização;
- ler PDF/EPUB bruto quando pacote processado basta;
- criar chunks privados sem autorização;
- promover cards sem audit;
- tratar fonte técnica como fonte simbólica;
- commitar fontes brutas;
- misturar sonhos pessoais do operador com biblioteca versionável.

## 9. Fluxo recomendado

1. Fonte chega.
2. ChatGPT define modo inicial.
3. ChatGPT gera processing pack.
4. Claude/Cowork integra processing pack.
5. Claude/Cowork audita suficiência.
6. Se necessário, Claude cria READING_ESCALATION_REQUEST.
7. Operador autoriza ou nega.
8. Só então leitura adicional ocorre.

## 10. Relação com otimização de tokens

Regra: Nenhuma fonte deve entrar em HIGH TOKEN MODE sem:

- triage prévio;
- motivo operacional;
- comparação com corpus existente;
- autorização explícita.

## 11. Exemplos

**Hall**
Resultado: FULL_SOURCE_FIRST justificado.
Motivo: Virou DREAM_ANALYSIS_PROTOCOL.

**Edinger Anatomy**
Resultado: FULL_SOURCE_FIRST justificado.
Motivo: Canônico para operações simbólicas/alquímicas.

**Jung Dream Analysis Seminar**
Resultado inicial recomendado: TRIAGE ou TARGETED_READING.
Motivo: Fonte canônica, mas muito grande; não iniciar full reading sem pergunta operacional.

**Robert A. Johnson — Inner Work**
Resultado inicial recomendado: TARGETED_READING forte ou PARTIAL_SOURCE_FIRST.
Motivo: Pode cobrir lacuna de trabalho autônomo com sonhos e active imagination.

## 12. Output esperado

Quando aplicado a uma fonte, o protocolo deve produzir uma decisão:

- READ_MODE:
- JUSTIFICATION:
- EXPECTED_OUTPUT:
- CLAUDE_ACTION:
- OPERATOR_AUTHORIZATION_REQUIRED:
