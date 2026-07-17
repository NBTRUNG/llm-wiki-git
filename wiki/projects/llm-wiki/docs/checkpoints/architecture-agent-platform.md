# Architecture / Agent Platform Checkpoint

Status: active  
Last updated: 2026-07-07

## current position

LLM-Wiki and Agent Platform are separate by source-of-truth role:

- LLM-Wiki: canonical Markdown knowledge, workflows, templates, maps, and
  validation reports.
- Agent Platform: raw snapshots, derived indexes, WAP proposals, gateway
  scripts, machine-readable maps, and audit events.

## current implementation

```text
/home/admindebian/Agent-Platform/
  raw/projects/<project-id>/
  wap/proposals/
  wap/approved/
  wap/rejected/
  audit/events.jsonl
  gateway/llmwiki_auditor.py
  gateway/tool_contracts.md
  maps/llm-wiki-evidence-auditor.map.json
  agents/llm-wiki-auditor.agent.md
```

Gateway is currently a local Python script, not a REST API, MCP server, or
persistent service.

## already done

- Raw runtime moved outside LLM-Wiki.
- LLM-Wiki root keeps only an Agent Platform pointer.
- U17 raw namespace exists:
  `/home/admindebian/Agent-Platform/raw/projects/universityweb-u17/`.
- Evidence auditor pilot can snapshot selected LLM-Wiki files and write WAP
  proposals without mutating canonical Markdown.

## not done yet

- No web/API gateway.
- No MCP interface.
- No persistent worker runtime.
- No generic schema for agent errors or workflow effectiveness.

## do not repeat

- Do not store raw snapshots or derived JSONL inside LLM-Wiki.
- Do not make Agent Platform the canonical source for Markdown knowledge.
- Do not build API/MCP before defining a small schema and ROI.

## next likely step

Define small JSONL schemas for `agent_error_cases` and
`workflow_effectiveness`, then decide if a gateway extension is worth building.

## evidence

- `/home/admindebian/Agent-Platform/README.md`
- `agent-platform/README.md`
- `reports/validation/2026-07-06-agent-platform-externalization.md`
- `reports/validation/2026-07-07-human-checkpoint-u17-deployment-pointer.md`
