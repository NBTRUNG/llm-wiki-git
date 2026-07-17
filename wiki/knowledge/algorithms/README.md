---
name: algorithms-knowledge-pack
description: Trigger-based algorithm, math, optimization, ranking, parsing, and numerical reasoning knowledge pack.
date_ingested: 2026-06-29
status: active
source_type: distilled-practice + official-libraries
source_urls:
  - https://developers.google.com/optimization
  - https://github.com/facebookresearch/faiss
  - https://github.com/karpathy/micrograd
  - https://github.com/karpathy/llm.c
  - https://arxiv.org/abs/2602.03442
  - https://arxiv.org/abs/2603.07379
  - https://arxiv.org/abs/2605.05538
  - https://arxiv.org/abs/2410.05983
confidence: medium
confidence_reviewed: 2026-07-06
---

# algorithms knowledge pack

Use this pack when a feature needs algorithmic or mathematical reasoning for
correctness, performance, matching, ranking, optimization, parsing, numerical
precision, or scale.

This pack is trigger-based. Do not load it for ordinary CRUD, copy, layout,
or straightforward business logic.

## triggers

- selecting or designing an algorithm/data structure;
- performance hot path where complexity matters;
- search, ranking, matching, recommendation, similarity, embeddings, vector
  retrieval;
- scheduling, routing, allocation, bin packing, assignment, optimization;
- graph/tree traversal, dependency resolution, topological ordering;
- parsing, validation, normalization, deduplication, fuzzy matching;
- concurrency correctness, idempotency, ordering, consistency;
- numeric precision, finance, scoring, statistics, metrics, experiments;
- ML/AI evaluation or model-quality metrics.

## read order

| Intent | Read |
| --- | --- |
| Choose an approach | [algorithm-selection.md](algorithm-selection.md) |
| Reason about runtime/memory | [complexity.md](complexity.md) |
| Search/ranking/matching/vector retrieval | [search-ranking-matching.md](search-ranking-matching.md) |
| Scheduling/routing/allocation/optimization | [optimization-scheduling.md](optimization-scheduling.md) |
| Parsing/normalization/deduplication | [parsing-deduplication.md](parsing-deduplication.md) |
| Numeric/statistical correctness | [numerical-statistics.md](numerical-statistics.md) |

## core workflow

```text
problem statement
  -> input/output
  -> invariants and correctness conditions
  -> constraints: n, latency, memory, concurrency, data quality
  -> baseline/simple algorithm
  -> known library or proven domain algorithm
  -> complexity and edge cases
  -> benchmark/proof
  -> integration boundary and rollback
```

## default rule

Use the simplest correct algorithm until measurements or constraints require
more. When a domain has a proven library, prefer the library over hand-rolled
complex logic.

Examples:

- routing/scheduling/assignment: consider optimization/constraint libraries such
  as OR-Tools before writing custom solvers;
- vector search/similarity: consider proven ANN/vector-search libraries such as
  FAISS or a managed vector index before brute-force search at scale;
- neural-network autodiff: educational projects may use tiny engines like
  micrograd, but production ML relies on mature frameworks/kernels.

## report requirements

Algorithmic work must report:

```text
Problem:
Input size / constraints:
Correctness condition:
Chosen approach:
Alternatives considered:
Complexity:
Edge cases:
Library used or reason for custom implementation:
Benchmark/proof:
```

## agentic retrieval as an algorithm

Agentic retrieval is not only "RAG plus a better model". It is an algorithmic
workflow where a model or controller chooses retrieval actions: query planning,
keyword search, semantic search, subqueries, document open/read, reranking,
evidence sufficiency checks, and stopping.

When designing or reviewing agentic retrieval, include:

```text
Retrieval action space:
Source hierarchy and permissions:
Query fan-out / token / latency budget:
Stopping condition:
Evidence sufficiency rule:
Reranking or ordering policy:
Failure path:
Evaluation set:
```

Cost and complexity must include retrieval fan-out, document reads, reranking,
model tokens, retries, latency, observability, and tool-denial paths. Long
context does not remove the algorithmic need to select, order, and verify
evidence; broad retrieval can add hard negatives and degrade answer quality.

## anti-patterns

- Optimizing before measuring or before correctness is defined.
- Adding a complex algorithm for small, bounded input.
- Hand-rolling search/routing/vector/crypto/math libraries when proven
  libraries exist.
- Reporting "faster" without baseline and repeatable measurement.
- Ignoring adversarial, duplicate, empty, malformed, or extreme inputs.
- Using floating-point equality or unbounded accumulation in money/scoring
  paths without precision policy.
- Treating agentic retrieval quality as a prompt-only problem without measuring
  recall, citation support, latency, cost, and failure modes.

## related

- Coding Pack: [../coding/agent-coding-workflow.md](../coding/agent-coding-workflow.md)
- Math Pack: [../math/README.md](../math/README.md)
- Data performance: [../data/performance-scale.md](../data/performance-scale.md)
- Data selection: [../data/database-selection.md](../data/database-selection.md)
- Architecture selection: [../project-docs/architecture_approach_selection.md](../project-docs/architecture_approach_selection.md)
- Security baseline: [../coding/security-baseline.md](../coding/security-baseline.md)
