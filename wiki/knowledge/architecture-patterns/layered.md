---
name: layered-architecture
description: N-tier layered architecture. Separation of concerns by responsibility (presentation, business, data). Use for small-to-medium CRUD apps with one team.
source_type: external-research
source_urls:
  - https://www.geeksforgeeks.org/software-engineering/types-of-software-architecture-patterns/
  - https://vfunction.com/blog/enterprise-software-architecture-patterns/
date_ingested: 2026-05-23
confidence: medium
confidence_reviewed: 2026-05-23
applicable_contexts: pending first project use
status: active
---

# Layered (N-tier) architecture

The system splits into horizontal layers, each with a single responsibility:

```
Presentation  (UI, HTTP routes, controllers)
    ↓
Business      (services, domain logic, validation)
    ↓
Data access   (repositories, ORM, queries)
    ↓
Database / external systems
```

Each layer depends only on the layer directly below it. Higher layers never
import from lower layers' internals.

## strengths

- Easy to teach and onboard.
- Clear ownership boundaries: UI team works in presentation, backend team in
  business, DBA in data.
- Maps directly to most web frameworks (Django, Rails, Spring, .NET MVC).
- Fast to set up — a greenfield layered system reaches production in 4–8
  weeks for a small team.

## weaknesses

- Easy to leak business logic into controllers or data access ("fat
  controllers", "fat models").
- A change in business logic often forces edits across all three layers.
- Tight coupling at the data layer — replacing the database is painful.
- Vertical scaling only by default; horizontal scaling requires statelessness
  discipline.

## when to use

- CRUD-heavy domain (forms, lists, basic workflows).
- Single team, single deploy unit.
- Performance constraints are moderate.
- Domain is well understood and unlikely to change drastically.

## when NOT to use

- Domain logic dominates and you want to test it without spinning up a database.
- You expect to swap data store, payment provider, or messaging mid-life.
- Multiple teams need independent deployment cadence.
- Latency budget requires async work and your stack is sync-only.

## anti-patterns

- **Anemic domain model**: business layer is just data transfer; logic lives in
  controllers or stored procedures.
- **Skip-layer access**: presentation reading from data layer directly,
  bypassing business rules.
- **Cross-layer leak**: data layer importing presentation types (e.g., HTTP
  request objects).
- **One giant service**: business layer is one 5000-line file because "it's
  the business layer".

## migration paths

- → **Hexagonal**: when domain becomes complex enough that you want it
  testable without infra. Extract domain into a core, wrap data and
  presentation as adapters.
- → **Microservices**: when one team becomes multiple and the bounded
  contexts are now clear (do not do this before bounded contexts are clear —
  see [[microservices.md]]).
- → **Event-driven**: when synchronous flows become a bottleneck and parts of
  the work can run async.

## sources

- GeeksforGeeks software architecture patterns: https://www.geeksforgeeks.org/software-engineering/types-of-software-architecture-patterns/
- vFunction enterprise patterns: https://vfunction.com/blog/enterprise-software-architecture-patterns/
