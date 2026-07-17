# 2026-07-06 knowledge refresh validation

## task

LLMWIKI-054: Refresh canonical knowledge for math, programming/coding-agent
risks, algorithms, system/reliability, architecture, and the model-vs-RAG
boundary using current sources requested by the user.

## changed files

- `reports/research/2026-07-06-knowledge-refresh-math-coding-algorithms-system-architecture-rag.md`
- `wiki/knowledge/math/README.md`
- `wiki/knowledge/algorithms/README.md`
- `wiki/knowledge/ai-agent-rag-mcp/rag-pipeline.md`
- `wiki/knowledge/coding/agent-coding-risks.md`
- `wiki/knowledge/project-docs/architecture_skill.md`
- `wiki/knowledge/reliability-sre/README.md`
- `wiki/knowledge/architecture-patterns/pattern-selection-matrix.md`
- `reports/research/README.md`
- `reports/validation/README.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`

## evidence

- Current-source research recorded in
  `reports/research/2026-07-06-knowledge-refresh-math-coding-algorithms-system-architecture-rag.md`.
- WAP audit record retained in
  `agent-platform/wap/proposals/2026-07-06-knowledge-refresh-math-coding-algorithms-system-architecture-rag.md`.
- Canonical pages now carry `confidence_reviewed: 2026-07-06` where promoted.
- RAG page now states the operating rule: stronger models can reduce direct
  retrieval needs for small/exact/static contexts, but do not replace governed
  RAG for freshness, permissions, citations, audit, source hierarchy, and cost.

## workflow note

The canonical update was applied directly after the user asked to update the
knowledge. That was treated as publish approval. The follow-up clarification
showed the intended test was WAP-first. The source-of-truth rule now requires
knowledge refreshes to create a WAP proposal before canonical edits unless the
user explicitly says to apply/publish immediately.

## validation commands

```text
bash harness/feedback-loop-lint.sh
rg -n "Can a model replace RAG|agentic retrieval|LLMWIKI-054|knowledge-refresh-math-coding" wiki reports
```

## result

- `bash harness/feedback-loop-lint.sh` passed with `0 failure(s), 0 warning(s)`.
- `rg` confirmed the model-vs-RAG rule, agentic retrieval additions,
  LLMWIKI-054 task/test-matrix rows, and research/validation links are present.
