---
name: output-quality
description: Delivery quality gate for agent output. Use beside code-quality when planning, implementing, reviewing, or accepting repo changes.
date_ingested: 2026-06-20
status: active
---

# output quality guide

## purpose

Code quality asks whether the implementation is readable, maintainable, and
locally correct. Output quality asks whether the delivered change is fit to
accept: correct for users, aligned with system boundaries, secure, performant,
reviewable, documented, and backed by evidence.

Use this guide beside `code-quality.md`, not as a replacement for it.

## source-backed principles

Large technology organizations frame output quality as a system-level review,
not only a syntax/style review:

- Google Engineering Practices review design, functionality, complexity, tests,
  naming, comments, style, documentation, every reviewed line, broader context,
  and whether the change improves code health.
- Google also favors small, self-contained changes with related tests in the
  same change; large changes need decomposition, reviewer consent, and stronger
  test discipline.
- Microsoft SDL treats security as a lifecycle concern across design, code,
  build/deploy, run, and governance; security review, threat modeling, supply
  chain security, testing, monitoring, and training are part of delivery.
- AWS Well-Architected reviews architecture against operational excellence,
  security, reliability, performance efficiency, cost optimization, and
  sustainability, and treats review as a constructive decision process.
- Meta's published code-improvement research describes continual code health
  work, metric-guided prioritization, dead-code deletion, and reengineering as
  mechanisms for sustaining quality during rapid delivery.

## output quality gate

For non-trivial implementation work, an agent must prove these gates before
reporting `ready-for-review`.

### 1. User and contract fit

- The change satisfies the exact task output and acceptance criteria.
- User-visible behavior is intentional and no unapproved behavior was added.
- Shared names, routes, aliases, DTOs, roles, permissions, and public contracts
  remain unchanged unless the task explicitly authorizes the change.

### 2. Design and boundary fit

- The change belongs in the edited layer/module and follows the repo's accepted
  architecture.
- Existing helpers, services, adapters, and contracts are reused before adding
  new paths.
- Logic has one source of truth; no duplicate filtering, parsing, fallback,
  formatting, authorization, or mapping behavior is introduced.

### 3. Correctness and edge cases

- The expected invariant or postcondition is stated for non-trivial logic.
- Important success, empty, error, permission, concurrency, and data-shape cases
  are considered based on the task risk.
- Failures are explicit, predictable, and observable where appropriate.

### 4. Security and privacy

- Public, user, API, CMS, file, dependency, and external-service inputs are
  treated as untrusted until validated, normalized, or safely encoded.
- Existing authentication, authorization, validation, encoding, environment, and
  secret-handling guards are preserved.
- New high-risk flows such as login, upload, payment, permission, external
  callback, raw HTML, `innerHTML`, SQL interpolation, broad CORS, public secrets,
  external scripts/CDNs, or sensitive data exposure require explicit task scope
  and review evidence.

### 5. Performance and operability

- Hot paths, query count, payload size, bundle size, cache behavior, startup,
  and background work are considered when relevant.
- The change does not remove useful logging, diagnostics, health checks, or
  operational safeguards.
- Any expected performance change is measured, smoke-tested, or documented as a
  residual risk.

### 6. Test and proof quality

- Tests or manual checks prove the behavior, not merely that code executed.
- A bug-fix test would fail on the previous buggy behavior when practical.
- Missing tests/checks are explicitly justified with risk and compensating
  evidence.

### 7. Reviewability and change size

- The change is one coherent unit, small enough to review with the provided
  context.
- Refactors, formatting churn, generated changes, dependency changes, and
  behavior changes are separated unless the task explicitly accepts combining
  them.
- Review notes identify any generated files, scanned-only files, or areas that
  need specialist review.

### 8. Maintainability and handoff

- Names communicate intent; comments explain why, not obvious mechanics.
- No debug prints, dead code, commented-out code, stale TODOs, or temporary
  artifacts are left without a tracked reason.
- Docs, runbooks, task status, contracts, decisions, UI maps, code maps, or test
  matrices are updated when the change affects them.

### 9. Rollback and residual risk

- Production-impacting changes include a rollback or recovery note.
- Residual risks, assumptions, skipped checks, and follow-up work are written in
  the result report rather than hidden in chat.

## escalation triggers

Stop and read deeper project docs, request specialist review, or raise a blocker
when any of these are true:

- the change touches security, privacy, auth, permissions, payments, uploads,
  external callbacks, secrets, migrations, deployment, dependencies, or
  production configuration;
- the target file is large or mixes server logic, markup, CSS, client state, and
  API/service behavior;
- the agent cannot identify the source of truth for a behavior or contract;
- tests pass but do not prove the acceptance criteria;
- the implementation requires a new abstraction, framework, service, package,
  route, shared name, role, permission, or cross-module dependency;
- the reviewer would need to infer correctness from partial context.

## agent report requirement

Every non-trivial result report should include concise evidence for:

- user-visible behavior;
- correctness and edge cases;
- security/privacy impact;
- performance/operability impact;
- tests/checks run;
- reviewability/change size;
- docs/handoff/rollback;
- residual risks.
