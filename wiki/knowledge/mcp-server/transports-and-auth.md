---
name: mcp-transports-and-auth
description: Transport and authorization guidance for MCP servers.
date_ingested: 2026-07-10
status: active
source_type: current-source research + distilled practice
source_urls:
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/transports
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization
  - https://github.com/modelcontextprotocol/python-sdk
  - https://github.com/modelcontextprotocol/typescript-sdk
confidence: medium
confidence_reviewed: 2026-07-10
---

# Transports And Auth

## transport choices

Use stdio when:

- the server runs locally as a subprocess of a trusted host;
- there is no need to expose a network endpoint;
- the host owns process lifecycle;
- local development or single-user desktop use is enough.

Use Streamable HTTP when:

- multiple clients or remote hosts need access;
- the server must run independently;
- auth, session management, gateway logging, or deployment controls are needed;
- the host supports the 2025-06-18 Streamable HTTP transport.

## stdio controls

- Write only valid MCP JSON-RPC messages to stdout.
- Send logs to stderr, not stdout.
- Do not inherit broad environment variables or secrets by default.
- Start the subprocess with the least filesystem and network access practical.

## Streamable HTTP controls

For HTTP servers:

- expose a single MCP endpoint path;
- validate the `Origin` header;
- bind local-only services to `127.0.0.1`, not `0.0.0.0`;
- require authentication for non-local or sensitive access;
- handle `Mcp-Session-Id` when using stateful sessions;
- enforce the negotiated `MCP-Protocol-Version`;
- set request timeouts and cancellation behavior.

## authorization

Auth belongs outside model text. The server should receive trusted identity from
the host, gateway, session, or token layer and then enforce role/scope checks in
code.

Record:

```text
identity source:
role source:
scope source:
token lifetime:
allowed tools:
denied tools:
audit fields:
```

## SDK selection notes

The official Python SDK README currently notes that v1.x is the stable
production line and v2 is a pre-release line. Pin exact versions and avoid
building production guidance on pre-release APIs unless the project explicitly
accepts that churn.

The official TypeScript SDK exposes server, client, and thin middleware
packages. Keep framework adapters thin; do not hide business logic or permission
checks inside transport middleware.

