---
tipo: integration_review_final
source_id: SRC-SIMB-012
task: TASK 35 — WHITMONT_PERERA_DREAMS_FINAL_SOURCE_INTEGRATION_REVIEW_AND_COMMIT_001
data: 2026-06-20
status: complete
scope: todos os PP-WP-001 a PP-WP-069 e RISK-WP-001 a RISK-WP-061 — nenhuma leitura nova nesta task
nota: revisão de integração apenas — nenhum patch aplicado, nenhum card promovido
---

# WHITMONT_PERERA_DREAMS_FINAL_SOURCE_INTEGRATION_REVIEW_001

## 1. Identificação da Fonte

| campo | valor |
|---|---|
| source_id | SRC-SIMB-012 |
| title | Dreams, A Portal to the Source |
| authors | Edward C. Whitmont & Sylvia Brinton Perera |
| year | 1989 |
| source_class | practical_jungian_handbook |
| status anterior | read_complete_pending_integration_review |
| status após esta task | integration_reviewed_pending_promotion_patch |

---

## 2. Trajetória de Leitura

| task | block | chapters | commits |
|---|---|---|---|
| Task 27 | Intake + Structure Read | TOC, front matter, Ch. 1 overview | ceec86f |
| Task 28 | Block 1 — Foundation/Method | Ch. 1–3, ~p.1–25 | a21bd55 |
| Task 29 | Block 2 — Dream Language/Field | Ch. 4–5, ~p.26–55 | 447a1b5 |
| Task 30 | Block 3 — Compensation/Drama | Ch. 6–7, ~p.56–78 | ed1ec9c |
| Task 31 | Block 4 — Mythological Motifs/Technical | Ch. 8–9, ~p.79–126 | ff7fb81 |
| Task 32 | Block 5 — HIGH-RISK Prognosis/Body | Ch. 10–11, ~p.127–148 | 8ab5fbe |
| Task 33 | Block 6 — HIGH-RISK Therapist/Transference | Ch. 12, ~p.149–179 | e816a53 |
| Task 34 | Block 7 — Conclusion/Source Completion | Ch. 13, ~p.180–182 | de6fa3f |

**Totais acumulados (Blocks 1–7):**
- Protocol candidates (PP-WP): 69 (PP-WP-001 a PP-WP-069) — todos DRAFT
- Risk candidates (RISK-WP): 61 (RISK-WP-001 a RISK-WP-061) — todos DRAFT

---

## 3. Installed Layer — Referência

O layer instalado no momento desta revisão:

| componente | versão / status |
|---|---|
| DREAM_ANALYSIS_PROTOCOL | v0.1 (patched to v0.2 via PATCH-001 a PATCH-029) |
| Patches instalados | PATCH-001–029 (Hall + Jung Dreams layers) |
| Fases do protocolo | 20 fases |
| Firewalls ativos | F-01 a F-18 |
| Risk cards oficiais | RISK-001, RISK-002, RISK-JUNG-001–028, RISK-FINAL-001, RISK-FINAL-002, RISK-H-001–004 (24 individuais + 2 consolidados) |
| Risk cards em hold | RISK-JUNG-014, -020, -021, -028, RISK-H-005 (5) |
| Evals existentes | EVAL-01 a EVAL-20 (20 evals na SKILL.md) |
| Sources em vigência | Hall (SRC-010): v0.1 base; Jung Dreams (SRC-011): PATCH-005–029 |

---

## 4. Mapa de PP-WP: Disposição por Candidato

Legenda:
- **CONFIRMS** = covered by existing rule; WP adds textual authority or minor calibration only
- **REFINES** = refines/extends existing rule with procedural specificity or new condition
- **NET NEW** = genuinely new behavior not in current protocol or firewalls
- **MERGE** = should be merged with related existing patch at promotion time
- **HOLD** = defer — wait for usage data or concurrent promotion of dependency

| id | nome_breve | disposição | interação com layer instalado | prioridade |
|---|---|---|---|---|
| PP-WP-001 | Embodied assent vs passive agreement | REFINES | Refines PATCH-013 (assentimento) — adds "gut-level" vs polite agreement distinction | HIGH |
| PP-WP-002 | No pushing; resistance as signal | NET NEW | Extends F-03 (witness not authority); no current resistance-handling rule | HIGH |
| PP-WP-003 | Dream outcome conditional | CONFIRMS+REFINES | Confirms F-06/CON-041; adds "even seemingly fated" coverage + explicit vocabulary | HIGH |
| PP-WP-004 | Dream rarely commands action | CONFIRMS | Confirms F-04 (dream command firewall) with stronger textual authority | MEDIUM |
| PP-WP-005 | Grounding is operator's autonomous work | REFINES | Refines PATCH-025 (conflict not resolved by interpretation); adds post-interpretation phase | HIGH |
| PP-WP-006 | Unconscious not infallible | CONFIRMS | Confirms F-18 (centre_unknowable); adds "conscious freedom preserved" phrasing | MEDIUM |
| PP-WP-007 | Fixed equivalencies are projection | CONFIRMS | Confirms PATCH-023 (symbol as unknown field); adds: "knowing immediately = projection" | MEDIUM |
| PP-WP-008 | Following dreams verify interpretation | REFINES | Refines PATCH-027 (series); adds: repetition with intensity = prior reading missed something | MEDIUM |
| PP-WP-009 | Dream as question-generator | NET NEW | No current rule on question-generating framing; fills gap | LOW |
| PP-WP-010 | Dream-ego distinction (qualities not identity) | REFINES | Refines CON-036 (dream-ego ≠ ego-desperto) with procedural detail | MEDIUM |
| PP-WP-011 | Association-first as absolute rule | CONFIRMS+REFINES | Confirms PROT-005/PATCH-023; upgrades to "absolute rule — no exceptions" | HIGH |
| PP-WP-012 | Affect charge = relevance marker | NET NEW | No current rule on affect as relevance marker; fills significant gap | HIGH |
| PP-WP-013 | Allegory vs symbol: hold the distinction | NET NEW | Extends F-18 with reading-mode distinction (allegorical vs symbolic approach) | HIGH |
| PP-WP-014 | Numinous image: receive before interpreting | NET NEW | No current rule; extends symbolic circumambulation with initial "receive" mode | MEDIUM |
| PP-WP-015 | Multiple readings held simultaneously | NET NEW | No current plurality-of-readings rule | HIGH |
| PP-WP-016 | Explanation layering: collective + individual | NET NEW | Extends PATCH-023 with positive two-layer explanation procedure | HIGH |
| PP-WP-017 | Curiosity/ignorance stance as default | REFINES | Makes explicit what is implicit in PROT-005/PATCH-023; adds questioning posture as procedural requirement | HIGH |
| PP-WP-018 | Body reactions during telling: need associations | NET NEW | No current rule on in-session body responses to dream telling | MEDIUM |
| PP-WP-019 | Match sensory mode to dreamer's description | NET NEW | No current rule; minor calibration but adds operational specificity | MEDIUM |
| PP-WP-020 | Explanation shift when association blocks | NET NEW | No current rule on what to do when association phase draws blank | MEDIUM |
| PP-WP-021 | Trivial dream: explore before dismissing | NET NEW | No current rule | MEDIUM |
| PP-WP-022 | Amplification gate: tentative, conditional, withdrawn | NET NEW | No current amplification gate; major gap (distinct from PATCH-021 which covers order only) | HIGH |
| PP-WP-023 | Compensation test: most-at-variance reading first | NET NEW | No current disambiguation heuristic for competing readings | HIGH |
| PP-WP-024 | Object/subject level triage by complementary function | NET NEW | No current object/subject triage rule; major procedural gap | HIGH |
| PP-WP-025 | Day residue: subject level default; exception rule | NET NEW | No current day-residue handling rule | MEDIUM |
| PP-WP-026 | Dream inadequate until blind spot revealed | NET NEW | Adds explicit quality criterion for interpretive work | MEDIUM |
| PP-WP-027 | Overdramatization caution: exaggeration ≠ literal severity | NET NEW | No current rule; directly addresses alarm-response failure mode | HIGH |
| PP-WP-028 | Overview first: whole dream before individual images | NET NEW | No current overview-first structural rule | HIGH |
| PP-WP-029 | Opening scene as "Re:": work fully before moving on | NET NEW | No current opening-scene rule; addresses major structural gap | HIGH |
| PP-WP-030 | Dramatic structure mapping: 4 elements | NET NEW | No current dramatic structure reading tool | MEDIUM |
| PP-WP-031 | Lysis/catastrophe as possibility not fate | CONFIRMS+REFINES | Confirms PP-WP-003/CON-041; adds dramatic vocabulary + "waking action still required" | HIGH |
| PP-WP-032 | Skeleton summary for chaotic/long dreams | NET NEW | No current rule for long/fragmented material organization | MEDIUM |
| PP-WP-033 | Recognize mythological quality before naming archetype | NET NEW | Extends F-07/PATCH-021 with observable entry criterion | HIGH |
| PP-WP-034 | Chaos/myth distinction: different attention, no diagnosis | NET NEW | NEEDS_FIREWALL: incoherence as attention guide, not diagnostic tool | HIGH |
| PP-WP-035 | Three-step procedure for mythological material | NET NEW | No current explicit 3-step mythological procedure | HIGH |
| PP-WP-036 | Amplification only after complete personal work | REFINES | Refines PATCH-021 (order: personal first) with "foisting" language and gate | HIGH |
| PP-WP-037 | Amplification valid only with dreamer's confirmation | REFINES | Refines PATCH-021; adds: Iris's amplification may reflect Iris's training, not dreamer's reality | HIGH |
| PP-WP-038 | Personal anchoring mandatory after archetypal reading | NET NEW | No current post-archetypal closure rule; closes inflation gap | HIGH |
| PP-WP-039 | Life Play motif: theatrical dream as possible major theme | NET NEW | NEEDS_FIREWALL: open, not declarative; no current rule for this motif | MEDIUM |
| PP-WP-040 | Child motif: age as temporal pointer; both poles open | NET NEW | No current child-motif procedure | MEDIUM |
| PP-WP-041 | Animal motif: specific instinctive quality, three layers | NET NEW | Confirms PATCH-021 (personal first); adds animal-specific procedure | MEDIUM |
| PP-WP-042 | Past-life material: respect affect; allegorical only | NET NEW | NEEDS_FIREWALL: no confirmation/disconfirmation of literal claims | MEDIUM |
| PP-WP-043 | Temporal sequence as possible causal chain (hypothesis) | NET NEW | Technical reading tool; no current rule | MEDIUM |
| PP-WP-044 | Re-evaluative function: direct correction of perspective | REFINES | Refines CON-037 (compensation modes); adds "direct correction" as distinct mode | MEDIUM |
| PP-WP-045 | Day residue: deviation from remembered version = the message | REFINES | Refines PP-WP-025; adds deviation-locator as critical technique | HIGH |
| PP-WP-046 | Dream series: spiral circumambulation; common denominators | CONFIRMS+REFINES | Confirms PATCH-027; adds spiral (non-linear) + behavioral coincidences as part of set | HIGH |
| PP-WP-047 | Recurring dream: urgency without alarm | NET NEW | No current recurring-dream handling rule | MEDIUM |
| PP-WP-048 | Nightmare: recognize urgency; same tools; no panic escalation | NET NEW | No current nightmare-specific procedure; closes urgency-handling gap | HIGH |
| PP-WP-049 | Death/illness: transformation frame + medical firewall | NET NEW | No current death/illness image procedure with explicit medical firewall | HIGH |
| PP-WP-050 | No prognosis from dreams | CONFIRMS+REFINES | Confirms F-06; adds: explicit verbal protocol for prognosis requests | HIGH |
| PP-WP-051 | Body images: literal check → real care referral → symbolic | NET NEW | Fills sequence gap for body imagery — literal level verification first | HIGH |
| PP-WP-052 | Sexual image: subject level first; no literalization; no identity claim | REFINES | Refines PATCH-003/RISK-FINAL-001; adds: no identity/orientation declaration | HIGH |
| PP-WP-053 | Rape/trauma content: mandatory trauma gateway | NET NEW | No current trauma gateway; critical safety gap | HIGH |
| PP-WP-054 | Specific disease equations: PROHIBITED | NET NEW | Absolute firewall — disease-as-complex equations are not importable | HIGH |
| PP-WP-055 | Orifice/excretory images: accessible metaphor, neutral language | NET NEW | No current rule for this image category | MEDIUM |
| PP-WP-056 | Tooth motif: adaptation transition, not prognosis | HOLD | Specific enough to hold until operator signals demand; principle covered by PP-WP-050 | LOW |
| PP-WP-057 | False reassurance: prohibited from dream images | NET NEW | No current false-reassurance-specific firewall | HIGH |
| PP-WP-058 | Multi-level reading for helper/authority figure | NET NEW | No current rule for helper-figure multiple readings | HIGH |
| PP-WP-059 | Real person vs dream image distinction (explicit verbal protocol) | REFINES | Refines RISK-JUNG-007 with explicit verbal framing protocol | HIGH |
| PP-WP-060 | Inner therapist: return function to dreamer | NET NEW | No current inner-therapist firewall rule | HIGH |
| PP-WP-061 | Authority deflection: oracle/guru framing rejected | NET NEW | Extends F-03; no current active-deflection protocol | HIGH |
| PP-WP-062 | No transference labeling or projection identification | NET NEW | No current transference-specific firewall | HIGH |
| PP-WP-063 | Therapy process dream: symbolic only; no real-relationship advice | NET NEW | No current therapy-dream protocol | HIGH |
| PP-WP-064 | Induction resistance: systemic; return authority to dreamer | NET NEW | No current induction-resistance rule | HIGH |
| PP-WP-065 | Subject-level hypothesis for helper/authority figure | REFINES | Refines PATCH-002 (subject level default); applies to helper figure specifically | MEDIUM |
| PP-WP-066 | No good/bad dream labeling | CONFIRMS | Confirms Block 4 (nightmare urgency, no moral labeling); may MERGE with PP-WP-048 | MEDIUM |
| PP-WP-067 | Association-first validated as sufficient method | CONFIRMS | Confirms PROT-005; useful as self-framing rule; LOW as standalone patch | LOW |
| PP-WP-068 | Numinosity attribution: return to dreamer's encounter | NET NEW | Extends PP-WP-060/PP-WP-061 with Conclusion-level synthesis; active numinosity deflection | HIGH |
| PP-WP-069 | No outcome promise from dream engagement | REFINES | Extends F-06/PP-WP-050 to cover dream-work outcome promises specifically | MEDIUM |

**PP-WP Disposition Summary:**

| disposition | count | examples |
|---|---|---|
| NET NEW | 36 | PP-WP-002, 005, 009, 012, 013, 014, 015, 016, 018, 019, 020, 021, 022, 023, 024, 025, 026, 027, 028, 029, 032, 033, 034, 035, 038, 039, 040, 041, 042, 043, 047, 048, 049, 051, 053, 054, 055, 057, 058, 060, 061, 062, 063, 064, 068 |
| REFINES | 16 | PP-WP-001, 003, 005, 008, 010, 011, 017, 022, 036, 037, 044, 045, 046, 052, 059, 065, 069 |
| CONFIRMS | 9 | PP-WP-004, 006, 007, 011, 046, 066, 067 |
| CONFIRMS+REFINES | 4 | PP-WP-003, 011, 031, 046, 050 |
| HOLD | 1 | PP-WP-056 |
| MERGE candidate | Several | PP-WP-003 → CON-041; PP-WP-031 → PP-WP-003 |

**Priority count:**
- HIGH: 39 candidates
- MEDIUM: 22 candidates
- LOW: 2 candidates
- HOLD: 1 candidate (LOW: 2, HOLD: 1)

---

## 5. Mapa de RISK-WP: Disposição por Candidato

Legenda:
- **PROMOTE-NEW** = no existing card covers this; needs dedicated risk card
- **PROMOTE-EXTEND** = existing card covers adjacent territory; WP card adds new specific trigger/scenario
- **COVERED** = fully covered by existing installed card; WP candidate confirms, may not need separate card
- **MERGE** = should be consolidated with an existing card rather than promoted as standalone
- **HOLD** = defer — await fuller corpus or concurrent promotion of dependency

| id | nome_breve | disposição | existing coverage | prioridade |
|---|---|---|---|---|
| RISK-WP-001 | Dream outcome as fixed prophecy | COVERED+MERGE | RISK-JUNG-002 (prospective as prophecy) fully covers; WP adds "conditional" vocabulary → annotate RISK-JUNG-002 | MEDIUM |
| RISK-WP-002 | Prescribing action from dream insight | PROMOTE-NEW | F-04 partially covers; no specific card for post-interpretation action prescription | HIGH |
| RISK-WP-003 | Pushing despite resistance | PROMOTE-NEW | No existing card; net new risk behavior | HIGH |
| RISK-WP-004 | Premature interpretation without sufficient association | COVERED+MERGE | RISK-JUNG-001 + RISK-JUNG-013 cover; WP adds timing/sequence dimension → annotate RISK-JUNG-013 | LOW |
| RISK-WP-005 | Active imagination / enactment recommended by Iris | PROMOTE-NEW | F-04 partial; no specific card for active-imagination facilitation prohibition | HIGH |
| RISK-WP-006 | Guiding Self framed as infallible authority | COVERED | RISK-JUNG-009 (unconscious authority overvaluation) fully covers | LOW |
| RISK-WP-007 | Passive acceptance mistaken for embodied assent | COVERED+MERGE | RISK-JUNG-011 (interpreter authority suggestion) covers adjacent; WP adds false-positive assent specifically → annotate RISK-JUNG-011 | LOW |
| RISK-WP-008 | Import of clinical diagnosis/prognosis framing | COVERED | RISK-FINAL-002 (clinical diagnostic overreach) fully covers | LOW |
| RISK-WP-009 | Symbol forced into allegory | PROMOTE-EXTEND | F-18 partial; RISK-JUNG-009 adjacent; WP adds specific allegory/symbol collapse scenario | HIGH |
| RISK-WP-010 | Amplification intrusion before personal context | PROMOTE-EXTEND | RISK-JUNG-010 + RISK-JUNG-023 adjacent; WP adds: before-any-personal-work is distinct failure mode | HIGH |
| RISK-WP-011 | Association phase skipped | COVERED | RISK-JUNG-001 + RISK-JUNG-013 cover; image-level extension is in RISK-JUNG-013 | LOW |
| RISK-WP-012 | Affect bypass (intellectual association accepted) | PROMOTE-NEW | No existing card; flat affect tracking is net new | HIGH |
| RISK-WP-013 | Active imagination / Gestalt / psychodrama prescribed | PROMOTE-EXTEND | Extends RISK-WP-005 with method-specific names; may consolidate with RISK-WP-005 | HIGH |
| RISK-WP-014 | Trivial dream agreed-with and dismissed | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-015 | Fixed symbol dictionary applied | COVERED | RISK-JUNG-001 fully covers; WP adds "NEVER fixed" textual grounding | LOW |
| RISK-WP-016 | Iris reactions treated as field authority | PROMOTE-EXTEND | RISK-JUNG-011 partial; WP adds specific countertransference-analog scenario | MEDIUM |
| RISK-WP-017 | Amplification persisted after no resonance | PROMOTE-NEW | No existing card; withdrawal-after-no-resonance gap | MEDIUM |
| RISK-WP-018 | Lysis/catastrophe treated as fixed fate | PROMOTE-EXTEND | RISK-JUNG-002 adjacent; WP adds dramatic structure vocabulary and "hindsight only" distinction | HIGH |
| RISK-WP-019 | "Dream solved it" — waking work bypassed | PROMOTE-NEW | No existing card; post-insight waking bypass is net new | HIGH |
| RISK-WP-020 | Object-level paranoia: projection not explored | PROMOTE-NEW | No existing card; subject-level bypass in threat scenario | MEDIUM |
| RISK-WP-021 | Subject-level bypass when real object context matters | PROMOTE-NEW | No existing card; complement to RISK-WP-020 | MEDIUM |
| RISK-WP-022 | Overdramatization panic: extreme imagery alarm | PROMOTE-NEW | No existing card; alarm-response to extreme imagery is net new | HIGH |
| RISK-WP-023 | Compensation forced as template for all dreams | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-024 | Fragile ego clinical methods imported | PROMOTE-EXTEND | RISK-FINAL-002 partial; WP adds specific scenario: modulating depth based on non-clinical assessment | HIGH |
| RISK-WP-025 | Day residue dismissed or taken at face value | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-026 | Archetype named without association work | COVERED | RISK-JUNG-019 (archetype premature labeling) fully covers | LOW |
| RISK-WP-027 | Psychopathology diagnosis from incoherent image | PROMOTE-EXTEND | RISK-FINAL-002 adjacent; WP adds specific trigger: incoherent/fragmented imagery as diagnostic data | HIGH |
| RISK-WP-028 | Amplification imposed without dreamer's confirmation | COVERED | RISK-JUNG-018 + RISK-JUNG-023 cover; "foisting" language added → annotate existing cards | LOW |
| RISK-WP-029 | Archetypal reading closed without personal anchoring | PROMOTE-EXTEND | RISK-JUNG-023 adjacent; WP adds specific closure failure (ending at archetypal level) | HIGH |
| RISK-WP-030 | Symbolic destiny / life-myth declared from motif | PROMOTE-NEW | No existing card; Life Play → destiny declaration is net new inflation risk | HIGH |
| RISK-WP-031 | Embodied work with child / birth motif | PROMOTE-NEW | No existing card; somatic facilitation prohibition is net new | HIGH |
| RISK-WP-032 | Fixed animal symbol label without association | COVERED | RISK-JUNG-001 + RISK-JUNG-013 cover | LOW |
| RISK-WP-033 | Validate or invalidate past-life claim as literal fact | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-034 | Day residue without deviation check | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-035 | Dream series treated as definitive narrative | PROMOTE-NEW | No existing card; overcertainty in series reading is net new | MEDIUM |
| RISK-WP-036 | Nightmare panic escalation from image severity | PROMOTE-NEW | No existing card | HIGH |
| RISK-WP-037 | Prospective function used as future prediction from series | PROMOTE-EXTEND | RISK-JUNG-002 adjacent; WP adds series-pattern as prediction trigger | MEDIUM |
| RISK-WP-038 | Prognosis: "this dream predicts [result]" | PROMOTE-EXTEND | RISK-JUNG-002 adjacent; WP adds: health/medical context prognosis specifically | HIGH |
| RISK-WP-039 | Death prediction from dream image | PROMOTE-EXTEND | RISK-JUNG-002 adjacent; WP adds: death/transformation indistinguishable → Iris cannot distinguish | HIGH |
| RISK-WP-040 | Disease diagnosis from dream image | PROMOTE-NEW | RISK-FINAL-002 adjacent (clinical overreach) but medical-specific diagnosis is net new | HIGH |
| RISK-WP-041 | False reassurance from positive dream in health context | PROMOTE-NEW | No existing card; false-reassurance delaying medical care is net new | HIGH |
| RISK-WP-042 | Operator avoids medical care due to dream interpretation | PROMOTE-NEW | No existing card; most serious medical-consequence risk | HIGH |
| RISK-WP-043 | Sexual literalization: identity/orientation from dream | PROMOTE-EXTEND | RISK-FINAL-001 covers automatic sexual framing; WP adds identity/orientation claim specifically | HIGH |
| RISK-WP-044 | Rape/trauma content: symbolic interpretation without gateway | PROMOTE-NEW | No existing card; trauma gateway is critical safety gap | HIGH |
| RISK-WP-045 | Shame amplification in body imagery | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-046 | Psychological level assessment from dream | PROMOTE-EXTEND | RISK-FINAL-002 adjacent; WP adds: level-assessment from single/initial dream as specific trigger | HIGH |
| RISK-WP-047 | Spiritual health affirmation from dream image | PROMOTE-EXTEND | RISK-WP-041 adjacent; adds: spiritual/archetypal positive image as false-reassurance variant | MEDIUM |
| RISK-WP-048 | Body orifice images with medical framing | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-049 | Body symbolic as substitute for real medical care | PROMOTE-NEW | No existing card; variant of RISK-WP-042 for body imagery specifically | HIGH |
| RISK-WP-050 | Inner Therapist role import | PROMOTE-NEW | No existing card; INNER_THERAPIST_FIREWALL is net new | HIGH |
| RISK-WP-051 | Therapist figure: real person vs dream image confusion | PROMOTE-EXTEND | RISK-JUNG-007 (projection onto real person) covers; WP adds therapist/helper figure specifically | HIGH |
| RISK-WP-052 | Countertransference-analog authority claim | PROMOTE-NEW | No existing card; CT-analog authority is net new for Iris | HIGH |
| RISK-WP-053 | Idealization/authority inflation: oracle/guru framing | PROMOTE-EXTEND | RISK-JUNG-011 (interpreter authority suggestion) adjacent; WP adds active archetypal inflation scenario | HIGH |
| RISK-WP-054 | Therapy process dream: advising on real therapeutic relationship | PROMOTE-NEW | No existing card; therapy-dream protocol is net new | HIGH |
| RISK-WP-055 | Dependency reinforcement and attachment formation | PROMOTE-NEW | No existing card | HIGH |
| RISK-WP-056 | Erotic transference import: Iris as romantic/erotic object | PROMOTE-NEW | No existing card; high severity scenario | HIGH |
| RISK-WP-057 | Real person identified/characterized from dream content | COVERED | RISK-JUNG-007 (projection onto real person) fully covers | LOW |
| RISK-WP-058 | Privacy: therapy disclosure used interpretively | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-059 | [Distinct from RISK-WP-058: charged/erotic field disclosure] | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-060 | [Distinct privacy/clinical disclosure variant] | PROMOTE-NEW | No existing card | MEDIUM |
| RISK-WP-061 | Outcome promise from dream engagement | PROMOTE-NEW | No existing card; distinct from prognosis (B5) and false-reassurance | MEDIUM |

**RISK-WP Disposition Summary:**

| disposition | count |
|---|---|
| PROMOTE-NEW | 31 |
| PROMOTE-EXTEND | 17 |
| COVERED | 11 |
| MERGE (to existing) | 2 |

**Priority count among PROMOTE-NEW + PROMOTE-EXTEND:**
- HIGH: 31 candidates
- MEDIUM: 17 candidates
- LOW: 0 (COVERED/MERGE get LOW)

---

## 6. Key Integration Conclusions

### 6.1 Highest Value Additions

The WP layer adds the most value in areas **not present in the Hall/Jung layer**:

| area | missing from Jung layer | PP-WP fills | RISK-WP fills |
|---|---|---|---|
| Procedural completeness | Overview-first, opening scene, skeleton summary | PP-WP-028, 029, 032 | — |
| Amplification discipline | Amplification gate; foisting prohibition; withdrawal rule | PP-WP-022, 036, 037 | RISK-WP-010, 017, 029 |
| Affect as relevance marker | No current affect-tracking rule | PP-WP-012 | RISK-WP-012 |
| Object/subject level triage | No current triage procedure | PP-WP-024, 025, 045 | RISK-WP-020, 021, 025 |
| Dramatic structure | No current structure-as-reading-tool | PP-WP-028–032 | RISK-WP-018, 019 |
| Overdramatization caution | No current extreme-imagery alarm rule | PP-WP-027 | RISK-WP-022, 036 |
| Medical/prognosis firewall | No current body-image or prognosis-specific rule | PP-WP-049–054, 057 | RISK-WP-038–049 |
| Therapist/transference layer | Entirely absent from Hall+Jung layer | PP-WP-058–065, 068 | RISK-WP-050–060 |
| Trauma gateway | No current trauma-content gateway | PP-WP-053 | RISK-WP-044 |
| Induction/folie à deux | No current systemic induction rule | PP-WP-064 | RISK-WP-055 |

### 6.2 Highest Risk Additions

The following WP risk candidates represent the most dangerous gaps in current protection:

| risk | severity | reason |
|---|---|---|
| RISK-WP-042 (medical care avoided) | CRITICAL | Direct physical harm potential |
| RISK-WP-049 (body symbolic as medical substitute) | CRITICAL | Direct physical harm potential |
| RISK-WP-044 (rape/trauma without gateway) | CRITICAL | Re-traumatization risk |
| RISK-WP-041 (false reassurance from positive dream) | HIGH | Delays real medical care |
| RISK-WP-050 (Inner Therapist role import) | HIGH | Core new firewall — most specific to WP layer |
| RISK-WP-055 (dependency reinforcement) | HIGH | Sustained relationship risk |
| RISK-WP-003 (pushing despite resistance) | HIGH | Interpretive dominance |
| RISK-WP-022 (overdramatization panic escalation) | HIGH | Alarm amplification |

### 6.3 What the WP Layer Does NOT Add

Material that must remain PROHIBITED for Iris even after full WP integration:

| material | WP source | disposition for Iris |
|---|---|---|
| Therapist as surrogate consciousness | B7-010 | CLINICAL_ONLY — not importable |
| Fragile-ego dream handling (clinical) | B3-014 | CLINICAL_ONLY |
| Active imagination facilitation | B1-011, B2-023 | PROHIBITED — no facilitation |
| Transference management (real relationship) | B6-010 | CLINICAL_ONLY |
| Prognosis from dream (any form) | B5-001 | PROHIBITED |
| Disease-specific complex equations | B5-007 | PROHIBITED |
| Countertransference field reading | B6-005 | PROHIBITED |
| Inner Therapist role | B6-004 | PROHIBITED — active deflection |
| Therapist's surrogate consciousness | B7-004 | CLINICAL_ONLY |
| Guiding Self as fact (theological claim) | B1-009, B7-001 | NEEDS_FIREWALL — framework only |
| Outcome promise from dream work | B7-008 | PROHIBITED |
| Somatic re-enactment (birth, child motif) | B4-021, B4-010 | PROHIBITED |
| Past-life regression facilitation | B4-013 | PROHIBITED |

### 6.4 Interação com SRC-SIMB-011 (Jung Dreams Layer)

The WP layer does not conflict with the Jung layer. Key relationships:

- **Confirms:** Association-first, personal before archetypal, subject-level default, no prognosis, no fixed dictionaries, no authority inflation
- **Refines:** Amplification gate (more specific than PATCH-021), assent criterion (adds embodied vs passive distinction), series handling (adds spiral + behavioral coincidences)
- **Extends:** Object/subject triage (no equivalent in Jung), overdramatization caution (no equivalent in Jung), trauma gateway (no equivalent in Jung), therapist/transference layer (no equivalent in Jung)
- **No conflict detected** — all 69 PP-WP and 61 RISK-WP are compatible with current installed layer

---

## 7. Evaluation of CON Cards

**Assessment: No new CON cards warranted from WP layer at this stage.**

Rationale:
- Hall layer created CON-036 to CON-039
- Jung layer created CON-040 to CON-045
- WP concepts (Guiding Self, Inner Therapist, compensatory types, dramatic structure) are adequately handled by existing CON-037 (compensation), CON-041 (prospective ≠ prophecy), CON-044 (series), and protocol-level patches
- The Inner Therapist concept is firewall-level, not a concept card — it goes into risk cards and protocol firewalls
- Consider: if Iris's operational use of dramatic structure (PP-WP-028–032) proves useful, a CON card for dramatic structure could be created in a future iteration. Not yet.

---

## 8. SKILL.md Alignment Needs

From the WP layer, SKILL.md will need:

1. **Section 16 (guardrails) expansion** — add WP-specific guardrails: therapist role firewall, inner therapist firewall, transference firewall, medical firewall, trauma gateway, induction resistance
2. **Eval additions** — EVAL-21 onwards (see separate eval candidates file)
3. **Source notation** — add SRC-SIMB-012 to source references with integration status

No SKILL.md changes in this task.

---

## 9. Source Status Update

SRC-SIMB-012 status after this task: `integration_reviewed_pending_promotion_patch`

Recommended next task: **WHITMONT_PERERA_DREAMS_PROTOCOL_PATCH_PLAN_REVIEW_001**

---

*Integração final — SRC-SIMB-012 — TASK 35 — 2026-06-20.*
*69 PP-WP candidates mapped. 61 RISK-WP candidates mapped. No patches applied. No promotions executed.*
*Status: integration_reviewed_pending_promotion_patch.*
