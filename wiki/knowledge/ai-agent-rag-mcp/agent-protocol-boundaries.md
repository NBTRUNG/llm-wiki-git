---
name: agent-protocol-boundaries
description: Boundary guidance for A2A, MCP, RAG, and local agent delegation.
date_ingested: 2026-07-01
date_updated: 2026-07-16
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://a2a-protocol.org/latest/specification/
confidence: medium
confidence_reviewed: 2026-07-01
---

# Agent Protocol Boundaries

Use this guide when agents delegate work to other agents or external agent
services.

## Boundary Model

```text
RAG answers questions from knowledge sources.
MCP lets an agent use tools/resources.
A2A-style protocols let agents coordinate with other agents.
Repo task packets and OKF files decide authority.
```

## Agent Handoff Rules

- Name the sending agent, receiving agent, task, authority, and write boundary.
- Name the human sponsor/acceptance owner, action-risk lane, permission grant,
  verifier, grant expiry/review trigger, and interrupt/rollback routes.
- Include exact source files and expected output.
- Do not let a remote agent change source-of-truth docs unless the repo process
  grants it a claim and write boundary.
- Treat remote-agent output as a proposal until reviewed against source files.
- Record conflicts, assumptions, and unsupported claims.
- Do not let a receiver inherit the sender's whole privilege set, self-upgrade,
  or subdelegate without an explicit bounded grant.
- Multi-agent agreement is supporting evidence, not permission, human
  acceptance, or proof of correctness.

## Use A2A-Style Coordination When

- another agent owns a capability or long-running task;
- the agent needs status/progress from another worker;
- the work has artifacts, subtasks, or handoff state.

Do not add agent protocol complexity for a local file read, a simple tool call,
or a single-agent coding task.
