# LLM-Wiki efficacy dashboard

- **Last updated:** 2026-05-25 (cycle 2 refinement + instrumentation support links)
- **Scope:** projects measured under the LWOE framework. Currently: UniversityWeb only.
- **Methodology:** [[../../../knowledge/project-docs/efficacy_evaluation.md]] (decision rule); [[../../../knowledge/project-docs/efficacy_metrics.md]] (metric definitions).

## how to read this dashboard

Each project has one 11-row table covering the LWOE metrics (1a, 1b, 2a, 2c, 3a, 3b, 3c, 4a, 5a, 5c, 6b — see [[../../../knowledge/project-docs/efficacy_metrics.md#scope]]). Verdicts are PASS / MIXED / FAIL / NO-DATA computed mechanically from [[../../../knowledge/project-docs/efficacy_evaluation.md#decision-rule]]:

- **PASS** — both absolute-floor and ≥30% relative-improvement clauses hold (or target-band is met).
- **MIXED** — exactly one clause holds.
- **FAIL** — neither holds (or the metric regressed).
- **NO-DATA** — pre or post value is `needs-review`; verdict deferred to next cycle.

Group verdicts (Token economy / Time-iteration / Quality / Multi-agent / Knowledge lookup / User experience) are the worst single-metric verdict in the group (severity order: FAIL > MIXED > NO-DATA > PASS). Project headline is the worst group verdict. No composite score is computed.

`(projected)` next to a Post value means the value comes from design intent (post-cutoff infrastructure in place), not a measured post-cutoff session. The projected verdict is provisional; first measured session supersedes.

## UniversityWeb (cycle 1 — first measurement, small post-sample)

- **Cutoff:** 2026-05-23 (ADR-0023 acceptance).
- **Pre-period:** 2026-05-19 → 2026-05-22 (4 days, 25 tasks accepted).
- **Post-period:** 2026-05-23 (1 day, 3 tasks).
- **Baseline source:** [[../../../../reports/validation/2026-05-24-lwoe-baseline-universityweb.md]].
- **Small-sample disclaimer applies** per [[../../../knowledge/project-docs/efficacy_evaluation.md#small-post-period-sample]].

| Code | Group | Pre | Post | Absolute target | Δ % | Verdict | Notes |
|---|---|---|---|---|---|---|---|
| 1a | Token economy | 657 lines | ≤326 (projected) | ≤330 (Lead L1) | −50.4% | PASS (projected) | Post is design-target from ADR-0023; first measured live session supersedes. |
| 1b | Token economy | needs-review | needs-review | ≤800 typical / ≤1500 L5 | n/a | NO-DATA | Per-task line counts not instrumented in UW pre or post. T2 template (`lwoe_session_measurement.template.md`) collects this going forward. |
| 2a | Time / iteration | 1.0 avg | 1.0 avg | ≤2 avg | 0% | PASS | Disciplined packets pre-cutoff; UW-P3-002 provisional acceptance may revise post if Codex re-review rejects. |
| 2c | Time / iteration | needs-review | needs-review | ≤5 min L1 / ≤15 min L3 | n/a | NO-DATA | UW not under git; no timestamps in checkpoint logs. Either initialize git or add explicit time stamps in agent_status checkpoint. |
| 3a | Quality | 0 / 25 (0%) | 0 / 3 (0%) | 0 per session | 0% | PASS | Already at hard floor pre-cutoff; held post. |
| 3b | Quality | 4.0% (1/25) | 0% (0/3) | ≤20% | −100% (n/a small) | PASS (provisional) | Post sample too small for stable rate; pre value alone confirms pre-cutoff target met. |
| 3c | Quality | 0% (0/25) | 0% (0/3) | ≤5% | 0% | PASS | Build/test gates clean in both periods. |
| 4a | Multi-agent | 0% (0/25) | 0% (0/3) | ≤5% | 0% | PASS | Parallel work (UW-P3-002 + UW-P3-DESIGN-SYSTEM-001) had disjoint write targets; no conflicts. |
| 5a | Knowledge lookup | needs-review | needs-review | 15-50% band | n/a | NO-DATA | `Knowledge lookup` section not yet rolled out to UW result reports. Phase A landed infrastructure; instrumentation rollout pending. |
| 5c | Knowledge lookup | needs-review | needs-review | ≥80% in 4-7 bucket | n/a | NO-DATA | Same gap as 5a. |
| 6b | User experience | 0 / 25 (0%) | 0–1 / 3 (interpretation) | ≤10% | n/a | PASS (conservative) | UW-P3-002 had 5 deviations all justified+accepted with rationale; conservative reading = 0 creep. Recommend packet-language clarification for future tasks. |

### group headlines

- **Token economy:** NO-DATA — 1a PASS (projected) but 1b NO-DATA pulls the group to NO-DATA.
- **Time / iteration:** NO-DATA — 2a PASS but 2c NO-DATA pulls the group to NO-DATA.
- **Quality:** **PASS** — 3a, 3b, 3c all PASS.
- **Multi-agent:** **PASS** — 4a PASS.
- **Knowledge lookup:** NO-DATA — both 5a and 5c.
- **User experience:** PASS (conservative) — 6b PASS under conservative reading.

### overall verdict (UniversityWeb cycle 1)

**NO-DATA** overall. Worst group verdict is NO-DATA (Token economy, Time/iteration, Knowledge lookup all NO-DATA because instrumentation was not yet in place).

This is the **honest** outcome. The pattern adoption (ADR-0023) is well-formed and on-track; what we cannot yet say is "PASS" because 5 of 11 metrics lack data. First post-cutoff live measurement + Knowledge-lookup section rollout will move several NO-DATA cells to measured verdicts.

### caveats (carried from T3 baseline)

- **Small post-sample.** Post-period = 1 day, 3 tasks. Rates expressed as percentages are not statistically meaningful in the post column.
- **1a projected.** Post 1a is a design-target, not a measured live bootstrap. First Lead session opened post-cutoff supersedes.
- **5 metrics `needs-review`:** 1b, 2c, 5a, 5c (both periods), 6b (one interpretation). See [[../../../../reports/validation/2026-05-24-lwoe-baseline-universityweb.md#6-data-quality-notes]] for per-metric reasons.
- **6b interpretation.** UW-P3-002 deviations (skip-link, vanilla JS, etc.) are 0 under conservative reading, 1 under liberal reading. Recommend explicit scope-creep exception policy in future packet templates.

### next measurement (cycle 2)

When the next post-cutoff UniversityWeb Lead session runs:

1. Measure 1a live (will move "projected" → "measured").
2. Adopt the T2 template per session to populate 1b prospectively.
3. Add `Knowledge lookup` section to result reports — populates 5a and 5c.
4. Add packet-language for scope-creep exception policy — clarifies 6b interpretation.
5. Refresh this dashboard's UniversityWeb row with new pre vs (now-larger) post.

Target opening date for cycle 2: when UW-P3-003 (Razor implementation) or next ADR-driven cutoff event occurs.

## UniversityWeb (cycle 2 — measured 1a + populated 5a/5c, same calendar day)

- **Cutoff:** 2026-05-23 (ADR-0023 acceptance) — unchanged from cycle 1.
- **Pre-period:** 2026-05-19 → 2026-05-22 (4 days, 25 tasks accepted) — unchanged from cycle 1.
- **Post-period:** 2026-05-23 (same 3 tasks as cycle 1; instrumentation now partially available for the same set).
- **What changed vs cycle 1:** 1a moved from `projected` to `measured` against the post-cutoff file state; 5a/5c moved from `needs-review` to a populated single data point (UW-P3-002 result report adopted the Knowledge lookup section from [[../../../../templates/agent_result_report.template.md]]).
- **What did NOT change:** Pre-period values, post-period task count (still 3), 1b/2c instrumentation gap (still `needs-review`).
- **Source evidence:**
  - 1a (measured): direct `wc -l` of `AGENTS.md` (184) + `REPO_RULES.md` (83) + `AI_CODEX.md` (61) = 328 lines, in `/home/admindebian/UniversityWeb/` as of 2026-05-23 post-Phase-A state.
  - 5a + 5c: `/home/admindebian/UniversityWeb/reports/agent/antigravity/UW-P3-002-master-layout-result.md` §9 Knowledge lookup (consulted=yes, KLM score=3, finding applied: Karpathy "Simplicity First" used to justify D1 vanilla-over-Alpine).
- **Small-sample disclaimer still applies** per [[../../../knowledge/project-docs/efficacy_evaluation.md#small-post-period-sample]].

| Code | Group | Pre | Post | Absolute target | Δ % | Verdict | Notes |
|---|---|---|---|---|---|---|---|
| 1a | Token economy | 657 lines | 328 lines (measured) | ≤330 (Lead L1) | −50.1% | **PASS (measured)** | Promoted from `PASS (projected)`. Direct line-count of post-cutoff `AGENTS.md` + `REPO_RULES.md` + `AI_CODEX.md` matches the design target within rounding (projected ≤326 vs measured 328). First true post-cutoff session bootstrap will confirm an agent actually reads only these three files; design state is now confirmed in-place. |
| 1b | Token economy | needs-review | needs-review | ≤800 typical / ≤1500 L5 | n/a | NO-DATA | Unchanged. Per-task line counts still not instrumented in UW. T2 template adoption deferred to next session. |
| 2a | Time / iteration | 1.0 avg | 1.0 avg | ≤2 avg | 0% | PASS | Unchanged. UW-P3-002 still `provisional` pending Codex re-review. |
| 2c | Time / iteration | needs-review | needs-review | ≤5 min L1 / ≤15 min L3 | n/a | NO-DATA | Unchanged. UW repo not under git; no checkpoint timestamps. |
| 3a | Quality | 0 / 25 (0%) | 0 / 3 (0%) | 0 per session | 0% | PASS | Unchanged. |
| 3b | Quality | 4.0% (1/25) | 0% (0/3) | ≤20% | −100% (small n) | PASS (provisional) | Unchanged. |
| 3c | Quality | 0% (0/25) | 0% (0/3) | ≤5% | 0% | PASS | Unchanged. |
| 4a | Multi-agent | 0% (0/25) | 0% (0/3) | ≤5% | 0% | PASS | Unchanged. |
| 5a | Knowledge lookup | needs-review | 33.3% (1/3) — `no-baseline` | 15-50% band | n/a (no pre) | NO-DATA (no-baseline) | Promoted from `needs-review` to a measured-but-no-baseline post value. Inside the target band; verdict stays NO-DATA per [[../../../knowledge/project-docs/efficacy_evaluation.md#tolerance-for-needs-review]] because relative-improvement against `needs-review` pre cannot be computed. Acts as the new baseline for cycle 3. |
| 5c | Knowledge lookup | needs-review | 0 / 1 in 4-7 (1/1 in bucket 3) — `no-baseline` | ≥80% in 4-7 bucket | n/a (no pre) | NO-DATA (no-baseline) | Single consult at score 3 (edge case bucket, just below sweet spot). Sample size = 1; do not treat 0% as a real failure rate. Reported as raw count per [[../../../knowledge/project-docs/efficacy_metrics.md#5c-klm-score-distribution]] small-sample rule. |
| 6b | User experience | 0 / 25 (0%) | 0–1 / 3 (interpretation) | ≤10% | n/a | PASS (conservative) | Unchanged. |

### group headlines (cycle 2)

- **Token economy:** NO-DATA — 1a now PASS (measured), but 1b still NO-DATA pulls the group down.
- **Time / iteration:** NO-DATA — 2a PASS, 2c NO-DATA pulls the group down.
- **Quality:** **PASS** — 3a, 3b, 3c all PASS.
- **Multi-agent:** **PASS** — 4a PASS.
- **Knowledge lookup:** NO-DATA — 5a and 5c are now measured but lack a baseline; verdict stays NO-DATA. **This is a real promotion from cycle 1** (was needs-review both periods) — first measurement-against-target visible.
- **User experience:** PASS (conservative) — 6b PASS under conservative reading.

### overall verdict (UniversityWeb cycle 2)

**NO-DATA** overall (unchanged from cycle 1). The worst group is still Token economy / Time-iteration / Knowledge lookup at NO-DATA. The improvement vs cycle 1 is internal to the cells: 1a `projected` → `measured`; 5a/5c `needs-review` → measured-with-no-baseline. The overall verdict cannot move to PASS until 1b and 2c instrumentation lands (≥1 more cycle).

### regression check (cycle 2)

Per [[../../../knowledge/project-docs/efficacy_evaluation.md#regression-after-pattern-adoption]]: a metric that worsens post vs pre triggers a `contradiction` class entry into [[../../../../harness/feedback-loop.md]]. None of the 11 metrics regressed at cycle 2:

- 1a: 657 → 328 (improvement).
- 2a: 1.0 → 1.0 (flat).
- 3a/3b/3c/4a: flat or improving (small post sample).
- 5a/5c: no pre baseline, so no regression definable.
- 6b: 0 → 0-1 (conservative reading: flat).

**No `contradiction` to file.** Backpropagation loop not triggered by metric regression at this cycle.

### new patterns surfaced (cycle 2)

Two candidates appeared in the post-cutoff reports:

1. **Razor `<partial>` tag-helper silent failure** (from `/home/admindebian/UniversityWeb/reports/agent/antigravity/UW-P3-002-master-layout-result.md` §4): `dotnet build` and `dotnet test` do not catch unregistered tag helpers; browser smoke is the only check. The UW report itself flagged this as a candidate for `wiki/knowledge/coding/` but explicitly deferred filing pending generalization (Gate 2 of [[../../../../harness/feedback-loop.md#evidence-gate]]). **Decision at this cycle: defer.** The lesson stays in the UW project report. Re-evaluate when a second ASP.NET Core MVC / Razor project adopts LLM-Wiki and either confirms or invalidates the pattern. No new file in `wiki/knowledge/` this cycle.

2. **Template-rollout is per-task, not per-cutoff** (observation from the cycle 2 data itself): even after the agent_result_report template introduced the Knowledge lookup section, only 1 of the 3 post-cutoff tasks adopted it. Tasks in flight at cutoff continue with the older format. This is a workflow observation, not a knowledge-domain lesson; the right place to capture it is forward instrumentation discipline (T2 template per session) rather than a new `wiki/knowledge/` file. **Decision at this cycle: capture as a forward-action in §next measurement below, do not file as a class lesson.**

**Net feedback-loop activity at cycle 2:** zero new files in `wiki/knowledge/`, zero entries into [[../../../../harness/feedback-loop.md]] (no `contradiction`, no `anti-pattern`, no `lesson` meeting the generalization gate). Honest reading: cycle 2 confirms the cycle 1 design without surfacing new generalizable patterns.

### caveats (cycle 2)

- **Same calendar day as cycle 1.** Per [[../../../knowledge/project-docs/efficacy_evaluation.md#when-to-run]], "Do NOT open a cycle when the pre and post periods cover the same calendar day." Cycle 2 is an in-place refinement of cycle 1's data points (1a `projected` → `measured`, 5a/5c `needs-review` → populated), not a fresh pre/post comparison. A true cycle 3 requires post-period extension to a different calendar day with ≥3 fresh tasks.
- **Single KLM data point.** 5c's "0% in sweet spot" is a 1/1 sample; do not interpret as policy failure. Score 3 (edge case) is a defensible consult given the task touched Karpathy "Simplicity First" — borderline but not wasted.
- **Live bootstrap measurement still pending.** The 328-line figure is the file state, not what an AI actually read this session. First fresh post-cutoff Lead session that records its reads against the L1 cheatsheet is the true measured 1a confirmation.

### next measurement (cycle 3)

When the next post-cutoff UniversityWeb session opens on a different calendar day:

1. Capture a live bootstrap-line count in the Lead's result report (confirms 1a 328 with a session, not file state).
2. Use the result-report `Measurement fields` section plus the T2 template per session to populate 1b and 2c prospectively (target ≤800 typical-task for 1b).
3. Ensure every result report includes the Knowledge lookup section (5a/5c sample size > 1).
4. Use the packet `Scope-creep exception policy` field when scope deviations are pre-authorized (clarifies 6b interpretation).
5. If UW repo gets `git init` before then: 2c becomes measurable from commit timestamps.

Target opening date for cycle 3: first post-cutoff UW Lead session on a calendar day later than 2026-05-23, OR after UW-P3-003 (Razor cards/badges) lands.

## other projects

No other projects under LWOE measurement yet. As patterns from LLM-Wiki get adopted in additional projects (pdf_tool, future projects in `wiki/projects/`), each will get a row + small table in this file.

## changelog

| Date | Change | Source |
|---|---|---|
| 2026-05-25 | Added instrumentation-support pointer: next cycle should use result-report Measurement fields plus T2 session template for 1b/2c instead of retrospective reconstruction. | `reports/validation/2026-05-25-feedback-loop-operational-optimization.md` |
| 2026-05-24 | Initial dashboard; UniversityWeb cycle 1 first measurement (small sample, partial data) | LLMWIKI-025 T1-T6 |
| 2026-05-23 | UniversityWeb cycle 2 refinement: 1a `projected` → `measured` (328 lines); 5a `needs-review` → 33.3% (1/3, in band, no-baseline); 5c `needs-review` → 0/1 in sweet spot (no-baseline). No regressions; no new `wiki/knowledge/` files filed (Razor `<partial>` tag-helper finding deferred per generalization gate). | UW post-cutoff reports 2026-05-23 (UW-P3-002 result §9, file state of bootstrap files) |
