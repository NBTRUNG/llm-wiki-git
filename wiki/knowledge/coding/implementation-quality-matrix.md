---
name: implementation-quality-matrix
description: Cross-cutting acceptance matrix for code, technology, design-system, security, output-quality, and test evidence during repo implementation work.
date_ingested: 2026-06-24
status: active
research_checked: 2026-06-24
sources:
  - https://owasp.org/Top10/2025/
  - https://csrc.nist.gov/pubs/sp/800/218/final
  - https://slsa.dev/spec/v1.2/
  - https://www.w3.org/TR/WCAG22/
  - https://www.designtokens.org/tr/drafts/format/
---

# implementation quality matrix

## purpose

Use this matrix beside the Coding Pack when planning, implementing, reviewing,
or accepting repo changes. It turns broad quality concerns into explicit gates:
code, technology, design system, security, output, and tests.

This file does not replace the detailed guides:

- `code-quality.md`
- `output-quality.md`
- `security-baseline.md`
- `testing-strategy.md`
- `../project-docs/design_system.md`

Repo-specific rules, architecture decisions, design-system docs, threat models,
and CI policy override this reusable guide.

## research baseline

Research checked on 2026-06-24:

- OWASP Top 10:2025 is the current OWASP web application risk awareness list.
- NIST SP 800-218 SSDF v1.1 defines high-level secure software development
  practices for SDLC integration.
- SLSA v1.2 is the current SLSA specification family for supply-chain integrity
  and provenance.
- WCAG 2.2 is the current W3C Recommendation for web accessibility guidance.
- Design Tokens Format Module 2025.10 is a W3C Community Group draft, not a W3C
  Standard; use it as interoperability guidance, not as binding law.

## acceptance matrix

| Area | Minimum gate | Evidence to record | Escalate when |
| --- | --- | --- | --- |
| Code | Change is scoped, readable, typed/schema-backed where the repo supports it, and keeps one source of truth for behavior. | Files changed, invariant/postcondition for non-trivial logic, lint/type/build or targeted test result. | New abstraction, broad refactor, generated code, shared helper, public contract, or large mixed-concern file. |
| Technology | Existing stack and repo-local helpers are used before adding a package, service, runtime, framework, CDN, or build tool. | Reason for any new dependency/service, alternatives considered, install/build/audit result when available. | New dependency, external service, auth provider, database, queue, cache, deployment surface, or license/security uncertainty. |
| Design system | UI uses existing tokens, components, layout rules, accessibility patterns, and UI contracts before custom styling. | Component/page checked, tokens/classes used, visual/manual or browser proof, accessibility check where relevant. | New token, component variant, global CSS, route shell, interaction pattern, color scale, typography scale, or responsive layout contract. |
| Security | Inputs are untrusted by default; auth, authorization, validation, encoding, secret handling, logging, and supply-chain controls are preserved. | Security impact note plus denied/invalid-input test, config readback, audit/scan result, or manual path review. | OWASP Top 10 area touched, secret/config/dependency change, upload/payment/login/callback/admin flow, raw HTML, SQL, broad CORS, or production deployment. |
| Output | Delivered behavior matches the user request and accepted contracts without unapproved feature growth or hidden residual risk. | Acceptance criteria result, user-visible behavior proof, docs/status/test-matrix update when needed, residual risks. | Tests pass but do not prove the request, behavior is ambiguous, rollback is unclear, or docs/contracts would drift. |
| Tests | Proof targets the behavior and risk layer, not just execution. Use the narrowest test that proves the change, then broaden for integration risk. | Commands run, result, important paths checked, missing proof and compensating evidence. | No meaningful assertion, only happy path for risky change, flaky external dependency, migration/config/build change, or browser/user workflow. |

## technology decision gate

Before adding or changing technology, answer these in the result report or
decision doc when the change is non-trivial:

```text
Need:
Existing repo option:
New option:
Security/supply-chain impact:
Operational impact:
Test/rollback proof:
Decision:
```

Default decision rule:

- prefer no new technology when existing repo code can solve the task clearly;
- prefer maintained, boring, repo-compatible technology over novelty;
- prefer libraries with active releases, security reporting, license clarity,
  and small transitive dependency risk;
- document new trust boundaries, credentials, data flows, and runtime
  ownership.

## design-system gate

For UI work, check design-system fit before writing custom CSS or components:

```text
Token source:
Component/pattern source:
Accessibility target:
Responsive states:
Interaction states:
Visual proof:
```

Minimum UI checks:

- reuse existing tokens for color, spacing, typography, radius, shadow, motion,
  and z-index unless a new token is explicitly accepted;
- preserve keyboard access, focus visibility, labels/names, contrast, reduced
  motion expectations, and responsive behavior;
- keep user-visible copy and component behavior consistent with the product
  vocabulary;
- update UI maps, component docs, or design-system docs when a shared pattern
  changes.

## security gate

Map security-relevant changes to the nearest OWASP/NIST concern before
acceptance:

| Change touches | Check |
| --- | --- |
| Routes, forms, APIs, CMS, imports, queues, webhooks | Validate type, shape, size, encoding, and allowed values at the boundary. |
| User, tenant, admin, content, payment, or private data | Prove authentication, authorization, ownership, and denial paths. |
| Secrets, config, environment, tokens, cookies | Keep secrets out of source/logs; validate config at startup; use secure cookie/session settings. |
| Dependencies, build, CI, containers, artifacts | Run available audit/scans; check provenance or lockfile changes; record new trust boundaries. |
| Errors, retries, fallbacks, exceptional cases | Fail deliberately; avoid leaking sensitive details; keep useful logs/alerts. |

## output test matrix

Use this mini-matrix in result reports for non-trivial implementation work:

| Proof target | Required answer |
| --- | --- |
| Behavior | What user-visible or contract-visible behavior changed? |
| Correctness | What invariant, postcondition, or edge case was proved? |
| Security | What trust boundary, permission, input, secret, dependency, or logging risk was checked? |
| Design system | What token/component/accessibility/responsive rule was checked for UI work? |
| Technology | What new or changed technology decision was avoided, reused, or accepted? |
| Tests | What command/manual proof ran, and what did it prove? |
| Gaps | What could not be proved, and what is the residual risk? |

## done signal

A repo change is ready for review when each relevant matrix row has either
evidence or a recorded reason it does not apply. Missing evidence is acceptable
only when it is explicit, risk-rated, and paired with the best available
compensating check.
