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
- Type, workflow ID, affected workflows, workflow slice, user/business outcome,
  phase, workstream, lane, complexity, delegation.
- Suggested owner.
- Fallback owner.
- Assigned owner.
- Review owner.
- Parallelizable: yes/no.
- Dependencies.
- Capability gate: minimum tier, required dimensions/domains, context
  projection, maximum autonomy, verifier, reviewer, evidence, and fallback.
- Contract references.
- Map references: UI, code, data, and raw verification anchors when relevant.
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
4. Capability gate.
5. Contract references.
6. Map references.
7. Context.
8. ACID check.
9. Required read files.
10. Exact input.
11. Exact output.
12. Allowed write targets.
13. Forbidden write targets.
14. Forbidden side effects.
15. Acceptance criteria.
16. Validation evidence required.
17. Agent report path.
18. Evidence path.
19. Notes/blockers.

## delegation fields

- `Suggested owner`: best-fit agent for the task.
- `Fallback owner`: agent that should take over if the suggested owner is unavailable or blocked.
- `Assigned owner`: current owner.
- `Review owner`: agent or human responsible for acceptance review.
- `Parallelizable`: `yes` only when write targets and dependencies do not overlap with other active tasks.
- `File ownership group`: stable group name used to avoid parallel write conflicts.
- `Review status`: `not-needed`, `pending`, `changes-requested`, or `accepted`.
- Capability fields follow
  [agent_capability_tiers.md](agent_capability_tiers.md). The task requirement
  is selected from task shape; it must not be lowered to fit an available
  agent. Unrated/expired agents are `C0` and cannot self-upgrade.

## write boundary rules

- `Allowed write targets` must be specific enough for an agent to know where it may edit.
- `Forbidden write targets` must list high-risk files the task must not touch.
- `Forbidden side effects` must list behavior changes, dependency additions, framework additions, migrations, external calls, or contract changes that are out of scope.
- Delegated implementation tasks should not update `docs/tasks.md`, `docs/project_status.md`, or `docs/contracts.md` unless explicitly allowed.
- Agent reports are evidence/history. They do not replace task/status updates by the review owner.

## quality criteria

- Another agent can start from the task without guessing.
- The task points to a business workflow or marks itself cross-cutting with
  affected workflows.
- The task has one workflow slice and one clear user/business or enabling
  outcome.
- The task has a matching row in `docs/test_matrix.md`.
- The task is small enough to verify.
- Status is updated immediately when work is accepted.
- Long tasks are checkpointed after meaningful units of work so interruption does not lose state.
- Implementation tasks reference contracts when touching shared names.
- Implementation tasks reference UI/code/data/raw maps when touching mapped
  workflows or data.
- Delegated task files keep a current assignment card and active packet above archived packets, so agents do not scan historical tasks before acting.

## anti-patterns

- Broad tasks like "improve frontend" or "fix backend".
- Planning by technical layer only when a business workflow exists.
- Creating UI/backend/data tasks with no shared workflow ID or outcome.
- Marking implemented because code exists but evidence is missing.
- Letting agent result reports become the only task status.
- Waiting until the final response to update task status.
- Assigning parallel agents to overlapping write scopes.
- Appending every delegated packet into one long active section with no current assignment card.
