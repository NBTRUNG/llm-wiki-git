---
name: optimization-math
description: Optimization guidance for objectives, constraints, feasible regions, scheduling, routing, allocation, and trade-off decisions.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# optimization

Use this guide when choosing among many possible assignments, schedules,
routes, allocations, configurations, or trade-offs.

## model shape

```text
Decision variables:
Objective function:
Constraints:
Feasible region:
Hard vs soft constraints:
Tie-breakers:
Scale:
Solver/library:
Validation:
```

## checks

- Define what "best" means before solving.
- Separate hard constraints from preferences.
- Include units and bounds for variables.
- Confirm whether the problem is continuous, integer, combinatorial, or
  constraint-satisfaction.
- Prefer proven solvers/libraries for serious routing, scheduling, assignment,
  and linear/integer programming.
- Keep an explanation path for human review when decisions affect people,
  money, compliance, or customer outcomes.

## anti-patterns

- Optimizing the wrong objective.
- Hiding policy constraints as weights.
- Returning an infeasible plan without explaining violated constraints.
- Hand-rolling solvers when a proven optimization library fits.

