---
name: i18n-localization
description: Internationalization and localization guidance for language, locale, routes, formatting, translations, and fallback behavior.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://www.w3.org/International/
confidence: medium
confidence_reviewed: 2026-07-01
---

# i18n And Localization

## Checks

- Language and locale are distinct: language affects content; locale affects
  formatting such as date, number, currency, and sorting.
- URL, routing, hreflang/canonical behavior, and fallback rules are explicit.
- Translation ownership and missing-translation behavior are defined.
- Content length, directionality, pluralization, and date/time zones are tested.
- Search, sitemap, and CMS workflows understand language variants.

## Anti-Patterns

- Hardcoding English text in templates/components.
- Treating translated URLs as duplicates without hreflang/canonical rules.
- Formatting dates/currency without locale and timezone policy.

