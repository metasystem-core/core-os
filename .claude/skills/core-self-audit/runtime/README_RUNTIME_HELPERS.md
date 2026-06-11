# Runtime helpers — CORE-SELF-AUDIT

## self_audit_scanner.py

Script simples para mapear estrutura de repositório sem usar IA.

Ele gera:

- total de arquivos;
- extensões;
- SKILL.md encontrados;
- manifests;
- READMEs;
- arquivos all-in-one/combined;
- possíveis caminhos sensíveis por nome.

## Uso

```bash
python .claude/skills/core-self-audit/runtime/self_audit_scanner.py /caminho/do/repositorio --out docs/reports/self_audit_structure_scan.json
```

## Importante

O script não altera arquivos.  
É apenas uma pré-varredura mecânica para economizar Claude e organizar contexto.
