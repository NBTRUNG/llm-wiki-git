# 2026-07-06 one-file entry and ROI gate validation

## task

LLMWIKI-057: Add two operating rules for future agent sessions:

1. A user should only need to point an agent at one entry file at session start.
2. Before changing workflow structure, agents must compare ROI, simplicity,
   effectiveness, and blast radius, then choose the smallest change that
   produces the same operational behavior.

## ROI note

Options considered:

| option | edit surface | simplicity | effectiveness | ROI |
| --- | --- | --- | --- | --- |
| Make every session read many fixed files | low implementation, high user burden | low | medium | low |
| Make `AGENTS.md` / `index.md` / Agent Platform `README.md` the one-file entry | low-medium | high | high | high |
| Rebuild task/archive/session workflow broadly | high | medium | similar outcome | low |

Decision: use the one-file entry pattern and add the ROI gate to session-start
guidance. Do not restructure `tasks.md` or remove legacy archive patterns in
this change.

## changed files

- `harness/read-workflow.md`
- `wiki/knowledge/project-docs/session_start.md`
- `templates/agents.template.md`
- `/home/admindebian/Agent-Platform/README.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## validation commands

```text
bash harness/feedback-loop-lint.sh
rg -n "one-file session entry|one-file entry|ROI gate|LLMWIKI-057|choose the smallest change" harness wiki templates reports TICK.md
```

## result

- `bash harness/feedback-loop-lint.sh` passed with `0 failure(s), 0 warning(s)`.
- `rg` confirmed the one-file session entry and ROI gate appear in
  `harness/read-workflow.md`, `wiki/knowledge/project-docs/session_start.md`,
  `templates/agents.template.md`, `TICK.md`, LLM-Wiki task/test rollups,
  validation report, and `/home/admindebian/Agent-Platform/README.md`.
