# agent status guide

## purpose

`docs/agent_status.md` is the active assignment board for multi-agent work in a concrete repo.

It exists so agents do not have to inspect another agent's private report folder to know what to do next.

This is the repo-wide assignment board owned by Codex/main. It is different from delegated agent-local status files:

```text
agents/<agent>/AGENT.md
```

For delegated agent-local state, keep a compact current checkpoint in
`agents/<agent>/AGENT.md`. Agents should not have to read more than one local
file to know whether to work, stop, or hand off.

## include

- Current phase/gate.
- Accepted-through state.
- Not-yet-accepted work.
- Assignment table: agent, status, current task, claim owner, claim scope, write
  scope, next action, blocker/note.
- Links to `agents/<agent>/AGENT.md` and result reports when relevant.
- Current evidence links.
- Known caveats.
- Update rules.

## quality criteria

- Each agent can see whether it is active, paused, idle, or blocked.
- Write scopes are explicit.
- Assignment changes are updated in the same turn.
- Assignment/status changes are checkpointed immediately after they happen.
- Task claims are explicit: unclaimed, claimed, released, blocked, or stale.
- Claims are released when work is done, blocked, paused, or reassigned.
- Agent-local `AGENT.md` exposes current assignment, active packet, next action, blocker, and result report path in the first screen.
- `reports/agent/` is treated as evidence/history, not the assignment board.
- Agent-owned sections of `agents/<agent>/AGENT.md` are execution state, not final acceptance.
- The file agrees with `docs/tasks.md`, `docs/test_matrix.md`, and `docs/project_status.md`.

## anti-patterns

- Keeping current assignments only in `reports/agent/<agent>/`.
- Updating assignment state only at the end of a session.
- Letting paused agents continue generating unintegrated work.
- Marking a task implemented in agent status without test matrix evidence.
- Omitting blockers.
- Letting an agent start implementation without claiming the task.
- Leaving stale claims active after an interruption.
- Burying the current task or blocker below a long checkpoint log.
- Requiring delegated agents to read separate local task and status files when
  one control card would carry the current slice.
