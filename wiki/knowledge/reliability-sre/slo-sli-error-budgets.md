---
name: slo-sli-error-budgets
description: SLI/SLO/error budget guidance for user-visible reliability targets.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://sre.google/sre-book/service-level-objectives/
confidence: medium
confidence_reviewed: 2026-07-01
---

# SLO, SLI, And Error Budgets

Use SLOs to express user-visible reliability, not internal wish lists.

## Checks

- Name the user journey or API.
- Pick SLIs users feel: availability, latency, correctness, freshness,
  durability, or successful task completion.
- Define measurement window and source.
- Avoid 100% targets unless safety/legal requirements demand it.
- Decide what happens when error budget is exhausted: freeze risky changes,
  prioritize reliability, or require owner approval.

