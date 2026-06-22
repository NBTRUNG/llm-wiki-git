# project manifest

project_id: llm-wiki
project_name: LLM-Wiki
owner: admindebian
type: research | internal-tool | other
phase: pre-repo
status: active
priority: high
company_wiki_include: true

## source of truth

- Current source of truth: `/home/admindebian/LLM-Wiki/wiki/projects/llm-wiki/`
- Repo path: `unknown`
- LLM-Wiki project path: `/home/admindebian/LLM-Wiki/wiki/projects/llm-wiki/`
- Migration status: pre-repo; no separate project repo exists.

## stack

- Runtime/language: Markdown and local filesystem.
- Framework: LLM-Wiki constitution + program + harness.
- Database/storage: Markdown files.
- Hosting/deploy: local-first, no deploy target yet.
- Test framework: documentation review, link/path checks, validation reports, wiki lint.

## source paths

- Brief: `docs/project_brief.md`
- Status: `docs/project_status.md`
- Tasks: `docs/tasks.md`
- Decisions: `docs/decisions.md`
- Test matrix: `docs/test_matrix.md`
- Architecture: `wiki/architecture.md`
- Validation reports: `/home/admindebian/LLM-Wiki/reports/validation/`
- Logs: `/home/admindebian/LLM-Wiki/logs/test-output/`

## read first

1. `/home/admindebian/LLM-Wiki/index.md`
2. `/home/admindebian/LLM-Wiki/llm-wiki-constitution.md`
3. `/home/admindebian/LLM-Wiki/program.md`
4. `/home/admindebian/LLM-Wiki/global-rules.md`
5. `/home/admindebian/LLM-Wiki/harness/README.md`
6. `/home/admindebian/LLM-Wiki/harness/read-workflow.md`
7. `/home/admindebian/LLM-Wiki/wiki/projects/llm-wiki/docs/project_status.md`
8. `/home/admindebian/LLM-Wiki/wiki/projects/llm-wiki/docs/tasks.md`

## notes

- This project is currently in pre-repo phase.
- This folder is source of truth until a separate repo exists.
- If a separate repo is created, migrate by move, not copy, then delete source-of-truth duplicates from LLM-Wiki.
- Unknown fields must be marked `unknown`.
