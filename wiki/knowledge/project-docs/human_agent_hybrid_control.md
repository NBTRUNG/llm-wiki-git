---
name: human-agent-hybrid-control
description: Default human-agent operating model that keeps intent, judgment, permission, execution, verification, and acceptance coupled without allowing either side to abdicate responsibility.
date_created: 2026-07-16
date_updated: 2026-07-16
status: active
source_type: human-approved architecture + official joint security guidance + project evidence
source_project: llm-wiki
source_urls:
  - https://www.cyber.gov.au/business-government/secure-design/artificial-intelligence/careful-adoption-of-agentic-ai-services
  - https://www.cyber.gov.au/sites/default/files/2026-05/careful_adoption_of_agentic_ai_services.pdf
  - https://www.ncsc.gov.uk/blogs/thinking-carefully-before-adopting-agentic-ai
raw_sources:
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-16-human-agent-hybrid-control/CAREFUL ADOPTION OF AGENTIC AI SERVICES_FINAL.PDF
confidence: medium
confidence_reviewed: 2026-07-16
revision_trigger: Review after 3-5 natural hybrid work units, a missed human checkpoint, rubber-stamp acceptance, agent over-escalation, authority/scope incident, or implementation of an Agent Platform policy gateway.
---

# Human-Agent Hybrid Control

## purpose

This is the default operating model for LLM-Wiki agent work. Human and agent
remain parts of one governed work system; neither is a disposable fallback for
the other.

Use this guide to define decision rights, autonomy, permissions, control
points, evidence, and acceptance for single-agent, multi-agent, Lead-
orchestrated, and Human-orchestrated work.

## core law

```text
Human owns purpose, risk appetite, consequential permission,
accountability, and acceptance.

Agent owns bounded analysis, execution, verification support,
uncertainty disclosure, and evidence within the granted scope.

Human does not rubber-stamp or outsource judgment.
Agent does not invent authority or outsource routine bounded work back
to the human.
```

Hybrid control is not a handoff from human to automation. It is a closed loop
in which human judgment and agent execution remain connected through explicit
control points and observable evidence.

## default baseline and projections

The baseline applies to every agent session even when the full guide is not
loaded.

All projections must preserve these invariants:

1. A named human, Lead, or integration owner remains accountable for intent,
   permission, and acceptance.
2. Capability, autonomy, permission, action impact, and reversibility are
   separate decisions.
3. The agent works within an explicit task/claim/write/tool boundary and stops
   when the boundary no longer covers the required action.
4. Consequential or difficult-to-reverse actions require a human-owned gate.
5. Done requires outcome evidence and review; neither agent confidence nor a
   human's unexamined approval is sufficient.

Projection rule:

| Projection | Delivery |
| --- | --- |
| `P0 Capsule` | Task author supplies the exact goal, allowed action, verifier, human review target, and stop condition. |
| `P1 Bounded Packet` | Packet supplies the baseline plus bounded autonomy/permission, risk lane, evidence, and escalation route. |
| `P2 Map-First` | Agent may load this full guide and select triggered depth, but human/security/permission gates remain hard constraints. |

Default does not mean every small task reads this entire file. It means no
task packet, repo profile, agent tier, or local workflow may weaken the five
invariants above.

## responsibility model

| Responsibility | Human / Lead / integration owner | Agent | Shared control point |
| --- | --- | --- | --- |
| Intent and priority | Defines desired outcome and unacceptable outcomes. | Restates intent and exposes ambiguity. | Clarify before scope-changing work. |
| Risk appetite | Classifies tolerated impact and reversibility. | Identifies newly discovered risk. | Reclassify when evidence changes. |
| Capability fit | Assigns/accepts the evaluated envelope. | Checks fit and may self-downgrade. | Stop or re-route on mismatch. |
| Permission | Grants resources/actions for a bounded period or work unit. | Uses only the grant; never self-expands it. | Re-authorize changed or consequential actions. |
| Plan | Sets constraints and required decisions. | Proposes the smallest viable path and alternatives. | Human decides architecture/security/product trade-offs. |
| Execution | Does not micromanage routine bounded steps. | Executes, verifies, and records evidence. | Interrupt when risk/scope changes. |
| Acceptance | Reviews evidence and owns accept/reject. | Presents outcome, gaps, and rollback/recovery notes. | No rubber-stamp acceptance. |
| Learning | Updates goals and risk posture. | Distills reusable evidence and failure modes. | Revise knowledge, packets, and autonomy. |

## balanced dependence

Two opposite failures are both invalid:

### human over-delegation

- vague intent followed by broad agent authority;
- approving output without inspecting outcome or evidence;
- treating fluent prose, a passing command, or an agent self-report as proof;
- assigning accountability to the agent after a human-owned decision;
- allowing convenience to replace risk classification or permission review.

### agent over-delegation

- asking the human to choose routine implementation details already bounded by
  accepted contracts and evidence;
- stopping at every uncertainty without running safe discriminating probes;
- returning options without analysis, recommendation, or verification;
- treating human review as a substitute for tests or source readback;
- escalating work merely to avoid ownership of a qualified bounded task.

The target is not equal effort. The target is complementary responsibility:
each side owns the decisions and work for which it has authority and evidence.

## control loop

```text
human intent and risk posture
  -> capability fit and context projection
  -> bounded autonomy and permission grant
  -> agent plan / assumptions / expected evidence
  -> action-risk gate
  -> agent execution and verification
  -> outcome + policy + audit evidence
  -> human/Lead acceptance or correction
  -> retain, expand, reduce, or revoke autonomy
```

When new evidence changes scope, impact, reversibility, trust boundary, or
permission, return to the relevant earlier gate. Do not carry stale approval
forward merely because the session has already started.

## separate control dimensions

Never collapse these dimensions into one capability label or aggregate score:

| Dimension | Decision question | Owner |
| --- | --- | --- |
| Capability | Can this frozen agent configuration perform and verify the task reliably? | Human/Lead assigns from evidence; agent checks fit. |
| Autonomy | How many decisions or steps may it take without a new checkpoint? | Human/Lead/task contract. |
| Permission | Which resources and operations may it use now? | Resource/policy owner. |
| Impact | What can be harmed if the action is wrong or compromised? | Task author plus security/product owner. |
| Reversibility | Can the outcome be undone completely, safely, and in time? | Integration/operations owner. |

A `C6` agent may still be read-only. A deterministic low-capability worker may
hold a powerful mutation tool only behind a narrow policy and verifier. High
capability never implies high privilege.

## action-risk lanes

Use the active repo's stricter classification when present. Otherwise use:

| Lane | Shape | Default control |
| --- | --- | --- |
| `R0 Observe` | Read, search, classify, compare, or inspect within allowed data boundaries. | Agent may proceed; source/privacy rules still apply. |
| `R1 Reversible` | Draft/proposal or scoped mutation with reliable verification and rollback. | Agent may execute within an explicit grant; review before acceptance. |
| `R2 Consequential` | Production, credential, external communication, sensitive data, deployment, migration, destructive, costly, or hard-to-reverse action. | Human approval at the action boundary plus deterministic evidence and rollback/recovery. |
| `R3 Prohibited` | Self-upgrade, self-granted privilege, unapproved delegation, audit tampering, hidden scope expansion, or forbidden target. | Deny, preserve evidence, and escalate. |

Risk is contextual. A file edit can be `R1` in a branch and `R2` when it
publishes policy or production configuration. If impact or reversibility is
unknown, use the higher lane until clarified.

## permission grant contract

Normal/high-risk packets should be able to answer:

```text
Human sponsor / authority owner:
Agent principal or session:
Task and claim:
Allowed resources and actions:
Forbidden resources and actions:
Action-risk lane:
Maximum autonomy:
Required verifier:
Human approval events:
Grant start and expiry/review trigger:
Interrupt/stop route:
Rollback or recovery route:
Audit/evidence destination:
```

Filesystem-first projects may represent this contract in Markdown task and
control-card fields. A future gateway may enforce it at runtime. Documentation
does not imply that cryptographic identity, just-in-time credentials, runtime
interruption, or centralized policy enforcement already exists.

## human control affordances

Hybrid control needs four affordances:

| Affordance | Required behavior | Filesystem-first evidence |
| --- | --- | --- |
| Observe | See task, grant, agent state, tool/evidence summary, and actual outcome. | `TICK.md`, task packet, `AGENT.md`, result/validation report. |
| Interrupt | Stop or narrow work when risk, intent, or environment changes. | Human message, claim release/block, checkpoint; runtime kill only when a real mechanism exists. |
| Decide | Approve/reject consequential actions and accept/reject results. | WAP/task decision, review status, decision/ADR, acceptance row. |
| Reverse | Restore safe state or reduce authority after failure. | Version control, backup/runbook, rollback note, permission/autonomy downgrade. |

Do not claim an affordance from a document alone. If interruption or rollback
has not been tested, mark it `manual`, `unverified`, or `unavailable`.

## agent identity and delegation

At minimum, every work unit has a logical principal: named agent/session,
human sponsor, task claim, write/tool boundary, reviewer, and audit path.

When a runtime performs privileged or cross-system actions, strengthen this
with workload/service identity and short-lived scoped credentials as justified.

Delegation rules:

- name sender, receiver, task, scope, permission, verifier, reviewer, and
  expiry/review trigger;
- do not inherit the sender's whole privilege set;
- prohibit self-upgrade, self-granted privilege, and unapproved subdelegation;
- record the grant chain for consequential actions;
- expire or release delegation when the task is done, blocked, paused, stale,
  or reassigned;
- treat another agent's output as untrusted proposal/evidence until verified.

Multi-agent consensus is not human approval. Several agents may share the same
bad premise, compromised source, or missing permission.

## fail-safe behavior

When required context, permission, identity, verifier, reviewer, or rollback is
missing:

1. preserve safe read-only access when allowed;
2. stop the affected mutation or external action;
3. write a bounded checkpoint and retain evidence;
4. state exactly which control is unavailable;
5. request a narrower grant, deterministic support, or human/higher-owner
   decision.

Graceful degradation may reduce an agent to analysis, proposal, simulation, or
dry-run mode. It must not convert missing approval into inferred permission.

## progressive autonomy and rollback

Increase autonomy only from representative evidence:

```text
read-only / sandbox
  -> proposal with deterministic checks
  -> reversible bounded mutation
  -> broader or consequential action behind human gate
```

Before expansion, evaluate outcome correctness, policy/boundary violations,
stop/escalation quality, reliability across repeated work, audit completeness,
human correction/rework, and cost.

After a policy violation, unexplained goal drift, missed checkpoint, unsafe
tool use, or material configuration change, reduce or expire autonomy until
review. Rollback can apply to permission and autonomy even when no code rollback
is needed.

## evidence and acceptance

Agent evidence should distinguish:

- requested intent and accepted task contract;
- plan and material assumptions;
- files/data/tools actually used;
- policy/approval events;
- actual outcome and deterministic checks;
- deviations, denials, uncertainty, and missing proof;
- rollback/recovery state;
- reviewer decision and corrections.

Human review must be substantive enough for the task risk. The reviewer checks
the outcome, hard invariants, material residual risk, and evidence rather than
approving the narrative alone.

## evaluation

Evaluate the hybrid system, not only the model or final prose:

- Did the human provide a decidable intent and risk boundary?
- Did the agent accept only a fitting capability/autonomy/permission envelope?
- Did either side miss or bypass a required checkpoint?
- Did the agent complete routine bounded work without unnecessary escalation?
- Did evidence reveal the actual outcome, not only the claimed outcome?
- Did the human catch unsupported claims, scope drift, or unsafe actions?
- Could work be interrupted and authority/outcome be rolled back as claimed?
- Did multiple agents propagate an error or conceal accountability?
- Was coordination overhead justified by outcome, risk reduction, or learning?

Track both failure directions: human over-reliance on agents and agent over-
reliance on humans.

## adoption boundary

Promote now as knowledge and workflow contract. Do not infer that LLM-Wiki
currently has:

- cryptographic identity for every interactive agent;
- just-in-time credentials or a centralized runtime policy decision point;
- automatic kill switches, immutable remote logs, or verified rollback;
- reliable internal-reasoning monitoring;
- safe trust scores, secondary-agent validation, or consensus enforcement.

Those are future architecture choices requiring a real consumer, threat model,
owner, tests, operations plan, and accepted decision.

## anti-patterns

- “The agent is capable, therefore it may have broad access.”
- “The human clicked approve, therefore the result is correct.”
- “The agent asked the human, therefore verification is unnecessary.”
- One approval at session start authorizes every later action.
- Multi-agent voting replaces permission or accountability.
- The agent chooses when human approval is required for high-impact work.
- The human delegates vague goals and later blames the agent for predictable
  ambiguity.
- Logging prose while omitting tool use, permission, outcome, or denial events.
- Claiming runtime control, identity, or rollback that exists only on paper.

## related

- [agent_delivery_workflow.md](agent_delivery_workflow.md)
- [agent_capability_tiers.md](agent_capability_tiers.md)
- [multi-agent-coordination.md](multi-agent-coordination.md)
- [agent_session_packs.md](agent_session_packs.md)
- [../ai-agent-rag-mcp/trust-safety-permissions.md](../ai-agent-rag-mcp/trust-safety-permissions.md)
- [../ai-agent-rag-mcp/agent-evaluation.md](../ai-agent-rag-mcp/agent-evaluation.md)
- [../architecture-patterns/zero-trust-security.md](../architecture-patterns/zero-trust-security.md)
- [../../../workflows/manual-recovery.workflow.md](../../../workflows/manual-recovery.workflow.md)
