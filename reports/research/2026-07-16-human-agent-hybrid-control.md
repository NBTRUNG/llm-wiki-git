---
name: human-agent-hybrid-control-research
description: Research and architecture brief for making coupled human-agent control the default LLM-Wiki operating model.
date_updated: 2026-07-16
status: promoted
---

# Human-Agent Hybrid Control

Topic: Human-agent hybrid control for agentic work

Date: 2026-07-16

Owner: Codex

Cadence reason: human-approved architecture decision plus current official
agentic-AI security guidance

Status: promoted

## decision need

- What decision or guideline may change: whether human-agent coordination is a
  trigger-based safeguard or the default operating model for every agent work
  unit, and which responsibility/control invariants every projection preserves.
- Target docs if promoted: one new canonical guide plus thin projections into
  delivery, capability, coordination, trust, session, task, result, review, and
  human-navigation docs.
- Exclusions: implementing Agent Platform identity, just-in-time credentials,
  centralized policy enforcement, kill switches, immutable remote audit logs,
  trust scoring, or multi-agent consensus.

## search/tool bounds

- Source set: the user-supplied official joint-agency PDF, its official
  Cyber.gov.au publication page/PDF, NCSC commentary, existing LLM-Wiki
  workflow/security knowledge, and prior project evidence about missed human
  checkpoints.
- Internet search was limited to three exact-title queries on official
  Australian, US, and UK agency domains to obtain a durable source URL.
- No model ranking, product survey, or broad agent-security search was run.
- Raw PDF and checksum are retained under Agent Platform; this brief records
  promotion reasoning rather than duplicating source content.

## sources checked

| Source | Type | Published/accessed | Relevance | Decision |
| --- | --- | --- | --- | --- |
| [Careful adoption of agentic AI services](https://www.cyber.gov.au/business-government/secure-design/artificial-intelligence/careful-adoption-of-agentic-ai-services) and [official PDF](https://www.cyber.gov.au/sites/default/files/2026-05/careful_adoption_of_agentic_ai_services.pdf) | official joint guidance from ASD/ACSC, CISA, NSA, Canadian Cyber Centre, NCSC-NZ, NCSC-UK | 2026-05-01 / 2026-07-16 | Human control points, least privilege, distinct principals, progressive deployment/autonomy, interruption, reversibility, monitoring, per-action authorization, and evaluation. | promote bounded principles; defer runtime-heavy mechanisms |
| [NCSC: Thinking carefully before adopting agentic AI](https://www.ncsc.gov.uk/blogs/thinking-carefully-before-adopting-agentic-ai) | official commentary | 2026-05-15 / 2026-07-16 | Reinforces start-small, threat-model, monitor, incident-plan, and existing-cyber-control posture. | corroboration |
| `wiki/knowledge/project-docs/agent_delivery_workflow.md` | existing canonical knowledge | accessed 2026-07-16 | Six-layer human-governed ownership and handoff model. | extend with coupled-control invariant |
| `wiki/knowledge/project-docs/agent_capability_tiers.md` | existing canonical knowledge | accessed 2026-07-16 | Capability, context projection, autonomy ceiling, self-downgrade, and human-owned tiering. | separate capability from permission/impact/reversibility |
| `wiki/knowledge/project-docs/multi-agent-coordination.md` | existing canonical knowledge | accessed 2026-07-16 | Lead/Human orchestration, integration owner, claims, write boundaries, and handoff. | add hybrid responsibility and non-rubber-stamp acceptance |
| `/home/admindebian/UniversityWeb-U17/reports/agent/codex-20260707-token-audit/publish-token-overuse-audit.md` and LLMWIKI-072 file-back | project evidence | accessed from existing LLM-Wiki records 2026-07-16 | Human had to interrupt an agent to supply known resolution context; illustrates missed checkpoint and dependence imbalance. | supports interrupt/checkpoint and prior-evidence lookup |
| Human decision in current session | architecture authority | 2026-07-16 | Human-agent hybrid work is the intended permanent direction; over-reliance in either direction is rejected. | accepted architecture posture |

Raw evidence:

- `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-16-human-agent-hybrid-control/CAREFUL ADOPTION OF AGENTIC AI SERVICES_FINAL.PDF`
- SHA-256:
  `6621aac64117480226ad836d19dc7029f1b8406cd1f3477faa6e5afd478b2135`
- Source record:
  `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-16-human-agent-hybrid-control/source_record.md`

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| Human-agent control is a default responsibility model, not a security-only checkpoint: human owns intent/risk/permission/accountability/acceptance; agent owns bounded analysis/execution/verification support/evidence. | high | candidate-update | Every LLM-Wiki agent work unit. | As a claim that human and agent contribute equal effort or have interchangeable authority. |
| Capability, autonomy, permission, impact, and reversibility must be decided separately. | high | candidate-update | Task routing, tool grants, mutations, deployment, multi-agent handoff. | As one aggregate risk/capability score. |
| Human over-delegation/rubber-stamping and agent over-escalation/under-execution are symmetric workflow failure classes. | medium-high | candidate-update | Task design, result review, efficacy evaluation. | To force agents past genuine uncertainty, permission, or capability stops. |
| Consequential actions need an action-boundary human gate; prior/session approval must be reconsidered after target/scope/impact changes. | high | candidate-update | Production, credentials, external effects, sensitive data, destructive/costly/hard-to-reverse work. | Routine bounded `R0/R1` work already covered by a valid grant. |
| Hybrid control needs observe, interrupt, decide, and reverse affordances, each labeled by actual implementation/verification state. | high | candidate-update | Workflow/runtime design and result reporting. | As proof that a Markdown field creates a runtime control. |
| Progressive autonomy should expand from evidence and be independently reducible/revocable after failures. | high | candidate-update | Capability/autonomy programs and Agent Platform evolution. | As automatic promotion from one successful task. |
| Cryptographic identity, JIT credentials, centralized PDP/PEP, trust scores, secondary-agent validation, and consensus are future options, not current default capabilities. | high | no-change/defer | A real runtime and threat model justify them. | Filesystem-first docs-only operation. |

## claim-support checks

| Claim | Importance | Source | Accessible | Relevant | Supports stated strength | Conflict/freshness | Decision |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Human oversight, interruption, approval, auditing, and reversibility belong throughout agent workflows. | high | joint guidance | yes | yes | yes | current official guidance; critical-infrastructure orientation is stricter than all LLM-Wiki work | promote general control functions, scope risk policy locally |
| Autonomy and access should expand progressively and be rolled back on failures. | high | joint guidance + capability tiers | yes | yes | yes | local efficacy not yet measured | promote with empirical review trigger |
| Each agent should be a distinct principal and delegation should be bounded/expiring. | high | joint guidance + current control-card/claim model | yes | yes | partial for runtime cryptography | promote logical identity/grant; defer PKI/JIT mechanisms |
| Human and agent over-reliance are both invalid. | high | human architecture decision + internal workflow evidence | yes | yes | yes | measurement fields are new | promote as core law |
| Multi-agent consensus provides safe approval. | high | none; joint guidance still requires human approval for high stakes | n/a | no | no | correlated error/compromise remains possible | reject |
| LLM-Wiki already has verified runtime interrupt/rollback/identity enforcement. | high | current maturity docs | yes | yes | no | filesystem/manual controls only | reject; require explicit status labels |

## stop record

- Unresolved decision/claims before the final probe: durable official URL and
  whether the guidance was an isolated agency note or joint publication.
- What the final probe could have changed: absence of an official publication
  would have kept the PDF as local evidence with lower source confidence.
- Why research stopped: official publication, PDF, coauthor list, and NCSC
  corroboration were verified; the human had already decided the architecture
  direction, and additional product/security search would not change the
  bounded knowledge-only promotion.
- Remaining conflicts or unsupported claims: local cost/effectiveness of the
  new task/report fields is unmeasured; runtime control mechanisms remain
  unimplemented.

## decision analysis

- Objective: keep human judgment and agent execution mutually supportive while
  preventing authority drift, rubber-stamp review, unnecessary escalation, and
  unverifiable autonomy.
- Constraints/assumptions: filesystem-first LLM-Wiki/Agent Platform, no
  persistent agent runtime or policy gateway, capability-aware context
  projections, existing Token Economy and human approval laws.
- Baseline: hybrid behavior distributed implicitly across delivery,
  capability, coordination, WAP, trust, and review documents.
- Selected option: one canonical default guide with five mandatory invariants
  projected into P0/P1 task fields and full depth available to P2.
- Pros: one source of truth; balanced responsibility is explicit; capability no
  longer implies permission; runtime claims fail closed; both dependence
  failures become observable.
- Cons: adds one detailed guide and several task/result fields; reviewers may
  fill fields mechanically; existing repos need gradual contract renewal.
- Alternative: trigger the guide only for security/high-risk work. It has lower
  fixed overhead but contradicts the human-approved premise that hybrid control
  governs every work unit.
- Evidence/uncertainty: principles are supported by current joint guidance and
  existing project incidents; local effectiveness is not yet empirically
  established.
- Sensitivity/revision trigger: after 3-5 natural hybrid work units, remove or
  compress fields that add no decision/evidence value; strengthen runtime
  controls only after real consumer/threat/operations evidence.

## impact on LLM-Wiki

- Canonical guide:
  `wiki/knowledge/project-docs/human_agent_hybrid_control.md`.
- Accepted decision:
  `wiki/decisions/DEC-0007-human-agent-hybrid-control-default.md`.
- Thin projections: Agent Delivery, session packs, knowledge-cache,
  capability, multi-agent coordination, trust/safety, agent protocol, WAP,
  task/control/result templates, review checklist, and human/index maps.
- Real repos: no mass backfill; new templates and renewed active task/session
  contracts adopt the baseline.

## reviewer decision

- Decision: promote
- Reason: the human accepted the architecture posture; official multi-agency
  guidance and existing project evidence support bounded, testable controls;
  unsupported runtime guarantees are explicitly excluded.
- Validation report:
  `reports/validation/2026-07-16-human-agent-hybrid-control.md`.

## next review

- Next cadence trigger: after 3-5 natural hybrid work units, a missed human
  checkpoint, rubber-stamp acceptance, agent over-escalation, authority/scope
  incident, or policy-gateway proposal.
- Watchlist row: AI agents/RAG/evaluation/tool use and security/privacy/auth.
