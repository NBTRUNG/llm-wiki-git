# Hermes Project Config

Guide: `wiki/knowledge/project-docs/hermes_context_indexer.md`

Project:

Last updated:

Updated by:

## Mode

Hermes mode: read-only indexer

Canonical source of truth:

- repo Markdown/docs/code

Hermes may store:

- file metadata;
- section indexes;
- line ranges;
- search indexes;
- read-plan cache.
- derived shared-file delegation and section-lock index.
- proposal/report paths and anchors.

Hermes must not store canonical:

- task state;
- project status;
- decisions;
- contracts;
- rules;
- source code.
- lock ownership.
- draft/proposed Markdown bodies.

## Indexed Paths

| Path | Include | Notes |
| --- | --- | --- |
| `AGENTS.md` | yes |  |
| `REPO_RULES.md` | yes |  |
| `docs/` | yes |  |
| `agents/*/AGENT.md` | yes | Default delegated-agent control-card target |
| shared contract/rollup files | yes | Index section/row locks only when declared in source docs |
| `agents/*/tasks.md` | legacy | Include only for split-file projects |
| `agents/*/status.md` | legacy | Include only for split-file projects |
| `agents/*/tasks_archive.md` | no | Exclude from default read plans |
| `reports/` | limited | Prefer result summaries and validation indexes |

## Excluded Paths

| Path | Reason |
| --- | --- |
|  |  |

## Freshness Checks

Required checks:

- file size;
- mtime;
- content hash.

Stale plan behavior:

- re-index before returning a plan, or mark the plan `stale`;
- require agent to read the source file before acting.

## Output

Default read-plan path:

```text
docs/hermes_read_plan.md
```

SQLite path, if used:

```text
.hermes/hermes.sqlite
```
