# workflow: file size and ROI

## purpose

Decide whether to trim, split, archive, or leave a file based on agent
readability and operational value.

## trigger

- Entry/current-state file exceeds warning threshold.
- Ledger or matrix is hard to audit.
- User asks whether to simplify `active.md`, `tasks.md`, reports, or maps.

## start file

`harness/read-workflow.md`

## source of truth

The active source file remains source of truth until a replacement/archive is
written and linked.

## inputs

- Current file line count.
- File type and warning threshold.
- Reader behavior: default read vs targeted `rg` by id.
- Whether content is current state, ledger, evidence, or raw data.

## allowed writes

- Trimmed current-state file.
- Archive snapshot under `archive/`.
- `tasks_archive.md` or equivalent only when the user/Lead chooses archive.
- Pointer updates in indexes and validation report.

## forbidden writes

- Do not remove audit history without an archive or report pointer.
- Do not split just to make docs prettier.
- Do not make every project inherit a heavier archive pattern by default.

## approval gate

If options have materially different cost/effectiveness, present ROI,
simplicity, effectiveness, and blast radius before choosing.

## evidence

Record before/after line counts, archive path, changed live files, and lint
result.

## canonical details

- `../harness/read-workflow.md#file-line-budget-guidance`
- `../harness/read-workflow.md#roi-gate-before-workflow-changes`
