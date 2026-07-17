# Workflow-first task planning validation

Date: 2026-06-29

## Scope

Make business workflow/outcome the mandatory planning axis before technical
tasks. Technical workstreams such as UI, code/backend, data/base, security,
validation, and release now act as execution slices of a workflow or
cross-cutting outcome.

## Files changed

- `harness/task-decomposition.md`
- `harness/task-packet.md`
- `harness/project-bootstrap.md`
- `harness/project-workflow.md`
- `templates/implementation_plan.template.md`
- `templates/tasks.template.md`
- `wiki/knowledge/project-docs/implementation_plan.md`
- `wiki/knowledge/project-docs/tasks.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `reports/validation/README.md`

## Validation

| Check | Result | Notes |
| --- | --- | --- |
| Canonical decomposition updated | PASS | `task-decomposition.md` now requires business workflow -> outcome -> maps/contracts -> technical slices -> ownership. |
| Implementation plan template updated | PASS | Added business workflow plan, cross-cutting outcomes, workflow task sequence, and workflow-aware task table. |
| Task template updated | PASS | Added workflow ID, affected workflows, workflow slice, user/business outcome, and map references. |
| Task packet updated | PASS | Delegated/normal packet now carries workflow-first fields. |
| Project workflow updated | PASS | Existing-project entry now checks workflow ID/outcome before implementation work. |
| Bootstrap validation updated | PASS | New projects must define workflow IDs or cross-cutting-only rationale for implementation planning. |
| Task guide updated | PASS | `tasks.md` guide now treats missing workflow/outcome as an anti-pattern. |
| Feedback-loop lint | PASS | `bash harness/feedback-loop-lint.sh` passed with 0 failures / 0 warnings. |

## Decision

Accepted into canonical LLM-Wiki project workflow.

Future implementation planning should start from business workflows and user or
business outcomes. Technical tasks are slices of those workflows unless they are
explicit cross-cutting tasks with affected workflows named.

## Follow-up

Apply this to the next project plan and to the UniversityWeb Umbraco 17 pilot if
that pilot proceeds.
