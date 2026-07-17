# Validation - Bounded Change Fast Path

- Date: 2026-07-11
- Task: LLMWIKI-083
- Decision: `wiki/decisions/DEC-0005-bounded-change-fast-path.md`
- Workflow used: Real Repo Work design -> Session Closeout
- Actual deviations: none

## Outcome

Implemented one shared Bounded Change Fast Path inside Real Repo Work and a
thin repo profile template. The shared rule owns entry, targeted-read,
escalation, evidence, and measurement invariants. Repo profiles own exact maps,
commands, warnings, forbidden targets, local triggers, and acceptance owners.

No Tiny UI/API/Data workflows or human-menu rows were added.

## Mathematical trade-off

- Baseline: domain-specific rules duplicated per repo grow approximately as
  `R × D` for `R` repos and `D` domains.
- Selected model: one shared invariant plus repo/domain projections grows
  approximately as `R + D` and reduces drift surfaces.
- Constraint: local profiles may tighten but cannot weaken shared safety and
  evidence rules.
- Revision trigger: repeated tasks show missed context, rework, scope drift, or
  maintenance cost greater than the measured resource benefit.

## Checks

- Catalog workflow count remains 11; no new menu item.
- Shared entry predicate and mandatory escalation triggers: present.
- Repo profile scaffold: present and linked from repo-rules template.
- Task/report fields cover execution mode, escalation, large reads, and
  direct/indirect/repo-local knowledge.
- Feedback-loop lint: passed with 0 failures and 0 warnings; 523 wikilinks and
  545 Markdown links checked.

## Next empirical step

UniversityWeb-U17 rollout completed at
`/home/admindebian/UniversityWeb-U17/docs/bounded_change_profile.md`, with repo
evidence at
`/home/admindebian/UniversityWeb-U17/reports/validation/2026-07-11-u17-bounded-change-profile.md`.
Compare three to five similar small tasks using
outcome acceptance, first-edit time, reads, rework, scope violations,
validation strength, and report cost.
