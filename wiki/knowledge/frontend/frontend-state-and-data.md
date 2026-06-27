---
name: frontend-state-and-data
description: Frontend data-flow, request waterfall, client cache, and browser storage guidance.
date_ingested: 2026-06-27
status: active
source_type: skill-file-back
confidence: medium
confidence_reviewed: 2026-06-27
---

# frontend state and data

## purpose

Use this guide when frontend work touches data fetching, caching, query
deduplication, localStorage/sessionStorage, route state, or client/server data
boundaries.

## checklist

- Fetch at the highest useful level that avoids duplicate requests and keeps
  loading states understandable.
- Run independent requests in parallel where the framework allows it.
- Deduplicate repeated reads with the repo's accepted query/cache mechanism.
- Keep cache keys explicit and include user, tenant, locale, permission, and
  filter scope when relevant.
- Version browser storage schemas and handle missing or stale values.
- Avoid storing sensitive data in browser storage unless the repo's security
  model explicitly allows it.
- Keep server-owned truth on the server; use client state for UI state,
  optimistic updates, or cached views with invalidation.

## security triggers

Load the Security Deep Pack when data work touches:

- user, tenant, role, ownership, private data, or admin visibility;
- cache keys that could leak cross-user or cross-tenant data;
- tokens, sessions, credentials, or browser storage of sensitive values;
- optimistic mutations that can bypass authorization or validation;
- external APIs or new trust boundaries.

## anti-patterns

- Fetching the same data in multiple nested components without deduplication.
- Using localStorage as an unversioned database.
- Caching private data with a key that omits user or tenant scope.
- Fixing performance by returning broader data than the UI is authorized to
  show.

## related

- React performance: [[react-performance.md]]
- Next.js performance: [[nextjs-performance.md]]
- Security baseline: [[../coding/security-baseline.md]]
