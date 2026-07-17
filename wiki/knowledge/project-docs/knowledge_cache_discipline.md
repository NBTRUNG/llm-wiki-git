---
name: knowledge-cache-discipline
description: Map-first, load-on-demand, release-on-goal-change discipline for agent knowledge use, with mandatory base literacy packs and conditional specialist depth.
date_ingested: 2026-07-08
date_updated: 2026-07-16
status: active
source_type: human-direction-plus-distilled-practice
confidence: medium
confidence_reviewed: 2026-07-08
---

# knowledge cache discipline

Use this guide when designing or reviewing how agents load LLM-Wiki knowledge
during a session.

The goal is not to make agents know less. The goal is to make them know what
exists, when to load it, and when to stop using stale task context as decision
support.

## core model

```text
Base literacy
  -> Map first
  -> Load triggered knowledge
  -> Work with an active knowledge set
  -> Release stale knowledge when the goal changes
  -> Reload the next relevant set
```

Agents should not begin as empty readers holding a book they cannot interpret.
They need a small base literacy layer: source-of-truth rules, safety/evidence
rules, repo entry rules, the Human-Agent Hybrid Control baseline, and the pack
map. That base teaches the agent how to read the rest.

After that, knowledge is loaded by trigger, not by habit.

## layers

| Layer | Purpose | Examples | Release rule |
| --- | --- | --- | --- |
| Base literacy | Know how to work safely and read the map | entry file, source of truth, task/claim rules, evidence/done rules, mandatory Coding Pack baseline for code work | Stays active for the session |
| Active knowledge set | Knowledge currently needed to solve this task | bug-fix workflow, Math Pack reasoning guide, data migration guide, deployment diagnostics | Release when task/goal changes |
| Specialist depth | Temporary deep pack for a hard subproblem | Security Deep, Architecture, Math, Operations, Data, AI/RAG/MCP | Release after subproblem closes unless next task still needs it |
| Raw/evidence | Source material and proof | raw source record, validation report, logs, task evidence | Do not keep in reasoning context after extracting the needed facts |

## base literacy is mandatory

Minimal reads do not mean no foundation.

For real repo work, the base normally includes:

- repo `AGENTS.md`;
- repo `REPO_RULES.md`;
- repo `TICK.md` or current-state file when present;
- current task/claim;
- source-of-truth and allowed-write rules;
- evidence/done expectations;
- the projected Human-Agent Hybrid Control invariants: accountable human
  sponsor, bounded agent responsibility, separate autonomy/permission, human
  gate for consequential action, and evidence-based acceptance;
- Coding Pack when the work may write, review, refactor, test, validate, or
  accept code.

For LLM-Wiki work, the base normally includes:

- `index.md`;
- `TICK.md`;
- `workflows/catalog.md` when a workflow must be selected;
- the current project map/current-direction file when the user asks direction
  or broad supervisor questions.

Base literacy is the "how to read the book" layer. It prevents an agent from
loading a specialist pack without knowing source of truth, safety, or evidence
rules.

The hybrid baseline stays active even when the full
[human_agent_hybrid_control.md](human_agent_hybrid_control.md) guide is not in
the active context. Default behavior is carried by entry/task/control-card
projections; specialist depth is loaded only when orchestration, autonomy,
permission, trust, or acceptance needs a design decision.

## capability-aware projection

Base literacy must fit the evaluated agent configuration. Use
[agent_capability_tiers.md](agent_capability_tiers.md):

- `C0-C1` receive a `P0 Capsule`; do not ask them to navigate the encyclopedia.
- `C2-C3` receive a `P1 Bounded Packet` with exact reads and pack sections.
- `C4-C6` may use `P2 Map-First` and dynamically select triggered depth.

Higher tiers may deliberately use a lower projection for a simple task. Lower
tiers may not load a higher projection. More context is not automatically more
knowledge: after the agent's effective selection/retention capacity, additional
context can increase instruction loss and source-conflict error.

## map-first rule

At the start of work, load maps before details:

- entry file;
- workflow catalog or session pack map;
- task/current-state map;
- knowledge pack README or index;
- exact child file only when the trigger matches.

Do not read a whole pack because its name sounds relevant. Read the README or
map first, then select the child file that answers the current need.

## active knowledge set

Agents should be able to state the current active knowledge set:

```text
Base:
Active task:
Triggered packs/files:
Why each is active:
Released or ignored knowledge:
Next release condition:
```

If an agent cannot explain why a file remains active, it should summarize any
needed fact and release the file from the current decision context.

## release on goal change

When the user changes goals, or when the task moves from one domain to another,
do a short release checkpoint:

```text
Previous goal:
Result/evidence:
Knowledge used:
Facts that remain relevant:
Knowledge to release:
New goal:
New triggered packs:
```

This is a workflow reset. It does not erase the model's context inside the same
conversation, but it tells the agent not to keep using stale knowledge as
decision support.

For a large goal change, long noisy session, or high-risk context pollution,
start a fresh thread/session after writing a closeout checkpoint.

## generalist plus conditional depth

Prefer a generalist agent with a strong map and conditional depth over many
fixed specialist roles that must exchange context for every small decision.

The generalist agent should know:

- what knowledge exists;
- when each pack is triggered;
- what source wins in conflicts;
- when specialist depth is required;
- when human/Lead review is required;
- what evidence closes the task.

Specialist depth is a mode, not necessarily a permanent role. It should be
activated for the subproblem, then released when the subproblem closes.

This avoids unnecessary handoff cost while preserving depth when a topic truly
requires it.

## anti-patterns

- Loading every related pack to feel safe.
- Treating old task context as current evidence after the user changes goals.
- Loading a specialist guide before source-of-truth and evidence rules.
- Splitting work into many specialist agents when one mapped generalist can
  solve it with conditional depth.
- Keeping raw logs, raw web pages, or broad grep output in active reasoning
  after the useful fact has been extracted.
- Treating memory/cache as a source of truth.

## related

- [agent_session_packs.md](agent_session_packs.md)
- [knowledge_lookup_metric.md](knowledge_lookup_metric.md)
- [token-economy-bootstrap.md](token-economy-bootstrap.md)
- [current_direction.md](current_direction.md)
- [../../../harness/read-workflow.md](../../../harness/read-workflow.md)
