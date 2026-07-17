# Workflow Contract Pilot Limitations and Mitigations

Status: discussion base; not canonical policy.

This file records the weaknesses of the v0 workflow-contract pilot so the next
decision is based on known tradeoffs, not only the successful U17 drift check.

## Summary

The pilot proved one useful thing: a small contract can catch a known
read-order drift. It did not prove that contracts are worth promoting.

The main risk is source-of-truth duplication: every time canonical workflow
Markdown changes, the contract, fixtures, checker expectations, report
templates, and project-local docs may also need updates.

## Limitations

| Limitation | Why it matters | Mitigation |
| --- | --- | --- |
| Duplicate source of truth | Contracts can silently diverge from canonical Markdown. | Keep Markdown canonical; contracts are generated or reviewed from Markdown before each experiment. |
| Update burden after workflow changes | A small workflow change may require edits in workflow Markdown, contract JSON, fixtures, checker, report template, and affected repo docs. | Add a workflow-change checklist that names all dependent artifacts before Done. |
| Stale contract risk | Agents or checkers may trust outdated JSON because it looks precise. | Add `last_reviewed_against` and require validation before any checker consumes a contract. |
| False positive risk | A contract may flag acceptable wording or project-specific variation as drift. | Test negative fixtures and allow accepted aliases/variants only when documented. |
| False negative risk | Token matching may pass docs that include the right words but omit the real behavior. | Pair token checks with one human-readable intent check in the report. |
| Overfitting to U17 | The pilot used one real drift case, so success may not generalize. | Add at least one no-drift fixture and one second-project fixture before promotion. |
| Contract becomes a second runbook | Long JSON fields could duplicate the Markdown workflow and double maintenance. | Enforce small fields; put procedures in Markdown, not JSON. |
| Ordinary agents may read more files | If contracts enter normal read order, token cost and confusion increase. | Keep contracts out of ordinary read paths; only evaluators/auditors read them. |
| Ambiguous semantics | JSON fields capture structure better than intent. | Use contracts for drift checks only; keep judgment-heavy rules in Markdown and reports. |
| Checker complexity | A script can become another system to maintain and debug. | Start with manual review; script only `drift_checks`; no broad schema engine. |
| No owner model | Without an owner, nobody knows who updates contracts after workflow edits. | Assign a workflow owner in each evaluation report before promotion. |
| Backfill pressure | Once contracts exist, agents may try to backfill every workflow. | Explicitly ban broad backfill until a real auditor consumer exists. |
| Path and naming brittleness | Project docs may use equivalent paths or names that simple checks miss. | Allow documented aliases in fixtures; do not use raw token checks as final proof. |
| Report bias | Evaluators may write reports that confirm the expected result. | Require TP/TN/FP/FN classification and record what the checklist found. |
| Promotion ambiguity | A successful pilot can be mistaken for approval to adopt globally. | Promotion requires separate human approval and validation report. |

## Update-When-Changed Checklist

When any canonical workflow changes, inspect these artifacts before Done:

```text
workflows/<workflow>.workflow.md
workflow contract JSON, if one exists
experiment fixtures that cite the workflow
checker expectations, if any
empirical evaluation report template
reports/validation/README.md, if new validation is added
TICK.md / active.md / current_direction.md, if live direction changes
project-local AGENTS.md / REPO_RULES.md / TICK.md / operating guides that copy the route
```

If more than three downstream files require edits for a small workflow change,
the contract design is probably too costly and should stay experiment-only.

## Mitigation Strategy

Near-term:

- keep contracts out of normal agent read order;
- add one no-drift fixture before any checker work;
- use manual empirical reports for the next two runs;
- list maintenance cost every time a workflow changes.

Medium-term:

- add metadata fields only if needed:
  `contract_version`, `last_reviewed_against`, `canonical_hash`, and
  `owner`;
- build a tiny checker only for `drift_checks`;
- require a second project fixture before promotion.

Do not:

- replace workflow Markdown with contracts;
- backfill every workflow;
- make contracts mandatory for ordinary repo work;
- build an API/MCP layer for this pilot.

