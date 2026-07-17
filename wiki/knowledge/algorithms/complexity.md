---
name: algorithm-complexity
description: Complexity, performance budget, and measurement guidance.
date_ingested: 2026-06-29
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-06-29
---

# complexity

Use this guide when performance depends on input size, loops, queries, indexes,
recursion, caching, or data structure choice.

## classify cost

| Cost | Ask |
| --- | --- |
| Time | How does runtime grow with input size? |
| Memory | What is retained per request/session/process? |
| I/O | How many DB/network/filesystem calls happen? |
| Serialization | How much data is encoded/decoded? |
| Contention | What shared lock/cache/resource is touched? |
| Worst case | What happens for duplicates, empty, malformed, sorted, or adversarial input? |

## common fixes

| Symptom | Check |
| --- | --- |
| nested loops over growing lists | map/set/index precomputation |
| repeated DB/API calls | batch, join, eager load, read model |
| slow search/filter | index, normalized key, search engine |
| memory spike | streaming, pagination, bounded buffers |
| slow sort/rank | precomputed score, top-k, heap, index |
| cache hides slowness | fix query/model first, then cache |

## proof requirements

For performance-sensitive changes, record:

```text
Baseline:
Input size:
Old complexity:
New complexity:
Measurement command:
Result:
Correctness risk:
Rollback:
```

## guardrails

- Do not trade away authorization/validation for speed.
- Do not use approximate algorithms where exact correctness is required.
- Do not add caches without invalidation/freshness rules.
- Do not benchmark only tiny happy-path data if production shape is larger.
