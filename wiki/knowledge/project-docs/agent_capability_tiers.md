---
name: agent-capability-tiers
description: Evidence-based capability envelopes, context projections, and task-routing gates that prevent lower-capability agents from entering higher-autonomy workflows.
date_ingested: 2026-07-10
date_updated: 2026-07-16
status: active
source_type: current-source-research-plus-human-approved-design
source_project: llm-wiki
source_urls:
  - https://arxiv.org/abs/2308.03688
  - https://arxiv.org/abs/2604.19299
  - https://arxiv.org/abs/2601.11327
  - https://openai.com/index/introducing-swe-bench-verified/
  - https://gorilla.cs.berkeley.edu/leaderboard
  - https://docs.z.ai/guides/llm/glm-4.5
raw_sources:
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-10-agent-capability-tier-routing-sources.md
confidence: medium
confidence_reviewed: 2026-07-10
revision_trigger: Re-evaluate after the first same-task cross-tier pilot, any model/harness/tool/context configuration change, or a capability-boundary incident.
---

# agent capability tiers and knowledge projections

## purpose

Use this guide to decide:

- how much LLM-Wiki context an agent may load;
- which task and autonomy level it may receive;
- when it must stop, request a smaller packet, or hand off;
- how a human or integration owner assigns and revises its capability envelope.

The school-level analogy is useful: the same encyclopedia produces different
results for a primary student, university student, lecturer, researcher, and
professor. Operationally, use `C0` through `C6` rather than human titles. A tier
is a routing and authority boundary, not a claim about human worth or general
intelligence.

## core law

```text
Capability tier is assigned from evidence to one frozen agent configuration.
It is not inferred from provider, product name, parameter count, or confidence.

An agent may use a lower-tier workflow.
An agent must not enter a higher-tier workflow.
An agent may self-downgrade when uncertain.
An agent must never self-upgrade.

Unrated or expired configuration = C0 safety envelope.
```

The evaluated unit is:

```text
model ID/checkpoint
+ quantization and inference settings
+ system prompt and agent harness
+ tools and schemas
+ context projection and budget
+ verifier and approval gates
```

Changing any material component may invalidate the assigned tier.

This guide operates under
[Human-Agent Hybrid Control](human_agent_hybrid_control.md). Capability tier
answers whether a frozen configuration is eligible for a task. It does not
grant autonomy, permission, acceptance authority, or relief from human
accountability.

Keep these independent:

```text
capability = can the agent do and verify the work?
autonomy = how far may it proceed before a checkpoint?
permission = which resources/actions may it use now?
impact = what can be harmed?
reversibility = can the outcome and authority be safely rolled back?
```

## capability is a vector

Do not turn agent capability into one unexplained scalar score. Record a vector:

```text
Q = (
  instruction and source-precedence following,
  retrieval and context selection,
  logical/domain reasoning,
  tool selection and schema-valid arguments,
  verification and uncertainty reporting,
  long-horizon goal/context endurance
)
```

A task has a requirement vector `R` over the same dimensions. The agent is
eligible only when it meets every mandatory dimension:

```text
eligible(agent, task)
  = assigned tier >= minimum task tier
  AND Q_i >= R_i for every required dimension i
  AND all safety, permission, claim, and human-approval gates pass
```

Do not average away a weakness. Strong code generation cannot compensate for
unsafe tool use; long context cannot compensate for failure to follow source
precedence; fluent prose cannot compensate for missing verification.

## operational tiers

Parameter ranges below are nonbinding orientation only. Specialized training,
tool support, quantization, serving quality, and harness design can move an
agent up or down by task domain.

| Tier | Academic analogy | Safe operating shape | Typical nonbinding orientation | Default autonomy ceiling |
| --- | --- | --- | --- | --- |
| `C0` Unrated Executor | primary learner | literal extraction, classification, formatting, exact lookup | unrated configuration; often very small general models | read-only or structured proposal; no autonomous mutation |
| `C1` Guided Operator | lower secondary | one explicit goal, fixed schema, one or few deterministic steps | often `1B-8B` or narrowly tuned tool models | exact single-target action in sandbox with deterministic verification |
| `C2` Bounded Specialist | upper secondary | complete bounded packet, known domain, short tool chain | often strong `4B-14B` specialists | proposal or narrow write targets; mandatory reviewer |
| `C3` Independent Practitioner | undergraduate | normal-risk single-subsystem work, tests, bounded multi-file change | often `9B-35B` coding/reasoning models | delegated implementation/review; no Lead-owned source-of-truth edits |
| `C4` Reviewer and Integrator | lecturer | decomposes and reviews normal work, resolves bounded integration choices | often strong `20B+`, MoE, or hosted cost-efficient agents | normal-lane Lead/integrator work with explicit contracts and evidence |
| `C5` Research and Lead Agent | doctoral researcher | ambiguous cross-domain reasoning, architecture comparison, long-horizon recovery | strong open/hosted agentic systems | high-complexity planning and integration; human gates remain |
| `C6` Frontier Generalist | professor analogy | novel synthesis, dynamic pack/tool selection, supervision across domains | frontier model plus mature harness/tools | broadest reasoning envelope; never bypasses security, destructive-action, or human approval gates |

Tier assignment is domain-scoped. An agent may be `C4` for code review but `C2`
for security, data migration, mathematical proof, or visual inspection. The
task uses the lowest relevant qualified dimension, not the agent's best domain.

## knowledge projections

LLM-Wiki remains one canonical knowledge source. Agents receive different
projections of it.

| Projection | Intended tiers | Contents | Forbidden behavior |
| --- | --- | --- | --- |
| `P0 Capsule` | `C0-C1` | exact objective, supplied facts, one source excerpt or capsule, fixed output schema, allowed tool/action, verifier, stop condition | no map traversal, broad search, dynamic pack choice, or inferred authority |
| `P1 Bounded Packet` | `C2-C3` | source-of-truth capsule, task packet, exact read files, required operating capsules, bounded pack sections, acceptance and evidence | no full-wiki browsing, architecture invention, Lead rollup, or unlisted escalation reads |
| `P2 Map-First` | `C4-C6` | entry file, workflow catalog, capability note, dynamic pack routing, task evidence and relevant canonical knowledge | no read-everything behavior and no bypass of task/risk/approval gates |

Higher-tier agents should use the smallest sufficient projection. Lower-tier
agents must not select a higher projection because more context appears useful.
Only the human, Lead, task author, or approved compiler may assign a projection.

The Coding Pack remains canonical. A code-facing `C0-C3` agent may receive an
approved capability projection only when the task packet names it and the
projection preserves source-of-truth, security baseline, output-quality,
testing, write-boundary, and escalation rules. If no validated projection
exists, the agent is not eligible for that coding task.

The standard cross-repo coding projection for qualified `C2-C3` work is:

```text
P1-BOUNDED-CODING
-> wiki/knowledge/coding/bounded-coding-core.md
```

The task must name that exact projection ID. Repo profiles supply coordinates
and stricter local rules; they do not become new Coding Pack projections. A
partial selection of full-pack files is neither this projection nor a full
Coding Pack load.

## capability note

Every active agent control card must expose this note before its read order:

```text
Assigned capability tier: C0-C6 | unrated
Assignment owner: human | Lead | integration owner
Frozen configuration: provider/model/checkpoint, quantization, harness, tools
Qualified domains and dimension bands:
Context projection ceiling: P0 | P1 | P2
Allowed task/risk/autonomy:
Explicitly forbidden:
Required verifier/reviewer:
Evidence report and suite version:
Evaluated date and expiry/review trigger:
```

At session start, the agent checks and reports:

```text
My assigned envelope:
Task minimum and required dimensions:
Projection assigned:
Fit: eligible | downgrade packet needed | handoff required | unrated
Stop/escalation reason:
```

The note is an instruction boundary, not self-reflection. An agent must not
rewrite Lead-owned tier, qualification, or authority fields.

## task capability contract

Every delegated normal/high-risk task packet must declare:

```text
Minimum capability tier:
Required capability dimensions/domains:
Assigned context projection:
Maximum autonomy:
Required deterministic verifier:
Required human/Lead review:
Fallback owner or higher-tier handoff:
Human sponsor / acceptance owner:
Action-risk lane: R0 | R1 | R2 | R3
Permission grant and forbidden actions:
Human approval events:
Grant expiry/review trigger:
Interrupt/stop route:
Rollback/recovery route:
```

The task author selects the minimum from actual task shape, not from which
agent is currently available. Do not lower task requirements to make an agent
appear eligible.

## start gate

Before reading task details broadly or using tools:

1. Load the capability note and task capability contract.
2. Treat missing/expired tier evidence as `C0`.
3. Compare tier and every mandatory capability dimension.
4. Confirm the assigned projection does not exceed the agent ceiling.
5. Confirm autonomy, risk lane, permissions, claim, and reviewer.
6. If all pass, read only the assigned projection and start.
7. If any fail, do not simulate the higher-tier workflow. Request one of:
   - a smaller task;
   - a lower projection/capsule;
   - an external deterministic tool/verifier;
   - a higher-tier agent or human handoff.

An agent that detects context loss, repeated schema failures, unproductive tool
loops, or inability to state the invariant must self-downgrade or stop even if
its stored tier nominally permits the task.

## calibration and upgrade

Use `workflows/agent-capability-calibration.workflow.md`.

Calibration must:

1. Freeze the full configuration.
2. Use task fixtures that match the intended domain and autonomy.
3. Grade outcome and policy gates before prose quality.
4. Include tool-use, ambiguity/clarification, conflicting sources, verifier
   use, and stop/handoff cases.
5. Run repeated isolated trials when reliability matters.
6. Preserve separate metrics: pass at first attempt, consistency, safety/policy
   violations, boundary violations, rework, latency/tokens/cost, and human
   intervention.
7. Assign domain bands and the maximum safe tier from the weakest mandatory
   dimension.
8. Require human/integration-owner acceptance for any upgrade.

Do not promote from one successful demo. Downgrade immediately after a policy
violation, destructive action, repeated boundary drift, or configuration change
until re-evaluated.

Autonomy or permission may be reduced independently of capability after a
missed checkpoint, rubber-stamp incident, goal drift, unsafe tool use, or
missing audit/rollback evidence. An agent does not need to lose general
capability for its current grant to be narrowed or revoked.

## mathematical trade-off

- **Objective:** maximize accepted work per cost/time while keeping safety,
  source-of-truth, and permission invariants hard constraints.
- **Baseline:** every agent reads the same full entry/map/pack flow and chooses
  its own autonomy.
- **Pros:** less context overload; deterministic eligibility; cheap/private
  agents can own bounded work; higher agents spend capacity on ambiguity and
  integration; failures become classifiable.
- **Cons:** capability profiles and projections create maintenance and drift
  cost; tier labels can create false confidence; a capsule can omit necessary
  nuance; evaluation requires repeated fixtures and reviewers.
- **Uncertainty:** LLM-Wiki has no controlled same-task cross-tier benchmark yet;
  current tiers are safety envelopes, not measured performance rankings.
- **Sensitivity/revision trigger:** revise tier boundaries after cross-tier
  evidence, a false-eligibility incident, or material changes to models,
  quantization, tools, prompts, harnesses, or context budgets.

## anti-patterns

- Assigning tier from parameter count, vendor, marketing tier, or fluent prose.
- Letting an unrated agent default to the full Map-First workflow.
- Asking a low-tier agent to summarize the full wiki into its own capsule.
- Lowering the task minimum because only a lower-tier agent is available.
- Treating a high average capability as compensation for unsafe tool use.
- Using a swarm of weak agents as the default substitute for one bounded agent
  plus deterministic tools and review.
- Allowing an agent to edit its own tier, evidence, authority, or expiry.
- Treating a high tier as permission for broad access or reduced human
  accountability.
- Keeping a tier after changing model checkpoint, quantization, harness, tool
  schemas, context policy, or verifier.

## related

- [agent_session_packs.md](agent_session_packs.md)
- [knowledge_cache_discipline.md](knowledge_cache_discipline.md)
- [multi-agent-coordination.md](multi-agent-coordination.md)
- [../ai-agent-rag-mcp/agent-evaluation.md](../ai-agent-rag-mcp/agent-evaluation.md)
- [../coding/agent-coding-risks.md](../coding/agent-coding-risks.md)
- [../../../harness/task-packet.md](../../../harness/task-packet.md)
- [../../../workflows/agent-capability-calibration.workflow.md](../../../workflows/agent-capability-calibration.workflow.md)
