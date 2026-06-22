# Validation: architecture approach selection guide

Date: 2026-06-12

## scope

User requested updated best-practice guidance for choosing system design
approaches by workload, including backend-first for data-heavy systems and
frontend-first/feature-first for UI-heavy systems.

Implemented:

- Added `wiki/knowledge/project-docs/architecture_approach_selection.md`.
- Linked it from `architecture_skill.md`, `wiki/knowledge/README.md`,
  `wiki/knowledge/project-docs/README.md`, and `index.md`.

## sources used

- Microsoft Azure Architecture Center: Backends for Frontends pattern.
- Microsoft Azure Architecture Center: CQRS pattern.
- Microsoft Azure Architecture Center: Event-driven architecture style.
- AWS Well-Architected Data Analytics Lens.
- OpenAPI Specification 3.2.0.
- Component Driven User Interfaces.
- Feature-Sliced Design docs.
- Micro Frontends.
- Jimmy Bogard: Vertical Slice Architecture.
- Martin Fowler: Monolith First.

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## result

Implemented locally. The guide now gives a workload-based chooser for:

- backend-first / data-first;
- API-first / contract-first;
- frontend-first / component-driven;
- feature-first / vertical slice;
- BFF / client-specific backend;
- event-first;
- platform-first;
- monolith-first / modular monolith.

## gaps

- No project has consumed the guide yet; confidence remains `medium` until
  first project feedback.
