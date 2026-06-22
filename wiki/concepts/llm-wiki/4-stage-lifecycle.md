# 4-stage lifecycle

The canonical model for how an idea moves through LLM-Wiki and back.

## the four stages

```text
[1] concept           [2] pre-repo             [3] real repo          [4] file-back
    (exploration)         (plan & brief)           (build outside)        (lessons return)
    wiki/concepts/        wiki/projects/<p>/       projects/<p>/...md     wiki/knowledge/
    wiki/knowledge/       harness + templates      pointer note only      wiki/decisions/
                                                                          wiki/vendors/
                                                                          wiki/research/
```

After stage 4, filed knowledge feeds the next stage 1 concept — the loop closes.

## stage 1 — concept

The idea is exploratory. No commitment to building yet.

- Source of truth: `wiki/concepts/<concept>.md` and reusable knowledge in `wiki/knowledge/`.
- Allowed outputs: concept notes, reusable patterns, research summaries.
- AI behavior: combine existing knowledge to test the idea against constraints.
- Transition to stage 2 when the concept is worth turning into a concrete project.

## stage 2 — pre-repo

A specific project exists but has no real repo yet. LLM-Wiki is the source of truth.

- Source of truth: `wiki/projects/<project>/` with `project_manifest.md`, `docs/project_brief.md`, `docs/project_status.md`, `docs/tasks.md`, `docs/decisions.md`, `docs/contracts.md`, `docs/implementation_plan.md`, `docs/test_matrix.md`, `wiki/architecture.md`.
- Bootstrap procedure: `harness/project-bootstrap.md` + `templates/`.
- AI behavior: write project plan and brief from concept inputs and reusable knowledge.
- Transition to stage 3 when the plan and brief are concrete enough that implementation can start in a real repo.

## stage 3 — real repo

A real repo exists outside the vault. Source of truth moves into the repo by `move, not copy`.

- Source of truth: the repo (for example `/home/admindebian/opt/pdf_tool/` or `/home/admindebian/UniversityWeb/`).
- LLM-Wiki role: keeps only a pointer note at `projects/<Name>/<Name>.md` with repo path and read-first list.
- AI behavior: read the repo's `AGENTS.md`/`REPO_RULES.md`. Use `harness/knowledge-lookup-metric.md` to decide whether to consult LLM-Wiki for any specific task.
- Forbidden: editing source-of-truth project state in LLM-Wiki after migration.
- Transition to stage 4 when the repo has run in real use and produced durable lessons.

## stage 4 — file-back

After the repo runs in practice, durable lessons return to LLM-Wiki so the next concept can reuse them.

- Trigger: any work unit producing reusable knowledge (per constitution §15 checkpoint law).
- Procedure: `program.md §6 operation: file-back insight`.
- Template: `templates/lesson_filed.template.md`.
- Three gates (rubric): Evidence, Generalization, Source tag.
- Targets by lesson type:
  - reusable rule/principle → `wiki/knowledge/`
  - cross-project decision → `wiki/decisions/` (also row into `_index.md`)
  - vendor/tool-specific lesson → `wiki/vendors/`
  - research finding → `wiki/research/`
- Loop closure: filed lessons become input to the next stage 1 concept.

## why this model exists

- **Knowledge accumulation**: lessons from individual projects do not die with the repo. They survive across project boundaries.
- **Repo independence**: real repos are not coupled to the vault. Teams can fork/move/archive a repo without breaking the knowledge layer.
- **Single source of truth per stage**: each stage has exactly one canonical location for active state. Migration between stages is move, not copy.

## what this model is not

- Not a workflow checklist for a single task. For that see `harness/read-workflow.md`.
- Not a project tracker. Active state lives in the stage-appropriate source-of-truth file.
- Not enforced by automation. Stage transitions are explicit decisions made by the user and recorded as project status updates and validation reports.

## current state (as of 2026-05-23)

| Stage | Status | Notes |
|---|---|---|
| 1 concept | active | `wiki/concepts/`, `wiki/knowledge/` populated |
| 2 pre-repo | active | LLM-Wiki itself is its own pre-repo project at `wiki/projects/llm-wiki/` |
| 3 real repo | active | `projects/pdf_tool/pdf_tool.md`, `projects/UniversityWeb/UniversityWeb.md` |
| 4 file-back | **infrastructure ready, unproven** | template, rubric, decisions index exist; no project has yet completed a full cycle |

## related canonical files

- Source-of-truth hierarchy across stages: `llm-wiki-constitution.md §3`.
- Project phase rules: `llm-wiki-constitution.md §6`.
- Migration law (stage 2 → 3): `llm-wiki-constitution.md §9`.
- Checkpoint law and file-back trigger: `llm-wiki-constitution.md §15`.
- File-back rubric: `program.md §6`.
- Read workflow per stage: `harness/read-workflow.md`.
- Visual diagrams: `concept-flow.mmd`, `operating-model.mmd`.
