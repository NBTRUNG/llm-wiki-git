---
name: knowledge-pack-routing-update
description: Validation record for routing Data Knowledge Pack through project bootstrap, templates, and session reports.
date_updated: 2026-06-29
status: accepted
---

# Knowledge Pack Routing Update

## Scope

Updated LLM-Wiki workflow and templates so the Data Knowledge Pack is available
to agents like Coding Pack, but only by trigger.

## Updated

- `templates/agent_result_report.template.md`
- `templates/agents.template.md`
- `templates/repo_rules.template.md`
- `harness/project-bootstrap.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`

## New Project Workflow

For new projects:

1. Add project-local `docs/data_map.md` and `docs/database_inventory.md` when
   the project has DB/CMS/import/export/reporting/migration/data workflows.
2. Put a short Data Quickstart in `AGENTS.md`.
3. Start normal data work from project maps, not broad DB grep.
4. Load `wiki/knowledge/data/README.md` only for database/storage choice, data
   modeling/ownership/schema, migration/backfill/import, or performance/scale
   decisions.

## Validation

- LLM-Wiki lint should pass after this change.
- No project-specific database choice was changed.
