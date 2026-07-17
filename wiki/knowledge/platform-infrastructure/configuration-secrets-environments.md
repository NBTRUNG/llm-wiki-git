---
name: configuration-secrets-environments
description: Configuration, secrets, and environment guidance for deployable systems.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://12factor.net/config
confidence: medium
confidence_reviewed: 2026-07-01
---

# Configuration, Secrets, And Environments

## Rules

- Config varies by environment; code should not.
- Secrets never live in committed source, images, logs, screenshots, or reports.
- Startup should fail clearly when required config is missing or invalid.
- Config names, purpose, and required/optional status should be documented.
- Production config changes need readback or smoke proof.
- Local defaults must not accidentally target production.

## Report

```text
Config keys changed:
Secret source:
Validation behavior:
Environment affected:
Readback/smoke proof:
Rollback:
```

