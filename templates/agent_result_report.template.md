# agent result report

Guide before filling: `wiki/knowledge/project-docs/agent_local_work.md`

Task:
Agent:
Date:
Status: ready-for-review | blocked | needs-review
Workflow used:
Canonical workflow:
Actual deviations: none | summary

## Summary

- 

## Capability fit

- Assigned capability tier:
- Qualified task domains/dimensions:
- Task minimum capability tier:
- Assigned context projection: P0 | P1 | P2
- Assigned projection ID/source path:
- Maximum autonomy:
- Required verifier/reviewer:
- Fit decision: eligible | self-downgraded | handoff required | unrated
- Capability evidence/profile:
- Mismatch, escalation, or handoff: none | summary
- Agent confirms it did not self-upgrade: yes | no | n/a

## Human-Agent Hybrid Control

Use the default
`wiki/knowledge/project-docs/human_agent_hybrid_control.md` baseline. For a
trivial/status-only task, keep the ownership fields and write `n/a` only for
controls that truly do not apply.

- Human sponsor:
- Acceptance owner:
- Agent principal/session:
- Action-risk lane: R0 | R1 | R2 | R3
- Autonomy used:
- Permission grant used:
- Human approval events: none | list
- Grant expiry/release status:
- Interrupt/stop affordance: verified | manual | unverified | unavailable
- Rollback/recovery affordance: verified | manual | unverified | unavailable
- Human intent/judgment/acceptance fulfilled: yes | no | needs-review; evidence
- Agent bounded analysis/execution/verification/evidence fulfilled: yes | no | needs-review; evidence
- Human over-delegation or rubber-stamp risk: none | summary
- Agent over-escalation or under-execution risk: none | summary
- Responsibility or control gap: none | summary and owner

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

## LLM-Wiki knowledge effectiveness

Fill when any LLM-Wiki pack or reusable guide was used. Write `n/a` only for
status-only, trivial copy, or report-only work with no reusable guidance.

- Packs used:
- Direct LLM-Wiki knowledge used:
- Indirect LLM-Wiki workflow/template projection used:
- Repo-local knowledge used:
- Most useful file(s):
- What changed because of the knowledge:
- Usefulness score: n/a | 0 | 1 | 2 | 3 | 4 | 5
- Time/read benefit: high | medium | low | none | unknown | n/a
- Mistake avoided: yes | no | unknown | n/a
- Conflict with repo docs/code: none | summary | n/a
- Missing/stale/unclear knowledge: none | summary | n/a
- Improvement action: none | file-back now | queue follow-up | human decision needed | n/a
- Suggested LLM-Wiki target:

## Operating capsules applied

List the short repo-rule capsules required by the task packet and any blocker.
Write `n/a` only for docs/query tasks where no implementation capsule applies.

- Required:
- Applied:
- Blockers:

## Coding Pack loaded

Fill for implementation, review, refactor, test, validation, or acceptance work.
Write `n/a` only for non-code-facing status/report/query work.

- Coding Pack delivery: full P2 Coding Pack | P1-BOUNDED-CODING | other approved projection | exception | n/a
- Assigned projection loaded completely: yes | no | n/a
- Full P2 Coding Pack loaded: yes | no | partial | n/a
- Session packs loaded:
  - Repo Base: yes | no | n/a
  - Coding: yes | no | n/a
  - Security Baseline: yes | no | n/a
  - Security Deep: yes | no | n/a
  - Web/UI: yes | no | n/a
  - Architecture: yes | no | n/a
  - Contracts: yes | no | n/a
  - Data map: yes | no | n/a
  - Data Knowledge: yes | no | n/a
  - Algorithms/Math: yes | no | n/a
  - Platform/Infrastructure: yes | no | n/a
  - Reliability/SRE: yes | no | n/a
  - AI/Agent/RAG/MCP: yes | no | n/a
  - Operations: yes | no | n/a
  - Content/CMS/SEO/i18n: yes | no | n/a
- Exception used: none | status-only | docs-only | typo/copy-only | interrupted | blocker | other
- Projection/core files read:
  - `bounded-coding-core.md` when assigned `P1-BOUNDED-CODING`
- Full P2 pack files read (list only when full/partial P2 was actually used):
  - `agent-coding-workflow.md`
  - `karpathy-guidelines.md`
  - `repo-code-rules.md`
  - `code-quality.md`
  - `output-quality.md`
  - `implementation-quality-matrix.md`
  - `security-baseline.md`
  - `testing-strategy.md`
  - `agent-coding-risks.md`
- Conflicts with repo rules: none | summary

Do not call a selected subset of full-pack files a full Coding Pack load. Repo
maps/profiles/capsules must be reported separately from the assigned knowledge
projection.

## Security check

Fill for every coding, review, refactor, test, validation, or acceptance task.
Write `n/a` only when no repo output is being judged.

- Security impact: none | low | medium | high | n/a
- Areas touched: auth | authorization | input | secrets | logging | dependencies | data | external service | config | none | n/a
- Security Deep Pack triggered: yes | no | n/a
- Risk found: none | summary
- Human security review needed: no | yes, because <reason> | n/a
- Performance/security trade-off: none | summary

## Agent coding risk

Fill for every non-trivial coding, review, refactor, test, validation, or
acceptance task. Write `n/a` only when no repo output is being judged.

- Context injection risk: none | low | medium | high | n/a
- Tool/destructive-action risk: none | low | medium | high | n/a
- Data/migration risk: none | low | medium | high | n/a
- Dependency/contract risk: none | low | medium | high | n/a
- Evidence gap: none | summary | n/a
- Human/Lead review required: no | yes, because <reason> | n/a

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

## Recommendations and mathematical trade-offs

Fill once for every substantive suggestion or option. If there is no
recommendation, write `n/a`. A single preferred option must still be compared
with the status quo or nearest feasible alternative.

- Recommendation/option:
- Objective or decision criterion:
- Constraints and assumptions:
- Baseline or alternative:
- Pros (favorable effects/deltas):
- Cons (unfavorable effects, risks, or opportunity costs):
- Evidence and uncertainty:
- Sensitivity/revision trigger:
- Dominance/Pareto note: dominates on stated dimensions | trade-off remains | unknown | n/a

## Measurement fields

Fill when LWOE measurement is enabled for this project or session. Otherwise
write `n/a`.

Bootstrap reads already recorded in session form: yes | no | n/a
Execution mode: standard | bounded change fast path | n/a
Repo Bounded Change Profile:
Fast-path escalation: none | trigger and resulting route | n/a
Full large-file reads and reasons: none | list | n/a

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
- Semantic map impact: none | exact stable ID/row changed | unknown/blocker
- Navigation anchors added/changed: none | exact markers/symbols

Context budget pilot (fill only when enabled; semantics and thresholds are
owned by `wiki/knowledge/project-docs/work_unit_context_budget.md`):

- Session/work-unit id:
- Provider/model/tool version:
- Counter semantics known: yes | partial | no
- Work-unit start snapshot: input | direct input | output | total | reasoning | cached | n/a
- Work-unit end snapshot: input | direct input | output | total | reasoning | cached | n/a
- Work-unit delta: input | direct input | output | total | reasoning | cached | not available
- Tool-read volume and unit: lines | bytes/chars | not available
- Completed work units in session:
- Accepted outcome and owner/evidence: yes | no | pending | n/a
- Threshold crossed: none | 150k warning | 300k checkpoint | provider-specific
- File-backed checkpoint:
- Continue/restart decision and reason:

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

## Post-task distillation

Fill after human/Lead/integration-owner review passes and before Done.

- Distill: skipped | required | blocked
- Reason:
- Type: n/a | troubleshooting | pattern | decision | concept | runbook | contract-note | anti-pattern | validation-note
- Target:
- Wikilinks/index updated: yes | no | n/a
- Queue row if deferred:

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
