# Data Map

Guide before filling: `wiki/knowledge/project-docs/data_map.md`

Project:
Last updated:
Updated by:

## Quick Data Card

- Local DB:
- Test DB:
- Production DB:
- Provider:
- Migration command:
- Seed/import flags:
- Never run destructive migration on:
- Full/raw inventory:

## Environment Matrix

| Environment | Database/source | Provider | Owner | Safety rule |
| --- | --- | --- | --- | --- |
| local |  |  |  |  |
| test |  |  |  |  |
| production |  |  |  |  |

## Business Workflow Index

| Workflow ID | Workflow | UI map | Code map | Data IDs | Raw verification |
| --- | --- | --- | --- | --- | --- |
| WF- |  |  |  |  |  |

## Active Data Surface

| Data ID | Entity/table/content type | Tier | Owner workflow | Owner code | Notes |
| --- | --- | --- | --- | --- | --- |
| DATA- |  |  |  |  |  |

## Workflow Data Flows

### WF-<NAME>

Purpose:

UI:
- 

Code:
- 

Data:
- 

Flow:

```text
request/event/import
  -> code entry
  -> data entity/table
  -> output/view/API/job
```

Reads:
- 

Writes:
- 

Raw verification:
- 

Validation:
- 

Risk notes:
- 

## Core Entity/Table Cards

### DATA-<NAME>

Logical entity:
- Source table/content type:
- Owner workflow:
- Owner code:
- Contract:
- Raw inventory:

| Logical field | Source alias/column | Code property/DTO | Raw table/column | Type | Read/write path | Notes |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |

## Lookup / Reference Tables

| Data ID | Table/source | Used by | Notes |
| --- | --- | --- | --- |
|  |  |  |  |

## External / System Tables

| Source | Why it matters | Open only when |
| --- | --- | --- |
|  |  |  |

## Raw Verification Pointers

| Data ID | Raw inventory/query anchor | Purpose |
| --- | --- | --- |
|  |  |  |

## Knowledge Pointers

Read only when triggered.

| Trigger | LLM-Wiki reference |
| --- | --- |
| Add/remove/rename field, table, CMS alias, DTO, or schema | `${LLM_WIKI_ROOT}/wiki/knowledge/contracts/data-contracts.md` |
| API shape changes | `${LLM_WIKI_ROOT}/wiki/knowledge/contracts/api-design.md` |
| Data migration/backfill/rollback | `${LLM_WIKI_ROOT}/wiki/knowledge/operations/rollback.md` |
| Field contains PII/private/sensitive data | `${LLM_WIKI_ROOT}/wiki/knowledge/coding/security-baseline.md` |
| Ownership/boundary/platform decision changes | `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/architecture_approach_selection.md` |

## Migration And Rollback Rules

- 

## Sensitive Data / Security Notes

- 
