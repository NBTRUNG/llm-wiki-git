---
name: security-privacy-pack
description: Deep security and privacy pack for threat modeling, trust boundaries, sensitive data, privacy, and incident-sensitive work.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://owasp.org/www-project-application-security-verification-standard/
  - https://www.nist.gov/privacy-framework
  - https://www.nist.gov/cyberframework
confidence: medium
confidence_reviewed: 2026-07-01
---

# Security Deep + Privacy Pack

Use this pack when work touches authentication, authorization, sensitive data,
tenant boundaries, privacy, uploads, payments, secrets, dependency trust,
incident response, or security posture.

This pack extends the Coding Pack Security Baseline. It does not replace
repo-specific security, legal, or compliance requirements.

## Read Order

| Intent | Read |
| --- | --- |
| Threat model or trust boundary | [threat-modeling.md](threat-modeling.md) |
| Auth/session/tenant-sensitive behavior | [auth-identity-access.md](auth-identity-access.md) |
| Privacy or PII | [privacy-data-protection.md](privacy-data-protection.md) |
| Dependency/supply chain | [supply-chain-dependencies.md](supply-chain-dependencies.md) |
| Incident/recovery sensitive work | [incident-response.md](incident-response.md) |

## Output

Report:

```text
Assets/data involved:
Actors and trust boundaries:
Threats considered:
Controls preserved/added:
Privacy impact:
Tests/evidence:
Human/legal/security review needed:
```

