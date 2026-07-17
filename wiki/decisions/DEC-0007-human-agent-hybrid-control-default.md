---
id: DEC-0007
title: Make Human-Agent Hybrid Control the default operating model
status: accepted
date: 2026-07-16
source_project: llm-wiki
---

# DEC-0007: Make Human-Agent Hybrid Control the default operating model

## context

LLM-Wiki already uses human approval, capability tiers, task/write boundaries,
integration ownership, review, and evidence. These controls were distributed
across several guides and could still be read as a pipeline where work is
handed from human to agent and back.

The human owner clarified the intended direction: human and agents form one
hybrid system. Human over-reliance on agents and agent over-reliance on humans
are both invalid. Joint ASD/ACSC, CISA, NSA, Canadian Cyber Centre, NCSC-NZ,
and NCSC-UK guidance adds source-backed controls for human oversight,
progressive autonomy, distinct agent identity, least privilege, interruption,
reversibility, monitoring, and runtime authorization.

## options considered

### option A: keep hybrid control implicit across existing guides

- Pros: no new document or read route.
- Cons: responsibility balance remains ambiguous; approval, capability,
  permission, and autonomy can be conflated; projections may omit a control.

### option B: add a trigger-based hybrid/security pack

- Pros: small impact on ordinary work; deep controls appear when risk triggers.
- Cons: human-agent dependence exists in every agent session, not only security
  work; optional routing would contradict the intended default.

### option C: one canonical default guide with capability-aware projections

- Pros: one source owns the operating model; five invariants fit P0/P1 while
  P2 can load full depth; existing guides need only thin pointers/fields; human
  and agent failure directions become measurable.
- Cons: adds a canonical guide and task/report fields; natural-work evidence is
  still needed to prove that the added contract reduces errors without excess
  coordination cost.

## decision

Select option C.

- Human-Agent Hybrid Control is the default operating model for all LLM-Wiki
  agent work.
- Human owns intent, risk appetite, consequential permission, accountability,
  and acceptance.
- Agent owns bounded analysis/execution, verification support, uncertainty
  disclosure, and evidence within its grant.
- Capability, autonomy, permission, impact, and reversibility remain separate.
- P0/P1/P2 projections must preserve the five baseline invariants; default does
  not require every small task to read the entire guide.
- Neither human approval nor agent self-report alone proves Done.
- Runtime identity, just-in-time credentials, centralized policy enforcement,
  kill switches, or immutable remote logs are not claimed until implemented
  and validated.

## consequences

- Agent Delivery, capability, coordination, knowledge-cache, trust/safety, and
  task/result contracts gain thin projections to the canonical guide.
- Normal/high-risk packets expose human sponsor, action-risk lane, permission,
  approval events, expiry/review trigger, interrupt route, and rollback route.
- Evaluation records both human over-delegation/rubber-stamping and agent over-
  escalation/under-execution.
- Existing real repos are not mass-backfilled. New projects use updated
  templates; active repos adopt the baseline when their session/task contract
  is next renewed or when risk requires it.

## review condition

Review after 3-5 natural hybrid work units, a missed checkpoint, rubber-stamp
acceptance, unnecessary agent escalation, authority/scope incident, or a real
Agent Platform policy-gateway decision.
