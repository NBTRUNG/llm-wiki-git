# Knowledge Lookup Metric

## purpose

Use this metric when a real project repo already exists and an agent is deciding
whether to consult LLM-Wiki.

The metric keeps LLM-Wiki in the right role:

- source of reusable guidance;
- history and rejected-decision context;
- architecture and workflow blueprint library.

It prevents LLM-Wiki from becoming a second active task board.

## source of truth

The active repo wins for implementation state.

Use active repo docs for:

- current tasks and assignments;
- current contracts, aliases, routes, roles, permissions, and APIs;
- latest validation evidence;
- current release readiness;
- repo-specific architecture decisions.

Use LLM-Wiki only when the task needs history, reusable patterns, or
cross-project guidance that the active repo does not already provide.

Exception: repo coding sessions have a separate mandatory Coding Pack baseline
defined in `wiki/knowledge/coding/agent-coding-workflow.md`. Load that pack once
for code/review/refactor/test/validation work, then use this metric for any
additional LLM-Wiki lookup beyond the Coding Pack.

## when to score

Score before opening LLM-Wiki for real repo work when the task involves:

- architecture, scope, contracts, routes, CMS aliases, APIs, roles, or permissions;
- security, privacy, production, deployment, dependencies, or external services;
- a reusable blueprint or workflow decision;
- unclear, missing, stale, or conflicting active repo docs;
- a change that may expand MVP/product scope.

For small implementation tasks with complete active repo context, record no score
unless the repo task requires it. This does not waive the Coding Pack when the
work is a coding session.

## metric

Score each criterion from 0 to 2.

| Criterion | 0 | 1 | 2 |
| --- | --- | --- | --- |
| Architecture history needed | No | Some context may help | Architecture, boundary, stack, route, CMS, or deployment decision affected |
| Active repo information sufficiency | Sufficient | Partial | Missing, stale, or conflicting |
| Scope drift risk | Low | Medium | High; task may add features outside accepted scope |
| Trade-off/history needed | No | Some | Prior decisions, rejected options, or ADR context needed |
| Reusable blueprint needed | No | Maybe | Yes; needs reusable pattern or harness guidance |

## decision rule

| Score | Action |
| --- | --- |
| 0-2 | Do not consult LLM-Wiki |
| 3 | Optional; prefer active repo |
| 4-6 | Consult LLM-Wiki |
| 7-10 | Consult LLM-Wiki and ask Codex/main-agent before implementation |

## conflict rule

If LLM-Wiki conflicts with active repo docs or code:

1. Do not apply the LLM-Wiki instruction directly.
2. Record the conflict in the result report.
3. Raise a blocker to Codex/main-agent.
4. Codex/main-agent decides whether to update active repo docs, create an ADR, or ignore the old LLM-Wiki context.

## required report section

Use this section in agent result reports when the lookup score is relevant:

```md
## Knowledge lookup

Score:

LLM-Wiki consulted:

Reason:

Findings used:

Conflicts with active repo:

Decision:
```

## repo adoption

For a real repo, copy `templates/knowledge_lookup_metric.template.md` to:

```text
docs/knowledge_lookup_metric.md
```

Then add the short lookup rule from `templates/repo_rules.template.md` to the repo
short rules file.
