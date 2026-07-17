---
name: numerical-methods
description: Numerical precision guidance for floating point, decimals, rounding, units, stability, and accumulated error.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# numerical methods and precision

Use this guide when code handles money, tax, customs duties, scoring, metrics,
scientific values, percentages, thresholds, or accumulated numeric operations.

## precision rules

- Use decimal/fixed-point types for money and statutory calculations when the
  language/platform supports them.
- Define rounding mode, decimal places, and timing of rounding.
- Keep units explicit.
- Avoid equality comparison on floating point values; use tolerance when
  appropriate.
- Track accumulated error in loops, sums, averages, and iterative methods.
- Validate extreme, zero, negative, missing, and boundary values.

## reporting

```text
Numeric type:
Units:
Rounding mode:
Precision:
Allowed error:
Boundary cases:
Reference examples:
```

## anti-patterns

- Mixing cents and dollars, kilograms and grams, local and UTC dates, or tax
  inclusive/exclusive values without field names.
- Rounding at every intermediate step unless the domain rule requires it.
- Using binary floating point for exact money/tax comparisons.
- Ignoring time zone and calendar rules in interest, deadlines, tariffs, or
  validity windows.

