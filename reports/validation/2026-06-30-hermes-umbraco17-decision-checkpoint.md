---
name: hermes-umbraco17-decision-checkpoint
description: Validation record for the UniversityWeb Umbraco 13 to 17 Hermes pilot decision checkpoint.
date_updated: 2026-06-30
status: accepted
---

# Hermes Umbraco 17 Decision Checkpoint

## Scope

Recorded the human-confirmed pilot assumptions before installing/enabling
Hermes and starting UniversityWeb implementation work.

## Decisions

- Use a fresh Umbraco 17 rebuild path. Do not upgrade the deployed Umbraco 13
  server/database in place.
- Keep the old database available for the current deployed site and debugging.
- Use ROI-based migration: preserve when cheaper and safer; recreate when
  preservation costs more than rebuilding cleanly.
- Treat content export/import from Umbraco 13 to 17 as a risk item, not an
  assumption.
- Build by workflow from homepage outward, localizing fixes to the page/workflow
  that fails.
- Continue to public route testing only after database/backend/schema work can
  run without errors.
- Record Hermes read-plan use and measurement immediately during the pilot.
- Install or enable actual Hermes read-planning before implementation. Current
  UniversityWeb has manual Hermes docs, but no observed repo-local `.hermes/`
  index/cache implementation yet.

## Updated

- `wiki/concepts/llm-wiki/2026-06-29-hermes-umbraco17-pilot-concept.md`
- `reports/validation/README.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`

## Validation

- `bash harness/feedback-loop-lint.sh` passed with 0 failures and 0 warnings.
- Validation report index check found no unindexed validation reports.
