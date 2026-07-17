---
name: agent-coding-workflow
description: Capability-aware coding-session bootstrap. Defines the canonical Coding Pack, validated lower-tier projections, and mandatory safety/evidence constraints for repo code, review, refactor, test, or validation.
date_ingested: 2026-06-22
status: active
confidence_reviewed: 2026-07-10
---

# agent coding workflow

## purpose

This guide defines how agents prepare for repo code work.

Principle: equip the coding agent with every mandatory constraint before work,
but deliver those constraints through a context projection the evaluated agent
can reliably use. A coding session is not a sequence of isolated micro-tasks;
security, output, testing, and boundary rules must survive every projection.

## default rule

When assigned to write, review, refactor, test, validate, or accept repo code,
the agent first applies
[[../project-docs/agent_capability_tiers.md]]. Eligible `P2 Map-First` agents
read the full Coding Pack once. `P0/P1` agents use only an approved task-named
projection that preserves source-of-truth, Security Baseline, output quality,
testing/evidence, write boundary, uncertainty, and stop/handoff rules. Without
such a projection, the lower-tier agent is not eligible for coding work.

The approved cross-repo `P1` projection for qualified `C2-C3` bounded work is
`P1-BOUNDED-CODING`, defined by `bounded-coding-core.md`. Repos compose local
coordinates and stricter rules around it; they do not create a per-project
copy. Reading a few full-pack files or a repo summary does not activate it.

Before loading task-specific non-coding knowledge, classify the session with
[[../project-docs/agent_session_packs.md]]. The Coding Pack is the default
code-facing pack; Web/UI, Architecture, Contracts, Operations, and Security Deep
packs are added only when the session intent or risk triggers require them.

Canonical full Coding Pack (`P2` direct load and projection source):

1. `wiki/knowledge/coding/agent-coding-workflow.md`
2. `wiki/knowledge/coding/karpathy-guidelines.md`
3. `wiki/knowledge/coding/repo-code-rules.md`
4. `wiki/knowledge/coding/code-quality.md`
5. `wiki/knowledge/coding/output-quality.md`
6. `wiki/knowledge/coding/implementation-quality-matrix.md`
7. `wiki/knowledge/coding/security-baseline.md`
8. `wiki/knowledge/coding/testing-strategy.md`
9. `wiki/knowledge/coding/agent-coding-risks.md`

`security-baseline.md` is always-on inside the Coding Pack. Every non-trivial
coding result must record security impact, areas touched, risk found, and
whether human review is needed. Use the Security Deep Pack from
[[../project-docs/agent_session_packs.md]] when triggers apply.

`agent-coding-risks.md` is always-on inside the Coding Pack. Every non-trivial
coding result must also record agent-specific risks such as context injection,
destructive tool use, data/migration risk, dependency/contract drift, evidence
gaps, and whether human/Lead review is required.

### Math Pack companion trigger

The Math Pack is not always-on, but it commonly accompanies Coding Pack for
reasoning-heavy work. Load `wiki/knowledge/math/README.md` when the task needs:

- a precise claim, invariant, pre/postcondition, termination, or equivalence
  argument;
- algorithmic, recursive, concurrent, state-machine, or numerical reasoning;
- complexity, performance, capacity, rate-of-change, or sensitivity analysis;
- a metric, baseline, repeated measurement, optimization, or comparison of
  effectiveness.

Add `wiki/knowledge/math/reasoning-navigation.md` when several live
hypotheses/solution paths require bounded search, verifier feedback,
backtracking, or an explicit stop/escalation decision. Add
`wiki/knowledge/math/probability-statistics.md` when evidence is noisy,
correlated, sequential, causal, or expressed as a calibrated probability.

Seniority is not an exception. Load by problem shape. Keep routine CRUD, copy,
or config work on the normal Coding Pack path when no formal trigger exists.

Read the assigned pack/projection once per coding session. Do not re-read it per
task unless:

- the session was compacted, interrupted, or handed to a new agent;
- one of the pack files changed;
- exact wording is needed for a conflict, review, or report;
- the agent skipped the pack by exception and the work later becomes coding.

## what counts as a coding session

Use the canonical Coding Pack directly or through a validated projection when
the work may change or accept:

- source code, scripts, templates, UI, components, routes, APIs, services, jobs,
  data access, migrations, build/runtime config, generated code, or tests;
- implementation docs tied to code behavior, validation, contracts, rollout, or
  rollback;
- review findings where the agent must judge correctness, security,
  performance, maintainability, or proof quality.

This includes tasks that look small at first. A one-line fix can still touch a
security boundary, shared contract, test strategy, or large mixed-concern file.

## narrow exceptions

The Coding Pack/projection is not required for work that is clearly not
code-facing:

- status/report-only updates;
- catalog/index/link cleanup with no implementation guidance change;
- docs-only edits unrelated to implementation behavior;
- typo or copy fixes that do not touch behavior, contracts, UI layout, command
  semantics, or validation evidence.

If any exception starts to touch repo code behavior, tests, runtime config,
security, performance, contracts, or implementation acceptance, stop and load
the capability-appropriate Coding Pack projection before continuing.

## relationship to Token Economy

This rule does not mean "read the whole wiki." It is a bounded safety baseline
for coding agents.

Token Economy still applies to project state:

- do not read full repo history by default;
- do not read every project doc by default;
- do not read unrelated LLM-Wiki knowledge by default;
- use the repo read order and the Knowledge Lookup Metric for non-coding
  knowledge lookup.

The Coding Pack is the canonical tool and safety set for implementation work.
Projection changes delivery size, not mandatory constraints.

## source of truth

For real repo work, active repo files still win:

1. current user/Codex assignment;
2. repo `AGENTS.md`, `REPO_RULES.md`, and agent control card;
3. repo docs and code;
4. LLM-Wiki Coding Pack as reusable guidance.

If a repo-specific rule conflicts with the Coding Pack, follow the repo rule and
record the conflict in the result report.

## report requirement

Every non-trivial implementation, review, refactor, test, or validation result
report should state whether the Coding Pack was loaded:

```text
Coding Pack loaded: yes | no | partial
Capability tier / projection: C? / P0 | P1 | P2
Capability fit: eligible | self-downgraded | handoff required | unrated
Exception used: none | <reason>
Conflicts with repo rules: none | <summary>
Security impact: none | low | medium | high
Security areas touched: auth | authorization | input | secrets | logging | dependencies | data | external service | config | none
Security risk found: none | <summary>
Human security review needed: no | yes, because <reason>
Agent coding risk: none | low | medium | high
Evidence gap: none | <summary>
Human/Lead review needed: no | yes, because <reason>
Math Pack loaded: no | yes, because <trigger>
Claim/invariant or measurement question: none | <summary>
Proof/comparison evidence: none | <path, command, or residual gap>
```

Use `no` or `partial` only for a narrow exception, interruption, or blocker.
When in doubt, load the pack.

For the bounded projection, report `Coding Pack delivery:
P1-BOUNDED-CODING` and whether that projection was loaded completely. Reserve
`full Coding Pack loaded: yes` for an actual complete `P2` load.

## anti-patterns

- **The "small task, small rules" trap** - assuming a small-looking task cannot
  produce a large patch or cross a boundary.
- **The "read deeper later" trap** - loading security/testing/output-quality
  guidance only after code has already been shaped around weaker assumptions.
- **The "per-micro-task reread" trap** - repeatedly reading individual guide
  files as the task shifts, which wastes tokens and creates inconsistent
  application.
- **The "whole-wiki confusion" trap** - treating this bounded pack as permission
  to read unrelated LLM-Wiki docs or full repo history.
- **The "agent evidence is enough" trap** - accepting generated summaries,
  claimed test output, or migration success without direct command evidence,
  source-file proof, or clearly marked residual risk.
- **The "senior intuition is proof" trap** - skipping definitions,
  counterexamples, complexity reasoning, or controlled measurement because the
  author is experienced or the conclusion feels obvious.
