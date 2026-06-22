# Draft: Hermes and Agent Workflow Discussion

Date: 2026-06-11
Status: draft / discussion checkpoint

Purpose:

This file captures the conversation checkpoint for continuing later. It is not
an accepted LLM-Wiki rule by itself. Read this file at the start of the next
session before changing agent workflow guidance.

## Main direction agreed so far

LLM-Wiki remains the framework for configuring Hermes correctly in projects.
Hermes should be piloted in real projects first. LLM-Wiki itself should not
depend on Hermes until at least two project pilots produce evidence.

Hermes role:

- Context indexer.
- Read planner.
- Source-of-truth risk detector.
- Optional SQLite-derived index/cache.

Hermes is not:

- an implementation agent;
- a source of truth;
- a code editor;
- a rule owner;
- a project status owner.

The preferred model is:

```text
Markdown / repo docs = canonical truth
Hermes SQLite        = derived map/cache/index
Hermes read plan     = advisory line-range recommendation
Agent                = executor or reviewer
```

## Work already created during this session

Initial Hermes standard files were created:

- `wiki/knowledge/project-docs/hermes_context_indexer.md`
- `harness/hermes-read-planning.md`
- `templates/hermes_read_plan.template.md`
- `templates/hermes_config.template.md`
- `reports/validation/2026-06-11-hermes-context-indexer-standard.md`

Indexes/templates were also updated to reference Hermes as an optional project
capability. These edits should be reviewed later before treating the standard
as final.

## Project docs discussion

UniversityWeb suggests some LLM-Wiki repo-doc standards should become more
role-based and less filename-rigid.

Current useful UniversityWeb pattern:

```text
docs/tasks.md          = active / assigned / blocked / pending-review work
docs/tasks_future.md   = short future backlog, not executable yet
docs/tasks_archive.md  = accepted repo-level audit history
```

This appears better than one large `tasks.md`. LLM-Wiki should consider filing
this as a repo-level task split standard.

`project_brief.md` is probably not redundant if it remains the stable
product/scope contract. It becomes redundant only if it starts holding current
status.

The unclear area is current project snapshot:

```text
AI_CODEX.md
docs/project_status.md
docs/SUMMARY.md
docs/agent_status.md
```

Only one file should own each kind of current state. In UniversityWeb,
`AI_CODEX.md` currently acts as compact Lead handoff, while
`docs/agent_status.md` is the live assignment board. There is no active
`docs/project_status.md` outside legacy files.

## UI-heavy project docs

UniversityWeb also suggests a useful UI-heavy extension:

```text
ui_map/_UI_WORKFLOW.md = user journeys / page logic
ui_map/_UI_ROUTER.md   = routes, resolver, route ownership
ui_map/_CONTRACTS.md   = variables, aliases, components, shared contracts
ui_map/group-*.md      = detailed page/panel maps
```

LLM-Wiki currently assumes `docs/contracts.md` by default. It may need a rule
allowing a repo to declare a different canonical contract registry path, such as
`ui_map/_CONTRACTS.md`, when `AGENTS.md` and repo source map make that explicit.

## Agent local file simplification

The current LLM-Wiki model uses:

```text
agents/<agent>/AGENT.md
agents/<agent>/tasks.md
agents/<agent>/status.md
agents/<agent>/tasks_archive.md
```

The discussion moved toward simplifying this. On 2026-06-11 the user accepted
the direction: subagents should have only one local file to read by default.

Accepted direction for the next standard update:

```text
agents/<agent>/AGENT.md   = one agent control card read by the subagent
docs/tasks.md             = canonical active repo task board
docs/tasks_archive.md     = shared accepted audit history
docs/agent_status.md      = live assignment board
reports/agent/<agent>/    = evidence only when needed
```

The user view:

- `agents/<agent>/tasks_archive.md` is likely redundant.
- Task audit should live in shared `docs/tasks_archive.md`.
- Agent history can be captured by fields in repo-level archive rows, including
  which agent did the task and which report/evidence exists.
- Agents should ideally read one local file: `agents/<agent>/AGENT.md`.
- `agents/<agent>/tasks.md`, `status.md`, and `tasks_archive.md` should become
  legacy/optional compatibility files, not the default for new or updated
  projects.

Important caveat:

One file does not mean one authority. If `agents/<agent>/AGENT.md` contains
role, assignment, and current state, section ownership must be clear:

```text
Lead owns:
- assignment;
- active packet;
- allowed/forbidden write targets.

Agent owns:
- current checkpoint;
- blocker;
- result handoff.
```

## Token estimate from UniversityWeb

Measured with `wc -c`, using `tokens ~= chars / 4`.

Entry files:

| File | Approx tokens |
| --- | ---: |
| `AGENTS.md` | 2,486 |
| `REPO_RULES.md` | 861 |
| `docs/session_start.md` | 1,316 |
| `AI_CODEX.md` | 967 |

Lead:

- First-time Lead reading `AGENTS + REPO_RULES + session_start + AI_CODEX`:
  about 5,630 tokens.
- Repeat Lead reading `AGENTS + REPO_RULES + AI_CODEX`: about 4,315 tokens.
- Skipping `docs/session_start.md` after first-time internalization saves about
  1,316 tokens/session.

Delegated agent example:

- `agents/deepseek/tasks.md` full file: about 12,918 tokens.
- Its current assignment slice at the top: about 607 tokens.
- Savings from not reading the full local task file: about 12,300 tokens/session.

This supports the direction that agent-local files should be current-slice only,
or collapsed into one compact agent control card.

## Reports discussion

Current model:

```text
reports/agent/<agent>/<task-id>-result.md
```

This currently mixes:

- handoff report for Lead;
- evidence report;
- audit/history report.

Potential issue:

- Every agent writes a report.
- Lead then reads reports.
- This can cost more tokens than a direct subagent handoff.

Proposed direction:

Use two tiers:

```text
Subagent handoff = primary short communication to Lead
Minimal report file = durable evidence only when threshold is met
```

Report file should be required for:

- meaningful delegated implementation;
- architecture / contracts / security / deployment work;
- failed, blocked, or conflicted tasks;
- work that will be accepted into archive with durable evidence.

Report file can be skipped or made optional for:

- tiny read-only lookups;
- low-risk simple edits where diff and validation output are enough;
- tasks where the Lead is already directly supervising in the same session.

Open question:

What exact threshold determines when a report file is required?

Possible minimal report shape:

```md
# TASK-ID Result

Agent:
Status:
Files changed:
Validation:
Evidence:
Risks/blockers:
Lead decision:
```

Do not repeat the full task packet in the report. `docs/tasks.md` already owns
the task packet.

## Open questions for next session

1. What exact migration rule should projects use when converting legacy
   `agents/<agent>/tasks.md` + `status.md` into one `AGENT.md` control card?
2. Should legacy split-file templates stay in `templates/` as compatibility
   skeletons or move under an archive/legacy namespace?
3. Should repo-level `docs/tasks_future.md` and `docs/tasks_archive.md` become
   a standard pattern?
4. Should LLM-Wiki allow projects to declare canonical contract registry paths
   other than `docs/contracts.md`, such as `ui_map/_CONTRACTS.md`?
5. What report threshold should decide between subagent handoff only vs durable
   report file?
6. Should Hermes config templates include a migration warning when they detect
   legacy per-agent task/status files?

## Suggested next-session read order

1. This draft.
2. `wiki/knowledge/project-docs/hermes_context_indexer.md`
3. `harness/hermes-read-planning.md`
4. `wiki/knowledge/project-docs/agent_local_work.md`
5. `wiki/knowledge/project-docs/delegated-packet-rotation.md` only if migrating
   a legacy split-file project
6. `templates/agent_role_card.template.md`
7. `templates/agent_tasks.template.md` only if keeping legacy split-file support
8. `templates/agent_status.template.md` only if keeping legacy split-file support

Then decide whether to update standards or keep this as a draft.
