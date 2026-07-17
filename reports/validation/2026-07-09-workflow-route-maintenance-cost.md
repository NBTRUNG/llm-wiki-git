# Workflow Route Maintenance Cost Validation

Date: 2026-07-09
Task: LLMWIKI-074

## Scope

Complete the next workflow-contract/change-impact follow-up:

- update U17 repo-local registry metadata after the no-drift report;
- run a simulated workflow-route maintenance-cost test;
- confirm ordinary U17 implementation read paths should not include
  `change_impact_map.md` or projection registries by default.

## Files Changed

LLM-Wiki:

- `wiki/projects/llm-wiki/docs/impact-tests/2026-07-09-workflow-route-maintenance-cost.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

UniversityWeb-U17:

- `/home/admindebian/UniversityWeb-U17/docs/workflow_projection_registry.md`
- `/home/admindebian/UniversityWeb-U17/reports/agent/session-20260709-impact/U17-workflow-projection-registry-metadata-cleanup-result.md`

## Validation

- U17 `PROJ-U17-SESSION-START` now points to the no-drift report and is marked
  `aligned`.
- The maintenance-cost test classifies affected artifacts into must-update,
  inspect-only, and no-update groups.
- The test preserves the rule that ordinary U17 implementation agents do not
  read Change Impact Map or projection registries by default.
- The result says a checker is not justified yet.

## Incident Note

An intermediate command briefly damaged the U17 registry by inserting the
replacement row repeatedly. The file was immediately rewritten from the known
registry content and verified with `sed` and `rg`; the final file contains one
valid `PROJ-U17-SESSION-START` row.

## Verdict

Pass. The manual impact map plus projection registry workflow is sufficient for
the current maintenance-cost case.

