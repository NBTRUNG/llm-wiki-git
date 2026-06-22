# legacy agent status

Guide before filling: `wiki/knowledge/project-docs/agent_local_work.md`

Use this template only for projects that intentionally keep the legacy
split-file agent model. New or updated projects should put the current
checkpoint in `agents/<agent>/AGENT.md`.

Agent:
Last updated: YYYY-MM-DD
Updated by:
Current state: idle | assigned | in_progress | blocked | implemented | needs-review | accepted
Current task:

## Current state card

- Current task id:
- State:
- Last checkpoint:
- Current step:
- Next action:
- Blocker: none |
- Result report path:
- Validation state: not-started | running | passed | failed | not-run

## Latest checkpoint

One short paragraph with the latest meaningful state. New sessions read this
before opening the append-only log.

-

## Files touched

- 

## Validation

- Checks run:
- Checks not run:
- Missing proof:

## Result report

- Path:
- Status: not-started | drafting | ready-for-review | accepted | rejected

## Audit trail

- Assigned task:
- Agent status:
- Result report:
- Codex validation report:
- Test matrix:
- Project status update:

## Handoff note

- 

## Checkpoint log

Append-only. Keep newest row at the top. Agents read older rows only when the
Latest checkpoint is ambiguous or the task is resuming after interruption.

| Time | State | Summary | Evidence |
| --- | --- | --- | --- |
| YYYY-MM-DD HH:MM | assigned | | |
