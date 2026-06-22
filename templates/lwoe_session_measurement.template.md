# LWOE session measurement — template

Use this template at the **end of every session** to record the 11 LWOE metrics defined in [[../wiki/knowledge/project-docs/efficacy_metrics.md]].

One filled instance per session. Do not aggregate across sessions in this file — that is the dashboard's job ([[../wiki/projects/llm-wiki/docs/efficacy_dashboard.md]]).

Formulas, units, and collection rules are NOT duplicated here. Open `efficacy_metrics.md` once and reference its per-metric section while filling.

---

## Header

- **session_id:** `<unique id; convention: <project>-<date>-<seq>, e.g., uw-2026-05-23-01>`
- **date:** `<YYYY-MM-DD>`
- **project:** `<project-id, e.g., universityweb, llm-wiki>`
- **agent_role:** `<Lead | Delegated | Codex | Main>`
- **session_lane:** `<L1 | L2 | L3 | L4 | L5 | L6>` (per [[../wiki/knowledge/project-docs/token-economy-bootstrap.md]] sub-branch table)
- **session_duration_min:** `<minutes from session-start to stop/handoff>`
- **tasks_in_session:** `<count of tasks reaching final state (accepted, rejected-and-closed) in this session>`
- **source reports:** `<agent result report paths consumed for 1b/2a/2c/3a/5a/5c/6b>`
- **instrumentation complete:** `<yes | no; if no, mark affected metrics needs-review below>`

---

## 1a — Bootstrap reads (lines/session)

- **value:** `<lines>`
- **raw evidence:** `<entry_file:lines> + <repo_rules_file:lines> + <lead_state_file:lines> = <sum>`
- **note:** `<one line; e.g., "L1 default; persistent-memory hit on AGENTS.md so 0 lines re-read">`
- **anomalies:** `<e.g., "had to re-read AGENTS.md because tmux session lost context"; else "none">`

## 1b — Total reads/task (lines)

Per-task entries (one row per task in this session):

| task_id | lines read (excluding bootstrap) | source |
|---|---|---|
| `<task-id>` | `<lines>` | `<result_report path>` |

Use the result report `Measurement fields` read-line ledger as the preferred
source. If the ledger is missing, mark this metric `needs-review` rather than
reconstructing from memory.

- **session total:** `<sum>`
- **session avg per task:** `<sum / tasks_in_session>`
- **note:** `<one line>`
- **anomalies:** `<e.g., "one L5 accept+rollup task hit 1400 lines; expected"; else "none">`

## 2a — Iterations to accepted

Per-task entries:

| task_id | rejected count | iterations (2a) |
|---|---|---|
| `<task-id>` | `<count>` | `<count + 1>` |

- **session avg:** `<avg of 2a values>`
- **note:** `<one line>`
- **anomalies:** `<e.g., "task X reached 4 iterations; packet was too vague — see status log">`

## 2c — Time-to-first-edit

Per-task entries:

| task_id | packet ingest time | first edit time | 2c (minutes) |
|---|---|---|---|
| `<task-id>` | `<HH:MM>` | `<HH:MM>` | `<minutes>` |

Use the result report `Timing` fields or timestamped `agents/<agent>/AGENT.md`
checkpoint entries. If neither exists, mark `needs-review`.

- **session avg:** `<avg minutes>`
- **note:** `<one line>`
- **anomalies:** `<e.g., "L3 task took 22 min first-edit — justified by plan read"; else "none">`

## 3a — Boundary violation rate

- **value:** `<count of edits to files outside Allowed Write Targets, this session>`
- **raw evidence:** `<list each violation: task_id, file_path, why it was outside the packet>`
- **note:** `<one line; target = 0, any > 0 is a fail per LWOE>`
- **anomalies:** `<e.g., "agent edited docs/contracts.md without packet; conflict logged"; else "none">`

## 3b — Rework rate

- **value:** `<count(tasks with 2a >= 2) / tasks_in_session × 100>` %
- **raw evidence:** `<list task_ids with 2a >= 2>`
- **note:** `<one line>`
- **anomalies:** `<one line>`

## 3c — Test/build fail rate at handoff

- **value:** `<count(handoffs with failing test/build at first review) / count(handoffs reviewed) × 100>` %
- **handoffs reviewed this session:** `<count>`
- **fails:** `<count, with brief reason per fail>`
- **note:** `<one line>`
- **anomalies:** `<one line>`

## 4a — Conflict rate

- **value:** `<conflict events / tasks_in_session>` (or "0 per N")
- **events this session:** `<list: task_ids involved, file/contract in conflict, resolution>`
- **note:** `<one line>`
- **anomalies:** `<one line>`

## 5a — LLM-Wiki consult rate (%)

- **value:** `<count(tasks with LLM-Wiki consulted=yes) / tasks_in_session × 100>` %
- **consulted tasks:** `<list task_ids>`
- **note:** `<one line; target band 15-50%>`
- **anomalies:** `<one line>`

## 5c — KLM score distribution

For each task that consulted LLM-Wiki this session, record the KLM score from the result report's `Knowledge lookup` section.

| task_id | KLM score | findings applied (Y/N) |
|---|---|---|
| `<task-id>` | `<0-10>` | `<Y / N>` |

Bucket distribution:

- **0-2 (wasted consult):** `<count>` (`<%>` of consults)
- **3 (edge):** `<count>` (`<%>`)
- **4-7 (sweet spot):** `<count>` (`<%>`)
- **8-10 (should have asked Lead):** `<count>` (`<%>`)

- **headline:** `<% in 4-7 bucket; target ≥80%>`
- **note:** `<one line>`
- **anomalies:** `<one line>`

## 6b — Scope-creep events

- **value:** `<count(edits in-allowed-file but outside Exact output), this session>`
- **events:** `<list: task_id, file_path, what extra change was made, why outside Exact output>`
- **note:** `<one line; target ≤1 per 10 tasks>`
- **anomalies:** `<one line>`

---

## Session-level rollup

| Metric | Value | Notes |
|---|---|---|
| 1a Bootstrap reads | `<lines>` | |
| 1b Total reads/task (session sum) | `<lines>` | |
| 1b Total reads/task (avg) | `<lines>` | |
| 2a Iterations (avg) | `<count>` | |
| 2c Time-to-first-edit (avg) | `<minutes>` | |
| 3a Boundary violations | `<count>` | |
| 3b Rework rate | `<%>` | |
| 3c Test/build fail at handoff | `<%>` | |
| 4a Conflict rate | `<ratio>` | |
| 5a LLM-Wiki consult rate | `<%>` | |
| 5c KLM sweet-spot share | `<%>` | |
| 6b Scope-creep events | `<count>` | |

---

## Verdict (left blank — filled by dashboard)

Do not fill this section here. The dashboard at [[../wiki/projects/llm-wiki/docs/efficacy_dashboard.md]] applies the decision rule from [[../wiki/knowledge/project-docs/efficacy_evaluation.md]] (absolute floor + ≥30% relative improvement) and assigns the PASS / MIXED / FAIL verdict per metric and overall.

---

## Filing instructions

**When to fill.** At session end, before stop / handoff. Filling this is part of the session checkpoint per [[../harness/feedback-loop.md#checkpoint]] when the session counts as a measured cycle.

**Where to save.**

- For a real-repo project: `reports/lwoe/<date>-<project>-<session_id>.md` relative to the project repo.
- For LLM-Wiki internal work: `reports/lwoe/<date>-llm-wiki-<session_id>.md` relative to `/home/admindebian/LLM-Wiki/`.

The retrospective baseline at `reports/validation/2026-05-24-lwoe-baseline-universityweb.md` contains the first two filled instances (pre- and post-ADR-0023 aggregates) as the proof-of-shape.

**Retention.**

- Per-session files: kept for one quarter, then aggregated into the dashboard and pruned. Aggregate retained indefinitely.
- For projects with high session volume (>5/day), aggregate weekly instead of per-session.

**Required only when measuring.** Not every session needs an LWOE measurement form. Measure when:

- A project has just adopted an LLM-Wiki pattern (Token Economy, multi-agent coordination, etc.) and a pre/post comparison is wanted.
- An LWOE cycle is open (the dashboard is being refreshed).
- An anomaly is suspected (rework rate spike, boundary violation, etc.).

Routine implementation sessions do not need this form; the validation report covers them per [[../wiki/knowledge/project-docs/validation_report.md]].
