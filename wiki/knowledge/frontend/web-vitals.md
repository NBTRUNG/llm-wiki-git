---
name: web-vitals
description: User-centered web performance metric guidance for frontend tasks. Covers LCP, INP, CLS, budgets, and evidence expectations.
date_ingested: 2026-06-27
status: active
source_type: web-research
source_urls:
  - https://web.dev/vitals/
  - https://web.dev/articles/vitals
  - https://web.dev/articles/lcp
  - https://web.dev/articles/inp
  - https://web.dev/articles/cls
confidence: high
confidence_reviewed: 2026-06-27
---

# web vitals

## purpose

Use this guide when a task affects perceived load speed, interaction
responsiveness, layout stability, or user-facing frontend performance.

## core metrics

- **LCP**: loading experience for the largest visible content element.
- **INP**: interaction responsiveness across the page lifecycle.
- **CLS**: unexpected layout shift.

Treat these as user-experience signals, not vanity scores. A project may set
stricter or domain-specific budgets.

## default thresholds

Use these as the default external baseline unless the repo sets stricter
budgets:

| Metric | Good default threshold | Measurement note |
| --- | --- | --- |
| LCP | `<= 2.5s` | 75th percentile, mobile and desktop segmented |
| INP | `<= 200ms` | 75th percentile, mobile and desktop segmented |
| CLS | `<= 0.1` | 75th percentile, mobile and desktop segmented |

Field data wins when available. Lab data is acceptable for local diagnosis, but
must be labeled as lab/browser evidence.

## task checklist

- Identify the user path and viewport being optimized.
- Identify the likely bottleneck: server latency, render blocking, bundle size,
  image/font loading, client computation, network fan-out, or layout shift.
- Keep dimensions stable for images, media, ads, embeds, and dynamic panels.
- Avoid shipping unnecessary JavaScript on first load.
- Preserve accessibility, security, and correctness while optimizing.
- Record field data when available; otherwise record lab/browser evidence and
  limits.

## evidence examples

- before/after field data;
- Lighthouse or browser performance trace;
- bundle size report;
- screenshot/video showing layout stability;
- manual route smoke with viewport and network assumptions;
- note explaining why only code review evidence was practical.

## anti-patterns

- Optimizing a metric by removing useful states, labels, errors, or audit logs.
- Treating a single local Lighthouse score as proof for every user path.
- Fixing layout shift in one viewport while breaking another.
- Deferring all work to the client and calling server output "fast" because the
  initial shell paints.
- Passing desktop lab metrics while ignoring mobile field data or p75 behavior.

## related

- Next.js performance: [[nextjs-performance.md]]
- React performance: [[react-performance.md]]
- Visual quality: [[../ui/visual-quality.md]]
