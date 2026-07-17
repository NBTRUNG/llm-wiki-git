---
name: current-source-knowledge-refresh
description: Research brief for the 2026-07-01 current-source refresh of Coding Pack and LLM-Wiki knowledge folders.
date_updated: 2026-07-01
status: promoted
---

# Current-Source Knowledge Refresh

Topic: Coding Pack and LLM-Wiki knowledge folder refresh from current official
sources

Date: 2026-07-01

Owner: Codex

Cadence reason: ad hoc human-requested auto research across high-volatility
watchlist topics

Status: promoted

## decision need

- What decision or guideline may change: current security, frontend, UI,
  contract, operations, deployment/runtime, data, and AI/tool-use guidance.
- Target docs if promoted: Coding Pack plus `frontend/`, `ui/`, `contracts/`,
  `operations/`, and `data/` knowledge folders.

## sources checked

| Source | Type | Date published/accessed | Relevance | Notes |
| --- | --- | --- | --- | --- |
| https://owasp.org/www-project-application-security-verification-standard/ | official standard | accessed 2026-07-01 | Security baseline | ASVS latest stable listed as 5.0.0. |
| https://owasp.org/www-project-top-10-for-large-language-model-applications/ | official security project | accessed 2026-07-01 | AI/agent security | Project now routes latest Top 10 for LLM to OWASP GenAI Security Project; version 2025 available. |
| https://modelcontextprotocol.io/specification/2025-06-18 | official protocol spec | 2025-06-18 / accessed 2026-07-01 | AI tool-use security | Records consent, privacy, tool safety, sampling controls, and MCP feature model. |
| https://csrc.nist.gov/pubs/sp/800/218/final | official standard | accessed 2026-07-01 | Secure SDLC | SSDF remains process reference. |
| https://react.dev/blog | official docs/blog | accessed 2026-07-01 | React performance/security | React 19.2 current; React Compiler v1.0 stable; RSC security advisories noted. |
| https://nextjs.org/blog | official docs/blog | accessed 2026-07-01 | Next.js performance/agent workflow/security | Next.js 16.x notes, 16.3 preview, agent docs, and RSC advisories. |
| https://web.dev/articles/vitals | official docs | accessed 2026-07-01 | Web performance | LCP, INP, CLS stable; TBT is proxy when lab cannot measure INP. |
| https://www.w3.org/TR/WCAG22/ | W3C Recommendation | 2024-12-12 / accessed 2026-07-01 | UI accessibility | WCAG 2.2 is current Recommendation and extends 2.1. |
| https://spec.openapis.org/oas/latest.html | official spec | 2025-09-19 / accessed 2026-07-01 | API contracts | Latest published OpenAPI is 3.2.0. |
| https://cloudevents.io/ | CNCF project | accessed 2026-07-01 | Event contracts | CloudEvents graduated; SQL v1 and core 1.0.2 noted. |
| https://opentelemetry.io/docs/concepts/signals/ | official docs | accessed 2026-07-01 | Observability | Supported signals and proposal-stage profiles/events. |
| https://nodejs.org/en/about/previous-releases | official docs | accessed 2026-07-01 | Runtime support | Production should use Active/Maintenance LTS; current release table checked. |
| https://dotnet.microsoft.com/en-us/platform/support/policy/dotnet-core | official docs | updated 2026-06-09 / accessed 2026-07-01 | Runtime support | .NET 10 LTS, .NET 9 STS maintenance, .NET 8 LTS maintenance. |
| https://kubernetes.io/releases/ | official docs | accessed 2026-07-01 | Platform support | Most recent three minor releases maintained. |
| https://www.python.org/downloads/ | official docs | accessed 2026-07-01 | Runtime support | Active Python release/support table checked. |
| https://www.postgresql.org/support/versioning/ | official docs | accessed 2026-07-01 | Database lifecycle | PostgreSQL major support, upgrade method, current supported versions. |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| Record ASVS version when citing requirements; ASVS 5.0.0 is latest stable. | high | candidate-update | Security review cites ASVS controls. | Repo has stricter compliance mapping. |
| AI/agent/tool-use security needs explicit consent, access control, output validation, and audit boundaries. | high | candidate-update | LLM, MCP, tool calling, generated code, retrieval, or agent automation is in scope. | Feature has no AI/tool execution or data access path. |
| React Compiler and React 19.2 are current-source facts but remain repo-version-specific. | high | candidate-update | React perf work touches memoization or compiler assumptions. | Repo is on older React or compiler disabled. |
| Next.js 16.x has version-gated routing/caching/Turbopack/agent workflow changes; RSC patch level matters. | high | candidate-update | Next.js route/perf/RSC work. | Non-Next.js repo or older stack where docs do not apply. |
| Core Web Vitals stable set is LCP, INP, CLS; lab tools cannot directly prove INP without user input. | high | candidate-update | Frontend performance proof. | Repo has stricter product-specific metrics. |
| WCAG 2.2 is current Recommendation baseline and extends 2.1 without deprecating older versions. | high | candidate-update | New or changed UI work lacks stricter project baseline. | Legal/project requirement differs. |
| OpenAPI 3.2.0 is latest published OAS; streaming/SSE/uploads/security deserve explicit modeling. | high | candidate-update | API contracts, generated clients, streaming, callbacks, uploads. | Internal route has no stable consumer contract. |
| CloudEvents is graduated; CloudEvents SQL v1 can standardize filtering where needed. | medium | candidate-update | Cross-service event filtering/querying needs portability. | Topic routing or consumer-side filtering is enough. |
| OpenTelemetry supports traces, metrics, logs, baggage; profiles/events remain proposal/development areas. | high | candidate-update | Observability requirements are being set. | Repo tooling cannot support the signal. |
| Runtime support status changed enough to warrant deployment checks for Node, .NET, Kubernetes, Python. | high | candidate-update | Deployment/runtime/package changes. | Static docs-only or no runtime implication. |
| PostgreSQL 18 is current supported major; 19 is beta; major upgrades need pg_upgrade or dump/reload. | high | candidate-update | DB selection or upgrade planning. | Repo uses a different data store. |

## impact on LLM-Wiki

- Canonical docs to update: Coding Pack and selected knowledge folder files.
- Templates/harness files to update: none for this run.
- Project docs affected: LLM-Wiki status/tasks/test matrix only.
- Agent workflow affected: agents should record source/version freshness when
  work depends on current runtime/framework/security behavior.

## proposed change

- Promote concise current-source notes into the existing canonical files.
- Update `confidence_reviewed` dates for edited knowledge files.
- Add validation evidence and indexes.

## validation plan

- Link/readback checks through `bash harness/feedback-loop-lint.sh`.
- Validation report under `reports/validation/`.

## reviewer decision

- Decision: promote
- Reason: findings came from official/primary sources and affect agent
  decisions across volatile security, frontend, contract, operations, runtime,
  and data topics.
- Validation report:
  `reports/validation/2026-07-01-current-source-knowledge-refresh.md`

## next review

- Next cadence trigger: weekly for security/AI-agent topics; monthly for
  frontend/runtime/observability/deployment; quarterly for broader coding
  quality and architecture fitness.
- Watchlist row: high-volatility topics in `research/watchlist.md`.
