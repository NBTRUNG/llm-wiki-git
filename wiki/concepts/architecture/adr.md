---
name: adr
description: Architecture Decision Record. Captures one significant architecture decision with context, options, decision, and consequences. Use when a non-trivial irreversible architecture choice is being made.
source_type: external-research
source_urls:
  - https://adr.github.io
  - https://adr.github.io/madr/
  - https://github.com/joelparkerhenderson/architecture-decision-record
date_ingested: 2026-05-23
confidence: medium
confidence_reviewed: 2026-05-23
applicable_contexts: pending first project use
status: active
---

# ADR — Architecture Decision Record

A single Markdown file recording why one significant architecture decision was
made. ADRs prevent "decision amnesia" — the team revisiting settled debates
because no one remembers why the original choice was made.

## when to write an ADR

Write an ADR when the decision:

- changes a public contract, data shape, or auth model;
- chooses a framework, library, or vendor that's hard to swap later;
- locks in a deployment pattern, infrastructure choice, or scaling strategy;
- accepts a trade-off between quality attributes (see [[quality-attributes.md]]);
- changes a previously recorded decision (mark old one `superseded`);
- a future engineer would ask "why did we do it this way?".

Do **not** write an ADR for routine implementation choices (variable naming,
which utility to use, etc.) — those belong in code review.

## formats

### Michael Nygard format (the classic)

```md
# ADR-NNNN: <Title>

## Status

proposed | accepted | rejected | deprecated | superseded by ADR-MMMM

## Context

What is the issue motivating this decision?

## Decision

What change are we making?

## Consequences

What becomes easier? What becomes harder? What did we accept by choosing this?
```

Concise, widely adopted, focuses on the rationale.

### MADR (Markdown ADR)

Adds optional sections: Decision drivers, Considered options, Pros and Cons per
option, More information. Better when the decision had several real
alternatives and you want to record the comparison.

```md
# <Title>

* Status: accepted
* Deciders: <names>
* Date: YYYY-MM-DD

## Context and Problem Statement

## Decision Drivers

* driver 1
* driver 2

## Considered Options

* Option A
* Option B

## Decision Outcome

Chosen option: "Option A", because <justification>.

### Positive Consequences

### Negative Consequences

## Pros and Cons of the Options

### Option A

### Option B
```

### Y-Statement (one-line variant)

"In the context of `<use case>`, facing `<concern>`, we decided for `<option>`
to achieve `<quality>`, accepting `<downside>`."

Use when the decision is small but worth recording.

## where ADRs live

In a real repo: `docs/decisions/` or `docs/adr/`, one decision per file,
numbered with leading zeros (`0001-use-postgresql.md`, `0042-add-redis.md`).

In LLM-Wiki: cross-project decisions go in [[../../decisions/_index.md]] as
a row; project-specific decisions stay in the project repo.

## rules

- **One decision per file**. Do not combine multiple decisions in one document.
- **Keep ADRs close to the code** they describe; version them in the same repo.
- **Never delete an ADR**. When a decision changes, mark the old one
  `superseded by ADR-NNNN` and create a new ADR.
- **Link related ADRs** — one big decision often triggers smaller follow-up
  decisions; cross-link them.
- **Focus on why, not what**. The code shows what; the ADR shows why.

## organization for large projects

If you accumulate hundreds of ADRs, group by area:

```
docs/decisions/
  backend/0001-use-quarkus.md
  ui/0001-use-vuejs.md
  infra/0001-deploy-to-aws.md
```

## review cadence

A common practice is to schedule a review of each ADR roughly one month after
acceptance: did reality match the prediction? If not, write a follow-up ADR
recording what changed.

## anti-patterns

- Long backstory; thin decision section.
- Listing only the chosen option; never recording alternatives that were
  considered (loses the "we already tried X" memory).
- Marking ADRs `accepted` without consequences listed.
- Editing an old ADR instead of creating a superseding one.
- Storing ADRs in a separate wiki where they drift from code reality.

## relationship to LLM-Wiki

- Project-level decisions live in the project repo (`docs/decisions/` or
  similar).
- Cross-project decisions and reusable lessons live in [[../../decisions/]]
  (see [[../../decisions/_index.md]] for the register).
- Use [[../../../templates/decisions.template.md]] as a project-level skeleton.
- File-back rubric for new lessons: [[../../../program.md#6. operation: file-back insight]].

## sources

- ADR Templates hub: https://adr.github.io
- MADR project: https://adr.github.io/madr/
- ADR examples and guidance: https://github.com/joelparkerhenderson/architecture-decision-record
- Nygard's original blog post (Cognitect): https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions
