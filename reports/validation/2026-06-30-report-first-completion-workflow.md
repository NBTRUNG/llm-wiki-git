---
name: report-first-completion-workflow
description: Validation record for standardizing LLM-Wiki completion tracking through validation reports and active evidence links.
date_updated: 2026-06-30
status: accepted
---

# Report-First Completion Workflow Validation

## Scope

Standardized the current non-Hermes workflow for closing meaningful LLM-Wiki
work units.

## Decision

LLM-Wiki will not add `active_archive.md` for now. Completed durable work is
archived as validation reports, indexed from `reports/validation/README.md`,
and linked concisely from `active.md` when it changes current LLM-Wiki state.

Hermes remains out of this workflow until the UniversityWeb Umbraco 13 to 17
pilot produces measured evidence.

## Updated

- `program.md`
- `harness/validation-report.md`
- `harness/agent-operating-guide.md`
- `reports/validation/README.md`
- `wiki/concepts/llm-wiki/2026-06-29-hermes-umbraco17-pilot-concept.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`

## Workflow

```text
complete meaningful LLM-Wiki work
  -> create reports/validation/YYYY-MM-DD-<scope-slug>.md
  -> add it to reports/validation/README.md
  -> add concise evidence link in active.md when durable state changed
  -> update wiki/projects/llm-wiki/docs/project_status.md when project state changed
  -> run bash harness/feedback-loop-lint.sh
```

## Validation

- `bash harness/feedback-loop-lint.sh` passed with 0 failures and 0 warnings.
- Validation report index check found no unindexed validation reports.
