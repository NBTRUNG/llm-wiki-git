---
name: project-closeout-distillation
description: Project-end distillation workflow. Defines which real-project artifacts should be generalized into LLM-Wiki and which must stay in the repo.
date_ingested: 2026-06-27
status: active
---

# project closeout distillation

## purpose

Use this guide when a real project phase or whole project ends.

Closeout distillation transfers reusable knowledge, not project state.

```text
Repo keeps: what happened, exact tasks, exact decisions, exact evidence.
LLM-Wiki gets: generalized lessons, patterns, troubleshooting, runbooks,
concepts, anti-patterns, templates, and workflow improvements.
```

## closeout read set

Read from the active repo:

```text
docs/decisions.md or docs/adrs/
docs/tasks.md
docs/test_matrix.md
docs/project_status.md
docs/contracts.md when present
reports/agent/
reports/validation/
notable incidents/errors/runbooks
```

Read only what is needed to identify reusable candidates. Do not mirror full
project history into LLM-Wiki.

## transfer to LLM-Wiki

Transfer only generalized, reusable knowledge:

- patterns likely to apply to another project;
- troubleshooting likely to recur;
- runbooks for deploy, rollback, migration, recovery, config, or release gates;
- anti-patterns that caused errors, rework, scope drift, or agent confusion;
- validation techniques that caught real issues;
- architecture/security/contract/frontend/UI/operations lessons;
- concept pages needed for future agents;
- improvements to templates, harness, read paths, or agent workflow.

## keep in repo only

Keep these in the repo:

- project-specific task status and sprint history;
- full `tasks_archive.md`;
- detailed agent reports with no reusable lesson;
- exact business/customer decisions;
- private data, credentials, env values, deployment secrets, or internal
  operational details;
- exact code snippets that do not generalize;
- active project contracts and current status.

## classification table

For each candidate, classify:

| Candidate | Evidence | Disposition | Target |
| --- | --- | --- | --- |
|  | repo report/decision/test | transfer | LLM-Wiki path |
|  | repo report/decision/test | repo-only | repo path |
|  | repo report/decision/test | discard | reason |
|  | repo report/decision/test | queue | feedback-loop queue row |

Use `queue` when a lesson seems credible but has weak generalization evidence.

## closeout steps

1. Identify source repo and closeout scope.
2. Read the closeout read set.
3. Build a candidate table.
4. Apply evidence and generalization gates from [[../../../harness/feedback-loop.md]].
5. Write LLM-Wiki pages only for transferable candidates.
6. Update indexes and wikilinks.
7. Write a closeout distillation report in the repo or LLM-Wiki validation
   reports, depending on ownership.
8. Add a repo closeout note linking back to LLM-Wiki pages when appropriate.

## targets by type

- Architecture: `wiki/knowledge/architecture-patterns/` or
  `wiki/knowledge/project-docs/architecture_skill.md`
- Coding/testing/security: `wiki/knowledge/coding/`
- Frontend engineering: `wiki/knowledge/frontend/`
- UI/UX/design system: `wiki/knowledge/ui/` or
  `wiki/knowledge/project-docs/design_system.md`
- Contracts: `wiki/knowledge/contracts/`
- Operations/runbooks: `wiki/knowledge/operations/`
- Agent workflow: `wiki/knowledge/project-docs/`, `harness/`, or templates
- Concepts: `wiki/concepts/`

## stop conditions

Stop and ask before promoting when:

- candidate includes private or sensitive project data;
- project-specific decision is being copied rather than generalized;
- evidence is only chat memory;
- candidate contradicts existing LLM-Wiki guidance;
- ownership is unclear between repo docs and LLM-Wiki.
