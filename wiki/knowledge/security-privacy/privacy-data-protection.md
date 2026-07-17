---
name: privacy-data-protection
description: Privacy, PII, data minimization, retention, consent, purpose limitation, and logging guidance.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://www.nist.gov/privacy-framework
confidence: medium
confidence_reviewed: 2026-07-01
---

# Privacy And Data Protection

Use when work touches PII, sensitive data, telemetry, analytics, AI prompts,
exports, logs, backups, or data sharing.

## Principles

- Collect only data needed for a named purpose.
- Keep retention, deletion, export, and access paths visible.
- Avoid logging sensitive data, prompts, tokens, payment details, or private
  content by default.
- Use pseudonymized or coarse identifiers when detailed identity is not needed.
- Treat AI prompts, retrieved context, and generated output as possible
  sensitive data.
- Record data sharing with external services or vendors.

## Report

```text
Data categories:
Purpose:
Retention/deletion:
Access control:
Logging/telemetry:
External sharing:
User/admin rights affected:
```

