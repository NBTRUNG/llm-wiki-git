---
name: data-performance-scale
description: Database performance and scale guidance tied to access patterns, indexes, caching, partitioning, and replicas.
date_ingested: 2026-06-29
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://research.google/pubs/bigtable-a-distributed-storage-system-for-structured-data/
  - https://research.google/pubs/spanner-googles-globally-distributed-database/
  - https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf
  - https://learn.microsoft.com/en-us/azure/architecture/best-practices/data-partitioning
  - https://learn.microsoft.com/en-us/azure/architecture/patterns/sharding
confidence: medium
confidence_reviewed: 2026-07-04
---

# performance and scale

Use this guide when a data workload is slow, growing, globally distributed, or
requires cache/replica/partition design.

## first principle

Measure the access pattern before changing the database.

```text
slow workflow
  -> exact query/API
  -> rows/documents scanned
  -> selectivity and indexes
  -> network and serialization cost
  -> cache/replica/partition fit
  -> database choice only if the model is wrong
```

## common levers

| Lever | Use when | Risk |
| --- | --- | --- |
| Index | query filters/sorts are stable and selective | write overhead, unused indexes |
| Covering/projection | reads need a small subset | stale duplicated read model |
| Pagination/windowing | large result sets | unstable ordering if key not deterministic |
| Cache | repeated expensive reads tolerate staleness | invalidation bugs |
| Read replica | read-heavy workload | replication lag and read-your-writes issues |
| Partition/shard | data too large/hot for one node | cross-partition query complexity |
| Denormalized read model | UI/API needs fast aggregate view | refresh and ownership complexity |
| Specialized store | access pattern does not fit current DB | added operational and consistency burden |

## sharding and partitioning

Treat `sharding` as horizontal partitioning across independent logical or
physical partitions. Use it only after local query/index/model fixes, caching,
replicas, or simpler partitioning do not meet measured workload needs.

Shard design must name:

```text
Shard key:
Routing map owner:
Expected key distribution:
Read/write pattern per shard:
Hot-key or tenant skew:
Cross-shard query/transaction policy:
Rebalance/split/merge plan:
Backup/restore unit:
Operational dashboard:
```

Shard keys are hard to change after production use. Prefer keys that keep
common reads and writes within one shard, distribute request load rather than
only bytes, and avoid obvious hot partitions. If cross-shard joins or
transactions are frequent, the workload may not fit sharding yet.

## hot path checklist

- [ ] Query shape and top parameters known.
- [ ] Expected cardinality and selectivity known.
- [ ] Index exists for filter + sort path.
- [ ] N+1 reads eliminated or justified.
- [ ] Payload size bounded.
- [ ] Pagination deterministic.
- [ ] Cache staleness acceptable and documented.
- [ ] Authorization filters are preserved in optimized path.

## scale patterns

| Pattern | Fit |
| --- | --- |
| Key-range access | wide-column or ordered key-value designs |
| Single-key low-latency lookup | key-value/document store |
| Relational reporting over transactional data | SQL read replica/materialized view/warehouse |
| Global low-latency reads | CDN/cache/read replicas/regional placement |
| Global strong writes | distributed SQL or explicit conflict resolution |
| High-volume immutable events | append log, stream, lake/warehouse pipeline |

## load distribution checks

For database scaling, reason about load distribution separately from total
volume:

- average request rate;
- peak and burst request rate;
- p95/p99 latency target;
- largest tenant/customer/key range;
- write amplification from indexes, replicas, and denormalized models;
- read-your-writes or consistency expectations;
- operational limits per shard/partition/replica.

Use the Math Pack when estimates require cardinality, probability, queueing,
or skew analysis.

## warning signs

- Query needs many joins but the chosen store has no join model.
- Every feature adds another secondary index to a document/key-value store.
- Cache is used to hide missing indexes or unbounded queries.
- Sharding is chosen before proving the current hot path, index, query shape,
  payload, and authorization filters.
- A shard key distributes rows evenly but concentrates requests on a small
  number of tenants, customers, dates, or status values.
- Authorization is checked after fetching too much data.
- Search index becomes the only source of truth.
- Analytics warehouse is used for user-facing transactional reads.

## proof

Before accepting a performance change, record:

- baseline measurement;
- changed query/index/cache/model;
- new measurement;
- correctness proof for security/authorization/data freshness;
- distribution proof for partitions/shards when used;
- rollback or disable path.
