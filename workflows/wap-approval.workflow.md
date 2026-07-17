# workflow: WAP approval

## purpose

Keep write actions controlled: agents create proposals; humans or
policy-approved APIs publish.

This workflow is a Human-Agent Hybrid Control action gate. Approval preserves
human permission/accountability while agent proposals preserve bounded
analysis/execution evidence. Neither approval nor proposal proves the publish
outcome by itself.

## trigger

- Agent wants to change raw/source-of-truth data.
- Agent wants to publish generated knowledge or operational changes.
- A tool has side effects beyond local draft files.

## start file

The WAP proposal under:

```text
/home/admindebian/Agent-Platform/wap/proposals/
```

## source of truth

The target system becomes source of truth only after approval and publish. The
proposal is evidence before that point.

## inputs

- Proposal id.
- Owner.
- Intended target.
- Input/output contract.
- Side effects.
- Validation evidence.
- Rollback or compensation note.
- Human sponsor and acceptance owner.
- Agent principal/session and task claim.
- Action-risk lane and permission scope.
- Grant expiry/review trigger and interrupt/stop route.

## allowed writes

- WAP proposal files.
- Audit events.
- Approved publish target after explicit approval.

## forbidden writes

- Do not let the worker/model publish directly to live source-of-truth data.
- Do not bypass owner/policy approval because a proposal looks low risk.
- Do not store credentials in proposal files.

## approval gate

Required for any write with side effects, sensitive data, source-of-truth
mutation, or policy change.

Re-check the gate when target, scope, impact, reversibility, identity,
permission, or evidence changes. A prior/session-start approval is not an
unlimited grant.

## evidence

Record approval identity, timestamp, publish result, validation result, and
audit event path.

## canonical details

- `../harness/read-workflow.md`
- `/home/admindebian/Agent-Platform/README.md`
