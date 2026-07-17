---
name: parsing-deduplication
description: Parsing, normalization, validation, canonicalization, and deduplication guidance.
date_ingested: 2026-06-29
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-06-29
---

# parsing deduplication

Use this guide for imports, messy source data, text normalization, identifiers,
dedupe, merge, validation, and canonicalization.

## parse pipeline

```text
raw input
  -> decode
  -> validate shape
  -> normalize fields
  -> canonical key
  -> detect duplicates
  -> map to domain model
  -> reject/review/accept
  -> audit report
```

## normalization rules

- Keep raw value for audit.
- Store normalized value only with rule/version.
- Do not destroy source data during import.
- Normalize Unicode, whitespace, casing, punctuation, dates, numbers, and
  identifiers explicitly.
- Use locale-specific rules when language matters.

## dedupe strategy

| Level | Meaning |
| --- | --- |
| exact key | stable ID, code, slug, email, external ID |
| canonical key | normalized composite key |
| fuzzy candidate | score-based possible match |
| review bucket | human decision required |
| no match | create new record or reject |

## merge rule

Never merge records without field precedence:

```text
field:
source priority:
conflict rule:
empty/null rule:
audit note:
```

## anti-patterns

- Regex-only parser for nested/structured formats when a parser exists.
- Auto-merging medium-confidence matches.
- Losing raw source value after normalization.
- Hidden normalization that changes business meaning.
- Import job without duplicate, skipped, invalid, and failed counts.
