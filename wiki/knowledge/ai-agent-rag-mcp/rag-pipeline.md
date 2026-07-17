---
name: rag-pipeline
description: RAG pipeline guidance for ingestion, chunking, embedding, indexing, retrieval, reranking, grounding, and generation.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://cloud.google.com/vertex-ai/generative-ai/docs/rag-overview
  - https://docs.cloud.google.com/gemini-enterprise-agent-platform/build/rag-engine/rag-overview
  - https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base.html
  - https://learn.microsoft.com/en-us/azure/search/retrieval-augmented-generation-overview
  - https://arxiv.org/abs/2410.05983
  - https://arxiv.org/abs/2602.03442
  - https://arxiv.org/abs/2603.07379
  - https://arxiv.org/abs/2605.05538
confidence: medium
confidence_reviewed: 2026-07-06
---

# RAG Pipeline

Use this guide when designing or reviewing retrieval-augmented generation.

## Pipeline

```text
source inventory
  -> source-of-truth classification
  -> ingestion
  -> transformation and chunking
  -> metadata
  -> embedding/indexing
  -> retrieval
  -> filtering/reranking
  -> grounded generation
  -> citation and evaluation
```

## Design Checks

- Name the corpus and owner before indexing.
- Keep source metadata: path, title, section, version/date, source type,
  canonical/historical/raw status, permissions, and freshness.
- Chunk by semantic boundaries: headings, records, API operations, schema
  objects, task packets, or workflow cards.
- Use metadata filters for project, source type, date, status, tenant, language,
  and sensitivity.
- Use reranking when initial retrieval is broad, ambiguous, or high stakes.
- Keep unsupported inference out of final answers. If the source only implies a
  conclusion, label it as inference.

## Can a model replace RAG?

No, not for enterprise source-of-truth work. Stronger long-context and reasoning
models can reduce RAG usage when the corpus is small, exact files are named, the
data is static enough, and the agent can read the canonical files directly. They
do not replace retrieval when the system needs freshness, permissions,
citations, audit, source hierarchy, cost control, or multi-source governance.

Use direct context or exact file reads when:

- the user names exact files or records;
- the source set is small enough to read fully;
- permission and freshness are inherited from the file/tool boundary;
- the answer requires no broad discovery.

Use RAG or agentic retrieval when:

- users ask open-ended questions across many documents;
- data changes frequently or comes from multiple systems;
- answers need citations and source traceability;
- access control must be enforced at query time;
- retrieval logs, audit, and reproducible evidence are required;
- token budget or latency makes full-context loading impractical.

## Agentic Retrieval

Modern RAG is moving from one-shot vector search toward agentic retrieval:
query planning, multiple focused subqueries, parallel search, document
navigation, sufficiency checks, structured grounding data, citations, and
execution metadata. This can improve relevance for complex enterprise questions,
but it adds new failure modes: compounding unsupported inference, retrieval
misalignment, memory poisoning, cascading tool errors, higher latency, and
higher cost.

For agentic retrieval, require:

```text
Corpus owner:
Permission model:
Retrieval tools:
Query planning budget:
Citation/support rule:
Audit events:
Trace/metric fields:
Evaluation set:
Fallback path:
```

## Do Not Use RAG When

- the task names exact files and the agent can read them directly;
- the answer depends on source-of-truth hierarchy that retrieval may blur;
- the corpus is too small for search to add value;
- permission boundaries cannot be represented in retrieval metadata.
- citations, audit logs, and retrieval quality cannot be validated.
