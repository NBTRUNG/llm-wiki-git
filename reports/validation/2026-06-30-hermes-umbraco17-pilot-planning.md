---
name: hermes-umbraco17-pilot-planning
description: Validation record for the Hermes pilot planning pass for UniversityWeb Umbraco 13 to 17 upgrade.
date_updated: 2026-06-30
status: accepted
---

# Hermes Umbraco 17 Pilot Planning Validation

## Scope

Recorded the current non-implementation planning pass for applying Hermes as a
manual read planner to the UniversityWeb Umbraco 13 to 17 upgrade candidate.

## Decision

Use a platform/data/schema-first pilot:

1. Split impact into platform/packages, UI, database/CMS schema/content, code,
   and validation/deployment readiness.
2. Reuse the current public UI where possible; validate Razor compile and route
   behavior after the runtime/package move.
3. Create a fresh/copied Umbraco 17 target and import uSync schema first:
   data types, document types, templates, languages, menu/home structure, then
   content data.
4. Update code last, after schema/data proof exists.

Hermes remains advisory only. It should produce/read a narrowed read plan and
measurement evidence; it must not choose the upgrade path, edit code, store
draft migration content, or approve writes.

## Sources Read

- `wiki/knowledge/project-docs/hermes_context_indexer.md`
- `wiki/knowledge/data/README.md`
- `wiki/knowledge/project-docs/architecture_approach_selection.md`
- `wiki/concepts/llm-wiki/2026-06-29-hermes-umbraco17-pilot-concept.md`
- `/home/admindebian/UniversityWeb/docs/hermes_config.md`
- `/home/admindebian/UniversityWeb/docs/hermes_read_plan.md`
- `/home/admindebian/UniversityWeb/AGENTS.md`
- `/home/admindebian/UniversityWeb/docs/project_index.md`
- `/home/admindebian/UniversityWeb/docs/project_status.md`
- `/home/admindebian/UniversityWeb/docs/code_map.md`
- `/home/admindebian/UniversityWeb/docs/data_map.md`
- `/home/admindebian/UniversityWeb/docs/database_inventory.md`
- `/home/admindebian/UniversityWeb/Directory.Build.props`
- `/home/admindebian/UniversityWeb/UniversityWeb.Web/UniversityWeb.Web.csproj`
- `/home/admindebian/UniversityWeb/UniversityWeb.Application/UniversityWeb.Application.csproj`
- Official Umbraco requirements, upgrade details, and version-specific upgrade
  documentation re-checked on 2026-06-30.
- NuGet/uSync package information re-checked on 2026-06-30.

## Updated

- `wiki/concepts/llm-wiki/2026-06-29-hermes-umbraco17-pilot-concept.md`
- `reports/validation/README.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`

## Validation

- This was a planning/documentation pass only; no UniversityWeb source code or
  repo docs were changed.
- `bash harness/feedback-loop-lint.sh` passed with 0 failures and 0 warnings.
- Validation report index check found no unindexed validation reports.
