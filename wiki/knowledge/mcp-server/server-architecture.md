---
name: mcp-server-architecture
description: Architecture boundaries for MCP servers.
date_ingested: 2026-07-10
status: active
source_type: current-source research + distilled practice
source_urls:
  - https://modelcontextprotocol.io/specification/2025-06-18
  - https://modelcontextprotocol.io/specification/2025-06-18/architecture
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/lifecycle
confidence: medium
confidence_reviewed: 2026-07-10
---

# MCP Server Architecture

## core model

MCP uses a host-client-server architecture:

- host: LLM application that coordinates clients, permissions, consent, and
  model interaction;
- client: one isolated stateful connection from a host to a server;
- server: focused provider of resources, prompts, and tools.

Design servers as small capability providers. Keep orchestration, cross-server
policy, and final user consent in the host or application layer.

## boundary rules

- One server should expose a coherent capability set, not every tool in the
  system.
- Do not give a server broader filesystem, network, database, or credential
  access than the narrow use case needs.
- Do not let tool descriptions serve as the only safety control.
- Keep business logic in a normal service layer where it can be tested without
  MCP transport.
- Treat MCP as an interface adapter around that service layer.

## lifecycle requirements to account for

Implementations must handle:

- initialization before normal operation;
- protocol version negotiation;
- client/server capability negotiation;
- operation only within negotiated capabilities;
- request timeouts and cancellation;
- graceful shutdown for the chosen transport.

For remote or long-running servers, include session expiration and recovery
behavior in the design.

## good server shapes

```text
asset-ops-mcp
  tools: search_assets, count_assets, propose_asset_update, commit_proposal
  resources: report files, data dictionary
  prompts: guided report request templates

repo-read-mcp
  tools: search_code, read_file_window
  resources: project maps
  prompts: review checklist

deploy-diagnostics-mcp
  tools: get_latest_report, run_smoke_check
  resources: bounded logs, deployment manifest
```

## poor server shapes

```text
admin-everything-mcp
  exposes shell, SQL, filesystem, deploy, and secrets in one server

generic-query-mcp
  lets ordinary users send arbitrary SQL or shell commands

rag-plus-writes-mcp
  lets retrieved document text steer write operations without typed validation
```

