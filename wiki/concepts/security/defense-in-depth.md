---
name: defense-in-depth
description: Layered overlapping security controls. If one layer fails, others contain the threat. Use as the high-level structural principle for security architecture.
source_type: external-research
source_urls:
  - https://www.paloaltonetworks.com/cyberpedia/what-is-defense-in-depth
  - https://www.techtarget.com/searchsecurity/answer/Whats-the-difference-between-zero-trust-vs-defense-in-depth
  - https://csrc.nist.gov/presentations/2020/zero-trust-architecture-and-defense-in-depth
date_ingested: 2026-05-23
confidence: high
confidence_reviewed: 2026-05-23
applicable_contexts:
  - security architecture design
  - risk reduction strategy
status: active
---

# Defense in depth

Originally a military doctrine: assume any one defense will eventually fall,
so layer multiple independent defenses such that an attacker must defeat
several to reach the goal.

In application security, this means **no single control is solely
responsible** for protecting a critical asset.

## why it works

- Layers buy time. An attacker who breaches one layer must still defeat the
  next, giving the defender time to detect and respond.
- Layers cover each other's blind spots. WAF catches what input validation
  missed; output encoding catches what WAF missed.
- Independent failures. If two controls fail for the same reason, they were
  not independent — pick different mechanisms (e.g., regex filter + length
  limit + parameterized query for SQL injection defense).

## typical layers

A web application's defense layers, outer to inner:

| Layer | Examples |
|---|---|
| Network perimeter | Firewall, DDoS protection, geo-restriction |
| Reverse proxy / WAF | OWASP CRS rules, rate limits, request size limits |
| Application gateway | API authentication, mTLS, schema validation |
| Application code | Input validation, output encoding, parameterized queries |
| Authentication | MFA, password hashing, session management |
| Authorization | Server-side role checks, tenant scoping, row-level security |
| Data | Encryption at rest, encryption in transit, key rotation |
| Logging | Audit logs, anomaly detection, SIEM correlation |
| Backup + recovery | Encrypted backups, tested restore procedure |
| People and process | Security training, code review, incident response runbook |

## controls cover three dimensions

Defense in depth applies to:

- **Technology**: firewalls, encryption, secure coding, monitoring.
- **Process**: change management, access review, incident response, patching.
- **People**: security training, role separation, on-call rotations,
  background checks where relevant.

A pure-technology defense is incomplete. Most breaches involve at least one
process or people failure.

## design rule: assume one layer fails

For every critical asset, write down what protects it. Then ask: if any one
of those defenses is bypassed, what happens?

- "We have a WAF" → not enough; the WAF can be bypassed.
- "We have a WAF, plus parameterized queries, plus least-privilege DB
  credentials, plus query-level audit logging" → if the WAF fails, the
  database still rejects injection; if the auth fails, the user only has
  least-privilege access; the audit log will show the attempt.

## challenges

- **Management complexity**: many tools means many vendors, many alerts,
  many tuning surfaces.
- **Integration gaps**: alerts from one layer must inform another. Tools that
  do not interoperate become silos.
- **Cost**: more layers mean more licenses, more configuration time, more
  operational toil.
- **Diminishing returns**: stacking another firewall in front of an existing
  firewall is not real layering. Pick controls that fail differently.

## relationship to zero trust

Defense in depth and zero trust are **complementary**, not competing:

- Defense in depth says: layer many controls so failure of one is not fatal.
- Zero trust says: never grant access based on network location; verify every
  request.

Modern security uses **zero trust to strengthen the identity and network
layers within a defense-in-depth strategy**. See [[zero-trust.md]].

## anti-patterns

- **Single fence**: one strong control with nothing behind it. Once it's
  bypassed, the attacker reaches the goal directly.
- **Cosmetic layering**: stacking similar controls that fail the same way
  (three WAFs in a row, all using the same ruleset).
- **No detection**: prevention-only controls. When prevention fails (and
  eventually it will), there is no visibility into what happened.
- **No recovery**: defenses but no backup, no restore plan, no incident
  response runbook.
- **People layer omitted**: assuming attackers will not phish, social-
  engineer, or hire insiders.

## relationship to LLM-Wiki

- Practical code-level layers: see [[../../knowledge/coding/security-baseline.md]].
- Per-component threat enumeration: see [[stride.md]].
- Top vulnerability classes to defend against: see [[owasp-top-10.md]].
- Identity-layer hardening within DiD: see [[zero-trust.md]].

## sources

- Palo Alto Networks — Defense in Depth: https://www.paloaltonetworks.com/cyberpedia/what-is-defense-in-depth
- TechTarget — Zero trust vs Defense in Depth: https://www.techtarget.com/searchsecurity/answer/Whats-the-difference-between-zero-trust-vs-defense-in-depth
- NIST — Zero Trust Architecture and Defense in Depth: https://csrc.nist.gov/presentations/2020/zero-trust-architecture-and-defense-in-depth
