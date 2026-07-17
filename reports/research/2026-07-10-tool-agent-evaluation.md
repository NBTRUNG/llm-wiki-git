# Tool-Using Agent Evaluation Research Brief

Topic: Evaluation for tool-using agents and MCP workflows
Date: 2026-07-10
Owner: Codex research-on-request session
Cadence reason: weekly AI agents/RAG/evaluation/tool-use watchlist review
Status: promoted

## decision need

- What decision or guideline may change: define how LLM-Wiki should measure
  tool selection, external outcomes, policy compliance, repeated-run
  reliability, and cost before an agent/MCP workflow is accepted.
- Target docs if promoted:
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`, the AI/MCP pack read
  order, MCP Server testing guidance, and the MCP operations lab brief.
- Explicit exclusions: model leaderboards, choosing a vendor/model, pure RAG
  retrieval metrics, and copying a public benchmark threshold into a local
  release gate.

## search and tool bounds

- Source priority: official platform/project documentation, then primary or
  reproducible research.
- Domain intent: official OpenAI, Anthropic, Google, MCP-related research,
  arXiv, and OpenReview sources.
- Initial budget: at most 8 search queries plus targeted page opens/finds.
- Actual budget: 15 search queries. The first domain-restricted searches did
  not surface several known official documentation pages, so the cap was
  expanded to locate primary pages and MCP-specific research. No further
  search was performed after the overrun was identified.
- Source log: the web tool exposed returned result metadata and opened-page
  URLs, but not its complete crawl/ranking corpus. The log below records every
  submitted query and every page opened for evidence; search-result leads that
  were not opened were not treated as consulted evidence.

## query log

1. `site:platform.openai.com/docs evals agents tool calls trace grading official`
2. `site:docs.anthropic.com agent evaluations tool use official`
3. `site:google.github.io/adk-docs evaluate agents tool calls official`
4. `tool use agent benchmark reproducible paper tau bench arXiv`
5. `site:platform.openai.com/docs/guides "agent evals"`
6. `site:openai.github.io/openai-agents-python evals tracing official`
7. `site:docs.anthropic.com/en/docs/test-and-evaluate agents evaluation tool use`
8. `site:google.github.io/adk-docs/evaluate agent evaluation tool trajectory`
9. `Anthropic official docs define success criteria build evaluations empirical performance tool use agents`
10. `Google Agent Development Kit official docs evaluation criteria tool trajectory final response`
11. `OpenAI official agent evals trace grading datasets graders evaluations guide`
12. `site:arxiv.org MCP-Atlas large-scale benchmark real MCP servers 2602.00933`
13. `site:github.com MCP-Atlas benchmark real MCP servers`
14. `site:arxiv.org tau2-bench dual control agent tool user interaction`
15. `site:openreview.net tau2-bench tool agent user interaction`

## sources checked

| Source | Type | Date published/accessed | Relevance | Notes |
| --- | --- | --- | --- | --- |
| [OpenAI: Evaluate agent workflows](https://developers.openai.com/api/docs/guides/agent-evals) | official | accessed 2026-07-10 | traces, graders, datasets, repeatable eval runs | Supports trace-first debugging followed by dataset-based repeatability. |
| [OpenAI Agents SDK: Tracing](https://openai.github.io/openai-agents-python/tracing/) | official project docs | accessed 2026-07-10 | trace contents and privacy controls | Tool inputs/outputs can contain sensitive data; capture must be configurable. |
| [Anthropic: Demystifying evals for AI agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents) | official engineering guidance | published 2026; accessed 2026-07-10 | outcome, transcript, graders, trials, isolation, pass metrics | Most complete operational source in this pass. |
| [Claude API: Define success criteria and build evaluations](https://platform.claude.com/docs/en/test-and-evaluate/develop-tests) | official docs | accessed 2026-07-10 | measurable multidimensional criteria and grader choice | Supports code-first grading and calibration of model grading. |
| [Google Cloud: Evaluate Gen AI agents](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-agents) | official docs | updated 2026-07; accessed 2026-07-10 | response vs trajectory metrics | Documents exact, in-order, any-order, precision, and recall trajectory checks. |
| [tau-bench](https://arxiv.org/abs/2406.12045) | peer-reviewed research / ICLR 2025 | 2024-06 / accessed 2026-07-10 | state-based agent/tool/user evaluation and repeated reliability | Introduces end-state comparison and `pass^k` framing. |
| [tau2-bench](https://arxiv.org/abs/2506.07982) | research preprint | 2025-06 / accessed 2026-07-10 | dual-control user-agent environments | Useful task-shape evidence; not used as a release threshold. |
| [MCP-Atlas](https://arxiv.org/abs/2602.00933) | research preprint | 2026-01 / accessed 2026-07-10 | real MCP servers, distractor tools, multi-tool workflows | Public diagnostics are incomplete, so only general task-shape lessons were promoted. |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| External outcome/state and policy invariants must be graded separately from final prose. | high | candidate-update | Agent reads/writes files, data, APIs, or business state. | Pure text transformation has no external state or policy boundary. |
| Trace/trajectory grading is needed for tool selection, required prerequisites, approvals, and failure diagnosis. | high | candidate-update | The process or tool boundary is part of correctness. | Any of several paths is valid and only the final state matters. |
| Exact trajectory matching is useful only for mandatory sequences; flexible paths need in-order/any-order metrics or outcome grading. | high | candidate-update | Authentication, proposal-before-commit, or another ordered invariant exists. | The test would punish a valid alternative strategy. |
| Multiple isolated trials are required to distinguish first-pass success, best-of-k capability, and consistency across k attempts. | high | candidate-update | Agent output is stochastic or user-facing reliability matters. | A fully deterministic non-AI component is under test. |
| Prefer deterministic graders, then calibrated model graders, then expert review for ambiguity/high stakes. | high | candidate-update | Outcomes and schemas are inspectable. | A subjective domain judgment has no reliable programmatic oracle. |
| Public benchmarks provide task patterns, not local deployment proof. | high | candidate-update | Selecting fixtures and failure categories. | Setting local safety, latency, cost, or permission thresholds. |
| New MCP benchmark scores and failure distributions are volatile. | medium | watch | Tracking ecosystem capability. | Canonical model selection or universal release policy. |

## conflicts and resolution

- Google documents exact and flexible trajectory metrics; Anthropic warns that
  exact call sequences can reject creative valid solutions. The promoted rule
  makes exact order conditional on a workflow invariant and otherwise grades
  outcomes or flexible trajectory properties.
- MCP-Atlas uses claims-based final-answer scoring to scale across real MCP
  servers. For local mutating workflows, deterministic state and authorization
  checks remain stronger; claims scoring is a secondary option for open-ended
  informational output.
- Model graders add nuance but are non-deterministic. They are not promoted as
  sole gates and require human calibration.

## unsupported-inference and stale-source risks

- Vendor documentation describes vendor tooling as well as general practice;
  the canonical guide keeps vendor-neutral concepts and does not require a
  vendor evaluation platform.
- `pass@k` and `pass^k` assume a defined trial protocol. Shared state can make
  trials correlated, so the guide requires observed repeated runs and warns
  against deriving consistency from an average without justified independence.
- tau2-bench and MCP-Atlas are preprints. They support task shapes only, not a
  stable leaderboard claim or required threshold.
- No local agent runtime was executed in this research pass. The new guide is a
  design and acceptance contract for a later project-specific evaluation.

## impact on LLM-Wiki

- Canonical docs to update:
  `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`, AI/MCP and MCP Server
  pack maps, and MCP testing guidance.
- Templates/harness files to update: none; the existing research and validation
  workflow is sufficient.
- Project docs affected: the MCP operations lab now points to the canonical
  guide for its planned reliability measurement.
- Agent workflow affected: agent/MCP implementations must grade outcome,
  policy, trajectory where relevant, repeatability, and efficiency separately.

## promotion decision

- Decision: promote.
- Reason: the user explicitly authorized current-source research and knowledge
  publication; multiple official sources and primary research converge on the
  same operational structure, and the update fills a documented watchlist and
  MCP lab gap without imposing vendor tooling.
- Validation report:
  `reports/validation/2026-07-10-tool-agent-evaluation-knowledge.md`

## next review

- Next cadence trigger: weekly watch for breaking agent-evaluation/tool-use
  changes; substantive canonical review quarterly or before production use.
- Immediate revision triggers: model, harness, tool schema, MCP protocol,
  grader, policy, or workload distribution change.
- Watchlist row: AI agents/RAG/evaluation/tool use.

