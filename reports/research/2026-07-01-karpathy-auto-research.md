---
name: karpathy-auto-research
description: Research brief for "Karpathy auto research", deep research agents, and LLM-Wiki auto-research boundaries.
date_updated: 2026-07-01
status: promoted
---

# Karpathy Auto Research / Deep Research Agents

Topic: "Karpathy auto research" and what LLM-Wiki should add

Date: 2026-07-01

Owner: Codex

Cadence reason: human-requested research-on-request

Status: promoted

## decision need

- What decision or guideline may change: whether LLM-Wiki should support
  autonomous/deep research agents and how to bound them.
- Target docs if promoted: `harness/auto-research.md`,
  `wiki/knowledge/ai-agent-rag-mcp/`, `research/watchlist.md`.

## sources checked

| Source | Type | Date published/accessed | Relevance | Notes |
| --- | --- | --- | --- | --- |
| https://arxiv.org/abs/2508.12752 | research survey | 2025-08-18 / accessed 2026-07-01 | Deep research agents | Describes deep research as planning, question developing, web exploration, and report generation. |
| https://arxiv.org/abs/2512.02038 | research survey | 2025-11-24 / accessed 2026-07-01 | Deep research systems | Frames deep research around query planning, information acquisition, memory management, and answer generation. |
| https://arxiv.org/abs/2602.22401 | research/commentary | 2026-03-07 / accessed 2026-07-01 | Vibe researching | Describes AI agents with skills executing research pipelines and emphasizes tacit-knowledge limits. |
| https://www.businessinsider.com/andrej-karpathy-ai-agents-timelines-openai-2025-10 | news/interview report | 2025-10 / accessed 2026-07-01 | Karpathy caution | Reports Karpathy's skepticism about current autonomous agents and preference for human-AI collaboration. |
| https://www.itpro.com/technology/artificial-intelligence/agentic-ai-hype-openai-andrej-karpathy | news/interview report | 2025-10 / accessed 2026-07-01 | Karpathy caution | Similar report on agent hype and current limitations. |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| "Karpathy auto research" is not a stable official term found in this search. | high | no-change | Naming LLM-Wiki guidance. | N/a |
| Deep research is a real emerging pattern: planning, subquestioning, source acquisition, memory/source management, synthesis, and evaluation. | high | candidate-update | Research-on-request and AI/RAG/MCP pack. | Single-source lookup or exact file read. |
| Karpathy-style caution argues against over-trusting current autonomous agents; use collaboration, source visibility, and human checkpoints. | medium | candidate-update | LLM-Wiki auto research governance. | Low-risk brainstorming with no canonical promotion. |
| Vibe researching suggests skilled agents can scaffold research pipelines, but tacit knowledge and originality remain human/domain limits. | medium | watch/candidate-update | Role packs and domain research. | Pure technical source refresh with official docs. |

## impact on LLM-Wiki

- Canonical docs to update:
  - `harness/auto-research.md`
  - `wiki/knowledge/ai-agent-rag-mcp/autonomous-research-agents.md`
  - `wiki/knowledge/ai-agent-rag-mcp/README.md`
  - `research/watchlist.md`
- Templates/harness files to update: no template change in this pass.
- Project docs affected: LLM-Wiki status/tasks/test matrix.
- Agent workflow affected: auto research remains human-requested and
  promotion-gated; deep research gets a bounded pipeline.

## proposed change

- Add `autonomous-research-agents.md` under the AI/RAG/MCP pack.
- Update `harness/auto-research.md` to require scoped question, subquestions,
  conflict/stale/unsupported-inference checks, and bounded autonomy.
- Add a watchlist row for deep research/autonomous research agents.

## validation plan

- Run `bash harness/feedback-loop-lint.sh`.
- Create validation report.

## reviewer decision

- Decision: promote
- Reason: findings are useful and consistent with existing LLM-Wiki
  human-controlled research-on-request model.
- Validation report:
  `reports/validation/2026-07-01-karpathy-auto-research.md`

## next review

- Next cadence trigger: before broad autonomous research adoption or when
  AI-agent research/evaluation methods materially change.
- Watchlist row: Deep research / autonomous research agents.
