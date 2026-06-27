---
name: api-design
description: API contract guidance for route behavior, compatibility, error shape, versioning, authorization, and validation evidence.
date_ingested: 2026-06-27
status: active
source_type: web-research + project-file-back
source_urls:
  - https://spec.openapis.org/oas/latest.html
confidence: high
confidence_reviewed: 2026-06-27
---

# api design

## purpose

Use this guide when a task changes an API route, DTO, response shape, error
shape, authorization boundary, pagination/filtering behavior, or external
consumer contract.

## checklist

- Identify consumers and compatibility expectations.
- Treat the API surface as a contract: path, method, parameters, request body,
  response body, status codes, headers, auth scheme, error shape, examples, and
  documented side effects.
- Validate inputs at the boundary.
- Keep response and error shapes predictable.
- Preserve authorization and ownership checks.
- Make pagination, filtering, sorting, and null/empty behavior explicit.
- Document new or changed routes in repo contracts.
- Add tests for success, invalid input, forbidden access, and missing resource
  paths based on task risk.

## anti-patterns

- Changing a response shape without naming consumers.
- Returning broader data to avoid another API call.
- Mixing validation, authorization, and transformation rules across duplicated
  code paths.
- Treating route names as internal details after frontend or external consumers
  depend on them.
- Shipping undocumented streaming, multipart, file upload, callback, or webhook
  behavior as if it were an ordinary JSON request/response route.

## related

- Repo contracts guide: [[../project-docs/contracts.md]]
- Security baseline: [[../coding/security-baseline.md]]
- Architecture pattern matrix: [[../architecture-patterns/pattern-selection-matrix.md]]
