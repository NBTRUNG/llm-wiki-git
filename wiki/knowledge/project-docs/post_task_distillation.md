---
name: post-task-distillation
description: Post-review distillation gate for agents. Defines when agents must file reusable troubleshooting, patterns, decisions, concepts, runbooks, contract notes, anti-patterns, or validation notes before marking work done.
date_ingested: 2026-06-27
status: active
---

# post-task distillation

## purpose

Use this guide after a task passes human, Lead, or integration-owner review but
before the task is marked done.

Correct flow:

```text
Agent completes work
-> Human/Lead review passed
-> Agent runs distillation gate
-> Archive/rollup
-> Done
```

The distillation gate is agent-owned. It should not consume human time unless a
source-of-truth or promotion decision is unclear.

## required gate

Every non-trivial task must record one of:

```text
Distill: skipped
Reason: <why no reusable knowledge was produced>
```

or:

```text
Distill: required
Type: troubleshooting | pattern | decision | concept | runbook | contract-note | anti-pattern | validation-note
Target: <repo path or LLM-Wiki path>
Links: <wikilinks or repo links>
```

Do not mark done before this gate is complete.

## triggers

Distillation is required when any trigger applies:

- task took more than 30 minutes;
- unexpected obstacle, error, or failed assumption occurred;
- two or more approaches were tried;
- review requested rework;
- a design, architecture, security, data, API, event, UI, or deployment
  decision was made;
- build, runtime, config, deployment, migration, or environment behavior was
  clarified;
- external docs or LLM-Wiki knowledge were needed to solve the task;
- repo docs and actual behavior differed;
- the issue, fix, validation method, or decision is likely to recur.

The 30-minute threshold is only one trigger. A 10-minute task can still require
distillation if it uncovered reusable knowledge.

## distillation types

| Type | Use when | Default target |
| --- | --- | --- |
| Troubleshooting | Bug/error/obstacle with symptoms and fix likely to recur | `wiki/knowledge/troubleshooting/` or closest existing knowledge folder |
| Pattern | Reusable approach with trigger, steps, and trade-offs | closest `wiki/knowledge/` folder |
| Decision | Meaningful project-specific decision | active repo `docs/decisions.md` or ADR; generalized lesson may also go to LLM-Wiki |
| Concept | New concept future agents must understand | `wiki/concepts/` or closest existing concept folder |
| Runbook | Repeatable operational/deploy/recovery procedure | active repo runbook for project-specific; `wiki/knowledge/operations/` for reusable |
| Contract note | API/schema/event/UI contract behavior clarified | active repo `docs/contracts.md`; generalized guidance in `wiki/knowledge/contracts/` |
| Anti-pattern | Wrong approach likely to repeat | closest harness or knowledge anti-pattern section |
| Validation note | Useful proof/test/check method | `wiki/knowledge/coding/testing-strategy.md`, `wiki/knowledge/operations/`, or closest target |

## source of truth

- Project-specific decisions, task state, status, contracts, and exact evidence
  stay in the active repo.
- LLM-Wiki receives generalized lessons, patterns, troubleshooting, concepts,
  runbooks, anti-patterns, validation notes, and workflow improvements.
- If a reusable lesson lacks enough evidence or generalization, queue it in
  `wiki/projects/llm-wiki/docs/feedback_loop_queue.md` or the repo equivalent
  rather than promoting it.

## wikilink rule

Distillation pages must use wikilinks.

- Link to related concepts, patterns, troubleshooting, operations, or project
  docs where possible.
- Update the nearest README/index/catalog.
- If no related page exists and the relation matters, create a concept page or
  record a `[WIKI-GAP]`.

Wikilinks are not decoration. They are how the vault compounds into a knowledge
graph instead of becoming isolated markdown.

## minimum formats

### Troubleshooting

```md
# <short problem name>

## symptoms

## root cause

## fix

## prevention

## example evidence

## related
```

### Pattern

```md
# <pattern name>

## when to use

## steps

## trade-offs

## example evidence

## related
```

### Decision Log

Project-specific decisions belong in the active repo:

```md
# <decision> - YYYY-MM-DD

## context

## options considered

## decision

## reason

## assumptions

## review trigger
```

### Runbook

```md
# <runbook name>

## when to use

## prerequisites

## steps

## validation

## rollback/recovery

## related
```

## done rule

A task can be marked done only after:

- review passed;
- distillation gate recorded;
- required distillation page, repo decision, contract note, runbook, or queue row
  is written;
- indexes/wikilinks are updated;
- archive/result report links to distillation output or records skip reason.

## anti-patterns

- **The "review means done" trap**: stopping after human approval and losing the
  reusable lesson.
- **The "write vague lesson" trap**: filing a general note without symptoms,
  evidence, trigger, or example.
- **The "LLM-Wiki as project mirror" trap**: copying project status/task history
  into LLM-Wiki instead of generalizing.
- **The "no links" trap**: creating isolated pages without wikilinks or catalog
  updates.
