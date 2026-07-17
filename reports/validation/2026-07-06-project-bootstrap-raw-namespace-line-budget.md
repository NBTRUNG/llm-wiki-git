# 2026-07-06 project bootstrap raw namespace and line-budget validation

## task

LLMWIKI-058: Tighten project bootstrap and agent readability rules:

1. Repo-backed projects keep source-of-truth work in the repo, while raw evidence
   lives in Agent Platform under a project namespace.
2. LLM-Wiki project pointers must name repo entry and raw/platform namespace.
3. Agents use line-budget guidance when deciding whether to trim, split, or
   leave files as searchable ledgers.
4. ROI gate wording clarifies that agents should not always choose the cheapest
   edit; materially better but higher-cost options should be presented to the
   user/integration owner.

## ROI note

Options considered:

| option | edit surface | effectiveness | decision |
| --- | --- | --- | --- |
| Create a new governance file only for line budgets | medium | medium | rejected; extra file increases read burden |
| Patch existing read/bootstrap entrypoints | low | high | accepted |
| Rebuild active/tasks/archive model now | high | uncertain | defer; discuss after line budgets and project bootstrap rules are stable |

This change uses the smallest edit that clarifies current behavior. It also
keeps the door open for a larger restructuring if the user decides the higher
cost is worth the operational gain.

## changed files

- `harness/read-workflow.md`
- `harness/project-bootstrap.md`
- `projects/README.md`
- `templates/agents.template.md`
- `wiki/knowledge/project-docs/session_start.md`
- `/home/admindebian/Agent-Platform/README.md`
- `reports/validation/2026-07-06-agent-platform-externalization.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## validation commands

```text
bash harness/feedback-loop-lint.sh
rg -n "file line-budget guidance|Raw evidence, extracted indexes|raw/projects/<project-id>|higher-cost option|LLMWIKI-058" harness projects templates wiki reports TICK.md
```

## result

- `bash harness/feedback-loop-lint.sh` passed with `0 failure(s), 0 warning(s)`.
- `rg` confirmed the line-budget guidance, repo-backed raw namespace rule,
  corrected ROI wording, LLMWIKI-058 rollups, and human-confirmed Agent Platform
  separation are present.
