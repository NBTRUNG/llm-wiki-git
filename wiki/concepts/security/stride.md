---
name: stride
description: STRIDE threat model — 6 categories of security threats organized by attacker goal. Use during architecture and design to enumerate threats per data-flow component.
source_type: external-research
source_urls:
  - https://en.wikipedia.org/wiki/STRIDE_model
  - https://owasp.org/www-community/Threat_Modeling_Process
  - https://www.securitycompass.com/blog/stride-in-threat-modeling/
date_ingested: 2026-05-23
confidence: high
confidence_reviewed: 2026-05-23
applicable_contexts:
  - architecture threat modeling
  - security design review
status: active
---

# STRIDE

Created by Loren Kohnfelder and Praerit Garg at Microsoft (1999). STRIDE is a
threat modeling framework that classifies threats by **attacker goal** into
six categories:

| Letter | Category | Attacker goal | CIA property violated |
|---|---|---|---|
| S | Spoofing | Impersonate another user or system | Authentication |
| T | Tampering | Modify data or system components without authorization | Integrity |
| R | Repudiation | Perform an action and deny it later | Non-repudiation |
| I | Information disclosure | Read data the attacker should not see | Confidentiality |
| D | Denial of service | Make the system unavailable | Availability |
| E | Elevation of privilege | Gain capabilities beyond authorized | Authorization |

## the 6 categories in detail

### S — Spoofing

Pretending to be someone or something else. Compromises authentication.

Questions to ask:
- How does the system know who the caller is?
- Can the caller forge an identity (stolen token, replay, session fixation)?
- Are service-to-service identities authenticated?

Mitigations: strong auth (MFA), short-lived tokens, mutual TLS for
service-to-service.

### T — Tampering

Unauthorized modification of data in transit or at rest, or modification of
code/config.

Questions to ask:
- Can an attacker modify data while it crosses the network?
- Can an attacker write to files, database rows, or memory they should not?
- Can an attacker alter binaries, container images, or config files?

Mitigations: TLS, signed payloads, integrity hashes, ACLs on storage, signed
artifacts.

### R — Repudiation

An actor performs an action and denies involvement. Often due to insufficient
or alterable logging.

Questions to ask:
- For each sensitive action, is there a tamper-evident audit record?
- Can the actor delete or modify the audit trail?
- Are logs correlated by request_id across services?

Mitigations: append-only audit logs, log integrity (signed/hash-chained),
external log sinks the actor cannot reach.

### I — Information disclosure

Exposing data to someone who should not see it. Reading without permission.

Questions to ask:
- Are responses leaking data not relevant to the caller?
- Are error messages revealing internals (stack traces, query strings)?
- Are logs containing secrets, PII, or tokens?
- Is data at rest encrypted?

Mitigations: least-privilege queries, response filtering, error redaction,
log scrubbing, encryption.

### D — Denial of service

Making the system unavailable through resource exhaustion, crash, or
amplification.

Questions to ask:
- Can a single caller exhaust connections, CPU, memory, or disk?
- Are there rate limits on expensive endpoints?
- Are file uploads, query depths, recursion depths bounded?
- Is there back-pressure when a downstream service is slow?

Mitigations: rate limits, request size limits, query complexity limits,
circuit breakers, autoscaling, CDN/WAF.

### E — Elevation of privilege

Gaining capabilities beyond what the role is authorized for.

Questions to ask:
- Can a normal user trigger an admin path through a missing check?
- Are authorization checks at every privileged operation, not just at login?
- Are role checks done server-side, not just in the UI?
- Can a tenant's data be accessed by another tenant?

Mitigations: server-side authorization at every privileged action,
tenant-scoped queries, principle of least privilege.

## how to apply STRIDE

Standard process:

1. **Decompose the system** into components: services, databases, APIs, UI,
   external integrations.
2. **Draw a data-flow diagram (DFD)** with trust boundaries marked. A trust
   boundary is anywhere data crosses from one trust level to another (user
   ↔ server, server ↔ database, tenant A ↔ tenant B).
3. **For each element crossing a trust boundary**, walk through STRIDE and
   ask the questions above. Skip categories that do not apply (an
   internal pure-function library has no `D` threats from outside).
4. **Document threats and proposed mitigations**. Map each threat to a code
   or design control.
5. **Verify**: write tests for denied/invalid access (covers S, E, I), input
   validation tests (covers T, I), and rate-limit / abuse tests (covers D).

## STRIDE per element

A variant that applies STRIDE to each individual component (every API, every
data store, every authentication mechanism) for a more granular pass. More
work, but catches issues that high-level STRIDE-per-DFD misses.

## complementary methodologies

- **DREAD**: scoring framework (Damage, Reproducibility, Exploitability,
  Affected users, Discoverability) — useful after STRIDE identifies threats.
- **PASTA**: process-based, integrates business risk; heavier than STRIDE.
- **Attack trees**: model an attacker goal as a tree of preconditions.

## relationship to OWASP Top 10

STRIDE identifies threats per component; OWASP Top 10 names the most common
classes of bugs that lead to those threats. They complement each other:

| STRIDE | Most-related Top 10 |
|---|---|
| S Spoofing | A07 Authentication Failures |
| T Tampering | A08 Software or Data Integrity Failures |
| R Repudiation | A09 Security Logging & Alerting Failures |
| I Information disclosure | A02 Security Misconfiguration, A04 Cryptographic Failures |
| D Denial of service | (not in Top 10 directly — see abuse controls) |
| E Elevation of privilege | A01 Broken Access Control |

## anti-patterns

- STRIDE without trust boundaries — applies the model uniformly to all
  components and misses cross-tier threats.
- Threat list without mitigations — knowing the threat without acting on it.
- One-time STRIDE during initial design — threats evolve as features land.
- Treating STRIDE as a security checklist for the code reviewer rather than a
  design tool for the architect.

## sources

- Wikipedia STRIDE model: https://en.wikipedia.org/wiki/STRIDE_model
- OWASP Threat Modeling Process: https://owasp.org/www-community/Threat_Modeling_Process
- Security Compass STRIDE introduction: https://www.securitycompass.com/blog/stride-in-threat-modeling/
- Microsoft Threat Modeling Tool (uses STRIDE): https://learn.microsoft.com/en-us/azure/security/develop/threat-modeling-tool
