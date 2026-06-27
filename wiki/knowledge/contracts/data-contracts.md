---
name: data-contracts
description: Data schema, migration, ownership, compatibility, and validation guidance.
date_ingested: 2026-06-27
status: active
source_type: web-research + project-file-back
source_urls:
  - https://spec.openapis.org/oas/latest.html
confidence: medium
confidence_reviewed: 2026-06-27
---

# data contracts

## purpose

Use this guide when changing schemas, migrations, data ownership, DTO mapping,
CMS fields, import/export formats, seed data, or database access behavior.

## checklist

- Identify the owning module/service and consumers.
- Define old/new shape and compatibility window.
- Define schema dialect/format when data crosses a boundary: JSON Schema,
  OpenAPI schema, database schema, CSV shape, CMS field set, or vendor contract.
- Keep migrations reversible or document the rollback limit.
- Preserve authorization and tenant/owner scoping in reads and writes.
- Treat imported files, CMS content, and external records as untrusted input.
- Separate stored shape from API/view shape when exposing internal fields would
  leak implementation details or sensitive data.
- Prove behavior for empty, malformed, missing, duplicate, and legacy data where
  risk justifies it.

## anti-patterns

- Adding fields without defining source, owner, fallback, and display behavior.
- Sharing database tables across boundaries that claim independent ownership.
- Backfilling production data without rollback or verification notes.
- Using `NOLOCK` or equivalent weak reads for authorization, payment, security,
  or user-visible correctness paths.
- Treating generated API schemas as automatically correct when examples,
  nullable fields, defaults, or read/write-only fields are not validated.

## related

- API design: [[api-design.md]]
- Security baseline: [[../coding/security-baseline.md]]
- Architecture patterns: [[../architecture-patterns/README.md]]
