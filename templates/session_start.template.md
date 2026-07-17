# session start flow

Guide before filling: [[../wiki/knowledge/project-docs/session_start.md]]

Project: {{project-name}}
Last updated: YYYY-MM-DD
Status: active

This is the canonical procedure every AI agent follows at the start of a new
work session on {{project-name}}. It applies to the Lead, Delegated agents, and
Unavailable agents.

Consistency with LLM-Wiki:

- Steps 1–3 mirror `<LLM-Wiki>/harness/read-workflow.md` universal start.
- Roles and write boundaries mirror `<LLM-Wiki>/wiki/knowledge/project-docs/multi-agent-coordination.md`.
- Working style mirrors `<LLM-Wiki>/wiki/knowledge/coding/karpathy-guidelines.md` 4 principles.
- Capability routing mirrors `<LLM-Wiki>/wiki/knowledge/project-docs/agent_capability_tiers.md`.
- Coding sessions use the canonical Coding Pack directly or through the approved projection named by the task.
- Checkpoint mirrors `<LLM-Wiki>/llm-wiki-constitution.md §15 checkpoint law`.

---

## Step 0 — Capability and role gate

1. Read the Lead-owned capability envelope in `agents/<agent>/AGENT.md`.
2. Compare tier, required dimensions, projection, autonomy, verifier, and
   reviewer with the task capability gate.
3. Treat unrated/expired as `C0`. Stop for smaller packet/support/handoff on
   mismatch. Do not self-upgrade.
4. Then identify the assigned role:

| Role | Agent(s) on this project | Branch below |
|---|---|---|
| Lead | {{lead agent name(s)}} | Branch L |
| Delegated | {{delegated agent names}} | Branch D |
| Unavailable | {{unavailable agent names or "none"}} | Branch U |

If unsure which role you are, ask before reading further.

---

## Step 1 — Mandatory minimum reads (all roles)

1. The assigned `P0`, `P1`, or `P2` capability projection.
2. `AGENTS.md` and `REPO_RULES.md` when included by that projection.
3. For code/review/refactor/test/validation work: full Coding Pack only for an
   eligible `P2` projection; qualified `C2-C3` bounded work uses the assigned
   `P1-BOUNDED-CODING`; otherwise use another approved projection or hand off.

---

## Step 2 — Branch by role

### Branch L — Lead

Additional reads, in order:

4. {{lead handoff file, e.g. `AI_CODEX.md`}} — current snapshot.
5. `docs/agent_status.md` — live assignment board.
6. `docs/agent_work_plan.md` — stable delegation policy (first session of the day or after any reorg).
7. `docs/project_status.md` — when planning or rollup.
8. `docs/session_start.md` — this file (first time only).
9. Inbox: `reports/agent/*/`, `reports/review/*/`, items cited as `pending` review.

### Branch D — Delegated agent

Additional reads, in order:

4. `agents/<your-agent>/AGENT.md`.
5. Files listed in the current task's `Required Read Files`.

Do NOT read by default: lead handoff file, project brief, contracts,
repo-wide tasks/status/test-matrix, decisions, per-agent task/status/archive
files, unrelated LLM-Wiki knowledge, rest of the repo.

### Branch U — Unavailable

Do not start any session. If availability has returned, lead must open a fresh packet first.

---

## Step 3 — Identify the current request

1. Restate the request in one sentence.
2. Classify: code implementation, frontend implementation, findings/review, validation, rollup (lead only), decision (lead only).
3. Source of truth: real repo > lead handoff > LLM-Wiki guidance > model background.

If cannot restate or classify, stop and ask. Karpathy principle 1.

---

## Step 4 — Pre-flight check

Six questions before any edit:

1. Capability: tier/dimensions/projection/autonomy/verifier/reviewer fit?
2. Boundary: all needed files in `Allowed Write Targets`?
3. Forbidden side effects: any item triggered?
4. Pre-requisites: packet names a check? Run first.
5. Parallel safety: write targets or shared-file section locks disjoint from
   any active agent?
6. Acceptance criteria: can describe evidence up front for each checkbox?

Any "no" → stop and raise a blocker.

---

## Step 5 — Work with continuous checkpointing

Apply Karpathy 4 principles:

1. Think before coding.
2. Simplicity first.
3. Surgical changes.
4. Goal-driven execution.

Update the agent-owned checkpoint sections of `agents/<your-agent>/AGENT.md`:

- when starting;
- after each meaningful file-group change;
- before long validation;
- after validation;
- when blocked;
- when creating a result report;
- before stopping.

---

## Step 6 — Hand off

1. Run validation commands listed in the packet.
2. Update `AGENT.md` `result handoff`.
3. Create result/findings report only if the packet requires it or the report threshold is met.
4. Final `AGENT.md` checkpoint: `state: completed`, link to report if one exists, list files touched, list validation outcomes.
5. Do NOT update repo-wide rollup docs unless Lead, human, or named integration
   owner granted explicit shared-file write delegation.
6. Stop. Tell the review target from `Coordination mode` the work is ready.

---

## Knowledge Lookup Metric

| Score | Action |
|---|---|
| 0–2 | Do not consult LLM-Wiki |
| 3 | Optional |
| 4–6 | Consult LLM-Wiki |
| 7–10 | Consult LLM-Wiki AND ask the lead before implementation |

Record the score in your result report when the task touches architecture, security, contracts, production, or reusable patterns.

The Coding Pack is mandatory for coding sessions and is separate from
on-demand Knowledge Lookup. Other LLM-Wiki knowledge files relevant to this
project are listed in `AGENTS.md`.

---

## Stop conditions

Stop and raise a blocker when:

- Source of truth is unclear.
- Capability profile is missing/expired for work above `C0`, or the task exceeds
  tier, a required dimension, projection ceiling, or autonomy.
- Required Read Files are missing/empty.
- Pre-requisite check fails.
- Write targets overlap with another active agent.
- Task touches `docs/contracts.md`, `docs/decisions.md`, security, deployment, or `uSync/` without explicit packet assignment.
- Acceptance criteria cannot be measurable.
- Build/test fails and fix would violate boundary.
- Contract/architecture inconsistency discovered.

---

## Conflict protocol

1. Both agents stop further edits in the conflict zone.
2. Lead reviews both outputs.
3. Lead creates integrated result OR opens a new bounded packet.
4. Delegated agents never resolve conflicts in contracts, decisions, security, deployment, or `uSync/`.

---

## Lead-substitution note

{{If this project allows the lead role to be filled by different agents, describe the substitution policy here. Otherwise: "Lead is permanently {{lead agent name}}."}}

---

## Daily work log

The lead maintains `reports/daily/YYYY-MM-DD.md` per `<LLM-Wiki>/templates/daily_work_log.template.md`. Delegated agents update the agent-owned checkpoint sections of their own `agents/<a>/AGENT.md`.

---

## Anti-patterns

- Reading the whole repo by default.
- Editing repo-wide rollup docs as a delegated agent.
- "Improving" code adjacent to the requested change.
- Adding features beyond the packet.
- Silently picking one of multiple interpretations.
- Treating `reports/agent/<a>/` as the active assignment board.
- Treating `agent_work_plan.md` as a live status board.
- Skipping the `AGENT.md` checkpoint between sessions.
- Resolving a contract conflict yourself as a delegated agent.

---

## Quick reference card

```
1. Check capability envelope against task; stop on mismatch.    [all roles]
   Read only assigned P0/P1/P2 projection.
   Coding -> full pack only if eligible, else approved projection.
2. Branch by role:
   Lead → handoff + agent_status + inbox.
   Delegated → AGENT.md.
3. Restate request in one sentence; classify.
4. Pre-flight: boundary, side effects, pre-reqs, parallel, AC.
5. Work + checkpoint to AGENT.md continuously.
6. Hand off: validation + result report + final status. Stop.
```
