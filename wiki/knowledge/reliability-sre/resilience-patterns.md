---
name: resilience-patterns
description: Resilience guidance for timeouts, retries, circuit breakers, idempotency, backpressure, queues, and graceful degradation.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# Resilience Patterns

## Checks

- Timeouts are explicit for network/external calls.
- Retries are bounded, jittered, and safe for idempotent operations.
- Idempotency keys protect repeated mutations.
- Circuit breakers or fallback paths exist for fragile dependencies when needed.
- Queues/workers define retry, DLQ, replay, and poison-message behavior.
- Backpressure protects downstream services and databases.
- Graceful degradation preserves core user value when optional dependencies
  fail.

## Anti-Patterns

- Infinite retries.
- Retrying non-idempotent writes.
- Hiding dependency failures as success.
- Adding queues without DLQ/replay ownership.

