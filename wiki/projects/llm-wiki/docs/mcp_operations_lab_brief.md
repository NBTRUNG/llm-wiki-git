---
type: Project Brief
project: LLM-Wiki
status: draft
date_created: 2026-07-10
task: LLMWIKI-075
tags: [mcp, local-ai, natural-language-operations, structured-data, permissions]
---

# MCP Operations Lab Brief

## purpose

Define a small, bounded lab for using local AI plus MCP/tool calls as a
natural-language operations layer over small structured datasets. The first
target domain is asset, attendance, and small ledger management where users ask
questions in plain language instead of finding functions in a conventional UI.

This brief is planning scope only. It does not authorize building an Agent
Platform MCP server, Open WebUI integration, or persistent worker runtime.

## source concept

- `wiki/concepts/ai-agent-rag-mcp/natural-language-mcp-operations-lab.md`

## problem

Small operational datasets often live in Excel or lightweight databases. Users
need answers such as counts, filters, ownership, attendance totals, and exported
reports. A traditional application requires users to find the right screen,
filter, and report action.

The lab tests whether a local model can translate natural language into narrow
backend tool calls while the backend remains responsible for exact data access,
authorization, updates, and audit.

## non-goals

- Do not use vector RAG as the authority for exact counts or inventory state.
- Do not let the LLM write directly to Excel, SQL, files, or production state.
- Do not expose MCP/tool servers directly to the public internet.
- Do not build a generic SQL execution tool for ordinary users.
- Do not promote this into Agent Platform runtime until schemas, permission
  boundaries, and ROI are reviewed.

## target workflow

```text
User asks a natural-language question
  -> chat UI captures identity and prompt
  -> local model selects a narrow tool
  -> MCP/OpenAPI tool validates inputs and permissions
  -> service layer queries structured data or creates a proposal
  -> result returns as answer, table, file path, or before/after preview
```

## candidate architecture

```text
Open WebUI or custom Python chat UI
  -> local LLM through Ollama or llama.cpp
    -> MCP tools or OpenAPI tool server
      -> Python service layer
        -> DuckDB / SQLite / PostgreSQL
        -> Excel import/export
        -> generated_reports/
        -> proposals table
        -> audit_log table
```

For the first lab, OpenAPI/FastAPI is acceptable as a debugging surface even if
MCP is the eventual interface. The service layer should not depend on a specific
chat UI.

## minimum data model

```text
assets
  asset_id
  asset_name
  asset_type
  department
  assigned_to
  status
  location
  purchase_date
  note

attendance
  employee_id
  employee_name
  department
  work_date
  check_in
  check_out
  status
  note

proposals
  proposal_id
  requested_by
  target_table
  target_id
  proposed_changes_json
  before_json
  after_json
  status
  created_at
  approved_by
  committed_at

audit_log
  event_id
  user_id
  action
  target
  result
  detail_json
  created_at
```

## minimum tool set

Read-only tools:

```text
describe_dataset()
search_assets(filters)
count_assets(filters, group_by)
get_attendance_summary(filters)
export_report(report_type, filters, format)
```

Proposal tools:

```text
propose_asset_update(asset_id, changes)
propose_attendance_update(employee_id, date_range, changes)
```

Commit tools:

```text
commit_proposal(proposal_id)
cancel_proposal(proposal_id)
get_audit_log(filters)
```

## permission model

Permissions must be enforced by the backend using trusted session identity, not
by model text.

```text
viewer
  search, count, summarize, export allowed

staff
  viewer permissions plus create proposals

manager
  staff permissions plus commit proposals within owned department/scope

admin
  system-wide commit and schema/configuration authority
```

Write flow:

```text
request -> propose -> validate -> preview -> confirm -> commit -> audit
```

Every denial should return a clear reason and write an audit event.

## first proof

Use a small sample Excel workbook or synthetic dataset and prove:

1. Natural-language count maps to a read-only tool.
2. The answer is derived from deterministic query output.
3. A report request creates a file in a controlled output directory.
4. An update request creates a proposal with before/after preview.
5. A user without commit permission cannot commit the proposal.
6. A manager/admin commit writes data and records an audit log.

## evaluation criteria

Pass if:

- exact count questions match backend query results;
- write attempts require proposal and confirmation;
- permission denials happen in backend, not only in model instructions;
- generated files are scoped to a configured reports directory;
- tool schemas are narrow enough that the model cannot request arbitrary SQL,
  shell, or filesystem actions;
- the lab can run without treating Agent Platform as source of truth.

Stop or revise if:

- the local model cannot reliably select basic tools;
- users need free-form SQL to answer routine questions;
- Excel write conflicts become the main risk;
- Open WebUI tool/function permissions are too broad for the intended users;
- the MCP layer duplicates business logic instead of wrapping the service layer.

## implementation sequence

1. Create a synthetic asset/attendance workbook and data dictionary.
2. Build the service layer over DuckDB or SQLite.
3. Add read-only FastAPI endpoints for search/count/export.
4. Add proposal and audit tables.
5. Add proposal/commit endpoints with role checks.
6. Expose the service to Open WebUI as OpenAPI tools or to an MCP adapter.
7. Measure tool-call reliability with small local models using
   `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`: verify deterministic
   outcomes and policy gates, inspect tool-call failures, repeat isolated
   trials, and record latency/token cost.
8. Decide whether a native MCP server is worth building.

## open decisions

- Use Open WebUI as the primary UI, or build a custom Python web UI?
- Use DuckDB for workbook-like analytics, or SQLite/PostgreSQL for write-heavy
  persistence?
- Keep Excel as input/export only, or allow controlled workbook rewrite?
- Which local model is reliable enough for tool selection on the available
  hardware?
- Should this become an Agent Platform pilot later, or remain a separate app
  lab?

## related knowledge

- `wiki/knowledge/ai-agent-rag-mcp/README.md`
- `wiki/knowledge/ai-agent-rag-mcp/mcp-tool-resource-contracts.md`
- `wiki/knowledge/ai-agent-rag-mcp/trust-safety-permissions.md`
- `wiki/knowledge/ai-agent-rag-mcp/agent-evaluation.md`
- `wiki/knowledge/mcp-server/testing-and-operations.md`
- `wiki/concepts/ai-agent-rag-mcp/natural-language-mcp-operations-lab.md`
