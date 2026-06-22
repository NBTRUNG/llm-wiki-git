# implementation plan guide

## purpose

`docs/implementation_plan.md` turns the brief, architecture, decisions, contracts, tasks, and test matrix into an execution sequence for a concrete repo.

It is a planning bridge, not the current task board.

## include

- Source docs used.
- Assumptions and unknowns.
- Phases and exit criteria.
- Workstreams and ownership.
- Required contracts before coding.
- Task breakdown with dependencies, risk lane, complexity, delegation, and validation.
- Current recommended sequence.
- Decisions or contract decisions still needed.
- Validation strategy by proof layer.

## quality criteria

- The plan explains order and dependency, not just a task list.
- Contracts needed before coding are visible.
- Delegation is based on task complexity and write scope.
- High-risk work has explicit validation.
- The plan agrees with `docs/tasks.md`, `docs/contracts.md`, and `docs/test_matrix.md`.

## anti-patterns

- Duplicating every task detail from `docs/tasks.md`.
- Treating the plan as current status.
- Starting implementation before contract blockers are resolved.
- Hiding human-decision-required work inside normal tasks.

