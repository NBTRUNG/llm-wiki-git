# 2026-07-06 session start and active-state boundary validation

## task

LLMWIKI-056: Clarify two operating boundaries:

1. Raw storage remains outside LLM-Wiki under the external Agent Platform, with
   one namespace per project.
2. New sessions start from the active work target. Real repo work starts in the
   real repo, not LLM-Wiki. LLM-Wiki is consulted through the repo knowledge
   gate. Durable work must update live task/status/test-matrix state, not only
   write a validation report.

## analysis

### Raw separation confirmations

Confirmed principle: keep raw out of LLM-Wiki.

The current local structure should be treated as the filesystem equivalent of a
centralized governed raw store:

```text
/home/admindebian/Agent-Platform/raw/projects/<project-id>/
```

This gives project isolation without putting raw evidence inside project repos
or inside the LLM-Wiki knowledge vault.

Items still requiring human confirmation:

- Whether `/home/admindebian/Agent-Platform` should later become a private Git
  repo for gateway/maps only, with `raw/` excluded from Git.
- Whether raw retention should be time-based, task-based, or manually approved
  during the pilot.
- Whether real projects should receive raw access only through gateway scripts
  from the start, or whether read-only direct folder inspection is acceptable
  during early local testing.
- Whether historical validation reports should keep old `agent-platform/...`
  paths. Current decision: yes, keep historical evidence as written; update
  active maps and rollups to current platform paths.

### Session start rule

The start root is the active work target:

- LLM-Wiki work starts at `/home/admindebian/LLM-Wiki`.
- Agent Platform runtime work starts at `/home/admindebian/Agent-Platform`.
- Real repo work starts at the real repo root, for example UniversityWeb-17.

For real repo work, the default prompt to an agent should say:

```text
Start in <repo-root>. Read AGENTS.md, REPO_RULES.md, TICK.md when present, and
the repo Lead/current-state file. Use LLM-Wiki only through the repo knowledge
gate. Raw namespace is /home/admindebian/Agent-Platform/raw/projects/<project-id>/.
Before reporting Done, update repo live state: TICK/Lead state, tasks, test
matrix/evidence row, validation index, and result report as applicable.
```

### Active-state rule

Reports are evidence, not live state. Durable changes are incomplete when only
`reports/validation/*.md` is updated.

Required live-state updates:

- LLM-Wiki durable work: `TICK.md`, `tasks.md`, `test_matrix.md`,
  `reports/validation/README.md`, and relevant project docs.
- Real repo durable work: repo `TICK.md`/Lead state, repo task row, repo
  test/evidence row, repo validation/report index.
- Agent Platform boundary changes: platform runtime files plus LLM-Wiki pointer
  docs only when the boundary changes.

## changed files

- `harness/read-workflow.md`
- `wiki/knowledge/project-docs/session_start.md`
- `templates/agents.template.md`
- `wiki/projects/llm-wiki/docs/source_of_truth_rules.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## validation commands

```text
bash harness/feedback-loop-lint.sh
rg -n "start root|active-state update rule|Agent Platform root|LLMWIKI-056|Raw remains outside LLM-Wiki" harness wiki templates reports TICK.md
```

## result

- `bash harness/feedback-loop-lint.sh` passed with `0 failure(s), 0 warning(s)`.
- `rg` confirmed the start-root rule, active-state update rule, Agent Platform
  root, raw-outside-LLM-Wiki rule, and LLMWIKI-056 rollup entries are present.
