# workflows

This folder is the audit layer for recurring LLM-Wiki and project work.

It does not replace `../harness/`. Workflow cards answer which path to use,
where to start, what may be written, and what evidence closes the work. Harness
files keep the detailed procedure.

## role split

| Layer | Role |
| --- | --- |
| `workflows/` | Short, auditable workflow cards for humans and agents. |
| `harness/` | Detailed operating procedures and checks. |
| `templates/` | Copyable file skeletons. |
| `wiki/knowledge/` | Reusable durable knowledge. |
| `projects/` | Pointers to real project repos. |
| `/home/admindebian/Agent-Platform` | Raw snapshots, extracted indexes, WAP proposals, gateway scripts, and audit logs. |

## start here

- [catalog.md](catalog.md) - choose the workflow.
- [session-start.workflow.md](session-start.workflow.md) - start a new session from one entry file.
- [agent-capability-calibration.workflow.md](agent-capability-calibration.workflow.md) - evaluate a frozen agent configuration and assign its capability envelope/projection.
- [real-repo-work.workflow.md](real-repo-work.workflow.md) - work inside a real project repo.
- [bug-fix-investigation.workflow.md](bug-fix-investigation.workflow.md) - localize bugs with hypotheses, narrow probes, and bounded escalation.
- [project-bootstrap.workflow.md](project-bootstrap.workflow.md) - create a pre-repo or repo-backed project packet.
- [knowledge-refresh.workflow.md](knowledge-refresh.workflow.md) - promote reviewed knowledge into LLM-Wiki.
- [wap-approval.workflow.md](wap-approval.workflow.md) - handle proposal-before-publish changes.
- [agent-platform-audit.workflow.md](agent-platform-audit.workflow.md) - audit raw/evidence/runtime outputs.
- [file-size-and-roi.workflow.md](file-size-and-roi.workflow.md) - decide whether to trim, split, or leave files.
- [manual-recovery.workflow.md](manual-recovery.workflow.md) - switch safely to human/manual operation when automation is unavailable.
- [session-closeout.workflow.md](session-closeout.workflow.md) - close or pause a session when the user says "dung tai day" / "dừng tại đây".

## rules

- Keep workflow cards short: target 80-150 lines, warn above 200.
- Do not duplicate long harness instructions here.
- Every workflow card must name its source of truth and allowed writes.
- `../human/workflows.md` must keep one identity/link row for every active card
  in this catalog, without copying the detailed procedure.
- Durable workflow changes must update `TICK.md`, `tasks.md`, `test_matrix.md`,
  and `reports/validation/README.md` before Done.
