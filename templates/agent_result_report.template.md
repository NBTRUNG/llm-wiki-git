# agent result report

Guide before filling: `wiki/knowledge/project-docs/agent_local_work.md`

Task:
Agent:
Date:
Status: ready-for-review | blocked | needs-review

## Summary

- 

## Knowledge lookup

Score: n/a | 0-10

LLM-Wiki consulted: n/a | yes | no

Reason:

- 

Findings used:

- 

Conflicts with active repo:

- none

Decision:

- active repo followed | blocker raised for Codex | n/a

## Operating capsules applied

List the short repo-rule capsules required by the task packet and any blocker.
Write `n/a` only for docs/query tasks where no implementation capsule applies.

- Required:
- Applied:
- Blockers:

## Coding Pack loaded

Fill for implementation, review, refactor, test, validation, or acceptance work.
Write `n/a` only for non-code-facing status/report/query work.

- Coding Pack loaded: yes | no | partial | n/a
- Exception used: none | status-only | docs-only | typo/copy-only | interrupted | blocker | other
- Pack files read:
  - `agent-coding-workflow.md`
  - `karpathy-guidelines.md`
  - `repo-code-rules.md`
  - `code-quality.md`
  - `output-quality.md`
  - `security-baseline.md`
  - `testing-strategy.md`
- Conflicts with repo rules: none | summary

## Output quality gate

Fill for every non-trivial implementation or review task. Write `n/a` only when
the task has no repo output to accept.

- User-visible behavior:
- Contract/design boundary fit:
- Correctness and edge cases:
- Security/privacy impact:
- Performance/operability impact:
- Tests/checks proving behavior:
- Reviewability/change size:
- Docs/handoff/rollback:
- Residual risks or skipped checks:

## Measurement fields

Fill when LWOE measurement is enabled for this project or session. Otherwise
write `n/a`.

Bootstrap reads already recorded in session form: yes | no | n/a

Read-line ledger:

| File or source | Lines read | Metric bucket | Notes |
|---|---:|---|---|
|  |  | 1a bootstrap |  |
|  |  | 1b task |  |

Timing:

- Packet ingest time:
- First edit time:
- Time-to-first-edit minutes:

Boundary and scope:

- Files outside Allowed Write Targets: none / list
- In-allowed-file deviations from Exact output: none / list
- Scope-creep exception policy used: none / list

## Files changed

- 

## Validation evidence

- 

## Forbidden targets respected

- [ ] `docs/tasks.md`
- [ ] `docs/project_status.md`
- [ ] `docs/test_matrix.md`
- [ ] `docs/contracts.md`
- [ ] `docs/agent_status.md`

## Contract coverage

- Contract references used:
- Contracts changed: none / list

## Large surface guard

Fill when this task creates or materially changes a view, component, page,
partial, controller, query service, or client-side module. Otherwise write
`n/a`.

- File(s) over threshold: n/a | none | list
- Mixed concerns found: n/a | none | server data / markup / CSS / JS / API logic / other
- Duplicate behavior found: n/a | none | list production/diagnostic/service/view duplicates
- Operational status: n/a | stable | new/unstable | frequently changed | owner unclear
- Security/performance status: n/a | verified | not verified | regression found
- Decision: n/a | acceptable long-term fused surface | acceptable temporary fused surface | split now | defer no-behavior-change refactor after stabilization | blocker raised
- Payoff trigger for refactor: n/a | security | performance | recurring bug | duplicate drift | conflict/review cost | material new behavior
- Invariant if refactoring: API routes, DTOs, visual design, copy, and user-visible behavior unchanged

## Risks / blockers

- 

## Audit trail

- Assigned task:
- Agent status:
- Result report:
- Codex validation report:
- Test matrix:
- Project status update:

## Archive row proposal

Lead/review owner may copy this row after acceptance. The executing agent does
not write accepted history directly.

| Task | Proposed outcome | Result report | Notes |
|---|---|---|---|
|  | ready-for-review |  |  |

## Ready for Codex review

- yes / no
