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
