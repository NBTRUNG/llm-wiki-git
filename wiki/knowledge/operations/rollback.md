---
name: rollback
description: Rollback and recovery guidance for deployments, migrations, config changes, and cutovers.
date_ingested: 2026-06-27
status: active
source_type: project-file-back
confidence: medium
confidence_reviewed: 2026-06-27
---

# rollback

## purpose

Use this guide when a task affects release, deployment, data migration, config,
feature flags, external service cutover, or production recovery.

## checklist

- Identify what can be reverted automatically and what cannot.
- Identify data changes that need forward-fix instead of rollback.
- Define feature flag or config fallback when available.
- Confirm old/new versions can coexist when rolling back partially.
- Record smoke checks that prove recovery.
- Record who owns the rollback decision in the active repo process.

## anti-patterns

- Treating schema rollback as safe after destructive migration.
- Rolling back code while leaving incompatible config or data.
- Depending on chat history for recovery instructions.
- Shipping a risky change without a visible failure mode and recovery path.

## related

- Deployment readiness: [[deployment-readiness.md]]
- Data contracts: [[../contracts/data-contracts.md]]
