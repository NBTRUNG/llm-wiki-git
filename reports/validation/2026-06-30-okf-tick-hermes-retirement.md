---
name: okf-tick-hermes-retirement
description: Validation record for retiring Hermes and adding OKF/TICK claim-release coordination.
date_updated: 2026-06-30
status: accepted
---

# OKF/TICK Hermes Retirement Validation

## Scope

Retired Hermes from active LLM-Wiki and UniversityWeb-U17 operating workflows.
Added OKF-aligned git-backed Markdown guidance, a `TICK.md` entrypoint, and
explicit task claim/release rules for human/agent coordination.

## Decision

Use Markdown source files as the coordination surface:

```text
TICK.md
  -> index.md
  -> project_index.md
  -> task packet / tasks.md
  -> session packs and maps
  -> exact source slices
  -> validation evidence
```

Hermes is retired because the active need is not another derived read-planning
layer. The need is durable agent knowledge, minimal read routing, and explicit
claim/release coordination in git-backed files. Historical Hermes reports remain
evidence; active agents should not use Hermes.

## Updated

- `TICK.md`
- `templates/TICK.template.md`
- `wiki/knowledge/project-docs/open_knowledge_format.md`
- `harness/read-workflow.md`
- `harness/README.md`
- `templates/README.md`
- `wiki/knowledge/README.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `wiki/knowledge/project-docs/agent_status.md`
- `wiki/knowledge/project-docs/agent_local_work.md`
- `wiki/knowledge/project-docs/multi-agent-coordination.md`
- `harness/task-packet.md`
- `templates/tasks.template.md`
- `templates/agent_role_card.template.md`
- `templates/agents.template.md`
- `templates/repo_rules.template.md`
- `active.md`
- `index.md`
- `wiki/projects/llm-wiki/docs/project_index.md`
- `reports/validation/README.md`

## Archived

- `archive/retired-hermes/2026-06-30/harness-hermes-read-planning.md`
- `archive/retired-hermes/2026-06-30/templates-hermes_config.template.md`
- `archive/retired-hermes/2026-06-30/templates-hermes_read_plan.template.md`
- `archive/retired-hermes/2026-06-30/hermes_context_indexer.md`
- `archive/retired-hermes/2026-06-30/2026-06-11-hermes-agent-workflow-draft.md`
- `archive/retired-hermes/2026-06-30/2026-06-29-hermes-umbraco17-pilot-concept.md`

## Validation

- LLM-Wiki lint/link check: `bash harness/feedback-loop-lint.sh` passed with
  0 failures and 0 warnings.
- LLM-Wiki index routing: root `index.md` now links to
  `wiki/projects/llm-wiki/docs/project_index.md`; project-specific issues,
  tasks, status, validation, and architecture notes route through that project
  map instead of expanding root `index.md` into a task board.
- UniversityWeb-U17 read-path update: active docs use `TICK.md`,
  `docs/project_index.md`, `docs/tasks.md`, and
  `U17-PLATFORM-INVENTORY-001`; active `docs/hermes*.md` files were removed and
  archived under `docs/archive/retired-hermes-2026-06-30/`.
- UniversityWeb-U17 verification: active docs outside archive no longer contain
  `U17-HERMES-BOOTSTRAP-001`, `docs/hermes_config.md`,
  `docs/hermes_read_plan.md`, or `docs/hermes.md`.

## Residual Risk

- Existing historical reports still mention Hermes by design.
- Existing non-reserved Markdown files are not yet fully OKF-conformant; this is
  a forward standard for new durable knowledge and a future lint improvement.
