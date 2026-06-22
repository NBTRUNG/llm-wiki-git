# project status guide

## purpose

`docs/project_status.md` is the human-readable current state of a concrete repo.

It summarizes what is done, what is next, what is risky, and where evidence lives.

## include

- Project name.
- Last updated date.
- Updated by.
- Overall status.
- Current phase.
- Phase started date.
- Current state.
- Active tasks.
- Source of truth path or statement.
- Next steps.
- Latest validation.
- Risks and blockers.
- Recent decisions.
- Notes for next agent.
- Change log.
- Done.
## canonical section order

Use this order:

1. Header metadata:
   - Project.
   - Last updated.
   - Updated by.
   - Overall status.
   - Current phase.
   - Phase started.
2. Current state.
3. Active tasks.
4. Next steps.
5. Latest validation.
6. Risks and blockers.
7. Recent decisions.
8. Notes for next agent.
9. Change log.
10. Done.

## active tasks table

Use a compact table:

| ID | Owner | Status | Since | Evidence | Blocker |
|---|---|---|---|---|---|

The active task table should summarize current execution state only. Detailed task packets stay in `docs/tasks.md`.

## risks and blockers table

Use:

| Risk | Impact | Status | Owner |
|---|---|---|---|

Impact should be `low`, `medium`, or `high`.

## change log rule

Add one row after each meaningful project-status update.

The change log should explain why the status changed, not repeat every task detail.

## quality criteria

- A new agent can resume without reading every report.
- Status matches `docs/tasks.md` and `docs/test_matrix.md`.
- Current next step is concrete.
- Source of truth is explicit.
- Active tasks agree with `docs/tasks.md`.
- Recent decisions agree with `docs/decisions.md`.
- Risks and blockers name an owner.
- Evidence links point to validation reports or command results.
- Stale or superseded state is removed quickly.
- Status is updated immediately after meaningful work, not only at the end of a session.

## anti-patterns

- Tracking project status in LLM-Wiki `active.md` after repo exists.
- Leaving stale "next task" entries after agent work completes.
- Waiting until the end of a long session to update status.
- Repeating every task detail instead of summarizing.
- Hiding blockers in old reports.
- Listing assigned tasks without matching task packets in `docs/tasks.md`.
- Recording decisions here without adding or linking them in `docs/decisions.md` when they are durable decisions.
