# workflow: manual recovery

## purpose

Cho phép con người tiếp quản an toàn khi agent, gateway, MCP hoặc tự động hóa
không sẵn sàng, đồng thời giữ đúng nguồn chân lý và bằng chứng sự cố.

## trigger

- Agent hoặc automation không thể tiếp tục.
- Human yêu cầu manual mode, safe mode, fallback hoặc incident recovery.
- Đường ghi không đáng tin cậy, nhưng cần duy trì khả năng đọc/điều tra.

## start file

Đọc root `RECOVERY.md`, rồi đi tới entry file/runbook của hệ thống sở hữu sự cố.

## source of truth

- LLM-Wiki incident: canonical LLM-Wiki files.
- Agent Platform incident: `/home/admindebian/Agent-Platform`.
- Project/service incident: real repo owning that system.

## required sequence

1. Freeze new mutations and preserve original evidence.
2. Name incident owner, affected scope, last known change, and baseline.
3. Route to the owning runbook; do not reconstruct commands from memory.
4. Prefer read-only, containment, safe mode, fallback, or verified
   last-known-good.
5. Require explicit authority for destructive or break-glass actions.
6. Run the smallest meaningful smoke check before restoring broader traffic or
   writes.
7. Record actual steps, deviations, evidence, residual risk, and handoff.

## allowed writes

- Incident notes/evidence in the owning system's approved location.
- Bounded recovery changes explicitly allowed by the owning runbook and human.
- LLM-Wiki feedback candidate after the incident; canonical promotion still
  follows approval rules.

## forbidden writes

- No destructive action, permission escalation, secret rotation, data rollback,
  release, or traffic mutation without the required approval.
- Do not move project state into LLM-Wiki or active raw into the wiki.
- Do not overwrite original logs/evidence.
- Do not assume an off-host backup, Git recovery path, emergency stop, or safe
  mode exists without verification.

## approval gate

Stop before any action whose blast radius, owner, rollback, data effect, or
authorization is unclear. Mutation paths fail closed; safe read-only access may
continue.

## evidence

- Timeline and incident owner.
- Workflow used and actual deviations.
- Commands/actions and results, with secrets removed.
- Baseline, smoke checks, recovery result, and residual risks.

## canonical details

- `../RECOVERY.md`
- `../human/manual-mode.md`
- `../wiki/knowledge/reliability-sre/incident-runbooks.md`
