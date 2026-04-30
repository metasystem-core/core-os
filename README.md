# CORE-OS

**A modular AI operating system for structured thinking and decision-making.**

> Most people accumulate AI history. CORE-OS builds architecture.

---

## The problem

When you use AI over time, a predictable failure pattern emerges:

- Chat context degrades over long sessions
- Knowledge is lost between conversations
- The AI starts from zero every new session
- You re-explain the same principles repeatedly
- Decisions are made without consistent frameworks

CORE-OS solves this by separating what should be stable (principles, operators, rules) from what changes (session content, new data, decisions).

---

## Quick Start

**3 steps to start using CORE-OS:**

1. Clone this repository
2. Copy `en/05_skills/` to your `~/.claude/skills/` folder (global Claude Code skills)
3. Open Claude Code in any project folder and reference a skill naturally in conversation

For Claude.ai Projects: paste the content of `en/06_prompts/CLAUDE_PROJECT_PROMPT.md` as your project instructions, then attach the relevant core files.

---

## Architecture

```
CORE-OS
│
├── en/                         English version
│   ├── 01_constitution/        Governing principles for all cores
│   ├── 02_operators/           Reusable reasoning tools
│   ├── 03_cores/               Specialized domain nuclei
│   ├── 04_templates/           Versioning and logging protocols
│   ├── 05_skills/              Claude Code skill definitions
│   └── 06_prompts/             Ready-to-use AI prompts
│
└── pt/                         Portuguese version
    └── (same structure)
```

### Constitution
The metacognitive nucleus. Governs how to think, decide, and translate between domains. Not a domain itself — it governs all domains.

### Operators
Reusable reasoning tools applicable across multiple contexts:

| Operator | Function |
|---|---|
| FW-Kant | Normative filter: dignity, autonomy, elevation |
| E-Histórico | Start from errors, not from the positive thesis |
| Regime First | Context before analysis — always |
| RAR | Robustness / Asymmetry / Reversibility triaging |
| CCR | Cognitive Risk Circulation between three poles |
| EBI | Low-Impact Exploratory — controlled experiments |
| Pre-Linguistic | Protocol for high-stress / overload states |

### Domain Cores

| Core | Purpose |
|---|---|
| SIMB-CORE | Symbolic-operational analysis of lived experience |
| ASSET-CORE | Patrimonial decision under uncertainty |
| BTC-CORE | Bitcoin sub-module within ASSET-CORE |
| IRATA-CORE | Industrial inspection / rope access / NDT |
| JURIDICO-CORE | Brazilian legal reading and navigation |
| LOTOFA-CORE | Statistical laboratory (controlled, no predictive pretension) |

---

## Key Principles

1. **Clarity before elegance.** Data before narrative.
2. **Survival before return.** Risk before opportunity.
3. **Inaction is a valid decision.** When asymmetry is unfavorable.
4. **Pattern is not law.** Recurrence does not prove causality.
5. **The operator owns the system.** AI is an interpreter, not a proprietor.
6. **Local versioned files are the sovereign source.** Not chat history.

---

## Templates

Three templates enable the system to evolve without losing coherence:

- **CORE_UPDATE** — propagate a learning across cores and platforms
- **FW_INSERT** — translate a concept between domains without semantic distortion
- **DECISION_LOG** — traceable decision records without ex-post rationalization

---

## SIMB-CORE Skills (Advanced)

The SIMB-CORE includes a full Claude Code skill pack with two reading regimes:

- **USER-ALIGNED** — for personal material (dreams, conflicts, impulses, diary)
- **SOURCE-FIRST** — for external texts (books, PDFs, philosophical traditions)

See `en/05_skills/simb-core/` for the complete skill architecture.

---

## Security Model

Three data layers:

| Layer | Content | Shareable |
|---|---|---|
| Public operational | Architecture, operators, templates | ✓ Yes |
| Private sensitive | Legal details, financial values, personal data | ✗ No |
| Restricted raw | AI export dumps, full conversation history | ✗ No |

**Minimization rule:** The AI receives the smallest context sufficient to execute the task with quality.

---

## What is NOT in this repository

For privacy reasons, the following are excluded:
- Personal biographical data
- Specific financial values or positions
- Identifiable legal case details
- Intimate personal content
- Raw AI conversation exports

The public cores preserve structure and method. Personal content stays local.

---

## Repository

**Organization:** [metasystem-core](https://github.com/metasystem-core)
**Version:** 0.1
**Status:** Active development
**License:** Open for adaptation. Credit appreciated, not required.
