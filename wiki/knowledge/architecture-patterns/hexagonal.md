---
name: hexagonal-architecture
description: Ports and Adapters. Domain logic isolated from infrastructure via interfaces. Use when domain logic is complex and external systems may change.
source_type: external-research
source_urls:
  - https://www.happycoders.eu/software-craftsmanship/hexagonal-architecture/
  - https://www.geeksforgeeks.org/system-design/hexagonal-architecture-system-design/
  - https://alistair.cockburn.us/hexagonal-architecture/ (Alistair Cockburn's original)
date_ingested: 2026-05-23
confidence: medium
confidence_reviewed: 2026-05-23
applicable_contexts: pending first project use
status: active
---

# Hexagonal architecture (Ports and Adapters)

Originated by Alistair Cockburn. The domain (business logic) sits in the
center. It talks to the outside world only through **ports** (interfaces
defined by the domain), and the outside world plugs in via **adapters** that
implement those interfaces.

```
            ┌──────────────────────┐
HTTP API ───┤                      ├─── PostgreSQL
            │                      │
CLI        ─┤   Domain (Core)      ├─── Redis
            │                      │
Cron       ─┤                      ├─── S3
            └──────────────────────┘
            adapters   ports + core    adapters
```

## components

- **Core / Domain**: pure business logic. No imports from databases, HTTP
  frameworks, ORMs, cloud SDKs. Testable in isolation with no infrastructure.
- **Ports**: interfaces the domain owns. "I need a `UserRepository` with these
  methods" or "I produce events of these types".
- **Adapters**: concrete implementations of ports. Inbound adapters drive the
  domain (HTTP controllers, message consumers, CLI parsers). Outbound adapters
  are driven by the domain (database repositories, HTTP clients, queue
  publishers).

## strengths

- **Testability**: domain logic tested without spinning up infra; tests are
  fast and deterministic.
- **Swappability**: replace PostgreSQL with MySQL by writing a new adapter;
  domain unchanged.
- **Multiple entry points**: same domain logic exposed via REST, GraphQL,
  gRPC, CLI, cron — each just another inbound adapter.
- **Forces explicit dependencies**: the domain cannot accidentally take a
  dependency on infra it should not know about.

## weaknesses

- **Initial complexity**: more code than layered for the same feature (port
  interface + adapter implementation + DI wiring).
- **Over-engineering risk** for simple CRUD apps — the abstraction layers
  add no value.
- **Cost**: adds 20–30% to initial build time, but typically returns the
  investment within 2–3 quarters as the domain grows.
- **Learning curve**: junior engineers often skip the port and import the
  adapter directly, defeating the pattern.

## when to use

- Domain logic is complex and worth isolating (banking, insurance, healthcare,
  scheduling, pricing engines).
- Multiple inbound entry points planned (web API + worker + CLI).
- Infrastructure is expected to change (planning a database migration,
  multi-cloud, vendor swap).
- Strong testability requirement — you want fast tests that don't depend on
  test containers.

## when NOT to use

- Pure CRUD with no real domain logic.
- Throwaway prototype.
- Team unfamiliar with dependency injection and interfaces.
- Hot path where the overhead of going through ports matters (rare, but
  measurable in some latency-critical paths).

## anti-patterns

- **Leaky port**: port interface mentions HTTP, SQL, or framework types —
  defeats the purpose.
- **Anemic core**: domain has only data, no behavior; "logic" lives in
  application services that thinly wrap repository calls.
- **Adapter doing domain work**: adapter performs business decisions that
  belong in the core.
- **One giant port**: a single `IRepository` for everything; lacks the
  segregation that makes adapters easy to test.

## combinations

- **Hexagonal + Microservices**: each service is hexagonal internally with its
  own bounded context. Avoids the distributed-monolith trap by keeping cross-
  service contracts explicit at adapter boundaries.
- **Hexagonal + Event-driven**: event producers and consumers are adapters;
  the domain stays sync and pure, the async machinery is on the outside.
- **Hexagonal + DDD bounded contexts**: each bounded context is its own
  hexagon.

## sources

- Alistair Cockburn's original article: https://alistair.cockburn.us/hexagonal-architecture/
- HappyCoders introduction: https://www.happycoders.eu/software-craftsmanship/hexagonal-architecture/
- GeeksforGeeks system design: https://www.geeksforgeeks.org/system-design/hexagonal-architecture-system-design/
