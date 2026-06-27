---
name: contracts-knowledge
description: Reusable guidance for API, data, event, and integration contracts.
date_ingested: 2026-06-27
status: active
---

# contracts knowledge

This folder owns reusable knowledge for contracts between modules, services,
frontends, jobs, data stores, external systems, and agents.

## index

- [[api-design.md]] — HTTP/API contracts, compatibility, errors, pagination,
  auth boundaries, and versioning.
- [[data-contracts.md]] — schemas, migrations, ownership, compatibility, and
  data-shape proof.
- [[event-contracts.md]] — async event contracts, schema evolution,
  idempotency, retries, replay, and DLQ expectations.

Use repo `docs/contracts.md` as source of truth for active project contracts.
This folder provides reusable guidance only.
