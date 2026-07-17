---
name: agent-delivery-workflow
description: Canonical six-layer, human-governed workflow for moving agent work from raw evidence through approval, reusable knowledge, workflow guidance, orchestration, and bounded execution.
date_created: 2026-07-11
date_updated: 2026-07-16
status: active
---

# LLM-Wiki Agent Delivery Workflow

## canonical name

Use **LLM-Wiki Agent Delivery Workflow** as the stable English name.

Use **Quy trình giao việc cho Agent của LLM-Wiki** in Vietnamese.

Describe it as a **six-layer, human-governed agentic workflow**. Use
`six-layer model` or `mô hình sáu tầng` for the architecture view. Do not use
`six frames` or `6 khung` as a canonical term because `frame` is ambiguous.

## purpose

This workflow moves a human intent or observed fact into bounded agent work
without making raw evidence, generated indexes, tool interfaces, or agent
output the source of truth.

It operates under the default
[Human-Agent Hybrid Control](human_agent_hybrid_control.md) model. The six
layers are not a one-way transfer of responsibility from human to agent. Human
intent, permission, judgment, accountability, and acceptance remain coupled to
agent analysis, execution, verification support, and evidence throughout the
loop.

It is usable as a small filesystem-first process today and can grow into an
API-backed platform later without changing source ownership.

## six-layer model

```text
1. Evidence
   Agent Platform Raw/Evidence Store
        ->
2. Approval
   WAP proposals and human decision gates
        ->
3. Knowledge
   LLM-Wiki canonical reusable knowledge and maps
        ->
4. Guidance
   LLM-Wiki shared workflows plus repo-local workflow projection
        ->
5. Orchestration
   Human orchestration now; Gateway/API/Agent Host when justified
        ->
6. Execution
   Worker/model -> MCP capability adapter -> services/tools -> target systems
```

The arrows describe governed handoff, not source-of-truth precedence. A later
layer does not automatically outrank an earlier canonical source.

## layer contracts

| Layer | Current owner | Owns | Must not become |
| --- | --- | --- | --- |
| 1. Evidence | `/home/admindebian/Agent-Platform/raw/projects/<project-id>/` | raw snapshots, manifests, extracted indexes, research/source records, captured task evidence | canonical project state or canonical reusable guidance |
| 2. Approval | Agent Platform WAP plus human/integration owner | proposals, approval/rejection record, publish gate | silent permission for an agent to mutate canonical state |
| 3. Knowledge | LLM-Wiki | canonical Markdown knowledge, reusable maps, patterns, pack guidance | live implementation status for a real repo |
| 4. Guidance | LLM-Wiki plus the active repo | shared workflow selection in LLM-Wiki; project-specific workflow, contracts, maps, and task packets in the repo | a duplicated second source of truth |
| 5. Orchestration | human/integration owner and Agent Platform gateway | task routing, capability/projection checks, policy, claims, audit, later API hosting | business data authority or unrestricted tool execution |
| 6. Execution | worker/model, MCP adapters, services, target repo/data system | bounded implementation and deterministic tool/service calls | authority to invent scope, permissions, facts, or acceptance |

Across all layers, capability, autonomy, permission, action impact, and
reversibility are separate. A high-capability agent does not acquire broader
permission, and a human approval does not substitute for outcome verification.

## source-of-truth boundaries

Use these ownership rules:

```text
LLM-Wiki
  reusable knowledge
  shared workflow cards
  detailed harness guidance
  templates and session packs

Real project repo
  code and configuration
  project-specific workflows
  tasks, claims, and current status
  contracts and decisions
  UI/code/data maps
  tests and validation evidence

Agent Platform
  raw/evidence records
  derived indexes
  WAP proposals
  gateway scripts/runtime
  audit events
```

When a real repo exists, start from the repo entry file. LLM-Wiki selects a
shared route such as `real-repo-work`, then returns the agent to repo-local
source files. Do not copy live repo status into LLM-Wiki.

## shared and repo-local workflows

LLM-Wiki owns workflows that generalize across projects, including session
start, real-repo routing, bug investigation, knowledge refresh, WAP approval,
capability calibration, and closeout.

A real repo owns workflows whose behavior depends on that project, including
business journeys, UI and content flows, build/test/deploy procedures, CMS or
data behavior, file ownership, route contracts, task claims, and acceptance
evidence.

The composition rule is:

```text
LLM-Wiki shared workflow chooses the safe path
  -> repo entrypoint establishes local authority
    -> repo-local workflow/task packet defines exact work
      -> triggered LLM-Wiki knowledge supports execution
```

Repo-local workflow details may live in `AGENTS.md`, `TICK.md`, task packets,
workflow/UI/code/data maps, or a repo `workflows/` folder when the project has
enough recurring flows to justify one. Folder naming is not the contract;
source ownership and routing are.

For small, clear, low-risk repo work, `Bounded Change Fast Path` is a shared
execution mode inside Real Repo Work. LLM-Wiki owns its invariant; the repo owns
the local profile. It does not add a workflow-menu item or create per-domain
Tiny UI/API/Data workflows. See `bounded_change_fast_path.md`.

## gateway and API evolution

The current gateway is filesystem-first and script-based. A REST/API gateway
or persistent Agent Host is a future implementation option, not a requirement
for small projects.

Add an API or persistent gateway only after:

- a small stable schema exists for the data being routed;
- more than one real consumer needs the interface;
- authentication, authorization, audit, retry, and idempotency boundaries are
  defined;
- the measured coordination benefit exceeds the maintenance and security cost;
- the user or integration owner accepts the architecture decision.

An API changes transport and runtime scale. It does not move canonical
knowledge out of LLM-Wiki or project state out of the real repo.

## MCP boundary

MCP is a runtime capability-access protocol, not the source of truth and not
the owner of the full workflow.

```text
Gateway/API/Agent Host
  -> worker/model selects a bounded capability
    -> MCP client/server exposes a typed tool or resource
      -> normal service layer validates policy and business rules
        -> target repo, database, file, report, or external system
```

Keep cross-tool orchestration, trusted identity, consent, and final approval in
the host/application or gateway. Keep business logic in testable services.
Treat MCP as an interface adapter around those services.

## small-project mode

For a small UI or documentation task, every layer may be implemented with
Markdown and filesystem evidence:

```text
user request/reference
  -> explicit approval in the conversation or task packet
  -> LLM-Wiki knowledge pointer
  -> shared workflow plus repo task packet
  -> human assignment and claim
  -> agent edit, validation, result report, and user review
```

Do not create an API, database, MCP server, or machine-readable contract merely
to prove that the conceptual layer exists.

## evaluation contract

For a task used to evaluate this workflow, capture evidence while the work is
happening. Do not reconstruct read counts, time-to-first-edit, or decision
history only after the output is accepted.

The task packet or orchestrator records Layers 1-5 before handoff. The worker
records files read, execution, validation, timing, boundary/scope events, and
knowledge effectiveness at handoff. The human/reviewer records visual or
business acceptance afterward.

Minimum evaluation fields:

```text
Task and requested outcome:
Raw/reference evidence:
Approval evidence:
Shared workflow and repo-local workflow used:
Agent/session and capability projection:
Files read and changed:
Validation evidence:
Boundary or scope-creep events:
Packet received / first edit / handoff timestamps:
Token or read-line evidence when available:
Rework iterations and user corrections:
LLM-Wiki knowledge effectiveness:
Reviewer outcome: pass | mixed | fail | pending
Workflow overhead: acceptable | excessive | insufficient-data
Human over-delegation or rubber-stamp event: none | summary
Agent over-escalation or under-execution event: none | summary
Interrupt/rollback affordance: verified | manual | unverified | unavailable
```

For UI work, attach or link before/after evidence and review the requested
delta, desktop/mobile layout, keyboard/focus behavior, readability/contrast,
build/test result, and unintended visual changes.

Self-reported usefulness is supporting evidence, not final proof. The reviewer
outcome, deterministic validation, boundary compliance, rework, and measured
cost remain the primary evidence.

## current maturity

| Capability | Current state |
| --- | --- |
| Raw/evidence store | filesystem pilot in Agent Platform |
| WAP approval | proposal directories and human gate |
| Canonical knowledge | active Markdown in LLM-Wiki |
| Shared workflows | active workflow cards and harness |
| Repo-local workflows | active repo-owned docs/maps/task packets |
| Gateway | local Python auditor, not a REST API |
| MCP | knowledge and lab brief exist; no Agent Platform MCP runtime |
| Worker runtime | current agent sessions; no persistent worker service |

## revision triggers

Review this model when:

- an API gateway or persistent Agent Host is approved;
- Agent Platform adopts a database rather than filesystem-first raw storage;
- an Agent Platform MCP server becomes a real runtime;
- repo-local workflows repeatedly duplicate shared LLM-Wiki guidance;
- measured small-task overhead outweighs traceability or quality benefit;
- a source-of-truth conflict shows that a layer boundary is incomplete.

## related files

- `../../projects/llm-wiki/docs/checkpoints/architecture-agent-platform.md`
- `../../projects/llm-wiki/docs/current_direction.md`
- `../../../workflows/real-repo-work.workflow.md`
- `../ai-agent-rag-mcp/okf-knowledge-substrate.md`
- `../ai-agent-rag-mcp/agent-protocol-boundaries.md`
- `../mcp-server/server-architecture.md`
- `knowledge_effectiveness.md`
- `efficacy_metrics.md`
