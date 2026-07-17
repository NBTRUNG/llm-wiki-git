---
name: threat-modeling
description: Threat modeling guide for assets, actors, trust boundaries, misuse cases, controls, and evidence.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://owasp.org/www-project-application-security-verification-standard/
  - https://www.nist.gov/cyberframework
confidence: medium
confidence_reviewed: 2026-07-01
---

# Threat Modeling

Use when a task changes security posture or trust boundaries.

## Steps

1. Name assets: data, credentials, money, admin actions, infrastructure,
   availability, reputation.
2. Name actors: anonymous user, authenticated user, admin, tenant, service,
   vendor, agent/tool, attacker.
3. Draw or list trust boundaries.
4. Identify misuse cases and abuse paths.
5. Pick controls: auth, authorization, validation, rate limits, isolation,
   encryption, audit, monitoring, rollback.
6. Define proof: tests, config readback, review, logs, denied-path checks.

## Stop Conditions

Stop for human/security review when the task changes auth, tenant isolation,
credential lifetime, sensitive data exposure, payment, production access, or
external trust boundary.

