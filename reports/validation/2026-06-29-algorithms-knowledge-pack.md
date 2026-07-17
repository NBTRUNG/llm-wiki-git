---
name: algorithms-knowledge-pack-validation
description: Validation record for adding LLM-Wiki reusable algorithms/math knowledge pack.
date_updated: 2026-06-29
status: accepted
---

# Algorithms Knowledge Pack Validation

## Scope

Added reusable trigger-based algorithm/math knowledge so agents can handle
features that need correctness, complexity, ranking, matching, optimization,
parsing, deduplication, numerical precision, or statistics.

## Added

- `wiki/knowledge/algorithms/README.md`
- `wiki/knowledge/algorithms/algorithm-selection.md`
- `wiki/knowledge/algorithms/complexity.md`
- `wiki/knowledge/algorithms/search-ranking-matching.md`
- `wiki/knowledge/algorithms/optimization-scheduling.md`
- `wiki/knowledge/algorithms/parsing-deduplication.md`
- `wiki/knowledge/algorithms/numerical-statistics.md`

## Updated

- `wiki/knowledge/README.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `templates/agent_result_report.template.md`
- `templates/agents.template.md`
- `templates/repo_rules.template.md`
- `harness/project-bootstrap.md`

## Trigger Rule

Load Algorithms Pack only when the task involves algorithm selection,
complexity/correctness proof, performance hot paths, search/ranking/matching,
recommendation/vector retrieval, scheduling/optimization, parsing/deduplication,
concurrency/idempotency, numerical precision, scoring, statistics, or ML
evaluation metrics.

## Validation

- LLM-Wiki lint should pass after this change.
- Pack is not a default read for ordinary CRUD/UI/content work.
