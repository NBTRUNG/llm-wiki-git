# agent local work guide

## purpose

Agent-local files let delegated agents start quickly, checkpoint safely, and
avoid editing repo-wide rollup docs.

They solve three problems:

- reduce input tokens for each agent session;
- preserve execution state after token loss, power loss, or interruption;
- make audit trails clear from assignment to result to Codex review.

## canonical files

For each delegated agent, the default model is one local control file:

```text
agents/<agent>/AGENT.md                    current control card
reports/agent/<agent>/<task-id>-result.md  durable result/evidence when threshold is met
```

`AGENT.md` is intentionally the only agent-local file a delegated agent reads by
default. It carries the role boundary, current assignment, active packet, current
write boundary, latest checkpoint, blocker, validation state, and result handoff.

Legacy projects may still have:

```text
agents/<agent>/tasks.md
agents/<agent>/status.md
agents/<agent>/tasks_archive.md
```

Those files are compatibility artifacts, not the preferred default for new or
updated projects. Do not introduce them unless a project explicitly chooses the
legacy split-file model.

For multi-agent projects, the lead also maintains:

```text
reports/daily/YYYY-MM-DD.md       daily work log (template: daily_work_log.template.md)
```

For coordination patterns (independent groups, parallel safety, conflict
protocol), see [[multi-agent-coordination.md]].

## roles

| File | Owner | Purpose |
| --- | --- | --- |
| `agents/<agent>/AGENT.md` Lead-owned sections | Codex/main | Agent role, active assignment, active packet, and write boundary. |
| `agents/<agent>/AGENT.md` agent-owned sections | delegated agent | Current checkpoint, blocker, validation state, and handoff. |
| `reports/agent/<agent>/<task-id>-result.md` | delegated agent | Final self-report for a task. |
| `docs/tasks.md` | Codex/main | Repo-wide task board and accepted task state. |
| `docs/project_status.md` | Codex/main | Repo-wide project status. |
| `docs/test_matrix.md` | Codex/main | Repo-wide proof rollup. |
| `docs/agent_status.md` | Codex/main | Repo-wide assignment board. |

## delegated agent read order

Default delegated agent read order:

1. `AGENTS.md`
2. `REPO_RULES.md`
3. Full LLM-Wiki Coding Pack once, when the assignment is code/review/refactor/test/validation work
4. `agents/<agent>/AGENT.md`
5. Files listed in the active task `Required read files`

Do not read full repo docs, Lead state (`AI_CODEX.md` / `LEAD_STATE.md`),
`docs/project_brief.md`, `docs/decisions.md`, per-agent task/status/archive
files, or unrelated LLM-Wiki knowledge by default unless the active task lists
them or the Knowledge Lookup Metric requires them. This rule controls
per-session token cost and scope discipline. The Coding Pack is a bounded
coding-session safety baseline, not permission to read the whole wiki.

## control-card shape

`agents/<agent>/AGENT.md` must stay a current-slice control card, not an
unbounded log. Use `templates/agent_role_card.template.md` as the skeleton.

It should contain:

- `## section ownership` — Lead-owned vs agent-owned sections.
- `## role summary` — what the agent does and does not do.
- `## read order` — the one-file delegated bootstrap rule.
- `## coordination mode` — whether the agent reports to Lead or directly to
  human for this task, and who owns integration.
- `## current assignment` — current task id, state, Required Read Files,
  allowed/forbidden write targets, result report path, and stop condition.
- `## active task packet` — the executable ACID packet for the current task.
- `## write rules` and `## current write boundary`.
- `## current checkpoint` and `## latest checkpoint`.
- `## files touched`, `## validation`, `## result handoff`.
- `## notes/blockers`.

The Lead owns assignment, packet, and boundary sections. The delegated agent
owns checkpoint, blocker, validation, and handoff sections. If those sections
conflict, the agent stops and raises a blocker instead of guessing.

Coordination mode can be:

- `Lead-orchestrated` — default for production repo work. Subagent reports to
  the Lead. Lead reviews, accepts, requests changes, blocks, or escalates to
  human.
- `Human-orchestrated` — valid when the human directly runs multiple agents for
  comparison, exploration, review, or parallel opinions. Subagent reports to the
  human review target. Agents do not assume their outputs are linked to each
  other until a human or Lead names an integration owner.

Every task with multiple agents must name an integration owner before outputs
are merged, source-of-truth docs are rolled up, or overlapping results are
combined. Integration owner can be human, Lead, or a named integrator agent.

In Human-orchestrated mode, the human or integration owner may delegate narrowly
scoped writes to shared files so the Lead is not the bottleneck. The delegation
must name the file, section/rows, operation, lock owner, review target, and
rollback note. Without that explicit shared-file write delegation, shared
rollup/contract/status files remain forbidden to delegated agents.

If two agents need the same file section/row, both agents stop short of editing
the canonical file and submit proposals through `AGENT.md` handoff or
`reports/agent/<agent>/<task-id>-result.md`. The integration owner may use
`reports/integration/<task-id>-merge-plan.md` to combine proposals before
updating the canonical file. Do not use Hermes as a temporary draft store.

Do not keep historical packets or long checkpoint logs in `AGENT.md`. Accepted
history belongs in shared repo-level archive files, usually
`docs/tasks_archive.md`, with result reports linked when durable evidence is
needed.

## result handoff first

`AGENT.md` is the review inbox. The `result handoff` section must be the first
thing a Lead or human can read to decide what to do next.

Use this shape:

```md
## result handoff

- Task:
- Status: ready-for-review | blocked | needs-decision
- Decision requested: accept | review diff | unblock | reassign | choose approach | integrate
- Files changed:
- Validation:
- Risks/blockers:
- Conflicts/overlap:
- Suggested next actor:
- Report file: none | reports/agent/<agent>/TASK-ID-result.md
- Next suggested action:
```

Result report files are durable evidence, not the default inbox. Create a report
file only when the task crosses the report threshold: meaningful implementation,
architecture/contracts/security/deployment/data risk, failed/blocked/conflicted
work, deviation from exact output, LWOE measurement, or human/Lead request.

For small read-only lookups or low-risk changes, handoff + diff + validation
can be enough.

## post-task distillation gate

After human, Lead, or integration-owner review passes, but before the task is
marked done, the agent must run the distillation gate in
[[post_task_distillation.md]].

The result handoff or result report must record either:

```text
Distill: skipped
Reason: <why no reusable knowledge was produced>
```

or:

```text
Distill: required
Type: troubleshooting | pattern | decision | concept | runbook | contract-note | anti-pattern | validation-note
Target: <repo path or LLM-Wiki path>
```

Do not mark done before distillation is recorded and any required page, repo
decision, contract note, runbook, queue row, or wikilink/index update is
complete.

## legacy split-file compatibility

The older LLM-Wiki pattern used:

- `agents/<agent>/tasks.md` — current assignment card, task index, active packet.
- `agents/<agent>/status.md` — current state card and checkpoint log.
- `agents/<agent>/tasks_archive.md` — accepted packet archive.

Existing projects may continue that model until they migrate. For legacy
projects, `agents/<agent>/tasks.md` should begin with:

- `## Current assignment` — one compact card naming current task id, state,
  packet anchor, Required Read Files, allowed write targets, and report path.
- `## Task index` — one row per packet with status and anchor.
- `## Active task packet` — the one packet the agent should execute now.
- `## Completed packets (archived)` — pointer table to `tasks_archive.md`.
- `## Inactive non-accepted packets` — short notes only for blocked,
  superseded, or rejected work.

Accepted packet bodies should be moved to `agents/<agent>/tasks_archive.md`
per [[delegated-packet-rotation.md]]. The archive is not part of normal
delegated bootstrap.

Archive authority belongs to the Lead / review owner. Executing agents do not
write to `tasks_archive.md`; they provide status + result report evidence and
may include an archive-row proposal for the Lead to use after acceptance.

For legacy projects, `agents/<agent>/status.md` should begin with:

- `## Current state card` — state, current task, last checkpoint, next action,
  blocker, and result report path.
- `## Latest checkpoint` — the last meaningful update in prose.
- append-only `## Checkpoint log` below the active card.

Legacy read rule:

- Assigned or in-progress agent: read the current assignment card, active task
  packet, current state card, latest checkpoint, then Required Read Files.
- Idle or blocked agent: read the current assignment card and current state
  card; stop unless the Lead has assigned a new packet.
- Resuming after interruption: read the latest checkpoint first; read older
  checkpoint log rows only if the latest checkpoint is ambiguous.

The Lead owns pruning/archiving old task packets. Do not make delegated agents
scan historical packets to find current work.

## status checkpoint rule

Delegated agents update the agent-owned checkpoint sections of
`agents/<agent>/AGENT.md`:

- when starting a task;
- after each meaningful file group is changed;
- before long validation;
- after validation;
- when blocked;
- when creating a result report;
- before stopping.

## rollup rule

Delegated agents do not update these unless explicitly assigned:

```text
docs/tasks.md
docs/project_status.md
docs/test_matrix.md
docs/contracts.md
docs/agent_status.md
```

Codex/main reviews agent status and result reports, then rolls accepted state into repo-wide docs.

## audit trail

Every delegated task should be traceable:

```text
docs/tasks.md
  -> agents/<agent>/AGENT.md
  -> reports/agent/<agent>/<task-id>-result.md
  -> reports/validation/<task-id>.md
  -> docs/test_matrix.md
  -> docs/project_status.md
```

## result report knowledge lookup

Agent result reports should include a `Knowledge lookup` section when the task
involves architecture, scope, contracts, security, production, deployment,
dependencies, external services, or reusable blueprints.

Use `docs/knowledge_lookup_metric.md` in the active repo when it exists. The
report should record:

- score;
- whether LLM-Wiki was consulted;
- reason;
- findings used;
- conflicts with active repo;
- decision or blocker.

## result report archive proposal

When the task is ready for review, the agent may include an `Archive row
proposal` in the result report:

```md
## Archive row proposal

| Task | Proposed outcome | Result report | Notes |
|---|---|---|---|
| TASK-ID | ready-for-review | reports/agent/<agent>/TASK-ID-result.md | one-line summary |
```

This reduces Lead copy work, but it is not accepted history. The Lead still
owns the final move into repo-level accepted history after review acceptance.

## result report measurement fields

When an LWOE cycle is open, agent result reports should also fill the
`Measurement fields` section from `templates/agent_result_report.template.md`.
Those fields are the preferred source for:

- 1b total reads/task;
- 2c time-to-first-edit;
- 3a boundary violations;
- 6b scope-creep events.

If the section is missing during a measured cycle, mark the affected LWOE metric
`needs-review` instead of reconstructing from memory.

## anti-patterns

- Agent task exists only in chat.
- Agent progress exists only in hidden model context.
- Agent edits repo-wide status files without assignment.
- Agent must read multiple local files to identify current work.
- Agent must scan old packets or old checkpoint logs to identify current work.
- Delegated bootstrap reads Lead state by default.
- Agent edits shared rollup/contract/status files without an explicit
  shared-file write delegation.
- Agent relies on Hermes cache/SQLite as the only place a draft proposal exists.
- Executing agent writes directly to `tasks_archive.md` before Lead acceptance.
- `agents/<agent>/AGENT.md` becomes an unbounded archive instead of a current control card.
- Agents assume human-orchestrated parallel outputs are automatically integrated.
- No integration owner is named before combining multiple agents' outputs.
- Lead or human has to open report files before reading the handoff card.
- Accepted packet bodies remain forever in live legacy `agents/<agent>/tasks.md`.
- Result report exists but agent status was never checkpointed.
- LWOE cycle is open but the result report omits Measurement fields.
- Codex accepts task without validation evidence or rollup.
- Two agents assigned to overlapping `Allowed write targets` or the same file ownership group concurrently (see [[multi-agent-coordination.md]] disjoint write-target rule).
- Control card missing or stale relative to current task packet write boundary.
