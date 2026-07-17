---
name: okf-knowledge-substrate
description: Guidance for treating Markdown/OKF-style source files as the canonical knowledge layer before RAG, MCP, or agent collaboration.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# OKF Knowledge Substrate

Use OKF-style Markdown files as the first-class knowledge substrate for humans
and agents.

## Rule

Agents should read source-of-truth Markdown entrypoints before retrieval tools:

```text
TICK.md / task packet
  -> root/project map
  -> session pack
  -> exact repo docs/source files
  -> RAG only when search across a larger corpus is needed
  -> MCP only when runtime access to a tool/resource is needed
```

## File Expectations

Good OKF-style knowledge files expose:

- purpose and trigger;
- source-of-truth boundary;
- read order;
- when to apply and when not to apply;
- source links and review date;
- confidence level;
- validation/reporting expectations;
- related files.

## RAG Boundary

RAG over OKF files should preserve source hierarchy. A validation report,
archive note, raw source, or generated chunk does not outrank the active
project map, task packet, decision record, or canonical knowledge guide.

## MCP Boundary

MCP can expose OKF files as resources, but resource availability does not mean
the agent is authorized to use, quote, edit, publish, or infer beyond them.
Permission and source-of-truth rules remain host/repo decisions.

