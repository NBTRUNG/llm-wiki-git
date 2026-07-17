---
name: trust-safety-permissions
description: Trust, safety, permission, prompt-injection, and audit guidance for AI/RAG/MCP/agent work.
date_ingested: 2026-07-01
date_updated: 2026-07-16
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://owasp.org/www-project-top-10-for-large-language-model-applications/
  - https://modelcontextprotocol.io/specification/2025-06-18
  - https://www.cyber.gov.au/business-government/secure-design/artificial-intelligence/careful-adoption-of-agentic-ai-services
confidence: medium
confidence_reviewed: 2026-07-16
---

# Trust, Safety, And Permissions

Treat all AI-facing data and outputs as untrusted until validated.

Use the default
[Human-Agent Hybrid Control](../project-docs/human_agent_hybrid_control.md)
baseline. Human oversight and agent execution are complementary controls;
neither human approval nor agent confidence establishes correctness alone.

## Threats

- prompt injection from user input, documents, web pages, retrieved chunks, tool
  descriptions, or other agents;
- insecure output handling into HTML, shell, SQL, code execution, files, or
  downstream APIs;
- excessive agency: tools can do more than the task requires;
- sensitive information disclosure through prompts, context, logs, or results;
- supply-chain risk from models, tools, plugins, indexes, and dependencies;
- overreliance on unsupported model claims.

## Controls

- Narrow tool scopes and roots.
- Keep capability, autonomy, permission, impact, and reversibility separate.
- Name the human sponsor/acceptance owner and a logical agent/session principal.
- Human approval for destructive, costly, production, credential, external, or
  broad filesystem/network actions.
- Re-check authorization at the consequential action boundary; do not treat a
  session-start approval as an unlimited grant.
- Expire/release permission and delegation when work completes, blocks, pauses,
  becomes stale, or changes scope.
- Server-side auth/authorization for AI-triggered actions.
- Output validation before rendering, execution, persistence, or API calls.
- Redaction for prompts/context/logs by default.
- Explicit unsupported-answer behavior.
- Audit logs for tool use and source access.
- Agents must not modify their own privilege, capability evidence, grant chain,
  or audit record.
- Provide observe, interrupt, decide, and reverse affordances, marking each as
  implemented, manual, unverified, or unavailable.
- Fail closed for consequential mutations when permission, verifier, reviewer,
  or recovery control is missing; degrade to analysis/proposal when safe.
