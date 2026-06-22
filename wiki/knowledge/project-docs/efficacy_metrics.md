---
name: efficacy_metrics
description: Canonical definitions for the 11 LWOE (LLM-Wiki Operational Efficacy) metrics across 6 groups. Owns formulas, units, granularity, data sources, collection rules, improvement direction, worked examples. Consumed by lwoe_session_measurement.template.md (T2), LWOE baseline reports (T3), efficacy_evaluation.md (T4), and project efficacy_dashboard.md (T6).
source_type: file-back
source_project: llm-wiki (governance)
date_ingested: 2026-05-24
date_updated: 2026-05-25
confidence: medium
confidence_reviewed: 2026-05-25
applicable_contexts:
  - any project applying the LLM-Wiki operating model
  - retrospective efficacy audits comparing pre- and post-pattern adoption
  - per-session efficacy measurement using lwoe_session_measurement.template.md
status: active
---

# LWOE — efficacy metrics

LWOE = LLM-Wiki Operational Efficacy. The 11 metrics below answer: "Is the LLM-Wiki operating model producing measurably better AI work?" without hand-waving.

## purpose

This file is the canonical source for metric formulas, units, and collection rules. Consumers:

- [[../../../templates/lwoe_session_measurement.template.md]] — per-session collection form (T2).
- LWOE baseline reports (T3 — first instance: `reports/validation/2026-05-24-lwoe-baseline-universityweb.md`).
- [[efficacy_evaluation.md]] — decision rule and dashboard layout (T4).
- [[../../projects/llm-wiki/docs/efficacy_dashboard.md]] — published per-project verdicts (T6).

Threshold values for each metric appear in `## Threshold revision log` (added by T5 after first baseline). Strawman thresholds in [[../../projects/llm-wiki/docs/tasks.md]] §LLMWIKI-025 remain the historical baseline.

## scope

### in scope (11 metrics)

| Group | Code | Name |
|---|---|---|
| Token economy | 1a | Bootstrap reads (lines/session) |
| Token economy | 1b | Total reads/task (lines) |
| Time / iteration | 2a | Iterations to accepted |
| Time / iteration | 2c | Time-to-first-edit |
| Quality | 3a | Boundary violation rate |
| Quality | 3b | Rework rate |
| Quality | 3c | Test/build fail rate at handoff |
| Multi-agent | 4a | Conflict rate |
| Knowledge lookup | 5a | LLM-Wiki consult rate |
| Knowledge lookup | 5c | KLM score distribution |
| User experience | 6b | Scope-creep events |

### deferred (Tier 2 / Tier 3 — not measured in this round)

- **1c** Re-read rate — Tier 2; requires session-level diff against previous session, infrastructure not yet in place.
- **2b** Send-back reasons — Tier 2; useful but requires reason taxonomy that must stabilize first.
- **4b** Parallel safety violations — Tier 2; subsumed under 3a + 4a for this round.
- **4c** Contract overwrite events — Tier 2; subsumed under 4a for this round.
- **5b** Wiki hit rate — Tier 3; requires labeled "useful vs not" judgment per consult; manual.
- **6a** User-correction count — Tier 3; requires conversation-history analysis.
- **6c** Clarification questions — Tier 3; requires conversation-history analysis.

Tier 2 may be added after the first LWOE cycle stabilizes. Tier 3 requires manual judgment infrastructure that is not yet defined.

## glossary

Single-sentence definitions. Disagreements about a metric's value usually trace back to disagreement on one of these terms.

- **Session** — one continuous agent run from session-start bootstrap through the moment the agent stops or hands off. Crash-and-restart starts a new session.
- **Task** — one unit of work defined by a task packet (per [[../../../harness/task-packet.md]]). Has one `accepted` state; multiple iterations possible before that state.
- **Iteration** — one `assigned → in_progress → (needs-review | rejected) → ...` cycle. The cycle ending in `accepted` is the final iteration.
- **Accepted** — final state of a task, recorded in `agents/<agent>/AGENT.md` checkpoint/handoff state and (after rollup) in `docs/tasks.md`.
- **Boundary violation** — any edit to a file path NOT listed in the current task packet's `Allowed write targets`. Always counts; no benign cases. Self-update of agent-owned sections in `agents/<agent>/AGENT.md` is implicitly allowed per [[multi-agent-coordination.md]] tier 3 and is NOT a violation.
- **Conflict** — any event where two agents' work overlaps in a way that violates the disjoint-write-target rule (see [[multi-agent-coordination.md#disjoint-write-target-rule]]) or where a delegated agent edits a Lead-owned contract without explicit packet permission.
- **KLM consult** — a real-repo task where the agent recorded `LLM-Wiki consulted: yes` in the result report's `Knowledge lookup` section per [[../../../harness/read-workflow.md#agent-report-section]]. Browsing without applying findings does not count.
- **Scope-creep event** — a file edit within the task's Allowed Write Targets that produces an output not listed in the task's `Exact output`. Distinct from boundary violation (wrong file vs right file / wrong intent).

## metric reference

| Code | Name | Group | Formula | Unit | Granularity | Data source | Collection rule | Direction |
|---|---|---|---|---|---|---|---|---|
| 1a | Bootstrap reads | Token economy | `sum(lines read during session bootstrap, before first edit-intent)` | lines | per-session | entry file + repo-rules + Lead state file line counts at session start | Agent records in lwoe template field 1a at end of session | lower-better |
| 1b | Total reads/task | Token economy | `sum(lines read across one task lifecycle, excluding bootstrap)` | lines | per-task | result report `Measurement fields` read-line ledger + escalation reads in `AGENT.md` checkpoint notes | Agent records per-task; aggregated per session | lower-better |
| 2a | Iterations to accepted | Time/iteration | `count(rejected states) + 1` for the accepting iteration | count | per-task | `agents/<agent>/AGENT.md` checkpoint/handoff state transitions or result report review history | Lead reads checkpoint/handoff state on accept; aggregate to session avg | lower-better |
| 2c | Time-to-first-edit | Time/iteration | `t(first file edit) − t(packet ingest)` | minutes | per-task | result report `Timing` fields + timestamped `AGENT.md` entries | Agent records first-edit time in result report | lower-better |
| 3a | Boundary violation rate | Quality | `count(edits to files outside Allowed Write Targets)` | count | per-session | files-changed diff vs task packet `Allowed write targets` | Lead diffs at review; records count per session | lower-better (target = 0) |
| 3b | Rework rate | Quality | `count(tasks with 2a ≥ 2) / count(tasks in session)` × 100 | % | per-session | 2a values from each task | aggregate at end of session | lower-better |
| 3c | Test/build fail rate at handoff | Quality | `count(handoffs with failing test/build) / count(handoffs reviewed)` × 100 | % | per-session | Lead review note or codex validation report | Lead records yes/no per handoff | lower-better |
| 4a | Conflict rate | Multi-agent | `count(conflict events) / count(tasks in session)` | ratio | per-session | `AGENT.md` checkpoint/blocker state (state=blocked, reason=conflict) + Lead conflict protocol log | Lead aggregates per session | lower-better |
| 5a | LLM-Wiki consult rate | Knowledge lookup | `count(tasks with LLM-Wiki consulted=yes) / count(tasks)` × 100 | % | per-session | result report `Knowledge lookup` section | Lead aggregates from result reports | target-band (15-50%) |
| 5c | KLM score distribution | Knowledge lookup | distribution by buckets 0-2 / 3 / 4-7 / 8-10 | count per bucket | per-session, per-project | result report `Knowledge lookup` Score field | Lead summarizes after each session | target-band (≥80% in 4-7) |
| 6b | Scope-creep events | User experience | `count(edits in-allowed-file but outside Exact output)` | count | per-session | result report `Measurement fields` boundary/scope check cross-checked against task `Exact output` | Lead identifies during review | lower-better |

## per-metric detail

### 1a — Bootstrap reads (lines/session)

**Full formula.** `1a = Σ (lines of each file read between session-start and first edit-intent)`. "Edit-intent" = the first time the agent opens a file with intent to write, including the first `Edit`/`Write` tool call or first explicit "I will now modify X".

**Worked example.** A Lead AI without persistent memory starts a session. Reads `AGENTS.md` (180 lines) + `REPO_RULES.md` (120 lines) + `AI_CODEX.md` (30 lines). Then sees task packet, opens `docs/contracts.md` to look up a row — but this is intent-driven (escalation L3), so it counts as 1b not 1a. `1a = 180 + 120 + 30 = 330 lines`.

**Improvement direction.** Lower-better. Target band:

- Lead L1 bootstrap: ≤330 lines (per [[token-economy-bootstrap.md#measurement]]).
- Delegated L1 bootstrap: ≤300 lines.
- AIs with persistent memory may achieve lower (the cheatsheet is in memory). AIs without persistent memory should still meet target via the hoisted L1 cheatsheet.

**Common mistakes.**

- Counting files instead of lines (a 30-line file is not the same as a 600-line file).
- Counting reads beyond the bootstrap step (those go in 1b).
- Counting only the entry file but ignoring repo-rules + Lead state file (all three are bootstrap).
- For AIs with persistent memory: counting 1a as 0 because nothing was re-read this session. Record actual lines read this session; if 0, record 0 and note "persistent memory hit".

### 1b — Total reads/task (lines)

**Full formula.** `1b = Σ (lines of each file read during one task's lifecycle, excluding bootstrap counted in 1a)`. Lifecycle = from packet ingest to `accepted` state.

**Worked example.** Delegated agent task. After bootstrap (1a counted), agent
reads `agents/antigravity/AGENT.md` (180 lines) + 3 source files referenced in
Required read files (250 + 150 + 200 lines) + 1 contracts row from
`docs/contracts.md` (5 lines). `1b = 180 + 250 + 150 + 200 + 5 = 785 lines`.

**Improvement direction.** Lower-better. Target:

- Typical L1 / L2 task: ≤800 lines.
- L3 plan-packet task: ≤1500 lines (justified extra reads for planning).
- L5 accept+rollup task: ≤1500 lines (justified by cross-task synthesis).

**Common mistakes.**

- Forgetting escalation reads (status log shows extra files were opened during a conflict resolution).
- Counting partial reads as full file reads (use actual lines read, including offset/limit).
- Double-counting between 1a and 1b. Rule: each file read is counted exactly once, in either 1a (bootstrap) or 1b (per-task), never both.

### 2a — Iterations to accepted

**Full formula.** Walk the task's review history from `AGENT.md` handoff state
and result-report review notes. Count transitions to `rejected`.
`2a = count(rejected) + 1`. The final iteration ending in `accepted` is the +1.

**Worked example.** Task state log:

```
assigned → in_progress → needs-review → rejected (iteration 1)
        → in_progress → needs-review → rejected (iteration 2)
        → in_progress → needs-review → accepted (iteration 3)
```

`count(rejected) = 2`. `2a = 2 + 1 = 3`.

If task is accepted on first review: `count(rejected) = 0`. `2a = 0 + 1 = 1`.

**Improvement direction.** Lower-better. Target avg ≤2 across session. Some tasks reaching 3 is acceptable; >3 consistently means packets are unclear (split or rewrite).

**Common mistakes.**

- Counting `in_progress → needs-review` as a transition (it's normal flow; only `rejected` increments).
- Counting accepted-then-rolled-back separately. Treat the rollback as a new task and start its 2a from 1.
- Treating `blocked` as `rejected`. Blocked is paused, not rejected; resume from same iteration.

### 2c — Time-to-first-edit

**Full formula.** `2c = t(first file edit by agent in this task) − t(packet ingest moment)` in minutes.

**Worked example.** Packet posted to `agents/antigravity/AGENT.md` at 14:00.
Agent's first `Edit` tool call (or first commit) at 14:07. `2c = 7 minutes`.

For retrospective: use file mtime difference between `AGENT.md` assignment time
and earliest output file in the task's Allowed write targets.

**Improvement direction.** Lower-better. Target:

- L1 simple tasks: ≤5 min.
- L3 plan-packet tasks: ≤15 min (justified by planning read).
- L5/L6 review/ADR tasks: target not enforced (variable by review scope).

**Common mistakes.**

- Confusing first-read with first-edit. The metric is first edit (write); reads belong in 1b.
- Counting setup time (read files for context) as part of 2c — that's actually justified prep and the metric measures it as a feature, not a bug. Long 2c without long 1b suggests procrastination; long 2c with high 1b suggests packet over-scoped.

### 3a — Boundary violation rate

**Full formula.** `3a = count(edited files NOT in task packet Allowed Write Targets)` per session.

**Worked example.** Task packet says: `Allowed write targets: agents/antigravity/`.
Agent edited the agent-owned checkpoint sections of `agents/antigravity/AGENT.md`
(allowed) and `docs/contracts.md` (NOT allowed). `3a += 1` for that session.

**Improvement direction.** Lower-better. Target = **0**. Any value > 0 is a fail per LWOE acceptance rule. There is no benign boundary violation; if a violation appears justified, the packet was wrong and should be re-issued before the edit.

**Common mistakes.**

- Counting in-allowed but unexpected edits as violations — those are scope-creep (6b), not boundary violations.
- Excluding self-update of agent-owned sections in `agents/<agent>/AGENT.md` — implicit tier-3 allowance per [[multi-agent-coordination.md]]; not a violation.
- Counting `reports/agent/<agent>/<id>-result.md` as a violation — also implicit tier-3 allowance.

### 3b — Rework rate

**Full formula.** `3b = count(tasks where 2a ≥ 2) / count(tasks completed in session) × 100%`.

**Worked example.** Session has 5 completed tasks with 2a values: 1, 1, 2, 1, 2. Tasks with 2a ≥ 2: count = 2. `3b = 2 / 5 = 40%`.

**Improvement direction.** Lower-better. Target ≤20%.

**Common mistakes.**

- Confusing rework with retries within the same iteration. A typo fix on a second commit is not rework if the iteration wasn't rejected.
- Excluding tasks still in_progress from denominator. Only count tasks that reached `accepted` in the session.
- Counting blocked-then-resumed tasks as rework. Blocked is pause, not failure.

### 3c — Test/build fail rate at handoff

**Full formula.** `3c = count(handoffs where Lead found failing test/build at first review) / count(handoffs reviewed in session) × 100%`.

**Worked example.** 10 handoffs reviewed in session. 1 had a broken build at first review (regardless of whether agent later fixed it). `3c = 1 / 10 = 10%`.

**Improvement direction.** Lower-better. Target ≤5%.

**Common mistakes.**

- Counting tests that fail in CI but pass locally as zero (it's still a handoff fail; agent should have run the same checks).
- Counting tests explicitly out-of-scope in the packet (skip those from denominator).
- Including the agent's own pre-handoff test runs that they fixed before review. Only first-review-state counts.

### 4a — Conflict rate

**Full formula.** `4a = count(conflict events) / count(tasks in session)`.

**Worked example.** Session: 20 tasks across 2 agents. 1 event where agent B touched a file in agent A's file-ownership group. `4a = 1 / 20 = 5%` (also expressible as "1 per 20 tasks").

**Improvement direction.** Lower-better. Target ≤1 per 20 tasks (≤5%).

**Common mistakes.**

- Counting conflicts on different files as one event. Each disjoint-write-rule violation is one event.
- Excluding contract-overwrite events. Those are conflicts and count.
- Counting Lead-resolved-without-impact events as zero. The event happened; the resolution is good practice but the rate still increments.

### 5a — LLM-Wiki consult rate (%)

**Full formula.** `5a = count(tasks with LLM-Wiki consulted=yes in result report) / count(tasks in session) × 100%`.

**Worked example.** 8 tasks in session. 3 result reports recorded `LLM-Wiki consulted: yes` with a Score in 4-7 range and findings applied. `5a = 3 / 8 = 37.5%`.

**Improvement direction.** Target-band: 15-50%. Below 15% suggests agents are ignoring the wiki on tasks where it would help. Above 50% suggests over-consultation (KLM score should have been below 3 for many of those).

**Common mistakes.**

- Counting browse-without-application as consulted. Only count when a finding was used or a conflict raised.
- Recording 0% when sample is tiny. State as count (e.g., "0 / 3 tasks consulted") for small samples; convert to % only at session aggregate.
- Treating delegated agents' implicit-no as consulted=no. Delegated agents don't normally consult LLM-Wiki (per [[multi-agent-coordination.md#reduced-read-order-for-delegated-agents]]); count them in denominator but consult=no by default.

### 5c — KLM score distribution

**Full formula.** For each task with `LLM-Wiki consulted: yes`, read the `Score: 0-10` field. Bucket: 0-2 ("wasted consult"), 3 ("edge case"), 4-7 ("sweet spot"), 8-10 ("should have asked Lead"). Distribution = count per bucket. Aggregate as `% in 4-7 bucket` for the headline.

**Worked example.** Session has 5 consults. Scores: [5, 6, 4, 2, 7].

- Bucket 0-2: 1 (score 2) → 20% of consults.
- Bucket 3: 0.
- Bucket 4-7: 4 (scores 5, 6, 4, 7) → 80% of consults.
- Bucket 8-10: 0.

Headline: 80% in sweet spot. Healthy.

**Improvement direction.** Target-band: ≥80% of consults in bucket 4-7. Flag if many consults land in 0-2 (wasted reads) or 8-10 (should have escalated to Lead/main).

**Common mistakes.**

- Averaging scores instead of distribution. Average of [10, 0] = 5, looks fine but hides catastrophic distribution.
- Recording score only when consult happens but not the consult-skipped cases. Skipping when score < 3 is correct per [[../../../harness/read-workflow.md#knowledge-lookup-metric-for-real-repo-work]]; don't penalize agents for skipping.
- Treating "score not recorded" as 0. Treat as missing data; `needs-review` if many missing.

### 6b — Scope-creep events

**Full formula.** `6b = count(edits where file is in Allowed Write Targets but the edit produces output not listed in task Exact output)`.

**Worked example.** Task packet:

- Allowed write targets: `services/auth.py`.
- Exact output: "Rename function `validate` to `validate_credentials`. Update callers within `services/auth.py`."

Agent edited `services/auth.py` to rename + also refactored error handling (which was not part of Exact output). The error-handling refactor is one scope-creep event. `6b += 1`.

**Improvement direction.** Lower-better. Target ≤1 per 10 tasks (10%).

**Common mistakes.**

- Confusing with boundary violation (3a). Boundary = wrong file. Scope-creep = right file, edit goes beyond task intent.
- Counting necessary side effects required by Exact output as creep. If the rename forces an import-line update elsewhere in the same file, that's required, not creep.
- Counting deviations pre-authorized in the packet's `Scope-creep exception policy` field (see [[../../../harness/task-packet.md]]) as creep. Pre-authorized = packet authority = not creep.
- Hesitating because agent intent was "helpful." Helpfulness without packet authority is creep.

**Difficulty note.** This metric is marked **M** (medium) because it requires Lead judgment on intent boundary. Automation is hard; the Lead reviewing the diff at acceptance is the data source.

## Threshold revision log (2026-05-24)

This section records threshold reviews per [[../../projects/llm-wiki/docs/tasks.md]] §LLMWIKI-025 T5. Initial strawman thresholds are documented in §LLMWIKI-025 (kept as historical record). Refinements below are sourced from the T3 baseline at [[../../../reports/validation/2026-05-24-lwoe-baseline-universityweb.md]].

| Metric | Strawman | Refined | Rationale |
|---|---|---|---|
| 1a Bootstrap reads | ≤330 (Lead L1), ≤300 (Delegated L1) | strawman retained | T3 post-projected ≤326 matches strawman exactly. UW is the only data point; tightening from one project would over-fit. |
| 1b Total reads/task | ≤800 typical, ≤1500 L5 | strawman retained — needs more data | T3 marked `needs-review` both periods (no per-task line-count instrumentation in UW). Re-evaluate after next cycle that adopts T2 template per session. |
| 2a Iterations to accepted | ≤2 avg | strawman retained | T3 observed 1.0 avg in both periods (highly disciplined project). One-project sample insufficient to tighten the global strawman; many projects may have legitimate ≥1.5 averages on harder work. |
| 2c Time-to-first-edit | ≤5 min L1, ≤15 min L3 | strawman retained — needs more data | T3 `needs-review` both periods (UW not yet under git; no checkpoint timestamps). Re-evaluate after instrumentation. |
| 3a Boundary violations | 0 per session | strawman retained | T3 observed 0/25 pre, 0/3 post. Target met by margin; threshold is already at the hard floor and cannot be tightened. |
| 3b Rework rate | ≤20% | strawman retained | T3 observed 4% pre, 0% post (small sample). UW is well below threshold but one project doesn't establish a global floor — other domains may legitimately have 10-15% rework on harder work. |
| 3c Test/build fail at handoff | ≤5% | strawman retained | T3 observed 0% both periods. UW exceeds target; threshold retained until a more failure-prone project supplies counter-evidence. |
| 4a Conflict rate | ≤1 per 20 tasks (5%) | strawman retained | T3 observed 0% both periods (parallel-disjoint execution worked). Threshold retained as a ceiling for projects with denser parallel work. |
| 5a LLM-Wiki consult rate | 15-50% band | strawman retained — needs more data | T3 `needs-review` both periods (Knowledge-lookup section not yet adopted in UW result reports). Re-evaluate after agent_result_report.template.md adoption. |
| 5c KLM score distribution | ≥80% in bucket 4-7 | strawman retained — needs more data | Same gap as 5a. |
| 6b Scope-creep events | ≤1 per 10 tasks (10%) | strawman retained | T3 observed 0 pre, 0-1 post (one task with 5 deviations all accepted with rationale). Threshold retained; recommend forward packet-template addition for scope-creep exception policy (see baseline §findings #5). |

**Net effect.** 11 strawman thresholds retained; 0 numerically refined. 5 metrics carry `needs-review` flags awaiting instrumentation. Honest reading: UniversityWeb pre-period was already well above all measurable thresholds, so the baseline does not give the data points to tighten any number. Next cycle (post-instrumentation, ≥1 more project) is the natural T5 re-run point.

### When to re-run T5

- After a project that systematically fails one or more thresholds (gives a tightening signal).
- After a project that adopts the full T2 per-session instrumentation (fills the 5 `needs-review` gaps).
- When ≥3 projects have run LWOE cycles (broader basis for global threshold updates).

## cross-links

- [[token-economy-bootstrap.md]] — 1a and 1b baseline; Lead-bootstrap target ≤330 lines.
- [[knowledge_lookup_metric.md]] — 5a and 5c are operationalizations of the KLM defined here.
- [[multi-agent-coordination.md]] — 3a (boundary), 4a (conflict), implicit-allowed tier-3 files.
- [[../../../harness/read-workflow.md]] — Knowledge Lookup Metric in agent report format; data source for 5a/5c.
- [[../../../harness/task-packet.md]] — `Allowed write targets`, `Forbidden write targets`, `Exact output` fields used by 3a and 6b.
- [[agent_local_work.md]] — 3-tier task board model (defines what counts as a self-update vs a violation).
- [[../../../templates/lwoe_session_measurement.template.md]] — per-session form built from these definitions (T2).
- [[efficacy_evaluation.md]] — decision rule (T4).

## sources

- `wiki/projects/llm-wiki/docs/tasks.md` §LLMWIKI-025 — 11-metric scope locked 2026-05-23 evening.
- [[token-economy-bootstrap.md]] — empirical baseline for 1a/1b (UniversityWeb ADR-0023).
- [[knowledge_lookup_metric.md]] + [[../../../harness/knowledge-lookup-metric.md]] — KLM definition for 5a/5c.
- [[multi-agent-coordination.md]] — conflict and boundary definitions for 3a/4a.
- [[../../../templates/agent_result_report.template.md]] — Measurement fields used for 1b, 2c, 3a, and 6b; Knowledge lookup section used for 5a/5c.
- [[../../../templates/agent_role_card.template.md]] — current control-card checkpoint/handoff sections used as 2a data source.
