---
type: Project Index
project: LLM-Wiki
status: active
date_updated: 2026-07-11
---

# LLM-Wiki Project Index

This file is the detailed map for the LLM-Wiki project itself. The root
`index.md` remains the workspace map across projects and top-level catalogs.

## Start Here

1. `../../../../index.md` through root `index.md`
2. `../../../../TICK.md` through root `TICK.md`
3. `project_status.md`
4. `current_direction.md` when the question is about current direction,
   already-decided themes, or what to continue next
5. `tasks.md`
6. `test_matrix.md`

## Project Source Of Truth

- `../project_manifest.md`
- `project_brief.md`
- `project_status.md`
- `current_direction.md`
- `tasks.md`
- `decisions.md`
- `test_matrix.md`
- `source_of_truth_rules.md`
- `source_inventory.md`
- `workflow_map.md`
- `data_map.md`
- `change_impact_map.md`
- `workflow_projection_registry.md`
- `mcp_operations_lab_brief.md`
- `change_queue.md`
- `feedback_loop_queue.md`
- `efficacy_dashboard.md`
- `../wiki/architecture.md`

## Operating Maps

- Root workspace map: `../../../../index.md`
- Current work and claim state: `../../../../TICK.md`
- Current direction / librarian checkpoint: `current_direction.md`
- Canonical read workflow: `../../../../harness/read-workflow.md`
- Navigation map rules: `../../../../wiki/knowledge/project-docs/navigation_maps.md`
- Harness catalog: `../../../../harness/README.md`
- Template catalog: `../../../../templates/README.md`
- Knowledge catalog: `../../../../wiki/knowledge/README.md`
- Validation catalog: `../../../../reports/validation/README.md`
- Agent Platform pointer: `../../../../agent-platform/README.md`
- Active Agent Platform root: `/home/admindebian/Agent-Platform`
- LLM-Wiki Auditor agent identity: `/home/admindebian/Agent-Platform/agents/llm-wiki-auditor.agent.md`
- Agent Platform tool contracts: `/home/admindebian/Agent-Platform/gateway/tool_contracts.md`
- Machine-readable auditor map: `/home/admindebian/Agent-Platform/maps/llm-wiki-evidence-auditor.map.json`
- Change impact map: `change_impact_map.md`
- Workflow projection registry: `workflow_projection_registry.md`
- Human-readable map: `../../../../human/README.md`
- Manual recovery router: `../../../../RECOVERY.md`
- Agent capability tiers and projections:
  `../../../../wiki/knowledge/project-docs/agent_capability_tiers.md`
- Agent capability calibration workflow:
  `../../../../workflows/agent-capability-calibration.workflow.md`
- Canonical Agent Delivery Workflow:
  `../../../../wiki/knowledge/project-docs/agent_delivery_workflow.md`
- Shared Bounded Change Fast Path and repo profile template:
  `../../../../wiki/knowledge/project-docs/bounded_change_fast_path.md`;
  `../../../../templates/bounded_change_profile.template.md`
- Work-unit context budget and checkpoint pilot:
  `../../../../wiki/knowledge/project-docs/work_unit_context_budget.md`
- Codebase navigation and derived-index management:
  `../../../../wiki/knowledge/project-docs/codebase_navigation.md`
- Canonical bounded coding projection:
  `../../../../wiki/knowledge/coding/bounded-coding-core.md`

## Issue Link Rule

Any LLM-Wiki issue, task, validation report, or status note should be reachable
from root `index.md` by one short path:

```text
index.md
  -> wiki/projects/llm-wiki/docs/project_index.md
  -> task/status/test/report file
```

Do not turn root `index.md` into a detailed task board. Add detailed project
links here, then keep root `index.md` as the compact cross-project map.
