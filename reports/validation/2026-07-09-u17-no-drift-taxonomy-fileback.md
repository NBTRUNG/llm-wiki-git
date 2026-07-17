# U17 No-Drift Taxonomy File-Back

Date: 2026-07-09
Task: LLMWIKI-073

## Scope

File back the taxonomy lesson from the U17 read-order no-drift report.

The U17 report correctly concluded overall `true negative`, but one row used
`false positive` for `PROJ-U17-SESSION-START` even though the file content was
aligned and only the registry metadata still said `unchecked`.

## Evidence

- `/home/admindebian/UniversityWeb-U17/reports/agent/session-20260709-impact/U17-read-order-no-drift-result.md`
- `wiki/projects/llm-wiki/docs/workflow_projection_registry.md`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/templates/empirical-evaluation-report.template.md`

## Finding

`unchecked but aligned` is not false-positive drift.

Correct classification:

```text
artifact content: aligned
registry metadata: stale / unchecked
drift classification: true negative
follow-up: non-read-only registry metadata update
```

## Files Changed

- `wiki/projects/llm-wiki/docs/workflow_projection_registry.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## Validation

- Projection registry guidance now defines `registry metadata stale`.
- Projection registry guidance explicitly says not to classify `unchecked but
  aligned` as a false positive.
- The historical U17 report is left unchanged as evidence.

## Follow-Up

If the user approves a non-read-only U17 registry cleanup, update
`/home/admindebian/UniversityWeb-U17/docs/workflow_projection_registry.md` so
`PROJ-U17-SESSION-START` records the no-drift report as evidence.

