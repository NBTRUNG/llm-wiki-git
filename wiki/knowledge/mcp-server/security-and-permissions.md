---
name: mcp-server-security-and-permissions
description: Security, permission, consent, prompt-injection, and audit guidance for MCP servers.
date_ingested: 2026-07-10
status: active
source_type: current-source research + distilled practice
source_urls:
  - https://modelcontextprotocol.io/specification/2025-06-18
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/transports
  - https://modelcontextprotocol.io/specification/2025-06-18/server/tools
  - https://genai.owasp.org/llmrisk/llm01-prompt-injection/
confidence: medium
confidence_reviewed: 2026-07-10
---

# Security And Permissions

## threat model

MCP servers can expose data access and code execution paths. Treat these as
high-risk integration points.

Primary threats:

- prompt injection from users, files, web pages, retrieved chunks, or tool
  outputs;
- tool poisoning through misleading tool descriptions or changed metadata;
- excessive agency through overly broad tools;
- sensitive data disclosure through resources, prompts, logs, or results;
- unauthorized mutation of files, databases, deployments, or external services;
- DNS rebinding or unauthorized browser-to-local-server access for HTTP
  transports.

## baseline controls

- Human approval for destructive, costly, external, credentialed, or broad
  actions.
- Backend authorization for every tool call.
- Least-privilege tool scopes.
- Input validation before service calls.
- Output validation before rendering, executing, writing, or forwarding.
- Audit events for tool calls, denials, writes, and generated files.
- Redaction of secrets and sensitive data in prompts, logs, and resources.
- Clear unsupported-action behavior instead of model guessing.

## tool approval levels

```text
safe-read
  low-risk deterministic query with scoped results

sensitive-read
  reads private, personal, credential-adjacent, or regulated data

proposal-write
  creates a pending change only

commit-write
  mutates canonical data after permission and confirmation

external-action
  sends email, calls third-party APIs, deploys, pays, deletes, or publishes
```

Only `safe-read` should be eligible for automatic invocation by default.

## anti-patterns

- "The system prompt says do not do unsafe things" as the only control.
- One tool that accepts free-form commands.
- Write tools that combine target discovery and mutation in one call.
- Trusting tool annotations from an untrusted server.
- Returning full unredacted files/logs as resources.
- Binding a local HTTP server to all interfaces during development.

## operational rule

Every MCP server must have a denial path that is as well-designed as the success
path. A denied request should return why it was denied, what scope was checked,
and whether the user can request approval.

