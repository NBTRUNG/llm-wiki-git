# scaffold examples guide

## purpose

Scaffold examples are copyable references for starting project docs. They are not
global architecture law.

Use them only after reading the project brief, accepted decisions, and active
repo constraints.

## canonical example scaffold

Use the cleaned examples under:

```text
templates/examples/api-service-scaffold/
```

These examples are safe starting points because they:

- use placeholders instead of fixed project choices;
- say when decisions must move to `docs/decisions.md`;
- keep contracts separate from implementation;
- avoid claiming a default stack for every project.

## when to use

Use an example scaffold when:

- a project needs its first API contract;
- a project needs a system design outline;
- infra topology or required environment variables need a starting template;
- a data model doc needs table/relationship structure.

Do not use it when:

- the real repo already has stronger docs;
- the project is not an API service;
- the example conflicts with accepted architecture;
- the task is only implementation and does not need docs scaffolding.

## adoption rule

When copying an example into a project repo:

1. Replace placeholders with project-specific facts.
2. Remove irrelevant sections.
3. Move meaningful architecture choices to `docs/decisions.md`.
4. Put shared implementation names in `docs/contracts.md`.
5. Record validation evidence or mark unknowns explicitly.
