# Impact Test: Workflow Route Maintenance Cost

Date: 2026-07-09
Test id: IMPACT-MAINTENANCE-001
Status: pass

## Question

If LLM-Wiki changes a workflow route rule, can `change_impact_map.md` plus the
projection registries identify the affected artifacts without forcing ordinary
U17 implementation agents to read extra governance files?

## Proposed Change Fixture

This is a simulated change. No canonical workflow was edited by this test.

Proposed governance rule:

```text
For durable workflow/source-of-truth/template/contract changes, consult:
  wiki/projects/llm-wiki/docs/change_impact_map.md
  wiki/projects/llm-wiki/docs/workflow_projection_registry.md

Do not add these files to ordinary real-repo implementation read paths.
```

This simulates a route-adjacent change because it affects how agents perform
workflow governance work, but it should not affect normal U17 build, code,
deploy, or content tasks.

## Actors

| actor | role |
| --- | --- |
| Human/integration owner | Approves whether the simulated change should become canonical |
| LLM-Wiki governance evaluator | Runs this impact test and writes LLM-Wiki evidence |
| U17 repo evaluator | Provides repo-local projection evidence when requested |
| Ordinary U17 implementation agent | Not involved; should not receive a longer read path |

## Inputs

- `wiki/projects/llm-wiki/docs/change_impact_map.md`
- `wiki/projects/llm-wiki/docs/workflow_projection_registry.md`
- `/home/admindebian/UniversityWeb-U17/docs/workflow_projection_registry.md`
- `/home/admindebian/UniversityWeb-U17/reports/agent/session-20260709-impact/U17-read-order-no-drift-result.md`
- `/home/admindebian/UniversityWeb-U17/reports/agent/session-20260709-impact/U17-workflow-projection-registry-metadata-cleanup-result.md`
- `workflows/catalog.md`
- `workflows/real-repo-work.workflow.md`
- `templates/agents.template.md`
- `templates/repo_rules.template.md`

## Procedure

### Step 1 - Classify the change

Change type from `change_impact_map.md`:

```text
Workflow route/read-order change
```

Reason: the proposed rule changes the governance read path for workflow changes,
but not the ordinary repo implementation read path.

### Step 2 - Inspect impact map

Read `change_impact_map.md` and select the dependency row for workflow
route/read-order changes.

Expected dependent classes:

- canonical workflow files;
- LLM-Wiki projections;
- real-repo projections;
- experiment/derived artifacts;
- evidence.

### Step 3 - Inspect projection registries

Read:

```text
wiki/projects/llm-wiki/docs/workflow_projection_registry.md
/home/admindebian/UniversityWeb-U17/docs/workflow_projection_registry.md
```

Use these registries to identify named projection instances instead of broad
grep.

### Step 4 - Classify actions

Classify every affected artifact as:

- `must update`;
- `inspect only`;
- `no update`;
- `not applicable`.

### Step 5 - Check U17 ordinary read path

Confirm the simulated governance rule does not require ordinary U17
implementation agents to add:

```text
change_impact_map.md
workflow_projection_registry.md
```

to normal build/code/deploy tasks.

### Step 6 - Record decision

Write this report and update LLM-Wiki validation only if the test result changes
durable direction.

## Impact Classification

| artifact | class | action | reason |
| --- | --- | --- | --- |
| `wiki/projects/llm-wiki/docs/change_impact_map.md` | canonical impact rule | no update | already defines this governance path |
| `wiki/projects/llm-wiki/docs/workflow_projection_registry.md` | projection registry | no update | already lists LLM-Wiki-owned projection instances |
| `/home/admindebian/UniversityWeb-U17/docs/workflow_projection_registry.md` | repo-local projection registry | updated | `PROJ-U17-SESSION-START` metadata now aligned to no-drift evidence |
| `workflows/catalog.md` | canonical workflow selector | inspect only | no route selector change needed |
| `workflows/real-repo-work.workflow.md` | canonical workflow card | inspect only | ordinary real-repo route remains unchanged |
| `harness/read-workflow.md` | detailed read procedure | inspect only | no detailed procedure change required for this simulated rule |
| `templates/agents.template.md` | bootstrap projection | inspect only | avoid copying governance-only read path into ordinary repo agents |
| `templates/repo_rules.template.md` | bootstrap projection | inspect only | avoid ordinary read-path growth |
| `/home/admindebian/UniversityWeb-U17/AGENTS.md` | repo projection | no update | ordinary U17 route remains correct |
| `/home/admindebian/UniversityWeb-U17/REPO_RULES.md` | repo projection | no update | ordinary U17 route remains correct |
| `/home/admindebian/UniversityWeb-U17/TICK.md` | repo projection | no update | ordinary U17 route remains correct |
| `/home/admindebian/UniversityWeb-U17/agents/OPERATING_GUIDE.md` | repo projection | no update | ordinary U17 route remains correct |
| `/home/admindebian/UniversityWeb-U17/docs/session_start.md` | repo projection | no update | no-drift report found route-level alignment |
| `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/contracts/*.json` | experiment-derived | inspect only | no contract promotion or required-read change |
| `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/templates/empirical-evaluation-report.template.md` | experiment template | already updated | taxonomy now handles `registry metadata stale` |
| `wiki/projects/llm-wiki/docs/test_matrix.md` | evidence rollup | must update | this test adds durable evidence |
| `reports/validation/README.md` | evidence catalog | must update | this test adds validation evidence |
| `TICK.md` / `active.md` / `current_direction.md` | live state | must update | current direction changes after test completion |

## Cost Count

| action | count |
| --- | ---: |
| must update | 4 |
| already updated by paired cleanup | 2 |
| inspect only | 7 |
| no update | 6 |

Interpretation:

- The only repo-local content update needed was registry metadata, not ordinary
  U17 read-order docs.
- The simulated governance rule should not be copied into `AGENTS.md`,
  `REPO_RULES.md`, `TICK.md`, or `agents/OPERATING_GUIDE.md`.
- The maintenance cost is acceptable only because the rule is kept in
  LLM-Wiki governance files and registries, not pushed into every repo entry
  path.

## Result

Pass.

`change_impact_map.md` and the projection registries are enough for this manual
maintenance-cost evaluation. A checker is not justified yet.

## Decision

Keep current approach:

- ordinary implementation agents do not read Change Impact Map or projection
  registries by default;
- workflow/source-of-truth/template/contract governance agents do read them;
- repo-local registries may be checked by assigned read-only evaluator sessions;
- do not promote workflow contracts or build a checker until more real drift or
  repeated maintenance misses appear.

## Follow-Up

- If future workflow changes require repeated manual registry checks across
  multiple repos, revisit a tiny checker that only reads projection registry
  rows.
- If a repo copies full route text in many files, prefer replacing copies with
  pointers to canonical workflow docs.

