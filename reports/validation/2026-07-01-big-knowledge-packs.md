---
name: big-knowledge-packs
description: Validation record for adding five trigger-based big knowledge packs to LLM-Wiki.
date_updated: 2026-07-01
status: accepted
---

# Big Knowledge Packs Validation

## Scope

Added five trigger-based big packs:

- AI / Agent / RAG / MCP;
- Security Deep + Privacy;
- Platform / Infrastructure;
- Reliability / SRE;
- Content / CMS / SEO / i18n.

Vendor/technology overlays such as SQL Server, Oracle, Linux, Windows Server,
AWS, Azure, GCP, Docker, and Kubernetes were deliberately deferred. They should
be created only when an active project needs them.

## Updated

- `wiki/knowledge/ai-agent-rag-mcp/`
- `wiki/knowledge/security-privacy/`
- `wiki/knowledge/platform-infrastructure/`
- `wiki/knowledge/reliability-sre/`
- `wiki/knowledge/content-cms-seo-i18n/`
- `wiki/knowledge/README.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `reports/research/2026-07-01-big-knowledge-packs.md`
- `reports/research/README.md`
- `reports/validation/README.md`
- `TICK.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`

## Validation

- LLM-Wiki lint/link check: `bash harness/feedback-loop-lint.sh` passed with
  0 failures and 0 warnings.
