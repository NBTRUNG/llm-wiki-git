# implementation plan

Guide before filling: `wiki/knowledge/project-docs/implementation_plan.md`

Project:
Last updated:
Planner:

## source

- Project brief:
- Architecture:
- Contracts:
- Decisions:
- Tasks:
- Test matrix:

## assumptions

- 

## unknowns

- 

## phases

| Phase | Goal | Exit criteria |
| --- | --- | --- |
| 0 - discovery | | |
| 1 - foundation | | |
| 2 - core build | | |
| 3 - integration | | |
| 4 - hardening | | |
| 5 - release | | |

## business workflow plan

Plan from the business workflow first, then split into technical tasks.

| Workflow ID | User/business outcome | UI map | Code map | Data map | Raw verification | Required contracts | First proof | Affected phase(s) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| WF- |  |  |  |  |  |  |  |  |

## cross-cutting outcomes

Use for platform, security, deployment, migration, upgrade, design-system,
observability, or other work that supports multiple workflows.

| Cross-cutting ID | Outcome | Affected workflows | Required maps/contracts | First proof |
| --- | --- | --- | --- | --- |
| CROSS-CUTTING- |  |  |  |  |

## workstreams

| Workstream | Scope | Owner/default delegation | Notes |
| --- | --- | --- | --- |
| discovery | | | |
| architecture | | | |
| cms | | | |
| data | | | |
| frontend | | | |
| backend | | | |
| integration | | | |
| security | | | |
| content | | | |
| testing | | | |
| release | | | |
| operations | | | |

## contracts required

| Contract area | Needed before phase | Owner | Decision needed | Status |
| --- | --- | --- | --- | --- |
| Naming conventions | 1 - foundation | | yes / no | proposed / accepted / blocked |
| CMS aliases | | | yes / no | proposed / accepted / blocked |
| Service functions | | | yes / no | proposed / accepted / blocked |
| API/form contracts | | | yes / no | proposed / accepted / blocked |
| Frontend components | | | yes / no | proposed / accepted / blocked |
| Shared types/models | | | yes / no | proposed / accepted / blocked |
| Routes/events/permissions | | | yes / no | proposed / accepted / blocked |

## workflow task sequence

| Workflow ID | Sequence | Blocking decision/contract | Parallelizable slices | First validation |
| --- | --- | --- | --- | --- |
| WF- | contracts/maps -> data/base -> backend/code -> UI -> integration -> validation |  |  |  |

## task breakdown summary

| ID | Task | Workflow ID | Slice | Phase | Workstream | Depends on | Contracts/maps | Owner/team | Review owner | File group | Parallelizable | Lane | Complexity | Delegation | ACID | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TASK-001 | | WF- / CROSS-CUTTING- | contracts/maps / data-base / backend-code / UI / integration / validation / release-ops | | | | none / CONTRACT-001 / UI- / CODE- / DATA- / RAW- | | | | yes / no | tiny / normal / high-risk | simple / normal / hard / expert | delegate-ok / delegate-with-review / main-agent / human-decision-required | pass / needs-split / blocked | |

## current recommended sequence

1. 
2. 
3. 

## decisions needed before coding

- 

## contract decisions needed before coding

- 

## validation strategy

- Unit:
- Integration:
- E2E:
- Platform:
- Release:
- Manual review:
