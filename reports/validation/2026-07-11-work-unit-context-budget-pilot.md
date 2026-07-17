# Validation - Work-unit context budget and checkpoint pilot

- Date: 2026-07-11
- Task: LLMWIKI-084
- Decision: open a measured pilot; do not canonize `150k/300k`
- Workflow used: Session Start -> Change Impact Map -> Session Closeout
- Actual deviations: provider cumulative counters were unavailable to this
  session, so no token delta or threshold crossing was reconstructed

## Outcome

Implemented one canonical provider-aware guide for work-unit/session context
measurement and file-backed checkpoints. Added linked, opt-in projections to
session start/closeout and agent-result/LWOE measurement templates. No API,
runtime token enforcement, automatic close, or real-repo backfill was added.

Static implementation is complete. Empirical threshold validation remains
open and must not be reported as passed until the sample gate is met.

## Baseline analysis

Supplied baseline: input `771,121`, output `93,564`, total `864,685`, reasoning
`25,784`, cached `14,513,408` reported separately. The supplied total equals
input plus output. Reasoning and cached counters are not added because their
provider inclusion/cost semantics were not supplied.

The `150k` and `300k` candidates are about `17.3%` and `34.7%` of baseline
total. The baseline's work-unit count/mix is unknown, so these ratios establish
scale, not per-work-unit causality or universal limits.

## Measurement and safety checks

- Per-session and per-work-unit fields: separated.
- Input/output/total/reasoning/cached semantics: separated and provider-qualified.
- Direct input: separately recorded only when provider-defined; never inferred
  by subtracting cached input.
- Work-unit deltas: require like-for-like counter snapshots; missing is `not available`.
- Tool reads: measured in actual lines/bytes/chars, not mislabeled as tokens.
- First-edit, iterations/rework, accepted outcome, validation, and work-unit
  count: present.
- `150k`: warning/checkpoint before another work unit, not forced close.
- `300k`: fresh-session recommendation at a safe boundary, not enforcement.
- Incident/high-risk exception: evidence/recovery checkpoint before restart.
- Narrower user/repo/incident/bug-fix checkpoints: retain precedence.
- Promotion gate: at least 5 sessions, 10 work units/2 task types, one natural
  `150k` crossing; `300k` evaluated only after a natural crossing.

## Impact review

Classifications:

- Canonical: `wiki/knowledge/project-docs/work_unit_context_budget.md`.
- Workflow projections: session start and closeout cards.
- Measurement projections: agent result and LWOE session templates.
- Conditional route: agent session packs.
- Evidence/state: task ledger, test matrix, projection registry, current
  direction, project status, TICK, active focus, feedback-loop queue, this report.

Inspected and unchanged: workflow catalog/README (no workflow identity or menu
change), `harness/read-workflow.md` (no read-order change), and workflow-contract
experiment (it contracts Real Repo Work/Bug Fix only). No real-repo projection
was changed.

## Trade-off and revision trigger

The pilot exchanges checkpoint/report time for recoverability and lower
conversation-memory dependence. It does not dominate the status quo on report
cost. Accepted outcome, validation strength, safe continuity, and recovery are
hard guardrails; token reduction cannot compensate for regression.

Revise immediately after lost state, outcome/validation regression, unsafe
interruption, repeated reconstruction, or disproportionate report cost. Also
review on provider accounting/model/tool changes. Otherwise review only at the
sample gate above.

## Validation status

- Static semantics/guardrails: pass.
- Workflow/template projection consistency: pass.
- Duplicate source-of-truth check: pass; templates link to the canonical guide.
- Provider-counter measurement in this session: needs-review; counters unavailable.
- Multi-session threshold efficacy: needs-review; sample gate not met.
- Runtime/API enforcement: n/a; explicit non-goal.
- Real-repo rollout: n/a; not authorized or required.

## Next evidence

Use `templates/lwoe_session_measurement.template.md` and result-report fields in
natural measured sessions. Keep raw observations and update the pilot only
after its revision gate; do not reconstruct counters retrospectively or create
artificial threshold crossings.
