# Workflow Audit Layer Checkpoint

Status: active  
Last updated: 2026-07-08

## current position

`workflows/` is a separate short audit/control layer above `harness/`.

Workflow cards choose the path, source of truth, allowed writes, approval gates,
and evidence. They do not duplicate long procedures.

## already done

- `workflows/catalog.md` chooses recurring workflows.
- `real-repo-work.workflow.md` routes real repo work to repo source of truth.
- `session-closeout.workflow.md` handles "dừng tại đây" / stop-here cases.
- `file-size-and-roi.workflow.md` handles trim/split/archive choices.
- U17 entry docs now route through workflow catalog before detailed harness
  reads.
- U17 fresh-session evaluation passed with minor cleanup; Phase 1 routing,
  bug-fix funnel, knowledge cache discipline, broad-read avoidance, and
  source-of-truth/claim rules worked.

## not done yet

- No machine-readable workflow contracts.
- No automated workflow compliance scoring.
- No automated read-order drift checker.

## do not repeat

- Do not merge `harness/` into `workflows/`.
- Do not put detailed deploy/debug rules into workflow cards.
- Do not build workflow contracts merely because they were planned; compare
  them against the lighter read-order drift checklist now that U17 passed.

## next likely step

Decide whether LLMWIKI-061 should pilot small machine-readable contracts or
whether the lighter read-order drift checklist is enough for Phase 1.

## evidence

- `workflows/README.md`
- `workflows/catalog.md`
- `reports/validation/2026-07-06-workflow-catalog-audit-layer.md`
- `reports/validation/2026-07-06-u17-phase1-repo-standardization.md`
- `reports/validation/2026-07-08-u17-phase1-effectiveness-evaluation.md`
