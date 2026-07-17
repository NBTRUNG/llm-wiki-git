---
type: Change Impact Map
project: LLM-Wiki
status: active
date_updated: 2026-07-17
---

# Change Impact Map

Use this map when a durable LLM-Wiki workflow, source-of-truth, routing,
template, contract, or validation rule changes.

This is not a navigation index. It is an impact map: it tells agents which
downstream artifacts may need inspection after a change.

Use `workflow_projection_registry.md` after this map when you need named
projection instances. The impact map defines the rule; the projection registry
lists known LLM-Wiki-owned instances. Real repo projection registries live in
the real repo.

## Model

LLM-Wiki changes move through four artifact classes:

| class | meaning | examples | update rule |
| --- | --- | --- | --- |
| Canonical | source of truth for behavior | `workflows/*.workflow.md`, `harness/*.md`, `wiki/knowledge/**`, project docs | update first after approval |
| Projection | copied or summarized route/rule in another place | repo `AGENTS.md`, `REPO_RULES.md`, `TICK.md`, operating guides, templates | inspect for drift when canonical changes |
| Derived | generated or machine-readable representation | Agent Platform extracted JSONL, workflow contracts, future checkers | regenerate or mark stale |
| Evidence | proof that the rule works | validation reports, result reports, fixtures, test matrix | add or update evidence after durable change |

Most errors happen when canonical files change but projections are not checked.

## Impact Discovery Procedure

1. Identify the changed artifact class.
   Classify each changed file as canonical, projection, derived, or evidence.

2. Name the change type.
   Use the table below. If no row fits, add a row before continuing.

3. Inspect direct dependents.
   Read only the files named by the relevant row. Do not broad-grep the wiki
   unless the direct row is incomplete.

4. Check known projection rows.
   Use `workflow_projection_registry.md` for LLM-Wiki-owned projections. For
   real repos, inspect the repo-local projection registry when present.

5. Check cross-project projections.
   If the change affects real-repo start routes, inspect active repo entry
   docs that copied the route.

6. Decide update mode.
   Use one of:

   - no downstream update needed;
   - update projection;
   - regenerate derived artifact;
   - add validation evidence;
   - checkpoint with human because blast radius is unclear.

7. Record evidence.
   Durable LLM-Wiki changes update `tasks.md`, `test_matrix.md`,
   `reports/validation/README.md`, and `TICK.md` when live direction changes.

## Change Types

| change type | trigger files | inspect these dependents | validation |
| --- | --- | --- | --- |
| Workflow route/read-order change | `workflows/catalog.md`, `workflows/*.workflow.md`, `harness/read-workflow.md` | `index.md`, `TICK.md`, `wiki/projects/llm-wiki/docs/current_direction.md`, `wiki/projects/llm-wiki/docs/project_index.md`, `templates/agents.template.md`, `templates/repo_rules.template.md`, repo `AGENTS.md`, repo `REPO_RULES.md`, repo `TICK.md`, repo operating guides, workflow-contract fixtures | read-order drift test; link/lint; validation report |
| Workflow behavior change | `workflows/*.workflow.md` | `workflows/README.md`, `workflows/catalog.md`, relevant `harness/*.md`, `wiki/knowledge/project-docs/agent_session_packs.md`, templates that mention the workflow, workflow contracts | targeted workflow review; lint; test matrix row |
| Human workflow projection, project operator entrypoint, or recovery route change | `human/*.md`, `RECOVERY.md`, `workflows/manual-recovery.workflow.md`, `human_workflow.md` | `workflows/catalog.md`, `workflows/README.md`, `workflows/session-start.workflow.md`, `workflows/session-closeout.workflow.md`, `harness/read-workflow.md`, `harness/project-bootstrap.md`, `templates/human_workflow.template.md`, `templates/agents.template.md`, `templates/agent_result_report.template.md`, `index.md`, repo `README.md`, repo `HUMAN.md` or declared equivalent, owner-specific runbook pointers | one-to-one workflow link check; human start/status/stop/smoke/storage/recovery review; link/lint; validation report; no automatic old-repo backfill |
| Bounded Change Fast Path change | `bounded_change_fast_path.md`, `workflows/real-repo-work.workflow.md` | `harness/task-packet.md`, bounded-change profile template, repo-rules/task/result templates, repo-owned profiles when explicitly rolled out | entry/escalation/evidence review; targeted-read/report fields; no automatic repo backfill |
| Source-of-truth boundary change | `source_of_truth_rules.md`, `llm-wiki-constitution.md`, `program.md`, Agent Platform pointer docs | `index.md`, `TICK.md`, `project_index.md`, `source_inventory.md`, `workflow_map.md`, `data_map.md`, `change_queue.md`, `/home/admindebian/Agent-Platform/README.md`, repo entry docs if boundary affects repos | source-of-truth proposal or explicit approval; validation report |
| Project map/navigation change | `index.md`, `project_index.md`, directory `README.md`, `navigation_maps.md` | parent/child maps, `wiki/index.md`, templates for maps, validation link catalog | link lint; manual path check |
| Knowledge pack routing change | `agent_session_packs.md`, knowledge pack `README.md`, coding/security/frontend/etc. guides | `harness/read-workflow.md`, templates `agents.template.md`, `repo_rules.template.md`, `agent_result_report.template.md`, repo `AGENTS.md` if pack routing is copied | pack-loading report field check; validation report |
| Agent recommendation/trade-off contract change | `global-rules.md`, `wiki/knowledge/math/README.md`, `wiki/knowledge/coding/output-quality.md` | `wiki/knowledge/math/functions-rates-and-measurement.md`, `wiki/knowledge/project-docs/agent_session_packs.md`, `templates/agent_result_report.template.md`, active repo projections only when rollout is explicitly requested | verify objective/baseline/pros/cons/uncertainty/sensitivity fields; validation report |
| Agent capability/autonomy contract change | `agent_capability_tiers.md`, `agent_session_packs.md`, `harness/read-workflow.md`, `harness/task-packet.md` | `workflows/session-start.workflow.md`, `workflows/real-repo-work.workflow.md`, capability-calibration workflow, `templates/agents.template.md`, `templates/repo_rules.template.md`, `templates/agent_role_card.template.md`, `templates/agent_result_report.template.md`, `templates/session_start.template.md`, `agent_local_work.md`, `multi-agent-coordination.md`, active repo projections only when rollout is explicitly requested | verify unrated=`C0`, no-self-upgrade, component-wise task fit, projection ceiling, stop/handoff, template fields, and validation report |
| Template contract change | `templates/*.template.md` | harness docs that reference the template, knowledge guidance that explains it, active repos created from the template if rollout is requested | template diff review; no automatic repo backfill without approval |
| Validation/test-matrix rule change | `test_matrix.md`, `validation_report.template.md`, `reports/validation/README.md` | Agent Platform auditor map/script, `source_inventory.md`, `data_map.md`, validation reports that are used as fixtures | auditor run or manual evidence consistency check |
| Workflow-contract experiment change | `experiments/workflow-contracts-v0/**` | canonical workflow cards, experiment fixtures, empirical report template, limitations/mitigations, current direction if decision changes | empirical procedure; TP/TN/FP/FN classification |
| Agent Platform runtime change | `/home/admindebian/Agent-Platform/**`, `agent-platform/README.md` | `source_inventory.md`, `workflow_map.md`, `data_map.md`, `source_of_truth_rules.md`, validation reports for platform/auditor scope | platform smoke/auditor command; no canonical wiki edit from derived output without approval |

## Read-Order Route Dependency

When real-repo read order changes, inspect this dependency chain:

```text
canonical route:
  workflows/catalog.md
  workflows/real-repo-work.workflow.md
  harness/read-workflow.md when detailed rules change

LLM-Wiki projections:
  index.md
  TICK.md
  wiki/projects/llm-wiki/docs/current_direction.md
  wiki/projects/llm-wiki/docs/project_index.md
  templates/agents.template.md
  templates/repo_rules.template.md

real-repo projections:
  <repo>/AGENTS.md
  <repo>/REPO_RULES.md
  <repo>/TICK.md
  <repo>/agents/OPERATING_GUIDE.md or equivalent
  <repo>/docs/session_start.md when present

experiment/derived artifacts:
  workflow-contract JSON
  workflow-contract fixtures
  empirical evaluation report template

evidence:
  repo result report
  LLM-Wiki validation report
  test_matrix.md
```

If an artifact copies the route, it must be checked for drift. If it only links
to the canonical workflow, no content update is needed unless the link moved.

## Source-Of-Truth Boundary Dependency

When ownership changes between LLM-Wiki, a real repo, and Agent Platform,
inspect this chain:

```text
canonical rule:
  llm-wiki-constitution.md
  source_of_truth_rules.md
  program.md

LLM-Wiki maps:
  index.md
  TICK.md
  project_index.md
  source_inventory.md
  workflow_map.md
  data_map.md
  change_queue.md

Agent Platform:
  /home/admindebian/Agent-Platform/README.md
  /home/admindebian/Agent-Platform/maps/*.json
  /home/admindebian/Agent-Platform/gateway/*.py

repo projections:
  repo AGENTS/REPO_RULES/TICK when the boundary affects repo state or raw data
```

Boundary changes require explicit human/integration-owner approval unless the
current user instruction directly authorizes the change.

## Decision Rules

- Prefer links over copied rule text.
- Treat `human/` as a projection: it may summarize identity, purpose, questions,
  and links, but must not become agent execution authority.
- If copied rule text exists, include it in the impact map row.
- If one small canonical change requires more than three projection updates,
  consider replacing copied text with a pointer.
- Do not build a checker until the manual map catches at least one real drift
  and one no-drift case without excessive overhead.
- When impact is unclear, stop with a human checkpoint instead of broad grep.
