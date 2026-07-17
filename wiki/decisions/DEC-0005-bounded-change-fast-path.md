# DEC-0005 - Adopt a shared Bounded Change Fast Path

- **Status:** accepted
- **Date drafted:** 2026-07-11
- **Date accepted:** 2026-07-11
- **Source project:** llm-wiki (governance)
- **Class:** workflow composition and resource-efficiency decision
- **Approval owner:** human owner in the 2026-07-11 session

## context

A successful tiny UniversityWeb-U17 UI task read 4,500 lines for fewer than ten
changed lines. Creating separate Tiny UI/API/Data rules per repo would multiply
maintenance and drift.

## decision

Add `Bounded Change Fast Path` as a shared execution mode inside Real Repo Work,
not a new catalog workflow. LLM-Wiki owns entry, targeted-read, escalation, and
evidence invariants. Each repo owns a thin profile containing local maps,
commands, boundaries, calibrated warnings, and acceptance owners.

## consequences

- Human workflow menu does not grow.
- Small tasks may use bounded projections without weakening safety/evidence.
- Risk/uncertainty triggers promote the task to the full or specialist route.
- Global hard line/file caps are avoided; comparable-task evidence calibrates
  repo thresholds.
- Existing repos are not silently backfilled; repo-owned profiles require an
  explicit repo update.

## review condition

Review after three to five comparable small tasks or earlier if fast-path work
causes missed context, rework, scope drift, or weaker validation.
