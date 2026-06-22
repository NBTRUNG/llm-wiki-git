# Hermes context indexer standard validation

Date: 2026-06-11

Scope:

- Define Hermes as an optional project context indexer/read planner.
- Keep LLM-Wiki Markdown/repo docs as source of truth.
- Add templates and harness workflow for project-level adoption.

## Changes reviewed

Knowledge guide:

- `wiki/knowledge/project-docs/hermes_context_indexer.md`

Templates:

- `templates/hermes_read_plan.template.md`
- `templates/hermes_config.template.md`

Harness:

- `harness/hermes-read-planning.md`
- `harness/read-workflow.md`
- `harness/README.md`

Indexes:

- `wiki/knowledge/project-docs/README.md`
- `templates/README.md`

Repo rules:

- `templates/repo_rules.template.md`

## Validation

| Check | Result | Notes |
| --- | --- | --- |
| Hermes is not source of truth | PASS | Guide and harness state Hermes is advisory and derived. |
| LLM-Wiki not made dependent on Hermes | PASS | Adoption gate requires real-project pilots before applying Hermes to LLM-Wiki itself. |
| SQLite boundary defined | PASS | SQLite stores metadata/index/cache only, not canonical task/status/rules/code. |
| Harness integration is optional | PASS | `read-workflow.md` points to Hermes only after request type and source-of-truth class are known. |
| Templates stay skeletal | PASS | Templates define fields, not long policy. |
| Project adoption criteria exist | PASS | Guide lists conditions for enabling Hermes in a repo. |

## Decision

Accepted as an initial LLM-Wiki standard for configuring Hermes in projects.

LLM-Wiki remains Markdown-first. Hermes is a project-level optional capability
until at least two real projects produce pilot evidence.

## Follow-up

- Add Hermes to a real project only when that project shows measurable read
  overhead or cross-file context risk.
- After two project pilots, review whether LLM-Wiki itself should adopt Hermes.
