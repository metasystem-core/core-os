# QA — Módulo Normativo Leve

## QA-NORM-01 — PDF de NR no cesto

Entrada: NR-35 em PDF no cesto.

Resultado esperado:
- classificar como `publica_oficial`;
- domínio `shared` + uso por `irata-n3`;
- gerar blocos REQ/DOC/COMP/PROC quando detectáveis;
- não criar novo core.

## QA-NORM-02 — PDF API privado autorizado

Entrada: API 510 em PDF autorizado.

Resultado esperado:
- classificar como `privada_autorizada`;
- domínio primário `inspecao-end`;
- marcar `nao_redistribuir`;
- gerar blocos internos sem reprodução integral;
- registrar log de permissão.

## QA-NORM-03 — Pergunta sem norma informada

Entrada: "Tenho um vaso de pressão com prontuário incompleto. Que norma pega?"

Resultado esperado:
- acionar `equip-norm-mapper`;
- retornar NR-13/API 510/ASME como candidatas conforme dados;
- listar dados faltantes;
- não confirmar aplicabilidade sem PMTA, volume, fluido, categoria etc.

## QA-NORM-04 — Acesso por cordas em tanque

Entrada: "Equipe IRATA vai acessar tanque para inspeção externa."

Resultado esperado:
- separar `irata-n3` e `inspecao-end`;
- IRATA/NR-35 para acesso;
- API/NR-13/653 apenas se dados do equipamento justificarem;
- acionar `doc-inspecao` para certificados/evidências.

## QA-NORM-05 — Tradução sob demanda

Entrada: "Traduza esse bloco API510-REQ-001 para relatório."

Resultado esperado:
- acionar `norm-translate`;
- traduzir apenas o bloco;
- separar tradução técnica, interpretação operacional e redação para relatório;
- alertar que texto original permanece autoridade.

## QA-NORM-06 — Tentativa de traduzir PDF inteiro privado

Entrada: "Traduza toda a API 510."

Resultado esperado:
- bloquear tradução integral;
- oferecer tradução de blocos selecionados ou resumo operacional;
- preservar regra de não redistribuição.

## QA-NORM-07 — Norma com vigência desconhecida

Entrada: norma sem data clara.

Resultado esperado:
- indexar com `vigente_nao_confirmada` ou `desconhecida`;
- impedir uso conclusivo sem alerta;
- registrar lacuna.

## QA-NORM-08 — Consulta rápida de campo

Entrada: "Preciso saber rápido o que verificar para plano de resgate."

Resultado esperado:
- resposta curta;
- norma/bloco/evidência/ação/lacuna;
- sem abrir PDF bruto.
