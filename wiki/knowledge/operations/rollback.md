---
name: rollback
description: Rollback and recovery guidance for deployments, migrations, config changes, and cutovers.
date_ingested: 2026-06-27
status: active
source_type: project-file-back
confidence: medium
confidence_reviewed: 2026-07-04
---

# rollback

## purpose

Use this guide when a task affects release, deployment, data migration, config,
feature flags, external service cutover, or production recovery.

## checklist

- Identify what can be reverted automatically and what cannot.
- Identify data changes that need forward-fix instead of rollback.
- Identify the last independently verified good state and the reconciliation
  query or smoke path that proves the system returned to an acceptable state.
- For major rebuilds or CMS/platform migrations, define whether work happens on
  a copied/fresh target instead of the deployed database or server.
- Define feature flag or config fallback when available.
- Confirm old/new versions can coexist when rolling back partially.
- Record smoke checks that prove recovery.
- Record who owns the rollback decision in the active repo process.

## fresh target boundary

When the old system must remain available, rollback starts by avoiding
production mutation:

- keep the old deployment and database available for support/debugging;
- run upgrade proof against copied data or a fresh target;
- document the cutover point where rollback changes into forward-fix or
  compensation;
- do not treat a backup as sufficient unless restore has been tested or the
  recovery limit is accepted.

## migration rollback evidence

For migration, import, backfill, repair, or shard-rebalance work, rollback
planning must include:

- dry-run or staged-run evidence before production mutation;
- source/target reconciliation query or validation report;
- rollback point: backup, restore point, old target, dual-write state, or
  compensation script;
- maximum accepted inconsistency/data-loss window;
- owner authorized to stop, roll back, or continue forward-fix;
- post-rollback smoke checks for workflows affected by the migrated data.

## anti-patterns

- Treating schema rollback as safe after destructive migration.
- Treating backup existence as rollback proof without restore or accepted RPO/RTO.
- Rolling back code while leaving incompatible config or data.
- Depending on chat history for recovery instructions.
- Shipping a risky change without a visible failure mode and recovery path.
- Upgrading the deployed database in place when a fresh/copy target proof was
  required.

## related

- Deployment readiness: [[deployment-readiness.md]]
- Data contracts: [[../contracts/data-contracts.md]]
- Platform upgrade planning: [[../project-docs/platform_upgrade.md]]
