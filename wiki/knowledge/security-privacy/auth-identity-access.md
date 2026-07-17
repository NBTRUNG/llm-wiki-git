---
name: auth-identity-access
description: Authentication, authorization, session, tenant, service identity, and access-control guidance.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# Auth, Identity, And Access

## Checks

- Authentication proves identity; authorization proves allowed action.
- Enforce authorization server-side, near the protected behavior.
- Check ownership/tenant boundary on every data read and mutation.
- Prefer least privilege for users, service accounts, agents, and tools.
- Protect session cookies/tokens with secure flags, expiration, rotation, and
  replay-risk review.
- Log sensitive admin/security events without logging secrets.

## Evidence

Add tests or manual proof for:

- unauthenticated denied;
- authenticated but unauthorized denied;
- cross-tenant or wrong-owner access denied;
- expired/invalid token denied;
- sensitive action audited.

