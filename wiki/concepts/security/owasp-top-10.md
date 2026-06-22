---
name: owasp-top-10
description: OWASP Top 10 2025 — the most critical web application security risks. Use as a checklist when reviewing security posture and as a vocabulary for vulnerability discussions.
source_type: external-research
source_urls:
  - https://owasp.org/Top10/2025/
  - https://owasp.org/Top10/2025/0x00_2025-Introduction/
  - https://owasp.org/www-project-top-ten/
date_ingested: 2026-05-23
confidence: high
confidence_reviewed: 2026-05-23
applicable_contexts:
  - web application security review
  - vulnerability vocabulary
status: active
edition: 2025 (8th edition, released late 2025)
---

# OWASP Top 10 — 2025 edition

The 8th edition of OWASP's Top 10 web application security risks, based on
analysis of 175,000+ CVEs and 2.8 million tested applications across 589 CWEs.

Compared to 2021: two new categories (Software Supply Chain Failures,
Mishandling of Exceptional Conditions); SSRF merged into Broken Access Control;
Security Misconfiguration jumped from #5 to #2.

## the 2025 list

| ID | Category | Notes |
|---|---|---|
| A01 | Broken Access Control | Still #1. SSRF rolled in from 2021. ~3.73% of apps tested had at least one of 40 CWEs in this category. |
| A02 | Security Misconfiguration | Up from #5 in 2021. Reflects modern cloud/microservices deployments. |
| A03 | Software Supply Chain Failures | **NEW**. Expansion of A06:2021 "Vulnerable and Outdated Components" to cover third-party libraries, build tools, package managers, CI/CD pipelines. |
| A04 | Cryptographic Failures | Down from #2. |
| A05 | Injection | Down from #3. |
| A06 | Insecure Design | Down from #4. Architectural-level flaws. |
| A07 | Authentication Failures | Renamed from "Identification and Authentication Failures". 36 CWEs total. Authentication frameworks helping, but failures persist. |
| A08 | Software or Data Integrity Failures | Code integrity, data artifacts, cross-platform trust below the supply chain layer. |
| A09 | Security Logging & Alerting Failures | Renamed from "Logging and Monitoring Failures". Captures missing telemetry and ineffective monitoring. |
| A10 | Mishandling of Exceptional Conditions | **NEW**. 24 CWEs on improper error handling, logical errors, failing open. |

## cross-reference to `security-baseline.md`

| OWASP 2025 | Covered in `security-baseline.md` section |
|---|---|
| A01 Broken Access Control | `authentication and authorization` |
| A02 Security Misconfiguration | `secret management`, `dependency and supply-chain checks` |
| A03 Software Supply Chain Failures | `dependency and supply-chain checks` |
| A04 Cryptographic Failures | `credentials and passwords`, `secret management` |
| A05 Injection | `input validation` |
| A06 Insecure Design | (architecture-level — covered via [[stride.md]] threat modeling, [[../architecture/quality-attributes.md]] security scenarios) |
| A07 Authentication Failures | `authentication and authorization`, `credentials and passwords` |
| A08 Software or Data Integrity Failures | `dependency and supply-chain checks` + (project-level integrity checks) |
| A09 Security Logging & Alerting Failures | `logging and observability` |
| A10 Mishandling of Exceptional Conditions | (code-level — covered in [[../../knowledge/coding/code-quality.md]] `error handling`) |

## how to use the list

- **Design phase**: cross-check threat model (see [[stride.md]]) against each
  Top 10 category. Note which apply to this system; ignore irrelevant ones
  explicitly.
- **Code review**: use as a vocabulary. "This looks like A01" is more
  actionable than "this might have access control issues".
- **Security testing**: pen-test scope should at minimum cover the categories
  that apply to the system.
- **Onboarding**: new engineers should be able to name and recognize the Top
  10.

## anti-patterns

- Treating Top 10 as a complete list. It is **top 10**, not "all the risks".
  An application can be Top-10-clean and still have serious vulnerabilities
  in business logic, configuration, or supply chain.
- Skipping A06 Insecure Design because "we will fix it in code". Design
  flaws cannot be fully fixed in code.
- Treating A10 (new category) as "just better error handling" — it includes
  failing-open scenarios where the wrong default exposes data.
- Outdated references to 2021 Top 10 in current documents — verify edition.

## sources

- Official OWASP Top 10 2025: https://owasp.org/Top10/2025/
- Introduction: https://owasp.org/Top10/2025/0x00_2025-Introduction/
- OWASP project hub: https://owasp.org/www-project-top-ten/
