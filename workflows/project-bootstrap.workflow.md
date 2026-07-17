# workflow: project bootstrap

## purpose

Create the smallest useful documentation packet for a new project or a newly
AI-enabled repo, including one safe manual entrypoint for its human operator.

## trigger

- New project idea before a repo exists.
- Existing repo needs `AGENTS.md`, task/status/test-matrix, or maps for agents.
- User wants to apply the LLM-Wiki model to another project.

## start file

`harness/project-bootstrap.md`

## source of truth

| Project phase | Source of truth |
| --- | --- |
| Pre-repo | `wiki/projects/<project>/` |
| Repo-backed | Real repo |

Agent Platform owns raw/evidence runtime in both cases:

```text
/home/admindebian/Agent-Platform/raw/projects/<project-id>/
```

## inputs

- Project id.
- Project name.
- Owner.
- Repo path, or `unknown`.
- Phase and current goal.
- Required tiers: core, multi-agent, UI-heavy, data/workflow map.
- Human access/runtime/storage facts, or `unknown`.

## allowed writes

- Pre-repo: `wiki/projects/<project>/`.
- Repo-backed: selected repo bootstrap files.
- Repo-backed human entrypoint: root `HUMAN.md`, or an established equivalent
  explicitly named by `README.md`.
- LLM-Wiki project pointer under `projects/<ProjectName>/`.
- Agent Platform namespace pointer, not raw data inside LLM-Wiki.

## forbidden writes

- Do not create every optional tier by default.
- Do not copy raw snapshots into LLM-Wiki or the repo.
- Do not keep duplicate source-of-truth project docs in LLM-Wiki after repo
  migration.

## approval gate

Ask before declaring the repo-backed source of truth, adding major platform
dependencies, or changing ownership boundaries.

## evidence

Record the created files, chosen tiers, human entrypoint, raw namespace, and
remaining unknowns in a validation report.

## canonical details

- `../harness/project-bootstrap.md`
- `../projects/README.md`
- `../wiki/knowledge/project-docs/human_workflow.md`
