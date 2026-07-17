---
name: observability
description: Observability guidance for logs, metrics, traces, correlation IDs, dashboards, alerts, and redaction.
date_ingested: 2026-06-27
status: active
source_type: web-research
source_urls:
  - https://opentelemetry.io/docs/what-is-opentelemetry/
  - https://opentelemetry.io/docs/concepts/signals/
confidence: high
confidence_reviewed: 2026-07-01
---

# observability

## purpose

Use this guide when a task changes runtime behavior, deployment, background
jobs, external integrations, failure handling, performance, or production
supportability.

## checklist

- Identify signals needed: logs, metrics, traces, and optionally profiles.
- Decide the backend/storage and dashboard path. OpenTelemetry helps generate,
  collect, and export telemetry; it is not itself the observability backend.
- Use semantic conventions/resource attributes where supported by the repo's
  OpenTelemetry libraries so telemetry can be queried consistently.
- Preserve correlation/request IDs across boundaries.
- Log event names and coarse context, not secrets or sensitive payloads.
- Define owner for dashboards and alerts when adding persistent telemetry.
- For distributed work, confirm traces or equivalent correlation cross service,
  queue, and job boundaries.
- Record sampling/redaction assumptions when relevant.

## current-source notes checked 2026-07-01

OpenTelemetry docs list traces, metrics, logs, and baggage as currently
supported signals. Events and profiles are under development or proposal-stage
areas. Use profiles only when the repo's runtime/tooling supports them and the
task needs code-level resource evidence; do not require profiles for ordinary
deployment proof.

OpenTelemetry semantic conventions include emerging GenAI and MCP-related
areas. Treat those as useful for AI/agent observability when the repo's
instrumentation stack supports them, but keep sensitive prompt/context data
redacted by default.

## anti-patterns

- Adding telemetry libraries without deciding where data goes.
- Logging tokens, passwords, PII, or payment details.
- Creating metrics with no owner or alert action.
- Recording only happy-path observability for a failure-handling change.
- Emitting high-cardinality user/input labels into metrics without a retention,
  cost, and privacy decision.

## related

- Deployment readiness: [[deployment-readiness.md]]
- Security baseline: [[../coding/security-baseline.md]]
- Architecture skill guide: [[../project-docs/architecture_skill.md]]
