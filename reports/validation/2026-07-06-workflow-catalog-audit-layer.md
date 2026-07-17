# Validation Report: Workflow Catalog Audit Layer

Date: 2026-07-06

## scope

Implemented LLMWIKI-059: add a Phase 1 workflow audit layer above `harness/`,
make session closeout explicit, trim live LLM-Wiki state files, and archive
completed task history before the UniversityWeb U17 effectiveness evaluation.

## changed files

- `workflows/README.md`
- `workflows/catalog.md`
- `workflows/session-start.workflow.md`
- `workflows/real-repo-work.workflow.md`
- `workflows/project-bootstrap.workflow.md`
- `workflows/knowledge-refresh.workflow.md`
- `workflows/wap-approval.workflow.md`
- `workflows/agent-platform-audit.workflow.md`
- `workflows/file-size-and-roi.workflow.md`
- `workflows/session-closeout.workflow.md`
- `index.md`
- `harness/README.md`
- `harness/read-workflow.md`
- `global-rules.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/tasks_archive.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `reports/validation/README.md`

## archived history

- `archive/task-ledgers/2026-07-06-active-before-workflow-catalog.md`
- `archive/task-ledgers/2026-07-06-llm-wiki-tasks-before-workflow-catalog.md`

## ROI note

Two options were considered:

| option | benefit | cost/blast radius | decision |
| --- | --- | --- | --- |
| Move/merge `harness/` into `workflows/` | One folder owns everything | High; many links and mental models change | Rejected for Phase 1 |
| Add thin `workflows/` audit layer above `harness/` | Easier audit and session routing while preserving existing procedure links | Low/medium; add cards and pointers only | Chosen |

This follows the ROI gate: choose the smaller equivalent change unless a larger
change gives materially better effectiveness. For Phase 1, the thin audit layer
gives most of the benefit with much lower blast radius.

## line-budget result

Before:

- `active.md`: 330 lines.
- `wiki/projects/llm-wiki/docs/tasks.md`: 703 lines.

After:

- `active.md`: short current-focus file.
- `wiki/projects/llm-wiki/docs/tasks.md`: live current/open ledger only.
- Completed history moved to `tasks_archive.md` and immutable snapshots under
  `archive/task-ledgers/`.

## contract checks

| contract | result | evidence |
| --- | --- | --- |
| Workflow cards exist and are short audit controls | pass | `workflows/*.workflow.md` |
| `harness/` remains detailed procedure layer | pass | `harness/README.md`; `workflows/README.md` |
| One-file start rule remains intact | pass | `harness/read-workflow.md`; `workflows/session-start.workflow.md` |
| "dừng tại đây" closeout is explicit | pass | `global-rules.md`; `harness/read-workflow.md`; `workflows/session-closeout.workflow.md` |
| Completed task history is archived | pass | `tasks_archive.md`; `archive/task-ledgers/` |
| Live state updated, not report-only | pass | `active.md`; `TICK.md`; `tasks.md`; `test_matrix.md` |

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result: to be recorded after command execution in this session.

Actual result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## next evaluation

Use UniversityWeb U17 as the Phase 1 effectiveness check:

- Start from the repo `AGENTS.md`.
- Confirm agents can determine whether a new UI/homepage request is already in
  task scope.
- Confirm they propose changes for approval before implementation.
- Measure whether `workflows/` reduces broad LLM-Wiki reading and ambiguity.

Only after that evaluation should Phase 2 consider machine-readable workflow
contracts.

## closeout addendum

After user review, `index.md` was clarified so agents do not jump directly into
`harness/` by default:

```text
entry file -> workflows/catalog.md -> selected workflow card -> harness details
```

This preserves the one-file session-entry rule while making the workflow audit
layer the next routing step.
