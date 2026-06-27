---
name: event-contracts
description: Event and async workflow contract guidance for producers, consumers, schemas, idempotency, retries, replay, and DLQs.
date_ingested: 2026-06-27
status: active
source_type: web-research + project-file-back
source_urls:
  - https://github.com/cloudevents/spec
confidence: high
confidence_reviewed: 2026-06-27
---

# event contracts

## purpose

Use this guide when changing async events, queues, background jobs, webhooks,
pub/sub topics, projections, or cross-service workflows.

## checklist

- Name events as facts that happened.
- Define producer, consumers, schema, version, and ownership.
- For cross-service events, prefer a standard envelope. CloudEvents required
  attributes are `id`, `source`, `specversion`, and `type`; useful optional
  fields include `datacontenttype`, `dataschema`, `subject`, and `time`.
- Define idempotency key and duplicate handling.
- Define retry, timeout, dead-letter, and replay behavior.
- Preserve trace/correlation IDs across the boundary.
- Avoid sensitive payloads unless required and authorized.
- Keep event payloads compact; prefer references/links for large data when
  access control or selective disclosure matters.
- Test or manually prove success, duplicate, malformed, retry, and failure paths
  based on task risk.

## anti-patterns

- Publishing events without a schema owner.
- Hiding distributed transaction assumptions in event handlers.
- Retrying non-idempotent handlers without protection.
- Dropping failures silently instead of DLQ/reporting.
- Treating internal events as safe to expose sensitive data.
- Putting routing, filtering, or policy-critical metadata only inside opaque
  payload data when middleware needs envelope-level attributes.

## related

- Event-driven pattern: [[../architecture-patterns/event-driven.md]]
- Security baseline: [[../coding/security-baseline.md]]
- Zero-trust security: [[../architecture-patterns/zero-trust-security.md]]
