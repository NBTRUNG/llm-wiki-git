---
name: algorithm-selection
description: How to select an algorithm or library by problem shape, constraints, and proof needs.
date_ingested: 2026-06-29
status: active
source_type: distilled-practice
source_urls:
  - https://developers.google.com/optimization
  - https://github.com/facebookresearch/faiss
confidence: medium
confidence_reviewed: 2026-06-29
---

# algorithm selection

Use this guide before implementing non-trivial logic for performance,
matching/ranking, scheduling, optimization, parsing, or numerical behavior.

## selection questions

| Question | Why it matters |
| --- | --- |
| What is the exact problem? | Prevents solving a guessed problem. |
| What are inputs and outputs? | Defines contract and test cases. |
| What must always be true? | Defines invariants/correctness. |
| How large can input get? | Defines complexity budget. |
| Is the input adversarial or messy? | Defines validation and worst-case risk. |
| What latency/memory budget exists? | Defines whether simple approach is enough. |
| Does a proven library exist? | Avoids fragile custom algorithms. |
| Is approximation acceptable? | Opens ranking/ANN/probabilistic options. |
| What is the fallback/rollback? | Prevents unreviewable behavior changes. |

## baseline-first rule

1. Implement or describe the simplest correct baseline.
2. Measure or estimate whether it fits constraints.
3. Only then introduce indexing, caching, approximation, heuristics, or a
   specialized library.

## library-first domains

Prefer proven libraries for:

- cryptography;
- routing/scheduling/linear/integer/constraint optimization;
- vector similarity search at scale;
- numerical linear algebra;
- ML training/inference kernels;
- date/time/timezone rules;
- parsing established grammars;
- compression/encoding.

Custom implementation is acceptable when:

- input is small and bounded;
- dependency cost is higher than algorithm cost;
- the algorithm is simple and easy to prove;
- educational/demo purpose is explicit;
- a library does not match the domain constraints.

## output template

```text
Problem:
Baseline:
Constraints:
Chosen approach:
Library:
Complexity:
Correctness invariant:
Edge cases:
Benchmark/proof:
Rejected alternatives:
```
