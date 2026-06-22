# AGENTS

Project: `{{project_name}}`
Last updated: `{{YYYY-MM-DD}}`

## Non-negotiables

- Active repo docs are source of truth for current implementation state.
- Token economy: default to minimal reads at session start. Each file read must
  trace to a current intent. Never re-read full project state at bootstrap.
- Coding sessions load the full LLM-Wiki Coding Pack once at session/assignment
  start; this is a bounded safety baseline, not permission to read full repo
  history or unrelated wiki docs.
- Respect task packet Allowed Write Targets and Forbidden Side Effects.
- Record evidence before marking work complete.

## LLM-Wiki root

Use `${LLM_WIKI_ROOT:-/home/admindebian/LLM-Wiki}` when linking to LLM-Wiki
from portable docs or scripts.

## Bootstrap cheatsheets

### Lead L1 default

Read only:

1. `AGENTS.md`
2. `REPO_RULES.md`
3. `LEAD_STATE.md` or the repo's legacy Lead state file

Stop after L1 unless the current intent matches one of the sub-branches below.

| Branch | Intent | Extra reads |
|---|---|---|
| L1 | Just check state | none |
| L2 | Review delegated result | `agents/<agent>/AGENT.md` checkpoint + named result report |
| L3 | Plan a new packet | contested contract rows + code map + one task row + prior related reports |
| L4 | Resolve agent conflict | both agents' `AGENT.md` blocker/checkpoint sections + contested contract rows + referenced decisions |
| L5 | Accept and roll up | test-matrix row + task row + accepted report |
| L6 | Write new decision | last 5 decisions + triggering validation report |

### Delegated default

Read only:

1. `AGENTS.md`
2. `REPO_RULES.md`
3. Full LLM-Wiki Coding Pack once when the session is code/review/refactor/test/validation work
4. `agents/<agent>/AGENT.md`
5. Files listed in the assigned task's Required Read Files

Delegated agents do not read Lead state, project-wide rollups,
per-agent task/status/archive files, or unrelated LLM-Wiki knowledge unless the
task packet explicitly requires it or the Knowledge Lookup Metric scores high
enough.

Delegated agents follow the `Coordination mode` in their `AGENT.md`:

- `Lead-orchestrated`: report to Lead.
- `Human-orchestrated`: report to the named human review target.

If several agents contribute to one outcome, a human, Lead, or named integrator
must be assigned as integration owner before merge, rollup, or source-of-truth
updates.

If several agents propose edits to the same section/row, store proposals in
`AGENT.md` handoffs, `reports/agent/`, or
`reports/integration/<task-id>-merge-plan.md`. Do not use Hermes as the draft
content store.

## Role map

Current assignments live in `LEAD_STATE.md` and `docs/agent_status.md`; this
file defines roles, not which AI fills them.

| Role | Owns | Default write targets |
|---|---|---|
| Lead | repo-wide coordination, agent control cards, reviews, decisions, conflict resolution | `docs/`, Lead-owned sections of `agents/*/AGENT.md`, `LEAD_STATE.md`, validation reports |
| Delegated implementation | assigned implementation slice | packet Allowed Write Targets, agent-owned sections of own `AGENT.md`, own result report |
| Delegated findings | assigned review/findings slice | assigned findings/report paths, agent-owned sections of own `AGENT.md` |
| Unavailable | no active work | none |

## Required reports

- Default delegated handoff: `agents/<agent>/AGENT.md` `result handoff`
- Delegated result report, when threshold is met:
  `reports/agent/<agent>/<task-id>-result.md`
- Integration merge plan, when multiple agent outputs must be combined:
  `reports/integration/<task-id>-merge-plan.md`
- Validation report: `reports/validation/YYYY-MM-DD-<scope>.md`
- LWOE session measurement, when enabled: `reports/lwoe/YYYY-MM-DD-<project>-<session-id>.md`

## References

- `${LLM_WIKI_ROOT}/harness/read-workflow.md`
- `${LLM_WIKI_ROOT}/harness/task-packet.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/coding/agent-coding-workflow.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/session_start.md`
- `${LLM_WIKI_ROOT}/wiki/knowledge/project-docs/token-economy-bootstrap.md`
