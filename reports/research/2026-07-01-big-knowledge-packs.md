---
name: big-knowledge-packs-research
description: Research brief for adding five trigger-based big knowledge packs to LLM-Wiki.
date_updated: 2026-07-01
status: promoted
---

# Big Knowledge Packs Research

Topic: Add AI/Agent/RAG/MCP, Security/Privacy, Platform/Infrastructure,
Reliability/SRE, and Content/CMS/SEO/i18n packs.

Date: 2026-07-01

Owner: Codex

Cadence reason: ad hoc human-requested knowledge pack expansion

Status: promoted

## decision need

- What decision or guideline may change: broaden LLM-Wiki pack coverage while
  keeping vendor/technology overlays trigger-based and deferred.
- Target docs if promoted: `wiki/knowledge/`, `agent_session_packs.md`, project
  status/tasks/test matrix.

## sources checked

| Source | Type | Date published/accessed | Relevance | Notes |
| --- | --- | --- | --- | --- |
| https://cloud.google.com/vertex-ai/generative-ai/docs/rag-overview | official vendor docs | accessed 2026-07-01 | RAG pipeline | Ingestion, transformation, indexing, retrieval, generation, metadata filtering, reranking. |
| https://modelcontextprotocol.io/specification/2025-06-18 | official protocol spec | 2025-06-18 / accessed 2026-07-01 | MCP tools/resources/security | Consent, privacy, tool safety, resources/prompts/tools/roots/sampling. |
| https://a2a-protocol.org/latest/specification/ | official protocol spec | accessed 2026-07-01 | Agent-to-agent boundary | Agent cards, tasks, messages, artifacts, collaboration protocol boundary. |
| https://owasp.org/www-project-top-10-for-large-language-model-applications/ | official security project | accessed 2026-07-01 | AI security | Prompt injection, insecure output handling, excessive agency, sensitive disclosure, overreliance. |
| https://owasp.org/www-project-application-security-verification-standard/ | official security standard | accessed 2026-07-01 | Deep security controls | ASVS verification baseline. |
| https://www.nist.gov/privacy-framework | official standard/framework | accessed 2026-07-01 | Privacy pack | Privacy risk and data protection framing. |
| https://www.nist.gov/cyberframework | official standard/framework | accessed 2026-07-01 | Security/incident pack | Govern/identify/protect/detect/respond/recover framing. |
| https://12factor.net/ | methodology | accessed 2026-07-01 | Platform/config | Config/environment and deployable app principles. |
| https://docs.docker.com/get-started/docker-overview/ | official docs | accessed 2026-07-01 | Containers | Container/image/runtime basics. |
| https://kubernetes.io/docs/concepts/overview/ | official docs | accessed 2026-07-01 | Platform | Kubernetes as container orchestration, only when justified. |
| https://sre.google/sre-book/table-of-contents/ | official book | accessed 2026-07-01 | Reliability/SRE | SLO, incident, and reliability framing. |
| https://sre.google/workbook/table-of-contents/ | official workbook | accessed 2026-07-01 | Reliability/SRE | Practical SRE implementation patterns. |
| https://opentelemetry.io/docs/concepts/signals/ | official docs | accessed 2026-07-01 | Observability | Logs, metrics, traces, baggage, profiles/events maturity. |
| https://developers.google.com/search/docs/fundamentals/seo-starter-guide | official docs | accessed 2026-07-01 | SEO/content | Search visibility and metadata basics. |
| https://www.w3.org/International/ | W3C docs | accessed 2026-07-01 | i18n | Internationalization and localization considerations. |
| https://schema.org/docs/schemas.html | standard vocabulary | accessed 2026-07-01 | Structured data | Schema vocabulary for structured data. |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| RAG/MCP/agent work needs a pack that separates OKF source substrate, retrieval, tool/resource access, and agent collaboration. | high | candidate-update | AI/RAG/MCP/agent features. | Ordinary app code with no AI/tool layer. |
| Security baseline is not enough for privacy, identity, supply chain, incident, and trust-boundary work. | high | candidate-update | Sensitive/security posture work. | Low-risk code changes already covered by Coding Pack baseline. |
| Platform/infrastructure guidance should be core; vendor overlays should be deferred until a project uses that stack. | high | candidate-update | Runtime/deploy/network/config/CI/IaC work. | Pure application logic. |
| Reliability/SRE needs a dedicated pack because deployment success and production health require SLO/health/resilience/capacity/runbook thinking. | high | candidate-update | Production operability and availability work. | Docs-only or local-only tasks. |
| Content/CMS/SEO/i18n deserves a dedicated pack for content-heavy public sites and CMS migrations. | high | candidate-update | CMS/public content/multilingual/search/SEO work. | Internal tools with no content/indexing/i18n concern. |

## impact on LLM-Wiki

- Canonical docs to update: `wiki/knowledge/` and `agent_session_packs.md`.
- Templates/harness files to update: none in this pass.
- Project docs affected: LLM-Wiki status/tasks/test matrix.
- Agent workflow affected: new packs are trigger-based; vendor overlays remain
  future optional reads.

## proposed change

- Create five new knowledge pack folders.
- Update knowledge catalogs and session routing.
- Do not create SQL Server/Linux/Windows/AWS/Azure/GCP overlays yet.

## validation plan

- Run `bash harness/feedback-loop-lint.sh`.
- Create validation report and update project status/tasks/test matrix.

## reviewer decision

- Decision: promote
- Reason: fills broad pack gaps identified by human owner while preserving
  Token Economy with trigger-based routing.
- Validation report:
  `reports/validation/2026-07-01-big-knowledge-packs.md`

## next review

- Next cadence trigger: when a real project needs a vendor/technology overlay
  such as SQL Server, Linux, Windows Server, AWS, Azure, GCP, Docker, or
  Kubernetes.
- Watchlist row: high-volatility topics in `research/watchlist.md`.
