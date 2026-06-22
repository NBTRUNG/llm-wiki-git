# Validation report — single-canonical consolidation + feedback-loop infrastructure

Date: 2026-05-23
Scope: LLM-Wiki control files, harness, templates, projects registry, wiki/decisions infrastructure
Task: LLMWIKI-022

## context

Review surfaced that source-of-truth hierarchy, folder roles, project phases,
and read order were duplicated across four control files (`index.md`,
`global-rules.md`, `llm-wiki-constitution.md`, `program.md`) and several
`harness/` files. User confirmed the principle: each content lives in exactly
one canonical file; every other file references rather than duplicates.

Additionally, the file-back stage of the 4-stage lifecycle
(concept → pre-repo → real repo → file-back) had no template, no rubric, and no
decisions index — making the stage effectively unusable for future projects.

This work consolidates duplicates, builds the missing file-back infrastructure,
and fixes registry/index inconsistencies.

## source-of-truth files updated

| File | Change |
|---|---|
| `index.md` | Full rewrite. 139 → 48 lines. Pure English. Compact entry map of pointers only. |
| `global-rules.md` | 200 → 92 lines. Removed duplicates (SoT model, conflict resolution, folder roles, project phases, read order, checkpoint detail) — replaced with pointers to canonical homes. |
| `llm-wiki-constitution.md` | §12 risk lanes shortened to pointer to `harness/risk-lanes.md`. §18 amended to require changelog entry. §19 changelog added with 13 historical entries + this consolidation. |
| `program.md` | §3 minimal operating loop shortened (pointer to `harness/read-workflow.md`). §6 file-back operation expanded with 3-gate rubric (Evidence, Generalization, Source tag) and lesson template reference. |
| `harness/README.md` | §read order replaced with pointer. §core guardrails → §guardrails specific to harness work (removed cross-file duplicates, kept harness-specific rules: shared contracts, ACID delegation, knowledge lookup metric). |
| `harness/read-workflow.md` | §universal start no longer references removed "compact core rules". §conflict rule clarified relationship to constitution §3. |
| `harness/project-bootstrap.md`, `harness/project-workflow.md`, `harness/agent-operating-guide.md` | Removed stale "compact core rules" references. |
| `projects/_registry.md` | `EFTI_Web` renamed to `UniversityWeb`. Path corrected to `/home/admindebian/UniversityWeb/`. |
| `projects/pdf_tool.md` → `projects/pdf_tool/pdf_tool.md` | Migrated flat to folder form per constitution §11 canonical. |
| `templates/README.md` | Added full bullet catalog of 18 templates with one-line role. |
| `templates/lesson_filed.template.md` | **Created.** Template for filed-back lessons with required fields (lesson_id, date_filed, source_project, source_evidence, confidence, status, superseded_by, summary, context, detail, applicable_contexts, anti-patterns, related). |
| `reports/validation/README.md` | **Created.** Catalog of all validation reports, newest first. |
| `wiki/decisions/_index.md` | **Created.** Empty table with row format spec (ID, Date, Status, Title, Source project, Link). |
| `wiki/decisions/README.md` | Added pointer to `_index.md`. |

## canonical ownership table (post-consolidation)

| Content | Canonical home |
|---|---|
| Source-of-truth hierarchy + conflict rules | `llm-wiki-constitution.md §3` |
| Folder roles | `llm-wiki-constitution.md §4` |
| Project phases + lifecycle | `llm-wiki-constitution.md §6` |
| Migration law | `llm-wiki-constitution.md §9` |
| Checkpoint law | `llm-wiki-constitution.md §15` |
| Risk lanes | `harness/risk-lanes.md` |
| Read workflow | `harness/read-workflow.md` |
| Intake / classification | `harness/intake.md` |
| File-back operation + rubric | `program.md §6` |
| Templates list | `templates/README.md` |
| Harness file list | `harness/README.md` |
| Validation reports list | `reports/validation/README.md` |
| Decisions index | `wiki/decisions/_index.md` |
| Constitution changelog | `llm-wiki-constitution.md §19` |

## checks

```
grep -rn "EFTI_Web" --include="*.md"                  → 0 matches (after fix)
grep -rn "projects/pdf_tool\.md" --include="*.md"     → 0 matches (after migration)
grep -rn "^## folder roles" --include="*.md"          → 0 duplicate sections
grep -rn "^## source-of-truth model" --include="*.md" → 0 duplicate sections
wc -l index.md                                        → 48 (target ≤ 60)
wc -l global-rules.md                                 → 92 (was 200)
```

Remaining `compact core rules` mentions are in historical records:
- `wiki/projects/llm-wiki/wiki/architecture.md` (architecture snapshot — needs update next pass)
- `wiki/projects/llm-wiki/docs/decisions.md` (historical decision text — keep as-is per "do not delete old decisions")
- `wiki/projects/llm-wiki/docs/project_status.md` (history of past done items — keep)
- `wiki/projects/llm-wiki/docs/test_matrix.md` (LLMWIKI-BASE row references old state — needs update)

## result

LLMWIKI-022 implemented locally. Single-canonical principle enforced across
control files and harness. File-back infrastructure (template, rubric, decisions
index) ready for first project to enter stage 4.

Post-review follow-up applied in the same session:

- `index.md` "How to use" made directive (explicit do-not-skip language).
- `index.md` subdir catalog now lists `archive/` and `logs/`.
- `llm-wiki-constitution.md §15 checkpoint law` now triggers `program.md §6` file-back rubric whenever work produces reusable knowledge.
- `wiki/projects/llm-wiki/wiki/architecture.md` rewritten to reflect the post-consolidation 4-stage lifecycle, single-canonical principle, and current component/flow layout.
- `wiki/concepts/llm-wiki/4-stage-lifecycle.md` created as durable canonical concept doc for the concept → pre-repo → real-repo → file-back loop; `wiki/concepts/llm-wiki/README.md` updated.
- Imported bundle deleted on manual review: `llm-wiki/` (200K folder including `llm-wiki.zip`) and `llm_wiki_knowledge_lookup_blueprint.md` (12K). `archive/imported-models/llm-wiki-import-2026-05-22.md` updated to record deletion. Stale references removed from `wiki/concepts/llm-wiki/README.md` and `wiki/knowledge/project-docs/scaffold_examples.md`.
- Anchor-link syntax converted to Obsidian native form (`[[note.md#Heading Text]]`) after user reported the GitHub-style slug form did not resolve in Obsidian. 5 links updated across `program.md`, `global-rules.md`, `llm-wiki-constitution.md`, and `harness/read-workflow.md`.

## gaps

- No automated lint script; relies on grep checks in this report.
- No project has yet completed the full 4-stage cycle, so the file-back rubric
  is unproven in practice.

## residual risk

- Existing agent prompts or external tooling that hardcoded the old index.md
  structure (Compact Core Rules section, full validation report list, etc.) may
  break links. Mitigated by reports/validation/README.md serving the same catalog
  function.
- The 4-stage cycle vision is now documented in agent memory, but not yet in a
  canonical LLM-Wiki file. Future task: add to `wiki/concepts/llm-wiki/` as
  durable concept doc.

## decision

Accept LLMWIKI-022 as implemented. Constitution §19 records this as the 14th
amendment-class change.
