# Validation: human-orchestrated multi-agent mode

Date: 2026-06-12

## scope

User confirmed that humans may directly orchestrate multiple agents and receive
agent reports without forcing every result through a Lead AI first.

Implemented:

- Added `Lead-orchestrated` and `Human-orchestrated` coordination modes.
- Added integration owner rule for combining outputs from multiple agents.
- Updated `AGENT.md` control-card template with coordination mode and richer
  result handoff.
- Updated session-start and repo-entry templates so delegated agents report to
  the review target named by coordination mode.
- Clarified report files are durable evidence, while `AGENT.md` result handoff
  is the default review inbox.
- Added shared-file write delegation for Human-orchestrated mode so humans or
  integration owners can grant narrow section/row write locks without routing
  every shared-file update through Lead.
- Updated Hermes guidance so Hermes can index and warn about shared-file
  delegation/section-lock risks without becoming a write-lock authority.
- Added draft staging boundary: Hermes must not be used as a draft content
  store. Proposals live in Markdown handoffs/reports, and multi-agent merges may
  use `reports/integration/<task-id>-merge-plan.md`.

## files changed

- `wiki/knowledge/project-docs/agent_local_work.md`
- `wiki/knowledge/project-docs/multi-agent-coordination.md`
- `wiki/knowledge/project-docs/session_start.md`
- `templates/agent_role_card.template.md`
- `templates/agents.template.md`
- `templates/session_start.template.md`
- `templates/repo_rules.template.md`
- `templates/project_status.template.md`
- `harness/task-packet.md`
- `wiki/knowledge/coding/repo-code-rules.md`
- `wiki/knowledge/project-docs/hermes_context_indexer.md`
- `harness/hermes-read-planning.md`
- `templates/hermes_read_plan.template.md`
- `templates/hermes_config.template.md`
- `templates/integration_merge_plan.template.md`
- `templates/README.md`
- `harness/project-workflow.md`
- `harness/task-decomposition.md`
- `templates/tasks.template.md`

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## result

Implemented locally.

Default modes:

```text
Lead-orchestrated:
Human -> Lead -> Subagents -> Lead -> Human summary / decision gate

Human-orchestrated:
Human -> Agent A/B/C -> Human -> integration owner if combining outputs
```

Integration owner may be human, Lead, or a named integrator agent. Without an
integration owner, agents stop at handoff.

In Human-orchestrated mode, shared-file writes are allowed only through explicit
shared-file write delegation with file, section/rows, operation, lock owner,
review target, and rollback note. Hermes may index those declarations and warn
about overlap/staleness, but it does not grant permission.

Hermes is also not a draft store. If two agents propose changes for the same
section, they write proposals to `AGENT.md` handoff or `reports/agent/...`; the
integration owner may create `reports/integration/<task-id>-merge-plan.md` and
then update the canonical file. The workflow files now include this path in
project entry, task decomposition, and task packet templates.
