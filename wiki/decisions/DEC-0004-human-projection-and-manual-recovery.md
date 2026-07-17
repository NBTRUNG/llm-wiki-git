# DEC-0004 - Adopt a human projection and manual recovery path

- **Status:** accepted
- **Date drafted:** 2026-07-11
- **Date accepted:** 2026-07-11
- **Source project:** llm-wiki (governance)
- **Class:** workflow, continuity, and human-operations decision
- **Approval owner:** human owner in the 2026-07-11 session

## context

LLM-Wiki is optimized for agents, but humans may forget workflow names and may
need to operate manually during agent or automation failure. Showing a full
workflow menu every session would add noise, while duplicating canonical
workflow details in a human folder would create drift.

## decision

Create `human/` as a Vietnamese-first, human-readable projection of the active
workflow and knowledge maps. Keep a one-to-one identity/link row for every
active canonical workflow, but keep execution details in `workflows/` and
`harness/`.

Add `RECOVERY.md` and `workflows/manual-recovery.workflow.md` as the independent
manual-recovery entry path. Agents self-route by default and report
`Workflow used` at handoff; they show or explain the workflow when the human
asks, rather than presenting a full menu at every session start.

## boundaries

- `human/` is a projection, not execution authority or source of truth.
- Real repos retain their project-specific workflows and runbooks.
- Agent Platform retains raw/WAP/gateway/audit runtime ownership.
- Mutation fails closed when ownership or authorization is unclear; safe
  read-only access may remain available.
- Destructive/break-glass actions remain subject to owner-specific approval.

## consequences

- Humans gain a small navigational and manual-mode map without learning the
  whole vault by memory.
- Workflow catalog changes must inspect the human workflow projection.
- Reports distinguish the approved workflow from actual execution deviations.
- Off-host recovery storage and runtime emergency-stop mechanisms remain future
  decisions; this decision does not claim they exist.

## review condition

Review after the first real manual-recovery drill or incident, or when the
human projection becomes costly to keep aligned.
