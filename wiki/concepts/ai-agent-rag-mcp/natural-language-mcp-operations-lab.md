---
type: Concept Note
status: temporary
date_created: 2026-07-10
tags: [mcp, local-ai, rag, structured-data, open-webui, excel, permissions]
---

# Natural-language MCP Operations Lab

## definition in this context

This concept treats a local AI assistant as a natural-language operations layer
for small business datasets, not as the source of business truth. Users ask in
plain Vietnamese or English, the model selects a narrow tool, and the backend
performs deterministic lookup, counting, filtering, export, or controlled
updates.

Primary lab examples:

- asset management from Excel files;
- attendance and small operational ledgers;
- user questions such as "con bao nhieu laptop Dell o phong ke toan?";
- report/file generation for the user;
- permission-gated update requests.

The key design rule is that the LLM interprets intent, but does not invent
counts, permissions, or data mutations. Those belong to backend tools.

## use when

Use this pattern when:

- data is small or medium and lives in Excel, SQLite, DuckDB, or PostgreSQL;
- users know what they want but do not want to navigate a traditional UI;
- the expected work is lookup, count, filter, summarize, export, or simple
  field updates;
- RAG is useful for textual policy/context, but exact numbers must come from
  structured queries;
- the lab goal is to evaluate MCP tool calling with local AI before building a
  larger product.

## do not use when

Do not use this as the sole mechanism when:

- high-stakes decisions require complex reasoning or legal/financial judgment;
- many users will concurrently mutate shared Excel files;
- the data model has not been normalized enough for reliable filters;
- the model is expected to write directly to files or databases without preview,
  authorization, and audit;
- vector RAG is being used for exact inventory/counting questions.

## reference architecture

```text
Open WebUI / custom Python chat UI
  -> local LLM
    -> MCP tools or OpenAPI tools
      -> service layer
        -> DuckDB / SQLite / PostgreSQL
        -> Excel import/export
        -> generated reports
        -> audit log
```

For the lab, Open WebUI is useful as a fast chat surface. A custom Python web UI
is better when the workflow needs tables, approval screens, file download
buttons, and explicit before/after previews.

## data handling

Prefer importing Excel into a queryable store before answering operational
questions:

- use DuckDB or SQLite for small local datasets;
- keep Excel as an input/export format, not the only live transaction store;
- generate report files under a controlled reports directory;
- avoid multiple processes writing directly to the same workbook;
- keep a data dictionary for column names, aliases, and business meanings.

RAG/vector search can support policy and free-text notes, but exact operational
answers should come from SQL or typed service functions.

## tool boundary

Expose small, typed tools rather than a generic "run query" or "update Excel"
tool.

Read tools:

```text
list_tables()
describe_table(table)
query_assets(filters)
count_assets(filters, group_by)
get_attendance(filters)
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

The assistant may choose tools, but backend tools own validation, permission
checks, and final writes.

## update and permission model

Do not let a model write directly to the canonical data store. Use a
proposal-confirm-commit flow:

```text
User request
  -> propose_update(...)
  -> backend validates target rows and permissions
  -> backend returns before/after preview
  -> user confirms
  -> commit_proposal(...)
  -> backend writes and records audit log
```

Suggested role model:

```text
viewer
  read/search/count/export only

staff
  create update proposals

manager
  approve or commit changes within owned department/scope

admin
  commit system-wide changes and manage schemas
```

Permissions must be enforced in the backend or MCP server using trusted session
identity. The LLM's statement about a user's role is not authoritative.

## local hardware fit

A lab server with 32 GB RAM and older NVIDIA Quadro K1200 cards is acceptable
for this concept because the workload is mostly structured data access and
light tool orchestration. The GPU is not the main design constraint.

Use a small local model for intent parsing and tool selection. If native
function calling is unreliable on a small model, prefer prompt-based tool
calling or a custom parser/router with explicit confirmation for writes.

## security notes

- Do not expose MCP or tool servers directly to the internet.
- Put the service behind LAN/VPN or a reverse proxy with authentication.
- Run the service as a non-root user.
- Restrict tool permissions by role and scope.
- Record all write proposals, commits, denials, and generated files.
- Treat imported Open WebUI tools/functions as server-side code execution and
  allow only trusted administrators to install them.

## applied in

- Temporary lab idea for local MCP-based asset, attendance, and small data
  management workflows.
- Potential future bridge between Open WebUI, a local LLM, and Python services
  over DuckDB/SQLite/Excel.

## lessons learned

- The useful abstraction is not "AI replaces the app"; it is "AI routes plain
  language to narrow backend tools."
- Exact counts and updates must be deterministic.
- RAG is supplementary for text context, not a replacement for structured
  queries.
- Update workflows need preview, confirmation, permission checks, and audit
  from the start.

## related decisions

- No formal decision yet. This is a temporary concept note for future MCP lab
  planning.

## sources

- Conversation note, 2026-07-10: user described a local MCP lab for asset
  management, attendance, Excel-based data, natural-language querying, report
  generation, and permission-gated updates.

