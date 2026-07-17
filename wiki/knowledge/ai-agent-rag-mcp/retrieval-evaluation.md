---
name: retrieval-evaluation
description: Evaluation guidance for RAG hit quality, citation support, stale sources, conflicts, and unsupported inference.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# Retrieval Evaluation

RAG quality is not "the answer sounds right." Evaluate the retrieval and the
grounded answer separately.

## Minimum Metrics

| Check | What It Proves |
| --- | --- |
| Retrieval hit | The right source appears in top results. |
| Citation support | The cited source actually supports the claim. |
| Source freshness | The source version/date is acceptable for the task. |
| Conflict handling | Conflicting sources are surfaced, not averaged. |
| Unsupported inference | The answer marks or avoids claims not in sources. |
| Permission boundary | Restricted/private sources are not leaked. |

## Test Set Shape

Include:

- known-answer questions;
- ambiguous wording;
- stale/historical-source traps;
- source hierarchy conflicts;
- negative questions where the correct answer is "not found";
- sensitive/private data denial cases.

## Reporting

Record:

```text
Corpus:
Retriever/index:
Filters/reranker:
Gold sources:
Failures:
Unsupported claims:
Decision:
```

