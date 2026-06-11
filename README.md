# CORE-OS

**A local AI operating system for governed reasoning, agent workspaces, source-aware workflows and traceable decision-making.**

> Most people accumulate AI history. CORE-OS turns AI work into architecture.

---

## What is CORE-OS?

CORE-OS is a modular operating system for working with AI over time.

It is not a chatbot memory dump, not a prompt collection, and not an autonomous agent swarm.

It is a governed local architecture that separates:

* stable principles;
* reasoning operators;
* agent definitions;
* registries;
* source policies;
* workspaces;
* logs;
* audits;
* decision records;
* and operational boundaries.

The goal is simple:

> AI should not restart from zero every session, mix domains, invent authority, or lose the structure of previous work.

CORE-OS uses local versioned files as the sovereign source of truth, with Claude Code / Claude Cowork acting as the operational interface.

---

## Core principle

```text
Local versioned files are sovereign.
Chat is interface, not memory.
AI interprets. The operator governs.
```

CORE-OS is designed around a strong separation between:

| Layer              | Function                                 |
| ------------------ | ---------------------------------------- |
| Git                | Versioned memory and traceability        |
| Local files        | System body and source of truth          |
| Claude Code        | Structural workshop / system maintenance |
| Claude Cowork      | Operational cockpit / daily use          |
| Agents             | Governed domain operators                |
| Workspaces         | Live operational areas                   |
| Logs and snapshots | Evolution and audit trail                |

---

## The problem

Long-term AI work usually breaks in predictable ways:

* chat context degrades;
* knowledge is buried in old conversations;
* each new session starts from zero;
* principles are re-explained repeatedly;
* AI mixes domains without noticing;
* draft ideas become confused with authority;
* personal data, source material and execution steps get mixed;
* documentation grows without governance;
* the system becomes either too loose or too heavy.

CORE-OS addresses this by creating a structured layer between the human operator and the AI model.

---

## Architecture

```text
CORE-OS
│
├── CLAUDE.md                         Boot instructions for Claude Code
├── .claude/
│   ├── CORE_OS_MANIFEST.md           Sovereign system manifesto
│   ├── CORE_OS_CATALOG.md            System catalog
│   │
│   ├── agents/
│   │   ├── AGENT_MASTER_INDEX.md     Agent navigation index
│   │   ├── registry/                 Agent registry and status taxonomy
│   │   ├── logs/                     Evolution logs and snapshots
│   │   ├── _schemas/                 Agent schemas
│   │   ├── _common/                  Shared agent rules
│   │   └── domain/                   Domain agents
│   │
│   ├── skills/                       Claude Code skill layer
│   ├── cowork/                       Cowork runtime and operator console policy
│   ├── workspaces/                   Live agent workspaces
│   ├── norm_library/                 Structured source and normative library
│   ├── audits/                       System audits and stabilization reports
│   ├── prompts/                      Reusable operational prompts
│   └── hooks/                        Local support hooks
│
├── cesto/                            Intake and routing layer
├── src/                              Supporting source code
├── tests/                            Validation tests
├── docs/                             Reports and documentation
├── en/                               Public English architecture
└── pt/                               Public Portuguese architecture
```

---

## Main layers

### FW-CORE

The firmware layer.

FW-CORE defines constitutional rules, reasoning operators, domain boundaries, safety principles and escalation logic.

It governs how the system thinks.

---

### CORE-AGENTS

The agent layer.

CORE-AGENTS defines domain agents as governed components with explicit status, maturity, permissions and boundaries.

An agent file existing does **not** mean the agent is operational.

```text
agent exists ≠ agent active
review_validated ≠ unrestricted authority
workspace_write ≠ external action
agent response ≠ real-world authorization
```

---

### Agent Registry

The registry is the source of truth for agent state.

It tracks:

* agent name;
* domain;
* status;
* active flag;
* runtime mode;
* workspace path;
* operational authority;
* external action permission;
* connector access;
* database access;
* RAG/embedding permission;
* last event;
* limitations.

The registry prevents silent authority drift.

---

### Claude Cowork Runtime

CORE-OS is designed to operate through Claude Code / Claude Cowork before any custom interface is built.

Cowork functions as:

* operator console;
* cockpit;
* local file interface;
* supervised execution environment;
* bridge between operator and CORE-OS.

Cowork is **not** the source of truth.
The local files and registry are.

---

### Agent Workspaces

Activated agents operate inside their own workspaces.

Example:

```text
.claude/workspaces/
├── simb/
├── irata/
├── inspection/
├── legal/
└── asset/
```

Workspaces allow agents to:

* create records;
* ingest operator-provided documents;
* classify material;
* create logs;
* create checklists;
* organize timelines;
* maintain indexes;
* work inside their own domain branch.

Agents may write inside their workspace, but they may not rewrite their own system anatomy unless a structural patch is explicitly authorized.

---

### CESTO

CESTO is the intake and routing layer.

Its function is to receive messy inputs, classify them lightly, generate metadata, route material to the correct domain and avoid unnecessary processing.

It is designed to be:

* light;
* cheap;
* source-aware;
* routing-smart;
* compatible with heavier domain pipelines.

---

### Norm Library

The normative/source library stores structured references, metadata, lacunas, QA records and source registries.

It separates:

* public metadata;
* processed indexes;
* source registries;
* QA records;
* restricted raw files;
* licensed PDFs;
* extracted text;
* private working material.

Raw licensed or sensitive content is intentionally excluded from public versioning.

---

### Logs, audits and snapshots

CORE-OS uses logs and audits to preserve system evolution.

The system now includes:

* raw evolution logs;
* stabilization reports;
* system audits;
* compact snapshots;
* snapshot indexes;
* log compaction policy.

Snapshots summarize history without replacing the original source log.

---

## Domain agents

CORE-OS supports multiple specialized agents and cores.

| Core / Agent                       | Purpose                                                                                                       |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| SIMB-CORE / SIMB-AGENT             | Symbolic-operational analysis of dreams, diary, internal conflict, desire, shame, energy and lived experience |
| IRATA-CORE / IRATA-AGENT           | Rope access, field preparation, safety documentation, checklists and operational reasoning                    |
| INSPECTION-CORE / INSPECTION-AGENT | Inspection, NDT, equipment integrity, technical reports and normative organization                            |
| LEGAL-CORE / LEGAL-AGENT           | Legal document organization, timelines, evidence matrices and source-aware legal navigation                   |
| ASSET-CORE / ASSET-AGENT           | Patrimonial organization, decision logs, risk framing and investment thesis tracking                          |
| NORM-CORE / NORM-AGENT             | Normative/source processing, traceability, lacunas and controlled ingestion                                   |
| LEARN-CORE / LEARN-AGENT           | Learning logs, course projects, RAG experiments and study evolution                                           |
| LOTOFA-CORE                        | Statistical laboratory without predictive pretension                                                          |

---

## Runtime modes

Agents can operate under different levels of permission.

| Mode            | Meaning                          | Typical permission                       |
| --------------- | -------------------------------- | ---------------------------------------- |
| design_only     | Reading/design only              | No operational write                     |
| monitored_use   | Answer + use logging             | Limited records                          |
| workspace_write | Write inside own workspace       | Local domain files                       |
| governed_action | Approved local actions           | Controlled functions/scripts             |
| external_action | External API/database/connectors | Requires separate explicit authorization |

No agent receives external action by implication.

---

## Document ingestion

Activated agents may ingest documents provided or pointed to by the operator.

Ingestion does not mean trust.

A governed ingestion flow includes:

1. intake registration;
2. metadata/hash/local identifier;
3. source type classification;
4. sensitivity classification;
5. raw/private/licensed/official/auxiliary flag;
6. quarantine when uncertain;
7. promotion only by rule/operator;
8. update of `INTAKE_INDEX.md`;
9. update of `USE_LOG.md`.

```text
document ingestion ≠ trusted knowledge
intake ≠ validated corpus
quarantine ≠ memory
workspace write ≠ system write
```

---

## Security model

CORE-OS uses layered permission and source separation.

| Layer                               | Content                                                   | Public?                               |
| ----------------------------------- | --------------------------------------------------------- | ------------------------------------- |
| Public architecture                 | Principles, templates, operators, sanitized docs          | Yes                                   |
| Project-private architecture        | Registry, local policies, internal audits                 | Usually private                       |
| Sensitive data                      | Legal cases, financial values, personal history, raw logs | No                                    |
| Licensed/restricted source material | PDFs, extracted norms, private corpora                    | No                                    |
| Execution layer                     | SQL, connectors, RAG, embeddings, automations             | Disabled unless explicitly authorized |

The minimization rule:

> The AI receives the smallest context sufficient to execute the task with quality.

---

## Knowledge firewall

CORE-OS distinguishes between:

* official sources;
* metadata;
* unvalidated snapshots;
* validated local material;
* human-reviewed corpus;
* auxiliary commentary;
* quarantined material;
* rejected material.

Unverified material is not allowed to become operational truth by accident.

---

## Design / execution separation

One of the strongest rules of CORE-OS:

> Design is not execution.

Examples:

```text
migration draft ≠ migration executed
SQL file exists ≠ SQL executed
connector spec ≠ connector active
RAG plan ≠ embeddings created
agent active ≠ external authority
workspace write ≠ real-world authorization
legal organization ≠ legal advice
asset recordkeeping ≠ financial execution
IRATA support ≠ field release
SIMB writing ≠ therapy
```

---

## Key principles

1. **Clarity before elegance.**
2. **Traceability before automation.**
3. **Design before execution.**
4. **Source before synthesis.**
5. **Risk before opportunity.**
6. **Inaction is a valid decision.**
7. **Pattern is not law.**
8. **The operator owns the system.**
9. **Local versioned files are sovereign.**
10. **No authority by implication.**
11. **No hidden activation.**
12. **The AI interprets; it does not govern.**

---

## What CORE-OS is not

CORE-OS is not:

* a chatbot memory dump;
* a generic prompt collection;
* an autonomous agent swarm;
* a replacement for professional judgment;
* a legal advisor;
* a financial advisor;
* a medical or therapeutic system;
* a prediction engine;
* a public dump of personal AI history;
* a system where files imply permission.

It is a governed architecture for structured AI-assisted work.

---

## Public/private boundary

This repository may include:

* public architecture;
* sanitized operators;
* skill definitions;
* agent schemas;
* registry structures;
* system audits;
* templates;
* documentation;
* test structures;
* public-facing prompts.

This repository intentionally excludes:

* personal biographical data;
* specific financial positions;
* identifiable legal case details;
* intimate personal material;
* raw AI conversation exports;
* licensed PDFs;
* extracted full normative texts;
* secrets, tokens and local settings;
* private working corpora.

The public repository preserves structure and method.

Private local files preserve sensitive operational life.

---

## Current status

**Status:** Active development
**Current phase:** Stabilized architecture with governed Cowork runtime activation.
**Operating model:** Claude Code for structural patches; Claude Cowork as operator cockpit.
**Next phase:** Real monitored use through domain workspaces.

CORE-OS has moved from architecture-building toward controlled operational breathing.

---

## Repository

**Organization:** [metasystem-core](https://github.com/metasystem-core)
**Version:** 0.2
**Status:** Active development
**License:** Open for adaptation. Credit appreciated, not required.

CORE-OS is experimental infrastructure for governed AI-assisted reasoning. Use carefully, adapt locally, and preserve the distinction between architecture, interpretation and execution.
