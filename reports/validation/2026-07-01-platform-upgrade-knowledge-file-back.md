---
name: platform-upgrade-knowledge-file-back
description: Validation record for filing reusable platform/CMS rebuild and migration lessons into LLM-Wiki knowledge.
date_updated: 2026-07-01
status: accepted
---

# Platform Upgrade Knowledge File-Back

## Scope

Filed reusable lessons from the UniversityWeb Umbraco 13 to 17 planning and
decision checkpoint into `wiki/knowledge/`.

This is a knowledge update only. No real project repo code or active project
status was changed.

## Decision

Major runtime/framework/CMS rebuild work now has a reusable guide:

- use platform/data/schema-first proof when schema, content, routing, package
  compatibility, or deployment can invalidate code/UI work;
- prove work against a copied or fresh target when production must stay live;
- classify content/data as `preserve`, `script-import`, `rebuild`, or `defer`;
- treat schema/config movement as separate from content/media/users/routes and
  publish state;
- build workflow-by-workflow from the highest-value proof;
- require rollback or compensation evidence before production-affecting steps.

## Updated

- `wiki/knowledge/project-docs/platform_upgrade.md`
- `wiki/knowledge/project-docs/architecture_approach_selection.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/knowledge/data/migrations-operations.md`
- `wiki/knowledge/operations/rollback.md`
- `wiki/knowledge/README.md`
- `TICK.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## Sources

- `reports/validation/2026-06-30-hermes-umbraco17-pilot-planning.md`
- `reports/validation/2026-06-30-hermes-umbraco17-decision-checkpoint.md`
- `archive/retired-hermes/2026-06-30/2026-06-29-hermes-umbraco17-pilot-concept.md`

## Validation

- New knowledge guide is reachable from `wiki/knowledge/README.md` and
  `wiki/knowledge/project-docs/README.md`.
- Related Data, Architecture, and Operations guides point to the new canonical
  platform-upgrade guide instead of duplicating all rules.
- LLM-Wiki lint/link check: `bash harness/feedback-loop-lint.sh` passed with
  0 failures and 0 warnings.
