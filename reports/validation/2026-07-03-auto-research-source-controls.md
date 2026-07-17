---
name: auto-research-source-controls
description: Validation record for tightening LLM-Wiki auto-research around search/tool bounds, source logs, and citation support checks.
date_updated: 2026-07-03
status: accepted
---

# Auto Research Source Controls Validation

## Scope

Ran the human-requested auto-research loop for the watchlist topic
`Deep research / autonomous research agents`, focusing on source controls,
tool/search budgets, domain filtering, source metadata, citations, and bounded
promotion.

## Decision

Promoted a narrow guidance update:

```text
auto research run
  -> scoped question
  -> source priority
  -> search/tool bounds
  -> complete source log when available
  -> citation-support check
  -> candidate/promoted update only through validation
```

This does not change the core LLM-Wiki stance: auto research remains
human/task-authorized and advisory until promoted through validation.

## Updated

- `harness/auto-research.md`
- `wiki/knowledge/ai-agent-rag-mcp/autonomous-research-agents.md`
- `wiki/knowledge/ai-agent-rag-mcp/README.md`
- `reports/research/2026-07-03-auto-research-source-controls.md`
- `reports/research/README.md`
- `reports/validation/README.md`
- `TICK.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`

## Validation

- LLM-Wiki lint/link check: `bash harness/feedback-loop-lint.sh` passed with
  0 failures and 0 warnings.
