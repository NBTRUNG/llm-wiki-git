# tasks

Guide before filling: `wiki/knowledge/project-docs/tasks.md`

## current task

## TASK-XXX - Task title

### Metadata

- Type: research | docs | frontend implementation | backend implementation | CMS implementation | test | validation | migration | maintenance
- Workflow ID: WF-... | CROSS-CUTTING-...
- Affected workflows: none | WF-..., WF-...
- Workflow slice: contracts/maps | data-base | backend-code | ui | integration | validation | release-ops | other
- User/business outcome:
- Phase: 0 - discovery | 1 - foundation | 2 - core build | 3 - front-end/Razor | 4 - integration | 5 - hardening | 6 - release
- Workstream: discovery | architecture | cms | data | frontend | backend | integration | security | content | testing | release | operations
- Lane: tiny | normal | high-risk
- Execution mode: standard | bounded change fast path
- Repo Bounded Change Profile: none | path
- Fast-path entry decision and escalation triggers:
- Complexity: simple | normal | hard | expert
- Delegation: delegate-ok | delegate-with-review | main-agent | human-decision-required
- Suggested owner:
- Fallback owner:
- Assigned owner:
- Review owner:
- Claim status: unclaimed | claimed | released | blocked | stale
- Claimed by:
- Claim scope:
- Claimed at:
- Release reason:
- Next eligible owner:
- Parallelizable: yes | no
- File ownership group:
- Status: planned | assigned | in_progress | blocked | implemented | accepted | changed | retired
- Review status: not-needed | pending | changes-requested | accepted

### Dependencies

- None

### Capability gate

- Minimum capability tier: C0 | C1 | C2 | C3 | C4 | C5 | C6
- Required capability dimensions/domains:
- Assigned context projection: P0 Capsule | P1-BOUNDED-CODING | other approved P1 ID | P2 Map-First
- Projection source path:
- Required repo profile/capsules:
- Maximum autonomy: read-only | proposal-only | sandbox action | bounded write | delegated implementation/review | Lead/integration
- Required deterministic verifier:
- Required human/Lead review:
- Capability evidence/profile:
- Fallback owner or higher-tier handoff:

### Human-Agent Hybrid Control

- Human sponsor:
- Acceptance owner:
- Agent principal/session:
- Action-risk lane: R0 Observe | R1 Reversible | R2 Consequential | R3 Prohibited
- Allowed permission grant:
- Forbidden actions/resources:
- Human approval events:
- Grant start and expiry/review trigger:
- Interrupt/stop route: manual | implemented path | unavailable
- Rollback/recovery route: manual | verified path | unavailable
- Human responsibility: intent | risk | permission | judgment | acceptance
- Agent responsibility: bounded analysis | execution | verification support | evidence

### Contract references

- None

### Map references

- UI: none | ui_map/...#UI-
- Code: none | docs/code_map.md#CODE-
- Data: none | docs/data_map.md#DATA-
- Raw verification: none | docs/database_inventory.md#RAW-

### Context

Why this task exists, what it must achieve, and what it must not expand into.

### ACID check

- Atomic:
- Clear input/output:
- Idempotent:
- Decidable:

### Required read files

- AGENTS.md
- AI_CODEX.md
- docs/contracts.md
- docs/project_status.md
- docs/tasks.md

### Exact input

- 

### Exact output

- 

### Allowed write targets

- 

### Shared-file write delegation

- File:
- Section/rows:
- Operation: none | append | update row | replace section
- Lock owner:
- Review target:
- Rollback note:

### Forbidden write targets

- 

### Forbidden side effects

- 

### Acceptance criteria

- [ ] 
- [ ] 
- [ ] 

### Validation evidence required

- 

### Agent report path

- reports/agent/<agent>/TASK-XXX-result.md

### Integration merge plan path

- none | reports/integration/TASK-XXX-merge-plan.md

### Evidence path

- reports/validation/TASK-XXX.md

### Audit trail

- Repo task board:
- Agent control card:
- Agent report path:
- Integration merge plan:
- Codex validation report:
- Test matrix row:
- Project status update:

### Notes/blockers

- 

## backlog

## backlog by workflow

| Workflow ID | Tasks | Status | Next unblock |
| --- | --- | --- | --- |
| WF- | TASK-YYY | planned |  |

## backlog

| ID | Title | Workflow ID | Slice | Phase | Workstream | Depends on | Contracts/maps | Owner | Review owner | File group | Parallelizable | Lane | Complexity | Delegation | Status | Review | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TASK-YYY | | WF- / CROSS-CUTTING- |  | | | | none | | | | yes / no | tiny / normal / high-risk | simple / normal / hard / expert | delegate-ok / delegate-with-review / main-agent / human-decision-required | planned | pending | |
