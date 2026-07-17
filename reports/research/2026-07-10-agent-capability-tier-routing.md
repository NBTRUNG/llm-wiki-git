# Agent Capability Tier Routing Research Brief

Topic: capability-aware LLM-Wiki projections and autonomy gates
Date: 2026-07-10
Owner: Codex research and architecture session
Cadence reason: direct human request after cross-tier agent effectiveness review
Status: promoted

## decision need

How can one canonical LLM-Wiki support agents ranging from small local models to
frontier generalists without allowing a lower-capability agent to follow a
higher-autonomy read/tool/workflow path?

Target docs:

- `wiki/knowledge/project-docs/agent_capability_tiers.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `harness/read-workflow.md`
- `harness/task-packet.md`
- workflow and agent/task/result templates.

## evidence boundary

LLM-Wiki currently has partial operational evidence, not a controlled model
ranking:

- UniversityWeb bootstrap content fell from 657 to 328 lines after the
  selective-read pattern, but the efficacy dashboard remains `NO-DATA` overall
  because several metrics lack baseline/post instrumentation.
- U17 fresh-session evaluation passed routing, narrow reads, source-of-truth,
  and claim rules with minor projection drift.
- No same-task A/B suite has compared local 1B-35B, hosted cost-efficient, and
  frontier configurations under the same harness/tools/budgets.

Therefore the promoted tiers are conservative autonomy envelopes and routing
contracts, not performance scores.

## sources checked

Raw source record:
`/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-10-agent-capability-tier-routing-sources.md`

| Source | Type | Finding used | Limitation |
| --- | --- | --- | --- |
| AgentBench | primary benchmark paper | Commercial/OSS agents showed material performance disparity; long-term reasoning, decision-making, and instruction following were common blockers. | Older model generation and broad benchmark tasks. |
| Rethinking Scale | 2026 primary study | For its sub-10B financial study, tool-augmented single-agent systems had the best performance/cost balance; multi-agent added overhead/instability with limited gains. | Domain-specific and not an LLM-Wiki coding suite. |
| Can Small Agent Collaboration Beat a Single Big LLM? | 2026 primary study | Tool access was the largest consistent gain; 4B+tools could beat 32B without tools in the reported GAIA setup; unrestricted thinking sometimes harmed orchestration. | Configuration-specific result, not a universal tier boundary. |
| SWE-bench Verified analysis | benchmark/harness study | Same-model performance can vary materially with scaffold, so model+harness must be frozen as one evaluated system. | Software issues only; static benchmark caveats. |
| Berkeley Function Calling Leaderboard V4 | primary evaluation project | Tool accuracy needs multi-turn, relevance, parallel, and schema checks. | Tool calling is only one capability dimension. |
| Z.AI GLM-4.5 documentation | official model documentation | Total and active MoE parameter counts differ; parameter count alone is ambiguous. | Vendor documentation is not independent local proof. |

## findings

| Finding | Confidence | Promotion |
| --- | --- | --- |
| Capability belongs to the frozen model+serving+harness+tools+context+verifier system, not the model name alone. | high | core law |
| One composite capability score can conceal unsafe tool use or weak verification. | high | use a component-wise vector and hard gates |
| Lower-capability agents need compiled capsules/bounded packets, not permission to navigate the full knowledge graph. | medium | `P0/P1/P2` projections |
| Unknown or expired configurations need a restrictive default. | high | default to `C0` read-only/proposal envelope |
| Agents can safely self-downgrade but cannot safely self-authorize upgrades. | high | Lead/human-owned capability note |
| Parameter ranges can orient deployment but must not assign tiers. | high | nonbinding examples only |
| A swarm is not the default remedy for small models; bounded tools/verifiers and a single-agent packet should be tested first. | medium | anti-pattern and calibration guidance |

## architecture decision

Keep one canonical LLM-Wiki and add two orthogonal controls:

1. `C0-C6` capability envelopes define maximum safe autonomy.
2. `P0-P2` context projections define how much of the wiki/workflow an agent may
   consume.

Use a capability vector for instruction/source precedence, retrieval, reasoning,
tool/schema use, verification/uncertainty, and long-horizon endurance. A task is
eligible only by component-wise fit plus safety/permission/human gates.

## alternatives and mathematical trade-offs

### Alternative A: every agent reads the same full flow

- Pros: one projection; lowest documentation maintenance.
- Cons: context overload and source-selection burden grow for weak agents;
  authority remains ambiguous; no deterministic mismatch stop.

### Alternative B: separate wiki per model tier

- Pros: each corpus can be simplified aggressively.
- Cons: duplicate source-of-truth, nonlinear drift/review burden, contradictory
  rules, and difficult upgrades between tiers.

### Selected: one canonical wiki plus tiered projections

- Objective: maximize accepted work per time/cost while keeping safety,
  permission, and source-of-truth constraints non-negotiable.
- Pros: preserves one truth, reduces lower-tier context entropy, and makes
  handoff/upgrade/downgrade explicit.
- Cons: projection compiler/templates and capability evidence require upkeep;
  false confidence is possible without repeated evaluation.
- Uncertainty: no controlled LLM-Wiki tier benchmark yet.
- Revision trigger: first cross-tier pilot, projection drift, false eligibility,
  or configuration changes.

## promotion decision

Promote. The human explicitly accepted tier-aware routing and required agents to
know their limit and avoid higher-tier flows. Use LLMWIKI-080 for validation and
rollup.

## next empirical evidence

Run the same versioned task fixtures with and without the assigned LLM-Wiki
projection while freezing model, harness, tools, budgets, and graders. Keep
separate outcome, consistency, policy, boundary, rework, efficiency, and human-
intervention metrics; do not create one aggregate score.

