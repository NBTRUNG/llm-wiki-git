# Validation - Codebase navigation and derived-index management

- Date: 2026-07-11
- Scope: current-source research and reusable codebase-management guidance
- Workflow used: Knowledge Refresh + Architecture Skill
- Actual deviations: none

## Outcome

Promoted a tool-neutral guide that separates authoritative code, stable semantic
maps, disposable derived indexes, and per-session working context. It prevents
ordinary small internal edits from triggering broad map maintenance and places
line offsets behind stable symbols/selectors/comments as revision-qualified
hints.

No U17 repo file, code-map schema, generator, parser, Agent Platform gateway,
or shared indexing service was changed or created.

## Source and ownership checks

- External/current sources: official Google, Meta, Microsoft, GitHub, and
  Backstage material.
- Complete consulted-source record: Agent Platform research namespace.
- Project evidence: accepted U17 tiny UI task and current code/UI-map drift.
- Raw/source log owner: Agent Platform.
- Curated reusable guidance owner: LLM-Wiki.
- Real-repo implementation state remains in U17.

## Guidance checks

- Semantic-map update and no-update predicates: present.
- Source-derived index classified as rebuildable, noncanonical: present.
- Human cognitive memory treated as local/stale-able cache: present.
- Manual-map versus automation ladder and ROI gate: present.
- Read/write amplification has explicit units/guardrails: present.
- Security/access/freshness/operational costs for shared indexes: present.
- Big Tech architecture not prescribed to small repos: present.
- Multi-task empirical evaluation fields: present.

## Decision

Use stable semantic maps plus existing symbol/text navigation first. Treat line
spans as optional derived hints. Consider specialized incremental indexing only
after repeated measured friction shows the smaller approach is insufficient.

## Residual uncertainty and revision trigger

The sources demonstrate scalable indexing patterns, not U17-specific ROI. Test
3-5 comparable tiny U17 tasks before revising its code-map schema. Revisit this
guide after repeated stale-map misses, measurable navigation delay, a real
derived-index pilot, or a material repository/language/tooling change.
