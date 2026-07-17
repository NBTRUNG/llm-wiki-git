# workflow: knowledge refresh

## purpose

Promote reviewed reusable knowledge into LLM-Wiki without confusing raw sources,
research notes, and curated knowledge.

## trigger

- User asks to update knowledge from current sources.
- A real project produces a reusable lesson.
- A contradiction or stale rule is discovered.

## start file

- `harness/auto-research.md` for current-source research.
- Relevant `wiki/knowledge/<pack>/README.md` for local file-back.

## source of truth

Before approval, candidate research/proposals are evidence. After approval and
validation, the relevant LLM-Wiki knowledge file is the curated source.

## inputs

- User-approved scope.
- Source list or project evidence.
- Existing knowledge file.
- Confidence, owner, freshness, and source references.

## allowed writes

- Research brief or validation report.
- Candidate/WAP proposal when approval is required.
- Curated `wiki/knowledge/` files after approval.
- LLM-Wiki task/test-matrix/report indexes after publish.

## forbidden writes

- Do not paste raw articles or long external content into knowledge files.
- Do not silently promote volatile or unsupported claims.
- Do not update real repo state while filing reusable knowledge.

## approval gate

Human approval is required before publishing candidate knowledge when the source
is external/current, changes a durable rule, or affects security/architecture.

## evidence

Record sources, promoted files, confidence, validation command, and residual
risk in a validation report.

## canonical details

- `../harness/auto-research.md`
- `../harness/feedback-loop.md`
- `../wiki/knowledge/project-docs/post_task_distillation.md`
