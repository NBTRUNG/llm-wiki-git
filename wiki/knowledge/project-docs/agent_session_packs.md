---
name: agent-session-packs
description: Canonical packing lists for agent sessions. Defines required and conditional knowledge packs by work type, with always-on security baseline and trigger-based deep security review.
date_ingested: 2026-06-27
status: active
---

# agent session packs

## purpose

Use this guide when assigning, starting, or reviewing an agent session.

An agent pack is the bounded set of repo files and LLM-Wiki knowledge a session
must load before work. Packs prevent two failure modes:

- reading too little and missing required behavior, security, or proof rules;
- reading the whole wiki and losing the Token Economy benefit.

Agent skill files should not duplicate this knowledge. Skills should classify
the session type, load the relevant pack from this file, report what was loaded,
and stop when a required pack is missing or conflicts with the active repo.

## pack rules

- The active repo remains source of truth for current implementation state.
- Every real-repo session starts with the **Repo Base Pack**.
- Every code-facing session adds the **Coding Pack**.
- The Coding Pack includes the always-on **Security Baseline**.
- Trigger the **Security Deep Pack** only when security posture, sensitive data,
  trust boundaries, or risky implementation surfaces are involved.
- Add architecture, web, UI, contracts, and operations packs by session intent.
- Do not read unrelated packs "just in case."
- Result reports must record loaded packs and security impact.

## Repo Base Pack

Use for every real-repo session.

Read:

```text
repo/AGENTS.md
repo/REPO_RULES.md
repo/LEAD_STATE.md, AI_CODEX.md, or equivalent lead state file when doing Lead work
repo/agents/<agent>/AGENT.md when doing delegated work
current task packet or current assignment
task-specific required read files
```

Do not read full repo history, full docs folders, or unrelated LLM-Wiki
knowledge unless the task intent requires it or the Knowledge Lookup Metric
requires consultation.

## Coding Pack

Use when the session may write, review, refactor, test, validate, or accept
repo code.

Read once per session or assignment:

```text
wiki/knowledge/coding/agent-coding-workflow.md
wiki/knowledge/coding/karpathy-guidelines.md
wiki/knowledge/coding/repo-code-rules.md
wiki/knowledge/coding/code-quality.md
wiki/knowledge/coding/output-quality.md
wiki/knowledge/coding/implementation-quality-matrix.md
wiki/knowledge/coding/security-baseline.md
wiki/knowledge/coding/testing-strategy.md
```

The Coding Pack includes the **Security Baseline**. Every coding result must
state security impact, even when the answer is `none`.

## Security Baseline

Always active inside the Coding Pack.

For every coding result, report:

```text
Security impact: none | low | medium | high
Areas touched: auth | authorization | input | secrets | logging | dependencies | data | external service | config | none
Risk found: none | <summary>
Human review needed: no | yes, because <reason>
```

`none` is acceptable for a truly unrelated task, but it must be explicit.

## Security Deep Pack

Add this pack when the task touches any of these triggers:

- authentication, authorization, permissions, roles, ownership, or tenant data;
- admin paths, private data, PII, payment, upload, or external callbacks;
- secrets, tokens, cookies, sessions, CORS, CSP, headers, or production config;
- raw SQL, raw HTML, script injection, external scripts/CDNs, or deserialization;
- dependency addition/upgrade or new external service/trust boundary;
- background jobs, workers, events, or service-to-service calls that mutate state;
- performance changes that weaken validation, authorization, logging, isolation,
  rate limiting, or audit evidence.

Read:

```text
wiki/knowledge/coding/security-baseline.md
wiki/knowledge/architecture-patterns/zero-trust-security.md
wiki/concepts/security/stride.md
wiki/concepts/security/owasp-top-10.md
repo/docs/security.md if present
repo/docs/contracts.md when API/data/boundary behavior changes
repo/docs/decisions.md when security posture changes
```

Require human review before implementation when a security trade-off changes
posture, usability, compatibility, performance, logging/audit, credential
lifetime, data exposure, or trust boundary.

## Web App Implementation Pack

Use for pages, routes, components, browser workflows, React/Next.js, UI state,
CSS/layout, accessibility, and frontend performance.

Read:

```text
Repo Base Pack
Coding Pack
repo/docs/design_system.md or repo/ui_map/* when present and task-relevant
wiki/knowledge/project-docs/design_system.md
wiki/knowledge/frontend/README.md
wiki/knowledge/frontend/react-performance.md when React is involved
wiki/knowledge/frontend/nextjs-performance.md when Next.js is involved
wiki/knowledge/frontend/web-vitals.md when UX/performance is affected
wiki/knowledge/ui/accessibility.md
wiki/knowledge/ui/visual-quality.md
repo/docs/test_matrix.md when proof rows must be updated
```

For UI-only copy or visual changes with no behavior, use the narrowest relevant
UI files and still report accessibility and visual validation.

## Software / Backend Implementation Pack

Use for services, APIs, jobs, integrations, domain logic, data access,
migrations, queues, and server-side behavior.

Read:

```text
Repo Base Pack
Coding Pack
repo/docs/contracts.md when API/schema/event/data contract is touched
repo/docs/decisions.md when architecture or dependency choice is touched
wiki/knowledge/contracts/README.md when integration contracts are affected
wiki/knowledge/contracts/api-design.md when API behavior changes
wiki/knowledge/contracts/data-contracts.md when data/schema/migration changes
wiki/knowledge/contracts/event-contracts.md when async events change
wiki/knowledge/architecture-patterns/pattern-selection-matrix.md only when boundary/pattern changes
```

Do not load architecture patterns for a local bug fix unless the fix changes
module boundaries, data ownership, deployment shape, or cross-boundary behavior.

## Architecture Decision Pack

Use when choosing or changing architecture, module boundaries, service splits,
deployment shape, data ownership, major dependencies, auth/security
architecture, or platform approach.

Read:

```text
Repo Base Pack
repo/docs/architecture.md
repo/docs/decisions.md
repo/docs/contracts.md when boundary/API/data is involved
wiki/knowledge/project-docs/architecture_skill.md
wiki/knowledge/project-docs/architecture_approach_selection.md
wiki/knowledge/architecture-patterns/pattern-selection-matrix.md
the relevant architecture pattern file(s)
wiki/knowledge/architecture-patterns/zero-trust-security.md when trust boundaries or sensitive data are involved
```

Output options and trade-offs first. Do not implement a new pattern or scaffold
an architecture before a human, Lead, or accepted ADR confirms the decision.

## Contracts Pack

Use when APIs, DTOs, schemas, events, external integrations, routes, permissions,
or data ownership contracts change.

Read:

```text
Repo Base Pack
Coding Pack if implementation is involved
repo/docs/contracts.md
repo/docs/decisions.md when contract strategy changes
wiki/knowledge/contracts/README.md
wiki/knowledge/contracts/api-design.md for API contracts
wiki/knowledge/contracts/data-contracts.md for schemas/migrations
wiki/knowledge/contracts/event-contracts.md for async/event contracts
```

Contract-changing work must report compatibility, consumer impact, validation,
and rollback or migration path.

## Operations / Release Pack

Use for deployment, CI/CD, config, observability, rollback, environment changes,
release readiness, production troubleshooting, or test-server rollout.

Read:

```text
Repo Base Pack
repo/docs/deployment.md or runbook when present
repo/docs/test_matrix.md
repo/docs/decisions.md when runtime/deployment posture changes
wiki/knowledge/operations/README.md
wiki/knowledge/operations/deployment-readiness.md
wiki/knowledge/operations/observability.md
wiki/knowledge/operations/rollback.md
wiki/knowledge/coding/output-quality.md
```

Add the Coding Pack when implementation, scripts, config, build files, or code
are changed.

## result-report requirement

Every non-trivial result report should include:

```text
Packs loaded:
- Repo Base: yes | no | n/a
- Coding: yes | no | n/a
- Security Baseline: yes | no | n/a
- Security Deep: yes | no | n/a
- Web/UI: yes | no | n/a
- Architecture: yes | no | n/a
- Contracts: yes | no | n/a
- Operations: yes | no | n/a

Security impact:
Areas touched:
Risk found:
Human review needed:
```

If a required pack was not loaded, mark the report `blocked` or `needs-review`
instead of pretending the work is complete.

## relationship to LLM-Wiki

- Coding Pack: [[../coding/agent-coding-workflow.md]]
- Frontend knowledge: [[../frontend/README.md]]
- UI knowledge: [[../ui/README.md]]
- Architecture patterns: [[../architecture-patterns/README.md]]
- Contract knowledge: [[../contracts/README.md]]
- Operations knowledge: [[../operations/README.md]]
- Result report template: [[../../../templates/agent_result_report.template.md]]
