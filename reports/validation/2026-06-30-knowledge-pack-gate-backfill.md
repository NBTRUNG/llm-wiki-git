---
name: knowledge-pack-gate-backfill
description: Validation record for requiring LLM-Wiki Knowledge Pack Gate in new projects and backfilling UniversityWeb repos.
date_updated: 2026-06-30
status: accepted
---

# Knowledge Pack Gate Backfill Validation

## Scope

Added a required Knowledge Pack Gate for AI-enabled projects and backfilled it
into UniversityWeb and UniversityWeb-U17.

## Decision

New AI-enabled projects must expose in `AGENTS.md` and `REPO_RULES.md`:

- Repo Base Pack for every session;
- Coding Pack once for code-facing work;
- Security Baseline inside Coding Pack;
- trigger-based Web/UI, Contracts, Data Map, Data Knowledge, Algorithms/Math,
  Architecture, Operations, and Security Deep packs;
- result report fields for LLM-Wiki knowledge effectiveness.

LLM-Wiki knowledge is useful only if it can be evaluated. Result reports should
record what helped, what changed because of it, conflicts with repo docs/code,
and whether knowledge is missing, stale, unclear, or worth filing back.

## Updated In LLM-Wiki

- `wiki/knowledge/project-docs/knowledge_effectiveness.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `wiki/knowledge/project-docs/README.md`
- `templates/agents.template.md`
- `templates/repo_rules.template.md`
- `templates/agent_result_report.template.md`
- `templates/README.md`
- `harness/project-bootstrap.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`

## Updated In Real Repos

UniversityWeb:

- `/home/admindebian/UniversityWeb/AGENTS.md`
- `/home/admindebian/UniversityWeb/REPO_RULES.md`
- `/home/admindebian/UniversityWeb/docs/project_index.md`
- `/home/admindebian/UniversityWeb/docs/test_matrix.md`
- `/home/admindebian/UniversityWeb/reports/validation/2026-06-30-knowledge-pack-gate.md`

UniversityWeb-U17:

- `/home/admindebian/UniversityWeb-U17/AGENTS.md`
- `/home/admindebian/UniversityWeb-U17/REPO_RULES.md`
- `/home/admindebian/UniversityWeb-U17/agents/OPERATING_GUIDE.md`
- `/home/admindebian/UniversityWeb-U17/docs/project_index.md`
- `/home/admindebian/UniversityWeb-U17/docs/tasks.md`
- `/home/admindebian/UniversityWeb-U17/docs/test_matrix.md`
- `/home/admindebian/UniversityWeb-U17/reports/validation/2026-06-30-u17-knowledge-pack-gate.md`

## Hermes Cleanup

UniversityWeb active Hermes docs were archived to:

```text
/home/admindebian/UniversityWeb/docs/archive/retired-hermes-2026-06-30/
```

The active files were removed:

- `docs/hermes.md`
- `docs/hermes_config.md`
- `docs/hermes_read_plan.md`

U17 already had Hermes retired; no Hermes path was restored.

## Validation

- `bash harness/feedback-loop-lint.sh` passed with 0 failures and 0 warnings.
- UniversityWeb repo-doc verification passed:
  - active `docs/hermes*.md` files are removed;
  - active docs outside archive no longer advertise Hermes read planning;
  - `AGENTS.md`, `REPO_RULES.md`, `docs/project_index.md`, and
    `docs/agent_work_plan.md` reference the Knowledge Pack Gate or Knowledge
    Effectiveness reporting.
- UniversityWeb-U17 repo-doc verification passed:
  - Hermes remains retired;
  - `AGENTS.md`, `REPO_RULES.md`, `agents/OPERATING_GUIDE.md`,
    `docs/project_index.md`, and `docs/tasks.md` route agents through
    `agent_session_packs.md` and/or `knowledge_effectiveness.md`.

## Residual Risk

- Existing historical reports may still mention Hermes or older pack behavior.
  They remain evidence, not active read paths.
