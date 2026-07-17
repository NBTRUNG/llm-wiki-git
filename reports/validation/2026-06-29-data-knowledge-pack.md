---
name: data-knowledge-pack-validation
description: Validation record for adding LLM-Wiki reusable data/database knowledge pack.
date_updated: 2026-06-29
status: accepted
---

# Data Knowledge Pack Validation

## Scope

Added reusable LLM-Wiki data/database knowledge so agents and humans can choose
database/storage technology from workload, ownership, consistency, and
operational constraints rather than preference or guesswork.

## Added

- `wiki/knowledge/data/README.md`
- `wiki/knowledge/data/database-selection.md`
- `wiki/knowledge/data/data-modeling.md`
- `wiki/knowledge/data/data-architecture-governance.md`
- `wiki/knowledge/data/migrations-operations.md`
- `wiki/knowledge/data/performance-scale.md`

## Updated

- `wiki/knowledge/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`

## Principles Captured

- Purpose-built databases are selected by workload shape.
- Relational storage remains the conservative default for uncertain
  transactional business applications.
- Database selection must name workflow owner, access patterns, consistency,
  transaction boundary, scale, security, operations, and rollback constraints.
- Data ownership and source of truth are architecture decisions.
- Migrations/backfills need dry-run, idempotency, verification, and rollback or
  compensation limits.
- Agents should start from project `docs/data_map.md`, not from broad database
  grep or inferred schema.

## Sources

- Microsoft Azure Architecture Center: data store model/technology choices.
- AWS purpose-built database and analytics well-architected guidance.
- Google Research Bigtable and Spanner papers.
- Amazon Dynamo paper.
- Martin Fowler / Thoughtworks data mesh guidance.

## Validation

- LLM-Wiki lint should pass after this change.
- No project-local data map was changed by this knowledge update.
