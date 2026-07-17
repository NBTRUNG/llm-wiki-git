# program

## 1. purpose

`program.md` defines operating procedures for LLM-Wiki.

Use it for:

- ingesting sources;
- answering from the wiki;
- linting wiki health;
- compiling summaries and link maps;
- filing reusable insights back into knowledge;
- creating validation evidence;
- checkpointing work.

`llm-wiki-constitution.md` defines the laws.
`program.md` defines the procedures.

## 2. inherited rules

Always inherit these rules:

- Current user request wins over `active.md`.
- `active.md` tracks only LLM-Wiki work.
- Real repo docs are source of truth after a repo exists.
- `wiki/projects/` is only for pre-repo source-of-truth docs.
- Migrated real projects keep only minimal pointer notes in `projects/`.
- Templates are skeletons.
- Knowledge guides are canonical guidance.
- Do not invent unknown facts.
- Do not mark done without proof or documented missing proof.
- Read only relevant context.

## 3. minimal operating loop

For every request:

1. Follow [[harness/read-workflow.md]] universal start to identify source of truth and read what's needed.
2. Define output and validation.
3. Make the smallest useful change.
4. Verify or document why verification was not run.
5. Update the right checkpoint/status immediately (see [[llm-wiki-constitution.md#15. checkpoint law]]).
6. Report concise outcome and gaps.

## 4. operation: ingest

Use ingest when a source is added or identified.

Inputs:

```text
/home/admindebian/Agent-Platform/raw/projects/<project-id>/
wiki/concepts/
project docs
vendor docs
research notes
conversation-derived notes when explicitly filed
```

`LLM-Wiki/raw/` contains legacy imported/reference holdings only. Do not place
new active raw records there.

Workflow:

1. Identify source path and type.
2. Extract key facts.
3. Identify target knowledge/project pages.
4. Update synthesis with source links.
5. Mark uncertainty as `needs-review`.
6. Mark missing facts as `unknown`.
7. Mark conflicting facts as `contradiction`.
8. Update index if discoverability changes.
9. Record checkpoint if the ingest changes durable state.

Rules:

- Active raw sources are project-namespaced in Agent Platform and read-only by
  default after capture.
- Do not cite model knowledge as source.
- Do not overwrite conflicting synthesis without preserving the conflict.

## 5. operation: query

Use query when the user asks a question based on LLM-Wiki.

Workflow:

1. Read `index.md`.
2. Locate relevant source/knowledge/project files.
3. Read only needed context.
4. Answer with file links.
5. Distinguish fact, inference, and uncertainty.
6. Suggest file-back only when the answer creates durable knowledge.

Rules:

- Do not pretend the wiki knows what it does not.
- Use `unknown` when data is missing.
- Use `contradiction` when sources disagree.

## 6. operation: file-back insight

Use file-back when work creates durable reusable knowledge.

Good targets:

```text
wiki/knowledge/
wiki/knowledge/project-docs/
wiki/knowledge/coding/
wiki/concepts/
wiki/decisions/
wiki/vendors/
wiki/research/
```

Workflow:

1. Classify the insight.
2. Choose the one canonical target file.
3. Apply the file-back rubric (below). Reject the insight if it fails any gate.
4. Use [[templates/lesson_filed.template.md]] for new lesson files, or explain in
   the file why the template was not used.
5. Add concise reusable guidance.
6. Link source/evidence.
7. Update index/readme if discoverability changes. New decisions also update
   [[wiki/decisions/_index.md]].
8. Checkpoint the change.

### file-back rubric

A filed lesson must satisfy all three gates:

| Gate | Requirement |
|---|---|
| Evidence | At least one link to a validation report, decision file, or test result. No filing on the strength of conversation alone. |
| Generalization | The lesson must list ≥1 applicable context beyond the source project. If the lesson only applies to its source project, keep it in the project repo, not here. |
| Source tag | `source_project` must be set. `llm-wiki` is allowed for governance lessons. Empty is not allowed. |

Rules:

- Do not file every chat message.
- Do not store project-specific execution status as reusable knowledge.
- Lessons from real repos should be generalized before entering knowledge.
- Imported models must be generalized into canonical `harness/`, `templates/`, or `wiki/knowledge/` files before becoming guidance.
- When a new lesson contradicts an existing one, mark the older `superseded` with `superseded_by` pointing to the new lesson_id; do not delete the older.

## 7. operation: lint

Use lint to prevent wiki rot.

Check:

- broken links;
- stale paths;
- duplicate concepts;
- source-of-truth duplicates;
- migrated project docs still under `wiki/projects/`;
- project link notes missing repo paths;
- templates containing long guidance;
- knowledge guides missing for templates;
- reports used as status boards;
- uncited or low-confidence claims.

Lint report shape:

```md
# wiki lint report

Date:
Scope:

## broken links
## stale paths
## duplicate source-of-truth candidates
## template/knowledge boundary issues
## project lifecycle issues
## recommended actions
```

Rules:

- Lint may report without editing.
- High-risk cleanup should be planned before execution.
- Do not auto-delete content unless the request includes cleanup.

## 8. operation: compile

Use compile to create summaries, indexes, and link maps from source-of-truth files.

Compile outputs may include:

```text
wiki/index.md
wiki/decisions/index.md
wiki/decisions/compiled-decisions.md
wiki/concepts/<concept>.md
wiki/vendors/<vendor>.md
wiki/research/<topic>.md
projects/<ProjectName>/<ProjectName>.md
```

Rules:

- Summarize; do not duplicate full docs.
- Preserve links to source files.
- Missing fields become `unknown`.
- Stale fields become `stale`.
- Conflicting fields become `contradiction`.
- Compiled summaries do not override source docs.

## 9. project compile rules

### pre-repo project

Source of truth:

```text
wiki/projects/<project>/
```

Allowed updates:

- `project_manifest.md`;
- `docs/project_brief.md`;
- `docs/project_status.md`;
- `docs/contracts.md`;
- `docs/implementation_plan.md`;
- `docs/tasks.md`;
- `docs/decisions.md`;
- `docs/test_matrix.md`;
- `docs/agent_status.md`;
- `wiki/architecture.md`.

### real repo project

Source of truth:

```text
<project-repo>/
```

Allowed LLM-Wiki updates:

```text
projects/<ProjectName>/<ProjectName>.md # minimal pointer only
wiki/knowledge/                         # generalized lessons only
```

Not allowed:

```text
wiki/projects/<project>/                # no active migrated project docs here
```

Do not update implementation state in LLM-Wiki. Update repo docs.

## 10. operation: bootstrap pre-repo project

Use when the user wants to start a project before a repo exists.

Procedure:

1. Read `harness/project-bootstrap.md`.
2. Read `wiki/knowledge/project-docs/`.
3. Use `templates/` as skeletons.
4. Create `wiki/projects/<project>/` only if no repo exists.
5. Create or update `projects/<ProjectName>/<ProjectName>.md` as the link/registry note.
6. Mark unknowns explicitly.
7. Add first task and validation expectation.
8. Checkpoint in `active.md` and validation reports when durable state changes.

## 11. operation: enter real repo project

Use when the request is implementation, review, testing, or project docs for a repo that exists.

Procedure:

1. Read the LLM-Wiki link note in `projects/`.
2. Read relevant knowledge guides:
   - `wiki/knowledge/project-docs/` for repo docs;
   - `wiki/knowledge/project-docs/agent_capability_tiers.md` for capability fit;
   - `wiki/knowledge/coding/agent-coding-workflow.md` and the canonical Coding
     Pack directly for eligible `P2`, or the approved task-named projection for
     lower-tier code/review/refactor/test/validation sessions.
3. Enter the repo.
4. Read repo `AGENTS.md` or equivalent.
5. For delegated work, read `REPO_RULES.md`, `agents/<agent>/AGENT.md`, and task `Required read files`; do not read Lead state or legacy split task/status files unless the active control card or task requires them.
6. For Codex/main integration work, read repo source-of-truth docs.
7. Work in the repo.
8. Delegated agents update agent-local status/report; Codex/main updates repo-wide status/task/test/agent-status docs.
9. File generalized lessons back to LLM-Wiki only after they are reusable.

## 12. operation: migrate project to repo

Use when a pre-repo project becomes a real repo project.

Procedure:

1. Identify current LLM-Wiki source-of-truth docs.
2. Create matching repo docs.
3. Move active source-of-truth docs into repo.
4. Update repo read-first rules.
5. Create/update root `projects/<ProjectName>/<ProjectName>.md`.
6. Remove old editable source-of-truth docs from `wiki/projects/<project>/`.
7. Keep only a minimal root project pointer note.
8. Validate links and folder roles.
9. Create validation report.
10. Checkpoint in `active.md`.

## 13. operation: validation report

Use validation reports for evidence that should survive the session.

Report location:

```text
reports/validation/
```

Template:

```text
templates/validation_report.template.md
```

Guidance:

```text
wiki/knowledge/project-docs/validation_report.md
```

Validation reports should include:

- date;
- scope;
- source-of-truth files;
- commands/checks;
- result;
- evidence links;
- gaps;
- residual risk;
- decision.

Completion workflow:

1. Create one validation report for each meaningful completed LLM-Wiki work
   unit.
2. Add the report to `reports/validation/README.md`.
3. Add a short evidence link in `active.md` when the completed work changes
   durable LLM-Wiki rules, workflow, knowledge, templates, or indexes.
4. Update `wiki/projects/llm-wiki/docs/project_status.md` when the completed
   work changes LLM-Wiki project state.
5. Run `bash harness/feedback-loop-lint.sh`.

Do not create `active_archive.md`. Reports are the archive; `active.md` is the
current working entrypoint plus concise evidence links.

## 14. operation: checkpoint

Use checkpoint after every meaningful unit of work.

LLM-Wiki checkpoint targets:

```text
active.md
reports/validation/
```

Repo checkpoint targets:

```text
<repo>/docs/project_status.md
<repo>/docs/tasks.md
<repo>/docs/test_matrix.md
<repo>/docs/agent_status.md
```

Rules:

- Checkpoint before long validation.
- Checkpoint after file moves.
- Checkpoint after source-of-truth changes.
- Checkpoint after agent assignment changes.
- When a LLM-Wiki work unit is complete, prefer report-first completion:
  report in `reports/validation/`, index it, then link it from `active.md`.
- Do not wait for the final response.

## 15. stale, unknown, contradiction

Use:

- `unknown` when the source does not provide the fact.
- `stale` when a claim may be outdated.
- `contradiction` when sources disagree.
- `needs-review` when user/business confirmation is needed.

Do not resolve uncertainty silently.

## 16. program update rule

Update `program.md` when:

- a workflow changes;
- source-of-truth locations change;
- compile outputs change;
- migration rules change;
- checkpoint/evidence rules change;
- repeated agent mistakes show a missing procedure.

Do not update `program.md` for one-off project details.
