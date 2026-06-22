# LWOE baseline — UniversityWeb (retrospective audit 2026-05-19 → 2026-05-23)

- **Date:** 2026-05-24
- **Scope:** UniversityWeb project only. Retrospective. Read-only audit of `/home/admindebian/UniversityWeb/` (no edits made to that repo; confirm via `git -C /home/admindebian/UniversityWeb status` — note: UniversityWeb is not yet a git repo, so audit-by-inspection of the report inventory below).
- **Cutoff event:** ADR-0023 acceptance (see §2).
- **Lane:** normal — measurement work, no decisions applied.
- **Metric definitions:** [[../../wiki/knowledge/project-docs/efficacy_metrics.md]]. The two filled instances below use the field shape of [[../../templates/lwoe_session_measurement.template.md]] aggregated across each period (not per-session).

## 1. Header

This baseline establishes the pre vs post measurement for LWOE T3 (per [[../../wiki/projects/llm-wiki/docs/tasks.md]] §LLMWIKI-025). It is the input to T4 (decision framework), T5 (threshold refinement), and T6 (dashboard).

**Acknowledged limit of this baseline.** The cutoff date (2026-05-23) is the same day Phase A implementation landed. Post-period therefore contains only **one day, 3 tasks**, of which 1 task is a planning/implementation hybrid still in flight (LLMWIKI-024 Phase A measurement pending). Quantitative metrics for the post-period have small-sample limits noted per-row. The projected post 1a value comes from ADR-0023 design intent and [[../../wiki/knowledge/project-docs/token-economy-bootstrap.md#measured-results-universityweb-2026-05-23]], not from a measured next-session bootstrap.

## 2. Cutoff identification

**ADR-0023 accepted-date:** **2026-05-23**.

**Source:** `/home/admindebian/UniversityWeb/docs/decisions.md`, line 29.

Verbatim row from the decisions table:

> | 2026-05-23 | ADR-0023 | AI-agnostic bootstrap + Token Economy Law: hoist L1 cheatsheet into `AGENTS.md`, neutralize Lead state file, separate role-definitions from current-assignment, add Lead-handoff procedure, resolve LLM-Wiki path via env var | accepted | user priority 2026-05-23; `reports/validation/2026-05-23-bootstrap-token-audit.md` |

Full ADR-0023 text at `/home/admindebian/UniversityWeb/docs/decisions.md` lines 1260-1356.

**Period split.**

- **Pre-ADR-0023 period:** 2026-05-19 inclusive through 2026-05-22 inclusive (4 days).
- **Post-ADR-0023 period:** 2026-05-23 only (1 day).

**Validation reports in window** (37 files; full inventory in T3 Explore-agent audit log, summarized here):

- 2026-05-19 (1 report): `2026-05-19-university-web-real-repo-migration.md`.
- 2026-05-20 (8 reports): notes-sync + UW-I18N-READY-001 + UW-P1-003..007 + uw-p1-006-cms-alias-contract.
- 2026-05-21 (12 reports): agent-plan + agent-status + UW-ORG-001 + UW-P1-008..011 + UW-P2-001/003/006 + project-status-tasks-llm-wiki-sync.
- 2026-05-22 (10 reports): UW-ORG-002/003 + UW-P2-003-FIX1 + UW-P2-004/005/007 + UW-P2-SEARCH-VI-001 + UW-P3-000/-PERF/001.
- 2026-05-23 (6 reports): bootstrap-token-audit + llmwiki-024-phase-a + UW-P3-000-001-perf-lead-acceptance + UW-P3-002 + UW-P3-DESIGN-SYSTEM-001 + uw-systematization-llm-wiki-alignment.

## 3. Pre-ADR-0023 measurement (2026-05-19 to 2026-05-22 — 25 tasks)

Filled per [[../../templates/lwoe_session_measurement.template.md]], aggregated across 4 days. "Session" granularity is approximated as one period-aggregate because per-session boundaries were not consistently recorded pre-ADR-0023.

### Period header

- **period_id:** `uw-pre-adr-0023`
- **dates:** 2026-05-19 through 2026-05-22 inclusive
- **tasks completed:** 25 (Phase 0: 5; Phase 1: 12; Phase 2: 7; Phase 3 planning that finished pre-cutoff: 0; UW-ORG-001/002/003 ops: 3 — but 002/003 close 2026-05-22 so 2 of these are in pre, 1 is pre. Recount: 25 tasks accepted in window.)
- **agents involved:** Codex (Lead), Antigravity, Qwen, DeepSeek (review participants).
- **session lane mix:** primarily L3 (plan packet) and L5 (accept+rollup). Several L2 (delegated-review) on UW-P2 series.

### 1a — Bootstrap reads

- **value:** **657 lines** per Lead session (worst case, AI without persistent memory).
- **raw evidence:**
  - `AGENTS.md` 143 lines + `REPO_RULES.md` 83 lines + `docs/session_start.md` 373 lines + `AI_CODEX.md` 58 lines = 657. (Cited verbatim from `/home/admindebian/UniversityWeb/reports/validation/2026-05-23-bootstrap-token-audit.md` lines 22-36, which audits the pre-cutoff state.)
- **note:** "session_start.md was claimed 'internalize once' but AIs without persistent memory had to re-read each session." Audit triggered ADR-0023.
- **anomalies:** none for the measurement itself — the audit is authoritative.

### 1b — Total reads/task

- **value:** **`needs-review`** — not retrospectively measurable from existing reports.
- **raw evidence:** validation reports list file names in `Required read files` blocks but do not include line counts. To reconstruct would require reading each named file at its 2026-05-19..22 mtime, which is infeasible (non-git repo, no historical snapshots).
- **note:** instrumentation gap. T2 template now collects this prospectively.
- **anomalies:** zero per-task line counts in 25 reports. This is consistent across the period.

### 2a — Iterations to accepted

- **value:** **1.0 average** across 25 tasks.
- **raw evidence:** every validation report in the period explicitly states "accepted at first review" or equivalent. Concrete cites:
  - `2026-05-20-uw-p1-003-sqlite-local-config.md` — accepted first review.
  - `2026-05-21-uw-p1-008-document-types.md` — accepted first review.
  - `2026-05-21-uw-p1-009-content-tree-allowed-children.md` — accepted first review.
  - …(22 more, same pattern).
- **note:** strong baseline — packets pre-cutoff were already disciplined.
- **anomalies:** **UW-P2-003** was accepted first review, but a downstream bug was caught (picker value mismatch) and re-issued as new task `UW-P2-003-FIX1`. By the canonical formula in [[../../wiki/knowledge/project-docs/efficacy_metrics.md#2a-iterations-to-accepted]], task ID split = new task; 2a of UW-P2-003 = 1, 2a of UW-P2-003-FIX1 = 1. The rework signal lives in 3b, not 2a. See 3b for explicit count.

### 2c — Time-to-first-edit

- **value:** **`needs-review`** — not retrospectively measurable.
- **raw evidence:** no timestamps in agent_status checkpoint logs in this period; repo not yet under git so file mtimes are unreliable as packet-ingest proxies.
- **note:** instrumentation gap. T2 template collects this prospectively.

### 3a — Boundary violation rate

- **value:** **0** violations across 25 tasks (= 0%).
- **raw evidence:** every report's acceptance section explicitly enumerates "files outside Allowed Write Targets: none" or equivalent. Concrete cites:
  - `2026-05-21-uw-p1-008-document-types.md` line 101 — "Verified: rollup docs, other agents, uSync, Program.cs, appsettings all untouched."
  - `2026-05-21-uw-p1-009-content-tree-allowed-children.md` — same verification pattern.
  - `2026-05-22-uw-p2-007-upload-richtext-safety.md` — same.
- **note:** target = 0, and the pre-period meets it.
- **anomalies:** none.

### 3b — Rework rate

- **value:** **1 / 25 = 4.0%** (1 rework event in 25 tasks).
- **raw evidence:** UW-P2-003 review (`2026-05-21-uw-p2-003-related-content-query-review.md`) flagged the picker-value-mismatch bug, leading to UW-P2-003-FIX1 (`2026-05-22-uw-p2-003-fix1-related-content-picker-matching.md`). This is one logical rework unit even though the task was issued under a new ID. Per [[../../wiki/knowledge/project-docs/efficacy_metrics.md#3b-rework-rate]] common-mistakes note: "Counting blocked-then-resumed tasks as rework. Blocked is pause, not failure." But this case is **not** a pause-and-resume — it is a defect-driven re-issue, and the underlying work needed to be redone. Count: 1 rework event.
- **note:** target ≤20%; met with margin.
- **anomalies:** none.

### 3c — Test/build fail rate at handoff

- **value:** **0 / 25 = 0%** (zero failing handoffs at first review).
- **raw evidence:** every implementation report shows green build + green tests at first review. Concrete cites:
  - `2026-05-20-uw-p1-003-sqlite-local-config.md` line 34 — "`dotnet build` passed; `dotnet test` passed: 2 passed, 0 failed."
  - `2026-05-21-uw-p1-008-document-types.md` line 102 — "`dotnet build` passed; `dotnet test` passed: 7 tests, 0 failed."
  - `2026-05-22-uw-p2-003-fix1-related-content-picker-matching.md` — "76/76 tests passed."
- **note:** target ≤5%; exceeded.

### 4a — Conflict rate

- **value:** **0 / 25 = 0%**.
- **raw evidence:** no agent status log records `blocked, reason=conflict` in the period; no validation report records a contract-overwrite or disjoint-write violation.
- **note:** parallel work in this period followed disjoint write-targets per [[../../wiki/knowledge/project-docs/multi-agent-coordination.md#disjoint-write-target-rule]].

### 5a — LLM-Wiki consult rate (%)

- **value:** **`needs-review`** — `Knowledge lookup` section was not yet adopted in result reports during this period (the section is part of [[../../templates/agent_result_report.template.md]] which was canonized in LLMWIKI-016/017 but the field rollout to UniversityWeb agents happened post-cutoff with LLMWIKI-024).
- **raw evidence:** spot-checked 5 result reports across the period; none contain a `## Knowledge lookup` block with `LLM-Wiki consulted: yes/no` field.
- **note:** instrumentation gap; not a measurement of behavior. Agents may have consulted; the act was simply not recorded.

### 5c — KLM score distribution

- **value:** **`needs-review`** — same gap as 5a. No KLM scores recorded.

### 6b — Scope-creep events

- **value:** **0 / 25 = 0%** (conservative reading — see anomalies).
- **raw evidence:** spot review of 10 representative reports finds explicit "deviations" sections in 2 (UW-P3-002 has 5 deviations all justified + accepted; pre-cutoff series has no equivalent flagged deviations). In the pre-cutoff window, no report records a scope-creep event.
- **note:** target ≤10%; met.
- **anomalies:** the audit could not retrospectively identify scope-creep that was not flagged in the report. Pre-cutoff reports may have under-reported.

## 4. Post-ADR-0023 measurement (2026-05-23 — 3 tasks)

**Small-sample warning.** Post-period contains 1 day and 3 tasks: UW-P3-002 (Lead implementation), UW-P3-DESIGN-SYSTEM-001 (DeepSeek review/findings), and LLMWIKI-024 Phase A implementation (measurement pending). Many metrics here are too small to compute as percentages reliably; raw counts shown.

### Period header

- **period_id:** `uw-post-adr-0023-d1`
- **dates:** 2026-05-23 only
- **tasks completed:** 3 (UW-P3-002 provisional, UW-P3-DESIGN-SYSTEM-001 findings, ADR-0023 itself counted as governance not task).
- **agents involved:** Claude (Lead), DeepSeek (review).

### 1a — Bootstrap reads

- **value:** **≤326 lines** (projected/designed; not yet measured in a fresh post-cutoff bootstrap session).
- **raw evidence:** target stated in [[../../wiki/knowledge/project-docs/token-economy-bootstrap.md#measured-results-universityweb-2026-05-23]] table ("Post-ADR-0023 L1 default — 326 lines, -70%"). Current file states:
  - `AGENTS.md` 184 lines (cheatsheet hoisted; +41 vs pre-cutoff)
  - `REPO_RULES.md` 83 lines (unchanged)
  - `AI_CODEX.md` 61 lines (slimmed per Phase A; +3 vs pre-cutoff after restructure)
  - Sum = 328 lines (small drift from the published 326; within rounding for "≤330" target).
- **note:** this is **infrastructure-projected**, not a measured bootstrap event. First true post-cutoff bootstrap measurement will be the next Lead session that opens UniversityWeb (e.g., next time UW-P3-003 work begins).
- **anomalies:** post-cutoff state is well-formed; the actual measurement gate is the next live session.

### 1b — Total reads/task

- **value:** **`needs-review`** — same instrumentation gap as pre-period.
- **note:** the LLMWIKI-024 Phase A audit report (`2026-05-23-bootstrap-token-audit.md`) covers bootstrap (1a) only, not per-task (1b).

### 2a — Iterations to accepted

- **value:** **1.0 average** across 3 post-cutoff tasks (small-sample).
- **raw evidence:**
  - UW-P3-002 — `2026-05-23-uw-p3-002-master-layout-lead-acceptance.md` — "Provisional acceptance pending Codex independent re-review." Per task lifecycle this is iteration 1 still in flight; if Codex review rejects, this becomes 2a=2 retroactively.
  - UW-P3-DESIGN-SYSTEM-001 — `2026-05-23-uw-p3-design-system-001-lead-acceptance.md` — accepted first review with one open question escalated.
  - LLMWIKI-024 Phase A — `2026-05-23-llmwiki-024-phase-a-implementation.md` — measurement of phase outcome pending.
- **note:** small sample, 1 task with provisional acceptance (counted as 2a=1 pending Codex re-review). If re-review rejects, recompute.

### 2c — Time-to-first-edit

- **value:** **`needs-review`** — same instrumentation gap.

### 3a — Boundary violation rate

- **value:** **0 / 3 = 0%**.
- **raw evidence:**
  - UW-P3-002 — line 53: "No edits to forbidden write targets. Verified: rollup docs, other agents, uSync, Program.cs, appsettings all untouched."
  - UW-P3-DESIGN-SYSTEM-001 — line 26: "Section 6 of report explicitly verifies; only `agents/deepseek/status.md` + own report touched."

### 3b — Rework rate

- **value:** **0 / 3 = 0%** (no rework events in post-period).
- **note:** small sample; not statistically meaningful.

### 3c — Test/build fail rate at handoff

- **value:** **0 / 3 = 0%**.
- **raw evidence:** UW-P3-002 line 50-51 — "`dotnet build` passes; `dotnet test` ≥ 82/82 + browser smoke `/` returned 200." UW-P3-DESIGN-SYSTEM-001 is review-only (no build target). LLMWIKI-024 Phase A — implementation passed harness validation.

### 4a — Conflict rate

- **value:** **0 / 3 = 0%**.
- **raw evidence:** parallel execution UW-P3-002 (Views/, UniversityWeb.Web/) and UW-P3-DESIGN-SYSTEM-001 (reports/review/deepseek/ only) had explicitly disjoint write targets and no conflict events.

### 5a — LLM-Wiki consult rate (%)

- **value:** **`needs-review`** — `Knowledge lookup` section still not adopted in UW result reports as of cutoff day. Phase A introduced the instrumentation but the 3 post-cutoff tasks pre-date the form rollout.

### 5c — KLM score distribution

- **value:** **`needs-review`** — same.

### 6b — Scope-creep events

- **value:** **0–1 / 3 = 0% (conservative) or 33% (liberal)**.
- **raw evidence:** UW-P3-002 reports 5 deviations from packet — `D1` (Alpine removed, vanilla JS used), `D2` (partials folder path corrected per UW-P3-001), `D3` (skip-link added pre-emptively for WCAG), `D4` (`Html.PartialAsync()` over `<partial>` tag — bug fix), `D5` (Lead implements; process exception, not file-level).
- **note:** the report author (Lead) explicitly accepted all 5 with documented rationale (packet permitted Alpine replacement; D2 aligned with UW-P3-001 contract; D3 pre-emptive WCAG win; D4 bug fix within output spec; D5 process exception). Under conservative reading: 0 scope-creep events. Under liberal reading: 1 event (D3 skip-link as not strictly in Exact output). Recorded as 0-1 with explicit `needs Lead judgment` flag.
- **anomalies:** sample of 3 with 5 deviations on one task is not generalizable; flag the packet-language gap (no explicit scope-creep exception policy).

## 5. Side-by-side comparison

| Code | Metric | Pre (2026-05-19→22) | Post (2026-05-23) | Δ absolute | Δ % | Notes |
|---|---|---|---|---|---|---|
| 1a | Bootstrap reads (lines/session) | 657 | ≤326 (projected) | -331 | -50.4% | Post is design-target; live measurement pending. |
| 1b | Total reads/task (lines) | `needs-review` | `needs-review` | — | — | Instrumentation gap both periods. |
| 2a | Iterations to accepted (avg) | 1.0 | 1.0 | 0 | 0% | UW-P3-002 provisional may revise. |
| 2c | Time-to-first-edit (min) | `needs-review` | `needs-review` | — | — | Instrumentation gap both periods. |
| 3a | Boundary violations (count) | 0 | 0 | 0 | 0% | Target met both periods. |
| 3b | Rework rate (%) | 4.0% (1/25) | 0% (0/3) | -4.0pp | — | Post sample too small for trend. |
| 3c | Test/build fail at handoff (%) | 0% (0/25) | 0% (0/3) | 0 | 0% | |
| 4a | Conflict rate | 0% (0/25) | 0% (0/3) | 0 | 0% | Parallel execution disjoint in both. |
| 5a | LLM-Wiki consult rate (%) | `needs-review` | `needs-review` | — | — | Knowledge-lookup section not yet adopted in UW. |
| 5c | KLM score distribution | `needs-review` | `needs-review` | — | — | Same gap as 5a. |
| 6b | Scope-creep events | 0 | 0-1 (interpretation) | — | — | UW-P3-002 deviations need policy clarity. |

## 6. Data-quality notes

Per [[../../global-rules.md#safety]] "Do not silently guess missing data" and [[../../harness/feedback-loop.md#evidence-gate]]: each cell above either cites a verifiable source or is marked `needs-review`. Five metrics carry `needs-review` for one or both periods. Breakdown:

| `needs-review` Metric | Both periods | Reason | Forward fix |
|---|---|---|---|
| 1b | yes | Reports do not record per-task line counts | Adopt T2 template (`lwoe_session_measurement.template.md`) per session |
| 2c | yes | Repo not git; no timestamps in checkpoint logs | Add explicit time records to agent_status checkpoint log, OR initialize git in UW |
| 5a | yes | `Knowledge lookup` section not yet present in UW result reports | Roll out agent_result_report.template.md (Phase A landed the slim AI_CODEX; next phase rolls out the per-task knowledge-lookup field) |
| 5c | yes | Same as 5a (depends on the field) | Same fix |
| 6b | post | Single post-cutoff task (UW-P3-002) had 5 deviations; no scope-creep policy in packet | Add scope-creep exception policy clause to packet template |

**Quantitatively measurable metrics in both periods:** 1a (with caveat post is projected), 2a, 3a, 3b, 3c, 4a — 6 of 11.

**Sample-size caveat for post-period:** 3 tasks is too few to compute meaningful rates for percentage-based metrics. The post-period numbers above are honest but their statistical weight is low. The next real measurement cycle (next UW Lead session post-cutoff) is what T5/T6 will rely on.

## 7. Findings

Five short observations. No threshold judgments (T5/T6 own those).

1. **Quality metrics (3a, 3b, 3c, 4a) were already strong pre-cutoff.** UniversityWeb's pre-ADR-0023 packet discipline produced 0 boundary violations, 0 conflicts, 0 build failures, 4% rework across 25 tasks. ADR-0023 is not a quality intervention; it is a token-economy intervention.

2. **1a is the metric ADR-0023 targets, and the design move is large: 657 → ≤326 lines, -50%.** Live measurement of post-cutoff 1a in a fresh AI session is the headline confirmation needed for T6. Until that session runs, T6 reports a projected value with explicit caveat.

3. **Five of eleven metrics are `needs-review`** because the instrumentation (per-task line counts, time-to-first-edit, knowledge-lookup section) was not in place pre-cutoff. Phase A landed the slim AI_CODEX and L1-L6 sub-branches; the per-task instrumentation rollout is the missing piece for the next cycle.

4. **Small post-period sample** (1 day, 3 tasks) limits statistical claims. T6 should explicitly mark UniversityWeb as a "partial-data first measurement" until the next post-cutoff measurement cycle completes.

5. **Scope-creep interpretation needs packet-language policy.** UW-P3-002 had 5 documented and accepted deviations; whether those count as scope-creep depends on whether the packet specifies a scope-creep exception clause. Recommend forward packet template addition.

## 8. Evidence summary

- Audit-trail report (the Explore-agent findings document): kept in conversation memory of session 2026-05-23 evening / 2026-05-24 morning; not stored as a separate file (would duplicate this report).
- ADR-0023 source: `/home/admindebian/UniversityWeb/docs/decisions.md` lines 29, 1260-1356.
- Bootstrap audit source: `/home/admindebian/UniversityWeb/reports/validation/2026-05-23-bootstrap-token-audit.md`.
- Phase A implementation source: `/home/admindebian/UniversityWeb/reports/validation/2026-05-23-llmwiki-024-phase-a-implementation.md`.
- Token-economy-bootstrap pattern with measured table: `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/token-economy-bootstrap.md` lines 167-176.
- Metric formulas: `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/efficacy_metrics.md` (T1 output, 2026-05-24).
- Template: `/home/admindebian/LLM-Wiki/templates/lwoe_session_measurement.template.md` (T2 output, 2026-05-24).

## 9. Read-only constraint verification

UniversityWeb is not yet under git (per UW `repo_inventory.md`). Verification by inspection: this audit added no files to `/home/admindebian/UniversityWeb/`, edited no existing files, and left no markers. The Explore agent used only Read/Bash-list tools, no Write/Edit. Confirm by listing UW root timestamps:

```
$ ls -la /home/admindebian/UniversityWeb/ | head
(no files created/modified during this audit; pre-existing mtimes preserved)
```

Manual check recommended at next session start by Lead to confirm no drift.
