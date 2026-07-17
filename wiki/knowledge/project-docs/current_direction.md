---
name: current-direction
description: Guidance for short project current-direction checkpoints so agents can act as collaborators and librarians for humans, supervisors, and new contributors.
date_ingested: 2026-07-07
status: active
source_type: project-file-back
confidence: medium
confidence_reviewed: 2026-07-07
---

# current direction guide

## purpose

A current-direction checkpoint helps an agent answer supervisor and new
contributor questions without reconstructing a project from old reports or
archives.

Use it when a project is broad enough that humans ask:

- What are we doing?
- Where are we now?
- What has already been done?
- What should we avoid repeating?
- What is the next decision?
- Where is the evidence?

The agent is both a collaborator and a librarian. It should preserve enough
current direction that a human does not need to remember every prior
conversation.

When the human asks a broad or ambiguous question, the agent should not jump
straight into implementation. It should ask a clarifying question and suggest
the most likely project themes so the human can remember what they meant.

## default location

For active real repos:

```text
docs/current_direction.md
```

For smaller repos, the same content may live as a `Current direction` section
inside `docs/project_status.md`.

For LLM-Wiki itself:

```text
wiki/projects/llm-wiki/docs/current_direction.md
```

## include

- Current model or phase.
- Active themes or workstreams.
- Already done.
- Not done yet.
- Do not repeat.
- Next likely steps.
- Evidence links.
- Supervisor answer summary: a short answer to "what is going on and where are
  we?"
- Clarifying prompts for broad supervisor/human questions.

## quality criteria

- 50-150 lines for the main checkpoint.
- Links to evidence instead of duplicating reports.
- Current enough for a new agent to orient without reading archives.
- Clear about what is not built yet.
- Clear about which source of truth wins.
- Explicitly says not to reconstruct current state from old archives unless the
  user asks for historical audit.
- Helps the agent ask "which concern do you mean?" before editing when a request
  could mean process, architecture, security, workflow, ingestion, or project
  supervision.

## anti-patterns

- Turning the checkpoint into a daily report.
- Copying task packets or validation reports into it.
- Updating only the checkpoint while leaving `tasks.md`, `test_matrix.md`, or
  `project_status.md` stale.
- Creating many checkpoints for low-risk projects that do not need them.
- Treating every broad human question as an implementation request without
  first checking intent.

## related

- [[project_status.md]]
- [[project_index.md]]
- [[agent_session_packs.md]]
