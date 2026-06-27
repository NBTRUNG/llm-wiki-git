---
name: modular-monolith
description: Single deployable system with explicit internal modules and dependency rules. Use for small-to-medium teams that need clear boundaries without distributed-systems overhead.
source_type: web-research + project-file-back
date_ingested: 2026-06-24
confidence: medium
confidence_reviewed: 2026-06-24
status: active
source_urls:
  - https://martinfowler.com/bliki/MonolithFirst.html
  - https://martinfowler.com/articles/microservices.html
  - https://github.com/cncf/toc/blob/main/DEFINITION.md
  - https://c4model.com/
---

# Modular monolith

A modular monolith is one deployable application with explicit internal module
boundaries. It keeps the operational simplicity of a monolith while making
future extraction possible if a module later needs independent deployment,
scaling, ownership, or reliability.

```
Single deployable app
  modules/
    billing/      owns billing rules and tables
    catalog/      owns catalog rules and tables
    identity/     owns identity rules and tables
  shared/
    platform primitives only, not domain shortcuts
```

## strengths

- One deployable, one runtime, simpler local development and debugging.
- Clear module boundaries without network latency, distributed tracing, service
  discovery, service mesh, or cross-service transaction overhead.
- Good default for small and medium teams whose domain boundaries are still
  evolving.
- Creates a lower-risk path to microservices because module seams can be
  extracted later when justified by evidence.

## weaknesses

- Boundaries rely on discipline and automated checks; without them, the system
  becomes a conventional tangled monolith.
- All modules still share one release cadence unless additional deployment
  mechanisms are introduced.
- Hot modules cannot scale independently without extraction or runtime
  partitioning.
- A single process/runtime failure can still affect the whole application.

## when to use

- New product, small team, or unclear bounded contexts.
- Domain is bigger than simple CRUD but not yet worth distributed deployment.
- You need fast feature delivery with enough structure to avoid layer sprawl.
- Future service extraction is plausible but not yet proven.
- The team can enforce dependency rules in CI or review.

## when NOT to use

- Independent deployment is already a hard requirement.
- Separate teams already own stable bounded contexts with separate runtime
  needs.
- Regulatory, reliability, or scaling constraints require process or account
  isolation now.
- The team will not maintain module rules or ownership.

## module rules

- Each module owns its domain logic and, when possible, its data access.
- Cross-module access goes through explicit interfaces, commands, events, or
  application services.
- Modules do not import each other's internals.
- Shared code is limited to platform primitives: logging, config, auth helpers,
  validation primitives, telemetry, and common technical utilities.
- Shared domain logic is a warning sign; either define the owning module or
  promote a clear domain concept.

## validation

Before accepting a modular monolith architecture, record:

- module map and responsibilities;
- allowed dependency direction;
- shared-kernel policy;
- data ownership per module;
- cross-module call/event rules;
- static dependency check or manual review gate;
- extraction criteria for future service split.

## anti-patterns

- **Folder-only modules**: directories exist, but any module can import any
  other module's internals.
- **Shared domain dumping ground**: common package contains business rules from
  every module.
- **Hidden service split**: modules communicate through HTTP or queues inside
  the same deployable without a real operational reason.
- **Premature extraction**: moving a module to a service before ownership,
  scale, reliability, or deployment independence justifies the cost.
- **One database free-for-all**: every module writes every table directly.

## migration paths

- -> **Hexagonal**: when a module's domain needs stronger isolation from
  frameworks, databases, queues, or vendor APIs.
- -> **Microservices**: when one module has stable boundaries and needs
  independent deployment, scaling, ownership, or reliability.
- -> **Event-driven**: when module interactions become async workflows with
  multiple consumers or throughput spikes.

## sources

- Martin Fowler - Monolith First: https://martinfowler.com/bliki/MonolithFirst.html
- Martin Fowler and James Lewis - Microservices: https://martinfowler.com/articles/microservices.html
- CNCF Cloud Native Definition v1.1: https://github.com/cncf/toc/blob/main/DEFINITION.md
- C4 model: https://c4model.com/
