---
type: Workflow Projection Registry
project: LLM-Wiki
status: active
date_updated: 2026-07-17
---

# Workflow Projection Registry

This registry lists known LLM-Wiki-owned projections of workflow routes and
workflow-adjacent rules.

It is not the source of truth for real repo state. Real repo projection
registries, when used, live in the real repo.

Use this file to speed up impact analysis after reading
`change_impact_map.md`. The impact map explains which artifact classes to
inspect; this registry names known LLM-Wiki-owned instances.

## Rules

- Canonical workflow rules remain in `workflows/` and `harness/`.
- This registry records projection instances and last evidence only.
- Do not treat a registry row as proof that every real repo is aligned.
- For real repo projection state, inspect the repo-local registry/report.
- If a projection copies route text instead of linking to canonical workflow,
  it must be checked after route changes.

## Baselines

| baseline id | canonical source | summary | status |
| --- | --- | --- | --- |
| WF-BASE-REAL-REPO-PHASE1 | `workflows/catalog.md`; `workflows/real-repo-work.workflow.md` | Real repo work starts at repo `AGENTS.md`, routes through the workflow catalog and real-repo workflow card, then returns to repo source-of-truth files. | active |
| WF-BASE-BUGFIX-FUNNEL | `workflows/bug-fix-investigation.workflow.md` | Bug work anchors a concrete failure, localizes scope, states hypotheses, runs bounded probes, and verifies against the original failure. | active |
| WF-BASE-CHANGE-IMPACT | `wiki/projects/llm-wiki/docs/change_impact_map.md` | Durable workflow/source-of-truth/template/contract changes use the impact map to find downstream projections, derived artifacts, and evidence. | active |
| WF-BASE-CAPABILITY-ROUTING | `wiki/knowledge/project-docs/agent_capability_tiers.md`; `workflows/agent-capability-calibration.workflow.md`; `harness/task-packet.md` | Frozen configuration gets a Lead/human-assigned `C0-C6` envelope and `P0-P2` projection; unrated/expired=`C0`, no self-upgrade, and task mismatch stops/hands off. | active |
| WF-BASE-AGENT-DELIVERY | `wiki/knowledge/project-docs/agent_delivery_workflow.md`; `wiki/decisions/DEC-0003-agent-delivery-workflow.md` | Evidence, Approval, Knowledge, Guidance, Orchestration, and Execution form the canonical six-layer Agent Delivery Workflow; shared guidance stays in LLM-Wiki and repo-specific workflows stay in real repos. | active |
| WF-BASE-HUMAN-RECOVERY | `workflows/catalog.md`; `workflows/manual-recovery.workflow.md`; `harness/read-workflow.md`; `wiki/decisions/DEC-0004-human-projection-and-manual-recovery.md` | Agents self-route and disclose the workflow at handoff; humans get a linked, noncanonical map and a safe manual-recovery route. | active |
| WF-BASE-PROJECT-HUMAN-OPERATIONS | `wiki/knowledge/project-docs/human_workflow.md`; `harness/project-bootstrap.md`; `workflows/project-bootstrap.workflow.md` | Every new project gets one project-owned manual operator entrypoint with exact safe access/lifecycle/storage/test/recovery guidance and no real secrets. | active |
| WF-BASE-BOUNDED-CHANGE | `wiki/knowledge/project-docs/bounded_change_fast_path.md`; `workflows/real-repo-work.workflow.md`; `wiki/decisions/DEC-0005-bounded-change-fast-path.md` | One shared fast-path invariant composes with thin repo-owned profiles; risk/uncertainty escalates to the full or specialist route. | active |
| WF-BASE-CONTEXT-BUDGET-PILOT | `wiki/knowledge/project-docs/work_unit_context_budget.md` | Provider counters remain semantically separate; work-unit boundaries write file-backed checkpoints; `150k/300k` are measured pilot signals, not canonical limits or runtime enforcement. | pilot |
| WF-BASE-CODEBASE-NAVIGATION | `wiki/knowledge/project-docs/codebase_navigation.md`; `wiki/knowledge/project-docs/bounded_change_fast_path.md` | Stable semantic IDs/comments plus exact search replace manual offsets; deployed backfill is bounded/comment-only; indexing needs repeated measured failures and explicit ownership/operations evidence. | active |
| WF-BASE-P1-BOUNDED-CODING | `wiki/knowledge/coding/bounded-coding-core.md`; `wiki/knowledge/project-docs/agent_session_packs.md`; `wiki/knowledge/project-docs/agent_capability_tiers.md`; `wiki/decisions/DEC-0006-p1-bounded-coding-projection.md` | Qualified C2-C3 bounded coding uses one cross-repo P1 safety/output/test floor; repo profiles are coordinates; partial full-pack reads are not a complete projection/full load. | active |

## LLM-Wiki Projection Rows

| projection id | baseline id | projection file | projection type | copied or linked | last checked | status | evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| PROJ-LLMWIKI-TICK-REAL-REPO | WF-BASE-REAL-REPO-PHASE1 | `TICK.md` | live coordination rule | copied summary | 2026-07-09 | aligned | `reports/validation/2026-07-09-change-impact-map.md` |
| PROJ-LLMWIKI-CURRENT-DIRECTION | WF-BASE-CHANGE-IMPACT | `wiki/projects/llm-wiki/docs/current_direction.md` | current direction summary | linked summary | 2026-07-09 | aligned | `reports/validation/2026-07-09-change-impact-map.md` |
| PROJ-LLMWIKI-PROJECT-INDEX | WF-BASE-CHANGE-IMPACT | `wiki/projects/llm-wiki/docs/project_index.md` | project map | linked | 2026-07-09 | aligned | `reports/validation/2026-07-09-change-impact-map.md` |
| PROJ-LLMWIKI-AGENTS-TEMPLATE | WF-BASE-REAL-REPO-PHASE1 | `templates/agents.template.md` | repo bootstrap template | copied pattern | pending | unchecked | future template impact review |
| PROJ-LLMWIKI-REPO-RULES-TEMPLATE | WF-BASE-REAL-REPO-PHASE1 | `templates/repo_rules.template.md` | repo bootstrap template | copied pattern | pending | unchecked | future template impact review |
| PROJ-LLMWIKI-CONTRACT-REAL-REPO | WF-BASE-REAL-REPO-PHASE1 | `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/contracts/real-repo-work.contract.json` | experiment-derived contract | copied structure | 2026-07-09 | experiment-only | `reports/validation/2026-07-09-workflow-contract-pilot.md` |
| PROJ-LLMWIKI-CONTRACT-BUGFIX | WF-BASE-BUGFIX-FUNNEL | `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/contracts/bug-fix-investigation.contract.json` | experiment-derived contract | copied structure | 2026-07-09 | experiment-only | `reports/validation/2026-07-09-workflow-contract-pilot.md` |
| PROJ-LLMWIKI-IMPACT-TEST-U17-DRIFT | WF-BASE-CHANGE-IMPACT | `wiki/projects/llm-wiki/docs/impact-tests/2026-07-09-read-order-route-impact.md` | empirical fixture | copied fixture facts | 2026-07-09 | aligned | `reports/validation/2026-07-09-change-impact-map.md` |
| PROJ-LLMWIKI-IMPACT-TEST-MAINTENANCE | WF-BASE-CHANGE-IMPACT | `wiki/projects/llm-wiki/docs/impact-tests/2026-07-09-workflow-route-maintenance-cost.md` | empirical fixture | copied fixture facts | 2026-07-09 | aligned | `reports/validation/2026-07-09-workflow-route-maintenance-cost.md` |
| PROJ-LLMWIKI-CAPABILITY-AGENTS-TEMPLATE | WF-BASE-CAPABILITY-ROUTING | `templates/agents.template.md` | repo entry capability gate | copied rule | 2026-07-10 | aligned | `reports/validation/2026-07-10-agent-capability-tier-routing.md` |
| PROJ-LLMWIKI-CAPABILITY-ROLE-CARD | WF-BASE-CAPABILITY-ROUTING | `templates/agent_role_card.template.md` | Lead-owned capability note | copied contract | 2026-07-10 | aligned | `reports/validation/2026-07-10-agent-capability-tier-routing.md` |
| PROJ-LLMWIKI-CAPABILITY-TASK-PACKET | WF-BASE-CAPABILITY-ROUTING | `templates/tasks.template.md`; `harness/task-packet.md` | task minimum/projection/autonomy gate | copied contract | 2026-07-10 | aligned | `reports/validation/2026-07-10-agent-capability-tier-routing.md` |
| PROJ-LLMWIKI-CAPABILITY-SESSION-START | WF-BASE-CAPABILITY-ROUTING | `templates/session_start.template.md`; `workflows/session-start.workflow.md` | pre-read capability stop/handoff | copied route | 2026-07-10 | aligned | `reports/validation/2026-07-10-agent-capability-tier-routing.md` |
| PROJ-LLMWIKI-CAPABILITY-RESULT | WF-BASE-CAPABILITY-ROUTING | `templates/agent_result_report.template.md` | capability-fit evidence | copied fields | 2026-07-10 | aligned | `reports/validation/2026-07-10-agent-capability-tier-routing.md` |
| PROJ-LLMWIKI-INDEX-AGENT-DELIVERY | WF-BASE-AGENT-DELIVERY | `index.md` | workspace-map summary | linked summary | 2026-07-11 | aligned | `reports/validation/2026-07-11-agent-delivery-workflow.md` |
| PROJ-LLMWIKI-CURRENT-DIRECTION-AGENT-DELIVERY | WF-BASE-AGENT-DELIVERY | `wiki/projects/llm-wiki/docs/current_direction.md` | current architecture summary | linked summary | 2026-07-11 | aligned | `reports/validation/2026-07-11-agent-delivery-workflow.md` |
| PROJ-LLMWIKI-HUMAN-WORKFLOWS | WF-BASE-HUMAN-RECOVERY | `human/workflows.md` | human workflow identity map | linked summary | 2026-07-11 | aligned | `reports/validation/2026-07-11-human-workflow-manual-recovery.md` |
| PROJ-LLMWIKI-HUMAN-KNOWLEDGE | WF-BASE-HUMAN-RECOVERY | `human/knowledge.md` | human knowledge router | linked summary | 2026-07-11 | aligned | `reports/validation/2026-07-11-human-workflow-manual-recovery.md` |
| PROJ-LLMWIKI-HUMAN-MANUAL | WF-BASE-HUMAN-RECOVERY | `human/manual-mode.md`; `RECOVERY.md` | human continuity and recovery router | linked summary | 2026-07-11 | aligned | `reports/validation/2026-07-11-human-workflow-manual-recovery.md` |
| PROJ-LLMWIKI-WORKFLOW-DISCLOSURE | WF-BASE-HUMAN-RECOVERY | `workflows/session-start.workflow.md`; `workflows/session-closeout.workflow.md`; `templates/agent_result_report.template.md` | selected-workflow and deviation disclosure | copied fields/rule | 2026-07-11 | aligned | `reports/validation/2026-07-11-human-workflow-manual-recovery.md` |
| PROJ-LLMWIKI-ROOT-RECOVERY | WF-BASE-HUMAN-RECOVERY | `index.md`; `RECOVERY.md` | independent workspace recovery entry | linked | 2026-07-11 | aligned | `reports/validation/2026-07-11-human-workflow-manual-recovery.md` |
| PROJ-LLMWIKI-HUMAN-OPERATOR-TEMPLATE | WF-BASE-PROJECT-HUMAN-OPERATIONS | `templates/human_workflow.template.md`; `templates/agents.template.md` | new-repo operator scaffold and maintenance rule | copied fields/rule | 2026-07-17 | aligned | `reports/validation/2026-07-17-project-human-workflow.md` |
| PROJ-LLMWIKI-HUMAN-OPERATOR-BOOTSTRAP | WF-BASE-PROJECT-HUMAN-OPERATIONS | `harness/project-bootstrap.md`; `workflows/project-bootstrap.workflow.md` | required project bootstrap route | copied contract | 2026-07-17 | aligned | `reports/validation/2026-07-17-project-human-workflow.md` |
| PROJ-TAO-HUMAN-OPERATOR | WF-BASE-PROJECT-HUMAN-OPERATIONS | `/home/admindebian/TAO-CE-Evaluation/human.md`; `/home/admindebian/TAO-CE-Evaluation/README.md` | existing-repo manual operator entrypoint | linked/copied operational facts | 2026-07-17 | aligned | `/home/admindebian/TAO-CE-Evaluation/reports/validation/2026-07-17-human-workflow.md` |
| PROJ-LLMWIKI-BOUNDED-PROFILE-TEMPLATE | WF-BASE-BOUNDED-CHANGE | `templates/bounded_change_profile.template.md`; `templates/repo_rules.template.md` | repo profile scaffold and pointer | linked fields | 2026-07-11 | aligned | `reports/validation/2026-07-11-panel-anchor-navigation-standard.md` |
| PROJ-LLMWIKI-BOUNDED-TASK-RESULT | WF-BASE-BOUNDED-CHANGE | `harness/task-packet.md`; `templates/tasks.template.md`; `templates/agent_result_report.template.md` | entry/escalation/measurement fields | copied contract | 2026-07-11 | aligned | `reports/validation/2026-07-11-panel-anchor-navigation-standard.md` |
| PROJ-LLMWIKI-HUMAN-BOUNDED-KNOWLEDGE | WF-BASE-BOUNDED-CHANGE | `human/knowledge.md` | human knowledge pointer | linked | 2026-07-11 | aligned | `reports/validation/2026-07-11-bounded-change-fast-path.md` |
| PROJ-LLMWIKI-CONTEXT-SESSION-WORKFLOWS | WF-BASE-CONTEXT-BUDGET-PILOT | `workflows/session-start.workflow.md`; `workflows/session-closeout.workflow.md` | opt-in start/closeout checkpoint behavior | linked summary | 2026-07-11 | aligned | `reports/validation/2026-07-11-work-unit-context-budget-pilot.md` |
| PROJ-LLMWIKI-CONTEXT-MEASUREMENT | WF-BASE-CONTEXT-BUDGET-PILOT | `templates/agent_result_report.template.md`; `templates/lwoe_session_measurement.template.md` | opt-in measurement fields | linked fields | 2026-07-11 | aligned | `reports/validation/2026-07-11-work-unit-context-budget-pilot.md` |
| PROJ-LLMWIKI-CONTEXT-SESSION-PACKS | WF-BASE-CONTEXT-BUDGET-PILOT | `wiki/knowledge/project-docs/agent_session_packs.md` | conditional knowledge route | linked | 2026-07-11 | aligned | `reports/validation/2026-07-11-work-unit-context-budget-pilot.md` |
| PROJ-LLMWIKI-CODE-NAV-TEMPLATES | WF-BASE-CODEBASE-NAVIGATION | `templates/code_map.template.md`; `templates/ui_map_group.template.md`; `templates/bounded_change_profile.template.md` | new-project and deployed-repo anchor scaffold | copied fields | 2026-07-11 | aligned | `reports/validation/2026-07-11-panel-anchor-navigation-standard.md` |
| PROJ-LLMWIKI-CODE-NAV-RESULT | WF-BASE-CODEBASE-NAVIGATION | `templates/agent_result_report.template.md` | semantic-map impact and anchor evidence | copied fields | 2026-07-11 | aligned | `reports/validation/2026-07-11-panel-anchor-navigation-standard.md` |
| PROJ-LLMWIKI-P1-CODING-FAST-PATH | WF-BASE-P1-BOUNDED-CODING | `wiki/knowledge/project-docs/bounded_change_fast_path.md`; `workflows/real-repo-work.workflow.md` | mandatory coding floor inside bounded execution | linked/copied rule | 2026-07-11 | aligned | `reports/validation/2026-07-11-p1-bounded-coding-projection.md` |
| PROJ-LLMWIKI-P1-CODING-TASK | WF-BASE-P1-BOUNDED-CODING | `harness/task-packet.md`; `templates/tasks.template.md`; `templates/bounded_change_profile.template.md` | exact projection ID, source, repo-coordinate separation | copied contract | 2026-07-11 | aligned | `reports/validation/2026-07-11-p1-bounded-coding-projection.md` |
| PROJ-LLMWIKI-P1-CODING-RESULT | WF-BASE-P1-BOUNDED-CODING | `templates/agent_result_report.template.md` | full-versus-projection-versus-partial evidence semantics | copied contract | 2026-07-11 | aligned | `reports/validation/2026-07-11-p1-bounded-coding-projection.md` |
| PROJ-LLMWIKI-P1-CODING-REPO-BOOTSTRAP | WF-BASE-P1-BOUNDED-CODING | `templates/agents.template.md`; `templates/repo_rules.template.md` | shared projection pointer and repo-coordinate boundary | copied rule | 2026-07-11 | aligned | `reports/validation/2026-07-11-p1-bounded-coding-projection.md` |

## Status Values

| status | meaning |
| --- | --- |
| aligned | checked against the named baseline and no drift found |
| unchecked | known projection exists but has not been recently checked |
| stale | known projection needs update or review |
| experiment-only | usable as experiment evidence, not canonical workflow state |
| retired | no longer active |

## Evaluation Classification

Use these labels in projection-check reports:

| label | meaning |
| --- | --- |
| true positive | known projection drift was expected and detected |
| true negative | no projection drift was expected and no drift was found |
| false positive | no projection drift was expected, but the check reported actual drift |
| false negative | known projection drift was expected, but the check missed it |
| registry metadata stale | artifact content appears aligned, but the registry row still says `unchecked`, `stale`, or has old evidence |
| inconclusive | evidence is insufficient or the artifact is outside the test scope |

Do not classify `unchecked but aligned` as a false positive. That is stale
registry metadata, not workflow drift.

## Update Rule

When a baseline changes:

1. Open `change_impact_map.md`.
2. Select the change type.
3. Inspect rows in this registry whose `baseline id` matches the changed
   baseline.
4. Mark rows `aligned`, `stale`, `unchecked`, or `retired`.
5. Add validation evidence for durable changes.
