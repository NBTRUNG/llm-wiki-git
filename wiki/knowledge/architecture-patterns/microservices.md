---
name: microservices-architecture
description: Independently deployable services per bounded context. Use only when bounded contexts are clearly defined and multiple teams need deployment independence. Distributed monolith anti-pattern is the common failure mode.
source_type: external-research
source_urls:
  - https://medium.com/@darshit.gandhi_44389/microservices-vs-hexagonal-architecture-1637f7fdb9f5
  - https://blog.patoliyainfotech.com/software-architecture-patterns-guide/
date_ingested: 2026-05-23
confidence: medium
confidence_reviewed: 2026-05-23
applicable_contexts: pending first project use
status: active
---

# Microservices architecture

The system is decomposed into multiple services, each:

- owns its data;
- exposes a network API (REST, gRPC, events);
- can be deployed independently;
- can be scaled independently;
- can be written in a different language/runtime if needed.

Services communicate over the network, never via direct in-process calls.

## strengths

- **Independent deployment**: teams ship at their own cadence; no shared
  release train.
- **Independent scaling**: scale high-traffic services without scaling the
  rest.
- **Technology heterogeneity**: each service picks the best tool for its job.
- **Fault isolation**: one service crashing does not always take down the
  rest.

## weaknesses

- **Distributed-systems complexity**: network is unreliable; latency is
  non-zero; partial failures are common.
- **Eventual consistency**: cross-service transactions require sagas and
  compensating actions, not 2-phase commit.
- **Operational overhead**: you now need a service mesh, distributed tracing,
  centralized logging, secrets management, service discovery, deployment
  automation.
- **Cost of cross-service queries**: data that used to be a JOIN is now an
  RPC fan-out.
- **Hard to refactor**: moving a function from service A to service B is a
  release coordination project.

## prerequisites

Do **not** start microservices until:

1. **Bounded contexts are clear**. Domain-driven design has identified the
   conceptual boundaries. If you cannot draw them, do not split.
2. **You have the operational platform**. Service mesh, tracing, logging,
   CI/CD per service, error budgets, on-call rotations.
3. **You have multiple teams** large enough that coordination overhead in a
   monolith is real.
4. **Performance requires it** OR organizational scaling requires it. Do not
   adopt for fashion.

## when to use

- 50+ engineers across multiple product domains.
- Different parts of the system need radically different scaling profiles
  (e.g., search vs checkout).
- Acquisition or merger that brings together different stacks.
- Regulated industries where some services need different compliance scope
  than others.

## when NOT to use

- Fewer than ~20 engineers — overhead exceeds benefit.
- Bounded contexts not yet stable.
- No platform team to operate service infrastructure.
- The domain has tightly coupled transactions across all components.
- Greenfield where you can ship faster as a modular monolith first.

## anti-patterns

- **Distributed monolith**: services that cannot be deployed independently
  because they share a database, a release calendar, or synchronous chains.
  Full complexity, zero deployment independence — the worst of both worlds.
- **Service per table**: splitting by data shape, not by domain. Creates
  fragile join-via-RPC traffic.
- **Shared database**: multiple services writing to the same schema. Couples
  them at runtime; defeats independent deploy.
- **Network call where a function call would do**: gratuitous service
  boundaries.
- **One giant service ("the monolith") + 100 tiny satellites**: you
  microserviced the easy parts and left the hard part untouched.

## migration paths

- **Modular monolith → microservices**: first refactor the monolith into
  modules with clean interfaces (essentially hexagonal). When module
  boundaries are stable and a team needs deploy independence, lift one module
  into its own service.
- **From legacy → microservices**: strangler-fig pattern. Route requests
  for one feature to a new service; keep old code running until traffic is
  all on the new service.

## combinations

- **Microservices + Hexagonal**: each service is internally hexagonal,
  isolating domain from infra.
- **Microservices + Event-driven**: services emit events; other services
  subscribe. Reduces synchronous coupling but introduces eventual consistency.
- **Microservices + Saga**: cross-service transactions use the saga pattern
  with compensating actions for each step.

## sources

- Microservices vs Hexagonal: https://medium.com/@darshit.gandhi_44389/microservices-vs-hexagonal-architecture-1637f7fdb9f5
- Patoliya Infotech patterns guide: https://blog.patoliyainfotech.com/software-architecture-patterns-guide/
- Martin Fowler's microservices article (widely cited): https://martinfowler.com/articles/microservices.html
