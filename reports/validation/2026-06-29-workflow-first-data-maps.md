# Workflow-first data maps validation

Date: 2026-06-29

## Scope

Add canonical project workflow support for data maps that agents can read like a
map: start from business workflow, then follow stable IDs to UI/code, logical
data, raw database/schema/query verification, and conditional LLM-Wiki
knowledge only when needed.

## Files changed

- `wiki/knowledge/project-docs/data_map.md`
- `wiki/knowledge/project-docs/README.md`
- `templates/data_map.template.md`
- `templates/database_inventory.template.md`
- `templates/code_map.template.md`
- `templates/agents.template.md`
- `templates/repo_rules.template.md`
- `templates/project_orientation.template.md`
- `templates/agent_result_report.template.md`
- `templates/README.md`
- `harness/project-bootstrap.md`
- `wiki/knowledge/project-docs/project_orientation.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `active.md`
- `reports/validation/README.md`

## Validation

| Check | Result | Notes |
| --- | --- | --- |
| Data-map guide exists | PASS | `data_map.md` defines purpose, tiering, workflow cards, entity/table cards, raw inventory boundary, and conditional knowledge pointers. |
| Templates exist | PASS | Added `data_map.template.md` and `database_inventory.template.md`; updated template catalog. |
| Bootstrap integration | PASS | `project-bootstrap.md` adds a data/workflow map tier and validation criteria. |
| Session integration | PASS | `agent_session_packs.md` adds Data / Database Map Pack and raw-inventory-by-anchor rule. |
| Repo-entry integration | PASS | `agents.template.md` adds non-secret Data Quickstart. |
| Repo-rule integration | PASS | `repo_rules.template.md` adds Data Capsule. |
| Traceability | PASS | `code_map.template.md` now carries workflow/code/data/raw trace pointers. |
| Knowledge lookup boundary | PASS | LLM-Wiki references are conditional triggers, not default reads. |
| Feedback-loop lint | PASS | `bash harness/feedback-loop-lint.sh` passed with 0 failures / 0 warnings. |

## Decision

Accepted into canonical LLM-Wiki project workflow.

New projects with database, CMS, import/export, reporting, migration, or
backend data ownership risk should create a short Data Quickstart and a
workflow-first `docs/data_map.md`. Full/raw schema inventory belongs in
`docs/database_inventory.md` and is opened only by named anchor.

## Follow-up

Apply this pattern to the next project bootstrap or UniversityWeb Umbraco 17
pilot before generalizing further.
