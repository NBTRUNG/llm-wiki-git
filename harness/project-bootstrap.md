# project bootstrap

Use this workflow when turning a new idea into a pre-repo project inside LLM-Wiki.

## purpose

Project bootstrap creates a standard source-of-truth folder before a separate repo exists.

It prevents:

- scattered planning notes;
- missing status/tasks/decisions files;
- mixing compiled wiki summaries with editable source-of-truth docs;
- forgetting migration rules when a repo is created later.

## source of truth

Before a repo exists:

```text
wiki/projects/<project>/
```

is the project source of truth.

After a repo exists and migration is complete:

```text
<project-repo>/
```

is the source of truth, and LLM-Wiki keeps:

```text
projects/<ProjectName>/<ProjectName>.md # minimal pointer only
```

Agent Platform owns raw/evidence runtime for both pre-repo pilots and real
repos. When a project becomes repo-backed, create or record a project namespace:

```text
/home/admindebian/Agent-Platform/raw/projects/<project-id>/
```

The real repo may keep source inventory pointers to that namespace, but raw
snapshots, extracted indexes, WAP proposals, and audit logs do not move into the
repo. Do not keep migrated project source-of-truth docs under
`wiki/projects/<project>/`.

## required inputs

- Project id, lowercase kebab-case.
- Project name.
- Owner.
- Project phase.
- Current goal or problem.
- Known scope and non-goals.
- Known stack, or `unknown`.
- Whether a repo already exists.
- Raw namespace under `/home/admindebian/Agent-Platform/raw/projects/<project-id>/`,
  or `unknown` until the project id is accepted.
- Initial project orientation, or `unknown`:
  - primary design driver;
  - secondary drivers;
  - code organization;
  - delivery strategy;
  - first proof required.

If a value is missing, write `unknown`; do not invent it.

## create structure

For a pre-repo project, create the core source-of-truth set:

```text
wiki/projects/<project>/
  project_manifest.md
  docs/
    project_brief.md
    project_orientation.md
    project_status.md
    human_workflow.md
    contracts.md
    implementation_plan.md
    tasks.md
    decisions.md
    test_matrix.md
    agent_status.md
  wiki/
    architecture.md
```

Use templates:

| Output | Template |
| --- | --- |
| `project_manifest.md` | `templates/project_manifest.template.md` |
| `docs/project_brief.md` | `templates/project_brief.template.md` |
| `docs/project_orientation.md` | `templates/project_orientation.template.md` |
| capability profile skeleton when agents differ materially | `templates/agent_capability_profile.template.md` |
| `docs/project_status.md` | `templates/project_status.template.md` |
| `docs/human_workflow.md` | `templates/human_workflow.template.md` |
| `docs/contracts.md` | `templates/contracts.template.md` |
| `docs/implementation_plan.md` | `templates/implementation_plan.template.md` |
| `docs/tasks.md` | `templates/tasks.template.md` |
| `docs/decisions.md` | `templates/decisions.template.md` |
| `docs/test_matrix.md` | `templates/test_matrix.template.md` |
| `docs/agent_status.md` | `templates/agent_status.template.md` |
| `wiki/architecture.md` | `templates/architecture.template.md` |

Use `docs/agent_status.md` when work involves multiple agents; otherwise create it with `unknown` or `not used yet`.

For a repo-backed project, seed files by tier. Do not create every possible
file for every repo; choose the smallest tier set that matches the project.

### human operator core

Create for every new repo-backed project, whether or not AI agents will be
used:

| Output | Template |
| --- | --- |
| `HUMAN.md` | `templates/human_workflow.template.md` |

`README.md` must identify `HUMAN.md` as the single manual operator entrypoint.
Existing repos may retain an established equivalent filename when the README
declares it explicitly. Follow
`../wiki/knowledge/project-docs/human_workflow.md`; never put real secrets in
the file. Include exact access, start/status/stop/smoke steps, bootstrap access
and rotation, persistent storage meaning, test/runbook pointers, destructive
warnings, and recovery/escalation. Use `unknown` rather than inventing facts.

### repo agent core

Create for any repo expected to use AI agents for implementation/review:

| Output | Template |
| --- | --- |
| `AGENTS.md` | `templates/agents.template.md` |
| `REPO_RULES.md` | `templates/repo_rules.template.md` |
| `LEAD_STATE.md` or legacy Lead state file | `templates/lead_state.template.md` |
| `docs/session_start.md` | `templates/session_start.template.md` |
| `docs/knowledge_lookup_metric.md` | `templates/knowledge_lookup_metric.template.md` |
| `docs/code_map.md` | `templates/code_map.template.md` |
| `docs/project_orientation.md` | `templates/project_orientation.template.md` |

`REPO_RULES.md` must include short operating capsules. Agents receive them only
through the capability projection assigned by the task. For actual coding,
repo files point eligible `P2` agents to the canonical Coding Pack and require
lower tiers to use an approved task-named projection that preserves mandatory
security/output/test/boundary/stop rules.

`AGENTS.md` and `REPO_RULES.md` must include a LLM-Wiki Knowledge Pack Gate:

- Repo Base Pack is required for every session.
- Capability fit is checked before packs: unrated/expired=`C0`, no
  self-upgrade, stop/handoff on task or projection mismatch.
- Coding Pack is required directly or through a validated projection for
  code-facing work.
- Security Baseline is always part of Coding Pack.
- Web/UI, Contracts, Data Map, Data Knowledge, Algorithms/Math, Architecture,
  Operations, and Security Deep packs are trigger-based.
- Result reports must record packs loaded and LLM-Wiki knowledge effectiveness
  using `wiki/knowledge/project-docs/knowledge_effectiveness.md`.

`docs/project_orientation.md` records the project's design driver, guide pack,
and first proof. It must be accepted before broad implementation planning.

`AGENTS.md` should include a short non-secret Data Quickstart when the project
has any database, CMS, import/export, reporting, migration, or external data
source. The quick card names environment/database/provider/safety pointers only;
it does not replace `docs/data_map.md`.

Data knowledge lives in `wiki/knowledge/data/`. Project docs should link to it
by trigger only. Do not copy the Data Knowledge Pack into each repo.

Algorithm/math knowledge lives in `wiki/knowledge/algorithms/`. Project docs
should link to it by trigger only. Do not copy the Algorithms Pack into each
repo.

### multi-agent tier

Create when more than one agent may work in parallel or when a human directly
orchestrates multiple agents:

| Output | Template |
| --- | --- |
| `docs/agent_status.md` | `templates/agent_status.template.md` |
| `docs/agent_work_plan.md` | `templates/agent_work_plan.template.md` |
| `agents/<agent>/AGENT.md` | `templates/agent_role_card.template.md` |
| `reports/agent/<agent>/` | directory only |
| `reports/integration/` | directory only |

Legacy split-file projects may also create `agents/<agent>/tasks.md`,
`agents/<agent>/status.md`, and `agents/<agent>/tasks_archive.md`, but new
projects should prefer one `agents/<agent>/AGENT.md` control card.

### UI-heavy tier

Create when the project has substantial public UI, admin UI, design-system work,
route ownership ambiguity, duplicate view files, or multiple agents touching UI:

| Output | Template |
| --- | --- |
| `docs/design_system.md` | `templates/design_system.template.md` |
| `ui_map/_GLOBAL.md` | `templates/ui_map_global.template.md` |
| `ui_map/_CONTRACTS.md` | `templates/ui_map_contracts.template.md` |
| `ui_map/_INDEX.md` | `templates/ui_map_index.template.md` |
| `ui_map/_UI_ROUTER.md` | `templates/ui_map_router.template.md` |
| `ui_map/_UI_WORKFLOW.md` | `templates/ui_map_workflow.template.md` |
| `ui_map/group-<name>.md` | `templates/ui_map_group.template.md` |

Declare one canonical UI contract registry. If `ui_map/_CONTRACTS.md` owns UI
contracts, do not keep duplicate editable UI contracts in `docs/contracts.md`.

### data/workflow map tier

Create when the project has a database, CMS, data import/export, reporting,
migration/backfill work, or backend workflows where agents need to trace code
to data without broad search:

| Output | Template |
| --- | --- |
| `docs/data_map.md` | `templates/data_map.template.md` |
| `docs/database_inventory.md` | `templates/database_inventory.template.md` |

`docs/data_map.md` is the working map. It should be workflow-first and contain
only the active data surface: business workflow -> UI/code map IDs -> logical
entity/table/content type -> field mappings -> raw verification pointer.

`docs/database_inventory.md` is the long/raw schema reference. It may be
generated or partial. Agents do not read it by default; they open only the
anchor named by `docs/data_map.md` or the task packet.

For very large databases, tier tables instead of listing every table in the
working map:

- Tier 0: environment/provider/safety quick card in `AGENTS.md`;
- Tier 1: active workflow entities/tables/content types in `docs/data_map.md`;
- Tier 2: lookup/reference tables used by active workflows;
- Tier 3: audit/archive/import/history tables only when task-relevant;
- Tier 4: system/vendor/generated tables in `docs/database_inventory.md` only.

Maps may point to LLM-Wiki knowledge only by trigger. Example: data schema
changes point to `wiki/knowledge/contracts/data-contracts.md`; migration or
backfill points to `wiki/knowledge/operations/rollback.md`; sensitive data
points to `wiki/knowledge/coding/security-baseline.md`. These pointers are not
default reads.

Use the LLM-Wiki Data Knowledge Pack for cross-project data decisions:

- `wiki/knowledge/data/database-selection.md` when selecting or changing
  database/storage;
- `wiki/knowledge/data/data-modeling.md` when designing important entities,
  tables, CMS content types, documents, DTOs, imports, or exports;
- `wiki/knowledge/data/data-architecture-governance.md` when ownership,
  source-of-truth, analytics, lake/warehouse/lakehouse, or data-product
  governance changes;
- `wiki/knowledge/data/migrations-operations.md` when migration, backfill,
  restore, import, or data repair risk exists;
- `wiki/knowledge/data/performance-scale.md` when query/index/cache/replica,
  partitioning, or scale posture changes.

### backlog/archive tier

Create only when the project needs them:

| Output | When |
| --- | --- |
| `docs/tasks_future.md` | accepted backlog is too large for `docs/tasks.md` |
| `docs/tasks_archive.md` | accepted task history needs rotation |
| `reports/validation/` | validation evidence will be stored in repo |
| `reports/daily/` | daily multi-agent rollups are used |

## workflow

1. Read `index.md`.
2. Read `llm-wiki-constitution.md` if source-of-truth or migration is involved.
3. Confirm whether the project is pre-repo or already has a repo.
4. Create the pre-repo folder only when no repo source of truth exists.
5. Read `../wiki/knowledge/project-docs/README.md` and the quality guide
   for each document type before filling its template:
   - `project_brief.md` → `../wiki/knowledge/project-docs/project_brief.md`
   - `project_orientation.md` → `../wiki/knowledge/project-docs/project_orientation.md`
   - `human_workflow.md` or repo `HUMAN.md` →
     `../wiki/knowledge/project-docs/human_workflow.md`
   - `tasks.md` → `../wiki/knowledge/project-docs/tasks.md`
   - `test_matrix.md` → `../wiki/knowledge/project-docs/test_matrix.md`
   - `data_map.md` → `../wiki/knowledge/project-docs/data_map.md`
   - data/database decisions → `../wiki/knowledge/data/README.md`
   - algorithm/math decisions → `../wiki/knowledge/algorithms/README.md`
   - (and the matching guide for every other doc being created)
6. Before accepting `docs/project_orientation.md`, answer the pre-project
   questions and choose:
   - primary design driver;
   - secondary drivers;
   - code organization;
   - delivery strategy;
   - first proof required;
   - selected guide pack.
7. If orientation depends on volatile guidance such as deployment/runtime,
   frontend rendering, CMS/headless, security, AI/agents, testing, or
   observability, check `research/watchlist.md` and
   `harness/research-intake-loop.md`; read or create a relevant research brief
   before finalizing orientation.
8. Populate files from templates with known facts, following the quality
   criteria and avoiding anti-patterns from the guides above.
9. Mark missing facts as `unknown`.
10. If the project is broad, use `task-decomposition.md` to fill
    `docs/implementation_plan.md` from business workflows first, then technical
    workstreams.
11. Fill `docs/contracts.md` with known shared names, or mark unknown/proposed contracts explicitly.
12. Add first task and acceptance criteria.
13. For code tasks, add workflow ID, affected workflows when cross-cutting,
    workflow slice, user/business outcome, metadata, dependencies, contract/map
    references, required read files, exact input/output, write boundaries, ACID
    checks, acceptance criteria, and evidence paths in `docs/tasks.md`.
14. Add initial decision if the project phase/source-of-truth choice, orientation, or deployment model matters.
15. Add test matrix rows for the first useful behaviors or proof obligations.
16. Update `wiki/index.md` if the project should appear in compiled active projects.
17. For repo-backed projects, create the matching tier files above:
   - human operator core for every new repo;
   - agent core for AI-coded repos;
   - multi-agent tier when parallel/human-orchestrated work is expected;
   - UI-heavy tier when route/workflow/design-system ownership matters.
   - data/workflow map tier when database/CMS/import/reporting/migration
     ownership matters.
18. Create a validation report when the bootstrap matters for future work.

## validation

Minimum checks:

- Standard files exist.
- The project has one human operator entrypoint: pre-repo
  `docs/human_workflow.md`, or repo `HUMAN.md`/a README-declared equivalent.
- The human entrypoint contains exact access, start/status/stop/smoke,
  bootstrap-access/rotation, persistent-data meanings, manual test, destructive
  boundary, and recovery pointers, or marks unknown facts `unknown`.
- The human entrypoint contains no real secret and does not instruct direct
  editing of persistent volume contents.
- Each file follows its quality guide in `wiki/knowledge/project-docs/`.
- `docs/project_brief.md` has non-goals, not just goals.
- `docs/project_orientation.md` has primary design driver, secondary drivers,
  code organization, delivery strategy, first proof required, selected guide
  pack, rejected orientations, and research freshness status.
- `docs/tasks.md` has at least one executable task with ACID check,
  exact input, and exact output.
- Missing facts are marked `unknown`, not left blank.
- `project_manifest.md` identifies source of truth.
- `docs/project_status.md` has metadata, current state, active tasks, next steps, latest validation, risks/blockers, recent decisions, notes for next agent, and change log.
- `docs/contracts.md` exists and lists known shared names or marks them `unknown`.
- `docs/implementation_plan.md` exists for broad projects, even if early sections are `unknown`.
- Broad implementation plans define business workflow IDs and first proofs
  before technical workstreams, or explicitly mark the project as
  cross-cutting-only.
- `docs/tasks.md` has one current task or explicitly says none.
- Each executable task has clear input and output.
- Each executable implementation task has a workflow ID, workflow slice,
  user/business outcome, and map references or an explicit `none`.
- The first implementation task matches the selected project orientation or
  records why it deliberately deviates.
- Code implementation tasks reference `docs/contracts.md` when they touch shared names.
- Data/backend/migration/import/reporting tasks reference `docs/data_map.md`
  and only open `docs/database_inventory.md` by named anchor when raw schema or
  query verification is needed.
- Tasks intended for delegation pass Atomic, Clear input/output, Idempotent, and Decidable checks.
- New/renewed delegated normal/high-risk tasks declare minimum capability tier,
  required dimensions, assigned projection, autonomy, verifier, reviewer,
  evidence, and fallback; the assigned agent fits component-wise.
- `docs/decisions.md` records any source-of-truth or scope decision.
- `docs/test_matrix.md` does not mark behavior implemented without evidence.
- `wiki/architecture.md` exists, even if many fields are `unknown`.
- `docs/agent_status.md` exists or the project explicitly says multi-agent tracking is not used yet.
- Repo-backed AI projects have `AGENTS.md`, `REPO_RULES.md`, Lead state, `docs/session_start.md`, `docs/knowledge_lookup_metric.md`, and `docs/code_map.md`, or explicitly document why a file is not used.
- `AGENTS.md` and `REPO_RULES.md` contain a LLM-Wiki Knowledge Pack Gate:
  capability fit before pack loading, Repo Base for every session, canonical or
  validated projected Coding Pack for code-facing sessions,
  trigger-based specialist packs, and Knowledge Effectiveness report fields.
- `REPO_RULES.md` contains task-type operating capsules and capability-aware
  Coding Pack rules so mandatory safety/evidence constraints survive every
  projection without forcing low-tier agents into a high-tier read flow.
- UI-heavy projects declare canonical UI contracts, route map, workflow map, and group maps, or explicitly document why `ui_map/` is not used.
- Data-heavy or data-touching projects have a non-secret Data Quickstart,
  `docs/data_map.md`, and a raw inventory pointer, or explicitly document why
  data maps are not used.

## done criteria

- Source-of-truth path is unambiguous.
- Missing facts are marked `unknown`.
- Current task and next step are clear.
- Migration rule is recorded.
- Validation report exists or a reason is given for not creating one.
- A human can find the entrypoint from `README.md` and safely reach, inspect,
  stop, restart, smoke-test, and locate recovery guidance without an agent.

## non-goals

- Do not create a code repo unless the user asks.
- Do not migrate legacy project docs as part of bootstrap.
- Do not copy source-of-truth docs into a repo and leave editable duplicates behind.
