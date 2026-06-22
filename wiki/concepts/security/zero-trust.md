---
name: zero-trust
description: >
  "Never trust, always verify". Every user, device, and transaction proves legitimacy on every request regardless of network location. NIST SP 800-207.
source_type: external-research
source_urls:
  - "https://csrc.nist.gov/publications/detail/sp/800-207/final"
  - "https://www.virtru.com/blog/zero-trust/primer"
  - "https://www.cynet.com/blog/zero-trust-vs-defense-in-depth-unpacking-modern-it-security/"
date_ingested: 2026-05-23
confidence: high
confidence_reviewed: 2026-05-23
applicable_contexts:
  - identity and access architecture
  - cloud / remote-first deployments
status: active
---

# Zero trust

A security model that removes implicit trust from any user, device, or
network. Originally coined by John Kindervag at Forrester Research; formalized
by NIST in **SP 800-207** (2020).

Core slogan: **"Never trust, always verify."**

## the three foundational principles

### 1. Continuous verification

Every access request undergoes real-time authentication and authorization,
regardless of location or previous access history. Trust is not granted once
and reused; it is re-evaluated on every request.

### 2. Limit blast radius

Assume breach. Design so that compromise of one account, device, or service
does not cascade. Use micro-segmentation, least-privilege access, short-lived
credentials.

### 3. Automate context-aware policy

Authorization decisions consider: who is asking (identity), from what (device
posture), to access what (resource sensitivity), in what context (time,
location, behavior baseline). Policies are enforced by automated policy
engines, not static ACLs.

## what zero trust replaces

Traditional perimeter security:

```
[ trusted ] ← firewall → [ untrusted ]
   ↑                          ↑
 inside                    outside
```

Once you are "inside the firewall", you have wide access. This fails when:
- employees work remotely;
- attackers phish their way "inside";
- cloud services live outside the perimeter;
- services-to-services traffic is implicitly trusted within a VPC.

Zero trust replaces this with:

```
every request → (identity + device + context check) → resource
```

Network location is no longer a credential.

## key practices

- **Strong identity for everything**: users, services, devices each have
  verifiable identity.
- **Short-lived credentials**: tokens expire in minutes, not months.
- **MFA everywhere**: not just for admin paths.
- **Device posture checks**: is the device patched, encrypted, managed?
- **Micro-segmentation**: network paths are explicit and minimal.
- **Continuous monitoring**: deviations from baseline trigger re-verification
  or revocation.
- **Least privilege**: each identity has only the access needed for the
  current task.

## NIST SP 800-207 architecture

The reference architecture introduces:

- **Policy Decision Point (PDP)** — decides whether a request should be
  granted.
- **Policy Enforcement Point (PEP)** — sits in the request path; calls PDP
  and enforces the decision.
- **Policy Engine + Policy Administrator** — components inside the PDP.
- **Trust algorithm** — combines identity, device, behavior, and resource
  sensitivity into a decision.

Most modern implementations look like: identity provider (IdP) + access
proxy (PEP) + policy engine (PDP) + endpoint management (device posture).

## relationship to defense in depth

Zero trust strengthens the identity and network layers of a defense-in-depth
strategy. It does not replace DiD — you still need application, data,
logging, and recovery layers. See [[defense-in-depth.md]].

The complement:

- **DiD** says: layer many controls so one failure is not fatal.
- **Zero trust** says: do not let layer-1 (network position) be a credential
  for layer-N (resource access).

## what zero trust is NOT

- Not a single product. Vendors sell "zero trust" offerings, but zero trust
  is an architecture, not a SKU.
- Not "no trust at all". Trust is granular, evidenced, and revocable —
  not absent.
- Not a one-time project. Zero trust is a posture, continuously enforced
  and audited.
- Not only for big enterprises. The principles apply to a 5-person startup
  hosting on cloud just as much as to a defense contractor.

## adoption staging

NIST guidance suggests staged adoption rather than big-bang:

1. **Identity**: strong MFA, federated identity, short-lived tokens.
2. **Devices**: managed device posture; block unknown devices from sensitive
   resources.
3. **Network**: micro-segmentation, no implicit VPC trust.
4. **Application**: per-request authorization; remove "logged in = full
   access" assumptions.
5. **Data**: classification and encryption tied to policy.
6. **Visibility**: continuous monitoring feeding the trust algorithm.
7. **Automation**: policy engine + orchestration.

## anti-patterns

- **VPN as zero trust**: a VPN that grants flat network access once
  connected is not zero trust.
- **MFA at login only**: re-verification must happen for sensitive actions,
  not just initial sign-in.
- **Trust the service mesh**: if any service can call any other inside the
  mesh without authn/authz, the mesh is the new perimeter.
- **Long-lived service credentials**: API keys with no expiry break the
  short-lived credential principle.
- **"We do zero trust" with no policy engine**: enforcement scattered across
  every service is unauditable.

## relationship to LLM-Wiki

- For practical session/token rules: [[../../knowledge/coding/security-baseline.md]] `authentication and authorization`.
- For broader security layering: [[defense-in-depth.md]].
- For top vulnerability classes a zero-trust posture mitigates:
  [[owasp-top-10.md]] (A01, A02, A07).

## sources

- NIST SP 800-207 Zero Trust Architecture: https://csrc.nist.gov/publications/detail/sp/800-207/final
- Virtru Zero Trust primer: https://www.virtru.com/blog/zero-trust/primer
- Cynet — Zero Trust vs Defense in Depth: https://www.cynet.com/blog/zero-trust-vs-defense-in-depth-unpacking-modern-it-security/
- CISA Zero Trust Maturity Model (US gov): https://www.cisa.gov/zero-trust-maturity-model
