# workflow: session start

## purpose

Start every session from one entry file so the user does not need to remember a
long list of docs.

The agent selects the applicable workflow internally. Do not present the full
workflow catalog by default; use the human map only when the user asks what
workflows exist or how the work should be performed.

## trigger

- New agent session.
- User asks to continue previous work.
- User points at a project, repo, or platform task without detailed context.

## start file

| Work target | Read first |
| --- | --- |
| LLM-Wiki governance/knowledge/workflow | `index.md` |
| Real repo work | `<repo>/AGENTS.md` |
| Agent Platform runtime | `/home/admindebian/Agent-Platform/README.md` |

## source of truth

- LLM-Wiki work: LLM-Wiki canonical files.
- Real repo work: the real repo.
- Agent Platform work: `/home/admindebian/Agent-Platform`.

## inputs

- Current user request.
- File-backed continuation checkpoint when the prior session ended mid-task or
  crossed a context-budget pilot signal. Provider counters and pilot semantics
  remain in `../wiki/knowledge/project-docs/work_unit_context_budget.md`.
- Lead-owned capability note and task capability contract when agents are
  capability-managed.
- The start file above.
- `TICK.md` or the repo/platform state file named by the start file.

## allowed writes

- Only files under the selected source-of-truth root.
- LLM-Wiki status rollups when the current task is LLM-Wiki work.
- Reports/evidence named by the active workflow.

## forbidden writes

- Do not update LLM-Wiki project state for real-repo implementation status.
- Do not write raw snapshots into LLM-Wiki or repo docs.
- Do not start broad reading before identifying the work target.

## approval gate

Before other approvals, stop if an unrated/expired agent would exceed `C0`, or
if tier, required dimension, projection, autonomy, verifier, or reviewer does
not fit. Use a smaller packet/projection, deterministic support, or handoff; the
agent must not self-upgrade.

 Ask before changing architecture, workflow structure, source-of-truth ownership,
trust boundaries, or publishing WAP proposals.

## workflow disclosure

- Retain the selected canonical workflow name during execution.
- At handoff, report `Workflow used` in one concise line.
- When asked "how did you do this?", link and explain the approved workflow.
- When asked "why did the result look like this?", separate the normative
  workflow from actual steps, deviations, and evidence.
- Classify feedback as agent noncompliance, task-packet gap, repo-local workflow
  gap, or shared canonical workflow gap before escalation. Only the last class
  changes LLM-Wiki workflow governance.

## evidence

At closeout, update the active status files for the selected work target and
record validation evidence if durable files changed.

When the context-budget pilot is enabled, start from the checkpoint and record
available cumulative provider counters before the first new work unit. Do not
reconstruct missing unfinished state from conversation history.

## canonical details

- `../harness/read-workflow.md`
- `../human/README.md`
- `../wiki/knowledge/project-docs/session_start.md`
- `../wiki/knowledge/project-docs/agent_capability_tiers.md`
