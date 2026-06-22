# project index guide

## purpose

A project index is a compact link map or compiled summary for LLM-Wiki navigation.

It should help agents find the source of truth quickly without becoming a second editable copy of project docs.

## include

- Project status and phase.
- Current source of truth.
- Direct links to manifest, brief, status, tasks, decisions, test matrix, architecture, and validation reports.
- Short current state summary.
- Key decisions and known unknowns.
- A rule for where updates belong.

## quality criteria

- Links are current and absolute when crossing repo boundaries.
- Migrated projects clearly point to the real repo.
- Pre-repo projects clearly point to `wiki/projects/<project>/`.
- The summary is short enough to scan.
- It does not compete with `docs/project_status.md`.

## anti-patterns

- Updating project status here when a real repo has `docs/project_status.md`.
- Copying full docs into the index.
- Keeping migrated project indexes in `wiki/projects/` after source-of-truth has moved.
- Leaving stale links to deleted migrated docs.

