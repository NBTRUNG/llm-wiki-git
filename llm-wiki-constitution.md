# llm-wiki constitution

## 1. purpose

LLM-Wiki is a persistent knowledge and operating vault for AI-assisted work.

It exists to:

- capture concepts before they become repos;
- store reusable knowledge and lessons across projects;
- define how agents should create docs, tasks, validation, and handoffs;
- preserve evidence and migration history;
- help agents find the right source of truth quickly.

LLM-Wiki is not:

- a replacement for real project repositories;
- a second implementation status board after a repo exists;
- a dump for unreviewed logs;
- a place where agents invent missing facts.

## 2. core law

```text
knowledge lives in LLM-Wiki.
implementation state lives in the real repo.
evidence lives in reports/logs.
current focus lives in active.md only for LLM-Wiki work.
```

When a real repo exists, repo docs win over LLM-Wiki summaries.

## 3. source-of-truth hierarchy

For any request, use this order:

1. Current user instruction.
2. Safety, privacy, and explicit constraints.
3. Real project repo docs, if a repo exists.
4. Real project repo code/config/content files.
5. LLM-Wiki project link note in `projects/`.
6. LLM-Wiki pre-repo project docs in `wiki/projects/`, only if no repo exists.
7. LLM-Wiki knowledge/playbooks.
8. Raw sources when validating synthesis.
9. Model background knowledge.

Conflict rules:

- Current user instruction wins over `active.md`.
- Repo `docs/project_status.md` wins over LLM-Wiki project notes.
- Repo `docs/tasks.md` wins over agent reports.
- Repo `docs/agent_status.md` wins over private agent handoff notes.
- Repo `docs/decisions.md` wins over assumptions.
- Raw source wins over synthesis when the source is current and relevant.
- If two sources conflict and hierarchy does not settle it, mark `contradiction`.

## 4. folder roles

| Path | Role |
| --- | --- |
| `index.md` | Entry map and compact read order. |
| `active.md` | Current LLM-Wiki work only. |
| `global-rules.md` | Practical rules for working in LLM-Wiki. |
| `llm-wiki-constitution.md` | This stable law file. |
| `program.md` | Operating procedures for wiki operations. |
| `raw/` | Raw sources, read-only by default. |
| `wiki/knowledge/` | Reusable knowledge and guides. |
| `wiki/knowledge/project-docs/` | Canonical standards for repo docs. |
| `wiki/knowledge/coding/repo-code-rules.md` | General repo coding/review/test rules. |
| `templates/` | Copyable skeletons. |
| `harness/` | Workflows, task packets, validation, done criteria. |
| `projects/` | Minimal project link notes. |
| `wiki/projects/` | Pre-repo project source-of-truth only. |
| `archive/` | Non-canonical imported/reference material only. |
| `reports/validation/` | Validation and review evidence. |
| `logs/test-output/` | Long test/command logs. |

## 5. file role boundaries

### active.md

Tracks only current LLM-Wiki work and the immediate next LLM-Wiki step.

It must not track real repo task status, sprint status, implementation status, or agent assignments.

### global-rules.md

Defines the daily working rules for LLM-Wiki.

It should be practical and short enough for frequent reading.

### program.md

Defines operations: ingest, query, lint, compile, file-back, validate, checkpoint.

It is procedural, not a policy debate.

### templates/

Templates are skeletons. They may include a short link to a guide, but durable explanation belongs in `wiki/knowledge/`.

### wiki/knowledge/

Knowledge files explain purpose, quality criteria, anti-patterns, and reusable lessons.

They are not project-specific status files.

## 6. project phase model

### idea / concept

The project is still exploratory.

Allowed LLM-Wiki locations:

```text
wiki/concepts/<concept>.md
projects/<ProjectName>/
reports/validation/
```

### pre-repo

No real repo exists yet, so LLM-Wiki may be source of truth.

Allowed source-of-truth location:

```text
wiki/projects/<project>/
```

Expected structure:

```text
wiki/projects/<project>/
  project_manifest.md
  docs/
    project_brief.md
    project_status.md
    contracts.md
    implementation_plan.md
    tasks.md
    decisions.md
    test_matrix.md
    agent_status.md
  wiki/
    architecture.md
```

Use `wiki/knowledge/project-docs/` as guidance and `templates/` as skeletons.

### repo-created / migrated-to-repo

Once a real repo exists:

- move source-of-truth docs into the repo;
- update the LLM-Wiki project link note in `projects/<ProjectName>/`;
- remove duplicate editable source-of-truth files from `wiki/projects/<project>/`.

After migration, `wiki/projects/<project>/` must not remain as the active project location.

## 7. project link notes

Root `projects/` contains link notes.

A link note may include:

- project phase;
- repo path;
- the repo entry file to read first;
- a warning that the real repo is source of truth.

A link note must not become:

- an implementation status board;
- a task list for a real repo;
- a replacement for repo `docs/project_status.md`;
- a replacement for repo `docs/agent_status.md`.

## 8. delegated agent local state

Delegated agents may have local repo files:

```text
agents/<agent>/tasks.md
agents/<agent>/status.md
reports/agent/<agent>/<task-id>-result.md
```

These files reduce input tokens, preserve progress through interruptions, and create audit trails.

They do not replace repo-wide rollup docs.

Codex/main owns rollup into:

```text
docs/tasks.md
docs/project_status.md
docs/test_matrix.md
docs/contracts.md
docs/agent_status.md
```

## 9. migration law

Migration is move, not copy.

When moving a project from LLM-Wiki to a repo:

1. Identify source-of-truth files.
2. Create equivalent repo structure.
3. Move active docs into the repo.
4. Update repo read-first files.
5. Update LLM-Wiki project link note.
6. Delete old duplicate editable docs from `wiki/projects/<project>/`.
7. Validate that no active links point to deleted source-of-truth copies.

Do not keep old editable copies in LLM-Wiki "just in case".

## 10. agent operating law

Before acting, an agent must:

1. identify the current user request;
2. classify the work type;
3. identify source of truth;
4. read only relevant context;
5. choose risk lane;
6. define output and validation;
7. update the right status/checkpoint immediately after meaningful work.

An agent must not:

- jump from LLM-Wiki cleanup into project implementation without user direction;
- update LLM-Wiki summaries when repo docs should be updated;
- invent missing facts;
- leave duplicate source-of-truth files;
- mark work done without proof or documented missing proof;
- use reports as the active status board;
- use `active.md` as a real repo tracker.

## 11. request types

Classify work as one of:

- `research`;
- `wiki improvement`;
- `knowledge cleanup`;
- `harness improvement`;
- `template cleanup`;
- `new spec`;
- `spec slice`;
- `change request`;
- `maintenance`;
- `repo implementation`;
- `validation`;
- `compile`;
- `migration`;
- `file-back insight`.

Classification decides allowed write targets.

## 12. risk lanes

Three lanes: `tiny`, `normal`, `high-risk`.

See [[harness/risk-lanes.md]] for lane definitions, requirements, and hard gates.

## 13. project docs standard

Canonical real repo docs:

```text
project_manifest.md
docs/project_brief.md
docs/project_status.md
docs/contracts.md
docs/implementation_plan.md
docs/tasks.md
docs/decisions.md
docs/test_matrix.md
docs/agent_status.md
wiki/architecture.md
```

Reusable guidance for these files lives in:

```text
wiki/knowledge/project-docs/
```

Templates live in:

```text
templates/
```

## 14. validation and evidence

Work is not done just because files changed.

Done requires:

- expected output defined;
- check or review performed;
- evidence recorded, or missing proof explicitly documented;
- right status/checkpoint updated.

Validation reports:

```text
reports/validation/
```

Long logs:

```text
logs/test-output/
```

## 15. checkpoint law

After each meaningful work unit:

- LLM-Wiki work updates `active.md` and validation evidence when durable state changes.
- Repo work updates repo status/task/test/agent-status docs.
- Validation-worthy work creates or updates a validation report.
- If the work produces reusable knowledge, follow [[program.md#6. operation: file-back insight]] rubric before writing to `wiki/knowledge/`, `wiki/decisions/`, `wiki/vendors/`, or `wiki/research/`.

Never wait until final response to record state.

## 16. rot prevention

Do not:

- store the same source-of-truth state in two places;
- copy long logs into wiki pages;
- let `tasks.md` become a diary;
- let `wiki/concepts/` become a generic textbook;
- keep stale project docs after repo migration;
- leave claims uncited when derived from sources;
- let compiled summaries override source docs;
- create files when a section is enough;
- publish private local history without review.

## 17. public boundary

Local vault:

```text
/home/admindebian/LLM-Wiki
```

Public/GitHub folder:

```text
/home/admindebian/LLM-Wiki-GitHub
```

Do not push, sync, or publish unless the user explicitly asks.

Do not publish `active.md`, raw local concepts, private paths, validation reports, or project history without review.

## 18. constitution update rule

Update this constitution only when a stable law changes:

- source-of-truth hierarchy;
- folder roles;
- project lifecycle;
- migration rules;
- checkpoint requirements;
- evidence standards;
- agent boundaries.

Do not update it for one-off project details.

Any change to §1–§18 requires a row in §19 changelog with date, scope, and evidence link.

The procedure for proposing, reviewing, and applying a constitutional amendment lives in [[harness/feedback-loop.md#amendment-proposal]]. Every proposed amendment must: (a) be drafted with a `[PROPOSED]` prefix; (b) be recorded in `wiki/decisions/_index.md` as a pending decision before any edit to this file; (c) be applied only after explicit human acceptance; (d) carry a §19 row with date, scope, and evidence link upon application. AI must not self-apply a constitutional amendment. Proposed amendments that would change §3 source-of-truth hierarchy or §15 checkpoint law require explicit human review before drafting.

## 19. changelog

Constitution amendments and major structural revisions to this document.

| Date | Scope | Evidence |
|---|---|---|
| 2026-05-17 | Foundation: initial constitution bootstrap | [[reports/validation/2026-05-17-llm-wiki-foundation.md]] |
| 2026-05-17 | First lint pass | [[reports/validation/2026-05-17-llm-wiki-lint.md]] |
| 2026-05-18 | Core file completion | [[reports/validation/2026-05-18-llm-wiki-core-completion.md]] |
| 2026-05-19 | Task I/O format codified | [[reports/validation/2026-05-19-llm-wiki-task-io.md]] |
| 2026-05-21 | Folder organization model | [[reports/validation/2026-05-21-llm-wiki-organization.md]] |
| 2026-05-21 | Template/knowledge boundary | [[reports/validation/2026-05-21-template-knowledge-boundary.md]] |
| 2026-05-21 | Control files rewrite (active/global-rules/constitution/program split) | [[reports/validation/2026-05-21-control-files-rewrite.md]] |
| 2026-05-21 | Task packet format expansion | [[reports/validation/2026-05-21-task-packet-format.md]] |
| 2026-05-21 | Project status format expansion | [[reports/validation/2026-05-21-project-status-format.md]] |
| 2026-05-21 | Delegated agent local-state model (§8) | [[reports/validation/2026-05-21-delegated-agent-local-state.md]] |
| 2026-05-22 | LLMWIKI-020 roadmap and read-workflow | [[reports/validation/2026-05-22-llmwiki-020-roadmap-task-packet.md]] |
| 2026-05-22 | LLMWIKI-020 standardization (knowledge lookup metric, generalized coding/security/testing) | [[reports/validation/2026-05-22-llmwiki-020-standardization.md]] |
| 2026-05-22 | Real-repo payload cleanup; pointer-only projects/ rule | [[reports/validation/2026-05-22-real-repo-payload-cleanup.md]] |
| 2026-05-23 | Single-canonical consolidation; risk lanes pointer (§12); §19 changelog added | [[reports/validation/2026-05-23-canonical-consolidation.md]] |
| 2026-05-23 | Knowledge layer expansion: architecture concepts + patterns library, security concepts (OWASP 2025, STRIDE, DiD, ZT), Karpathy skill format adoption, multi-agent coordination infrastructure; §15 file-back trigger added | [[reports/validation/2026-05-23-external-knowledge-ingest.md]] |
| 2026-05-23 | §18 amendment procedure linkage to harness/feedback-loop.md (DEC-0001 accepted) | [[reports/validation/2026-05-23-feedback-loop-introduction.md]] + [[wiki/decisions/DEC-0001-constitution-amendment-feedback-loop-linkage.md]] |
