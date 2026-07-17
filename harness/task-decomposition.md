# task decomposition

Use this workflow when turning a broad project request into business workflows,
phases, workstreams, and executable tasks.

> **Canonical source:** This document is the authoritative definition for ACID rules, complexity levels, delegation guidance, and task input/output contracts. Other files (`harness/task-packet.md`, `wiki/knowledge/project-docs/tasks.md`) reference these definitions — update here first.

Example broad request:

```text
Build a web project using .NET, Umbraco CMS, and frontend design similar to major universities.
```

The output should not be one giant task or a list of technical workstreams. It
should become a plan rooted in business workflows, then split into technical
tasks with dependencies, complexity levels, delegation guidance, and validation.

## purpose

Task decomposition helps AI agents:

- split ambiguous project goals into implementable slices;
- start from the business/user workflow before technical workstreams;
- distinguish architecture decisions from coding tasks;
- assign simple work to other agents safely;
- reserve hard/expert work for the main agent or human decision;
- avoid coding before the project contract and source of truth are clear.

## where decomposition lives

Use the files this way:

| File | Role |
| --- | --- |
| `docs/project_brief.md` | Project contract: problem, goals, users, scope, requirements, constraints, acceptance criteria |
| `docs/contracts.md` | Shared implementation contracts: names, APIs, CMS aliases, components, types, routes, permissions |
| `docs/implementation_plan.md` | Business workflow plan, phases, workstreams, dependency order, task breakdown strategy |
| `docs/tasks.md` | Executable tasks with owner/delegation, complexity, acceptance criteria, validation |
| `wiki/architecture.md` | System decomposition: components, data model, flows, integrations, deployment/security |
| `docs/decisions.md` | Decisions that affect architecture, scope, data, security, or migration |
| `docs/test_matrix.md` | Proof obligations mapped to unit/integration/e2e/platform/release/manual review |

Do not overload `project_brief.md` with the full execution plan. Keep the brief stable, put shared names/contracts in `contracts.md`, decomposition in `implementation_plan.md`, and executable work in `tasks.md`.

## workflow-first rule

Plan from the business problem first.

The required order is:

```text
Business problem / user workflow
  -> workflow ID and outcome
  -> required maps and contracts
  -> vertical slice or workflow sequence
  -> technical tasks by specialist workstream
  -> file/team ownership groups
```

Workstreams such as `frontend`, `backend`, `data`, `cms`, `security`, and
`release` are execution specialties. They should not be the primary product
breakdown when a user/business workflow exists.

Use stable workflow IDs:

```text
WF-PROGRAM-DETAIL
WF-NEWS-LISTING
WF-ADMISSION-ENQUIRY
CROSS-CUTTING-UPGRADE
```

Every executable task should name one of:

- `Workflow ID: WF-...` for a business/user workflow slice;
- `Workflow ID: CROSS-CUTTING` plus `Affected workflows` for platform,
  security, deployment, migration, upgrade, design-system, or observability
  work that supports several workflows.

Tasks that cannot name a workflow or affected workflow are usually not ready for
implementation. Create a discovery/definition task first.

## workflow task sequence

For each business workflow, decompose into the smallest useful sequence that can
prove the outcome:

```text
workflow definition / acceptance
  -> contracts and map coordinates
  -> data/base/schema work
  -> backend/code/service work
  -> UI/workflow surface
  -> integration
  -> validation/proof
  -> release/operations notes when needed
```

Not every workflow needs every slice. Keep simple workflows simple.

Technical task groups should carry clear input and output:

| Slice | Typical input | Typical output |
| --- | --- | --- |
| contracts/maps | business workflow, accepted names, existing maps | contract rows, UI/code/data map IDs, raw verification pointer |
| data/base | data-map ID, schema/content model, migration constraints | table/content type/schema/seed/import behavior and verification query |
| backend/code | contract rows, data IDs, service/controller boundary | service/controller/adapter/read-write behavior with tests |
| UI | UI map, route, view model/API contract | page/component/template states and accessibility proof |
| integration | prior slice outputs | end-to-end connected workflow |
| validation | acceptance criteria and proof layer | test/smoke/manual evidence |
| release/ops | deploy target, rollback, config | deployment/rollback/runbook proof |

Parallel work is allowed only when dependencies and write targets are disjoint.
If UI and backend run in parallel, contract/map rows must be accepted first.

## ACID task rule

A task is not delegate-ready until it is ACID-complete for AI work:

| Rule | Meaning |
| --- | --- |
| Atomic | The task cannot be split into smaller meaningful implementation tasks without losing coherence |
| Clear input/output | The task packet names the exact trigger, inputs, source files, contract rows, outputs, side effects, and evidence |
| Idempotent | Running or retrying the task should produce the same stable result without duplicate definitions or drift |
| Decidable | The agent can determine completion from explicit acceptance criteria and validation evidence |

If a task fails any ACID rule, split or clarify it before coding.

## task input/output contract

Every executable task must define its input and output before implementation.

Minimum task input:

- trigger or user request;
- business workflow ID or `CROSS-CUTTING` with affected workflows;
- user/business outcome for the task;
- workflow slice: contracts/maps, data/base, backend/code, UI, integration,
  validation, release/ops, or other project-specific slice;
- map references when relevant: UI map, code map, data map, raw inventory/query;
- source-of-truth file or repo path;
- required read files the agent must read before editing;
- dependencies or prerequisite tasks;
- contract rows from `docs/contracts.md`, or `none`;
- data, fixtures, content samples, environment variables, or credentials needed, with unknowns marked explicitly;
- constraints and non-goals;
- assigned owner, review owner, and fallback owner;
- file ownership group;
- allowed write targets, forbidden write targets, and forbidden side effects.

Minimum task output:

- files/directories to create, update, or leave untouched;
- behavior, document, UI, API, CMS config, test, or decision that must exist after the task;
- workflow outcome advanced or proven;
- map/contract rows updated, or `none`;
- shared names/contracts changed, or `none`;
- status/task/decision/test-matrix updates required;
- validation evidence required;
- agent report path;
- validation evidence path;
- review status expected after completion.

Rules:

- Do not delegate a task whose input or output is `TBD`, except for an explicit discovery task whose output is to resolve that unknown.
- If output depends on a decision, create a decision task first.
- If output depends on a shared name, create or accept the contract row first.
- A task output must be reviewable without reading the agent's hidden reasoning.

## shared contracts

Use `docs/contracts.md` as the source of truth for names shared across agents and layers.

Record shared contracts before implementation when a task touches:

- function, method, service, or helper names;
- API routes, request/response shapes, form field names, or validation keys;
- frontend component names, props, events, or state names;
- CMS document type aliases, data type aliases, compositions, property aliases, or content tree conventions;
- shared constants, enums, permissions, roles, routes, event names, model/type names, or database fields.

Rules:

- If the shared name already exists in `docs/contracts.md`, tasks must use that name exactly.
- If the shared name does not exist, create or update the contract first; do not let implementation tasks invent names independently.
- If a contract needs to change, record the decision in `docs/decisions.md` before changing dependent tasks.
- Every code implementation task that touches shared behavior must list contract references from `docs/contracts.md`.
- Delegated agents receive only the contract rows they need plus their ACID task packet.

## complexity

Complexity is separate from risk lane.

Risk lane answers: "How much blast radius or safety concern does this task have?"

Complexity answers: "How hard is this task to reason about and implement correctly?"

| Complexity | Meaning | Default delegation |
| --- | --- | --- |
| `simple` | Small, clear, local, follows an existing pattern, low ambiguity | `delegate-ok` |
| `normal` | Requires moderate context, a few files, clear behavior, review needed | `delegate-with-review` |
| `hard` | Cross-layer, architectural, data/model heavy, many dependencies, meaningful tradeoffs | `main-agent` |
| `expert` | Foundational decisions, security, migration, performance, ambiguous domain or irreversible choices | `human-decision-required` |

## delegation

| Delegation | Meaning |
| --- | --- |
| `delegate-ok` | Another AI agent can implement independently from the task packet |
| `delegate-with-review` | Another AI agent can implement, but main agent should review before accepting |
| `main-agent` | Main agent should own implementation or split into smaller delegated tasks first |
| `human-decision-required` | Human and main agent must decide direction before implementation |

Delegation must account for both complexity and risk.

Examples:

- `simple` + `tiny`: delegate-ok.
- `normal` + `normal`: delegate-with-review.
- `hard` + `normal`: main-agent or split first.
- `expert` + `high-risk`: human-decision-required.

## group contracts for parallel work

When multiple agents work in parallel on the same project, create per-group contract files before dispatching tasks.

A group contract defines:

- **Workflow scope**: which workflow IDs or cross-cutting outcome the group
  supports.
- **Specialty slice**: UI, code/backend, data/base, CMS, security, validation,
  release, or another agreed workstream.
- **Scope**: which folders and files the group may touch.
- **Allowed write targets**: exact paths the group may create or edit.
- **Shared-file write delegation**: exact shared file section/rows the group may
  edit, if any.
- **Forbidden write targets**: paths the group must not touch (shared config, contracts, other groups' folders).
- **Contract references**: which rows from `docs/contracts.md` this group needs.
- **Dependencies**: what must be ready before this group starts.
- **Output contract**: what files, behavior, or evidence the group must produce.

### group contract template

```md
# Group <X> — <Name> Contract

## Scope

- Workflow ID:
- Affected workflows:
- Specialty slice:
- Workstream: <workstream>
- Complexity: <simple | normal | hard>

## Allowed write targets

- <path/to/folder/>
- <path/to/specific/file>

## Shared-file write delegation

- File: <shared file or none>
- Section/rows: <exact section, row id, anchor, or none>
- Operation: none | append | update row | replace section
- Lock owner: <agent/group>
- Review target: <human | Lead | integration owner>
- Rollback note: <how to undo this scoped write>

## Forbidden write targets

- docs/contracts.md
- docs/tasks.md
- docs/project_status.md
- <other groups' folders>
- <shared infrastructure files>

## Contract references

- <specific rows from docs/contracts.md>

## Dependencies

- <task or group output that must be ready first>

## Output

- <files to create or update>
- <behavior that must exist>
- <evidence required>

## Parallel safety

- File ownership group: <group name>
- Overlapping groups: none | <list>
```

### rules

- One group contract per parallel workstream.
- Forbidden targets must include at least: `docs/contracts.md`, `docs/tasks.md`, `docs/project_status.md`, and all folders owned by other groups.
- Shared-file write delegation is the only way a delegated group may edit a
  shared rollup/contract/status file. It must name file, section/rows,
  operation, lock owner, review target, and rollback note.
- Two groups may edit the same shared file only when section/row locks are
  disjoint. If the same section/row is needed, serialize the groups or assign an
  integration owner and use a merge plan.
- If two groups share a dependency, the dependency must be delivered and verified before either group starts.
- Group contracts are not source of truth — `docs/contracts.md` is. If a contract row changes, update the group contract before the group continues.
- Main agent owns group contracts. Delegated agents receive only their group's contract.

## workstreams

Choose workstreams that match the project. Common web/CMS workstreams:

- `discovery`: goals, users, sitemap, content inventory, references.
- `architecture`: solution structure, boundaries, environments, repo docs.
- `cms`: document types, compositions, content tree, editor experience.
- `data`: data types, schemas, migrations, seed data, uSync/import/export.
- `frontend`: design system, layout, components, templates, accessibility.
- `backend`: services, controllers, APIs, business logic.
- `integration`: search, forms, email, analytics, third-party systems.
- `security`: auth, roles, permissions, secrets, validation, headers.
- `content`: content rules, copy structure, taxonomy, media policy.
- `testing`: unit/integration/e2e/manual QA.
- `release`: deployment, rollback, smoke tests, release checklist.
- `operations`: monitoring, backup, content workflow, maintenance.

Workstreams are secondary to workflow IDs. Use them to assign specialist teams
or agents after the business workflow and outcome are clear.

## decomposition workflow

1. Capture the project contract in `project_brief.md`.
2. Identify known stack, constraints, non-goals, and unknowns.
3. Identify business workflows and assign stable workflow IDs.
4. For each workflow, define the user/business outcome and first proof.
5. Create or update map coordinates: UI map, code map, data map, raw inventory
   pointer, as relevant.
6. Create or update `contracts.md` for shared names that multiple tasks or agents may touch.
7. Draft an implementation plan with workflow plan, phases, and workstreams.
8. Split each workflow into technical slices with one clear input and output.
9. Add dependency order before coding.
10. Assign risk lane and complexity independently.
11. Assign delegation guidance and specialist group/team.
12. Add contract/map references for implementation tasks.
13. Check every task against the ACID task rule.
14. Add acceptance criteria for each task.
15. Add validation/proof for each task.
16. Move only the next actionable item into `current task`.
17. Keep larger future work in backlog grouped by workflow first, then phase/workstream.

## task slicing rules

A good task has:

- one owner;
- one review owner;
- one workflow ID or `CROSS-CUTTING` affected-workflow list;
- one user/business outcome;
- one workflow slice;
- one workstream;
- one primary output;
- required read files;
- exact input;
- exact output;
- allowed write targets;
- forbidden write targets;
- forbidden side effects;
- file ownership group;
- contract references when shared names are touched;
- map references when UI/code/data/raw coordinates are relevant;
- explicit non-goals;
- an ACID check;
- acceptance criteria;
- validation evidence required;
- agent report path;
- evidence path;
- dependency list;
- complexity and delegation labels.

Split a task when:

- it combines unrelated business workflows;
- it touches unrelated workstreams;
- its input or output is vague;
- it requires both decision-making and implementation;
- it cannot be reviewed in one pass;
- it mixes data modeling, UI, security, and release work;
- it is `hard` or `expert` but contains obvious `simple` subparts;
- it fails Atomic, Clear input/output, Idempotent, or Decidable checks.

Create a contract-definition task before implementation when:

- multiple agents or workstreams will touch the same shared name;
- a backend function/API and frontend caller must agree on exact naming;
- CMS aliases or document types will be referenced by code, views, imports, or tests;
- a task would otherwise introduce new shared names without a source-of-truth row.

## example decomposition

Input:

```text
Web project, .NET, Umbraco CMS, frontend design similar to major universities.
```

Possible phase/workstream breakdown:

| Phase | Workstream | Example task | Complexity | Delegation |
| --- | --- | --- | --- | --- |
| 0 | discovery | Define users, goals, sitemap, and reference sites | hard | main-agent |
| 1 | architecture | Choose solution structure and repo docs | hard | main-agent |
| 1 | architecture | Define shared contracts for routes, CMS aliases, components, and service names | hard | main-agent |
| 1 | cms | Design document types and compositions | expert | human-decision-required |
| 1 | data | Define data types and uSync baseline | hard | main-agent |
| 2 | frontend | Define design tokens and component inventory | hard | main-agent |
| 2 | frontend | Build header/footer from approved design | normal | delegate-with-review |
| 2 | cms | Create dropdown/data type configuration | normal | delegate-with-review |
| 3 | frontend | Build news listing/detail templates | normal | delegate-with-review |
| 3 | content | Seed sample content tree | normal | delegate-with-review |
| 4 | security | Define roles, permissions, and editor policy | expert | human-decision-required |
| 5 | testing | Smoke test public pages | simple | delegate-ok |
| 5 | release | Create deployment and rollback checklist | hard | main-agent |

Workflow-first breakdown:

| Workflow ID | Business outcome | First proof | Technical sequence |
| --- | --- | --- | --- |
| WF-HOMEPAGE | Public visitor understands institution identity and next action | homepage route renders approved hero/navigation/content blocks | contracts/maps -> CMS/data -> backend/view model -> UI template -> smoke |
| WF-PROGRAM-DETAIL | Visitor opens a program and sees trusted detail/class information | program detail route returns 200 and required fields render | contracts/maps -> content type/data fields -> service/controller -> Razor template -> data validation |
| WF-NEWS-LISTING | Visitor browses news and opens an article | listing and detail routes return 200 with published content only | contracts/maps -> content query -> listing/detail views -> smoke |
| CROSS-CUTTING-DEPLOY | Site can be deployed and rolled back safely | test server smoke + rollback note | config -> database/media copy -> deployment -> smoke -> rollback |

## output format

When asked to plan a project, produce:

1. Project assumptions and unknowns.
2. Business workflow map.
3. Proposed phases.
4. Workstream/specialist map.
5. Task table with:
   - id;
   - workflow ID;
   - workflow slice;
   - phase;
   - workstream;
   - title;
   - input summary;
   - output summary;
   - dependency;
   - contract dependency;
   - risk lane;
   - complexity;
   - delegation;
   - ACID status;
   - validation.
6. First current task.
7. Decisions needed before coding.

## stop conditions

Stop before coding when:

- project goal or users are unclear;
- source of truth is unclear;
- input or output is unclear;
- stack or repo path is unknown;
- required shared contract is missing;
- a task is not ACID-complete;
- task is `expert` and no decision exists;
- security/migration/data-loss risk is present;
- acceptance criteria are missing.

## anti-patterns

Evidence-backed anti-patterns from LLM-Wiki validation history. Same `The "..." trap` style as [[../wiki/knowledge/project-docs/multi-agent-coordination.md#anti-patterns]].

- **The "TBD input/output" trap** — delegating a task whose input or output is `TBD` without it being an explicit discovery task. The reviewer cannot validate completion and the agent's output never converges. ACID Clear-I/O check is designed to catch this. Evidence: [[../reports/validation/2026-05-19-llm-wiki-task-io.md]] (the task I/O format was codified after vague I/O caused delegation drift).
- **The "one giant task" trap** — collapsing a project request into a single task instead of phases × workstreams × atomic tasks. Atomicity check catches this; if you can name two independent outputs, split. Evidence: example decomposition in this file, plus [[../reports/validation/2026-05-21-task-packet-format.md]].
- **Inventing shared names inside an implementation task** — coding before `docs/contracts.md` has the row. Causes naming drift between layers (backend route ≠ frontend caller, CMS alias ≠ code reference). Always create the contract row first. Evidence: shared-contracts section above; [[../reports/validation/2026-05-21-control-files-rewrite.md]].
- **Delegating `hard` or `expert` tasks directly** — complexity ≥ `hard` defaults to `main-agent` or `human-decision-required`. `delegate-with-review` on `hard` is also wrong; split into smaller `simple`/`normal` tasks first.
- **Mixing decision + implementation in one task** — a task that requires "decide X then build X" must split. The implementation task is blocked-by the decision task. Otherwise the agent silently invents the decision while implementing.
- **Delegated agent rolls up into `docs/tasks.md`** — only main-agent owns rollup. Delegated agents update the agent-owned sections of `agents/<agent>/AGENT.md` per [[../wiki/knowledge/project-docs/agent_local_work.md]] and §8 of [[../llm-wiki-constitution.md]]. Silent rollup overwrites parallel agents' work.
- **Skipping the group contract for parallel work** — two agents on overlapping write targets without an explicit group contract produce conflicts that are resolved by whoever pushed last. Evidence: [[../wiki/knowledge/project-docs/multi-agent-coordination.md]] file-ownership table.
- **Treating risk lane and complexity as the same thing** — `tiny` + `expert` exists (a tiny-blast-radius change that requires expert reasoning). Conflating the two leads to under-reviewed expert work or over-reviewed tiny work.
