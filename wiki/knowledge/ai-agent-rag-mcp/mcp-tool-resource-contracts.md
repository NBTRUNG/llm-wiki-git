---
name: mcp-tool-resource-contracts
description: MCP tool/resource contract guidance for agent access to files, systems, data, prompts, roots, and sampling.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://modelcontextprotocol.io/specification/2025-06-18
confidence: medium
confidence_reviewed: 2026-07-01
---

# MCP Tool And Resource Contracts

Use this guide when exposing or consuming MCP tools/resources.

## Contract Fields

For each tool/resource, document:

- owner;
- purpose;
- inputs and output schema;
- side effects;
- read/write boundary;
- filesystem/network/data scope;
- auth/authorization behavior;
- human approval requirements;
- logging/audit behavior;
- errors and denial behavior;
- sensitive data handling.

## Tool Safety

- Tool annotations/descriptions are hints, not trust proof.
- Hosts must enforce permissions and approval gates.
- Tools that mutate files, data, deployments, money, credentials, or production
  state need explicit consent and audit.
- Prompt, resource, and tool content can be adversarial. Validate before use.

## Resource Safety

Resources should carry enough metadata for source-of-truth and permission
decisions: path/URI, owner, freshness, sensitivity, canonical/historical/raw
status, and allowed operations.

