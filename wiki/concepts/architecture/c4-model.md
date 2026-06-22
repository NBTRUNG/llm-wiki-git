---
name: c4-model
description: 4-level hierarchical model (Context, Container, Component, Code) for visualizing software architecture at different zoom levels. Use when documenting system structure for multiple audiences.
source_type: external-research
source_urls:
  - https://c4model.com
  - https://c4model.com/diagrams
  - https://en.wikipedia.org/wiki/C4_model
date_ingested: 2026-05-23
confidence: medium
confidence_reviewed: 2026-05-23
applicable_contexts: pending first project use
status: active
---

# C4 model

Created by Simon Brown. C4 stands for the 4 levels:

1. **Context** — system in its environment
2. **Container** — major deployable units
3. **Component** — building blocks inside one container
4. **Code** — class/data structure (optional)

## the four levels

### Level 1: Context

Who uses the system? What other systems does it talk to?

Audience: everyone, including non-technical stakeholders.

Output: one diagram showing the system as a single box, surrounded by users and
external systems with named relationships.

### Level 2: Container

What are the major deployable/runnable units? Each container is a separately
deployable thing — web app, mobile app, REST API, database, message broker,
background job.

In C4 terminology, "container" is **not** a Docker container. It is any unit
that can be deployed independently.

Audience: developers, ops, architects.

Each container should carry its technology label (e.g., "React SPA",
"Spring Boot 3 API", "PostgreSQL 15"), because that context shapes every
implementation decision downstream.

### Level 3: Component

Zoom into one container to show its major logical building blocks (controllers,
services, repositories, gateways) and their interactions.

Audience: developers working in that container.

### Level 4: Code

Class diagrams, ERDs, IDE-generated diagrams.

Explicitly optional. Brown recommends generating these from source code rather
than maintaining by hand — manual code diagrams go stale within days. Skip
level 4 unless you have automation.

## when to use each level

| Audience | Levels |
|---|---|
| Executives, customers | Level 1 only |
| New developers, architects | Levels 1 + 2 |
| Developers in a specific container | Levels 1 + 2 + 3 for that container |
| Code review onboarding | Levels 1 + 2 + 3 + (auto-generated) 4 |

Most teams find **Level 1 + Level 2 is enough**. Add Level 3 only for the
containers that are complex enough to warrant the zoom. Avoid Level 4 unless
automated.

## diagramming notation

C4 is not prescriptive about layout, color, or shape. Use simple nested boxes
with named relationships. Five element types are enough for L1–L3:

- person
- software system
- container
- component
- relationship (arrow)

## anti-patterns

- Drawing all 4 levels for a small system.
- Hand-drawing Level 4 (it goes stale).
- Treating "container" as Docker-specific.
- Omitting technology labels on containers.
- Decorative diagrams that do not match the actual deployment.
- Using C4 to argue for an architecture rather than to describe one.

## relationship to other LLM-Wiki concepts

- arc42 sections 3 (Context) and 5 (Building Block View) can be filled with
  C4 Level 1 and Level 2 diagrams respectively. See [[arc42.md]].
- Decisions about boundaries and technology labels belong in
  [[adr.md]] entries.
- Quality attributes per container belong in [[quality-attributes.md]].

## sources

- Official C4 site: https://c4model.com
- C4 diagrams: https://c4model.com/diagrams
- Wikipedia summary: https://en.wikipedia.org/wiki/C4_model
