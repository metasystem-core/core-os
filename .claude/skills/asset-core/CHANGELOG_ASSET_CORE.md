# Changelog ASSET-CORE

## 2026-05-01 — Patch Valuation Brasil

Alterações:

- Valuation Orchestrator passa a exigir adaptação Brasil por padrão.
- Proibida aplicação crua de modelos estrangeiros.
- CDI/Selic, NTN-B, inflação, liquidez, tributação, governança, risco estatal/regulatório e risco Brasil passam a ser inputs obrigatórios.
- FIIs passam a ter valuation específico.
- Classificação de FIIs inclui:
  - high grade;
  - high yield;
  - oportunidade.
- Criada sub-skill para CRI/CRA.
- Criada sub-skill para diagnóstico de P/VP.
- Criada sub-skill detectora de oportunidades.
- Criada sub-skill detectora de float.
- Valuation deve evoluir de arquitetura conceitual para cálculo/score explícito sempre que houver dados.
- Adicionado `validation_tests.md` para impedir sofisticação falsa.
