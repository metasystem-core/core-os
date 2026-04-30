# SECURITY MODEL — CORE-OS

## Principle

The operator owns the system. AI is an interpreter. Platform is a temporary environment.

**Minimization rule:** The AI receives the smallest context sufficient to execute the task with quality.

## Three-Layer Classification

| Layer | Content | Shareable |
|---|---|---|
| **Public operational** | Architecture, operators, templates, glossary, generic processes | ✓ Yes |
| **Private sensitive** | Legal details, financial values, personal data, names in conflict | ✗ No |
| **Restricted raw** | AI export dumps, full conversation history, unfiltered data | ✗ No |

## Practical Rules

1. Never upload raw exports without triage.
2. Create synthesis documents per core — not raw history.
3. Remove names when not strictly necessary.
4. Separate document from interpretation.
5. Keep versioned local copies.
6. Before sending anything to an AI, ask:
   - Does this actually need to go?
   - Can it be sanitized?
   - What is the minimum sufficient context?
   - What is the damage if this leaks?

## Sanitization Guide

| Original | Sanitized |
|---|---|
| Full name | Initials |
| Exact financial value | Range (e.g., "R$ 50k–100k") |
| Full address | General region |
| Case number | Keep only if needed for context |
| Company name in conflict | Category (e.g., "former employer") |

## For Teams

When implementing CORE-OS in a team or organizational context:
- Define which layers each member can access.
- Create sanitized versions of sensitive cores for shared use.
- Never store Layer 2 or Layer 3 data in shared repositories.
