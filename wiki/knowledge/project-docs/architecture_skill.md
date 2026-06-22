---
name: architecture-skill-guide
description: Source-backed operating guide for architecture work in LLM-Wiki projects. Covers C4 views, arc42 documentation scope, ADR decision capture, platform engineering, and observability gates.
date_ingested: 2026-06-11
status: active
source_type: web-research
source_urls:
  - https://c4model.com/
  - https://docs.arc42.org/home/
  - https://adr.github.io/
  - https://tag-app-delivery.cncf.io/whitepapers/platforms/
  - https://opentelemetry.io/docs/what-is-opentelemetry/
confidence: medium
confidence_reviewed: 2026-06-11
---

# architecture skill guide

## purpose

Use this guide when an agent is asked to design, review, or document software
architecture for a project.

It is not a replacement for the project's repo docs. In a real repo, the active
source of truth remains the repo's architecture doc, decisions, code, contracts,
and task packets.

## default output shape

For architecture work, produce these in order:

1. One-sentence architecture intent.
2. Scope boundary: system, web, software, platform, or design-system
   architecture.
3. Architecture approach selection when the workload shape is not obvious
   (see [[architecture_approach_selection.md]]).
4. C4-level view needed for the task:
   - Level 1: system context.
   - Level 2: containers.
   - Level 3: components.
   - Level 4: code, only when implementation structure is the decision.
5. Key decisions and trade-offs.
6. Quality attributes as measurable scenarios.
7. ADR recommendation when the decision is architecturally significant.
8. Validation/evidence needed before acceptance.

Do not create a large architecture document when a short decision or one C4 view
will settle the task.

## source-backed rules

### C4 first for shared understanding

Use C4 when stakeholders need to understand system boundaries and decomposition.
Prefer the smallest useful view:

- Context: users, external systems, and the system in scope.
- Container: deployable/runtime units and data stores.
- Component: responsibilities inside one container.
- Code: only for detailed implementation structure.

Every diagram should have a title, clear labels, and enough legend/context that
it can be understood without the author's narration.

### arc42 for documentation completeness

Use arc42 as a checklist, not a mandatory full template. Pull only the sections
needed by the current project:

- Introduction and goals.
- Constraints.
- Context and scope.
- Solution strategy.
- Building block, runtime, and deployment views.
- Crosscutting concepts.
- Architecture decisions.
- Quality.
- Risks and technical debt.
- Glossary.

For lean projects, document only the parts that affect current decisions,
implementation boundaries, or future maintenance.

### ADRs for meaningful choices

Create or update an ADR when a decision changes architecture, contracts,
quality attributes, deployment posture, data ownership, security posture, or
major dependencies.

An ADR should capture one decision, its context, alternatives, consequences, and
supersession status. Do not silently edit historical ADR rationale; supersede or
append review notes instead.

### Platform architecture as product

For platform/internal-developer-platform work, treat the platform as a product
for internal users. The architecture should show:

- user groups and golden paths;
- self-service interfaces: portal, API, CLI, templates, docs;
- thin platform layer over managed or shared capabilities;
- security/compliance defaults;
- metrics for user satisfaction, productivity, delivery, reliability, and
  change failure.

Avoid building platform features before a real user path and success measure
exist.

### Observability is an architecture concern

For distributed, production, or platform work, require observability decisions
up front:

- telemetry signals: traces, metrics, logs, and when useful profiles;
- propagation across service boundaries;
- semantic naming conventions;
- collector/export path;
- backend ownership;
- sampling/redaction policy;
- dashboard and alert ownership.

OpenTelemetry is a framework/toolkit for generating, collecting, and exporting
telemetry data. It is not the storage or dashboard backend.

## architecture review checklist

- Source of truth identified before design starts.
- Workload shape and dominant uncertainty identified.
- Chosen approach matches the dominant uncertainty.
- C4 level matches the decision scope.
- System boundary and external dependencies are explicit.
- Major runtime/data/deployment boundaries are visible.
- Quality attributes are written as scenarios, not adjectives.
- Security, privacy, observability, and operability are not deferred silently.
- Platform work has a user path and self-service boundary.
- ADR exists for architecturally significant decisions.
- Implementation tasks can be derived without inventing names or contracts.

## anti-patterns

- Drawing diagrams that do not answer a decision question.
- Using C4 Level 4 when Level 1 or 2 is enough.
- Filling every arc42 section for a small project.
- Recording architecture only in chat.
- Treating platform engineering as an infrastructure dump instead of a product.
- Adding OpenTelemetry packages without deciding signal ownership and backend
  flow.
- Letting ADRs become mutable status notes.

## relationship to LLM-Wiki

- Project architecture doc guide: [[architecture.md]]
- C4 concept: [[../../concepts/architecture/c4-model.md]]
- arc42 concept: [[../../concepts/architecture/arc42.md]]
- ADR concept: [[../../concepts/architecture/adr.md]]
- Quality attributes: [[../../concepts/architecture/quality-attributes.md]]
- Architecture approach selection: [[architecture_approach_selection.md]]
- Design-system guide: [[design_system.md]]
