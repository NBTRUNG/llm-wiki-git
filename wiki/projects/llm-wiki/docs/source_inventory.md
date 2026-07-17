---
type: Source Inventory
project: LLM-Wiki
status: active
date_updated: 2026-07-11
---

# Source Inventory

This inventory names the sources used by the LLM-Wiki evidence/test-matrix
auditor pilot.

## Sources

| source id | source type | path | owner | sensitivity | canonical status | allowed use |
| --- | --- | --- | --- | --- | --- | --- |
| SRC-LLMWIKI-INDEX | markdown | `index.md` | LLM-Wiki | internal | canonical map | read, snapshot |
| SRC-LLMWIKI-TICK | markdown | `TICK.md` | LLM-Wiki | internal | canonical current coordination | read, snapshot |
| SRC-LLMWIKI-PROJECT-INDEX | markdown | `wiki/projects/llm-wiki/docs/project_index.md` | LLM-Wiki | internal | canonical project map | read, snapshot |
| SRC-LLMWIKI-TASKS | markdown | `wiki/projects/llm-wiki/docs/tasks.md` | LLM-Wiki | internal | canonical task rollup | read, snapshot, proposal-only changes |
| SRC-LLMWIKI-TEST-MATRIX | markdown table | `wiki/projects/llm-wiki/docs/test_matrix.md` | LLM-Wiki | internal | canonical proof rows | read, snapshot, proposal-only changes |
| SRC-LLMWIKI-PROJECT-STATUS | markdown | `wiki/projects/llm-wiki/docs/project_status.md` | LLM-Wiki | internal | canonical status log | read, snapshot |
| SRC-LLMWIKI-CHANGE-IMPACT-MAP | markdown | `wiki/projects/llm-wiki/docs/change_impact_map.md` | LLM-Wiki | internal | canonical impact map | read, snapshot, proposal-only changes |
| SRC-LLMWIKI-WORKFLOW-PROJECTION-REGISTRY | markdown | `wiki/projects/llm-wiki/docs/workflow_projection_registry.md` | LLM-Wiki | internal | canonical projection registry for LLM-Wiki-owned projections | read, snapshot, proposal-only changes |
| SRC-LLMWIKI-AGENT-DELIVERY-WORKFLOW | markdown | `wiki/knowledge/project-docs/agent_delivery_workflow.md` | LLM-Wiki | internal | canonical six-layer Agent Delivery Workflow | read, snapshot, proposal-only changes |
| SRC-LLMWIKI-HUMAN-MAP | markdown | `human/*.md` | LLM-Wiki | internal | noncanonical human-readable projection | read, inspect links |
| SRC-LLMWIKI-RECOVERY-ROUTER | markdown | `RECOVERY.md`; `workflows/manual-recovery.workflow.md` | LLM-Wiki | internal | canonical recovery entry and workflow | read, snapshot, proposal-only changes |
| SRC-LLMWIKI-BOUNDED-CHANGE | markdown | `wiki/knowledge/project-docs/bounded_change_fast_path.md`; `workflows/real-repo-work.workflow.md` | LLM-Wiki | internal | canonical shared bounded-change invariant | read, snapshot, proposal-only changes |
| SRC-LLMWIKI-VALIDATION-CATALOG | markdown | `reports/validation/README.md` | LLM-Wiki | internal | canonical validation catalog | read, snapshot |
| SRC-LLMWIKI-VALIDATION-REPORTS | markdown files | `reports/validation/*.md` | LLM-Wiki | internal | canonical evidence reports | read, index |
| SRC-AGENT-RAW-MANIFEST | jsonl | `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/manifests/llm-wiki.jsonl` | Agent Platform | internal | derived ledger | append, read |
| SRC-AGENT-EXTRACTED | jsonl | `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/extracted/<timestamp>/` | Agent Platform | internal | derived index | regenerate, read |
| SRC-AGENT-RESEARCH | markdown | `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/*.md` | Agent Platform | internal | noncanonical reviewed source record | create, read; immutable after review except governed correction |
| SRC-AGENT-WAP | markdown | `/home/admindebian/Agent-Platform/wap/proposals/*.md` | Agent Platform | internal | pending proposal | create, review |
| SRC-AGENT-AUDIT | jsonl | `/home/admindebian/Agent-Platform/audit/events.jsonl` | Agent Platform | internal | audit event log | append, read |

## Raw Storage Boundary

Raw snapshots are created by `snapshot_sources` and recorded in
`/home/admindebian/Agent-Platform/raw/projects/llm-wiki/manifests/llm-wiki.jsonl`.
They are audit evidence, not active source-of-truth files. New real projects
must use a separate project namespace under
`/home/admindebian/Agent-Platform/raw/projects/<project-id>/`.

Consulted-source logs and reviewed research source records use the same project
namespace under `research/`. Local `LLM-Wiki/raw/` is legacy-only and is not an
allowed destination for new active raw artifacts.
