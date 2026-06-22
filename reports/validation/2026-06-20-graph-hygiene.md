# Validation Report - Graph Hygiene

Date: 2026-06-20
Owner: Codex
Status: completed

## Scope

Add Obsidian graph hygiene rules so LLM-Wiki distinguishes intentional orphan
files from canonical guidance that must be discoverable through indexes.

## Files Changed

- Added `harness/graph-hygiene.md`.
- Updated `index.md` with graph hygiene, project orientation, and research
  watchlist links.
- Updated `harness/README.md`.
- Updated `wiki/knowledge/README.md`.
- Updated `wiki/knowledge/coding/README.md`.
- Updated `templates/README.md` to use real links for template catalog entries.
- Updated `reports/validation/README.md` with recent validation reports.
- Updated `harness/feedback-loop-lint.sh` with graph-hygiene discoverability
  checks.
- Updated `active.md`.

## Rule Added

Canonical guidance, harness workflows, active knowledge, project source of
truth, and current research control files must have at least one index or parent
link.

Templates, validation reports, archive imports, raw holding files, and command
logs may be orphaned when their parent index explains how they are used.

## Validation

- `bash harness/feedback-loop-lint.sh`

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

Graph scan result after indexing canonical files:

```text
Markdown files: 192
Orphans: 2
Canonical harness orphans: 0
Canonical knowledge orphans: 0
Remaining orphans: archive/imported-models/..., raw/andrej-karpathy-skills-main/...
```
