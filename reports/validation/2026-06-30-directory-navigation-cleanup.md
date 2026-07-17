---
name: directory-navigation-cleanup
description: Validation record for LLM-Wiki directory purpose review, navigation map naming, and stale pointer cleanup.
date_updated: 2026-06-30
status: accepted
---

# Directory Navigation Cleanup Validation

## Scope

Reviewed active LLM-Wiki directories, clarified each navigation layer's purpose,
added missing node maps, and cleaned a stale real-repo project pointer.

## Decision

Do not create `index.md` at every nested level.

Use:

```text
index.md                    # root workspace map only
<directory>/README.md       # directory-local map
docs/project_index.md       # project-specific map
wiki/decisions/_index.md    # explicit register/index file
```

For nested directories, route one level at a time:

```text
index.md
  -> A/README.md
  -> A/B/README.md
  -> A/B/C/README.md
```

This avoids ambiguous search results where many files share the same basename
`index.md`.

## Updated

- `index.md`
- `TICK.md`
- `harness/read-workflow.md`
- `harness/feedback-loop-lint.sh`
- `wiki/knowledge/project-docs/navigation_maps.md`
- `wiki/knowledge/project-docs/README.md`
- `wiki/projects/llm-wiki/docs/project_index.md`
- `active.md`
- `wiki/projects/llm-wiki/docs/project_status.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## Node Maps Added

- `projects/README.md`
- `research/README.md`
- `archive/README.md`
- `archive/retired-hermes/README.md`
- `archive/retired-hermes/2026-06-30/README.md`
- `archive/project-pointer-cleanup/README.md`
- `archive/project-pointer-cleanup/2026-06-30/README.md`
- `archive/project-pointer-cleanup/2026-06-30/projects/README.md`
- `archive/project-pointer-cleanup/2026-06-30/projects/pdf_tool/README.md`
- `logs/test-output/README.md`
- `projects/UniversityWeb/README.md`
- `projects/pdf_tool/README.md`
- `templates/examples/README.md`
- `wiki/projects/llm-wiki/README.md`
- `wiki/projects/llm-wiki/wiki/README.md`
- `raw/assets/README.md`
- `raw/decisions/README.md`
- `raw/projects/README.md`
- `raw/research/README.md`
- `raw/vendors/README.md`

## Archived

- `projects/pdf_tool/pdf_tool.md` detailed pre-cleanup pointer copied to
  `archive/project-pointer-cleanup/2026-06-30/projects/pdf_tool/pdf_tool.md`.

The active `projects/pdf_tool/pdf_tool.md` is now a minimal pointer because
`/home/admindebian/opt/pdf_tool/` owns active status, tasks, and decisions.

## Validation

- Directory map coverage check passed for active directories excluding tool
  metadata, archived skill backups, and raw external source trees.
- `bash harness/feedback-loop-lint.sh` passed with 0 failures and 0 warnings.
- Active wikilinks and Markdown links resolved: 458 wikilinks checked and 243
  Markdown links checked.

## Residual Risk

- Empty holding folders under `raw/` now have README maps. The lint rule was
  updated so raw folder README maps are not counted as pending raw sources.
