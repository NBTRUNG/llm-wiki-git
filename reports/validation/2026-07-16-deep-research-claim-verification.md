# Deep Research Claim Verification Validation

Date: 2026-07-16

Scope: Refresh claim verification, research-agent evaluation, and stopping
controls for bounded auto-research.

Task/story: LLMWIKI-089

Validator: Codex

## source

- Project: LLM-Wiki
- Source of truth:
  `wiki/knowledge/ai-agent-rag-mcp/autonomous-research-agents.md`,
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`, and
  `harness/auto-research.md`.
- Research brief:
  `reports/research/2026-07-16-deep-research-claim-verification.md`.
- Raw/source-log boundary: no raw snapshot was written outside LLM-Wiki; the
  research brief records all opened evidence sources and notes that the web
  result stream did not expose a reliable complete export because it was
  truncated.
- Commit/build/version: local Markdown workspace.

## commands run

```text
bash harness/feedback-loop-lint.sh
targeted rg/readback of promoted sections, task/test/status rollups, and report indexes
```

## results

| Check | Result | Notes |
| --- | --- | --- |
| Source quality/support | passed | Four original papers/preprints and three official research/product sources checked; vendor rankings and unsupported thresholds excluded. |
| Claim-evidence contract | passed | Accessibility, relevance, support strength, freshness/conflict, and cited/uncited claims remain separate. |
| Stop rule | passed | Search expansion requires a named unresolved claim and expected evidence value; no universal call cap was promoted. |
| Evaluation boundary | passed | Scope, acquisition, claim support, synthesis, control, and efficiency are independent dimensions. |
| Workflow/template projection | passed | Canonical knowledge owns detail; harness/template contain only execution fields. |
| Wiki lint/link validation | passed | `0 failure(s), 0 warning(s)`; 528 active wikilinks and 612 Markdown links resolved. |

## gaps

- Tests not run: no repeated local research-agent evaluation suite exists.
- Residual risk: recent benchmark papers are preprints; vendor-affiliated task
  distributions may not represent LLM-Wiki runs.
- Empirical status: static promotion passed; effectiveness and reporting cost
  remain `needs-review` until 3-5 natural research runs use the ledger and stop
  record.

## decision

- implemented; empirical effectiveness needs-review
- Roll back the mandatory ledger projection if natural runs show material
  overhead without catching unsupported or overstated claims; retain the
  underlying citation-support principle.
