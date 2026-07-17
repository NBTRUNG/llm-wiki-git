# Validation Report: Current Direction Map

Date: 2026-07-07

## scope

Implemented LLMWIKI-066: add a current-direction map and topical checkpoints so
agents can answer direction, supervisor, and "what next" questions without
reconstructing state from archives or long reports.

Also added reusable current-direction guidance/template for real projects so
agents can act as both collaborators and librarians for humans, supervisors,
and new contributors.

## changed files

- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/checkpoints/architecture-agent-platform.md`
- `wiki/projects/llm-wiki/docs/checkpoints/workflow-audit-layer.md`
- `wiki/projects/llm-wiki/docs/checkpoints/agent-errors-token-budget.md`
- `wiki/projects/llm-wiki/docs/checkpoints/project-librarian-checkpoint.md`
- `wiki/knowledge/project-docs/current_direction.md`
- `templates/current_direction.template.md`
- `index.md`
- `TICK.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_index.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/knowledge/project-docs/project_index.md`
- `wiki/knowledge/project-docs/project_status.md`
- `wiki/knowledge/README.md`
- `templates/README.md`
- `templates/project_index.template.md`
- `templates/project_status.template.md`
- `wiki/index.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/tasks_archive.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## contract checks

| contract | result | evidence |
| --- | --- | --- |
| LLM-Wiki has a current-direction map | pass | `wiki/projects/llm-wiki/docs/current_direction.md` |
| Topical checkpoints exist for active themes | pass | `wiki/projects/llm-wiki/docs/checkpoints/` |
| Root and project maps link to current direction | pass | `index.md`; `wiki/projects/llm-wiki/docs/project_index.md`; `wiki/index.md` |
| TICK tells agents not to reconstruct direction from archives | pass | `TICK.md` |
| Project docs guidance supports librarian/checkpoint pattern | pass | `wiki/knowledge/project-docs/current_direction.md`; `project_status.md`; `project_index.md` |
| Template exists for future projects | pass | `templates/current_direction.template.md` |
| Broad human questions trigger clarification before implementation | pass | `current_direction.md`; `project-librarian-checkpoint.md`; `templates/current_direction.template.md`; `TICK.md` |
| Live state updated, not report-only | pass | `active.md`; `TICK.md`; `tasks.md`; `test_matrix.md`; `reports/validation/README.md` |

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## closeout

If the user later asks "what should we continue", "where are we", or "what is
the direction", start at:

```text
index.md -> TICK.md -> wiki/projects/llm-wiki/docs/current_direction.md
```

Open validation reports or `tasks_archive.md` only when historical proof is
needed.

Next discussion queued: bug/fix workflow, specifically when agents should check
internet during error fixing and when to ask the human to join the
investigation.

Closeout lint rerun after the clarifying-question update:

```text
Summary: 0 failure(s), 0 warning(s)
```
