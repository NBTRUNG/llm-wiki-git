# Project Librarian Checkpoint

Status: active  
Last updated: 2026-07-07

## current position

Agents should act as both collaborators and librarians.

For each active project, a new contributor or supervisor should be able to ask:

- What are we doing?
- Where are we?
- What is done?
- What is not done?
- What is the next decision?
- Which files prove this?

The answer should come from a short current-direction/status checkpoint, not
from reading long archives.

When a human asks a broad question, the agent should ask one clarifying question
before acting. It should also offer likely options from the current project
state so the human can remember the relevant concern.

Example:

```text
Do you mean this as process, architecture, security, ingestion, workflow audit,
or project supervision? Current related themes are: Agent Platform boundary,
workflow audit layer, agent-errors/token budget, and U17 evaluation.
```

## recommended project pattern

Projects should keep one short current-direction equivalent:

```text
docs/current_direction.md
```

or, for smaller repos, an explicit `Current direction` section inside:

```text
docs/project_status.md
```

The file/section should include:

- current model/phase;
- already done;
- not done yet;
- do not repeat;
- next likely steps;
- evidence links;
- supervisor answer summary.
- clarifying prompts for broad human questions.

## do not repeat

- Do not make a supervisor read every validation report to understand status.
- Do not make a new agent reconstruct direction from `tasks_archive.md`.
- Do not store active real-repo state in LLM-Wiki after a repo exists.

## next likely step

Backfill this pattern only when a project becomes broad enough that orientation
or supervisor questions start causing repeated reads.

## evidence

- `wiki/knowledge/project-docs/project_status.md`
- `wiki/knowledge/project-docs/project_index.md`
- `templates/project_status.template.md`
- `templates/project_index.template.md`
