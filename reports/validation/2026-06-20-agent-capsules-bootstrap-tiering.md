# Agent Capsules And Bootstrap Tiering Validation

Date: 2026-06-20

## Scope

Closed a workflow gap where token-economy read rules kept agents from reading
all of LLM-Wiki, but short repo rules did not always provide concrete enough
task-type guidance.

## Inputs

- UniversityWeb repo docs scan:
  - `/home/admindebian/UniversityWeb/docs/`
  - `/home/admindebian/UniversityWeb/ui_map/`
  - `/home/admindebian/UniversityWeb/AGENTS.md`
  - `/home/admindebian/UniversityWeb/REPO_RULES.md`
- LLM-Wiki bootstrap and template files:
  - `harness/project-bootstrap.md`
  - `templates/repo_rules.template.md`
  - `harness/task-packet.md`
  - `templates/agent_result_report.template.md`

## Findings

Current bootstrap previously created only the minimal project doc set and, for
repo-backed projects, `AGENTS.md` plus Lead state. Real projects such as
UniversityWeb accumulated additional operational files:

- `REPO_RULES.md`
- `docs/session_start.md`
- `docs/knowledge_lookup_metric.md`
- `docs/code_map.md`
- `docs/agent_work_plan.md`
- `docs/tasks_future.md`
- `docs/tasks_archive.md`
- `docs/design_system.md` or equivalent UI guidance
- `ui_map/_GLOBAL.md`
- `ui_map/_CONTRACTS.md`
- `ui_map/_INDEX.md`
- `ui_map/_UI_ROUTER.md`
- `ui_map/_UI_WORKFLOW.md`
- `ui_map/group-*.md`

## Changes

- Added operating capsules to `templates/repo_rules.template.md`:
  - Code Capsule
  - UI Capsule
  - API/Service Capsule
  - Architecture Capsule
  - Security Capsule
- Added `Required operating capsules` to `harness/task-packet.md`.
- Added `Operating capsules applied` to `templates/agent_result_report.template.md`.
- Added templates:
  - `templates/code_map.template.md`
  - `templates/agent_work_plan.template.md`
  - `templates/ui_map_global.template.md`
  - `templates/ui_map_contracts.template.md`
  - `templates/ui_map_index.template.md`
  - `templates/ui_map_router.template.md`
  - `templates/ui_map_workflow.template.md`
  - `templates/ui_map_group.template.md`
- Updated `harness/project-bootstrap.md` with tiered repo-backed bootstrap:
  - repo agent core;
  - multi-agent tier;
  - UI-heavy tier;
  - backlog/archive tier.
- Updated `templates/README.md` catalog.

## Validation

Run after edits:

```sh
bash harness/feedback-loop-lint.sh
```

Actual result:

```text
Summary: 0 failure(s), 0 warning(s)
```
