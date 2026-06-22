# LLMWIKI-020 roadmap task packet validation

Date: 2026-05-22  
Reviewed by: Codex  
Scope: add roadmap/task packet for selective imported-model ingest, Knowledge Lookup Metric, refreshed visual flows, and canonical read workflow.

## result

Accepted as planning/read-workflow evidence.

`LLMWIKI-020` is in progress. The current canonical LLM-Wiki model remains the source of truth.

## inputs reviewed

- `llm_wiki_knowledge_lookup_blueprint.md`
- `llm-wiki/`
- `llm-wiki/concept_vs_spec_flow.svg`
- `llm-wiki/llm_wiki_structure_flow.svg`
- `index.md`
- `global-rules.md`
- `program.md`
- `harness/README.md`
- `harness/read-workflow.md`
- `wiki/projects/llm-wiki/project_manifest.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `wiki/projects/llm-wiki/docs/decisions.md`
- `active.md`

## decisions recorded

- Keep the current canonical LLM-Wiki model.
- Treat imported `llm-wiki/`, `llm-wiki.zip`, and blueprint files as reference inputs.
- Open `LLMWIKI-020` for a bounded standardization pass.
- Adopt the Knowledge Lookup Metric as planned reusable guidance so repo agents can score when to consult LLM-Wiki.
- Preserve API scaffold files as examples only; do not make them global law.
- Add `harness/read-workflow.md` as the canonical read-path guide.

## files changed

- `harness/read-workflow.md`
- `harness/README.md`
- `global-rules.md`
- `program.md`
- `index.md`
- `active.md`
- `wiki/projects/llm-wiki/project_manifest.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `wiki/projects/llm-wiki/docs/decisions.md`
- `reports/validation/2026-05-22-llmwiki-020-roadmap-task-packet.md`

## validation

- File readback confirms `LLMWIKI-020` task packet exists.
- File readback confirms `harness/read-workflow.md` exists.
- Test matrix has an `in_progress` row for `LLMWIKI-020`.
- Project status now lists `LLMWIKI-020` as the next standardization work.
- Decision log includes ADR-0007 for selective ingest and Knowledge Lookup Metric adoption.

## not done

- No coding/security/testing guides were ingested yet.
- No DoD/review guide was created yet.
- No diagrams were redrawn yet.
- Imported `llm-wiki/` and `llm-wiki.zip` were not moved or deleted.
- No GitHub sync was attempted.

## next action

Run `LLMWIKI-020` step 2: create canonical Knowledge Lookup Metric guidance and template, then update agent result report and repo rule templates to reference it.
