# Validation: single agent control card standard

Date: 2026-06-11

## scope

User decision: delegated subagents should read one local file only to reduce
read cost and avoid split context.

Implemented standard:

- `agents/<agent>/AGENT.md` is the default single delegated-agent control card.
- Lead-owned sections carry role, assignment, active packet, and write boundary.
- Agent-owned sections carry checkpoint, blocker, validation, and handoff.
- `agents/<agent>/tasks.md`, `status.md`, and `tasks_archive.md` are legacy
  split-file compatibility artifacts, not the preferred default.
- Hermes indexing should target `agents/*/AGENT.md` first, with legacy
  task/status files only when a project explicitly keeps the split-file model.

## files checked

- `wiki/knowledge/project-docs/agent_local_work.md`
- `wiki/knowledge/project-docs/multi-agent-coordination.md`
- `wiki/knowledge/project-docs/session_start.md`
- `wiki/knowledge/project-docs/agent_status.md`
- `wiki/knowledge/project-docs/token-economy-bootstrap.md`
- `wiki/knowledge/project-docs/efficacy_metrics.md`
- `wiki/knowledge/project-docs/delegated-packet-rotation.md`
- `wiki/knowledge/project-docs/hermes_context_indexer.md`
- `harness/agent-operating-guide.md`
- `harness/hermes-read-planning.md`
- `harness/task-packet.md`
- `harness/task-decomposition.md`
- `templates/agent_role_card.template.md`
- `templates/agents.template.md`
- `templates/repo_rules.template.md`
- `templates/session_start.template.md`
- `templates/hermes_config.template.md`
- `templates/lwoe_session_measurement.template.md`
- legacy templates: `agent_tasks`, `agent_status`, `agent_tasks_archive`

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

Implemented locally. The default delegated bootstrap path is now:

```text
AGENTS.md
REPO_RULES.md
agents/<agent>/AGENT.md
Required Read Files
```

Legacy split-file support remains documented for migration compatibility.

## gaps

- Exact migration procedure from legacy `tasks.md` + `status.md` into one
  `AGENT.md` control card is still open.
- Report-file threshold remains open: when a short handoff is enough vs when a
  durable `reports/agent/<agent>/<task-id>-result.md` file is mandatory.
