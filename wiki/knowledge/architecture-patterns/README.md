---
name: architecture-patterns
description: Library of architecture patterns with when-to-use guidance. Use when choosing a baseline structure for a new system or refactor.
source_type: external-research
date_ingested: 2026-05-23
confidence: medium
confidence_reviewed: 2026-05-23
applicable_contexts: pending first project use
status: active
---

# Architecture patterns

Common architecture patterns with when-to-use and when-not-to-use guidance.

These are **starting points, not laws**. The right pattern depends on team
size, change rate, deployment constraints, and existing investments. Combine
patterns when useful (microservices internally use hexagonal; event-driven
often layered for ingestion paths).

## index

- [[layered.md]] — N-tier separation by responsibility (presentation, business, data)
- [[hexagonal.md]] — ports and adapters; domain isolated from infrastructure
- [[microservices.md]] — independently deployable services per bounded context
- [[event-driven.md]] — async event production, detection, consumption

## decision table

| If your project... | Start with |
|---|---|
| Small CRUD app, single team, low scale | layered |
| Domain logic complex, infra likely to change | hexagonal |
| Multiple teams, independent deploy needed | microservices (only after bounded contexts) |
| High throughput, async workflows, integrations | event-driven |
| Mixed: complex domain + multiple teams | hexagonal + microservices |
| Mixed: async ingestion + clean domain | layered or hexagonal + event-driven |

## anti-patterns across all patterns

- Picking microservices before bounded contexts are defined → distributed monolith.
- Picking event-driven without designing compensating transactions → eventual-consistency bugs in production.
- Picking hexagonal for a CRUD app → over-engineering.
- Picking layered for a system with diverse infra change rates → tight coupling at the data layer.
- Combining synchronous layered thinking with async events → race conditions and missed messages.

## relationship to LLM-Wiki

- For documenting the chosen pattern: [[../../concepts/architecture/c4-model.md]] (Level 2 containers).
- For recording why this pattern was chosen: ADR (see [[../../concepts/architecture/adr.md]]).
- For quality attribute trade-offs each pattern incurs: [[../../concepts/architecture/quality-attributes.md]].

## sources

Each pattern file lists its own sources. General comparisons drew from:

- https://vfunction.com/blog/enterprise-software-architecture-patterns/
- https://www.geeksforgeeks.org/software-engineering/types-of-software-architecture-patterns/
- https://www.happycoders.eu/software-craftsmanship/hexagonal-architecture/
