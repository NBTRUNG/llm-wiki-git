# Workflow Contract Experimental Procedure Validation

Date: 2026-07-09
Task: LLMWIKI-061 follow-up

## Scope

Add repeatable empirical guidance for testing workflow contracts and capture the
known weaknesses of the v0 pilot for deeper discussion.

## Files Changed

- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/experimental-procedure.md`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/templates/empirical-evaluation-report.template.md`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/limitations-and-mitigations.md`
- `wiki/projects/llm-wiki/experiments/workflow-contracts-v0/README.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## Validation

- The procedure keeps canonical Markdown workflows as source of truth.
- The report template requires baseline checklist comparison, contract result,
  TP/TN/FP/FN classification, maintenance-cost accounting, and explicit
  decision.
- The limitations file records update burden, stale contract risk, false
  positives, false negatives, overfitting to U17, ordinary read-path cost, and
  promotion ambiguity.
- The update-when-changed checklist names workflow Markdown, contract JSON,
  fixtures, checker expectations, templates, validation indexes, live state,
  and project-local route copies.

## Verdict

Pass. The experiment now has a repeatable empirical procedure and a report
template. The pilot remains non-canonical until separate approval and validation.

