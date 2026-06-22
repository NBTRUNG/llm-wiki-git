# project manifest guide

## purpose

`project_manifest.md` identifies the project, its phase, source of truth, stack, source paths, and read-first order.

It is the fastest way for an agent to locate the right repo or pre-repo workspace.

## include

- Project ID, name, owner, type, phase, status, priority.
- Current source of truth.
- Repo path or `unknown`.
- LLM-Wiki project path or link note.
- Migration status.
- Stack summary.
- Source paths for brief, status, tasks, decisions, test matrix, architecture, reports, and logs.
- Read-first list.
- Notes for unknowns or migration caveats.

## quality criteria

- A new agent can find the correct source of truth without searching.
- Unknown values are explicitly marked `unknown`.
- Migrated projects point to the real repo, not old LLM-Wiki copies.
- Read-first paths match the current project phase.
- The manifest does not duplicate current task/status detail.

## anti-patterns

- Leaving stale pre-repo paths after repo migration.
- Using the manifest as a status board.
- Omitting `unknown` and leaving ambiguous blank fields.
- Listing archived docs as active source of truth.

