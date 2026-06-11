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
