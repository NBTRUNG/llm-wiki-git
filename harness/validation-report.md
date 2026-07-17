# validation report

Validation reports record proof for one task, story, release, or review.

Canonical template:

```text
../templates/validation_report.template.md
```

Quality guide (result values, criteria, anti-patterns):

```text
wiki/knowledge/project-docs/validation_report.md
```

## use when

- a task changes behavior;
- a release is being prepared;
- manual review happened;
- a test failure or gap must be recorded;
- evidence is too long for `project_status.md`.

## rules

- `not run` must include a reason.
- Failed validation must not be hidden in final summaries.
- Long logs belong in `logs/test-output/`, not in wiki pages.
- Project status should summarize validation and link to the report.

## completion workflow

For LLM-Wiki work, a meaningful completed work unit is archived by report, not
by a separate active archive file:

```text
complete work
  -> create reports/validation/YYYY-MM-DD-<scope-slug>.md
  -> add it to reports/validation/README.md
  -> add a concise evidence link in active.md when durable state changed
  -> update wiki/projects/llm-wiki/docs/project_status.md when project state changed
  -> run bash harness/feedback-loop-lint.sh
```

`active.md` remains the current working entrypoint. It should not become a long
history file; old detail belongs in reports.
