---
name: discrete-math
description: Discrete math guidance for sets, relations, graphs, counting, ordering, and complexity foundations.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# discrete math

Use this guide for graph/tree logic, dependency ordering, deduplication,
permissions, state machines, combinations, and complexity foundations.

## concepts

- **Set**: unique elements; useful for membership and deduplication.
- **Relation**: pairs between things; useful for permissions, ownership, and
  foreign-key-like logic.
- **Partial order**: some items must come before others; useful for dependency
  resolution and workflow states.
- **Graph**: nodes and edges; useful for routes, dependencies, relationships,
  permissions, and search paths.
- **DAG**: directed acyclic graph; useful for topological ordering.
- **State machine**: finite states and allowed transitions.

## coding checks

- Is order meaningful or only set membership?
- Are duplicates allowed?
- Can cycles exist? If not, where are they detected?
- Does the relation need symmetry, transitivity, or uniqueness?
- Are state transitions explicit and denied by default?
- What is the worst-case size of nodes, edges, combinations, or states?

## anti-patterns

- Using lists for membership hot paths when a set/map is intended.
- Ignoring cycles in dependency graphs.
- Encoding state machines as scattered booleans.
- Generating all combinations when a constraint or pruning strategy is needed.

