# code map

Guide before filling: repo-specific. Keep this file short and navigational.

Project:
Last updated:
Updated by:

## purpose

Map major runtime/code ownership areas so agents can find the right source file
without scanning the whole repo.

## source of truth

- Repo entry file:
- Repo rules:
- Architecture doc:
- Contracts:
- Data map:
- Database inventory:
- UI map:
- Decisions:

## runtime entrypoints

| Area | Entry file/path | Owner | Notes |
| --- | --- | --- | --- |
|  |  |  |  |

## feature/module map

| Feature/module | Main files | Data/API dependencies | UI dependencies | Tests/proof |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## workflow trace pointers

Use stable IDs from UI, code, and data maps so agents can move from business
workflow to exact code and raw data coordinates without broad search.

| Workflow ID | Code ID | Main symbols/paths | Data IDs | Raw verification |
| --- | --- | --- | --- | --- |
| WF- | CODE- |  | DATA- | RAW- |

## stable panel/component anchors

Do not record manual line offsets. New projects assign stable panel/component
IDs at creation. Existing deployed repos use source comments when a bounded
rollout or touched-panel task explicitly approves them.

| Panel/component ID | Responsibility | Primary file(s) | Exact source marker or symbol | Related server/client symbols | Dependencies | Minimum verifier | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| PANEL- |  |  | `PANEL:<id>` |  |  |  | active / hidden / absorbed / retired |

For mixed template files, use only the roles that exist:

```text
PANEL:<id>:DATA
PANEL:<id>:VIEW
PANEL:<id>:CLIENT
```

One coherent region needs one marker. Do not add `BEGIN`/`END`, comment every
function, or add runtime DOM attributes unless runtime/browser tooling has a
separate approved need.

## shared helpers/services

| Helper/service | Purpose | Use instead of | Notes |
| --- | --- | --- | --- |
|  |  |  |  |

## generated/vendor/output paths

Do not manually edit these unless the task explicitly says so.

- 

## known hotspots

| Path | Why risky | Rule before editing |
| --- | --- | --- |
|  |  |  |
