---
name: knowledge-lookup-metric
description: Scoring rule for deciding when real-repo work should consult LLM-Wiki vs use active repo docs only. Use when classifying a task before reading broadly.
date_ingested: 2026-05-23
status: active
---

# knowledge lookup metric guide

## purpose

`docs/knowledge_lookup_metric.md` gives real project repos a local rule for
deciding when agents should consult LLM-Wiki.

It is a repo doc because the active repo owns current implementation state.
LLM-Wiki owns only the reusable method and template.

## when a repo needs this doc

Add this doc when a project uses LLM-Wiki as:

- architecture/history context;
- reusable workflow or implementation guidance;
- cross-agent onboarding material;
- a source for prior decisions or rejected options.

Do not add it just to make agents read more files. The point is selective lookup.

## required content

A good `docs/knowledge_lookup_metric.md` states:

- active repo is the source of truth;
- LLM-Wiki is reference knowledge only;
- Coding Pack loading is a separate mandatory baseline for repo coding
  sessions, not a Knowledge Lookup score decision;
- when to score;
- the five scoring criteria;
- score-to-action decision rule;
- conflict handling;
- required report section.

Use `templates/knowledge_lookup_metric.template.md` as the starting skeleton.

## quality rules

- Keep the metric short enough for agents to use before implementation.
- Do not put project task status in the metric doc.
- Do not make LLM-Wiki mandatory for every task.
- Make the conflict rule explicit.
- Require report evidence when the task touches architecture, scope, contracts,
  security, production, or reusable blueprints.

## common mistakes

| Mistake | Fix |
| --- | --- |
| Treating LLM-Wiki as current project status | Use repo `docs/project_status.md` and `docs/tasks.md` |
| Reading LLM-Wiki for every tiny task | Score first; skip lookup at 0-2 |
| Treating Coding Pack as optional lookup | Load it once for coding sessions; score only additional lookup |
| Copying old LLM-Wiki decisions into repo docs | Raise to Codex/main-agent and update repo docs deliberately |
| Reporting "consulted wiki" without reason | Record score, reason, findings, conflicts, and decision |
