---
name: agent-coding-workflow
description: Required coding-session bootstrap for agents. Defines the full Coding Pack that must be loaded at the start of any repo code, review, refactor, test, or validation session.
date_ingested: 2026-06-22
status: active
---

# agent coding workflow

## purpose

This guide defines how agents prepare for repo code work.

Principle: equip the coding agent fully before work starts. A coding session is
not a sequence of isolated micro-tasks; implementation, debugging, testing,
review, and documentation often change shape during the same assignment. If an
agent loads only a small rule slice at first and reads deeper only after the
task becomes risky, code quality can drift across one patch.

The fix is a small, bounded full-load rule: for coding sessions, read the full
Coding Pack once at the start.

## default rule

When an agent is assigned to write, review, refactor, test, validate, or accept
repo code, it must read the full Coding Pack at session or assignment start.

Before loading task-specific non-coding knowledge, classify the session with
[[../project-docs/agent_session_packs.md]]. The Coding Pack is the default
code-facing pack; Web/UI, Architecture, Contracts, Operations, and Security Deep
packs are added only when the session intent or risk triggers require them.

Full Coding Pack:

1. `wiki/knowledge/coding/agent-coding-workflow.md`
2. `wiki/knowledge/coding/karpathy-guidelines.md`
3. `wiki/knowledge/coding/repo-code-rules.md`
4. `wiki/knowledge/coding/code-quality.md`
5. `wiki/knowledge/coding/output-quality.md`
6. `wiki/knowledge/coding/implementation-quality-matrix.md`
7. `wiki/knowledge/coding/security-baseline.md`
8. `wiki/knowledge/coding/testing-strategy.md`

`security-baseline.md` is always-on inside the Coding Pack. Every non-trivial
coding result must record security impact, areas touched, risk found, and
whether human review is needed. Use the Security Deep Pack from
[[../project-docs/agent_session_packs.md]] when triggers apply.

Read the pack once per coding session. Do not re-read it per task unless:

- the session was compacted, interrupted, or handed to a new agent;
- one of the pack files changed;
- exact wording is needed for a conflict, review, or report;
- the agent skipped the pack by exception and the work later becomes coding.

## what counts as a coding session

Use the full Coding Pack when the work may change or accept:

- source code, scripts, templates, UI, components, routes, APIs, services, jobs,
  data access, migrations, build/runtime config, generated code, or tests;
- implementation docs tied to code behavior, validation, contracts, rollout, or
  rollback;
- review findings where the agent must judge correctness, security,
  performance, maintainability, or proof quality.

This includes tasks that look small at first. A one-line fix can still touch a
security boundary, shared contract, test strategy, or large mixed-concern file.

## narrow exceptions

The full Coding Pack is not required for work that is clearly not code-facing:

- status/report-only updates;
- catalog/index/link cleanup with no implementation guidance change;
- docs-only edits unrelated to implementation behavior;
- typo or copy fixes that do not touch behavior, contracts, UI layout, command
  semantics, or validation evidence.

If any exception starts to touch repo code behavior, tests, runtime config,
security, performance, contracts, or implementation acceptance, stop and load
the full Coding Pack before continuing.

## relationship to Token Economy

This rule does not mean "read the whole wiki." It is a bounded safety baseline
for coding agents.

Token Economy still applies to project state:

- do not read full repo history by default;
- do not read every project doc by default;
- do not read unrelated LLM-Wiki knowledge by default;
- use the repo read order and the Knowledge Lookup Metric for non-coding
  knowledge lookup.

The Coding Pack is the standard tool and safety set for implementation work,
like loading required tools and safety gear before entering a job site.

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
Exception used: none | <reason>
Conflicts with repo rules: none | <summary>
Security impact: none | low | medium | high
Security areas touched: auth | authorization | input | secrets | logging | dependencies | data | external service | config | none
Security risk found: none | <summary>
Human security review needed: no | yes, because <reason>
```

Use `no` or `partial` only for a narrow exception, interruption, or blocker.
When in doubt, load the pack.

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
