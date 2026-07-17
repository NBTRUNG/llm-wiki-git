# 2026-07-06 knowledge refresh: math, coding, algorithms, system, architecture, RAG

## scope

Human-requested current-source refresh for:

- AI-assisted mathematical reasoning;
- programming/coding-agent risk controls;
- algorithms and agentic retrieval;
- system/reliability concerns for AI/RAG/agent platforms;
- architecture boundaries for governed knowledge systems;
- whether stronger models can replace RAG.

## source log

Primary and official sources checked:

- https://docs.cloud.google.com/gemini-enterprise-agent-platform/build/rag-engine/rag-overview
- https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base.html
- https://learn.microsoft.com/en-us/azure/search/retrieval-augmented-generation-overview
- https://genai.owasp.org/llm-top-10/
- https://opentelemetry.io/docs/specs/semconv/gen-ai/
- https://csrc.nist.gov/pubs/sp/800/218/final

Research papers checked:

- https://arxiv.org/abs/2606.08728
- https://arxiv.org/abs/2410.05983
- https://arxiv.org/abs/2602.03442
- https://arxiv.org/abs/2603.07379
- https://arxiv.org/abs/2605.05538

## findings promoted

1. AI-assisted mathematical reasoning should be treated as candidate generation
   unless checked by verifier-assisted workflows, proof assistants, independent
   solvers, property tests, symbolic checks, numerical error analysis, or human
   review.
2. Agentic retrieval is an algorithmic workflow with action space, source
   hierarchy, stopping conditions, cost/latency budgets, and evaluation. It is
   not a prompt-only improvement over classic RAG.
3. Long-context models reduce some RAG use cases, but do not replace retrieval
   for enterprise source-of-truth systems that need freshness, permissions,
   citations, audit, and cost control.
4. Current managed knowledge-base products are converging on agentic retrieval:
   query planning, subqueries, multi-source retrieval, citations, metadata,
   permission filtering, gateway/tool access, and traces.
5. Coding-agent risk controls must treat retrieved context, generated docs,
   prompts, comments, web pages, and embeddings as untrusted. Policy must be
   enforced outside the model by gateway/tool contracts, least privilege,
   audit, and approval.
6. AI/RAG/agent systems need reliability signals beyond model confidence:
   citation support, retrieval quality, unsupported-answer rate, tool errors,
   policy denials, latency, token/cost budget, and human correction rate.

## canonical files updated

- `wiki/knowledge/math/README.md`
- `wiki/knowledge/algorithms/README.md`
- `wiki/knowledge/ai-agent-rag-mcp/rag-pipeline.md`
- `wiki/knowledge/coding/agent-coding-risks.md`
- `wiki/knowledge/project-docs/architecture_skill.md`
- `wiki/knowledge/reliability-sre/README.md`
- `wiki/knowledge/architecture-patterns/pattern-selection-matrix.md`

## decision

Promote concise reusable rules into canonical knowledge. Do not create a broad
vendor overlay yet; these findings are cross-vendor and support the local
phase-1 governed knowledge foundation.
