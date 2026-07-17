---
name: data-map
description: Workflow-first data map standard for tracing business workflows to code, logical entities, raw database/schema locations, verification queries, and conditional LLM-Wiki knowledge pointers.
date_ingested: 2026-06-29
status: active
source_type: project-file-back
source_project: llm-wiki discussion
confidence: medium
confidence_reviewed: 2026-06-29
---

# data map

## purpose

`docs/data_map.md` is the project-level map from business workflow to data.

It lets agents answer, without broad grep:

- which data source/environment is in play;
- which workflow owns the data;
- which code reads or writes it;
- which logical fields map to database tables, CMS aliases, DTO fields, or raw
  storage columns;
- which raw query or inventory entry verifies the mapping;
- which LLM-Wiki knowledge pack to read only when the task needs deeper
  guidance.

The map should read like a map: start broad, then open the exact coordinate
needed for the task.

## relationship to other maps

Use stable IDs across maps:

```text
Business workflow
  -> UI map
  -> code map
  -> data map
  -> database inventory / raw query
  -> conditional LLM-Wiki knowledge pointer
```

Example:

```text
WF-PROGRAM-DETAIL
  -> UI-PROGRAM-DETAIL
  -> CODE-PROGRAM-DETAIL
  -> DATA-PROGRAMPAGE
  -> RAW-UMBRACO-PROGRAMPAGE
```

`docs/code_map.md` should point to data-map IDs. `docs/data_map.md` should
point to code-map IDs and raw inventory/query anchors. Do not force agents to
discover these paths by searching.

## required top-level sections

Recommended shape:

```md
# Data Map

## Quick Data Card
## Environment Matrix
## Business Workflow Index
## Active Data Surface
## Workflow Data Flows
## Core Entity/Table Cards
## Lookup / Reference Tables
## External / System Tables
## Raw Verification Pointers
## Knowledge Pointers
## Migration And Rollback Rules
## Sensitive Data / Security Notes
```

## quick data card

Every repo with non-trivial data should expose a short quick card in
`AGENTS.md` and repeat/expand it in `docs/data_map.md`:

```md
## Quick Data Card

- Local DB:
- Test DB:
- Production DB:
- Provider:
- Migration command:
- Seed/import flags:
- Never run destructive migration on:
- Full/raw inventory:
```

Never store secrets or passwords in the card.

## tiering rule

Do not list hundreds of tables as equal working context.

| Tier | Content | Default read? |
| --- | --- | --- |
| 0 | DB/environment/provider/safety quick card | yes, via `AGENTS.md` |
| 1 | Entities/tables/content types on active workflows | yes for data/backend tasks |
| 2 | Lookup/reference tables directly used by active workflows | when workflow needs them |
| 3 | Audit/archive/import/history tables | when migration/debug/import task needs them |
| 4 | System/vendor/generated tables | no; pointer only |

`docs/data_map.md` owns Tier 0-2 plus task-relevant Tier 3 entries.
`docs/database_inventory.md` or a generated schema inventory owns the full raw
table list.

## workflow-first cards

Prefer workflow cards over table dumps.

Each workflow card should include:

- stable workflow ID;
- user/business workflow;
- UI-map pointer when relevant;
- code-map pointer;
- logical entity/table IDs;
- read path;
- write path;
- raw verification pointer;
- validation checks;
- risk notes.

Example:

```md
## WF-PROGRAM-DETAIL

Purpose: render program detail and class information.

UI:
- `ui_map/group-C_programs.md#UI-PROGRAM-DETAIL`

Code:
- `docs/code_map.md#CODE-PROGRAM-DETAIL`

Data:
- `DATA-PROGRAMPAGE`

Flow:
Request `/chuong-trinh/{slug}`
-> `ProgramPageController`
-> `programPage`
-> `ProgramDetailViewModel`
-> `Views/ProgramPage.cshtml`

Reads:
- `DATA-PROGRAMPAGE`
- `DATA-PROGRAMCLASS` when class listings are shown

Writes:
- none at request time
- import job writes selected program fields

Raw verification:
- `docs/database_inventory.md#RAW-UMBRACO-PROGRAMPAGE`

Validation:
- route returns HTTP 200
- required mapped fields are non-empty
- legacy fallback is absent after migration
```

## entity/table cards

Each active entity/table card should map logical field to code, contract, and
raw storage. The goal is one-to-one traceability.

Use this shape:

```md
## DATA-PROGRAMPAGE

Logical entity:
- CMS/content type/table:
- Owner workflow:
- Owner code:
- Contract:
- Raw inventory:

| Logical field | Source alias/column | Code property/DTO | Raw table/column | Type | Read/write path | Notes |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |
```

For CMS-backed projects, map CMS aliases and property aliases first, then point
to raw CMS tables as verification detail. For relational applications, map
business fields to table/column and ORM/entity fields.

## database inventory boundary

Use `docs/database_inventory.md` for the full raw schema:

- complete table list;
- generated schema snapshots;
- raw SQL verification queries;
- column types and nullable/default notes;
- indexes and constraints;
- system/vendor table notes.

Agents should not read `docs/database_inventory.md` by default. They open the
specific raw anchor named by `docs/data_map.md` when verification requires it.

## knowledge pointers

Project maps may reference LLM-Wiki knowledge, but only as conditional pointers.
They must not make LLM-Wiki a default dependency for ordinary repo work.

Use a short table:

```md
## Knowledge Pointers

Read only when triggered:

| Trigger | LLM-Wiki reference |
| --- | --- |
| Add/remove/rename field, table, CMS alias, DTO, or schema | `${LLM_WIKI_ROOT}/wiki/knowledge/contracts/data-contracts.md` |
| API shape changes | `${LLM_WIKI_ROOT}/wiki/knowledge/contracts/api-design.md` |
| Data migration/backfill/rollback | `${LLM_WIKI_ROOT}/wiki/knowledge/operations/rollback.md` |
| Field contains PII/private/sensitive data | `${LLM_WIKI_ROOT}/wiki/knowledge/coding/security-baseline.md` |
| Ownership/boundary/platform decision changes | `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/architecture_approach_selection.md` |
```

## quality criteria

- Agent can start from a workflow ID and find UI, code, data, and raw
  verification coordinates without broad search.
- Active data surface is limited to the workflows currently being built or
  maintained.
- Important fields have one-to-one mapping: logical field -> source alias/column
  -> code property/DTO -> raw table/column -> type.
- Full schema inventory is available but not read by default.
- DB/environment names and safety rules are visible at bootstrap without
  exposing secrets.
- LLM-Wiki links are conditional triggers, not mandatory read steps.

## anti-patterns

- Listing every table in `docs/data_map.md` without workflow ownership.
- Hiding DB names/environments so agents must grep config before touching data
  work.
- Mapping code to data only by prose with no stable IDs.
- Using line numbers as the primary reference; prefer path + symbol/anchor
  because line numbers stale quickly.
- Putting secrets in map files.
- Treating generated inventory as the working map.
- Requiring LLM-Wiki lookup for ordinary data reads where repo maps are
  sufficient.
