---
name: architecture-approach-selection
description: Decision guide for choosing backend-first, data-first, API-first, frontend-first, feature-first, event-first, platform-first, or monolith-first approaches based on workload shape.
date_ingested: 2026-06-12
status: active
source_type: web-research
source_urls:
  - https://learn.microsoft.com/en-us/azure/architecture/patterns/backends-for-frontends
  - https://learn.microsoft.com/en-us/azure/architecture/patterns/cqrs
  - https://learn.microsoft.com/en-us/azure/architecture/guide/architecture-styles/event-driven
  - https://docs.aws.amazon.com/wellarchitected/latest/analytics-lens/analytics-lens.html
  - https://spec.openapis.org/oas/latest.html
  - https://www.componentdriven.org/
  - https://fsd.how/
  - https://micro-frontends.org/
  - https://www.jimmybogard.com/vertical-slice-architecture/
  - https://martinfowler.com/bliki/MonolithFirst.html
confidence: medium
confidence_reviewed: 2026-06-12
---

# architecture approach selection

## purpose

Use this guide after `docs/project_orientation.md` identifies the project's
primary design driver. Project orientation decides the dominant risk and guide
pack; this file helps choose the architecture/delivery approach that matches it.

The goal is not to pick a fashionable pattern. The goal is to match the first
architecture moves to the workload shape, risk, team topology, and proof needed.

## decision rule

Choose the approach by the system's dominant uncertainty:

| Dominant uncertainty | Prefer first | Why |
| --- | --- | --- |
| Data correctness, storage shape, reporting, ingestion, transactions | backend-first / data-first | Data and invariants are the product risk. |
| External integrations or multiple clients need stable contracts | API-first / contract-first | Consumers need a shared interface before implementation details. |
| User workflow, interaction states, design system, usability | frontend-first / component-driven | UI behavior is the product risk. |
| Product changes ship as end-to-end features | feature-first / vertical slice | Coupling should follow use cases, not technical layers. |
| Many subsystems react to the same facts or high-volume streams | event-first | Producers and consumers need decoupling and independent scale. |
| Many teams need shared self-service capabilities | platform-first | The product is an internal platform/golden path. |
| Early product, small team, unclear boundaries | monolith-first / modular monolith | Operational simplicity is more valuable than premature distribution. |

If two uncertainties are tied, choose the approach that reduces irreversible
risk first. For example, choose data-first before UI-first when regulatory data
retention or transaction integrity can invalidate the product.

## approach catalog

### backend-first / data-first

Use when:

- workload is dominated by data ingestion, transformations, reporting, search,
  analytics, consistency, permissions, or domain invariants;
- data model mistakes are expensive to migrate;
- read/write paths have very different performance or security needs;
- UI is mostly a view over complex backend state.

First artifacts:

- domain/data model;
- storage choice and access patterns;
- invariants and transaction boundaries;
- read/write workload split;
- API/query shapes;
- observability and data-quality checks.

Best practices:

- Start with data ownership and invariants, not controllers.
- Use CQRS only when read and write models genuinely diverge.
- For analytics workloads, document ingestion, storage, processing, serving,
  governance, security, reliability, and cost/performance assumptions.
- Keep UI mockups light until data contracts are credible.

Avoid when:

- the core risk is whether users can understand or complete a workflow;
- the backend can be a simple CRUD/API facade for a strongly UI-led product.

### API-first / contract-first

Use when:

- multiple clients, teams, or external consumers depend on the service;
- frontend and backend can work in parallel only if contracts are stable;
- generated clients, tests, mocks, docs, or gateways are needed.

First artifacts:

- OpenAPI or equivalent contract;
- request/response examples;
- error model;
- auth/security contract;
- versioning and deprecation policy;
- consumer-driven contract tests when useful.

Best practices:

- Treat the API contract as source of truth for integration behavior.
- Include examples and errors, not just happy-path schemas.
- Version contract changes deliberately.
- Do not let implementation code silently redefine the contract.

Avoid when:

- product behavior is still unknown and contract churn would be constant;
- only one internal UI consumes a trivial backend and no parallel work depends
  on a contract.

### frontend-first / component-driven

Use when:

- product value is dominated by workflow, usability, state transitions, visual
  hierarchy, dense controls, dashboards, or multi-step user tasks;
- backend can be mocked safely at first;
- design system and component behavior are major sources of risk.

First artifacts:

- user journey / workflow map;
- route map;
- component inventory;
- component states and accessibility expectations;
- design tokens and UI contracts;
- mocked data examples, including empty/error/loading states.

Best practices:

- Build components in isolation, define states, then compose pages.
- Use mocks to explore hard-to-reach states before backend integration.
- Keep frontend-first honest with explicit data contracts and later backend
  validation.
- For UI-heavy repos, declare canonical `ui_map/` and design-system paths.

Avoid when:

- backend invariants or data compliance can invalidate the workflow;
- mock data hides expensive backend constraints.

### feature-first / vertical slice

Use when:

- work naturally ships as end-to-end product features;
- a small or medium team owns UI, API, and data changes together;
- layer-based architecture creates many cross-layer edits for every feature;
- local cohesion inside a use case matters more than global technical layering.

First artifacts:

- feature/use-case list;
- slice boundaries;
- per-slice input/output and validation;
- shared contracts only where cross-slice reuse is real;
- acceptance tests by user-visible behavior.

Best practices:

- Couple code along the axis of change.
- Keep shared abstractions rare and justified by repeated use.
- Let simple slices stay simple; move domain logic out only when complexity
  appears.
- Keep each feature ACID-complete before delegation.

Avoid when:

- strict shared domain invariants need central modeling before features split;
- the team lacks refactoring discipline and every slice will duplicate
  fragile logic.

### BFF / client-specific backend

Use when:

- multiple frontend clients have meaningfully different requirements;
- one shared backend creates bottlenecks for frontend teams;
- mobile, desktop, admin, or partner clients need different aggregation,
  caching, payload, or release cadence.

First artifacts:

- client types and their constraints;
- BFF ownership by client/team;
- shared backend boundaries;
- cross-cutting concerns: auth, rate limiting, logging, monitoring;
- latency and operational overhead budget.

Best practices:

- Keep BFF logic client-specific.
- Do not duplicate core domain rules in BFFs.
- Consider GraphQL or API gateway aggregation when BFF would add unnecessary
  services.

Avoid when:

- only one client exists;
- all clients make the same requests;
- the team cannot absorb extra deployment/security/observability overhead.

### event-first

Use when:

- multiple consumers need to react to the same facts;
- real-time or near-real-time processing matters;
- high volume/high velocity ingestion is central;
- producers and consumers need independent scale or release cycles.

First artifacts:

- event catalog;
- producer/consumer map;
- event schema and versioning policy;
- ordering/idempotency/retry/DLQ strategy;
- correlation IDs and trace propagation;
- eventual consistency model.

Best practices:

- Decide whether the workload needs pub/sub, durable event streams, or both.
- Keep event payloads intentional: either enough data for consumers or keys to
  fetch from the system of record.
- Plan observability and replay/error handling from the beginning.

Avoid when:

- simple request/response is enough;
- strong consistency across services is mandatory;
- the team cannot operate asynchronous distributed workflows.

### platform-first

Use when:

- multiple product teams need common self-service capabilities;
- the work is an internal platform, golden path, or developer portal;
- reducing cognitive load and duplicated infrastructure work is the product
  outcome.

First artifacts:

- internal user groups;
- golden paths;
- capability catalog;
- portal/API/CLI surface;
- onboarding docs and templates;
- success metrics such as time-to-first-change, deployment lead time, service
  request latency, user satisfaction, and change failure rate.

Best practices:

- Treat the platform as a product.
- Build the thinnest useful layer over managed/shared capabilities.
- Start from engaged users and common use cases, not a complete platform map.

Avoid when:

- only one team/product needs the capability;
- the platform would become gatekeeping instead of self-service.

### monolith-first / modular monolith

Use when:

- product boundaries are still unclear;
- the team is small;
- operational simplicity matters;
- distribution would create coordination, deployment, observability, and data
  consistency overhead before it creates value.

First artifacts:

- module boundaries;
- dependency rules;
- data ownership by module;
- contracts for shared names and integration points;
- extraction criteria for future services.

Best practices:

- Keep modules explicit even inside one deployable.
- Add architectural fitness checks if module boundaries matter.
- Extract services only when scaling, ownership, reliability, or deployment
  independence justifies the cost.

Avoid when:

- independent deployability is already a hard requirement;
- teams already own separate bounded contexts with separate runtime needs.

## quick chooser

| Product type | Default starting approach |
| --- | --- |
| Analytics/reporting/ETL/search/data platform | backend-first / data-first |
| Admin dashboard over complex data | data-first + frontend-first states |
| SaaS CRUD with evolving workflows | feature-first / vertical slice |
| Consumer UI, design-heavy product, workflow prototype | frontend-first / component-driven |
| Public API or partner integration | API-first / contract-first |
| Mobile + web + admin clients over same domain | BFF or GraphQL/API gateway evaluation |
| IoT, notifications, audit streams, async workflows | event-first |
| Internal developer platform | platform-first |
| New small product with unclear boundaries | monolith-first with modular boundaries |

## required decision note

When a project chooses an approach, record this short note in the architecture
doc or ADR:

```md
## Architecture approach

Chosen approach:
Dominant uncertainty:
Why this approach fits:
Rejected approaches:
First artifacts:
Review trigger:
```

## anti-patterns

- Choosing microservices before the product has clear module or team boundaries.
- Choosing frontend-first while ignoring data invariants that can invalidate the
  workflow.
- Choosing backend-first because it feels safer when the real risk is user
  workflow fit.
- Creating BFF services for one client or identical client needs.
- Using CQRS for simple CRUD without read/write asymmetry.
- Using event-driven architecture without idempotency, replay, schema
  evolution, and correlation IDs.
- Calling feature-first work "vertical slice" while still forcing every feature
  through shared layer abstractions.
- Treating platform-first as central control instead of self-service.

## relationship to LLM-Wiki

- Project orientation guide: [[project_orientation.md]]
- Architecture skill guide: [[architecture_skill.md]]
- Design-system guide: [[design_system.md]]
- Task decomposition: [[../../../harness/task-decomposition.md]]
- Task packet: [[../../../harness/task-packet.md]]
- Contracts guide: [[contracts.md]]
- ADR guide: [[../../concepts/architecture/adr.md]]
