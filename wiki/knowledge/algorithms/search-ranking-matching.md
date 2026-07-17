---
name: search-ranking-matching
description: Search, ranking, matching, recommendation, fuzzy matching, embeddings, and vector retrieval guidance.
date_ingested: 2026-06-29
status: active
source_type: distilled-practice + official-libraries
source_urls:
  - https://github.com/facebookresearch/faiss
confidence: medium
confidence_reviewed: 2026-06-29
---

# search ranking matching

Use this guide for search UX, result ranking, deduplication matching,
recommendations, embeddings, or vector similarity.

## choose by problem

| Problem | Candidate approach |
| --- | --- |
| exact lookup | key/index lookup |
| prefix/text search | normalized index, database full-text, search engine |
| fuzzy text match | token normalization, edit distance, trigram, phonetic/domain rules |
| ranking known records | scoring function + deterministic tie-breakers |
| semantic similarity | embeddings + vector index |
| recommendations | business rules baseline, collaborative/content model when data supports it |
| duplicate import records | canonical keys + fuzzy fallback + human review bucket |

## ranking contract

Always define:

- eligibility filter;
- score inputs;
- sort order;
- deterministic tie-breaker;
- freshness/staleness rule;
- explanation/debug fields for review.

## vector search rule

For small bounded data, brute-force vector similarity may be acceptable. For
large or latency-sensitive collections, use a vector index/library/service and
document recall/latency/memory trade-offs.

## fuzzy matching rule

Fuzzy matching should produce confidence and review buckets:

```text
exact match -> auto
high confidence -> auto if risk low
medium confidence -> review
low confidence -> no match
```

## anti-patterns

- Ranking without tie-breakers, causing unstable UI.
- Search index treated as source of truth.
- Fuzzy match auto-merges high-risk records without review.
- Embeddings added without evaluation set or relevance metric.
- Recommendation logic with no opt-out/debug explanation.
