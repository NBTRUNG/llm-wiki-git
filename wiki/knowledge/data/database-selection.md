---
name: database-selection
description: Workload-first database and storage selection guide.
date_ingested: 2026-06-29
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/data-store-overview
  - https://aws.amazon.com/products/databases/
  - https://www.postgresql.org/support/versioning/
  - https://research.google/pubs/spanner-googles-globally-distributed-database/
  - https://research.google/pubs/bigtable-a-distributed-storage-system-for-structured-data/
  - https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf
confidence: medium
confidence_reviewed: 2026-07-01
---

# database selection

Use this guide before selecting, replacing, or adding a database/storage engine.

## decision inputs

Record these before naming a technology:

| Question | Why it matters |
| --- | --- |
| What business workflow owns the data? | Prevents choosing storage without product context. |
| Who writes the data? | Defines ownership, authorization, and conflict rules. |
| Who reads it and how often? | Defines query shape, indexes, cache, and replicas. |
| What consistency is required? | Defines whether eventual consistency is acceptable. |
| What is the transaction boundary? | Defines relational/ACID need and aggregate boundaries. |
| What are the common queries? | Defines relational joins, key-value lookup, document access, search, graph, time-series, or analytics fit. |
| What is the write/read ratio? | Defines storage engine and index pressure. |
| How much data and growth? | Defines partitioning, retention, archive, and cost. |
| What latency/SLO matters? | Defines local/global placement and operational complexity. |
| What regulatory/security constraints exist? | Defines encryption, audit, access, residency, retention. |
| What restore/rollback is required? | Defines backup, PITR, migration, and disaster recovery needs. |

## default choice

For most new business applications with uncertain access patterns:

```text
Relational database first
  if transactional consistency, ad-hoc filtering, reporting, admin tooling,
  and schema evolution matter more than extreme scale specialization.
```

Use a specialized store only when its access pattern is already clear enough to
justify the operational and modeling trade-off.

## current-source notes checked 2026-07-01

- PostgreSQL supports each major version for five years. PostgreSQL 18 is the
  current supported major line in the official versioning table; PostgreSQL 19
  is beta and should be treated as non-production unless a repo explicitly
  accepts preview risk.
- PostgreSQL major upgrades require `pg_upgrade` or dump/reload and review of
  intervening release notes. Minor releases are lower risk than remaining on an
  old minor, but release notes still apply.

## storage fit matrix

| Workload shape | Strong candidate | Avoid when |
| --- | --- | --- |
| Transactional app, flexible queries, reporting, admin screens | Relational SQL | Data is append-only event/log at massive scale with simple key access |
| Global relational transactions with strong consistency | Distributed SQL | Single-region relational DB is enough |
| Simple key lookup at huge scale, low-latency reads/writes | Key-value store | You need joins, ad-hoc filters, or multi-row transactions |
| Aggregate/document reads where shape matches UI/API | Document store | Cross-document consistency and relational reporting dominate |
| Wide sparse rows, very high write/read scale by key/range | Wide-column store | Query patterns are not known or require joins |
| Search, ranking, text relevance, faceting | Search index | It becomes the only source of truth |
| Relationship/path traversal | Graph database | Relationships are simple foreign keys or reporting joins |
| Metrics/events over time | Time-series store | Data is business transactions needing rich updates |
| Immutable facts and historical analytics | Data warehouse/lake/lakehouse | You need low-latency transactional writes |
| Files, media, large blobs | Object storage | You need row-level transactions over file metadata/content together |

## consistency choices

| Need | Prefer | Notes |
| --- | --- | --- |
| User must immediately see their own write | Strong consistency or read-your-writes design | Eventual consistency needs UX handling. |
| Financial/security/authorization correctness | Strong transaction boundary | Do not weaken reads for speed. |
| Feed/search/recommendations | Eventual consistency often acceptable | Show freshness expectations. |
| Multi-region active-active | Distributed SQL or app-level conflict design | Human-confirm trade-offs before implementation. |
| Offline analytics | Warehouse/lake/lakehouse | Do not use analytics layer for transactional correctness. |

## selection workflow

1. Name the workflow and data owner.
2. List top five reads and writes.
3. Define transaction boundary and consistency requirement.
4. Estimate data size, growth, and retention.
5. Choose the simplest store that satisfies current correctness and operations.
6. Document alternatives rejected and why.
7. Define migration/backup/restore and observability before acceptance.
8. Add a project ADR when the decision changes database family, ownership, or
   operational posture.

## big-company lessons

- Google Bigtable demonstrates wide-column storage for large-scale structured
  sparse data with key/range access, not a general relational replacement.
- Google Spanner demonstrates global distribution with external consistency,
  but its value comes with architectural and operational complexity.
- Amazon Dynamo demonstrates high availability key-value design and explicit
  conflict/version handling, not ad-hoc relational querying.
- Cloud vendors present many purpose-built database families because one store
  rarely optimizes every workload dimension.

## acceptance checklist

- [ ] Business workflow and owner named.
- [ ] Read/write patterns listed.
- [ ] Consistency and transaction boundary stated.
- [ ] Security/privacy/residency constraints stated.
- [ ] Migration and rollback strategy stated.
- [ ] Operational skills/cost considered.
- [ ] Project `docs/data_map.md` and `docs/database_inventory.md` update plan
      exists when the choice affects a repo.
