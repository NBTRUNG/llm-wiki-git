# Workflow Contract Pilot Validation

Date: 2026-07-09
Task: LLMWIKI-061

## Scope

Validate the branch-like workflow-contract experiment approved by the human.
The experiment tests whether small JSON contracts can catch useful workflow
drift without replacing canonical Markdown workflow cards.

## Files Changed

- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/README.md`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/schemas/workflow_contract.schema.json`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/contracts/real-repo-work.contract.json`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/contracts/bug-fix-investigation.contract.json`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/fixtures/u17-phase1-evaluation.md`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/fixtures/u17-read-order-drift.before.md`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/reports/workflow-contracts-v0-result.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## Validation

- The experiment is contained under `wiki/projects/llm-wiki/experiments/`.
- Canonical workflow Markdown remains unchanged.
- The schema requires only the planned minimal fields.
- Both contracts are shorter than their source workflow cards and do not repeat
  full runbook prose.
- The U17 fixture reproduces the read-order drift found during Phase 1
  evaluation.
- The `real-repo-work` contract drift check detects the missing workflow catalog
  and real-repo workflow route.
- The result report records the explicit decision: revise before promotion.

## Verdict

Pass. The pilot is useful as experiment evidence and possible auditor input,
but should not be promoted to canonical workflow obligations yet.

