# Security concepts

Reusable concepts for application security and threat modeling.

## index

- [[owasp-top-10.md]] — OWASP Top 10 2025 web application security risks
- [[stride.md]] — Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege threat model
- [[defense-in-depth.md]] — Layered overlapping security controls
- [[zero-trust.md]] — Never trust, always verify — NIST SP 800-207

## relationship to LLM-Wiki

- Practical baseline rules: [[../../knowledge/coding/security-baseline.md]]
- Security in architecture quality attributes: [[../architecture/quality-attributes.md]]
- Architecture decisions about security: [[../architecture/adr.md]]

## use together

A typical security workflow uses all four concepts:

1. **STRIDE** to enumerate threats during design (per data-flow component).
2. **OWASP Top 10** to cross-check that the most common web risks are
   covered by code-level controls.
3. **Defense in depth** to ensure no single failure compromises everything.
4. **Zero trust** to govern access at each layer.

These concepts are external research — see each file's frontmatter for sources
and confidence. They will be refined when first project consumes them.
