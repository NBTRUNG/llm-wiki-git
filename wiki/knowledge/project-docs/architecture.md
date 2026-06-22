---
name: architecture-doc
description: How to write wiki/architecture.md for a concrete repo. Describes system shape and boundaries before implementation details scatter through code.
date_ingested: 2026-05-23
status: active
---

# architecture doc guide

## purpose

`wiki/architecture.md` describes the system shape and boundaries for a concrete repo.

It should make the repo understandable before implementation details become scattered through code.

## include

- Context and system boundary (consider [[../../concepts/architecture/c4-model.md]] Level 1).
- Project orientation summary from `docs/project_orientation.md`.
- Major components and responsibilities (consider [[../../concepts/architecture/c4-model.md]] Level 2 + 3).
- Data/storage/deployment boundaries.
- Important flows and sequence diagrams when useful.
- Integration points and external dependencies.
- Quality attributes as scenarios (see [[../../concepts/architecture/quality-attributes.md]]).
- Explicit non-goals and deferred architecture work.
- Links to ADRs for meaningful choices (see [[../../concepts/architecture/adr.md]]).

## quality criteria

- The architecture explains why the system is structured this way.
- The architecture follows the accepted project orientation or records a
  decision explaining why it changed.
- Diagrams clarify boundaries instead of decorating the doc.
- The doc separates current architecture from future options.
- Capacity/security/deployment assumptions are visible.
- Agents can derive implementation tasks without inventing boundaries.

## anti-patterns

- Describing every class/file instead of system boundaries.
- Adding aspirational architecture not accepted by decisions.
- Hiding risky choices without ADRs.
- Letting diagrams drift from the actual repo.
- Ignoring `docs/project_orientation.md` after it has been accepted.

## related concepts

- C4 model (4 levels of zoom): [[../../concepts/architecture/c4-model.md]]
- arc42 (12-section template, all optional): [[../../concepts/architecture/arc42.md]]
- Quality attributes (scenarios for security, performance, etc.): [[../../concepts/architecture/quality-attributes.md]]
- ADR (Architecture Decision Record): [[../../concepts/architecture/adr.md]]
- Patterns library (layered, hexagonal, microservices, event-driven): [[../architecture-patterns/README.md]]
