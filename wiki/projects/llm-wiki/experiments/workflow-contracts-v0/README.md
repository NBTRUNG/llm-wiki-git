# Workflow Contracts v0 Experiment

Status: experiment complete; not canonical.

This directory tests whether tiny machine-readable workflow contracts can catch
useful drift without replacing the Markdown workflow cards.

Canonical workflow rules remain in:

- `workflows/real-repo-work.workflow.md`
- `workflows/bug-fix-investigation.workflow.md`

## Scope

The experiment covers only:

- real repo work routing
- bug-fix investigation routing
- the U17 read-order drift found during Phase 1 evaluation

It does not create an API, MCP server, broad schema system, or workflow
backfill.

## Files

- `schemas/workflow_contract.schema.json` - small JSON schema for v0 contracts
- `contracts/real-repo-work.contract.json` - contract for real repo work
- `contracts/bug-fix-investigation.contract.json` - contract for bug fixes
- `experimental-procedure.md` - repeatable empirical test procedure
- `fixtures/u17-phase1-evaluation.md` - reduced evidence fixture
- `fixtures/u17-read-order-drift.before.md` - drift fixture
- `limitations-and-mitigations.md` - known pilot weaknesses and mitigation ideas
- `reports/workflow-contracts-v0-result.md` - pilot result and decision
- `templates/empirical-evaluation-report.template.md` - report template for
  future empirical runs

## Decision

The pilot detects the U17 read-order drift, but the result is **revise before
promotion**. Contracts are useful as optional auditor/checker inputs, not yet as
canonical workflow obligations.

Before any promotion, use `experimental-procedure.md` and the report template to
run at least one positive drift case, one negative no-drift case, and one
workflow-change maintenance-cost case.
