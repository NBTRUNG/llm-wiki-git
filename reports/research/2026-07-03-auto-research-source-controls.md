---
name: auto-research-source-controls
description: Research brief for current auto/deep research source controls, tool bounds, citations, and promotion implications for LLM-Wiki.
date_updated: 2026-07-03
status: promoted
---

# Auto Research Source Controls

Topic: Deep research / autonomous research agents

Date: 2026-07-03

Owner: Codex

Cadence reason: human-requested research-on-request

Status: promoted

## decision need

- What decision or guideline may change: whether LLM-Wiki auto-research should
  require explicit search/tool bounds, domain constraints, and complete source
  logs in addition to inline citations.
- Target docs if promoted: `harness/auto-research.md`,
  `wiki/knowledge/ai-agent-rag-mcp/autonomous-research-agents.md`,
  `wiki/knowledge/ai-agent-rag-mcp/README.md`.

## sources checked

| Source | Type | Date published/accessed | Relevance | Notes |
| --- | --- | --- | --- | --- |
| https://openai.com/index/introducing-deep-research/ | official | 2025-02-02, updated through 2026-02-10 / accessed 2026-07-03 | OpenAI deep research product and limitations | Deep research uses multi-step browsing/tool use; OpenAI notes hallucination, authority-ranking, citation-format, and uncertainty-calibration limits. |
| https://developers.openai.com/api/docs/guides/tools-web-search | official docs | accessed 2026-07-03 | Web search source controls | Documents domain filtering and the `sources` field for complete consulted URLs beyond inline citations. |
| https://openai.github.io/openai-agents-python/ | official docs | accessed 2026-07-03 | Agent runtime controls | Agent SDK exposes guardrails, human-in-the-loop, tracing, handoffs, MCP tools, and sessions. |
| https://platform.claude.com/docs/en/agents-and-tools/tool-use/web-search-tool | official docs | accessed 2026-07-03 | Web search bounds | Documents current-info search triggers, `max_uses`, domain filters, caller controls, and response inclusion controls. |
| https://ai.google.dev/gemini-api/docs/google-search | official docs | accessed 2026-07-03 | Grounded citations | Documents search call/result records and inline URL citation annotations. |
| https://arxiv.org/abs/2606.15367 | research preprint | 2026-06-13 / accessed 2026-07-03 | Deep research agent capabilities | Recent deep-research work argues search-only datasets under-cover evidence integration, synthesis, planning, file understanding, report writing, and skills usage. |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| Current deep-research tooling increasingly exposes domain filters, search/tool budgets, and source metadata. LLM-Wiki should require agents to declare these controls when available. | high | candidate-update | Human-requested auto-research, volatile or high-stakes source refresh, official-source runs. | Simple direct lookup from a single user-provided source. |
| Inline citations are insufficient audit evidence by themselves. Where a tool exposes all consulted URLs, source logs should record complete source metadata, not only cited snippets. | high | candidate-update | Research briefs and promoted canonical updates. | Tools that do not expose complete consulted-source logs. |
| Agent runtimes are converging on guardrails, tracing, human-in-the-loop, sessions, handoffs, and MCP/tool controls. This supports LLM-Wiki's bounded-autonomy stance rather than direct autonomous promotion. | high | no-change/candidate-update | Auto-research and AI/RAG/MCP agent workflows. | Low-risk brainstorming with no file-back. |
| Recent deep-research research still treats high-quality research as more than search: evidence integration, synthesis, planning, file understanding, structured reporting, and verification all matter. | medium | no-change | Deep research guidance and evaluation. | Basic current-fact lookup. |

## impact on LLM-Wiki

- Canonical docs to update:
  - `harness/auto-research.md`
  - `wiki/knowledge/ai-agent-rag-mcp/autonomous-research-agents.md`
  - `wiki/knowledge/ai-agent-rag-mcp/README.md`
- Templates/harness files to update: no template structure change; the existing
  research brief template is sufficient.
- Project docs affected: LLM-Wiki status/tasks/test matrix.
- Agent workflow affected: auto-research runs must record search/tool bounds,
  source-domain constraints, and complete source logs when the research tool
  exposes them.

## proposed change

- Add explicit search/tool bounds and domain constraints to the auto-research
  workflow.
- Add complete source-log expectation where tools expose source metadata.
- Update bounded autonomous-research guidance to treat citations as support
  pointers, not proof unless they actually support the claim.

## validation plan

- Run `bash harness/feedback-loop-lint.sh`.
- Create validation report.

## reviewer decision

- Decision: promote
- Reason: the finding is source-backed, narrow, operational, and aligns with
  existing human-controlled research-on-request governance.
- Validation report:
  `reports/validation/2026-07-03-auto-research-source-controls.md`

## next review

- Next cadence trigger: before broad autonomous research adoption, before
  high-stakes/security source refresh, or when major agent/search APIs change
  citation/source controls.
- Watchlist row: Deep research / autonomous research agents.
