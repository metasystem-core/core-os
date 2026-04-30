# RAR — Robustness / Asymmetry / Reversibility

## Function

Pragmatic triaging of decisions.

## Three Axes

**Robustness:** Does the decision withstand error, noise, delay, friction, and partial context change?

**Asymmetry:** Does the potential gain compensate for the risk, cost, and possible loss?

**Reversibility:** If it goes wrong, can I go back without structural damage?

## Decision Matrix

| Robustness | Asymmetry | Reversibility | Output |
|---|---|---|---|
| High | Positive | Reversible | Execute |
| Low | Uncertain | Irreversible | Block |
| Uncertain | Low impact | Reversible | EBI |
| Any | Negative | Any | Inaction |

## Possible Outputs

- Execute / allocate
- Execute small
- Wait
- Reduce
- Partial realization
- Block
- Convert to EBI experiment
