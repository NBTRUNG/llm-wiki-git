# tasks doc guide

## purpose

`docs/tasks.md` is the executable task source for a concrete repo.

It should make work assignable to an agent without hidden assumptions.

**References:**
- Task packet template: `harness/task-packet.md` (fillable form for each task).
- Concept definitions: `harness/task-decomposition.md` (ACID rules, complexity, delegation, input/output contracts — canonical source).
- Fillable file template: `templates/tasks.template.md`.

## include for each executable task

- ID and title.
- Type, phase, workstream, lane, complexity, delegation.
- Suggested owner.
- Fallback owner.
- Assigned owner.
- Review owner.
- Parallelizable: yes/no.
- Dependencies.
- Contract references.
- Status.
- Context.
- ACID check (see `harness/task-decomposition.md`):
  - Atomic.
  - Clear input/output.
  - Idempotent.
  - Decidable.
- Required read files.
- Exact input (see `harness/task-decomposition.md` for input contract).
- Exact output (see `harness/task-decomposition.md` for output contract).
- Allowed write targets.
- Forbidden write targets.
- Forbidden side effects.
- File ownership group.
- Acceptance criteria.
- Validation evidence required.
- Agent report path.
- Evidence path.
- Review status.
- Notes/blockers.

## canonical section order

Use this order for executable tasks:

1. Task heading: `## TASK-ID - Title`
2. Metadata.
3. Dependencies.
4. Contract references.
5. Context.
6. ACID check.
7. Required read files.
8. Exact input.
9. Exact output.
10. Allowed write targets.
11. Forbidden write targets.
12. Forbidden side effects.
13. Acceptance criteria.
14. Validation evidence required.
15. Agent report path.
16. Evidence path.
17. Notes/blockers.

## delegation fields

- `Suggested owner`: best-fit agent for the task.
- `Fallback owner`: agent that should take over if the suggested owner is unavailable or blocked.
- `Assigned owner`: current owner.
- `Review owner`: agent or human responsible for acceptance review.
- `Parallelizable`: `yes` only when write targets and dependencies do not overlap with other active tasks.
- `File ownership group`: stable group name used to avoid parallel write conflicts.
- `Review status`: `not-needed`, `pending`, `changes-requested`, or `accepted`.

## write boundary rules

- `Allowed write targets` must be specific enough for an agent to know where it may edit.
- `Forbidden write targets` must list high-risk files the task must not touch.
- `Forbidden side effects` must list behavior changes, dependency additions, framework additions, migrations, external calls, or contract changes that are out of scope.
- Delegated implementation tasks should not update `docs/tasks.md`, `docs/project_status.md`, or `docs/contracts.md` unless explicitly allowed.
- Agent reports are evidence/history. They do not replace task/status updates by the review owner.

## quality criteria

- Another agent can start from the task without guessing.
- The task has a matching row in `docs/test_matrix.md`.
- The task is small enough to verify.
- Status is updated immediately when work is accepted.
- Long tasks are checkpointed after meaningful units of work so interruption does not lose state.
- Implementation tasks reference contracts when touching shared names.
- Delegated task files keep a current assignment card and active packet above archived packets, so agents do not scan historical tasks before acting.

## anti-patterns

- Broad tasks like "improve frontend" or "fix backend".
- Marking implemented because code exists but evidence is missing.
- Letting agent result reports become the only task status.
- Waiting until the final response to update task status.
- Assigning parallel agents to overlapping write scopes.
- Appending every delegated packet into one long active section with no current assignment card.
