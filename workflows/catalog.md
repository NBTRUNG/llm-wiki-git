# workflow catalog

Use this catalog before opening broad documentation.

| Workflow | Use when | Start file | Source of truth |
| --- | --- | --- | --- |
| [Session Start](session-start.workflow.md) | Starting or resuming a session | Active root entry file | Depends on work target |
| [Agent Capability Calibration](agent-capability-calibration.workflow.md) | Assigning/revising an agent tier, context projection, or autonomy after evaluation | `wiki/knowledge/project-docs/agent_capability_tiers.md` | Human-approved capability evidence |
| [Real Repo Work](real-repo-work.workflow.md) | Implementing, reviewing, testing, or updating status in a real repo | `<repo>/AGENTS.md` | Real repo |
| [Bug-Fix Investigation](bug-fix-investigation.workflow.md) | Investigating or fixing bugs without broad grep/log loops | Active work target entry file | Active work target |
| [Project Bootstrap](project-bootstrap.workflow.md) | Creating a new project packet or repo onboarding files | `harness/project-bootstrap.md` | Pre-repo wiki or real repo |
| [Knowledge Refresh](knowledge-refresh.workflow.md) | Updating reusable LLM-Wiki knowledge | `harness/auto-research.md` or relevant pack README | LLM-Wiki after approval |
| [WAP Approval](wap-approval.workflow.md) | Agent proposes a write that needs human/policy approval | WAP proposal | Approved publish target |
| [Agent Platform Audit](agent-platform-audit.workflow.md) | Checking raw snapshots, extracted indexes, gateway output, or audit logs | `/home/admindebian/Agent-Platform/README.md` | Agent Platform runtime |
| [File Size and ROI](file-size-and-roi.workflow.md) | Deciding whether to trim, split, archive, or leave large files | `harness/read-workflow.md` | Active source file |
| [Manual Recovery](manual-recovery.workflow.md) | Agent/automation is unavailable or a human must take over safely | `RECOVERY.md` | System that owns the incident |
| [Session Closeout](session-closeout.workflow.md) | User says "dừng tại đây", "stop here", or asks to pause/save | Active root entry file | Current work target |

## selection rule

Choose the workflow by work target first:

| Work target | Start root |
| --- | --- |
| LLM-Wiki governance, workflow, templates, or knowledge | `/home/admindebian/LLM-Wiki` |
| Real project implementation/status/task work | Real repo root |
| Raw, extracted, WAP, gateway, audit runtime | `/home/admindebian/Agent-Platform` |

If two workflows apply, use the narrower one first. Example: a UniversityWeb UI
task uses Real Repo Work; it may consult Knowledge Refresh later only if a
reusable lesson should be filed back.

Agents select the workflow without displaying the full catalog at every session
start. They name `Workflow used` at handoff and explain the canonical workflow,
actual deviations, and evidence when the human asks. Human-readable discovery
is available at `../human/workflows.md`.

For bug fixes inside a repo, start with Real Repo Work for source-of-truth and
claim rules, then use Bug-Fix Investigation for the debugging funnel.

## canonical details

- Detailed read/source-of-truth rules: `../harness/read-workflow.md`
- Project creation details: `../harness/project-bootstrap.md`
- Research-to-knowledge details: `../harness/auto-research.md`
- Evidence/report rules: `../harness/validation-report.md`
