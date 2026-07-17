---
name: optimization-scheduling
description: Scheduling, routing, assignment, allocation, packing, and constraint optimization guidance.
date_ingested: 2026-06-29
status: active
source_type: distilled-practice + official-libraries
source_urls:
  - https://developers.google.com/optimization
confidence: medium
confidence_reviewed: 2026-06-29
---

# optimization scheduling

Use this guide for scheduling classes, assigning people/resources, routing,
allocation, packing, or constraint-heavy planning.

## first classify

| Shape | Common model |
| --- | --- |
| choose best among feasible options | constrained optimization |
| assign people/resources to slots | assignment / matching |
| route vehicles/visits | vehicle routing |
| fit items into capacity | bin packing / knapsack |
| schedule with dependencies | constraint programming / topological ordering |
| balance load/fairness | min-cost flow or heuristic with fairness metric |

## required inputs

```text
Decision variables:
Hard constraints:
Soft constraints:
Objective:
Tie-breakers:
Feasibility fallback:
Human override:
```

## library rule

For serious routing/scheduling/allocation, use proven optimization tooling
before writing a custom solver. Custom heuristics are acceptable when the
problem is small, explainability matters more than optimality, or an exact
solver is unnecessary.

## output requirements

- State whether solution is optimal, feasible, heuristic, or approximate.
- Record constraints that were relaxed.
- Provide explanation for rejected/selected assignments.
- Include deterministic seed/tie-breaker when reproducibility matters.

## anti-patterns

- Treating soft constraints as hard without stakeholder approval.
- Reporting an infeasible problem as "no data".
- Greedy scheduling with no proof or fallback.
- No human override path for business-critical scheduling.
