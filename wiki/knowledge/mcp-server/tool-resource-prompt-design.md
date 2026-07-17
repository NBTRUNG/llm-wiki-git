---
name: mcp-tool-resource-prompt-design
description: Design rules for MCP tools, resources, prompts, schemas, and outputs.
date_ingested: 2026-07-10
status: active
source_type: current-source research + distilled practice
source_urls:
  - https://modelcontextprotocol.io/specification/2025-06-18/server/tools
  - https://modelcontextprotocol.io/specification/2025-06-18/server/resources
  - https://modelcontextprotocol.io/specification/2025-06-18/server/prompts
confidence: medium
confidence_reviewed: 2026-07-10
---

# Tool, Resource, And Prompt Design

## tools

Tools are model-invoked functions exposed by a server. Design them as typed,
narrow operations:

- one purpose per tool;
- explicit input schema;
- output schema for structured results where practical;
- deterministic validation in code;
- separate read tools from write/proposal/commit tools;
- return business errors as tool execution errors, not vague text.

Do not expose arbitrary SQL, shell, filesystem write, network request, or
admin-bypass tools to ordinary model sessions.

## resources

Resources provide readable context or data. Use resources for:

- data dictionaries;
- report files;
- scoped records;
- reference documents;
- logs that have already been bounded and redacted.

Resources should carry enough metadata for trust decisions: owner, URI/path,
freshness, sensitivity, canonical/historical/raw status, and allowed use.

## prompts

Prompts are reusable templates or workflows. Use prompts for:

- guided report generation;
- repeatable operational workflows;
- structured approval text;
- triage/checklist flows.

Prompt content is not a permission boundary. A prompt may guide model behavior,
but backend policy still decides what data can be read or changed.

## result design

Prefer structured content for machine-readable results and a short text summary
for human readability.

For operational tools, include:

```text
status:
data:
source:
row_count:
filters_applied:
permission_scope:
warnings:
proposal_id:
audit_event_id:
```

## write workflow

Use separate proposal and commit tools:

```text
propose_change(...)
  -> validates requested target and creates before/after preview

commit_proposal(proposal_id)
  -> checks current user permission and applies a previously reviewed proposal
```

This reduces the chance that a model performs an unintended mutation from one
ambiguous instruction.

