# Validation Report - Project Orientation and Research Intake Loop

Date: 2026-06-20
Owner: Codex
Status: completed

## Scope

Update LLM-Wiki so every new project must answer orientation questions before
implementation planning, choose a design driver, record a guide pack, and check
volatile research topics when the decision depends on current technology trends.

## Files Changed

- Added `wiki/knowledge/project-docs/project_orientation.md`.
- Added `templates/project_orientation.template.md`.
- Added `harness/research-intake-loop.md`.
- Added `templates/research_brief.template.md`.
- Added `research/watchlist.md`.
- Updated `harness/project-bootstrap.md`.
- Updated `templates/project_brief.template.md`.
- Updated `templates/architecture.template.md`.
- Updated `templates/README.md`.
- Updated `harness/README.md`.
- Updated `wiki/knowledge/project-docs/README.md`.
- Updated `wiki/knowledge/project-docs/project_brief.md`.
- Updated `wiki/knowledge/project-docs/architecture.md`.
- Updated `wiki/knowledge/project-docs/architecture_approach_selection.md`.
- Updated `active.md`.

## Resulting Rule

Every new project must create or fill `docs/project_orientation.md` before broad
implementation planning is accepted.

The orientation must record:

- primary design driver;
- secondary drivers;
- code organization;
- delivery strategy;
- first proof required;
- selected guide pack;
- rejected orientations;
- research freshness status.

If a project depends on volatile guidance such as deployment/runtime, frontend
rendering, CMS/headless architecture, security, AI/agents, testing, or
observability, the project must check `research/watchlist.md` and
`harness/research-intake-loop.md` before accepting the orientation.

## Validation

- `bash harness/feedback-loop-lint.sh`

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```
