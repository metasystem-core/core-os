# Implementation Notes

Fase 1 — E-mail: plataforma premium envia alertas para e-mail/alias; filtro cria label; parser extrai ticker/evento/link/anexo; triagem classifica; log registra.

Fase 2 — Documentos públicos: monitorar CVM Dados Abertos, Fundos.NET e RI; baixar documentos por ticker; extrair texto/tabelas; comparar com mês anterior.

Fase 3 — Dados pessoais limpos: importar posição da carteira por CSV/planilha; normalizar; nunca misturar calibração pessoal com carteira mutável.

Fase 4 — Ativos correlacionados: PETR4 aciona petróleo/câmbio/Estado; VALE3 aciona minério/China/câmbio; FIIs acionam Selic/NTN-B/cap rate/vacância/crédito.

Fase 5 — Feedback: resumo curto para alerta comum; análise estruturada para alerta material; revisão de tese só quando gatilho justificar.
