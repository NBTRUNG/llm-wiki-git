# research brief

Topic: Knowledge pack refresh from current official sources
Date: 2026-06-27
Owner: Codex
Cadence reason: ad hoc
Status: promoted

## decision need

- What decision or guideline may change: frontend, UI accessibility, contracts,
  operations, and security packs need current official-source facts after the
  user requested internet-backed knowledge refresh.
- Target docs if promoted: `wiki/knowledge/frontend/`,
  `wiki/knowledge/ui/`, `wiki/knowledge/contracts/`,
  `wiki/knowledge/operations/`, `wiki/knowledge/coding/security-baseline.md`.

## sources checked

| Source | Type | Date published/accessed | Relevance | Notes |
| --- | --- | --- | --- | --- |
| React `memo` docs | official | accessed 2026-06-27 | React performance | Confirms memoization is an optimization, compiler can reduce manual memoization. |
| Next.js lazy loading docs | official | updated 2026-03-10, accessed 2026-06-27 | Next.js performance | Clarifies lazy loading applies to Client Components and imported libraries. |
| Next.js Image docs | official | updated 2026-03-10, accessed 2026-06-27 | Next.js performance/UI | Confirms `preload`, `priority` deprecation in Next.js 16, `sizes`, auth-header caveat. |
| Next.js package bundling docs | official | updated 2026-06-23, accessed 2026-06-27 | Next.js performance | Confirms analyzer paths and bundle impact framing. |
| web.dev Web Vitals | official/vendor standard | updated 2024-10-31, accessed 2026-06-27 | Frontend performance | Confirms LCP/INP/CLS thresholds and p75 field-measurement guidance. |
| W3C WCAG 2.2 | standard | accessed 2026-06-27 | UI accessibility | Confirms WCAG 2.2 added focus/dragging/target/auth/redundant-entry watchpoints. |
| WAI-ARIA APG | standard guidance | accessed 2026-06-27 | UI accessibility | Baseline for custom widget behavior. |
| OpenAPI latest spec | standard | v3.2.0, published 2025-09-19, accessed 2026-06-27 | API/data contracts | Latest published OAS is 3.2.0; OAS is language-agnostic HTTP API contract. |
| CloudEvents spec | standard | accessed 2026-06-27 | Event contracts | Confirms required envelope attributes and security/privacy notes. |
| OpenTelemetry docs | official/CNCF | modified 2026-04-06, accessed 2026-06-27 | Observability | Confirms OTel is framework/toolkit, not a backend, and signals are traces/metrics/logs. |
| OWASP ASVS | standard | ASVS 5.0.0 released 2025-05-30, accessed 2026-06-27 | Security pack | Confirms ASVS as app security verification/control requirements baseline. |
| NIST SP 800-218 SSDF | government standard | final 2022-02, accessed 2026-06-27 | Security pack | Confirms secure software development framework purpose and SDLC vocabulary. |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| React memoization must remain performance-only; compiler-enabled repos need fewer manual memo rules. | high | candidate-update | React component performance/review work | Repo does not use React Compiler; behavior depends on memoization bug. |
| Next.js App Router lazy loading should be framed around Client Components/imported libraries; Server Component dynamic import does not remove the Server Component itself from server work. | high | candidate-update | Next.js routes/components | Non-Next React app or Pages Router-specific legacy work. |
| Next.js 16 image guidance changed: `priority` is deprecated in favor of `preload`; `sizes` is required for many responsive images; auth images need care. | high | urgent-update | Next.js 16+ image work | Repo is pinned below Next.js 16 and has local image policy. |
| Core Web Vitals defaults should include LCP `<= 2.5s`, INP `<= 200ms`, CLS `<= 0.1`, measured at p75 segmented by device class. | high | candidate-update | Frontend performance budgets | Repo sets stricter or different product-specific SLOs. |
| WCAG 2.2 focus/dragging/target/auth/redundant-entry items should be explicit UI review watchpoints. | high | candidate-update | New or changed user-facing UI | Repo has stricter accessibility compliance requirements. |
| OpenAPI latest is 3.2.0; API guidance should treat endpoint behavior as a full contract, not just DTOs. | high | candidate-update | HTTP API contract work | Internal-only code with no route/API boundary. |
| CloudEvents required envelope attributes should be available in event-contract guidance. | high | candidate-update | Async cross-service events/webhooks | Local in-process domain events with no interoperability needs. |
| Observability pack should state that OpenTelemetry is not a backend and requires storage/dashboard/export decisions. | high | candidate-update | Telemetry/instrumentation work | Repo already has an approved observability backend path. |
| Security pack should route higher-risk verification to OWASP ASVS and secure-development process questions to NIST SSDF. | high | candidate-update | Security-relevant coding and review | Repo has stricter local compliance/security docs. |

## impact on LLM-Wiki

- Canonical docs to update: frontend, UI, contracts, operations, and coding
  security knowledge files.
- Templates/harness files to update: none in this pass.
- Project docs affected: LLM-Wiki task/status/test matrix validation rollups.
- Agent workflow affected: agents will load fresher pack content when the
  relevant session pack is selected.

## proposed change

- Promote concise source-backed facts into the canonical pack pages.
- Keep detailed vendor/standard explanations in source links, not duplicated in
  the wiki.

## validation plan

- Read back changed files.
- Run `bash harness/feedback-loop-lint.sh`.
- Record validation report.

## reviewer decision

- Decision: promote
- Reason: user explicitly requested internet-backed knowledge refresh; sources
  are primary/official and findings are stable enough for pack behavior.
- Validation report:
  `reports/validation/2026-06-27-knowledge-pack-internet-refresh.md`

## next review

- Next cadence trigger: user request or when a task exposes stale pack behavior.
- Watchlist row: frontend frameworks, Web Vitals, accessibility, API/event
  specs, observability, and secure-development standards.
