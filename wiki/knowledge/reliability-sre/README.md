---
name: reliability-sre-pack
description: Reliability and SRE pack for SLOs, health checks, graceful degradation, capacity, incidents, and production readiness.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://sre.google/sre-book/table-of-contents/
  - https://sre.google/workbook/table-of-contents/
  - https://opentelemetry.io/docs/concepts/signals/
  - https://opentelemetry.io/docs/specs/semconv/gen-ai/
confidence: medium
confidence_reviewed: 2026-07-06
---

# Reliability / SRE Pack

Use when a task affects availability, latency, error rates, capacity, graceful
degradation, retries/timeouts, incident response, production monitoring, or
operational readiness.

## Read Order

| Intent | Read |
| --- | --- |
| Define reliability target | [slo-sli-error-budgets.md](slo-sli-error-budgets.md) |
| Runtime health and readiness | [health-readiness.md](health-readiness.md) |
| Failure handling | [resilience-patterns.md](resilience-patterns.md) |
| Capacity/performance | [capacity-performance.md](capacity-performance.md) |
| Incidents/runbooks | [incident-runbooks.md](incident-runbooks.md) |

## Output

```text
User-visible reliability target:
Health/readiness signals:
Failure modes:
Retries/timeouts/backpressure:
Capacity risk:
Alert/runbook owner:
Evidence:
```

## AI/RAG/Agent Reliability Addendum

When a system exposes RAG, MCP tools, or autonomous/agentic workflows, also
report:

```text
Knowledge freshness target:
Citation/support SLI:
Retrieval/tool latency budget:
Query fan-out and token budget:
Tool denial/fallback path:
Gateway/audit trace owner:
Disable/rollback switch:
Evaluation cadence:
```

Do not use model confidence as a reliability signal. Prefer measurable signals:
retrieval hit quality, citation support rate, unsupported-answer rate, tool
error rate, policy-denial rate, latency percentiles, cost per request, and
human correction rate.
