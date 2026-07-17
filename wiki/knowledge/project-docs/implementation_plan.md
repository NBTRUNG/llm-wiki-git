# implementation plan guide

## purpose

`docs/implementation_plan.md` turns the brief, architecture, decisions, contracts, tasks, and test matrix into an execution sequence for a concrete repo.

It is a planning bridge, not the current task board.

## include

- Source docs used.
- Assumptions and unknowns.
- Business workflow plan with stable workflow IDs and first proof.
- Cross-cutting outcomes with affected workflows.
- Phases and exit criteria.
- Workstreams and ownership.
- Workflow task sequence before technical task breakdown.
- Required contracts before coding.
- Task breakdown with dependencies, risk lane, complexity, delegation, and validation.
- Current recommended sequence.
- Decisions or contract decisions still needed.
- Validation strategy by proof layer.

## quality criteria

- The plan explains order and dependency, not just a task list.
- The plan starts from business workflows and outcomes before technical
  workstreams.
- Each workflow has map references, first proof, and a task sequence.
- Cross-cutting work names affected workflows.
- Contracts needed before coding are visible.
- Delegation is based on task complexity and write scope.
- High-risk work has explicit validation.
- The plan agrees with `docs/tasks.md`, `docs/contracts.md`, and `docs/test_matrix.md`.

## anti-patterns

- Duplicating every task detail from `docs/tasks.md`.
- Organizing the plan only by frontend/backend/data/security when user/business
  workflows are known.
- Hiding a missing business workflow behind technical tasks.
- Treating the plan as current status.
- Starting implementation before contract blockers are resolved.
- Hiding human-decision-required work inside normal tasks.
