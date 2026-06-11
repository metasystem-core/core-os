# Runtime helpers — CONTEXT-MAPPER

## session_packager.py

Cria a estrutura inicial de um pacote de contexto a partir de um arquivo bruto de sessão.

Ele não interpreta profundamente.  
Ele economiza tempo criando a pasta e os arquivos padrão.

## Uso

```bash
python .claude/skills/context-mapper/runtime/session_packager.py --input raw_session.md --project CORE_OS --out context_packs/2026-06-08_CORE_OS
```

## Saída

- raw_session_reference.md
- session_summary.md
- context_pack.md
- action_queue.md
- harvest_candidates.md
- discard_log.md
- next_session_bootstrap.md
- artifact_manifest.json

## Regra

Este helper cria andaime.  
A inteligência vem depois: operador, ChatGPT ou Claude revisam e preenchem.
