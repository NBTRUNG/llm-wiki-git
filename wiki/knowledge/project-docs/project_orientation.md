---
name: project-orientation
description: How to choose and record the primary design driver for a project before implementation planning.
date_ingested: 2026-06-20
status: active
---

# project orientation guide

## purpose

`docs/project_orientation.md` records how a project should be approached before
agents decompose work or write code.

This file prevents the common failure mode where a project defaults to
backend-first, frontend-first, or framework-first without first identifying the
real uncertainty and risk.

## rule

Every new project must answer the orientation questions before the first
implementation plan is accepted.

The orientation does not replace architecture. It decides which guides and
source-of-truth docs must be created or read first.

Project orientation is a high-volatility topic. Before accepting orientation
for a broad or technology-sensitive project, check
`../../../research/watchlist.md` and `../../../harness/research-intake-loop.md`
for relevant current research.

## orientation dimensions

Record all five dimensions:

```md
- Primary design driver:
- Secondary drivers:
- Code organization:
- Delivery strategy:
- First proof required:
```

Use this vocabulary unless the project has a stronger repo-specific term.

Primary design driver:

- `content-first`
- `workflow-first`
- `human-centered-ui-first`
- `domain-first`
- `api-contract-first`
- `data-first`
- `event-first`
- `security-risk-first`
- `platform-golden-path-first`
- `operability-first`
- `ai-evaluation-first`
- `migration/refactor-first`

Code organization:

- `feature-first`
- `vertical-slice`
- `modular-monolith`
- `bounded-context`
- `layer-first`
- `plugin/extension-first`

Delivery strategy:

- `UI prototype first`
- `CMS/content model first`
- `contract first`
- `vertical slice first`
- `backend service first`
- `data model first`
- `deployment path first`
- `security model first`
- `eval harness first`

First proof required:

- UX route/workflow proof
- CMS/content authoring proof
- API contract proof
- domain invariant proof
- data integrity/migration proof
- security boundary proof
- performance budget proof
- deployment smoke proof
- agent/eval reliability proof

## pre-project questions

Ask these before choosing an orientation. Keep answers short and mark unknowns.

### Product and users

- Who are the primary users?
- What user/business outcome proves the project is valuable?
- Is the product mainly public-facing, internal, admin, API-only, data pipeline,
  platform, AI/agent, or migration/refactor?
- Which workflow must be clear on day one?

### Content and UI

- Is content structure, editorial workflow, route hierarchy, SEO, accessibility,
  or visual trust a major success factor?
- Are there public pages, dashboards, editors, dense controls, or mobile states?
- Are loading, empty, error, unauthorized, and responsive states part of the
  product risk?
- Does the project need a design system, route map, or UI workflow map before
  backend work?

### Domain and data

- Are business rules, permissions, state transitions, calculations, or
  invariants complex?
- Is there a system of record? Who owns each data type?
- Are migration, import/export, reporting, audit, retention, or data quality
  risky?
- Would a wrong data model be expensive to change later?

### Contracts and integrations

- Will multiple clients, agents, services, or external partners depend on the
  same interface?
- Are routes, DTOs, events, CMS aliases, roles, permissions, or public schemas
  shared contracts?
- Can frontend/backend/data work proceed in parallel only after a contract is
  fixed?

### Security and privacy

- Does the project touch login, roles, permissions, upload, payment, PII,
  sensitive content, secrets, external callbacks, or public APIs?
- What are the trust boundaries?
- What must not be logged, exposed, cached, or sent to an external service?

### Operations and deployment

- Where will it run first: local, VPS/VM, managed app service, container runtime,
  Kubernetes, edge/frontend platform, or hybrid?
- What are the rollback, backup, health check, log, monitoring, and cost
  expectations?
- Is deployment/operability itself a major uncertainty?

### Team and agent workflow

- Will multiple agents or humans work in parallel?
- Which files or features are likely to conflict?
- What docs must agents read every session so they do not act from vague memory?
- Which decision needs human approval before implementation starts?

## chooser

| If the strongest risk is... | Choose primary driver | Required first docs |
| --- | --- | --- |
| Public content, trust, navigation, SEO, editorial workflow | `content-first` + `human-centered-ui-first` | `project_brief.md`, `project_orientation.md`, `design_system.md`, `ui_map/*`, `contracts.md` for CMS/content aliases |
| User journey, state transitions, task completion | `workflow-first` | `project_orientation.md`, `ui_map/_UI_WORKFLOW.md` or workflow section, `test_matrix.md` |
| Dense interaction, visual hierarchy, responsive/accessibility states | `human-centered-ui-first` | `design_system.md`, `ui_map/*`, mocked data contracts, UI proof tasks |
| Complex business rules and language | `domain-first` | `architecture.md`, `contracts.md`, `decisions.md`, glossary/domain section, invariant tests |
| Multiple clients/teams/services need stable interfaces | `api-contract-first` | `contracts.md`, OpenAPI/schema/event docs if applicable, contract tests |
| Data correctness, migration, reporting, audit | `data-first` | data model section, migration/import plan, `test_matrix.md`, backup/rollback notes |
| Many consumers react to facts asynchronously | `event-first` | event catalog, producer/consumer map, schema/versioning/idempotency notes |
| Login, permissions, PII, upload, payment, external callbacks | `security-risk-first` | security boundary/threat notes, `contracts.md`, validation/test plan |
| Many repos/teams need standard self-service | `platform-golden-path-first` | golden path docs, templates, onboarding, platform capability catalog |
| Production deployment, rollback, monitoring, scale, cost | `operability-first` | deployment/runbook notes, health checks, observability, backup/rollback plan |
| LLM/agent behavior, RAG, tool use, generated output | `ai-evaluation-first` | eval harness, grounding/source policy, tool boundary, trace/replay plan |
| Existing system must be changed safely | `migration/refactor-first` | current-state map, characterization tests, rollback plan, phased migration tasks |

## guide pack rule

After choosing orientation, record a guide pack:

```md
## Selected guide pack

- Must create/read:
- Optional if risk appears:
- Not needed yet:
```

Use existing project docs before creating new doc types. Prefer:

- `docs/project_brief.md` for problem, scope, users, non-goals;
- `docs/project_orientation.md` for design driver and first-proof decision;
- `wiki/architecture.md` for system shape and boundaries;
- `docs/contracts.md` for shared names, routes, aliases, DTOs, schemas, roles,
  permissions, events, API shapes;
- `docs/data_map.md` for workflow-first data ownership, environment/database
  quick card, active table/entity/content-type mappings, field-to-code/raw
  traceability, and conditional knowledge pointers;
- `docs/database_inventory.md` for full/raw schema inventories and verification
  queries opened only by data-map/task anchors;
- `docs/design_system.md` and `ui_map/*` for UI-heavy work;
- `docs/implementation_plan.md` for phases and workstreams;
- `docs/tasks.md` for executable delegated packets;
- `docs/test_matrix.md` for proof obligations;
- `docs/decisions.md` for meaningful product, architecture, security, data,
  deployment, or workflow decisions.

## refresh rule

Refresh this guide through the research intake loop when:

- a new project exposes an orientation gap;
- deployment/runtime/frontend/CMS/security/AI practices have materially changed;
- at least three projects show the same orientation mistake;
- an agent failure shows the current questions did not surface the dominant
  risk.

## quality criteria

- The selected orientation follows the strongest risk, not the preferred
  technology.
- Secondary drivers are explicit when one orientation is not enough.
- The first proof is concrete and testable.
- Required docs are limited to what the orientation needs.
- Data-first, migration/refactor, reporting, CMS/content, and backend-heavy
  orientations include a data map that lets agents trace workflow -> code ->
  logical data -> raw storage without broad grep.
- Rejected orientations explain the trade-off.
- The orientation can be revised through `docs/decisions.md` when evidence
  shows the original risk model was wrong.

## anti-patterns

- Defaulting to backend-first because it feels safe.
- Defaulting to frontend-first because UI is visible while data/security risk is
  unresolved.
- Treating feature-first as a product discovery method; it is primarily a code
  organization/delivery strategy.
- Creating every possible doc for a small project.
- Dumping a whole database schema into the working map instead of exposing only
  the active workflow data surface and pointing to raw inventory by anchor.
- Letting agents start implementation while `Primary design driver` or `First
  proof required` is still unknown.
