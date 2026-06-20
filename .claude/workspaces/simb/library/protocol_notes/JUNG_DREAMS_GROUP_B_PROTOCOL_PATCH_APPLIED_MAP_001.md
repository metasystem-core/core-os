---
tipo: patch_applied_map
source_id: SRC-SIMB-011
task: TASK 23 — JUNG_DREAMS_GROUP_B_PROTOCOL_PATCHES_AND_PUSH_001
data: 2026-06-20
status: complete
patches_aplicados: 13 (PATCH-017 a PATCH-029)
grupo: B / ALTA prioridade
nota: Patches de Grupo A (IMEDIATA) foram aplicados em Task 21H (PATCH-005 a PATCH-016). Este mapa cobre apenas o Grupo B.
---

# JUNG_DREAMS_GROUP_B_PROTOCOL_PATCH_APPLIED_MAP_001

> Mapa dos 13 patches de Grupo B aplicados ao DREAM_ANALYSIS_PROTOCOL em Task 23.
> Fonte de verdade: JUNG_DREAMS_FINAL_PROTOCOL_PROMOTION_PLAN_001.
> PP-010 não está no Grupo B da fonte de verdade (está em Grupo C / MÉDIA) — não aplicado; reportado abaixo.

---

## Tabela de Patches Aplicados

| patch_id | pp_ids | nome_breve | source_basis | target_section | behavior_change | applied | safety_boundary | notas |
|---|---|---|---|---|---|---|---|---|
| PATCH-017 | PP-004 | Não literalizar sexual | SRC-SIMB-011 §506 (General Aspects) | Fase 3 — PATCH-003 block | Adiciona instrução positiva: verificar dimensão simbólica antes de reduzir ao literal; âncora teórica Jung primário | sim | F-16 mantido; nenhum enfraquecimento | PP-004 já coberto operacionalmente por PATCH-003; calibração adiciona base textual e instrução positiva |
| PATCH-018 | PP-006 | Série longitudinal | SRC-SIMB-011 §550-552 (On the Nature of Dreams) | Fase 7 — Quando há histórico | Adiciona regra explícita: múltiplos sonhos em período curto → verificar padrões transversais antes de interpretar isoladamente | sim | CON-039 não modificado | Reforço de CON-039 via âncora Jung primário no protocolo |
| PATCH-019 | PP-008 | Parar: contexto insuficiente | SRC-SIMB-011 §493 (General Aspects) | Seção 15 — Falta de contexto | Adiciona formulação explícita: nomear a insuficiência como resposta válida; inação informada > hipótese inventada | sim | nenhum novo firewall; reforço de PATCH-006 | Complementa inação de PATCH-006 com declaração específica de lacuna |
| PATCH-020 | PP-009 | Assimetria etária — imago | SRC-SIMB-011 §506-508 (General Aspects) | Fase 3 — após PATCH-008 | Adiciona nota específica: assimetria etária = nível subjetivo obrigatório e rigoroso; âncora teórica imago/projeção | sim | F-09 permanece ativo; "assimetria etária" — wording safety mantido; sem "pessoa protegida" | Fornece fundamento teórico (imago) para o firewall operacional já existente (F-09) |
| PATCH-021 | PP-011 | Amplificação em ordem | SRC-SIMB-011 §553 (On the Nature of Dreams) | Fase 5 — após regra de série PATCH-009 | Adiciona sequência fixa explícita: (1) pessoal → (2) cultural → (3) arquetípico; âncora CON-038 + Jung primário | sim | RISK-002 permanece ativo; reforço de PATCH-009 | Torna explícita a ordem como sequência fixa inviolável, não apenas preferência |
| PATCH-022 | PP-019 | Pergunta operativa de compensação | SRC-SIMB-011 §330 (Practical Use) | Fase 9 — Possíveis vetores | Adiciona passo interno explícito: "Qual é a atitude consciente do operador agora? O que o sonho poderia estar compensando?" + formulação para o operador | sim | PATCH-013 (assentimento) referenciado como verificação obrigatória | Operacionaliza teoria de compensação (CON-037) no passo de leitura |
| PATCH-023 | PP-020 | Símbolo como desconhecido | SRC-SIMB-011 §339-342 (Practical Use) | Fase 3 — após PATCH-003 block | Adiciona sequência explícita: pessoal precede cultural precede arquetípico; fallback "Suponha que eu nunca ouvi"; qualificação obrigatória ao oferecer paralelo | sim | F-04 (anti-dicionário) referenciado; sem amplificação não solicitada | Torna explícita a sequência de interrogação que já estava implícita na estrutura de Fases 3/4/5 |
| PATCH-024 | PP-021 | Assimilação ≠ substituição | SRC-SIMB-011 §338 (Practical Use) | Fase 9 — antes de Declaração de provisoriedade | Adiciona regra: leitura de conteúdo inconsciente não contradiz/substitui o consciente — acrescenta; formulação positiva e formulação proibida | sim | F-02 (não prescrição) permanece; proibição "seu inconsciente sabe melhor" | Impede framing de "o inconsciente vs. o consciente"; reforça horizontalidade |
| PATCH-025 | PP-025 | Conflito não resolvido por interpretação | SRC-SIMB-011 §59 (Block 1) | Fase 9 — após Declaração de provisoriedade | Adiciona limite explícito: interpretação ilumina conflito, não resolve; formulação segura para o operador | sim | F-02 (não prescrição) + F-13 (não comando) permanentes | Alinha com posição central de Jung: "tal conflito não pode ser resolvido por compreensão, apenas por experiência" |
| PATCH-026 | PP-028 | Incompletude quaternária: notar | SRC-SIMB-011 §201, §327 (Block 2) | Fase 5 — após PATCH-010 (sem nomeação arquetípica) | Adiciona procedimento: estrutura de três em série mandálica → perguntar sobre ausente sem nomear; proíbe "falta a quarta função" | sim | F-18 (centro incognoscível) reforçado; sem nomear o que falta | Específico para contextos mandálicos/quaternais — não interfere com leitura geral |
| PATCH-027 | PP-030 | Recorrência = espiral | SRC-SIMB-011 §325 (Block 2) | Fase 7 — Quando há histórico, após Verificar transformações | Adiciona formulação espiral: retorno de tema = aprofundamento, não regressão; proíbe "você regrediu"; pergunta diferencial | sim | CON-039 referenciado; PP-030 já citado em CON-039 | Fornece âncora de protocolo para a formulação já presente em CON-039 e SKILL.md |
| PATCH-028 | PP-031 | Voz autorizada = peso diferenciado | SRC-SIMB-011 §294 (Block 2, Sonho 54) | Fase 6 — após Veículos | Adiciona procedimento: voz desincorporada = atenção diferenciada; três perguntas operacionais; não interpretar imediatamente | sim | wait_condition original: "confirmar em corpus adicional" — item aplicado com hedging ("Jung §294") | stability: medium; PP-031 tinha wait_condition; aplicado com formulação cuidadosa que não absolutiza |
| PATCH-029 | PH-004 | Números = aritmética pessoal | SRC-SIMB-011 §129-145 (Part I, Essay 2) | Fase 3 — após PATCH-023 block | Adiciona procedimento específico para números: associação pessoal primeiro (data, endereço, quantia, idade); paralelo simbólico somente após confirmar ausência; numerologia primária = erro anti-dicionário | sim | F-04 (anti-dicionário) referenciado; CON-045 referenciado | PH-004 é histórico/compatível; apesar de Part I, é consistente com regra anti-dicionário madura |

---

## Items Não Aplicados Nesta Task

| ID | Grupo original | Razão de não aplicação |
|---|---|---|
| PP-010 | Grupo C (MÉDIA) — **não está no Grupo B** | O task spec listou PP-010 como "Expected Group B item", mas a fonte de verdade (JUNG_DREAMS_FINAL_PROTOCOL_PROMOTION_PLAN_001) classifica PP-010 como Grupo C / MÉDIA prioridade. Seguindo a instrução "use the final promotion plan as source of truth": PP-010 não aplicado. Conteúdo: Telepatia — reconhecer sem endossar. Calibração de F-06. |
| Grupo A restante | — | Todos já aplicados em Task 21H (PATCH-005 a PATCH-016) |
| Grupo C | PP-005, PP-007, PH-003 | Grupo C / MÉDIA — aguardam confirmação de uso ou verificação de conflito |
| Grupo D | PH-001, PH-002, PH-005, PH-006 | NÃO PROMOVER — material histórico Jung-1909 |

---

## Notas de Estabilidade

| patch_id | pp_id | stability_note |
|---|---|---|
| PATCH-027 | PP-030 | ALTA — §325 explícito, consistente com CON-039 já validado |
| PATCH-028 | PP-031 | MÉDIA — PP-031 tinha wait_condition ("confirmar em corpus adicional"); aplicado com formulação que não absolutiza ("Jung §294 — as a rule" = padrão, não lei) |
| PATCH-029 | PH-004 | ALTA — §129-145 explícito; PH-004 é histórico-compatível, sem conflito com protocolo maduro |

---

## Safety Boundary Confirmado

Todos os 13 patches foram aplicados com os seguintes invariantes preservados:

- F-17 e F-18 não enfraquecidos
- F-04 (anti-dicionário) não contornado
- F-09 (assimetria etária) permanece ativo
- Wording: "assimetria etária" usado; "pessoa protegida" não introduzido; "legal" não introduzido como label
- Nenhuma instrução de diagnóstico, prognóstico, medicação, prescrição de ação introduzida
- Nenhuma mandala/alquimia prescrita como técnica
- Conteúdo histórico (Part I / Jung-1909) não promovido, exceto PH-004 que é explicitamente "compatible" com corpus maduro

---

*Mapa de patches do Grupo B — TASK 23 — 2026-06-20.*
*13 patches aplicados: PATCH-017 a PATCH-029. PP-010 não está no Grupo B per fonte de verdade — não aplicado.*
