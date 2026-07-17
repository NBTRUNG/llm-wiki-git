---
name: ai-agent-rag-mcp-pack
description: Trigger-based pack for AI agents, evaluation, OKF knowledge substrates, RAG, MCP/tool access, and agent protocol boundaries.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://cloud.google.com/vertex-ai/generative-ai/docs/rag-overview
  - https://modelcontextprotocol.io/specification/2025-06-18
  - https://a2a-protocol.org/latest/specification/
  - https://owasp.org/www-project-top-10-for-large-language-model-applications/
  - https://developers.openai.com/api/docs/guides/tools-web-search
  - https://developers.openai.com/api/docs/guides/agent-evals
  - https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents
  - https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-agents
confidence: medium
confidence_reviewed: 2026-07-10
---

# AI / Agent / RAG / MCP Pack

Use this pack when a project adds or changes AI agents, RAG, tool calling, MCP
servers/clients, prompt workflows, generated-code execution, agent handoff, or
LLM-backed knowledge search.

## Core Model

All agentic work uses the default
[Human-Agent Hybrid Control](../project-docs/human_agent_hybrid_control.md)
baseline. Human purpose, consequential permission, accountability, and
acceptance remain coupled to bounded agent analysis, execution, uncertainty
disclosure, and evidence; capability alone grants neither autonomy nor
permission.

```text
OKF / Markdown source files = canonical knowledge substrate
RAG = retrieval and grounding layer over source files and external corpora
MCP = runtime access layer for tools, resources, prompts, roots, and sampling
A2A / agent protocols = agent-to-agent collaboration layer
```

Do not treat vector search, MCP tools, or another agent as source of truth. The
active repo docs and OKF-style Markdown maps still define what should be read,
trusted, changed, and reported.

## Triggers

- RAG, semantic search, hybrid search, embeddings, reranking, citations, or
  grounding.
- MCP tools/resources/prompts, tool permission, filesystem/network/data access,
  or agent-side tool execution.
- Prompt templates, system/developer instructions, agent skills, generated
  code, autonomous plans, or human approval gates.
- Multi-agent delegation, A2A, external agent handoff, or agent service
  interoperability.
- AI evaluation, hallucination checks, prompt injection defense, or retrieval
  quality measurement.
- Auto/deep research runs that need source controls, citations, source logs,
  or domain-restricted current-source collection.

## Read Order

| Intent | Read |
| --- | --- |
| Govern any human-agent work | [../project-docs/human_agent_hybrid_control.md](../project-docs/human_agent_hybrid_control.md) |
| Design AI knowledge flow | [okf-knowledge-substrate.md](okf-knowledge-substrate.md) |
| Run bounded auto/deep research | [autonomous-research-agents.md](autonomous-research-agents.md), then [retrieval-evaluation.md](retrieval-evaluation.md) |
| Build or review RAG | [rag-pipeline.md](rag-pipeline.md), then [retrieval-evaluation.md](retrieval-evaluation.md) |
| Add MCP/tool access | [mcp-tool-resource-contracts.md](mcp-tool-resource-contracts.md), then [trust-safety-permissions.md](trust-safety-permissions.md) |
| Build or review MCP server | [../mcp-server/README.md](../mcp-server/README.md) |
| Evaluate a tool-using agent or MCP workflow | [agent-evaluation.md](agent-evaluation.md), then the project-specific test/evidence plan |
| Assign an agent capability/autonomy tier or knowledge projection | [../project-docs/agent_capability_tiers.md](../project-docs/agent_capability_tiers.md), then [agent-evaluation.md](agent-evaluation.md) |
| Coordinate agents | [agent-protocol-boundaries.md](agent-protocol-boundaries.md) |
| Security-sensitive AI work | [trust-safety-permissions.md](trust-safety-permissions.md), then [../security-privacy/README.md](../security-privacy/README.md) |

## Required Output

AI/RAG/MCP work must report:

```text
Knowledge source of truth:
Retrieval/tool boundary:
Permissions and consent:
Prompt/context injection risks:
Unsupported inference controls:
Evaluation or test evidence:
Outcome, policy, trajectory, reliability, and efficiency measures:
Audit/logging and privacy notes:
Human approval gates:
Human sponsor and accountability owner:
Risk lane, autonomy bound, and permission grant:
Interrupt and rollback route:
Human over-delegation or agent over-escalation risk:
Search/tool bounds and source log:
```

## Anti-Patterns

- Starting from vector search before checking OKF entrypoints and project maps.
- Running autonomous research without a scoped question, source priority, and
  promotion gate.
- Treating MCP tool descriptions as proof of safe behavior.
- Grading a state-changing agent only by its final prose or one successful demo.
- Letting an agent mutate files, data, or production resources without explicit
  permission and audit trail.
- Using citations that point to retrieved chunks but do not support the answer.
- Letting another agent's summary override source files or repo decisions.
