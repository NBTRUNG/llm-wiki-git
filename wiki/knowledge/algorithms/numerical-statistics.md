---
name: numerical-statistics
description: Numeric precision, scoring, metrics, statistics, and experiment guidance.
date_ingested: 2026-06-29
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-06-29
---

# numerical statistics

Use this guide when handling money, scoring, percentages, ranking scores,
aggregates, experiments, metrics, or statistical claims.

## precision rules

- Use decimal/fixed-point for money and exact business amounts.
- Avoid direct floating-point equality.
- Define rounding mode and display precision.
- Keep raw numerator/denominator for percentages.
- Avoid accumulating unbounded floating-point errors in long loops.

## metric definition

Every metric needs:

```text
Name:
Business meaning:
Formula:
Unit:
Population:
Window:
Exclusions:
Owner:
Known caveats:
```

## scoring/ranking

- Define feature weights and units.
- Normalize features before combining.
- Set deterministic tie-breakers.
- Log enough score components to debug surprising results.
- Do not present a score as objective when it encodes business choices.

## experiments

- Define hypothesis before looking at results.
- Define primary metric and guardrail metrics.
- Avoid changing exposure criteria mid-test.
- Segment only when justified.
- Treat small samples and multiple comparisons carefully.

## anti-patterns

- Averaging percentages without weights.
- Ranking with hidden random tie order.
- Using floating-point for currency.
- Reporting uplift without baseline/window/sample size.
- Optimizing one metric while ignoring guardrails.
