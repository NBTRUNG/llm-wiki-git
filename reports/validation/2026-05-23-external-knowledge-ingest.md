# Validation report — external knowledge ingest + Karpathy skill format + multi-agent infrastructure

Date: 2026-05-23
Scope: LLM-Wiki knowledge layer expansion
Task: LLMWIKI-023

## context

User selected scope: Heavy ingest of architecture + security knowledge from web
research, Light touch + YAML frontmatter for Karpathy skill format adoption,
and codification of multi-agent task assignment patterns observed in the
UniversityWeb project.

User's principle: LLM-Wiki is a knowledge vault first. Orphan knowledge from
external ingest is acceptable temporarily; it will be refined via file-back
when projects use it. All ingested files carry `confidence: medium` and
`applicable_contexts: pending first project use` until validated by real use.

## source-of-truth files added/updated

### Karpathy skill format

| File | Change |
|---|---|
| `wiki/knowledge/coding/karpathy-guidelines.md` | **Created.** 4-principle summary with YAML frontmatter. Cites raw/andrej-karpathy-skills-main/. |
| `wiki/knowledge/coding/code-quality.md` | Added YAML frontmatter (no content change). |
| `wiki/knowledge/coding/security-baseline.md` | Added YAML frontmatter + OWASP Top 10 2025 cross-reference table. |
| `wiki/knowledge/coding/testing-strategy.md` | Added YAML frontmatter (no content change). |
| `wiki/knowledge/coding/repo-code-rules.md` | Added YAML frontmatter (no content change). |
| `wiki/knowledge/project-docs/definition_of_done.md` | Added YAML frontmatter (no content change). |
| `wiki/knowledge/project-docs/review_checklist.md` | Added YAML frontmatter (no content change). |
| `wiki/knowledge/project-docs/knowledge_lookup_metric.md` | Added YAML frontmatter (no content change). |

### Multi-agent coordination infrastructure

| File | Change |
|---|---|
| `wiki/knowledge/project-docs/multi-agent-coordination.md` | **Created.** Codifies 7 patterns from UniversityWeb: three-tier task board, role boundary card, phase-based parallel execution, disjoint write-target rule, conflict resolution protocol, reduced read order for delegated agents, daily work log. |
| `templates/agent_role_card.template.md` | **Created.** Skeleton for per-agent `AGENT.md`. |
| `templates/daily_work_log.template.md` | **Created.** Skeleton for `reports/daily/YYYY-MM-DD.md`. |
| `wiki/knowledge/project-docs/agent_local_work.md` | Updated: added role card to canonical files list, reduced default read order (no `AI_CODEX.md` by default), added anti-pattern for overlapping write targets. |

### Architecture knowledge layer

New folder `wiki/concepts/architecture/`:

| File | Topic |
|---|---|
| `README.md` | Hub |
| `c4-model.md` | 4 levels (Context, Container, Component, Code); when to use each |
| `arc42.md` | 12-section template; all sections optional |
| `quality-attributes.md` | Security, performance, reliability, observability, deployability, scalability, maintainability — scenario format |
| `adr.md` | Nygard format, MADR variant, Y-statements; one decision per file |

New folder `wiki/knowledge/architecture-patterns/`:

| File | Topic |
|---|---|
| `README.md` | When-to-use decision table |
| `layered.md` | N-tier; small teams, CRUD apps |
| `hexagonal.md` | Ports and adapters; complex domain, infra changes likely |
| `microservices.md` | Bounded contexts first; distributed monolith anti-pattern |
| `event-driven.md` | Async, eventual consistency, sagas + compensating transactions |

Updates:

- `wiki/knowledge/project-docs/architecture.md` — added cross-refs to C4, arc42, quality attributes, ADR, patterns library.
- `templates/architecture.template.md` — restructured to include C4-level context, quality attribute scenarios, pattern slot, risks/technical debt section, ADR references.

### Security knowledge layer

New folder `wiki/concepts/security/`:

| File | Topic |
|---|---|
| `README.md` | Hub; how to use STRIDE + OWASP + DiD + ZT together |
| `owasp-top-10.md` | 2025 edition (8th); new categories A03 Software Supply Chain, A10 Mishandling Exceptional Conditions; cross-ref to `security-baseline.md` sections |
| `stride.md` | 6 categories, DFD-based application, STRIDE per element variant |
| `defense-in-depth.md` | Layered controls across technology + process + people |
| `zero-trust.md` | NIST SP 800-207; never trust always verify; PDP/PEP architecture |

Updates:

- `wiki/knowledge/coding/security-baseline.md` — added OWASP Top 10 2025 mapping table at top + references to STRIDE, DiD, ZT concept files.

### Index and discoverability

- `index.md` — added subdir catalog entries: architecture concepts, security concepts, architecture patterns.
- `wiki/concepts/README.md` — added architecture/ and security/ to concept maps list.
- `wiki/knowledge/coding/README.md` — added karpathy-guidelines.md as first entry.
- `wiki/knowledge/project-docs/README.md` — added multi-agent-coordination row.
- `templates/README.md` — added agent_role_card.template.md and daily_work_log.template.md.

## research sources (cited in each file)

- **OWASP Top 10 2025** — https://owasp.org/Top10/2025/
- **C4 model** — https://c4model.com
- **arc42** — https://arc42.org/overview
- **STRIDE** — https://en.wikipedia.org/wiki/STRIDE_model + https://owasp.org/www-community/Threat_Modeling_Process
- **Defense in Depth** — Palo Alto Networks + NIST presentations
- **Zero Trust** — NIST SP 800-207, https://csrc.nist.gov/publications/detail/sp/800-207/final
- **Architecture patterns** — multiple practitioner sources, see each pattern file
- **ADR** — https://adr.github.io and MADR
- **Karpathy guidelines** — local raw at `raw/andrej-karpathy-skills-main/`, original X post https://x.com/karpathy/status/2015883857489522876
- **Multi-agent patterns** — observed in `/home/admindebian/UniversityWeb/`

## discipline applied to all new ingested files

Each new file carries YAML frontmatter with:

```yaml
name: <slug>
description: <when to use>
source_type: external-research
source_urls: [...]
date_ingested: 2026-05-23
confidence: medium  (or high for highly stable references like OWASP Top 10)
applicable_contexts: pending first project use
status: active
```

Plus a `## sources` section at end with citations.

When first project consumes a file: update `confidence`, replace pending
applicable_contexts with real ones, optionally add a row in
`wiki/decisions/_index.md` if a project decision derived from the file.

## checks

```
grep -l "^name:" wiki/knowledge/coding/*.md         → 5 (karpathy + 4 existing skills)
grep -l "^name:" wiki/knowledge/project-docs/*.md   → ≥4 skill-like files
grep -l "^name:" wiki/concepts/architecture/*.md    → 4 (excluding README)
grep -l "^name:" wiki/concepts/security/*.md        → 4 (excluding README)
grep -l "^name:" wiki/knowledge/architecture-patterns/*.md → 5 (incl README)
ls wiki/concepts/architecture/                       → README + 4 concepts
ls wiki/concepts/security/                           → README + 4 concepts
ls wiki/knowledge/architecture-patterns/             → README + 4 patterns
```

## result

LLMWIKI-023 implemented locally. LLM-Wiki now has:

- 4 architecture concept files + 4 architecture pattern files (Track A).
- 4 security concept files (Track B).
- Canonical Karpathy guidelines + YAML frontmatter on 7 existing skill-like files (Track C).
- Multi-agent coordination master guide + 2 new templates + agent_local_work update (Track D).
- Cross-references from existing knowledge guides to new concepts (A3, B2).
- Index and subdirectory README updates for discoverability (Track E).

## gaps

- All new external-research files carry `applicable_contexts: pending first project use`. They are unproven until a real project consumes them.
- The 4-stage cycle's file-back (stage 4) is now operationally enabled (rubric + template + index exist) but not yet exercised by any project. First project to file lessons back will be the validation event for the file-back loop.
- Obsidian rendering of YAML frontmatter not tested in this session; user to verify rendering preference (frontmatter blocks vs collapsed metadata).
- No automated lint script to verify frontmatter conformance across files; relies on grep checks.

## residual risk

- External knowledge may go stale faster than `wiki/knowledge/project-docs/` content. Recommend reviewing `wiki/concepts/security/owasp-top-10.md` annually after each OWASP release.
- The multi-agent coordination guide was observed-pattern + extended; if the UniversityWeb project evolves its patterns, this file may drift.

## decision

Accept LLMWIKI-023 as implemented. Constitution §19 records this as the 15th
amendment-class change.
