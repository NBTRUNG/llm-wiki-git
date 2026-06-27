# 2026-06-24 knowledge coding architecture security update

## Purpose

Record the LLM-Wiki knowledge updates made on Wednesday, 2026-06-24, so the
work can be reviewed and researched before the next discussion on Thursday,
2026-06-25.

## Scope

Updated reusable knowledge for:

- repo coding quality gates;
- architecture pattern selection;
- modular monolith guidance;
- zero-trust security architecture;
- architecture skill routing;
- architecture-vs-coding security ownership.

No real project repo implementation state was changed.

## Files changed

### Coding knowledge

- `wiki/knowledge/coding/implementation-quality-matrix.md` added.
- `wiki/knowledge/coding/README.md` updated to link the new matrix.
- `wiki/knowledge/coding/agent-coding-workflow.md` updated so the matrix is part
  of the required Coding Pack.
- `wiki/knowledge/coding/repo-code-rules.md` updated so repo coding read order
  includes the matrix.
- `wiki/knowledge/coding/security-baseline.md` updated to clarify that it owns
  code-level checks and should defer architecture-level security shape to the
  zero-trust architecture pattern.

### Architecture patterns

- `wiki/knowledge/architecture-patterns/pattern-selection-matrix.md` added.
- `wiki/knowledge/architecture-patterns/modular-monolith.md` added.
- `wiki/knowledge/architecture-patterns/zero-trust-security.md` added.
- `wiki/knowledge/architecture-patterns/README.md` updated with the new pattern
  entries and decision-table routes.

### Architecture skill guidance

- `wiki/knowledge/project-docs/architecture_skill.md` updated with:
  - pattern-selection routing;
  - security/trust-boundary check in default output shape;
  - zero-trust/security architecture guidance;
  - explicit relationship to coding security baseline.
- Installed skill updated:
  - `/home/admindebian/.agents/skills/architecture-skill/SKILL.md`

### Knowledge index

- `wiki/knowledge/README.md` updated to link the architecture-pattern catalog
  and coding implementation matrix.

## Research sources checked

Coding and output/security quality:

- OWASP Top 10:2025: https://owasp.org/Top10/2025/
- NIST SP 800-218 SSDF: https://csrc.nist.gov/pubs/sp/800/218/final
- SLSA v1.2: https://slsa.dev/spec/v1.2/
- WCAG 2.2: https://www.w3.org/TR/WCAG22/
- Design Tokens Format Module draft: https://www.designtokens.org/tr/drafts/format/

Architecture and patterns:

- Martin Fowler and James Lewis, Microservices: https://martinfowler.com/articles/microservices.html
- Martin Fowler, Monolith First: https://martinfowler.com/bliki/MonolithFirst.html
- Martin Fowler, Strangler Fig Application: https://martinfowler.com/bliki/StranglerFigApplication.html
- Chris Richardson, Saga pattern: https://microservices.io/patterns/data/saga.html
- Alistair Cockburn, Hexagonal Architecture: https://alistair.cockburn.us/hexagonal-architecture
- CNCF Cloud Native Definition: https://github.com/cncf/toc/blob/main/DEFINITION.md
- AWS Well-Architected Framework pillars: https://docs.aws.amazon.com/wellarchitected/latest/framework/the-pillars-of-the-framework.html
- OpenTelemetry: https://opentelemetry.io/docs/what-is-opentelemetry/
- C4 model: https://c4model.com/

Security architecture:

- NIST SP 800-207 Zero Trust Architecture: https://csrc.nist.gov/pubs/sp/800/207/final
- OWASP Threat Modeling Project: https://owasp.org/www-project-threat-modeling/

## Main decisions

### 1. Coding matrix is a gate, not a duplicate guide

`implementation-quality-matrix.md` does not replace code quality, output
quality, security baseline, or testing strategy. It gives agents one acceptance
matrix for code, technology, design system, security, output, and tests.

### 2. Architecture pattern catalog needed a modular monolith entry

The existing architecture approach guide already recommended monolith-first /
modular monolith, but the pattern catalog did not define it. A new
`modular-monolith.md` entry now covers strengths, weaknesses, module rules,
validation, anti-patterns, and migration paths.

### 3. Security pattern belongs in architecture-patterns

The wiki already had security concepts and coding security checks, but not a
security architecture pattern. `zero-trust-security.md` now owns the architecture
shape: trust boundaries, identity, policy enforcement, authorization, service
identity, audit, failure behavior, and threat-model validation.

### 4. Security ownership is split by level

To avoid duplication:

| Area | Owns |
| --- | --- |
| `wiki/concepts/security/` | Vocabulary and concepts: zero trust, defense in depth, STRIDE, OWASP categories. |
| `wiki/knowledge/architecture-patterns/` | System-level shape: trust boundaries, identity/policy architecture, service-to-service access, segmentation, data ownership, audit posture. |
| `wiki/knowledge/coding/` | Code-level controls: input validation, authorization checks, secrets, log redaction, dependency checks, tests. |
| `wiki/knowledge/project-docs/architecture_skill.md` and installed architecture skill | Routing: when architecture agents should consult security pattern vs coding baseline. |

## Validation performed

Commands/checks:

- Readback of all new files with `sed`.
- Link/reference search with `rg` for:
  - `implementation-quality-matrix`
  - `pattern-selection-matrix`
  - `modular-monolith`
  - `zero-trust-security`
  - `Security Architecture`
  - `Security Routing`
- Confirmed `reports/validation/README.md` naming rules before creating this
  report.

Limitations:

- `/home/admindebian/LLM-Wiki` is not a Git repository, so no git diff was
  available.
- No full wiki link compiler or graph lint was run in this session.

## Open discussion points for 2026-06-25

1. Should we create a dedicated `security-skill`, or is architecture skill +
   Coding Pack enough for now?
2. If a `security-skill` is created, should it be limited to orchestration over
   existing wiki files instead of duplicating content?
3. Should `architecture-patterns/` add separate pattern files for:
   - strangler migration;
   - saga;
   - BFF/API gateway;
   - CQRS/event sourcing;
   - service mesh?
4. Should `pattern-selection-matrix.md` become part of mandatory architecture
   session bootstrap, similar to the Coding Pack?
5. Should a wiki link lint/compile run be scheduled after these knowledge
   updates?

## Suggested reading before discussion

Read in this order:

1. `wiki/knowledge/architecture-patterns/README.md`
2. `wiki/knowledge/architecture-patterns/pattern-selection-matrix.md`
3. `wiki/knowledge/architecture-patterns/zero-trust-security.md`
4. `wiki/knowledge/project-docs/architecture_skill.md`
5. `wiki/knowledge/coding/implementation-quality-matrix.md`
6. `wiki/knowledge/coding/security-baseline.md`

## Status

Status: complete for 2026-06-24 knowledge update.

Next discussion date: 2026-06-25.
