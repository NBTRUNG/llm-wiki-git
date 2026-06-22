# agent control card

Guide: [[../wiki/knowledge/project-docs/multi-agent-coordination.md]]

Agent: <agent-name>
Last updated: YYYY-MM-DD
Updated by: <lead agent>
Availability: available | unavailable

## section ownership

Lead-owned sections:

- `role summary`
- `read order`
- `coordination mode`
- `current assignment`
- `active task packet`
- `write rules`
- `current write boundary`
- `forbidden side effects`

Agent-owned sections:

- `current checkpoint`
- `latest checkpoint`
- `files touched`
- `validation`
- `result handoff`
- `notes/blockers`

## role summary

<One paragraph: what this agent does on this project, and what it does not do.>

## read order

Mandatory read files before any work:

1. `AGENTS.md`
2. `REPO_RULES.md`
3. Full LLM-Wiki Coding Pack once when the session is code/review/refactor/test/validation work
4. This file (`agents/<agent>/AGENT.md`)
5. Files listed in this file's `Required read files`

Do not read other repo docs, Lead state, per-agent task/status/archive files,
or unrelated LLM-Wiki knowledge unless the active task explicitly lists them or
the Knowledge Lookup Metric requires it.

## coordination mode

- Mode: Lead-orchestrated | Human-orchestrated
- Review target: Lead | Human
- Integration owner: Lead | Human | named agent | not assigned yet
- Other agents in same workstream:
  -
- Shared-file write delegation:
  - File:
  - Section/rows:
  - Operation: append | update row | replace section | none
  - Lock owner:
  - Review target:
  - Rollback note:

If mode is `Human-orchestrated`, report completion to the human review target
using `result handoff`. Do not assume other agents have seen your work. If
integration owner is `not assigned yet`, stop after handoff and do not merge or
roll up shared state.

## current assignment

- Current task id: TASK-XXX
- State: idle | assigned | in_progress | blocked | needs-review | accepted
- Required read files:
  -
- Allowed write targets:
  -
- Forbidden write targets:
  - docs/tasks.md
  - docs/project_status.md
  - docs/test_matrix.md
  - docs/contracts.md
  - docs/agent_status.md
- Result report path: `reports/agent/<agent>/TASK-XXX-result.md`
- Stop condition: if state is `idle`, `blocked`, or `accepted`, stop unless Lead assigned new work.

## active task packet

### TASK-XXX - Task title

#### Metadata

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

#### Dependencies

-

#### Contract references

-

#### Context

-

#### ACID check

- Atomic:
- Clear input/output:
- Idempotent:
- Decidable:

#### Required read files

-

#### Exact input

-

#### Exact output

-

#### Allowed write targets

-

#### Forbidden write targets

- docs/tasks.md
- docs/project_status.md
- docs/test_matrix.md
- docs/contracts.md
- docs/agent_status.md

#### Forbidden side effects

-

#### Acceptance criteria

- [ ]

#### Validation evidence required

-

#### Agent report path

- reports/agent/<agent>/TASK-XXX-result.md

#### Evidence path

- reports/validation/TASK-XXX.md

## write rules

Default mode: read-only.

Write only to paths declared in the current task packet under `Allowed write
targets`. Never edit files outside that list, even to fix obvious issues — raise
a blocker in this file's `notes/blockers` section instead.

## current write boundary

(Updated per phase by the lead agent.)

Allowed in this phase:

- 

Forbidden in this phase:

- `docs/tasks.md`
- `docs/project_status.md`
- `docs/test_matrix.md`
- `docs/contracts.md`
- `docs/agent_status.md`
- `docs/decisions.md`
- <other groups' folders>
- <shared infrastructure files>

## forbidden side effects

(Behavioral constraints that apply to all this agent's tasks regardless of
specific allowed targets.)

- 

## checkpoint rule

Update this file's agent-owned checkpoint sections:

- when starting a task;
- after each meaningful file-group change;
- before long validation;
- after validation;
- when blocked;
- when creating a result report;
- before stopping.

Keep this file current-slice only. Do not append unbounded history here; durable
history belongs in result reports and repo-level task archives after Lead
acceptance.

## current checkpoint

- Current task id:
- State:
- Last checkpoint:
- Current step:
- Next action:
- Blocker: none |
- Result report path:
- Validation state: not-started | running | passed | failed | not-run

## latest checkpoint

One short paragraph with the latest meaningful state. New sessions read this
before doing work.

-

## files touched

-

## validation

- Checks run:
- Checks not run:
- Missing proof:

## result handoff

- Task:
- Status: not-started | drafting | ready-for-review | blocked | needs-decision | accepted | rejected
- Decision requested: accept | review diff | unblock | reassign | choose approach | integrate
- Files changed:
  -
- Validation:
  -
- Risks/blockers:
  -
- Conflicts/overlap:
  -
- Suggested next actor: Lead | Human | named agent
- Report file: none | reports/agent/<agent>/TASK-XXX-result.md
- Next suggested action:

## conflict protocol

If the current task collides with another agent's work, with a shared contract,
or with security/deployment files:

1. Stop further edits in the conflict zone.
2. Record the conflict in this file's `notes/blockers` section with file paths
   and the nature of the conflict.
3. Mark the task as blocked.
4. Wait for lead agent decision. Do not resolve unilaterally.

## notes/blockers

- 
