---
name: data-knowledge-pack
description: Data architecture and database selection knowledge pack for agent sessions.
date_ingested: 2026-06-29
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/data-store-overview
  - https://aws.amazon.com/products/databases/
  - https://docs.aws.amazon.com/wellarchitected/latest/analytics-lens/welcome.html
  - https://research.google/pubs/spanner-googles-globally-distributed-database/
  - https://research.google/pubs/bigtable-a-distributed-storage-system-for-structured-data/
  - https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf
  - https://martinfowler.com/articles/data-monolith-to-mesh.html
confidence: medium
confidence_reviewed: 2026-06-29
---

# data knowledge pack

Use this pack when choosing a database, changing data ownership, designing a
data model, planning a migration, creating an import/export path, or reviewing
data quality and database performance.

This pack is reusable knowledge. Project-specific facts still belong in:

```text
repo/docs/data_map.md
repo/docs/database_inventory.md
repo/docs/code_map.md
repo/docs/contracts.md
repo/docs/decisions.md
```

## read order

| Intent | Read |
| --- | --- |
| Choose a database/storage | [database-selection.md](database-selection.md) |
| Design schema/entities | [data-modeling.md](data-modeling.md), then [../contracts/data-contracts.md](../contracts/data-contracts.md) |
| Define ownership/governance | [data-architecture-governance.md](data-architecture-governance.md) |
| Plan migration/backfill/restore | [migrations-operations.md](migrations-operations.md), then [../operations/rollback.md](../operations/rollback.md) |
| Review scale/performance | [performance-scale.md](performance-scale.md) |
| Change public/API/DTO data shape | [../contracts/data-contracts.md](../contracts/data-contracts.md) |
| Implement code touching data | [../coding/agent-coding-workflow.md](../coding/agent-coding-workflow.md) and Coding Pack |

## core rule

Start from the business workflow and access pattern, not from a preferred
database brand.

```text
business workflow
  -> data ownership
  -> read/write pattern
  -> consistency and latency requirement
  -> query shape
  -> growth and operational constraints
  -> database/storage choice
  -> migration, observability, rollback, and proof
```

## big-tech principles to reuse

- **Purpose-built storage**: large technology companies commonly use multiple
  storage systems because different workloads need different consistency,
  latency, query, and scale trade-offs.
- **Ownership before storage**: table/service/data-product ownership must be
  known before teams split databases, services, or data products.
- **Consistency is a product decision**: strong consistency, eventual
  consistency, global distribution, and offline analytics each carry UX,
  correctness, cost, and operational implications.
- **Schema evolution is continuous**: migrations, compatibility windows,
  backfills, and dual-read/dual-write plans are normal engineering work.
- **Raw data is not product data**: analytics/lake/lakehouse data needs quality,
  lineage, access control, and consumer contracts before agents rely on it.
- **Choose reversibility when uncertain**: favor boring relational storage for
  uncertain transactional apps until access patterns justify specialization.

## anti-patterns

- Picking a database before naming access patterns and correctness constraints.
- Using NoSQL because "scale" is expected but query shape is still relational.
- Using a shared database while claiming independent service ownership.
- Treating an analytics warehouse as the system of record for transactional
  behavior.
- Migrating production data without dry-run, backup, verification query, and
  rollback limit.
- Letting agents infer schema by grep when a project data map should name the
  relevant workflow/entity/raw anchor.

## related

- Project data-map standard: [../project-docs/data_map.md](../project-docs/data_map.md)
- Data contracts: [../contracts/data-contracts.md](../contracts/data-contracts.md)
- Architecture selection: [../project-docs/architecture_approach_selection.md](../project-docs/architecture_approach_selection.md)
- Architecture patterns: [../architecture-patterns/pattern-selection-matrix.md](../architecture-patterns/pattern-selection-matrix.md)
- Security baseline: [../coding/security-baseline.md](../coding/security-baseline.md)
- Rollback: [../operations/rollback.md](../operations/rollback.md)
