---

# FILE: README.md

# ASSET-CORE Automation / Data Ingestion / Public Monitoring

Pacote para Claude Code.

Objetivo: alimentar o ASSET-CORE de forma automática com sinais externos, dados públicos, documentos oficiais e dados pessoais limpos, transferindo a parte mecânica de coleta/organização/triagem para o sistema sem terceirizar a decisão financeira.

Regra central:
A plataforma avisa. O sistema verifica. O ASSET-CORE analisa. O operador decide.

Camadas:
1. Dados pessoais limpos: positions.csv, transactions.csv, dividends.csv, cash_accounts.csv, watchlist.csv.
2. Sinais externos: e-mail, WhatsApp fase 2, plataforma premium, alertas de preço/provento/documento/fato relevante.
3. Dados públicos: CVM Dados Abertos, Fundos.NET, RI oficial, B3 quando aplicável.
4. Núcleo analítico: ASSET-CORE, FII Analyzer, CRI/CRA Quality Tool, Valuation Brazil, BTC-CORE, Commodity Linked Equity Analyzer.



---

# FILE: 00_ASSET_AUTOMATION_PROMPT.md

# PROMPT — ASSET-CORE AUTOMATION

Você é o conjunto de sub-skills de automação do ASSET-CORE.

Função: receber, buscar, organizar, limpar, classificar e encaminhar dados financeiros, sinais externos e documentos públicos para análise do ASSET-CORE.

Você NÃO recomenda compra ou venda diretamente.

Separe sempre:
- dado bruto;
- dado limpo;
- inferência;
- alerta;
- hipótese;
- decisão pendente.

Princípios:
1. Notificação é insumo, não decisão.
2. Documento público é dado, não conclusão.
3. Relatório gerencial é comunicação do gestor, não verdade absoluta.
4. Preço não é tese.
5. Provento alto não é qualidade.
6. P/VP baixo não é automaticamente oportunidade.
7. Dados de carteira ficam fora da calibração pessoal.
8. Fonte oficial prevalece sobre fonte secundária.
9. Divergência entre fontes vira conflito a declarar.
10. A decisão pertence ao ASSET-CORE.

Fontes prioritárias:
1. CVM Dados Abertos.
2. Fundos.NET.
3. RI oficial de gestores/administradores/empresas.
4. B3 quando aplicável.
5. Plataforma premium como sensor.
6. Fontes secundárias apenas como apoio.



---

# FILE: skills/asset_automation_orchestrator/SKILL.md

# SKILL — Asset Automation Orchestrator

Orquestra o fluxo automático.

Fluxo:
1. Receber sinais.
2. Limpar e padronizar.
3. Classificar evento.
4. Validar fonte oficial.
5. Baixar documentos.
6. Atualizar logs.
7. Atualizar carteira se houver arquivo.
8. Roteador escolhe sub-skill.
9. Sub-skill gera resumo.
10. ASSET-CORE interpreta.
11. Feedback ao operador.
12. Decisões entram no decision_log.

Regra: automação coleta e organiza. ASSET decide. Operador executa ou não.



---

# FILE: skills/asset_core_guardrails/SKILL.md

# SKILL — Asset Core Automation Guardrails

Evita que automação gere decisões ruins.

Regras: não operar automaticamente; não recomendar compra/venda por alerta; não assumir fonte secundária como verdade; não confundir preço com oportunidade; não confundir provento alto com qualidade; não ignorar regime, portfólio, liquidez, CDI/NTN-B, concentração; não atualizar tese sem log.

Frase central: automação aumenta cobertura, não reduz responsabilidade.



---

# FILE: skills/asset_event_taxonomy/SKILL.md

# SKILL — Asset Event Taxonomy

Padroniza eventos: preço, provento, resultado, relatório, informe, fato relevante, comunicado, emissão, subscrição, guidance, carteira, vacância, inadimplência, rating, renegociação, pré-pagamento, gestão, regulação, commodity, câmbio, juros, inflação, risco político, evento setorial, ruído.

Materialidade: baixa, média, alta, crítica.

Regra: evento deve ser classificado antes de interpretado.



---

# FILE: skills/asset_feedback_generator/SKILL.md

# SKILL — Asset Feedback Generator

Gera feedback curto para o operador.

Formato:
# FEEDBACK ASSET-CORE — [TICKER]
- Sinal recebido
- Classificação
- Relevância: baixa/média/alta/crítica
- O que pode afetar
- O que precisa verificar
- Próxima ação
- Decisão financeira? Não, ainda é sinal
- Onde pode falhar

Regra: alerta pequeno não merece textão.



---

# FILE: skills/asset_notification_router/SKILL.md

# SKILL — Asset Notification Router

Encaminha cada sinal para a sub-skill correta.

Roteamento:
- FII tijolo -> FII Analyzer.
- FII papel/CRI/CRA -> CRI/CRA Quality Tool.
- FII relatório mensal -> FII Monthly Document Monitor.
- Ação brasileira -> Equity Analyzer / Valuation Brazil.
- PETR4/VALE3/commodities -> Commodity Linked Equity Analyzer.
- BTC -> BTC-CORE.
- Provento -> Portfolio Income Tracker.
- Fato relevante -> Official Source Validator + ASSET Review.
- Preço -> Regime + Valuation + Portfolio Context.
- Ruído/marketing -> registrar ou ignorar.

Regra: roteador não conclui; entrega ao módulo adequado.



---

# FILE: skills/asset_review_trigger_matrix/SKILL.md

# SKILL — Asset Review Trigger Matrix

Define quando revisar ativo/tese/portfólio.

Revisão leve: relatório normal, provento esperado, oscilação pequena.
Revisão média: mudança de provento, vacância, P/VP, indexador, preço relevante.
Revisão alta: fato relevante material, inadimplência, deterioração de crédito, emissão grande, alavancagem, gestão, política de distribuição.
Revisão crítica: suspensão de rendimento, default, fraude, perda de ativo relevante, intervenção estatal/regulatória material.

Regra: revisar tese não significa operar imediatamente.



---

# FILE: skills/asset_signal_ingestion_gateway/SKILL.md

# SKILL — Asset Signal Ingestion Gateway

Recebe qualquer sinal externo e transforma em entrada limpa para o ASSET-CORE.

Canais: e-mail, WhatsApp fase 2, plataforma premium, CSV, JSON, webhook, arquivo manual.

Pipeline:
1. Receber sinal bruto.
2. Registrar fonte/canal.
3. Extrair ticker.
4. Identificar classe de ativo.
5. Identificar evento.
6. Preservar texto bruto, links e anexos.
7. Verificar duplicidade.
8. Classificar relevância.
9. Encaminhar para sub-skill correta.
10. Gerar feedback preliminar.
11. Registrar log.

Campos mínimos JSON: received_at, source, channel, ticker, asset_class, event_type, raw_title, raw_text, links, attachments, priority, triage, requires_official_source_check, requires_asset_core_review, status.

Regra: notificação é insumo; decisão pertence ao ASSET-CORE.



---

# FILE: skills/commodity_linked_equity_analyzer/SKILL.md

# SKILL — Commodity Linked Equity Analyzer

Analisa ações dependentes de commodities e fatores macro externos.

Usar para PETR4/PETR3, VALE3, siderúrgicas, papel e celulose, petroquímicas, exportadoras.

Processo:
1. Commodity dominante.
2. Sensibilidade ao câmbio.
3. Regime global da commodity.
4. Risco local Brasil.
5. Separar operacional de ciclo de preço.
6. Dividendos e política de capital.
7. Risco regulatório/estatal.
8. Comparar alternativas.
9. Encaminhar para Valuation Brazil.

Regra: não analisar PETR4 como apenas ação barata. É equity + commodity + câmbio + Estado + dividendos + risco político.



---

# FILE: skills/correlated_asset_factor_mapper/SKILL.md

# SKILL — Correlated Asset Factor Mapper

Mapeia fatores externos e ativos correlacionados que influenciam um ativo.

Princípio: ativos não vivem isolados. Algumas teses dependem de macro, commodities, câmbio, juros, setor, regulação ou política.

Exemplos:
PETR4: Brent/WTI, USD/BRL, política de preços, risco estatal, dividendos, refino, produção, OPEP, demanda global, CAPEX, dívida.
VALE3: minério, China, USD/BRL, frete, aço, risco ambiental/regulatório, barragens, CAPEX.
FIIs: Selic, NTN-B, inflação, vacância, crédito, cap rate, mercado imobiliário, liquidez.

Processo: identificar drivers, separar estrutural de ruído, classificar correlação, avaliar regime, risco de tese e sub-skill acionada.



---

# FILE: skills/data_cleaning_normalizer/SKILL.md

# SKILL — Data Cleaning Normalizer

Limpa e padroniza dados antes da análise.

Padronizações: ticker maiúsculo, datas YYYY-MM-DD, moeda BRL, source explícita, last_update obrigatório, vazio como lacuna e não zero, remover duplicatas preservando origem.

Regra: dado limpo significa rastreável, não necessariamente verdadeiro.



---

# FILE: skills/document_download_pipeline/SKILL.md

# SKILL — Document Download Pipeline

Baixa, organiza e versiona documentos públicos.

Salvar por ticker, competência, tipo, fonte, url, versão, status, hash e caminho local.

Regras: preservar bruto; não sobrescrever sem versionar; detectar reapresentação; registrar ausência; separar PDF original de extração textual.



---

# FILE: skills/email_ingestion_setup/SKILL.md

# SKILL — Email Ingestion Setup

Define como receber alertas por e-mail.

Fluxo:
1. Criar e-mail dedicado ou alias.
2. Configurar plataforma premium para enviar alertas.
3. Criar label ASSET_ALERTS.
4. Parser lê mensagens com label.
5. Extrai ticker/evento/link/anexo.
6. Marca como processado ou erro.

Labels sugeridas: ASSET_ALERTS_RAW, PARSED, PROCESSED, ERROR, NEEDS_REVIEW.

Regra: e-mail é preferencial por ser auditável, pesquisável e compatível com anexos.



---

# FILE: skills/fii_monthly_document_monitor/SKILL.md

# SKILL — FII Monthly Document Monitor

Busca, baixa, organiza e analisa mensalmente documentos públicos de FIIs da carteira/watchlist.

Fontes: CVM Dados Abertos, Fundos.NET, RI de gestores/administradores, B3 quando aplicável.

Documentos: informe mensal estruturado, relatório gerencial, comunicado, fato relevante, aviso aos cotistas, aviso de rendimentos, DFs, informes trimestrais/anuais, regulamento, emissão, relatórios de risco, documentos de CRI/CRA.

Processo mensal:
1. Ler FIIs.
2. Verificar documentos novos.
3. Baixar documentos públicos.
4. Salvar por ticker/competência.
5. Extrair texto/tabelas.
6. Classificar documento.
7. Comparar com mês anterior.
8. Detectar mudanças.
9. Gerar resumo por FII.
10. Gerar alertas para ASSET.
11. Atualizar log.

Regra: documento novo é dado novo, não decisão nova.



---

# FILE: skills/official_source_validator/SKILL.md

# SKILL — Official Source Validator

Valida sinais externos contra fontes oficiais.

Quando usar: fato relevante, comunicado, relatório, informe, rendimento, emissão, subscrição, inadimplência, gestão, evento de crédito.

Classificação: validado, parcialmente validado, não encontrado, divergente, fonte secundária apenas, precisa revisão manual.

Regra: alerta material não vira verdade final sem validação.



---

# FILE: skills/petr4_oil_brand_risk_lens/SKILL.md

# SKILL — PETR4 Oil / Brand / State Risk Lens

Lente específica para PETR4/Petrobras.

Analisar sempre junto com:
- Brent/WTI;
- USD/BRL;
- política de preços;
- risco estatal;
- dividendos;
- CAPEX;
- dívida;
- produção;
- refino;
- interferência política;
- regime global do petróleo;
- valuation vs pares quando aplicável.

Perguntas:
1. Resultado vem de operação ou ciclo de petróleo?
2. Dividendo é sustentável ou extraordinário?
3. Risco estatal aumenta ou diminui?
4. Preço incorpora risco político?
5. Câmbio ajuda ou atrapalha?
6. Tese depende de petróleo alto?
7. Que evento quebraria a tese?

Regra: PETR4 não deve ser analisada isolada do petróleo, câmbio e Estado.



---

# FILE: skills/platform_alert_parser/SKILL.md

# SKILL — Platform Alert Parser

Interpreta alertas da plataforma premium.

Extrair: ticker, nome do ativo, classe, evento, data, fonte, link, texto bruto, urgência, anexos, necessidade de validação oficial e possível impacto.

Eventos: preço, provento, relatório gerencial, informe mensal, fato relevante, comunicado, resultado, guidance, emissão, subscrição, alteração de carteira, vacância, inadimplência, CRI/CRA, rating, oportunidade, risco, ruído/marketing, duplicado.

Regra: parser limpa entrada; não interpreta tese.



---

# FILE: skills/portfolio_data_schema/SKILL.md

# SKILL — Portfolio Data Schema

Define schemas limpos.

Arquivos: positions.csv, transactions.csv, dividends.csv, cash_accounts.csv, watchlist.csv.

Regras: posição atual vem de arquivo; preço médio auditável; divergência marcada; dados importados do Investidor10/B3 devem ser limpos antes da análise; calibração pessoal não contém carteira mutável.



---

# FILE: skills/portfolio_income_tracker/SKILL.md

# SKILL — Portfolio Income Tracker

Rastreia dividendos, JCP, rendimentos de FIIs e fluxo de caixa.

Entradas: dividends.csv, alertas de proventos, avisos aos cotistas, carteira atual e histórico.

Saída: proventos recebidos, esperados, variações, quedas/aumentos anormais, impacto no reinvestimento e alerta para ASSET.

Regra: provento é fluxo, não tese completa.



---

# FILE: skills/public_data_source_registry/SKILL.md

# SKILL — Public Data Source Registry

Registra fontes públicas e prioridade.

Nível 1: CVM Dados Abertos, Fundos.NET, RI oficial, B3, documentos regulatórios.
Nível 2: plataforma premium, Investidor10/B3 importada, agregadores.
Nível 3: casas de análise, portais financeiros, notícias.

Regra: fonte secundária alerta; fonte primária valida.



---

# FILE: skills/signal_relevance_triage/SKILL.md

# SKILL — Signal Relevance Triage

Classifica se um sinal merece atenção.

Classes: IGNORAR, REGISTRAR, ACOMPANHAR, ANALISAR, ALERTA, REVISÃO DE TESE.

Critérios: afeta fluxo de caixa, crédito, tese, preço material, liquidez, governança, regime, portfólio, watchlist, fonte oficial, duplicidade ou ação necessária.

Regra: sinal relevante é gatilho de análise, não ordem de compra/venda.



---

# FILE: skills/whatsapp_ingestion_phase2/SKILL.md

# SKILL — WhatsApp Ingestion Phase 2

Modela recebimento futuro de sinais por WhatsApp.

Recomendação: usar WhatsApp como alerta humano inicialmente; usar e-mail para processamento automático.

Opções: WhatsApp Business Cloud API/webhook, encaminhamento manual, WhatsApp apenas como alarme.

Riscos: complexidade, fragilidade, mensagens incompletas, perda de anexos, ruído e baixa auditabilidade.



---

# FILE: schemas/alert_log.csv

id,received_at,source,channel,ticker,asset_class,event_type,priority,triage,status,official_source_checked,asset_core_reviewed,notes



---

# FILE: schemas/cash_accounts.csv

date,account,institution,balance,yield_reference,liquidity,notes



---

# FILE: schemas/dividends.csv

payment_date,ticker,asset_type,amount_per_share,quantity,total_received,competence,source,notes



---

# FILE: schemas/document_log.csv

id,ticker,asset_class,document_type,reference_date,delivery_date,source,url,version,status,local_path,hash,notes



---

# FILE: schemas/parsed_alerts.jsonl

{"received_at":"","source":"","channel":"","ticker":"","event_type":"","triage":"","status":"new"}



---

# FILE: schemas/positions.csv

ticker,asset_type,quantity,average_price,current_price,total_cost,current_value,source,last_update,notes



---

# FILE: schemas/transactions.csv

date,ticker,asset_type,operation,quantity,unit_price,total_value,fees,source,notes



---

# FILE: schemas/watchlist.csv

ticker,asset_type,priority,reason,status,notes



---

# FILE: templates/asset_review_trigger.md

# TRIGGER DE REVISÃO — [TICKER]

## Evento
...

## Materialidade
baixa / média / alta / crítica

## Revisão necessária
nenhuma / leve / média / alta / crítica

## Próxima ação
...



---

# FILE: templates/decision_pending_note.md

# DECISÃO PENDENTE — ASSET-CORE

## Dado novo
...

## O que mudou
...

## O que não mudou
...

## Lacunas
...

## Análise necessária
...

## Decisão agora?
Sim / Não



---

# FILE: templates/feedback_de_sinal.md

# FEEDBACK DE SINAL — [TICKER]

## Sinal recebido
...

## Classificação
...

## Relevância
baixa / média / alta / crítica

## O que isso pode afetar
...

## O que precisa ser verificado
...

## Próxima ação
...

## Decisão financeira?
Não. Este sinal ainda precisa passar pelo ASSET-CORE.



---

# FILE: templates/mapa_fatores_correlacionados.md

# MAPA DE FATORES CORRELACIONADOS — [TICKER]

## Drivers principais
...

## Commodities relacionadas
...

## Câmbio / juros / inflação
...

## Riscos regulatórios ou estatais
...

## Como isso afeta a tese
...



---

# FILE: templates/painel_mensal_fiis.md

# PAINEL MENSAL DE FIIs — [MÊS/ANO]

## Fundos sem alerta
...

## Fundos em atenção
...

## Fundos com alerta relevante
...

## Fundos com possível oportunidade
...

## Fundos com deterioração
...

## Dados faltantes
...



---

# FILE: templates/resumo_mensal_fii.md

# RESUMO MENSAL — [TICKER] — [MÊS/ANO]

## Documentos analisados
...

## Mudanças relevantes
...

## Indicadores principais
...

## Pontos de alerta
...

## Risco dominante
...

## Classificação preliminar
normal / atenção / alerta / deterioração / oportunidade potencial



---

# FILE: docs/CLAUDE_TASK_PROMPT.md

# Prompt para Claude Code

Crie a estrutura CORE_OS_PERSONAL para automação do ASSET-CORE.

Use este pacote para:
1. Criar sub-skills em core_asset/subskills/.
2. Criar schemas CSV em data/portfolio/ e data/inbox/.
3. Criar estrutura para documentos públicos em data/market_public/.
4. Criar pipeline inicial de ingestão por e-mail: parsing, triagem, roteamento, feedback e log.
5. Criar monitoramento mensal de FIIs.
6. Criar lente de ativos correlacionados, especialmente PETR4 ↔ petróleo/câmbio/Estado.
7. Manter decisão final subordinada ao ASSET-CORE.

Regra: automação coleta, limpa e organiza. Não executa decisão financeira automática.



---

# FILE: docs/FOLDER_STRUCTURE.md

# Estrutura sugerida

CORE_OS_PERSONAL/
├── operator_profile/
├── data/
│   ├── inbox/
│   ├── portfolio/
│   └── market_public/
├── cores/
│   └── core_asset/
│       └── subskills/
└── outputs/
    ├── monthly_fii_reports/
    ├── asset_alert_feedback/
    └── decision_logs/



---

# FILE: docs/IMPLEMENTATION_NOTES.md

# Implementation Notes

Fase 1 — E-mail: plataforma premium envia alertas para e-mail/alias; filtro cria label; parser extrai ticker/evento/link/anexo; triagem classifica; log registra.

Fase 2 — Documentos públicos: monitorar CVM Dados Abertos, Fundos.NET e RI; baixar documentos por ticker; extrair texto/tabelas; comparar com mês anterior.

Fase 3 — Dados pessoais limpos: importar posição da carteira por CSV/planilha; normalizar; nunca misturar calibração pessoal com carteira mutável.

Fase 4 — Ativos correlacionados: PETR4 aciona petróleo/câmbio/Estado; VALE3 aciona minério/China/câmbio; FIIs acionam Selic/NTN-B/cap rate/vacância/crédito.

Fase 5 — Feedback: resumo curto para alerta comum; análise estruturada para alerta material; revisão de tese só quando gatilho justificar.
