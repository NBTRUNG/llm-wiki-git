# Workflow Contract Empirical Evaluation Report

Date: YYYY-MM-DD
Evaluator:
Workflow:
Contract:
Fixture:
Status: draft

## Question

What concrete drift or non-drift behavior is this run testing?

## Scope

- Canonical workflow:
- Contract file:
- Fixture source:
- Checker used: none / manual / script path
- Promotion allowed in this run: no

## Active Knowledge Set

- Base files read:
- Workflow files read:
- Contract files read:
- Evidence files read:
- Files intentionally not read:

## Baseline Checklist Result

| Item | Result | Evidence |
| --- | --- | --- |
| Trigger matched | pass/fail/unclear |  |
| Start file matched | pass/fail/unclear |  |
| Source-of-truth rule matched | pass/fail/unclear |  |
| Required read order matched | pass/fail/unclear |  |
| Approval gates matched | pass/fail/unclear |  |
| Evidence before done matched | pass/fail/unclear |  |

Baseline verdict:

## Contract Result

| Drift check | Expected | Actual | Classification | Evidence |
| --- | --- | --- | --- | --- |
|  | detect/no-detect | detect/no-detect | TP/TN/FP/FN/inconclusive |  |

Contract verdict:

Classification guide:

- `TP`: known drift was detected.
- `TN`: no drift was expected and no drift was reported.
- `FP`: no drift was expected but the check reported drift.
- `FN`: known drift was expected but the check missed it.
- `inconclusive`: evidence is insufficient or the checked artifact is outside
  the test scope.
- `registry metadata stale`: the artifact appears aligned, but registry status
  still says `unchecked` or stale. Do not count this as `FP` unless the check
  incorrectly reports actual drift.

## Maintenance Cost

| Change scenario | Files that need updates | Risk |
| --- | --- | --- |
| Canonical workflow changes |  | low/medium/high |
| Project entry route changes |  | low/medium/high |
| Checker logic changes |  | low/medium/high |
| Report/template changes |  | low/medium/high |

## Contract Versus Checklist

- What the contract caught better:
- What the checklist caught better:
- What both missed:
- Whether ordinary agents need extra reads:

## Weaknesses Observed

- False positive risk:
- False negative risk:
- Stale contract risk:
- Source-of-truth duplication risk:
- Update burden:
- Ambiguity requiring human judgment:

## Decision

Choose one:

- discard
- revise and keep as experiment evidence
- keep as optional auditor input
- promote only after separate approval and validation

Decision:

## Follow-Up

- Required fixes:
- Owner:
- Validation needed:
- Promotion blocked by:
