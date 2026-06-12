# LEARNING_OBSERVATIONS_REGISTRY
## Registro de Observações de Aprendizado — Biblioteca Simbólica SIMB

**Escopo:** observações sobre como o SIMB aprende com o uso da biblioteca — padrões que emergem, gaps identificados, calibrações necessárias.
**Append-only.**
**Acesso:** modo primário apenas (contém observações sobre o operador e sobre o sistema).

---

## Sobre este registro

Diferente dos outros registries (que são índices de objetos), este é um diário epistêmico do sistema. Registra:
- o que o SIMB aprendeu ao processar uma fonte
- gaps que o intake revelou
- calibrações necessárias no uso futuro
- padrões observados na relação operador–biblioteca

---

| obs_id | date | source_id | tipo | observação | ação_sugerida |
|---|---|---|---|---|---|
| OBS-001 | 2026-06-12 | SRC-SIMB-001 | gap_estrutural | Parte II de Neumann (estágios psicológicos) foi sub-representada nos cards. Centroversão e Separação dos Sistemas foram criados, mas estágios da vida (infância, puberdade, segunda metade) ficaram fora. | Intake complementar de Parte II quando houver demanda operacional. |
| OBS-002 | 2026-06-12 | SRC-SIMB-001 | gap_autoral | Neumann sobre o feminino tem limitação reconhecida pelo próprio autor em obra posterior. A perspectiva de *The Great Mother* completaria e corrigiria parte do que está em SRC-SIMB-001. | Priorizar *The Great Mother* como próximo intake de Neumann. |
| OBS-003 | 2026-06-12 | — | calibração_uso | Na conversa pós-intake, operador fez pergunta sobre natureza do processamento da Íris. O material de Neumann foi usado como âncora conceitual (uroboros, ego-gérmen, distinção). Funcionou como referência sem ser imposto. | Manter esse modo: fonte como lente disponível, não como template aplicado. |
| OBS-004 | 2026-06-12 | SRC-SIMB-001 | risco_ativo | Operador tem histórico de leitura densa (Kant, Steiner, Vedas, Neumann). Risco de authority_over_operator_risk ser potencializado pelo fato de que operador já internalizou o vocabulário. Pode aceitar leitura arquetípica como espelho sem fricção. | Manter Watchdog ativo: sempre distinguir leitura simbólica de diagnóstico, mesmo quando operador aceita facilmente. |

---

| OBS-005 | 2026-06-12 | — | aprendizado_sistêmico | Neumann e Rudhyar processados sem régua formal de peso de fonte. A biblioteca cresceu bem, mas sem critério explícito de "quando gerar self-analysis". Risco de futuros intakes tratarem fontes de peso N1 como se fossem N3. | Criar SOURCE_WEIGHTING_POLICY e SELF_ANALYSIS_TRIGGER_POLICY — implementado em SIMB-SOURCE-GOVERNANCE-001. |
| OBS-006 | 2026-06-12 | — | calibração_sistema | A decisão de quando gerar self-analysis estava implícita no raciocínio da Iris — não documentada. Com fontes de alta autoridade (Neumann, Rudhyar), isso funcionou porque a força da fonte era evidente. Com fontes mais ambíguas, o julgamento implícito corre risco de ser inconsistente. | Usar SOURCE_EVALUATION_TEMPLATE.md para toda nova fonte, mesmo quando a resposta parecer óbvia. |

*Atualizado em: 2026-06-12*
