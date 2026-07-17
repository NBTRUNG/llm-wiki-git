---
name: mcp-server-pack
description: Focused guidance for designing, implementing, securing, testing, and operating MCP servers.
date_ingested: 2026-07-10
status: active
source_type: current-source research + distilled practice
source_urls:
  - https://modelcontextprotocol.io/specification/2025-06-18
  - https://modelcontextprotocol.io/specification/2025-06-18/architecture
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/lifecycle
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/transports
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization
  - https://modelcontextprotocol.io/specification/2025-06-18/server/tools
  - https://modelcontextprotocol.io/specification/2025-06-18/server/resources
  - https://modelcontextprotocol.io/specification/2025-06-18/server/prompts
  - https://github.com/modelcontextprotocol/python-sdk
  - https://github.com/modelcontextprotocol/typescript-sdk
  - https://genai.owasp.org/llmrisk/llm01-prompt-injection/
confidence: medium
confidence_reviewed: 2026-07-10
---

# MCP Server Pack

Use this pack when building or reviewing a Model Context Protocol server.

## trigger

Load this pack when a task:

- creates or changes an MCP server;
- exposes tools, resources, prompts, roots, sampling, elicitation, or logging;
- chooses stdio, Streamable HTTP, or remote transport;
- adds tool authorization, approval, audit, or user identity propagation;
- connects an LLM host to local files, databases, APIs, shell commands, or
  business workflows.

## read order

| Intent | Read |
| --- | --- |
| Choose server boundary | [server-architecture.md](server-architecture.md) |
| Design tools/resources/prompts | [tool-resource-prompt-design.md](tool-resource-prompt-design.md) |
| Choose transport and auth | [transports-and-auth.md](transports-and-auth.md) |
| Review safety and permissions | [security-and-permissions.md](security-and-permissions.md) |
| Validate before release | [testing-and-operations.md](testing-and-operations.md) |
| Evaluate model/tool reliability | [../ai-agent-rag-mcp/agent-evaluation.md](../ai-agent-rag-mcp/agent-evaluation.md) after server contract tests pass |

## operating rule

An MCP server is a capability boundary, not the business source of truth. It
should wrap a narrow service layer and enforce policy before touching files,
databases, APIs, or runtime systems.

## required design record

For each MCP server, record:

```text
Server owner:
Host/client targets:
Transport:
Auth and user identity:
Tools:
Resources:
Prompts:
Filesystem/network/data scope:
Write/side-effect policy:
Human approval gates:
Audit/logging:
Test evidence:
Agent evaluation suite and repeated-trial result:
Known unsupported actions:
```
