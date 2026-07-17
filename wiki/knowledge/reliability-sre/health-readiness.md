---
name: health-readiness
description: Health check, readiness, startup, dependency, and smoke-test guidance.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# Health And Readiness

## Checks

- Liveness proves the process should keep running.
- Readiness proves the service can handle traffic.
- Startup checks validate config and critical dependencies.
- Health endpoints must not leak secrets, stack traces, or private dependency
  details.
- Smoke tests should exercise the user/API workflow, not only `/health`.

## Evidence

Record endpoint, expected status, dependency behavior, and smoke route/API
checks after deploy.

