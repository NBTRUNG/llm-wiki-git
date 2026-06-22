---
name: session-start-flow-guide
description: Canonical session-start procedure for any multi-agent project repo. 6 numbered steps + role branches (Lead, Delegated, Unavailable) + Token Economy Law + Lead handoff (AI-agnostic) + L1-L6 sub-branches for Lead bootstrap. Use when bootstrapping a new project or auditing an existing one for agent onboarding consistency.
source_type: file-back
source_project: UniversityWeb
source_evidence:
  - /home/admindebian/UniversityWeb/docs/session_start.md
  - /home/admindebian/UniversityWeb/docs/decisions.md (ADR-0023)
  - /home/admindebian/UniversityWeb/reports/validation/2026-05-23-bootstrap-token-audit.md
  - /home/admindebian/LLM-Wiki/reports/validation/2026-05-25-feedback-loop-operational-optimization.md
date_ingested: 2026-05-23
date_updated: 2026-05-25
confidence: high
confidence_reviewed: 2026-05-25
applicable_contexts:
  - any multi-agent project repo with a Lead + ≥1 Delegated agent
  - any project that uses the LLM-Wiki multi-agent-coordination patterns
  - first new project bootstrap (use the template)
  - any project where the Lead role rotates between AI models (Codex ↔ Claude ↔ Gemini ↔ DeepSeek ↔ others)
status: active
---

# session start flow guide

## purpose

`docs/session_start.md` is a project-level guide that every AI agent (Lead and
Delegated) follows at the start of a new work session. It prevents wasted reads,
boundary violations, and silent conflicts when multiple agents share the repo.

This guide tells you how to write a good `session_start.md` for a project. The
matching skeleton is `templates/session_start.template.md`. The pattern was
file-back from UniversityWeb on 2026-05-23 (see source_evidence above).

## relationship to other canonical files

A project session-start flow assembles canonical LLM-Wiki pieces into a single
project-readable procedure. It does not introduce new rules; it sequences
existing ones:

- Steps 1–3 mirror [[../../../harness/read-workflow.md]] universal start.
- Role branches mirror [[multi-agent-coordination.md]] three-tier task board + agent control card.
- Working style mirrors [[../coding/karpathy-guidelines.md]] 4 principles.
- Coding-session bootstrap mirrors [[../coding/agent-coding-workflow.md]].
- Checkpoint mirrors [[../../../llm-wiki-constitution.md#15. checkpoint law]].
- Knowledge Lookup Metric mirrors [[../../../harness/knowledge-lookup-metric.md]].
- Token Economy Law mirrors [[token-economy-bootstrap.md]] — minimal reads, escalate by intent.

If any of these canonical files change in LLM-Wiki, project session-start files
should be re-audited.

## token economy law (mandatory for all session-start files)

Default to minimal reads for project state at session start. Each file read
must trace to a current intent. Never re-read full project state at bootstrap.

Coding sessions have one bounded exception: an agent assigned to write, review,
refactor, test, validate, or accept repo code reads the full LLM-Wiki Coding
Pack once at session/assignment start. This equips the agent consistently while
still forbidding full repo-history reads and unrelated wiki reads.

The session-start file is the project-level enforcement point for this law. To be compliant:

1. The project's entry file (e.g., `AGENTS.md`) must contain Lead-bootstrap and Delegated-bootstrap **cheatsheets** that work standalone — so an AI without persistent memory can bootstrap without re-reading the full session_start.md every session. See [[token-economy-bootstrap.md]] for the hoist pattern.
2. Lead bootstrap default = `AGENTS.md` + `REPO_RULES.md` + the Lead state file (e.g., `AI_CODEX.md`) for non-coding state checks. Target ≤330 lines total. Anything more requires an explicit sub-branch intent (L2-L6).
3. Delegated bootstrap default = `AGENTS.md` + `REPO_RULES.md` + one agent control card + Required Read Files only for non-coding work; coding work also loads the Coding Pack once.
4. `docs/session_start.md` is **escalation reference** (Lead sub-branches L2-L6, conflict protocol, anti-patterns). It is NOT read at every Lead bootstrap once the L1 cheatsheet is hoisted into the entry file.

### Lead sub-branches (L1-L6)

| Sub-branch | Intent | Extra reads beyond L1 default | Notes |
|---|---|---|---|
| L1 | Just check state | none | The default for non-coding state checks. Stop here unless intent escalates. |
| L2 | Review a delegated result | `agents/<a>/AGENT.md` current checkpoint + the named result/findings report | Look up report path from Lead state file's `pending reviews` list. |
| L3 | Plan a new packet (write Lead-owned sections of `agents/<a>/AGENT.md`) | `docs/contracts.md` (grep contested rows only) + `docs/code_map.md` + 1 row of `docs/tasks.md` + prior related reports | Use grep, not full read. |
| L4 | Resolve agent conflict | both agents' `AGENT.md` blocker/checkpoint sections + contested contracts rows + referenced ADRs | Conflict protocol applies. |
| L5 | Accept + roll up | `docs/test_matrix.md` row + `docs/tasks.md` row + accepted report | Then write to rollup docs in same turn. |
| L6 | Write new ADR / decision | last 5 ADRs in `docs/decisions.md` + triggering validation report | Format consistency + supersession check. |

Source: file-back from UniversityWeb `docs/session_start.md` 2026-05-23, formalized in ADR-0023.

## minimum content (the 6 steps)

A good `docs/session_start.md` has six numbered steps. Order matters.

1. **Identify role** — Lead, Delegated, Unavailable. Branch from here.
2. **Mandatory minimum reads (all roles)** — `AGENTS.md` + `REPO_RULES.md`; add the full Coding Pack once for coding sessions.
3. **Branch by role** — different read additions for Lead vs Delegated vs Unavailable.
4. **Pre-flight check** — boundary, side effects, pre-requisites, parallel safety, acceptance criteria.
5. **Work with continuous checkpointing** — Karpathy 4 principles + `AGENT.md` checkpoint updates at named trigger points.
6. **Hand off** — validation commands + result report + final status update + stop.

Each step should state WHAT to do, not WHY. The why lives in the LLM-Wiki
references above; the project doc is operational.

## role branches

Three branches are mandatory. Even projects with no current unavailable agent
should keep the Unavailable branch defined for future use.

### Lead branch

Lead reads additionally after Step 2:

- Project handoff snapshot (e.g., `AI_CODEX.md` or equivalent) — this is the Lead's primary state file regardless of which AI fills the role.
- Live assignment board (e.g., `docs/agent_status.md`) — only when the handoff snapshot is unclear or stale (>1 day).
- For escalation beyond L1 default, see sub-branches L2-L6 in the Token Economy section.

Lead does NOT read every project doc every session. The reduced-read principle
applies to Lead too. L1 default is ~330 lines total; escalation is explicit per
sub-branch intent.

### Lead handoff (AI-agnostic)

The Lead role can rotate between AIs over time (Codex ↔ Claude ↔ Gemini ↔ DeepSeek ↔ others). Role definitions are agent-agnostic; only the current assignment changes. Project session-start files must include a handoff procedure that works for any rotation, not just one historical case.

Pattern:

- **Outgoing Lead (AI A) — before stopping**: update the Lead state file (`AI_CODEX.md` or equivalent) with full live state — current phase, live assignments, pending reviews, last decisions, active blockers, and a one-sentence `next action` for incoming Lead. Update `docs/agent_status.md` Lead row from "AI A" → "AI B".
- **Incoming Lead (AI B) — first session**: L1 reads only. Do not read `agents/<a>/AGENT.md` unless `pending reviews` mentions it. Do not read rollup docs except via sub-branch L2-L6 escalation.
- **Sanity check**: incoming Lead restates the `next action` in one sentence (Karpathy principle 1: Think Before Coding). If the state file is stale (>1 day), incoming Lead refreshes it before further planning.

This procedure replaces the older "lead-substitution note" pattern, which hard-coded a specific AI as the "real" lead and others as substitutes. See ADR-0023 for the historical trigger.

### Delegated branch

Delegated agents read additionally after Step 2:

- Their agent control card (`agents/<agent>/AGENT.md`) — read the current assignment, active packet, write boundary, and latest checkpoint; if state is `idle`, `blocked`, or `accepted`, stop.
- The control card's `Coordination mode` — report to Lead in
  `Lead-orchestrated` mode; report directly to the named human review target in
  `Human-orchestrated` mode.
- Files listed in the current task's `Required Read Files`.
- Full LLM-Wiki Coding Pack once, when the assignment is code/review/refactor/test/validation work.

Delegated agents do NOT read by default:

- Lead handoff file (e.g., `AI_CODEX.md`).
- Project brief.
- Contracts file (unless task lists specific contract rows).
- Repo-wide tasks/status/test-matrix files.
- Decisions file.
- Per-agent task/status/archive files unless this is a legacy split-file project
  and the active control card explicitly says to use them.
- Unrelated LLM-Wiki knowledge (use the Knowledge Lookup Metric). The Coding
  Pack is mandatory only for coding sessions.
- The rest of the repo.

### Unavailable branch

Unavailable agents (status: unavailable in `AGENT.md`):

- Do not start any session.
- Do not modify any file.
- If availability returns, the lead must open a fresh task packet before any work.

## pre-flight check (Step 4)

Five questions before any file edit:

1. **Boundary**: All needed files inside my Allowed Write Targets?
2. **Forbidden side effects**: Will my plan trigger any item under Forbidden Side Effects?
3. **Pre-requisites**: Does the packet name a pre-requisite check? Run it first.
4. **Parallel safety**: Another agent active? Write targets truly disjoint?
5. **Acceptance criteria**: Can I describe up front the evidence I will deliver for each checkbox?

Any "no" answer is a stop condition. Raise a blocker; do not silently work around.

## hand-off (Step 6)

Delegated agents finish a session by:

1. Running all validation commands in the packet.
2. Updating `AGENT.md` `result handoff` so the review target can read 8-15
   lines before opening any report file.
3. Creating a result/findings report only when the task crosses the report
   threshold or the packet requires one.
4. Final `AGENT.md` checkpoint update: state=completed, link to report if one
   exists, list files touched, list validation outcomes.
5. NOT updating repo-wide rollup docs — the Lead or named integration owner
   owns those.
6. Stopping and signaling readiness to the review target named by the
   coordination mode.

The lead's review path is independent and separate.

## quality criteria

A good `docs/session_start.md`:

- Has ≤ ~400 lines total (after hoisting L1 cheatsheets into `AGENTS.md`), including a quick reference card at the end.
- Has frontmatter with `name`, `description`, `date_updated`, `status`.
- Defines 6 numbered steps in the order above.
- Defines all three role branches (Lead, Delegated, Unavailable).
- Cross-references LLM-Wiki canonical files for the WHY.
- Cites the project-specific files for the WHAT (e.g., specific `AGENT.md` paths, specific rollup doc paths).
- Names the Knowledge Lookup Metric scoring with the exact 0–10 thresholds.
- **Names the L1-L6 Lead sub-branches** with extra-reads per sub-branch.
- **States the Token Economy Law** explicitly and points to the entry-file cheatsheet.
- **Hoists the L1 default cheatsheet into `AGENTS.md` (or equivalent entry file)** so AIs without persistent memory bootstrap without re-reading this file.
- Separates **agent-agnostic role definitions** (in this file) from **current AI assignment** (in the Lead state file like `AI_CODEX.md`). Never hard-code an AI's name into the role table.
- Includes a **Lead handoff procedure (AI-agnostic)** — works for any AI rotation, not just one historical case.
- Includes stop conditions and a conflict protocol.
- Includes anti-patterns relevant to that project.
- Ends with a "quick reference card" suitable for copy/paste at the top of any agent prompt.

A bad `docs/session_start.md`:

- Mixes live state (current task, active blockers) into the procedure.
- Restates rules already canonical in LLM-Wiki instead of referencing.
- Hard-codes a specific agent name in the procedure (use roles: Lead, Delegated).
- Forces every agent to read every project doc every session.
- Omits the role-specific reduced read order.
- Omits the conflict protocol.
- Omits the L1 cheatsheet hoist into the entry file (forces AIs without memory to re-read this file every session).
- Treats "lead substitution" as a one-time event tied to a specific AI rather than a generic AI-agnostic rotation procedure.

## anti-patterns

- **Treating session_start.md as a live status board**. It is stable procedure. Live state lives in `agent_status.md`/`agent_work_plan.md`/`project_status.md`.
- **Duplicating LLM-Wiki rules**. The session-start file references; it does not re-author the rules.
- **Skipping the Unavailable branch**. Even a project with all-available agents should keep this branch defined for future use.
- **AI-specific lead identity baked into the procedure**. Lead identity is `current assignment`, which lives in `AI_CODEX.md`/`agent_status.md`. The procedure file describes the role, not the AI.
- **One-off lead-substitution note tied to one historical case**. Replace with a generic AI-agnostic Lead handoff procedure that covers any rotation.
- **No L1 cheatsheet hoist**. If AIs without persistent memory must re-read `session_start.md` every session, the procedure has failed the Token Economy Law.
- **No quick reference card**. Agents need a 6-line summary they can paste into a prompt.

## bootstrap procedure for a new project

When bootstrapping a new project, after [[../../../harness/project-bootstrap.md]] runs:

1. Copy [[../../../templates/agents.template.md]] to `<repo>/AGENTS.md` if the repo does not already have an entry file.
2. Copy [[../../../templates/lead_state.template.md]] to `<repo>/LEAD_STATE.md` or adapt it into the repo's legacy Lead state file.
3. Copy [[../../../templates/session_start.template.md]] to `<repo>/docs/session_start.md`.
4. Replace placeholders with the project's specific paths and role names.
5. Cross-reference the project's existing `AGENT.md` cards, `agent_work_plan.md`, `agent_status.md`.
6. Add project-specific anti-patterns observed during early sessions.
7. Add a cross-reference from `AGENTS.md` (or the repo's entry file) to `docs/session_start.md`.
8. Add a cross-reference from each `agents/<agent>/AGENT.md` control card to `docs/session_start.md`.

The project's first lead reviews the result. The session-start file is not
finished until the first delegated agent has successfully completed one full
session using it without raising a wiki-gap.

## maintenance

Revisit `docs/session_start.md` when:

- A new agent role is added.
- The Lead role rotates between AIs (apply the AI-agnostic handoff procedure; do not bake the rotation into the file).
- A delegated agent repeatedly raises wiki-gap blockers on the same step.
- LLM-Wiki canonical files referenced here have major revisions (check the LLM-Wiki §19 changelog).
- The entry file (`AGENTS.md` or equivalent) has changed cheatsheet content — verify session_start.md still de-duplicates correctly.

## sources

- Source project: UniversityWeb, `docs/session_start.md` (created 2026-05-23, updated 2026-05-23 per ADR-0023).
- Source canonical files: LLM-Wiki `harness/read-workflow.md`, `wiki/knowledge/project-docs/multi-agent-coordination.md`, `wiki/knowledge/coding/karpathy-guidelines.md`, `llm-wiki-constitution.md §15`, `harness/knowledge-lookup-metric.md`.
- Validation: `/home/admindebian/LLM-Wiki/reports/validation/2026-05-23-session-start-flow-file-back.md`.
- Token-economy update evidence: `/home/admindebian/UniversityWeb/reports/validation/2026-05-23-bootstrap-token-audit.md`, `/home/admindebian/UniversityWeb/docs/decisions.md` ADR-0023.
