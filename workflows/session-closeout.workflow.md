# workflow: session closeout

## purpose

Save state when the user says "dung tai day", "dừng tại đây", "stop here", or
otherwise asks to pause.

## trigger

- User asks to stop, pause, or resume later.
- Long-running workflow reaches a stable checkpoint.
- A context-budget pilot warning/checkpoint requires a file-backed handoff at
  the next safe boundary.
- Agent is about to end a session after durable changes.

## start file

Use the current work target's entry file:

| Work target | Entry |
| --- | --- |
| LLM-Wiki | `index.md` + `TICK.md` |
| Real repo | `<repo>/AGENTS.md` + repo current-state file |
| Agent Platform | `/home/admindebian/Agent-Platform/README.md` |

## source of truth

Close out in the same source of truth that owned the work.

## required updates

- Current-state file: `TICK.md`, `LEAD_STATE.md`, or equivalent.
- Task ledger: `tasks.md` or repo equivalent.
- Test/evidence matrix when proof changed.
- Validation/report index when a report was created.
- Archive completed task bodies when the active ledger would otherwise stay too
  large.
- When the context-budget pilot is enabled: provider counter snapshot and
  semantics, completed work units, threshold crossing/decision, and exact
  next-session start file/action. Use the minimum checkpoint contract in
  `../wiki/knowledge/project-docs/work_unit_context_budget.md`.

## allowed writes

- Current-state and task/status files for the active work target.
- Validation report and report index.
- Archive snapshot for completed/retired task history.

## forbidden writes

- Do not update only a report when live coordination state changed.
- Do not store real-repo state in LLM-Wiki.
- Do not publish WAP proposals without approval.
- Do not force-close incident/high-risk work before evidence and recovery state
  reach a safe checkpoint.

## evidence

Final response should name:

- `Workflow used` and its canonical file;
- actual deviations, or `none`;
- changed state files and validation result;
- the next recommended start file.

Do not imply that following a workflow proves the outcome. Keep normative
workflow, actual execution trace, and result evidence distinguishable.

## canonical details

- `../harness/read-workflow.md#active-state-update-rule`
- `../global-rules.md#checkpoint`
