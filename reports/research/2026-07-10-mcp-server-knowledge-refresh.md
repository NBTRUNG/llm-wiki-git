# MCP Server Knowledge Refresh

Date: 2026-07-10

## question

What current MCP server knowledge should be promoted into LLM-Wiki before
building a local MCP lab?

## source bounds

Primary sources only unless needed for security context:

- Model Context Protocol specification and docs.
- Official MCP Python and TypeScript SDK repositories.
- OWASP GenAI prompt-injection guidance for agent/tool security context.

## consulted sources

- `https://modelcontextprotocol.io/specification/2025-06-18`
- `https://modelcontextprotocol.io/specification/2025-06-18/architecture`
- `https://modelcontextprotocol.io/specification/2025-06-18/basic/lifecycle`
- `https://modelcontextprotocol.io/specification/2025-06-18/basic/transports`
- `https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization`
- `https://modelcontextprotocol.io/specification/2025-06-18/server/tools`
- `https://modelcontextprotocol.io/specification/2025-06-18/server/resources`
- `https://modelcontextprotocol.io/specification/2025-06-18/server/prompts`
- `https://github.com/modelcontextprotocol/python-sdk`
- `https://github.com/modelcontextprotocol/typescript-sdk`
- `https://genai.owasp.org/llmrisk/llm01-prompt-injection/`

## findings promoted

- MCP servers should be focused capability providers that expose resources,
  prompts, and tools behind negotiated capabilities.
- Lifecycle design must account for initialization, protocol version
  negotiation, capability negotiation, operation, shutdown, timeouts, and
  errors.
- The 2025-06-18 spec defines stdio and Streamable HTTP as standard transports.
  HTTP servers need Origin validation, localhost binding for local servers, and
  authentication for sensitive access.
- Tools need explicit schemas, narrow scope, structured results where possible,
  and clear separation between protocol errors and business/tool execution
  errors.
- Tool descriptions and annotations are not trust proof.
- Exact operational mutations should use proposal and commit tools rather than
  one ambiguous write call.
- OWASP prompt-injection guidance supports least privilege, output validation,
  human approval for high-risk actions, and adversarial testing.
- Official SDK state matters: the Python SDK README indicates v1.x is stable
  while v2 is pre-release as of this research run; projects should pin exact
  SDK versions.

## promoted files

- `wiki/knowledge/mcp-server/README.md`
- `wiki/knowledge/mcp-server/server-architecture.md`
- `wiki/knowledge/mcp-server/tool-resource-prompt-design.md`
- `wiki/knowledge/mcp-server/transports-and-auth.md`
- `wiki/knowledge/mcp-server/security-and-permissions.md`
- `wiki/knowledge/mcp-server/testing-and-operations.md`

## non-promoted notes

- Academic MCP security papers found during search were not promoted because
  the user asked for practical knowledge and official/current sources were
  enough for this pass.
- Future MCP specification releases referenced by SDK docs were not treated as
  active stable guidance.

