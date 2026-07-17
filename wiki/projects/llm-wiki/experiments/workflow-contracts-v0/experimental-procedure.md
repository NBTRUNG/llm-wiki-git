# Workflow Contract Empirical Procedure

Status: experiment procedure; not canonical workflow.

Use this procedure to test whether workflow contracts reduce real workflow
drift without adding more maintenance cost than they remove.

## Purpose

The experiment answers one question:

```text
Does a tiny machine-readable workflow contract catch important drift better
than a lightweight Markdown checklist, with acceptable maintenance cost?
```

The contract is not the source of truth. Canonical workflow Markdown remains the
source of truth.

## Roles

| Role | Responsibility |
| --- | --- |
| Human/integration owner | Approves experiment scope and promotion decisions |
| Evaluating agent | Runs the procedure and writes the report |
| Workflow owner | Reviews whether contract fields still match canonical Markdown |
| Optional auditor/checker | Consumes contract `drift_checks` only, if ROI is clear |

## Inputs

Required:

- canonical workflow Markdown under `workflows/`
- one contract under `contracts/`
- one positive fixture where drift should be detected
- one negative fixture where no drift should be reported
- previous validation or real project evidence for the fixture

Optional:

- small checker that reads only `drift_checks`
- real repo documents from a target project
- human notes from a failed or ambiguous agent session

## Experiment Steps

1. Name the workflow and fixture.
   Record the workflow ID, canonical Markdown path, contract path, and fixture
   source. Do not start without a concrete drift or non-drift case.

2. Refresh from canonical Markdown.
   Read the workflow card and verify the contract still matches the workflow's
   trigger, start file, source-of-truth rule, approval gates, and evidence
   before done.

3. Run the baseline checklist review.
   Use a plain Markdown checklist or human review against the canonical
   workflow. Record whether it detects the same drift and how long it takes.

4. Run the contract review.
   Use manual fixture review first. A checker is allowed only when it consumes
   `drift_checks` and does not require broad workflow backfill.

5. Classify the result.
   Record true positive, true negative, false positive, or false negative.
   Explain the evidence in one or two paragraphs.

6. Measure maintenance cost.
   Count files that would need edits if the canonical workflow changed. Include
   workflow Markdown, contract JSON, fixtures, checker code, templates, report
   indexes, and project-local docs.

7. Compare against the checklist.
   Decide whether the contract found something the checklist missed, reduced
   ambiguity, or only duplicated the checklist.

8. Record blast radius.
   Identify whether ordinary agent sessions must read new files. If yes, the
   experiment should stop unless the benefit is materially higher than the
   added read cost.

9. Decide.
   Use one of:

   - discard
   - revise and keep as experiment evidence
   - keep as optional auditor input
   - promote only after new approval and validation

## Required Test Set

Minimum empirical set before any promotion:

| Case | Purpose | Required result |
| --- | --- | --- |
| Positive drift fixture | Known drift should be caught | true positive |
| Negative no-drift fixture | Correct docs should not be flagged | true negative |
| Workflow-change fixture | Canonical workflow changed after contract | maintenance cost recorded |
| Ambiguous wording fixture | Semantics are unclear | checkpoint, not silent pass |

The current v0 experiment has only the positive U17 drift fixture. It is not
enough for promotion.

## Metrics

Record:

- detection result: TP, TN, FP, FN
- files read by ordinary agent path
- files read by evaluator/auditor path
- files requiring update after workflow change
- whether remediation is named
- whether remediation touches canonical workflow or only project-local drift
- elapsed reviewer time if known
- uncertainty and human decision needed

## Promotion Gate

Do not promote unless all are true:

- at least one true positive and one true negative are demonstrated;
- contract changes remain smaller than workflow Markdown changes;
- ordinary agents do not need to read contracts during normal work;
- workflow owner accepts the maintenance plan;
- validation report names false-positive and false-negative risks;
- a real consumer exists, such as Agent Platform audit or a tiny checker.

## Stop Conditions

Stop or keep experiment-only when:

- contract duplicates runbook prose;
- contract and Markdown drift after a workflow update;
- checker flags correct docs or misses known drift;
- adoption requires backfilling many workflows;
- no owner is named for keeping contract fields current;
- ordinary repo work gains another mandatory read file;
- maintenance cost is higher than the checklist benefit.

