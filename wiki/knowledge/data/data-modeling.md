---
name: data-modeling
description: Entity, schema, aggregate, and contract modeling guidance.
date_ingested: 2026-06-29
status: active
source_type: distilled-practice
source_urls:
  - https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/data-store-overview
  - https://martinfowler.com/articles/data-monolith-to-mesh.html
confidence: medium
confidence_reviewed: 2026-06-29
---

# data modeling

Use this guide when designing entities, CMS content types, database tables,
documents, DTOs, imports, exports, or reporting datasets.

## modeling order

1. Name the business concept in user language.
2. Name the workflow that creates, changes, reads, and retires it.
3. Define source of truth and owner.
4. Define lifecycle states.
5. Define invariants and validation.
6. Define read models/views separately from stored shape when needed.
7. Define compatibility and migration path before changing existing fields.

## entity card

Every important entity should have a compact card in the project data map:

```text
Data ID:
Business name:
Source of truth:
Owner workflow:
Owner code:
Storage/table/content type:
Primary key:
Lifecycle states:
Required fields:
Derived fields:
External consumers:
Raw verification anchor:
```

## relational modeling

Use relational modeling when:

- transactions across related rows matter;
- constraints, foreign keys, uniqueness, and reporting matter;
- administrators need flexible filters and joins;
- the domain is still changing and you need safe schema evolution.

Rules:

- Use stable primary keys.
- Put uniqueness where the database can enforce it.
- Model many-to-many relationships explicitly.
- Do not hide critical integrity only in UI code.
- Use views/read models for heavy listing or reporting when the write model is
  normalized.

## document modeling

Use document modeling when:

- the aggregate is usually read/written as one unit;
- nested shape is stable and maps naturally to API/UI;
- cross-document joins and transactions are not dominant.

Rules:

- Store duplicated read fields intentionally, with owner and refresh rule.
- Keep document size and hot-field update frequency under control.
- Design versioning for document shape changes.
- Do not choose documents to avoid thinking about relationships.

## event/log modeling

Use event/log modeling when:

- the important fact is append-only;
- consumers need replay or audit trail;
- multiple downstream workflows react asynchronously.

Rules:

- Version events.
- Define producer, consumers, idempotency key, ordering expectation, and replay
  behavior.
- Do not use events as a replacement for a clear source-of-truth model.

## CMS/content modeling

Use CMS/content types when:

- non-developer editors own content;
- publishing workflow matters;
- fields map to pages, navigation, media, and editorial governance.

Rules:

- Treat CMS aliases as data contracts.
- Keep public rendering resilient to missing or legacy content.
- Separate editorial fields from runtime-only computed fields.
- Record content type aliases and raw storage anchors in the project data map.

## anti-patterns

- Field added without source, owner, fallback, and display behavior.
- UI card fields treated as the canonical data model.
- Import source shape copied directly into the product model.
- Analytics dataset treated as source of truth.
- Multiple modules/services writing the same table without an ownership rule.
