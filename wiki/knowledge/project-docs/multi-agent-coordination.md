---
name: multi-agent-coordination
description: Patterns for running multiple AI agents in parallel on the same project without conflicts. Use when a project has phases that can be split into independent file-ownership groups. Includes AI-agnostic Lead role definition and rotation handoff.
source_type: external-research
source_urls:
  - file:///home/admindebian/UniversityWeb/docs/agent_work_plan.md
  - file:///home/admindebian/UniversityWeb/agents/antigravity/AGENT.md
  - file:///home/admindebian/UniversityWeb/docs/decisions.md (ADR-0023)
  - file:///home/admindebian/UniversityWeb/reports/validation/2026-05-23-bootstrap-token-audit.md
local_source: observed in /home/admindebian/UniversityWeb during 2026-05-22 / updated 2026-05-23
date_ingested: 2026-05-23
date_updated: 2026-07-16
confidence: high
confidence_reviewed: 2026-07-10
applicable_contexts:
  - multi-agent projects with disjoint workstreams
  - phase-based parallel execution
  - projects where the Lead role rotates between AIs over time
status: active
---

# Multi-agent coordination

How to run several AI agents in parallel on one project without conflicts.

For ACID + complexity + delegation, see [[../../../harness/task-decomposition.md]].
For task packet shape, see [[../../../harness/task-packet.md]].
For agent-local file roles, see [[agent_local_work.md]].
For evidence-based task/autonomy routing, see [[agent_capability_tiers.md]].

This guide adds the **coordination layer** on top of those: how to decompose work
into independent groups, how to define each agent's role, how to handle
conflicts, and how to roll completed work back into the project source of truth.

All topologies use the default
[Human-Agent Hybrid Control](human_agent_hybrid_control.md) baseline. Lead-
orchestrated and Human-orchestrated describe routing, not separation of human
and agent responsibility. A human/Lead/integration owner retains intent,
permission, accountability, and acceptance; agents retain bounded execution,
verification support, uncertainty disclosure, and evidence.

## three-tier task board (recap)

| Tier | File | Owner | Purpose |
|---|---|---|---|
| 1 — assignment rollup | `docs/agent_status.md` | lead agent | Live who-is-doing-what matrix |
| 2 — agent control card | `agents/<agent>/AGENT.md` Lead-owned sections | lead agent | Role, active packet, write boundary |
| 3 — checkpoint handoff | `agents/<agent>/AGENT.md` agent-owned sections | delegated agent | Current checkpoint, blocker, validation, handoff |

Result reports drop at `reports/agent/<agent>/<task-id>-result.md`.
Accepted delegated packets roll into shared repo-level accepted history, usually
`docs/tasks_archive.md`. Legacy projects may still rotate per-agent task files
per [[delegated-packet-rotation.md]]; those archives are not read at bootstrap.

## agent control card

Each agent must have a control card at `agents/<agent>/AGENT.md`. This is the
only agent-local file the delegated agent reads by default after `AGENTS.md` and
`REPO_RULES.md`.

The card declares:

- **Role summary**: one paragraph on what this agent does and does not do
- **Capability envelope**: Lead-owned tier, dimension/domain qualification,
  context projection, autonomy ceiling, evidence, expiry, and handoff route
- **Read order**: mandatory read files before any work
- **Coordination mode**: Lead-orchestrated or Human-orchestrated review path,
  plus integration owner
- **Current assignment**: task id, state, Required Read Files, and stop condition
- **Active task packet**: executable ACID task packet for the current assignment
- **Write rules**: default read-only; write only to paths in current task packet
- **Current write boundary**: paths the agent is allowed to touch this phase
- **Forbidden side effects**: behavioral constraints (e.g., "do not change CSS/JS, do not run migrations")
- **Current checkpoint**: latest progress, blocker, validation, result handoff
- **Hybrid control grant**: human sponsor, action-risk lane, allowed/forbidden
  actions, approval events, expiry, interrupt route, rollback route, and
  acceptance owner

Use [[../../../templates/agent_role_card.template.md]] as the skeleton.

Capability envelope fields are Lead-owned. A delegated agent may self-downgrade
or report a mismatch, but it must never assign or upgrade its own tier. An
unrated/expired agent defaults to `C0`, and task assignment requires component-
wise fit with the task capability contract before coordination begins.

## coordination topologies

LLM-Wiki supports two multi-agent topologies.

### Lead-orchestrated mode

Default for production repo work:

```text
Human -> Lead
Lead -> Subagents
Subagents -> Lead
Lead -> Human summary or decision gate
```

Use when:

- implementation touches source-of-truth docs, contracts, architecture,
  security, deployment, or shared code;
- multiple agents need disjoint write targets and rollup;
- one reviewer must accept, reject, or integrate results;
- project continuity matters more than raw parallel exploration.

In this mode, subagents report to Lead through `AGENT.md` result handoff. Lead
opens report files only when the handoff says one exists or the task crosses the
report threshold.

### Human-orchestrated mode

Valid when the human directly runs multiple agents:

```text
Human -> Agent A
Human -> Agent B
Human -> Agent C
Agents -> Human
Human -> accept, send back, or assign integration owner
```

Use when:

- the human wants independent opinions or competing designs;
- work is exploration, comparison, review, or audit;
- agents should not coordinate with each other yet;
- human wants to inspect raw outputs before choosing a Lead or integrator.

In this mode, each agent still uses its `AGENT.md` result handoff. Agents must
not assume their results are linked, accepted, or integrated. Before any merge,
rollup, or source-of-truth update, the human must either act as integration
owner or assign one Lead/integrator.

### Integration owner rule

When more than one agent contributes to the same outcome, one integration owner
must be named before outputs are combined.

Integration owner may be:

- human;
- Lead agent;
- a named integrator agent with an explicit task packet.

The integration owner decides which outputs are accepted, which are rejected,
what conflicts exist, and what source-of-truth files are updated. Without an
integration owner, agents stop at handoff.

Integration ownership is not permission to rubber-stamp. The owner checks the
actual outcome, policy boundaries, material uncertainty, and evidence. Agents
must complete routine qualified work and verification rather than forwarding
unanalysed choices to the integration owner.

When several agents propose changes for the same file section/row, the
integration owner may create:

```text
reports/integration/<task-id>-merge-plan.md
```

Use the merge plan to record source proposals, accepted/rejected parts, target
section/rows, final patch summary, validation, and rollback note. Do not use
retired cache/index systems as the temporary draft store for content that will
be merged.

### Shared-file write delegation

In Human-orchestrated mode, forcing every shared-file update through a Lead can
overload the Lead. The human or integration owner may delegate narrowly scoped
write access to shared files when the task packet names the exact file, section,
and lock owner.

Allowed delegation examples:

- one agent updates only its row in `docs/tasks.md`;
- one agent updates only its assigned row in `docs/test_matrix.md`;
- one agent appends one proposed contract row to `docs/contracts.md`;
- one agent updates a named section in `docs/design_system.md` or
  `ui_map/_CONTRACTS.md`;
- an integrator agent performs final rollup after human chooses outputs.

Required fields in the task/control card:

```text
Shared-file write delegation:
- File:
- Section/rows:
- Operation: append | update row | replace section
- Lock owner:
- Review target:
- Rollback note:
```

Rules:

- Delegation must be explicit in `Allowed write targets`.
- The section/row must be narrow enough that another agent can avoid it.
- Only one agent may hold a lock for a shared section/row at a time.
- Contracts, decisions, security, deployment, and data-migration files still
  require human, Lead, or integration-owner review before acceptance.
- If the agent discovers it needs a different shared section, it stops and asks
  for an updated delegation instead of expanding scope.

Staging rule:

- Same file, different delegated section/row lock: agents may work in parallel.
- Same file, same section/row: agents submit proposals only.
- Same file, same section/row: integration owner chooses/merges and updates the
  canonical source file.
- Proposals must live in Markdown (`AGENT.md`, `reports/agent/`, or
  `reports/integration/`).

### Claim / release

Before implementation, each agent must claim the task or section it is about to
work on when the project has `TICK.md`, task-board claim fields, or task-packet
claim fields.

Required claim fields:

```text
Claim status: unclaimed | claimed | released | blocked | stale
Claimed by:
Claim scope:
Claimed at:
Release reason:
Next eligible owner:
```

Rules:

- A task with `Claim status: claimed` belongs to the named active session.
- Another agent must not start that task unless the human, Lead, or integration
  owner releases, reassigns, or splits the claim.
- Claim scope must be as narrow as practical: task id, workflow slice, file,
  section, row, or validation surface.
- Release the claim when the task is done, blocked, paused, or reassigned.
- Mark stale claims when the owner is unreachable beyond the project timeout;
  stale claim resolution belongs to the human, Lead, or integration owner.

## phase-based parallel execution

Within a project phase, identify **independent groups** before dispatching work:

1. Lead agent reads phase scope and current contracts.
2. Lead, human, or integration owner identifies file-ownership groups — sets of
   files or file sections that one agent will own for this phase and others must
   not touch.
3. Lead writes group contracts (see [[../../../harness/task-decomposition.md]]
   `group contracts for parallel work`).
4. Lead creates per-agent task packets with explicit `Allowed write targets` +
   `Forbidden write targets` derived from the group contracts.
5. Agents work in parallel only when:
   - their write targets are disjoint, OR
   - one task is read-only sidecar work (audit, screenshot, smoke test) and the
     lead has named the file ownership group it observes.

## disjoint write-target rule

This is the hard guarantee for parallel safety:

```
If task A's Allowed write targets ∩ task B's Allowed write targets ≠ ∅,
then task A and task B MUST NOT run concurrently.
```

For shared files, compare the delegated section/row lock, not just the file
path. Two agents may edit the same shared file only when their delegated
sections/rows are disjoint and named in their task packets.

If two agents need the same file section/row, serialize them or assign an
integration owner.

## conflict resolution protocol

When two agents' work conflicts (overlapping edits, contract mismatch, broken
shared name):

1. Both agents stop further edits in the conflict zone immediately.
2. Lead agent reviews both outputs.
3. Lead creates the integrated result, OR opens a new bounded packet for one
   agent to do the integration.
4. Delegated agents do not resolve conflicts in: `docs/contracts.md`,
   `docs/decisions.md`, security-related files, deployment config, or shared
   infrastructure. These belong to the lead.

If a delegated agent encounters a contract mismatch, they raise it as a blocker
in their status file and stop. They do not edit the contract.

In Human-orchestrated mode, replace "Lead" above with "human or assigned
integration owner." Subagents still do not resolve conflicts unilaterally.

## reduced read order for delegated agents

Delegated agents read minimal context by default:

1. `AGENTS.md`
2. `REPO_RULES.md`
3. `TICK.md` when present
4. `agents/<agent>/AGENT.md`
5. Files listed in task `Required read files`

They do **not** read `docs/project_brief.md`, `docs/decisions.md`,
`AI_CODEX.md`, per-agent task/status/archive files, or LLM-Wiki by default. The
lead must list these explicitly in the task packet when needed.

`AGENT.md` stays current-slice only. Delegated agents do not scan archived
packets or old checkpoint logs during normal bootstrap. If the current
assignment says `idle`, `blocked`, or `accepted`, the agent stops unless the
Lead has assigned a new active packet.

This rule exists to:

- reduce input token cost per session;
- prevent agents from drifting outside scope by reading too broadly;
- make it obvious which knowledge actually shaped the work (visible in
  `Required read files`).

The same Token Economy Law applies to Lead bootstrap. The Lead's default read set is `AGENTS.md` + `REPO_RULES.md` + Lead state file (e.g., `AI_CODEX.md`), targeting ≤330 lines total. Escalation to sub-branches L2-L6 (review, plan packet, conflict, accept+rollup, ADR) is explicit per intent. See [[session_start.md]] mục "token economy law" and [[token-economy-bootstrap.md]] for the entry-file cheatsheet hoist pattern.

## daily work log

For projects with multiple agents and meaningful daily progress, the lead
maintains `reports/daily/YYYY-MM-DD.md`. Use
[[../../../templates/daily_work_log.template.md]].

The daily log captures:

- completed tasks (id + agent + result link);
- assignments changed;
- reports created;
- tests run + outcomes;
- blockers raised;
- follow-up tasks created;
- files updated.

This is not a status file — it is a chronological audit log. `docs/project_status.md`
remains the canonical current-state file.

## lead agent role (AI-agnostic)

One AI is the Lead per project, **per current assignment**. The role is agent-agnostic — any AI can be Lead when assigned in `docs/agent_status.md`. Role definitions do not bind to specific AI names (Codex, Claude, Gemini, DeepSeek, etc.); only the current assignment does. See [[session_start.md]] mục "Lead handoff (AI-agnostic)" for the rotation procedure.

Typical Lead responsibilities:

- own all repo-wide rollup files: `docs/tasks.md`, `docs/project_status.md`,
  `docs/test_matrix.md`, `docs/contracts.md`, `docs/agent_status.md`,
  `docs/decisions.md`
- own the Lead state file (`AI_CODEX.md` or equivalent) and keep it fresh after each meaningful work unit
- write Lead-owned sections of each per-agent control card
- review delegated agent result reports
- decide when to accept or send back
- own conflict resolution
- own group contract definition
- run final integration review at end of each phase

The Lead is the only role that may edit shared contracts and source-of-truth
docs without explicit assignment.

### Lead rotation handoff

When the Lead role transfers from AI A → AI B (for any reason — availability, context overflow, explicit re-assignment):

- **Outgoing Lead (AI A)** updates the Lead state file with full live state (phase, assignments, pending reviews, last decisions, blockers, one-sentence `next action`) before stopping. Updates `docs/agent_status.md` Lead row.
- **Incoming Lead (AI B)** does L1 bootstrap only (`AGENTS.md` + `REPO_RULES.md` + Lead state file). Reads no additional rollup docs unless an action escalates to sub-branch L2-L6.
- Project session-start files MUST describe this as a generic agent-agnostic procedure, not as a one-off note tied to a specific AI rotation.

## anti-patterns

- Two agents assigned to the same file-ownership group concurrently.
- Delegated agent edits `docs/contracts.md` without an explicit packet.
- Role card missing or stale relative to current task packet.
- Conflict resolved silently by one agent overwriting the other's work.
- Lead agent treats `reports/agent/<agent>/<id>-result.md` as the status board.
- Human-orchestrated parallel work has no integration owner before merge/rollup.
- Human approves agent output without outcome/evidence review, or an agent uses
  human review as a substitute for bounded verification.
- Shared-file write delegation does not name section/row locks.
- Two agents update the same shared row because only file-level ownership was
  checked.
- A retired cache/index system is used as the draft store for proposed content.
- Agents in Human-orchestrated mode assume other agents have read their output.
- Report files become the review inbox instead of `AGENT.md` result handoff.
- Daily work log used as a status replacement instead of as audit history.
- Agents read full repo docs by default and burn token budget.
- Delegated agents read the Lead state file by default.
- Agent-local `AGENT.md` becomes a long archive instead of a current control card.
- Split local task/status files are introduced without a measured need.
- **AI name hardcoded into the Lead role definition** — Lead is the role; the current AI is the assignment. Hardcoding "Codex" or "Claude" into procedure files prevents future rotation.
- **No Lead handoff procedure** for AI rotation, only ad-hoc "substitution notes" tied to one historical case.
- **Lead bootstrap re-reads full session_start.md every session** — if AIs without persistent memory must do this, the entry-file cheatsheet hoist (see [[token-economy-bootstrap.md]]) is missing.

## relationship to LLM-Wiki

- [[../../../harness/task-decomposition.md]]: ACID rules, complexity, group contracts.
- [[../../../harness/task-packet.md]]: canonical task packet with ownership group fields.
- [[agent_local_work.md]]: single-file agent control card and audit trail.
- [[delegated-packet-rotation.md]]: legacy split-file compatibility for projects that still use per-agent task files.
- [[session_start.md]]: session-start procedure with Token Economy Law + L1-L6 sub-branches + Lead handoff (AI-agnostic).
- [[token-economy-bootstrap.md]]: entry-file cheatsheet hoist pattern.
- [[../../../templates/agent_role_card.template.md]]: per-agent control card.
- [[../../../templates/daily_work_log.template.md]]: daily rollup.

## sources

- `/home/admindebian/UniversityWeb/docs/agent_work_plan.md` — file ownership table, parallel safety rule, conflict protocol
- `/home/admindebian/UniversityWeb/agents/antigravity/AGENT.md` — role card example
- `/home/admindebian/UniversityWeb/agents/antigravity/tasks.md` — packet metadata example
- `/home/admindebian/UniversityWeb/reports/daily/2026-05-22.md` — daily log example
- `/home/admindebian/UniversityWeb/docs/decisions.md` ADR-0023 — AI-agnostic Lead role + Token Economy Law + Lead handoff procedure
- `/home/admindebian/UniversityWeb/reports/validation/2026-05-23-bootstrap-token-audit.md` — triggering audit
