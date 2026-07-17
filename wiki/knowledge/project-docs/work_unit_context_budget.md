---
name: work-unit-context-budget
description: Pilot guidance for measuring session/work-unit context, writing file-backed checkpoints, and testing warning/restart thresholds without treating provider token fields as interchangeable.
source_type: internal-pilot
source_project: llm-wiki
date_ingested: 2026-07-11
date_updated: 2026-07-11
confidence: low
confidence_reviewed: 2026-07-11
applicable_contexts:
  - measured multi-work-unit agent sessions
  - sessions where cumulative context may create cost or interference risk
status: pilot
revision_trigger: Review after at least 5 measured sessions and 10 completed work units, or immediately after an accepted-outcome, recovery, or safety regression.
---

# Work-unit context budget and file-backed checkpoint pilot

## status and decision

This is a measurement pilot, not a universal token limit and not runtime/API
enforcement. It tests two provisional signals:

- warning at `150,000` provider-reported session total tokens;
- checkpoint and new-session recommendation at `300,000` session total tokens.

The thresholds are hypotheses until the revision gate below is met. Provider
limits, pricing, cache accounting, model behavior, task risk, and tool surfaces
may require different values.

## baseline and uncertainty

The 2026-07-11 supplied session reported:

| field | value | interpretation used by this pilot |
| --- | ---: | --- |
| input | 771,121 | provider-reported input; direct/uncached only if the provider explicitly says so |
| output | 93,564 | provider-reported output |
| total | 864,685 | equals supplied `input + output` |
| reasoning | 25,784 | reported separately; do not add to total unless provider semantics require it |
| cached | 14,513,408 | reported separately; do not add to total or treat as equal-cost direct input |

The warning and checkpoint candidates are about `17.3%` and `34.7%` of that
baseline total. This comparison shows scale only. The baseline contains an
unknown number and mix of work units, so it cannot establish a per-work-unit
limit or a causal quality effect.

## measurement semantics

Record provider fields exactly as exposed and preserve the provider/model/tool
version. Do not repair missing fields from memory.

| quantity | unit and granularity | rule |
| --- | --- | --- |
| Session input/output/total | tokens per session | Use cumulative provider counters. State whether `total = input + output`; if not, record the provider definition. |
| Direct input | tokens per session/work unit when exposed | Record uncached/direct input only when the provider defines or exposes it. Otherwise mark `not available`; do not derive it by subtracting cached tokens from input. |
| Reasoning | tokens per session when exposed | Keep separate. State whether it is a subset of output or an additional counter; otherwise mark semantics unknown. |
| Cached input | tokens per session when exposed | Keep separate from direct input and total unless provider documentation defines inclusion. Record reads/writes if exposed separately. |
| Work-unit token delta | tokens per work unit | Take cumulative snapshots at work-unit start and checkpoint; subtract like-for-like fields. If snapshots are unavailable, record `not available`, not an estimate. |
| Tool-read volume | actual lines or bytes/chars read per work unit | This is an I/O measure, not a token count. Partial reads count only the returned portion. Generated tool output uses the same stated unit. |
| First-edit time | minutes per work unit | `first write timestamp - work-unit ingest timestamp`; keep setup/read time in the interval. |
| Rework | accepted-state iterations | Use the LWOE iteration/rework definitions; retries inside one review iteration are not automatically rework. |
| Accepted outcome | yes/no/pending plus acceptance owner/evidence | A session restart is acceptable only if outcome and validation quality do not regress. |
| Completed work units | count per session | Count independently accepted/checkpointed task packets, not tool calls or conversational topics. |

`Session` and accepted-task semantics remain owned by
`efficacy_metrics.md`. This guide adds provider counters and checkpoint rules;
it does not redefine the 11 LWOE metrics.

## pilot procedure

### At session start

1. Read the active root entry file and file-backed current-state checkpoint.
2. Record provider/model/tool identity and whether cumulative counters are
   available.
3. Start one work-unit row. Do not reconstruct unfinished state from old
   conversation when a source-of-truth file exists.

### At every completed work unit

1. Update the owning task/current-state file and result/validation evidence.
2. Record cumulative token snapshots and the work-unit delta when available.
3. Record tool-read volume, first-edit time, rework/iteration state, validation,
   and accepted outcome.
4. Name the next action and the minimum files a fresh session needs.

### At the `150k` warning

Finish the current atomic step, then write or refresh the file-backed
checkpoint before accepting another work unit. Record the threshold crossing
and decide whether continuity benefit justifies staying in the session.

This pilot does not weaken an earlier user, repo, incident, or specialist-pack
checkpoint. For bug-fix investigations, the task-shape bands in
`../agent-errors/internet-search-and-token-budget.md` may trigger first.

### At the `300k` checkpoint

At the next safe boundary, write the checkpoint and recommend a fresh session
starting from the active root entry file. Record any decision to continue and
its safety/continuity reason. This is a workflow recommendation, not an
automatic close or API block.

### Emergency and high-risk continuity exception

Do not interrupt an active incident, migration/transaction, destructive
operation, or other state where stopping would lose evidence or increase harm.
First reach a safe checkpoint: preserve logs/evidence, state current system
condition, record completed and pending actions, identify rollback/recovery,
and name the next owner/action. Then restart. Human instructions and
owner-specific incident/runbook rules override the pilot signal.

## minimum file-backed checkpoint

Store this in the source-of-truth current-state file and link the detailed
result/report instead of creating a conversation-only summary:

```text
Session/work-unit id:
Goal and current state:
Completed work units and acceptance evidence:
Files changed and validation run:
Pending action / exact next step:
Blockers, risks, rollback or recovery state:
Minimum next-session reads:
Provider counter snapshot and semantics:
Threshold crossed / continue-or-restart decision:
```

Do not copy the full checkpoint into multiple files. The active state owns the
short continuation record; result/validation reports own detailed evidence;
templates only collect measurements.

## evaluation and revision gate

Keep raw per-session observations. Review after all of the following are true:

- at least 5 measured sessions;
- at least 10 completed work units across at least 2 task types;
- at least one naturally observed `150k` crossing;
- a `300k` crossing is evaluated only after one occurs naturally; do not burn
  tokens merely to manufacture it.

Compare sessions/work units on accepted outcome, validation strength,
first-edit time, tool-read volume, rework/iterations, boundary/scope violations,
checkpoint completeness, recovery success, and report cost. Separate measured
deltas from qualitative observations; do not combine them into an invented
score.

Promote, move, or remove a threshold only when the sample and provider
semantics are stated. Revise immediately if a checkpoint causes lost state,
lower accepted-outcome/validation quality, unsafe interruption, repeated
reconstruction, or disproportionate reporting cost. Also revisit when provider
accounting, model context behavior, pricing, or session tooling changes.

## trade-off

- Baseline/status quo: let a conversation carry several work units; lowest
  checkpoint overhead, highest exposure to repeated context and interference.
- Pilot: checkpoint at work-unit boundaries and restart on provisional signals;
  adds small reporting cost but improves recoverability and isolates work.
- Hard runtime cap: strongest enforcement but infeasible here, provider-specific,
  and unsafe without continuity controls; explicitly out of scope.

The pilot does not dominate the baseline on every dimension because it trades
reporting time for recoverability and bounded context. Accepted outcomes and
safe continuity are hard guardrails; token reduction alone cannot justify a
regression.

## related

- [token-economy-bootstrap.md](token-economy-bootstrap.md)
- [efficacy_metrics.md](efficacy_metrics.md)
- [../../math/functions-rates-and-measurement.md](../math/functions-rates-and-measurement.md)
- [../../../workflows/session-start.workflow.md](../../../workflows/session-start.workflow.md)
- [../../../workflows/session-closeout.workflow.md](../../../workflows/session-closeout.workflow.md)
- [../../../templates/lwoe_session_measurement.template.md](../../../templates/lwoe_session_measurement.template.md)
