---
type: Source Of Truth Rules
project: LLM-Wiki
status: active
date_updated: 2026-07-10
---

# Source Of Truth Rules

This file defines source-of-truth boundaries for the external Agent Platform
pilot rooted at `/home/admindebian/Agent-Platform`. It applies to the LLM-Wiki
evidence/test-matrix auditor scope and human-requested knowledge refreshes that
promote research into canonical knowledge pages.

## Rule

Canonical Markdown and validation reports remain the source of truth. Raw
snapshots, derived JSONL, audit events, and WAP proposals are supporting
artifacts.

## Precedence

Use this order when sources conflict:

1. Current user instruction.
2. Safety and explicit constraints.
3. `llm-wiki-constitution.md`.
4. `index.md` and `TICK.md`.
5. `wiki/projects/llm-wiki/docs/project_index.md`.
6. Active LLM-Wiki project docs, including `tasks.md` and `test_matrix.md`.
7. Validation reports under `reports/validation/`.
8. Agent-platform raw snapshots and manifests.
9. Derived JSONL indexes.
10. WAP proposals that have not been approved.

## Artifact Roles

| artifact | role | canonical |
| --- | --- | --- |
| `wiki/projects/llm-wiki/docs/test_matrix.md` | proof row source | yes |
| `wiki/projects/llm-wiki/docs/tasks.md` | task/status rollup | yes |
| `reports/validation/*.md` | evidence reports | yes |
| `/home/admindebian/Agent-Platform/raw/projects/<project-id>/snapshots/` | immutable per-run copies | no |
| `/home/admindebian/Agent-Platform/raw/projects/<project-id>/manifests/*.jsonl` | snapshot ledger with checksums | no |
| `/home/admindebian/Agent-Platform/raw/projects/<project-id>/extracted/*.jsonl` | derived machine-readable indexes | no |
| `/home/admindebian/Agent-Platform/raw/projects/<project-id>/research/*.md` | reviewed source records and consulted-source logs | no |
| `/home/admindebian/Agent-Platform/wap/proposals/*.md` | pending change proposals | no |
| `/home/admindebian/Agent-Platform/audit/events.jsonl` | append-only event log | no |

## Change Rule

The LLM-Wiki Auditor may create WAP proposals. It may not apply them. A human or
integration owner must approve source-of-truth changes before canonical Markdown
is edited.

For knowledge refresh work, use this default sequence:

1. record consulted-source logs/source records under the project's Agent
   Platform `research/` namespace when a durable raw record is needed, and write
   the synthesized research brief in `reports/research/`;
2. create a WAP proposal that lists candidate canonical changes;
3. wait for human approval unless the current user instruction explicitly says
   to update/publish/apply the changes now;
4. apply approved canonical changes;
5. write validation evidence and update `tasks.md` / `test_matrix.md`;
6. record the audit event.

If the agent treats a user instruction as approval to publish immediately, the
validation report and WAP proposal must say so explicitly. Do not silently
collapse proposal and publish into one step.

Any source-of-truth change proposal must state:

- current canonical source;
- proposed change;
- reason;
- affected workflow IDs;
- affected files;
- before snapshot or raw manifest reference;
- validation plan;
- rollback plan;
- approval owner.

## Raw Artifact Rule

Snapshots preserve what the agent saw at run time. They are not active wiki
documents and should not be used to satisfy current project state except as
audit evidence.

Raw remains outside LLM-Wiki. The local filesystem pilot uses
`/home/admindebian/Agent-Platform/raw/projects/<project-id>/`. Project repos
and LLM-Wiki may keep pointers/source inventory rows, but they must not embed
raw snapshots as active docs. This preserves project isolation without giving
new contributors direct write access to raw evidence.

Reviewed research source records use the same project namespace under
`research/`. Local `LLM-Wiki/raw/` is legacy imported/reference storage only;
do not add active raw records there. After migration, remove duplicate active
copies from LLM-Wiki once path references and checksums have been validated.

## Derived Index Rule

Derived JSONL can be deleted and regenerated. Each record should preserve
enough traceability to return to the canonical source file and source line.
