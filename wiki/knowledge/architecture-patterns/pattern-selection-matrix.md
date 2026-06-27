---
name: architecture-pattern-selection-matrix
description: Cross-pattern decision, validation, security, observability, and test-evidence matrix for choosing architecture patterns.
source_type: web-research
date_ingested: 2026-06-24
confidence: medium
confidence_reviewed: 2026-06-24
status: active
sources:
  - https://martinfowler.com/articles/microservices.html
  - https://martinfowler.com/bliki/StranglerFigApplication.html
  - https://microservices.io/patterns/data/saga.html
  - https://alistair.cockburn.us/hexagonal-architecture
  - https://github.com/cncf/toc/blob/main/DEFINITION.md
  - https://docs.aws.amazon.com/wellarchitected/latest/framework/the-pillars-of-the-framework.html
  - https://opentelemetry.io/docs/what-is-opentelemetry/
  - https://c4model.com/
  - https://csrc.nist.gov/pubs/sp/800/207/final
  - https://owasp.org/www-project-threat-modeling/
---

# Pattern selection matrix

## purpose

Use this matrix when choosing or reviewing an architecture pattern. It does not
replace the individual pattern files; it makes selection, validation, and test
evidence explicit.

For workload-first approach selection, see
[[../project-docs/architecture_approach_selection.md]]. For architecture docs,
ADRs, C4 views, and observability gates, see
[[../project-docs/architecture_skill.md]].

## research baseline

Research checked on 2026-06-24:

- Martin Fowler and James Lewis describe microservices as independently
  deployable services organized around business capability, with decentralized
  data/governance, infrastructure automation, and design-for-failure concerns.
- Alistair Cockburn's hexagonal architecture isolates the application core from
  outside technologies through ports and adapters.
- Chris Richardson's saga pattern frames cross-service data consistency as a
  sequence of local transactions coordinated by choreography or orchestration.
- CNCF Cloud Native Definition v1.1 emphasizes loosely coupled systems that are
  secure, resilient, manageable, sustainable, and observable.
- AWS Well-Architected uses quality pillars as review lenses; map pattern
  choices to measurable quality-attribute scenarios, not adjectives.
- OpenTelemetry treats traces, metrics, logs, and baggage as architecture-level
  telemetry signals that need propagation and ownership decisions.
- C4 is the default lightweight view model for context, container, component,
  and code-level architecture communication.
- NIST SP 800-207 defines zero trust as a move from static network perimeters
  toward users, assets, resources, and per-session authentication and
  authorization.
- OWASP Threat Modeling Project recommends using current threat modeling as a
  lifecycle practice to identify threats, mitigations, validation, and residual
  risk.

## quick chooser

| Context | Prefer | Avoid |
| --- | --- | --- |
| Small team, early product, unclear domain boundaries | [[modular-monolith.md]] or [[layered.md]] | Microservices before module boundaries are real |
| CRUD-heavy app, framework conventions matter more than domain isolation | [[layered.md]] | Hexagonal ceremony without domain payoff |
| Complex domain, external systems likely to change | [[hexagonal.md]] | Controllers, ORMs, or cloud SDKs inside the domain |
| Multiple teams need independent deployment by bounded context | [[microservices.md]] | Shared database, shared release train, service-per-table |
| Multiple consumers react to the same facts or high-volume async work | [[event-driven.md]] | Events without idempotency, schema versioning, replay, and DLQ |
| Sensitive resources, admin functions, multi-tenancy, production service calls, or regulated data | [[zero-trust-security.md]] with defense in depth | Trusting VPN, network location, service mesh membership, or UI-only checks |
| Legacy replacement where big-bang rewrite is risky | Strangler fig migration toward modular monolith or services | Rewriting the whole system behind one deadline |
| Cross-service workflow needs data consistency without 2PC | Saga with compensation | Distributed transaction assumptions hidden in code |

## decision matrix

| Pattern | Main benefit | Main cost | Required proof before adoption |
| --- | --- | --- | --- |
| Layered | Fast onboarding and framework fit | Logic can leak across layers | Layer dependency rule, business logic location, relevant tests. |
| Modular monolith | Clear module boundaries with one deployable | Requires discipline to prevent module erosion | Module map, allowed dependencies, module boundary test or review gate. |
| Hexagonal | Domain isolated from infrastructure | More interfaces/wiring than simple CRUD | Ports owned by core, adapters outside core, domain tests without infra. |
| Microservices | Independent deploy/scale/ownership | Distributed systems and platform overhead | Bounded contexts, service ownership, independent deploy proof, observability, failure handling. |
| Event-driven | Async decoupling and throughput | Eventual consistency and operational complexity | Event catalog, schemas, idempotency, DLQ/retry, replay, trace correlation. |
| Zero-trust security | Limits blast radius and removes implicit network trust | Policy, identity, telemetry, and migration overhead | Trust-boundary diagram, authn/authz tests, policy enforcement proof, audit evidence. |
| Strangler fig | Incremental modernization | Temporary routing/compatibility complexity | Cutover boundary, traffic routing, rollback path, old/new behavior comparison. |
| Saga | Cross-service workflow consistency | Compensation complexity and partial-failure reasoning | Local transaction list, compensation per step, timeout/retry policy, audit trail. |

## architecture validation matrix

| Validation area | Required answer | Evidence examples |
| --- | --- | --- |
| Boundary | What is the system/container/module/service boundary? | C4 context/container/component view, module map, service catalog. |
| Ownership | Who owns each boundary and its data/contracts? | Team map, code owners, docs/contracts.md, ADR. |
| Data consistency | Which data must be strongly consistent and which may be eventual? | Transaction boundary note, saga design, read-model lag expectation. |
| Security | Where are trust boundaries, auth checks, secrets, and tenant/data isolation? | Threat notes, STRIDE sketch, authz tests, config proof. |
| Observability | How are traces, metrics, logs, correlation IDs, and alerts propagated? | OpenTelemetry plan, dashboard/alert owner, trace smoke test. |
| Reliability | What fails independently and what is the recovery/rollback path? | Failure-mode table, retry/DLQ proof, rollback note, backup/restore check. |
| Performance | What is the latency, throughput, fan-out, or resource bottleneck? | Load smoke test, query/fan-out review, cache/payload note. |
| Operability | Can the team deploy, monitor, debug, and support this pattern? | Runbook, deployment proof, on-call ownership, incident path. |
| Evolution | What triggers migration to another pattern? | Review trigger, extraction criteria, ADR supersession path. |

## architecture test matrix

Use this mini-matrix in architecture docs, ADRs, or validation reports when a
pattern choice affects implementation:

| Test target | Check |
| --- | --- |
| Dependency direction | Static import/dependency rule, package boundary test, or manual path review. |
| Contract stability | API/schema/event compatibility test or documented consumer review. |
| Data ownership | No cross-boundary writes; no shared database mutation across services/modules. |
| Failure behavior | Timeout, retry, circuit breaker, DLQ, compensation, or rollback path tested. |
| Observability | Trace/correlation ID crosses boundary; logs/metrics identify owner and operation. |
| Security boundary | Authn/authz/tenant denial path tested at the boundary. |
| Deployment independence | Service/module can build, test, and deploy or release without unrelated units when the pattern promises it. |

## stop conditions

Stop and require an ADR or architecture review when:

- the pattern choice changes deployability, data ownership, trust boundaries, or
  team ownership;
- a microservice or event boundary is proposed without a C4 container view;
- a service split is proposed without independent deployment and data ownership;
- events are proposed without schema evolution, idempotency, DLQ/replay, and
  trace propagation;
- a modular monolith is proposed without dependency rules;
- a legacy rewrite is proposed without an incremental migration or rollback
  path.

## done signal

A pattern decision is ready when the chosen pattern, rejected patterns,
quality-attribute trade-offs, architecture tests, and review trigger are visible
in the architecture doc or ADR.
