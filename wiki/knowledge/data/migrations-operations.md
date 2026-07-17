---
name: data-migrations-operations
description: Database migration, backfill, restore, and operational safety guidance.
date_ingested: 2026-06-29
status: active
source_type: distilled-practice
source_urls:
  - https://docs.aws.amazon.com/wellarchitected/latest/analytics-lens/welcome.html
  - https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/data-store-overview
  - https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Validating.html
  - https://learn.microsoft.com/en-us/azure/architecture/best-practices/data-partitioning
confidence: medium
confidence_reviewed: 2026-07-04
---

# migrations and operations

Use this guide when changing schema, moving data, backfilling content, importing
records, changing database engines, or preparing production data repair.

## migration safety rule

Every production-affecting migration must answer:

```text
What changes?
What data can be lost?
How do we know it worked?
How do we stop it?
How do we roll back or compensate?
What is the maximum accepted inconsistency window?
```

Do not treat "script ran" as evidence. A migration is accepted only when the
target state is independently checked against source records, business
invariants, and rollback or compensation limits.

## migration types

| Type | Risk | Required proof |
| --- | --- | --- |
| Add nullable field/table | low | build/test + schema check |
| Add required field | medium | default/backfill + validation |
| Rename field/table | medium/high | dual-read or compatibility window |
| Split/merge table | high | dry-run, reconciliation query, rollback/compensation |
| Change database engine | high | shadow read/write, performance, rollback, data diff |
| CMS/platform schema or content migration | high | fresh/copied target, schema proof, content class plan, workflow smoke |
| Data repair | medium/high | before/after snapshot and approval |
| Import/backfill | medium/high | idempotency, duplicate handling, row counts, sample diff |
| Shard/partition rebalance | high | routing map proof, online/offline plan, hot-key check, integrity diff |

## planning sequence

Use this sequence before writing or running migration code:

```text
workflow/data owner
  -> source and target contracts
  -> data classification and sensitivity
  -> migration type and reversibility
  -> dry-run plan
  -> reconciliation queries and business invariants
  -> cutover plan
  -> rollback or compensation plan
  -> post-cutover monitoring
```

If any step is unknown, record the unknown as a blocker or residual risk. Do
not fill gaps from memory or broad schema grep when a data map or raw inventory
anchor should identify the real source.

## expand-contract pattern

Prefer this sequence for risky schema changes:

1. Expand: add new schema without removing old reads/writes.
2. Dual write or backfill with idempotency.
3. Verify counts, checksums, and sampled business records.
4. Switch reads.
5. Monitor.
6. Contract: remove old schema only after compatibility window.

## backfill checklist

- [ ] Source dataset and owner named.
- [ ] Destination entity and owner named.
- [ ] Idempotency key defined.
- [ ] Duplicate handling defined.
- [ ] Invalid/missing data handling defined.
- [ ] Batch size and retry behavior defined.
- [ ] Dry-run output reviewed.
- [ ] Backup or restore point exists.
- [ ] Verification queries exist.
- [ ] Rollback or compensation limit documented.
- [ ] Business invariants exist, such as totals, ownership, status counts,
      route/slug uniqueness, or foreign-key/reference completeness.
- [ ] Sampling strategy is defined for records that cannot be exhaustively
      compared.
- [ ] Cutover and freeze window are defined when source and target can both
      change.

## dry-run and reconciliation

For production-affecting migration, run at least one dry run against a copied,
staged, or otherwise isolated target before the real cutover.

Minimum reconciliation evidence:

- source and target row/document counts by logical group;
- primary-key or stable-identifier match count;
- checksum/hash or field-level diff for critical fields when practical;
- validation-failure list with owner, severity, and resolution;
- sampled business records reviewed end-to-end through the application;
- migration metrics captured without leaking sensitive data.

For continuous replication or change-data-capture paths, distinguish:

```text
full-load validation
  != ongoing change validation
  != business workflow validation
```

Validation tools may add source, target, and network load. Schedule validation
work and capacity accordingly.

## cutover and rollback

Before cutover, define:

- write freeze, dual-write, or change-capture policy;
- final validation gate and who can approve it;
- DNS/route/API/client compatibility impact;
- rollback point and maximum tolerated data loss or inconsistency;
- compensation script/process when rollback cannot restore the old state;
- post-cutover watch metrics and stop condition.

Rollback is not always symmetric. Once external consumers observe changed
records, identifiers, routes, or events, the recovery path may be compensation,
not restore.

## CMS and content migration

For CMS, platform, or major-framework migration, separate these concerns:

```text
schema/config
  != content records
  != media/files
  != users/permissions
  != redirects/domains/cultures
  != publish/audit/relation state
```

A successful schema/config import does not prove content portability. Before
moving content, classify each group as `preserve`, `script-import`, `rebuild`,
or `defer`, and run the first proof against a copied or fresh target.

Prefer workflow-sized proofs:

```text
minimal schema/config
  -> home/menu/content sample
  -> build/run
  -> public/admin smoke
  -> expand to next workflow
```

## observability

Record at least:

- rows scanned, inserted, updated, skipped, failed;
- duplicate count;
- invalid/missing field count;
- duration and batch count;
- sample IDs for manual verification;
- error summary without sensitive data leakage.

## rollback limits

Some migrations cannot be fully rolled back after external consumers observe
new data or after destructive transformation. In that case document a
compensation plan and require human approval before execution.

## anti-patterns

- Running a one-off script without dry-run and verification query.
- Backfilling by timestamp without idempotency.
- Dropping old columns in the same deploy that introduces new columns.
- Treating backup existence as proof that restore will work.
- Treating row counts alone as proof when transformed fields, references, or
  workflow-visible values can be wrong.
- Running migration validation during peak traffic without capacity allowance.
- Changing shard keys, routing maps, or partition boundaries without proving
  where reads and writes route during the transition.
- Ignoring application version compatibility during rolling deploys.
- Treating CMS schema/config export as proof that content, media, routes,
  permissions, and publish state can migrate automatically.

## related

- Platform upgrade planning: [../project-docs/platform_upgrade.md](../project-docs/platform_upgrade.md)
- Rollback: [../operations/rollback.md](../operations/rollback.md)
