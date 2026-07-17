# workflow: agent platform audit

## purpose

Audit raw snapshots, extracted indexes, gateway output, WAP proposals, and audit
logs without mixing runtime evidence into LLM-Wiki.

## trigger

- User asks to verify evidence/test matrix.
- Gateway script or raw/extracted data changes.
- WAP proposal/audit output needs review.

## start file

`/home/admindebian/Agent-Platform/README.md`

## source of truth

Agent Platform owns runtime evidence. LLM-Wiki owns knowledge/workflow pointers
only.

## inputs

- Project id.
- Raw namespace.
- Manifest.
- Extracted JSONL/indexes.
- Gateway script/tool contract.
- Audit log or WAP proposal.

## allowed writes

- Agent Platform raw/extracted/audit/WAP files.
- LLM-Wiki pointer/source-map updates only when the boundary changes.
- Validation report in LLM-Wiki when the audit is about LLM-Wiki behavior.

## forbidden writes

- Do not move raw data into LLM-Wiki.
- Do not change curated wiki pages as part of an audit unless separately
  approved.
- Do not overwrite raw snapshots; create a new version.

## approval gate

Ask before changing gateway contracts, raw namespace layout, or publishing WAP
results.

## evidence

Record snapshot id, extracted paths, audit findings, WAP proposal id, and lint
result.

## canonical details

- `/home/admindebian/Agent-Platform/README.md`
- `../agent-platform/README.md`
