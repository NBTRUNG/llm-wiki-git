---
name: current-source-knowledge-refresh
description: Validation record for the 2026-07-01 current-source refresh of Coding Pack and LLM-Wiki knowledge folders.
date_updated: 2026-07-01
status: accepted
---

# Current-Source Knowledge Refresh Validation

## Scope

Ran human-requested research-on-request for current official sources and
promoted concise updates into the Coding Pack and selected `wiki/knowledge/`
folders.

## Promoted Findings

- Security/Coding: ASVS 5.0.0 version note, AI/agent/MCP tool-use security
  controls, negative-path test expectations, and output-quality treatment of
  model/tool/generated output as untrusted.
- Frontend/UI: React 19.2 and React Compiler version-gated notes, Next.js 16.x
  version-gated notes, RSC security patch reminder, current Core Web Vitals
  stable metric set, and WCAG 2.2 Recommendation baseline.
- Contracts/Operations: OpenAPI 3.2.0 version note, explicit streaming/SSE/file
  upload/security modeling, CloudEvents graduated/SQL v1 notes, OpenTelemetry
  supported signals and proposal-stage profile/event notes, and runtime support
  checks for Node/.NET/Kubernetes/Python.
- Data: PostgreSQL versioning, supported-major, beta-version, and major-upgrade
  notes.

## Updated

- `reports/research/2026-07-01-current-source-knowledge-refresh.md`
- `reports/research/README.md`
- `wiki/knowledge/coding/security-baseline.md`
- `wiki/knowledge/coding/testing-strategy.md`
- `wiki/knowledge/coding/output-quality.md`
- `wiki/knowledge/frontend/react-performance.md`
- `wiki/knowledge/frontend/nextjs-performance.md`
- `wiki/knowledge/frontend/web-vitals.md`
- `wiki/knowledge/ui/accessibility.md`
- `wiki/knowledge/contracts/api-design.md`
- `wiki/knowledge/contracts/event-contracts.md`
- `wiki/knowledge/operations/observability.md`
- `wiki/knowledge/operations/deployment-readiness.md`
- `wiki/knowledge/data/database-selection.md`
- `TICK.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## Sources

See `reports/research/2026-07-01-current-source-knowledge-refresh.md`.

## Validation

- LLM-Wiki lint/link check: `bash harness/feedback-loop-lint.sh` passed with
  0 failures and 0 warnings.
