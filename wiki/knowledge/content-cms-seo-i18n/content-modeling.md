---
name: content-modeling
description: Content model and CMS schema guidance for reusable types, fields, relationships, routes, and editorial constraints.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# Content Modeling

## Checks

- Model content by editorial meaning, not page layout alone.
- Name content types, fields, owners, validation rules, and relationships.
- Separate reusable content from one-off presentation.
- Define required/optional fields and fallback behavior.
- Record route/URL rules, aliases, slugs, and canonical identifiers.
- Include preview/draft/publish state when the CMS supports it.

## Anti-Patterns

- One giant page type for every workflow.
- Presentation-only field names that hide editorial meaning.
- Hardcoded content assumptions in templates without schema validation.

