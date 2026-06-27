---
name: zero-trust-security-architecture
description: Security architecture pattern for no implicit trust, per-request authorization, policy enforcement, segmentation, telemetry, and threat-model-backed controls.
source_type: web-research + concept-file-back
date_ingested: 2026-06-24
confidence: high
confidence_reviewed: 2026-06-24
status: active
source_urls:
  - https://csrc.nist.gov/pubs/sp/800/207/final
  - https://owasp.org/www-project-threat-modeling/
  - https://owasp.org/Top10/2025/
  - https://csrc.nist.gov/pubs/sp/800/218/final
---

# Zero-trust security architecture

Zero-trust security architecture is a cross-cutting architecture pattern, not a
single product or a deployment topology. It assumes no implicit trust based on
network location, asset ownership, service mesh membership, VPN access, or
"internal" status.

Every access path must be authenticated, authorized, least-privileged,
observable, and revocable.

```
caller -> policy enforcement point -> policy decision point -> resource
          identity + device/service + context + resource sensitivity
```

## relationship to other patterns

Zero trust composes with every architecture pattern:

| Pattern | Zero-trust implication |
| --- | --- |
| Layered | Do not rely on controller-only checks; enforce authorization near sensitive business actions and data access. |
| Modular monolith | Treat module boundaries and privileged operations as policy boundaries even inside one process. |
| Hexagonal | Model auth, policy, audit, and secret stores as ports/adapters; keep domain rules distinct from infrastructure policy engines. |
| Microservices | Authenticate and authorize service-to-service calls; no flat network trust or shared service credentials. |
| Event-driven | Sign or authenticate producers, authorize consumers, classify event payloads, and preserve audit/correlation IDs. |
| Strangler migration | Do not let old and new paths create inconsistent auth, logging, or data-access rules during cutover. |

## strengths

- Limits blast radius when a user, service, token, device, or network segment is
  compromised.
- Makes trust boundaries explicit in architecture diagrams and review.
- Supports remote users, cloud assets, service-to-service traffic, and
  third-party integrations without depending on a flat perimeter.
- Creates reviewable evidence for authentication, authorization, logging, and
  policy decisions.

## weaknesses

- Requires identity, policy, secrets, telemetry, and operational ownership.
- Poorly designed policy checks can increase latency or create availability
  coupling to central identity/policy services.
- Migration from perimeter or VPN trust can be incremental and politically
  difficult.
- Tooling can create false confidence if application authorization and data
  scoping remain weak.

## when to use

Use as the default security posture for production systems, especially when:

- users, admins, partners, services, devices, or workers access sensitive data;
- services communicate across process, network, account, tenant, or cloud
  boundaries;
- remote access, BYOD, cloud-hosted assets, or third-party integrations exist;
- the system has admin functions, payments, uploads, private content, PII,
  regulated data, or multi-tenant data;
- event streams or background jobs can mutate state or leak sensitive data.

## when NOT to use

Do not use "zero trust" as a label when the project lacks:

- an identity model for users and service principals;
- authorization rules at resource/action boundaries;
- a policy enforcement point in the access path;
- logs/audit evidence for sensitive decisions;
- a migration plan for existing implicit-trust paths.

For prototypes and local-only tools, still document the trust assumptions and
the trigger that would require zero-trust controls before production use.

## architecture components

- **Identity provider**: authenticates users and, where applicable, service
  principals or workloads.
- **Policy decision point**: evaluates whether a subject may access a resource
  in the current context.
- **Policy enforcement point**: sits in the request path and enforces the
  decision before resource access.
- **Resource policy**: defines allowed actions by subject, tenant, role, device,
  service, data classification, or business context.
- **Secrets and key management**: issues short-lived credentials, rotates
  secrets, and limits credential scope.
- **Telemetry and audit**: records sensitive access decisions, denials,
  administrative actions, and correlation IDs.

## design checklist

Before accepting a zero-trust architecture, record:

- protected resources and data classifications;
- trust boundaries on a C4 or data-flow diagram;
- user and service identities;
- policy decision and enforcement points;
- authorization model: role, attribute, relationship, tenant, or explicit ACL;
- session/token lifetime and credential rotation;
- service-to-service authentication strategy;
- audit events and log redaction policy;
- failure behavior when identity or policy services are unavailable;
- migration plan for any existing implicit-trust path.

## threat-model gate

Use OWASP's four threat-modeling questions for security-relevant architecture:

```text
What are we working on?
What can go wrong?
What are we going to do about it?
Did we do a good enough job?
```

At minimum, run STRIDE over every trust boundary that touches authentication,
authorization, tenant data, secrets, uploads, payments, admin actions,
callbacks, external services, events, or production configuration.

## validation

Security architecture is not accepted by diagram alone. Require evidence:

| Control | Proof |
| --- | --- |
| Authentication | Unauthenticated request is denied at every protected boundary. |
| Authorization | Wrong role, tenant, owner, or service principal is denied. |
| Policy enforcement | Requests cannot bypass the enforcement point through alternate routes, workers, or direct data access. |
| Credential handling | Secrets are not hardcoded or logged; tokens expire and rotate according to policy. |
| Service-to-service access | Workload identity, mTLS, signed token, or equivalent proof exists for sensitive calls. |
| Event access | Producers and consumers are authenticated/authorized; event payloads avoid unnecessary sensitive data. |
| Auditability | Sensitive allow/deny decisions include actor, resource, action, result, and correlation ID without leaking secrets. |
| Failure mode | Identity/policy outage behavior is deliberate: fail closed for sensitive access or documented exception. |

## anti-patterns

- **VPN equals zero trust**: a VPN that grants broad internal access is still a
  perimeter.
- **Mesh equals zero trust**: service mesh encryption without per-service
  authorization is transport security, not full zero trust.
- **Login-only authorization**: users are authenticated once, then sensitive
  actions lack resource/action checks.
- **Policy only in the UI**: hiding controls client-side without server-side
  enforcement.
- **Long-lived shared service keys**: every service can impersonate every other
  service indefinitely.
- **Audit logs with secrets**: observability that leaks tokens, passwords, PII,
  or payment data.

## sources

- NIST SP 800-207 Zero Trust Architecture: https://csrc.nist.gov/pubs/sp/800/207/final
- OWASP Threat Modeling Project: https://owasp.org/www-project-threat-modeling/
- OWASP Top 10:2025: https://owasp.org/Top10/2025/
- NIST SP 800-218 SSDF: https://csrc.nist.gov/pubs/sp/800/218/final

## related

- Zero trust concept: [[../../concepts/security/zero-trust.md]]
- Defense in depth concept: [[../../concepts/security/defense-in-depth.md]]
- STRIDE threat modeling: [[../../concepts/security/stride.md]]
- Coding security baseline: [[../coding/security-baseline.md]]
