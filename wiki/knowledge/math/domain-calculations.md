---
name: domain-calculations
description: Domain calculation guidance for tax, customs, finance, compliance, scoring, and other formula-driven business rules.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# domain calculations

Use this guide when software implements formulas from business, legal, tax,
customs, finance, logistics, education, healthcare, or compliance domains.

## rule

Domain formulas need source, jurisdiction, version/date, and assumptions.

```text
Formula:
Source:
Jurisdiction/domain:
Effective date:
Inputs:
Units:
Rounding:
Exemptions/exceptions:
Examples:
Human/domain owner:
```

## coding checks

- Keep formula constants named and traceable to a source.
- Separate formula implementation from current-source data such as tax rates,
  thresholds, tariff rates, exchange rates, or official tables.
- Add golden examples from official or human-approved calculations.
- Version formulas when rules change over time.
- Record when a human expert must confirm the calculation.

## high-risk domains

For customs, tax, legal, healthcare, finance, and regulated domains, LLM-Wiki
can support workflow and implementation, but final advice requires official
source verification and appropriate human/domain review.

## anti-patterns

- Hardcoding volatile rates without source/date.
- Encoding legal/tax assumptions as unexplained magic numbers.
- Testing only happy-path examples.
- Returning a single number without inputs, units, date, and rounding policy.

