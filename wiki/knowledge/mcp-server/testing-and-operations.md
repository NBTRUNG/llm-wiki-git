---
name: mcp-server-testing-and-operations
description: Testing, release, and operations guidance for MCP servers.
date_ingested: 2026-07-10
status: active
source_type: current-source research + distilled practice
source_urls:
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/lifecycle
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/transports
  - https://modelcontextprotocol.io/specification/2025-06-18/server/tools
  - https://github.com/modelcontextprotocol/python-sdk
  - https://github.com/modelcontextprotocol/typescript-sdk
confidence: medium
confidence_reviewed: 2026-07-10
---

# Testing And Operations

## pre-release checks

Before exposing an MCP server to a model host:

- list every tool/resource/prompt and its owner;
- prove each input schema rejects invalid types and missing required fields;
- prove output schemas match real responses where schemas are provided;
- test initialization and capability negotiation;
- test request timeouts and cancellation;
- test auth denial and approval paths;
- test read scope boundaries;
- test write proposal and commit separation;
- test audit events for success, denial, and error;
- test prompt-injection attempts in user input and resource content;
- test transport-specific controls.

## fixture set

Maintain fixtures for:

```text
valid read request
invalid arguments
unknown tool
unauthorized sensitive read
proposal creation
unauthorized commit
authorized commit
malicious prompt in resource content
transport disconnect or timeout
schema migration or tool list change
```

## agent-level evaluation

Server contract tests prove that tools behave correctly when called. They do
not prove that a model selects the right tool, supplies correct arguments,
respects approval policy, or behaves consistently across runs.

After server checks pass, use
[../ai-agent-rag-mcp/agent-evaluation.md](../ai-agent-rag-mcp/agent-evaluation.md)
to evaluate the complete model-plus-harness-plus-server configuration. At
minimum:

- verify deterministic backend state and audit outcomes;
- make permission, approval, proposal-before-commit, and scope rules hard
  gates;
- inspect traces for tool selection, arguments, recovery, and unnecessary
  calls;
- repeat isolated trials and report first-pass success plus a consistency
  measure;
- record latency, token/cost, call, retry, and error distributions;
- keep public MCP benchmark results separate from local release evidence.

## observability

Log structured events:

```text
timestamp
server_name
protocol_version
transport
session_id
user_id
tool_or_resource
action_class
input_summary
decision
result_status
audit_event_id
duration_ms
```

Do not log full prompts, credentials, full files, or sensitive row values unless
there is an explicit retention and privacy decision.

## release gates

For local lab use:

- localhost binding for HTTP;
- no broad filesystem roots;
- sample data only or documented private-data approval;
- manual review of tool list;
- denial tests pass.

For shared/team use:

- authentication;
- role/scope authorization;
- HTTPS or trusted internal network;
- audit retention policy;
- operational owner;
- rollback/disable plan;
- dependency pinning.

## versioning

Record:

- MCP protocol version;
- SDK package and exact version;
- server tool list version;
- data schema version;
- transport and auth mode.

Tool schema changes should be treated like API contract changes: document them,
test old callers where required, and notify hosts if the list changes.
