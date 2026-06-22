# legacy agent tasks

Guide before filling: `wiki/knowledge/project-docs/agent_local_work.md`

Use this template only for projects that intentionally keep the legacy
split-file agent model. New or updated projects should put the current
assignment and active packet in `agents/<agent>/AGENT.md`.

Agent:
Last updated: YYYY-MM-DD
Updated by: Codex

## Read first

1. `AGENTS.md`
2. `REPO_RULES.md`
3. `agents/<agent>/AGENT.md`
4. This file: read `Current assignment`, `Task index`, and the active task packet only
5. `agents/<agent>/status.md`: read `Current state card` and `Latest checkpoint` only
6. Files listed in the active task `Required read files`

Do not read Lead state or repo-wide rollup docs unless the active task lists
them in Required read files. In the default one-file model, do not read this
file at all; use `agents/<agent>/AGENT.md`.

## Current assignment

- Current task id: TASK-XXX
- State: idle | assigned | in_progress | blocked | needs-review | accepted
- Active packet anchor: `#task-xxx---task-title`
- Required read files:
  - 
- Allowed write targets:
  - 
- Result report path: `reports/agent/<agent>/TASK-XXX-result.md`
- Stop condition: if state is `idle`, `blocked`, or `accepted`, stop unless Lead assigned new work.

## Task index

| Task | Status | Packet anchor | Result report |
|---|---|---|---|
| TASK-XXX | assigned | `#task-xxx---task-title` | `reports/agent/<agent>/TASK-XXX-result.md` |

## Completed packets (archived)

Full text of accepted packets is moved to `agents/<agent>/tasks_archive.md` by
the Lead/review owner after acceptance. Delegated agents do not read or write
the archive during normal work.

| Task | Outcome | Archive anchor | Validation report |
|---|---|---|---|
|  |  |  |  |

## Active task packet

## TASK-XXX - Task title

### Metadata

- Type:
- Phase:
- Workstream:
- Lane:
- Complexity:
- Delegation:
- Suggested owner:
- Fallback owner:
- Assigned owner:
- Review owner:
- Parallelizable: yes | no
- File ownership group:
- Status: assigned
- Review status: pending

### Dependencies

- 

### Contract references

- 

### Context

- 

### ACID check

- Atomic:
- Clear input/output:
- Idempotent:
- Decidable:

### Required read files

- 

### Exact input

- 

### Exact output

- 

### Allowed write targets

- 

### Forbidden write targets

- docs/tasks.md
- docs/project_status.md
- docs/test_matrix.md
- docs/contracts.md
- docs/agent_status.md

### Forbidden side effects

- 

### Acceptance criteria

- [ ] 

### Validation evidence required

- 

### Agent report path

- reports/agent/<agent>/TASK-XXX-result.md

### Evidence path

- reports/validation/TASK-XXX.md

### Audit trail

- Repo task board:
- Agent task file:
- Agent status file:
- Agent report path:
- Codex validation report:
- Test matrix row:
- Project status update:

### Notes/blockers

- 

## Inactive non-accepted packets

Keep only short notes for blocked, superseded, or rejected packets that were not
accepted and therefore were not moved into `tasks_archive.md`.
