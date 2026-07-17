# Workflow Contracts v0 Result

Date: 2026-07-09
Task: LLMWIKI-061
Status: experiment complete; not canonical

## Scope

Built a branch-like experiment under:

`wiki/projects/llm-wiki/experiments/workflow-contracts-v0/`

The pilot contracts only:

- `workflows/real-repo-work.workflow.md`
- `workflows/bug-fix-investigation.workflow.md`

## Checks

| Check | Result |
| --- | --- |
| Contract draft is smaller than the Markdown workflow | Pass |
| Contract does not replace canonical workflow Markdown | Pass |
| Contract detects U17 read-order drift | Pass |
| Contract names remediation without editing canonical workflows | Pass |
| Ordinary repo work does not require extra contract reads | Pass |
| Result compares against a lighter checklist | Pass |

## U17 Drift Detection

The `real-repo-work` contract includes drift check
`read-order-includes-workflow-route`.

Required route tokens:

```text
AGENTS.md
workflows/catalog.md
workflows/real-repo-work.workflow.md
REPO_RULES.md
TICK.md
assigned task packet
```

The fixture `fixtures/u17-read-order-drift.before.md` omits:

```text
workflows/catalog.md
workflows/real-repo-work.workflow.md
```

Verdict: the contract catches the same drift found by the U17 Phase 1
evaluation and names the same remediation later applied by
`U17-WORKFLOW-DRIFT-013`.

## Contract Versus Checklist

The contract is better when an auditor or script needs stable fields:

- required reads
- forbidden writes
- approval gates
- evidence before done
- drift checks

A lighter Markdown checklist is better for ordinary agent sessions because it
adds no new file to the normal read path and is cheaper to maintain.

## Decision

Decision: **revise before promotion**.

Keep the v0 contracts as experiment evidence and optional future auditor input.
Do not promote them to canonical workflow obligations yet.

Next useful step, if this continues, is a tiny read-order drift checklist or a
small checker that consumes only `drift_checks` from these contracts. Do not
backfill every workflow unless a real Agent Platform/auditor consumer is
identified.

