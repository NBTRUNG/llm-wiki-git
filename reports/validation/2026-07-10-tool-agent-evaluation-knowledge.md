# LLMWIKI-077 Tool-Using Agent Evaluation Knowledge Validation

Date: 2026-07-10
Scope: Promote current-source guidance for evaluating tool-using agents and MCP workflows.
Task/story: LLMWIKI-077
Validator: Codex

## source

- Project: LLM-Wiki
- Source-of-truth files:
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md` and
  `reports/research/2026-07-10-tool-agent-evaluation.md`
- Commit/build/version: local Markdown workspace; no Git repository detected at
  `/home/admindebian/LLM-Wiki`

## changed files

- `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`
- `wiki/knowledge/ai-agent-rag-mcp/README.md`
- `wiki/knowledge/mcp-server/README.md`
- `wiki/knowledge/mcp-server/testing-and-operations.md`
- `wiki/knowledge/README.md`
- `wiki/projects/llm-wiki/docs/mcp_operations_lab_brief.md`
- `reports/research/2026-07-10-tool-agent-evaluation.md`
- `reports/research/README.md`
- `reports/validation/README.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `wiki/projects/llm-wiki/docs/current_direction.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `active.md`
- `TICK.md`

## commands run

```text
bash harness/feedback-loop-lint.sh
targeted rg/readback checks for LLMWIKI-077 and agent-evaluation routes
```

## results

| check | result | notes |
| --- | --- | --- |
| Source quality and support | passed | Official OpenAI, Anthropic, and Google guidance plus primary tau-bench/tau2-bench/MCP-Atlas research were checked. |
| Scope and exclusions | passed | One watchlist topic; model leaderboards, vendor selection, and pure RAG metrics excluded. |
| Outcome and policy gates | passed | Canonical guide makes external state and permission/safety invariants primary. |
| Trajectory metric choice | passed | Exact, in-order, any-order, precision/recall, and outcome-only cases are distinguished. |
| Repeated-trial reliability | passed | Separates `pass@1`, `pass@k`, `pass^k`, isolation, and correlated-trial risk. |
| Cost/privacy/operations | passed | Records latency, tokens/cost, calls/retries, trace redaction, retention, rollback, and review triggers. |
| Pack and project routing | passed | AI/MCP pack, MCP Server pack/testing guide, knowledge catalog, and MCP lab brief point to the guide. |
| Wiki lint/link validation | passed | `0 failure(s), 1 warning(s)`; 501 active wikilinks and 440 Markdown links resolved, and all confidence-tagged knowledge/concept files have `confidence_reviewed`. |

## evidence

- Research brief: `reports/research/2026-07-10-tool-agent-evaluation.md`
- Canonical guide:
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`
- URLs: recorded with query/tool bounds in the research brief.
- Reviewer note: the current user request explicitly authorized research and
  knowledge publication; no separate WAP proposal was required.

## gaps

- Tests not run: no model, agent harness, MCP server, or local operations lab
  exists in this workspace to run the proposed suite against.
- Known issue: the initial 8-query search cap expanded to 15 after restricted
  searches missed official pages; the deviation is explicit in the brief.
- Non-blocking lint warning: the existing three reviewed source records under
  `raw/research/` trigger the generic raw-holding-area reminder. This task did
  not create or modify a raw source file.
- Existing coordination debt: `TICK.md` remains above the entry-file line
  budget because it retains prior release claims/checkpoints. Trimming that
  history is a separate governance cleanup, not part of this knowledge topic.
- Residual risk: vendor guidance can reflect vendor tooling, tau2-bench and
  MCP-Atlas are preprints, and public benchmark tasks do not represent local
  permissions, data, latency, hardware, or workload distribution.

## decision

- implemented
