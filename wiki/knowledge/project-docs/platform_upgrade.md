---
name: platform-upgrade
description: Workflow-first planning guide for major framework, runtime, CMS, or platform rebuild and migration work.
date_ingested: 2026-07-01
status: active
source_type: project-file-back
source_reports:
  - ../../../reports/validation/2026-06-30-hermes-umbraco17-pilot-planning.md
  - ../../../reports/validation/2026-06-30-hermes-umbraco17-decision-checkpoint.md
confidence: medium
confidence_reviewed: 2026-07-04
---

# platform upgrade and rebuild planning

Use this guide when a project changes a major runtime, framework, CMS, package
ecosystem, or platform version and the work may touch schema, content, routing,
deployment, or public workflows.

Examples:

- CMS major-version rebuild or upgrade;
- runtime/framework LTS move;
- package ecosystem migration with build/runtime breaks;
- platform replacement where data/content must move or be recreated.

## source of truth

For real repos, project docs and source files remain source of truth:

```text
repo/TICK.md or task packet
repo/AGENTS.md
repo/REPO_RULES.md
repo/docs/project_index.md
repo/docs/code_map.md
repo/docs/data_map.md
repo/docs/database_inventory.md
repo/docs/test_matrix.md
repo/docs/decisions.md
```

LLM-Wiki provides reusable guidance only. Official vendor upgrade notes,
requirements, and compatibility tables must be re-checked before execution
because platform requirements change.

## default approach

Use a platform/data/schema-first sequence when the upgrade can invalidate the
data model, CMS schema, content shape, routing, package compatibility, or
deployment runtime.

```text
workflow inventory
  -> platform/runtime/package requirements
  -> copied or fresh target environment
  -> schema/config import or recreation
  -> minimal content/data proof
  -> code/API compatibility repair
  -> public workflow smoke tests
  -> deployment and rollback evidence
```

Do not start with broad UI/code edits when schema or platform bootstrapping can
invalidate those edits.

## fresh target rule

When the current production system must keep running, build against a fresh or
copied target:

- do not upgrade the deployed database or server in place;
- keep the old database available for production support and debugging;
- use copied media/data or a fresh target for proof work;
- document which identifiers, routes, content, media, and permissions must be
  preserved before moving anything;
- require human approval before any production-affecting migration.

## ROI migration rule

Classify each data/content/schema group before implementation:

| Class | Meaning |
| --- | --- |
| `preserve` | Must keep existing data, identifiers, routes, or references. |
| `script-import` | Cheaper and safer to transform/import than recreate manually. |
| `rebuild` | Cheaper and safer to recreate cleanly in the new target. |
| `defer` | Not needed for the first proof or test-server milestone. |

Preserve only when preservation is cheaper and safer than rebuilding. Recreate
when migration cost, serialized format risk, or validation burden is higher
than clean rebuild cost.

## CMS and content migration risks

Schema/config migration is not the same as content migration. A successful
schema import does not prove that page content, media, users, permissions,
redirects, domains, cultures, relation data, publish state, or audit history
can move automatically.

Treat content export/import as a separate risk item when the system has:

- property editor or block/list serialized values;
- media picker or rich text embedded references;
- culture variants or URL/identifier references;
- package-specific stored values;
- relation, permission, redirect, domain, or publish-state data.

The first proof should be intentionally small:

```text
fresh/copied target
  -> schema/config import or recreation
  -> minimal home/menu/content import
  -> build
  -> local run
  -> smoke critical public route and admin/backoffice access
```

## workflow-by-workflow rebuild

Build outward from the highest-value workflow instead of attempting a full-site
conversion in one pass.

For each workflow:

1. Name the workflow ID and user/business outcome.
2. Identify UI/routes, code surfaces, schema/content, and raw inventory anchors.
3. Move or rebuild the smallest content/data set needed for proof.
4. Repair localized compile/runtime/API breaks.
5. Smoke the workflow and record evidence.
6. Expand to the next workflow only after the current workflow is stable.

For workflows that move data/content, add a migration proof before acceptance:

```text
dry run
  -> source/target reconciliation
  -> sampled workflow record review
  -> cutover/rollback or compensation decision
```

When a page or workflow fails, localize the fix to that workflow unless evidence
shows a shared platform or schema issue.

## stop conditions

Stop and reassess when:

- the fresh target cannot build or run after platform/package inventory work;
- schema/config import fails and the failure class is not understood;
- minimal content cannot be imported or recreated with traceable references;
- production data would need an in-place mutation to continue;
- official vendor requirements conflict with repo assumptions;
- rollback or recovery evidence is missing for a production-affecting step.

## required evidence

Record:

- platform/runtime/package versions checked and source date;
- copied/fresh target boundary;
- data/content classes marked `preserve`, `script-import`, `rebuild`, or
  `defer`;
- schema/config import or recreation proof;
- minimal content/data proof;
- dry-run and reconciliation evidence for moved data/content;
- build/run results;
- workflow smoke results;
- rollback or compensation limit;
- decision record for any irreversible migration step.

## related

- Data migrations: [../data/migrations-operations.md](../data/migrations-operations.md)
- Database inventory and data maps: [data_map.md](data_map.md)
- Architecture approach selection: [architecture_approach_selection.md](architecture_approach_selection.md)
- Task planning: [tasks.md](tasks.md)
- Rollback: [../operations/rollback.md](../operations/rollback.md)
