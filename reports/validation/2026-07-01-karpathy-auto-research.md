---
name: karpathy-auto-research
description: Validation record for adding bounded autonomous/deep research agent guidance to LLM-Wiki.
date_updated: 2026-07-01
status: accepted
---

# Karpathy Auto Research Validation

## Scope

Researched "Karpathy auto research" and related deep-research/autonomous
research agent patterns, then added bounded research-agent guidance to
LLM-Wiki.

## Decision

No stable official term named "Karpathy auto research" was found. The practical
LLM-Wiki update is:

```text
auto research = bounded deep research
  not background autonomous browsing
  not direct canonical rewriting
  not replacement for human/domain judgment
```

## Updated

- `wiki/knowledge/ai-agent-rag-mcp/autonomous-research-agents.md`
- `wiki/knowledge/ai-agent-rag-mcp/README.md`
- `harness/auto-research.md`
- `research/watchlist.md`
- `reports/research/2026-07-01-karpathy-auto-research.md`
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
