# Validation Report: Human Checkpoint and U17 Deployment Pointer

Date: 2026-07-07

## scope

Implemented LLMWIKI-065: make uncertainty an explicit acceptable checkpoint and
add a U17 deployment docs pointer to token-budgeted diagnostics guidance.

## changed files

- `wiki/knowledge/agent-errors/internet-search-and-token-budget.md`
- `wiki/knowledge/operations/deployment-diagnostics.md`
- `/home/admindebian/UniversityWeb-U17/docs/deployment.md`
- `/home/admindebian/UniversityWeb-U17/docs/project_index.md`
- `/home/admindebian/UniversityWeb-U17/TICK.md`
- `/home/admindebian/UniversityWeb-U17/docs/tasks.md`
- `/home/admindebian/UniversityWeb-U17/docs/test_matrix.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/tasks_archive.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## contract checks

| contract | result | evidence |
| --- | --- | --- |
| Agents may say they are uncertain or do not know yet | pass | `internet-search-and-token-budget.md`; `deployment-diagnostics.md`; U17 `docs/deployment.md` |
| Human collaboration is preferred over silent broad search when evidence is weak | pass | same |
| U17 deployment docs point to diagnostics and token guidance | pass | `/home/admindebian/UniversityWeb-U17/docs/deployment.md`; `docs/project_index.md` |
| U17 live state records the docs-only deployment pointer task | pass | U17 `TICK.md`; `docs/tasks.md`; `docs/test_matrix.md` |
| No code/package/deploy output changed | pass | changed files are docs/state only |
| Live LLM-Wiki state updated, not report-only | pass | `active.md`; `TICK.md`; `tasks.md`; `test_matrix.md`; `reports/validation/README.md` |

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## workflow assessment

Phase 1 `workflows/` remains useful as a separate audit layer. It gave U17 a
short route from repo entry to real-repo work without pulling agents into broad
`harness/` reads. The deploy token incident shows that workflow cards should
remain short, while risk-specific operational rules belong in knowledge packs
and repo-local pointers.
