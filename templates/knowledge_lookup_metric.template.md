# Knowledge Lookup Metric

Guide before filling: `wiki/knowledge/project-docs/knowledge_lookup_metric.md`

## Source Of Truth

The active repo is the source of truth.

LLM-Wiki is a reference knowledge base for history, reusable guidance, and
cross-project blueprints. It is not the active task board.

## When To Score

Score before consulting LLM-Wiki when the task involves architecture, scope,
contracts, security, production, deployment, dependencies, external services,
missing repo docs, or reusable blueprints.

## Metric

Score each criterion from 0 to 2.

| Criterion | 0 | 1 | 2 |
| --- | --- | --- | --- |
| Architecture history needed | No | Some context may help | Architecture, boundary, stack, route, CMS, or deployment decision affected |
| Active repo information sufficiency | Sufficient | Partial | Missing, stale, or conflicting |
| Scope drift risk | Low | Medium | High; task may add features outside accepted scope |
| Trade-off/history needed | No | Some | Prior decisions, rejected options, or ADR context needed |
| Reusable blueprint needed | No | Maybe | Yes; needs reusable pattern or harness guidance |

## Decision Rule

| Score | Action |
| --- | --- |
| 0-2 | Do not consult LLM-Wiki |
| 3 | Optional; prefer active repo |
| 4-6 | Consult LLM-Wiki |
| 7-10 | Consult LLM-Wiki and ask Codex/main-agent before implementation |

## Safety Rules

- Active repo docs and code override LLM-Wiki.
- Do not copy old LLM-Wiki decisions into active repo docs without Codex/main-agent review.
- If a conflict is found, record a blocker.
- If a task may expand product scope, stop and ask Codex/main-agent.

## Required Report Section

```md
## Knowledge lookup

Score:

LLM-Wiki consulted:

Reason:

Findings used:

Conflicts with active repo:

Decision:
```
