# validation report guide

## purpose

A validation report records evidence for a task, review, migration, release, or documentation check.

It stores details that are too long for status files while keeping enough summary for future agents to trust or challenge the result.

For procedural usage (when to create, operational rules), see `harness/validation-report.md`.

For the fillable template, see `templates/validation_report.template.md`.

## include

- Date, scope, task/story, validator.
- Project and source-of-truth files.
- Commit/build/version when available.
- Commands or manual checks run.
- Results by proof layer.
- Evidence links, screenshots, logs, URLs, or reviewer notes.
- Gaps, known issues, and residual risk.
- Decision: implemented, blocked, needs-fix, or needs-review.

## result values

- `passed`
- `failed`
- `not run`
- `needs-review`

## quality criteria

- The report is specific enough to reproduce or audit.
- Long logs are linked, not pasted.
- Failed or skipped checks are explicit.
- The decision follows from the evidence.
- Status/task/test docs link to the report when the proof matters.

## anti-patterns

- Marking validation passed without commands, evidence, or manual review notes.
- Hiding skipped checks.
- Using a report as the only current project status.
- Copying entire command logs into the report.