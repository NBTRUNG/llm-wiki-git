# wiki/projects

This folder is only for project source-of-truth docs before a real repo exists.

## pre-repo phase

Before a project repo exists:

```text
wiki/projects/<project>/
```

may be the source of truth for that project.

It should use the same structure expected in a future repo:

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

## after repo migration

After a repo exists and migration is complete:

- remove project-specific source-of-truth docs from `wiki/projects/<project>/`;
- keep the active link note in root `projects/<project>/`;
- keep only a minimal pointer note under root `projects/<ProjectName>/`.

Do not keep duplicate source-of-truth files here after migration.
