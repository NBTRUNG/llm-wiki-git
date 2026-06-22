---
name: quality-attributes
description: Non-functional architecture concerns — security, performance, reliability, observability, deployability, scalability, maintainability. Use when defining acceptance criteria or reviewing architecture trade-offs.
source_type: external-research
source_urls:
  - https://arc42.org/overview (section 10)
  - https://en.wikipedia.org/wiki/Non-functional_requirement
date_ingested: 2026-05-23
confidence: medium
confidence_reviewed: 2026-05-23
applicable_contexts: pending first project use
status: active
---

# Quality attributes

Architecture is mostly about trade-offs between quality attributes. Get these
right and the system works; ignore them and the system fails despite "working"
in tests.

A quality attribute is meaningful only when expressed as a **scenario** with
measurable acceptance criteria. "Fast" is not a quality goal. "p95 latency
under 200ms for /search at 100 RPS" is.

## the common attributes

### Security

Confidentiality, integrity, availability of data and operations.

Scenario template: "Given <attacker capability>, when <action>, then
<resource> remains <state>."

Example: "Given a user with role `reader`, when they POST to `/admin/users/123`,
then the server returns 403 and no user record changes."

See also: [[../security/owasp-top-10.md]], [[../security/stride.md]].

### Performance

Latency, throughput, resource utilization under load.

Scenario template: "Under <load profile>, <operation> completes in <time> at
<percentile>."

Example: "Under 100 concurrent users, `/dashboard` p95 response time stays
under 300ms for 60 seconds of sustained load."

### Reliability

Recovery from failure, mean time between failures, graceful degradation.

Scenario template: "When <failure mode> occurs, the system <degrades or
recovers> within <time>."

Example: "When the primary database fails, the read path falls back to the
replica within 5 seconds and returns stale data tagged as such."

### Observability

Ability to understand internal state from external signals.

Scenario template: "When <event>, operator can answer <question> using
<signal> within <time>."

Example: "When a request fails with 500, the operator can identify the
upstream cause within 2 minutes using request_id correlation across service logs."

### Deployability

Time, risk, and effort required to ship a change.

Scenario template: "A <change type> can be deployed to production in <time>
with <rollback path>."

Example: "A backend bug fix can be deployed in under 10 minutes, with
automatic rollback if error rate exceeds 1% within 5 minutes."

### Scalability

Ability to handle growth in load or data without redesign.

Scenario template: "When <growth dimension> grows to <multiple>, the system
<continues meeting other attributes> with <scaling strategy>."

Example: "When daily active users grow from 10k to 100k, response time stays
under 500ms p95 by adding stateless web nodes; the database remains the same
size."

### Maintainability

Time and risk required to understand, modify, and extend the system.

Scenario template: "A <change type> can be made in <time> by <role> without
breaking <constraint>."

Example: "A new HTTP endpoint following the existing pattern can be added by
one engineer in under 4 hours without modifying shared modules."

## quality attribute trade-offs

Some attributes pull against each other:

| Improve | Often costs |
|---|---|
| Performance | Maintainability (caching, denormalization) |
| Scalability | Reliability (distributed systems failure modes) |
| Security | Performance, observability (encryption, redaction) |
| Deployability | Reliability (frequent releases = more risk windows) |
| Maintainability | Performance (abstraction layers) |

The architect's job is choosing which trade-offs the project accepts. Document
the chosen trade-offs in ADRs (see [[adr.md]]).

## use in architecture docs

In arc42 section 10 (quality requirements):

- Pick the top 3-5 attributes that matter most for this project.
- Express each as one or more scenarios.
- Verify scenarios with tests (load tests, security tests, chaos tests, etc.).
- Record the trade-offs you accepted in decisions.

In task acceptance criteria:

- When a task affects a quality attribute, the acceptance criteria should
  reference a scenario, not just "should be fast" or "should be secure".

## anti-patterns

- Listing "we care about all of them" without picking priorities.
- Quality goals without measurable scenarios.
- Quality attributes as a checkbox at the end of design rather than a driver.
- Conflating risk lane with quality attributes (risk lane is about blast
  radius; quality attributes are about properties of the system).

## sources

- arc42 Quality Requirements (section 10): https://arc42.org/overview
- Wikipedia, Non-functional requirement: https://en.wikipedia.org/wiki/Non-functional_requirement
- ISO/IEC 25010 software quality model (referenced widely in practice)
