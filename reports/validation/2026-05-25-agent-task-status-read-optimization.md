# Validation report — agent task/status read optimization

- **Date:** 2026-05-25
- **Scope:** LLM-Wiki agent-local task/status workflow
- **Lane:** normal
- **Trigger:** user request to read agent-related guidance under `wiki/knowledge/project-docs/` and optimize how agents work from their task/status files.
- **Class:** knowledge update + template improvement, per `harness/feedback-loop.md#classification`.

## summary

Optimized delegated agent bootstrap around `agents/<agent>/tasks.md` and
`agents/<agent>/status.md`. The live files now put current work first, accepted
packet bodies rotate to an archive, and delegated agents no longer read Lead
state by default.

## changes made

| File | Change |
|---|---|
| `wiki/knowledge/project-docs/agent_local_work.md` | Added task/status read optimization section; defined current assignment/current state cards; forbids delegated Lead-state reads and historical scanning. |
| `wiki/knowledge/project-docs/multi-agent-coordination.md` | Reduced read order now targets current assignment card + active packet and current state card + latest checkpoint; linked packet rotation. |
| `wiki/knowledge/project-docs/session_start.md` | Delegated branch now reads only active task/status slices and skips `tasks_archive.md` by default. |
| `wiki/knowledge/project-docs/agent_status.md` | Added current-state-card requirement and anti-pattern for burying blockers below long logs. |
| `wiki/knowledge/project-docs/tasks.md` | Added quality/anti-pattern guidance for current assignment cards. |
| `wiki/knowledge/project-docs/delegated-packet-rotation.md` | Clarified delegated read set excludes Lead state; added archive template acceptance criterion. |
| `wiki/knowledge/project-docs/README.md` | Added `delegated-packet-rotation.md` catalog row. |
| `templates/agent_tasks.template.md` | Added `Current assignment`, `Task index`, active packet section, completed-packet archive pointer table, and non-accepted inactive notes. Removed delegated `AI_CODEX.md` read. |
| `templates/agent_status.template.md` | Added `Current state card` and `Latest checkpoint`; clarified checkpoint log is append-only and read only when needed. |
| `templates/agent_tasks_archive.template.md` | New archive skeleton for accepted packet bodies rotated out of live task file. |
| `templates/agent_role_card.template.md` | Read order now names current task/status slices; forbids Lead state/archive reads by default. |
| `templates/agents.template.md` | Delegated bootstrap now names current task/status slices; forbids archive reads by default. |
| `templates/repo_rules.template.md` | Delegated read order no longer includes Lead state; source-of-truth list limits Lead state to Lead work. |
| `templates/README.md` | Added `agent_tasks_archive.template.md`. |
| `harness/feedback-loop-lint.sh` | Added checks for current assignment card, current state card, and archive template index. |
| `active.md`, `project_status.md`, `tasks.md`, `test_matrix.md`, `wiki/index.md` | Checkpoint and discoverability updates for `LLMWIKI-027`. |

## rule now enforced

Delegated default read path:

1. `AGENTS.md`
2. `REPO_RULES.md`
3. `agents/<agent>/AGENT.md`
4. `agents/<agent>/tasks.md` current assignment card + active packet only
5. `agents/<agent>/status.md` current state card + latest checkpoint only
6. Required Read Files from the active packet

Do not read Lead state, repo-wide rollups, old checkpoint logs, or
`tasks_archive.md` unless the active packet explicitly requires it.

## validation

Ran:

```text
harness/feedback-loop-lint.sh /home/admindebian/LLM-Wiki
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

Spot checks:

- No delegated read template still requires `AI_CODEX.md`.
- `agent_tasks.template.md` has `## Current assignment`.
- `agent_status.template.md` has `## Current state card`.
- `agent_tasks_archive.template.md` has an index.
- `delegated-packet-rotation.md` remains the canonical archive pattern; the new task template points to it instead of creating a competing archive-in-place rule.

## residual risk

Existing real repos need a migration pass before they benefit from this shape.
The change updates LLM-Wiki guidance and templates only; it does not rewrite
external project repos.

## next actions

1. When a real project next refreshes agent files, migrate each agent's
   `tasks.md`/`status.md` to the current-slice-first shape.
2. If an agent has multiple accepted packets in live `tasks.md`, create
   `tasks_archive.md` from `agent_tasks_archive.template.md` and rotate accepted
   packet bodies during Lead acceptance.
