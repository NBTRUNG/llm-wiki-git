---
name: efficacy_evaluation
description: A/B decision framework for LWOE measurement. Applies absolute-floor + ≥30% relative-improvement rule to the 11 metrics defined in efficacy_metrics.md and produces a per-metric PASS/MIXED/FAIL verdict plus overall headline. Project-agnostic.
source_type: file-back
source_project: llm-wiki (governance)
date_ingested: 2026-05-24
date_updated: 2026-05-24
confidence: medium
confidence_reviewed: 2026-05-24
applicable_contexts:
  - any project with a pre-period and post-period bracketing an LLM-Wiki pattern adoption
  - retrospective audits comparing two implementation approaches on the same project
  - sanity-check at the end of a major architectural change to detect regressions
status: active
---

# LWOE — evaluation framework

The decision rule, dashboard layout, and edge-case handling for the 11 metrics defined in [[efficacy_metrics.md]].

## purpose

`efficacy_metrics.md` owns what to measure. This file owns how to interpret the measurements — specifically:

- when an LWOE cycle is appropriate to open;
- what inputs a cycle needs;
- the formal decision rule for per-metric PASS / MIXED / FAIL;
- the dashboard layout that consumes this file plus [[../../projects/llm-wiki/docs/efficacy_dashboard.md]];
- edge cases (small samples, `needs-review` data, threshold-refinement re-runs).

## when to run

Open an LWOE evaluation cycle when ALL of the following are true:

- a project has adopted (or is in the process of adopting) at least one LLM-Wiki pattern with a measurable goal (Token Economy, multi-agent coordination, ACID task packets, etc.);
- the project has at least one **pre-period** worth of historical sessions where the pattern was not yet in effect;
- the project has at least one **post-period** session where the pattern is in effect;
- a baseline audit report exists (per T3 of LLMWIKI-025; first instance at `reports/validation/2026-05-24-lwoe-baseline-universityweb.md`).

Do NOT open a cycle when:

- the pre and post periods cover the same calendar day (insufficient separation);
- the post-period has fewer than 3 tasks (small-sample disclaimer applies — see §edge-cases);
- the patterns being evaluated have not been declared accepted in `wiki/decisions/_index.md` or the project's `docs/decisions.md`.

## inputs needed

A complete cycle requires three artifacts:

1. **One T1 file** — `[[efficacy_metrics.md]]` with current threshold values (including any T5 refinements).
2. **One T3 baseline report** — pre- and post-period measurements per [[../../../templates/lwoe_session_measurement.template.md]] field shape, with `needs-review` markers where data is unavailable.
3. **The project's cutoff event** — typically an ADR or accepted decision; the date and source must be quoted in the baseline.

Missing any of these = the cycle is not ready to evaluate; resolve before computing verdicts.

## decision rule

Per metric, compute the verdict using both an absolute-floor check and a relative-improvement check.

### improvement direction reference

From [[efficacy_metrics.md]] per-metric subsections:

| Direction | Metrics |
|---|---|
| lower-better | 1a, 1b, 2c, 3a, 3b, 3c, 4a, 6b |
| target-band | 2a (≤2 avg), 5a (15-50%), 5c (≥80% in sweet spot) |

### formal rule

**For lower-better metrics:**

```
PASS  iff  (post ≤ absolute_floor)  AND  ((pre − post) / pre ≥ 0.30)
MIXED iff  exactly one of (post ≤ absolute_floor)  or  ((pre − post) / pre ≥ 0.30) holds
FAIL  iff  neither holds
```

Both clauses must hold for PASS. The relative-improvement clause uses `(pre − post) / pre`; if `pre = 0`, treat as `n/a — already at floor` and PASS iff `post = 0`, otherwise FAIL.

**For target-band metrics:**

```
PASS  iff  (post falls inside the band)  AND  (post is closer to band centre than pre, OR pre was already inside)
MIXED iff  post is inside band but moved away from centre, OR post is outside band but moved closer to it
FAIL  iff  post is outside band and moved away from centre, OR pre was inside and post is now outside
```

"Closer to band centre" is interpreted directionally; for 2a (target ≤2) closer = lower; for 5a (target 15-50%) closer = nearer 32.5%; for 5c (target ≥80% in 4-7) closer = higher %.

### tolerance for `needs-review`

If post is `needs-review` (data missing for that metric in the post-period): verdict is `NO-DATA`. Pre `needs-review` with post measured: report only the post value with a `no-baseline` annotation. Do not invent a `pre` from anchor projects or strawman thresholds — that would defeat the per-project improvement rule.

### overall verdict per group

Group verdict (Token economy, Time/iteration, Quality, Multi-agent, Knowledge lookup, User experience) is the worst single-metric verdict in the group, with FAIL > MIXED > NO-DATA > PASS for ordering. Rationale: a group with one FAIL must not be marked PASS.

### overall verdict per project

Project verdict is the worst single-group verdict. A project marked PASS overall means **every** measured group passed; a single MIXED in any group pulls the overall to MIXED. No composite score is computed (explicitly disallowed per [[../../projects/llm-wiki/docs/tasks.md]] §LLMWIKI-025).

## dashboard layout spec

The dashboard consumes this rule and produces a single 11-row table per project. Column list (in order, left to right):

| Column | Source | Notes |
|---|---|---|
| Metric code | T1 (`efficacy_metrics.md` metric reference table) | 1a, 1b, 2a, 2c, 3a, 3b, 3c, 4a, 5a, 5c, 6b |
| Group | T1 | Token economy / Time-iteration / Quality / Multi-agent / Knowledge lookup / User experience |
| Pre value | T3 baseline | Number or `needs-review` |
| Post value | T3 baseline | Number or `needs-review` |
| Absolute target | T1 (post-T5 refined) | The floor or target-band |
| Delta % | computed | `(pre − post) / pre × 100`; signed; n/a if either is `needs-review` |
| Verdict | this file's rule | PASS / MIXED / FAIL / NO-DATA |
| Notes | dashboard editor | Small-sample caveats, interpretation notes, link to T3 cell |

Below the table, the dashboard renders:

- a per-group headline row (6 rows: one per group; each with its rolled-up verdict);
- an overall headline (1 line: PASS / MIXED / FAIL across the project);
- a "needs more data" callout listing all metrics with `NO-DATA` verdict;
- a "next measurement" pointer naming the next cycle.

No composite score, no weighted aggregation, no radar chart. The 11-row table is the source of truth; if a comparison across projects is later wanted, the dashboard can repeat the 11-row table per project rather than collapsing.

## edge cases

### small post-period sample

If the post-period contains fewer than 3 tasks (per-task metrics) or fewer than 2 sessions (per-session metrics): mark the cycle "small-sample" in the dashboard headline; verdicts are computed but flagged as provisional. Trigger a re-measurement when the post-period accumulates more data.

The first UniversityWeb cycle (baseline at `reports/validation/2026-05-24-lwoe-baseline-universityweb.md`) is a small-sample cycle by this definition (3 post-cutoff tasks). T6 dashboard records that explicitly.

### `needs-review` values

A `needs-review` in post = `NO-DATA` verdict. Do NOT downgrade to FAIL — absence of evidence is not evidence of failure. Document why in the Notes column (instrumentation gap, missing template adoption, etc.) and route the fix into the next cycle.

A `needs-review` in pre AND a measured post = report the post value with `no-baseline` annotation; verdict is `NO-DATA` because relative-improvement cannot be computed. Track the unbaselined post value as the new baseline for the NEXT cycle.

### threshold-refinement re-runs

When T5 refines a threshold based on T3 reality (per [[../../projects/llm-wiki/docs/tasks.md]] §LLMWIKI-025 T5), re-run the decision rule against the same T3 data using the new thresholds. Do not re-collect data. Annotate the dashboard "threshold-refined re-run YYYY-MM-DD" and store the prior verdict in a footnote for audit.

### projected vs measured post values

Some metrics (notably 1a in the UniversityWeb baseline) may have a *projected* post value — a design target for the post-period without a fresh measured session yet. Mark such cells `(projected)` in the Post column. Verdict applies the rule but is flagged "projected"; first real measurement supersedes.

### parallel improvements

If multiple LLM-Wiki patterns land in the same cutoff event (e.g., ADR-0023 bundles Token Economy + AI-agnostic Lead + Lead handoff), the cycle measures the combined effect, not each pattern individually. Per-pattern attribution requires either staggered adoption or a controlled A/B which LWOE does not enforce.

### regression after pattern adoption

If a metric *worsens* post vs pre (delta % < 0 for lower-better, or band-distance increases for target-band): verdict is FAIL regardless of absolute-floor result. A pattern that made a metric worse is a clear regression and must be triaged via [[../../../harness/feedback-loop.md]] as a `contradiction` class.

## reporting cadence

A cycle is opened by intent, not on a calendar. Suggested triggers:

- **Pattern-adoption cycle:** every accepted ADR that affects how agents operate (Token Economy, multi-agent layout, contract format, etc.).
- **Quarterly sanity:** even if no pattern landed, a quarterly per-project cycle catches drift; cheap because the T2 template is already collected per session.
- **Post-incident:** after a serious quality incident (boundary violation, conflict cascade, build break across a release), open a cycle to confirm the post-fix metrics regressed-then-recovered.

Do NOT open a cycle:

- after every routine task (the T2 template is per-session, the cycle is per-cutoff);
- when there is nothing to compare (no pre-period);
- as a substitute for a feedback-loop session ([[../../../harness/feedback-loop.md]]) — they serve different goals and run in parallel.

## relationship to other files

- [[efficacy_metrics.md]] — what to measure (formulas, units, collection rules).
- [[../../../templates/lwoe_session_measurement.template.md]] — per-session collection form.
- [[../../projects/llm-wiki/docs/efficacy_dashboard.md]] — applied per-project dashboard using this framework.
- [[../../../harness/feedback-loop.md]] — when an LWOE cycle surfaces a regression or anti-pattern, file it through the feedback loop. The two are complementary, not redundant.
- [[definition_of_done.md]] — task-level done criteria; LWOE measures across many tasks and does not replace per-task acceptance.
- [[validation_report.md]] — single-work-unit evidence record; LWOE cycles **consume** validation reports as inputs.

## sources

- LWOE scope locked 2026-05-23 evening; recorded in `wiki/projects/llm-wiki/docs/tasks.md` §LLMWIKI-025.
- First baseline `reports/validation/2026-05-24-lwoe-baseline-universityweb.md` exercised this framework's small-sample and `needs-review` edge cases.
- No composite-score rule, per LLMWIKI-025 explicit scope decision ("multi-axis dashboard, no composite score").
