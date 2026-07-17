# DEC-0003 - Adopt the LLM-Wiki Agent Delivery Workflow

- **Status:** accepted
- **Date drafted:** 2026-07-11
- **Date accepted:** 2026-07-11
- **Source project:** llm-wiki (governance)
- **Class:** architecture and naming decision
- **Approval owner:** human owner in the 2026-07-11 session

## context

The six-layer model existed across `current_direction.md`, Agent Platform
checkpoints, source-of-truth rules, workflow cards, and MCP concept notes. The
human had to restate whether Raw, LLM-Wiki, shared workflows, repo-local
workflows, Gateway/API, MCP, and workers belonged to the same model.

Terms such as `6 khung`, `6 tầng`, architecture, pipeline, and workflow were
used inconsistently.

## decision

Adopt **LLM-Wiki Agent Delivery Workflow** as the canonical name and
**Quy trình giao việc cho Agent của LLM-Wiki** as the Vietnamese name.

Define it as a six-layer, human-governed agentic workflow:

```text
Evidence -> Approval -> Knowledge -> Guidance -> Orchestration -> Execution
```

The canonical model lives in
`wiki/knowledge/project-docs/agent_delivery_workflow.md`. Root `index.md`
contains only the compact name, flow, boundary summary, and pointer.

## boundaries accepted

- Agent Platform owns active raw/evidence, WAP, gateway runtime, and audit.
- LLM-Wiki owns reusable knowledge and shared cross-project workflow guidance.
- Real repos own implementation state and project-specific workflows.
- Gateway may evolve from local script to API/Agent Host only after schema,
  consumer, security, and ROI gates pass.
- MCP is a runtime capability adapter around services, not the source of truth,
  workflow owner, or business-logic layer.

## consequences

- New documents use the canonical name instead of `6 khung`.
- Small projects can implement the six layers with Markdown and filesystem
  evidence; they do not need premature API/MCP infrastructure.
- Workflow evaluation captures measurements during execution and adds human
  acceptance after handoff.
- Existing real repos are not automatically backfilled.

## evidence and uncertainty

The model consolidates already implemented boundaries, but API Gateway, Agent
Platform MCP runtime, database-backed raw storage, and persistent workers do
not exist yet. Their implementation requires separate architecture decisions.

## review condition

Review after the first U17 small-task evaluation set, or when a real API/MCP
runtime is proposed.

