# Human-Agent Hybrid Control Validation

Date: 2026-07-16

Scope: Make coupled human-agent control the default LLM-Wiki operating model.

Task/story: LLMWIKI-090

Validator: Codex

## source

- Human architecture decision: hybrid human-agent work is the permanent
  direction; over-reliance in either direction is invalid.
- Official guidance:
  `https://www.cyber.gov.au/business-government/secure-design/artificial-intelligence/careful-adoption-of-agentic-ai-services`.
- Raw PDF and source record:
  `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-16-human-agent-hybrid-control/`.
- Canonical guide:
  `wiki/knowledge/project-docs/human_agent_hybrid_control.md`.
- Decision:
  `wiki/decisions/DEC-0007-human-agent-hybrid-control-default.md`.

## architecture decision

- Intent: retain human intent/judgment/accountability/acceptance and agent
  bounded analysis/execution/evidence in one governed control loop.
- Scope boundary: knowledge/workflow/template architecture only; no Agent
  Platform runtime, identity, authorization service, or kill switch built.
- Selected option: one canonical default guide with capability-aware thin
  projections.
- Human-confirm gate: passed in the 2026-07-16 session.

## commands run

```text
pdfinfo and pdftotext readback of the supplied source
official-domain web source verification
sha256sum raw PDF verification
bash harness/feedback-loop-lint.sh
targeted rg/readback of canonical, projection, decision, task, test, status, and report paths
```

## results

| Check | Result | Notes |
| --- | --- | --- |
| Canonical ownership | passed | One guide owns the hybrid control model; other files contain thin routing/contract projections. |
| Default baseline | passed | Session packs, base literacy, entry/human maps, and new repo templates expose the default. |
| Responsibility balance | passed | Human over-delegation/rubber-stamping and agent over-escalation/under-execution are both explicit failures. |
| Control separation | passed | Capability, autonomy, permission, impact, and reversibility are independent. |
| Action gates | passed | R0-R3 lanes, action-boundary approval, expiry, interrupt, and rollback fields are defined. |
| Runtime honesty | passed | PKI/JIT/PDP/kill switch/immutable logs/trust score/consensus are not claimed as implemented. |
| Raw evidence boundary | passed | Both supplied PDFs moved from Downloads/temp into topic-specific Agent Platform raw folders with source records and checksums. |
| Existing repo boundary | passed | No real repo was mass-backfilled; templates apply to new/renewed contracts. |
| Wiki lint/link validation | passed | `bash harness/feedback-loop-lint.sh`: 0 failures, 0 warnings; 531 wiki links and 637 active Markdown links checked. |

## ROI and trade-offs

- Benefit: makes the user's intended default architecture explicit and
  prevents capability/permission and approval/verification conflation.
- Edit surface: one canonical guide, one decision, and thin projections across
  existing routing/contracts.
- Simplicity: five baseline invariants fit P0/P1; P2 loads detail only by
  orchestration/security/architecture trigger.
- Cost: more fields can become mechanical paperwork; empirical reporting cost
  is unknown.
- Decision: accept the bounded projection now; review field value after 3-5
  natural work units before adding automation.

## gaps and residual risk

- No live hybrid work-unit evaluation has used the new fields yet.
- Human review quality cannot be guaranteed by a checkbox.
- Filesystem interruption and rollback are manual unless a real repo/runtime
  proves stronger controls.
- Existing repo packets may retain the prior projection until renewed; their
  active repo source of truth still wins.

## decision

- implemented; empirical effectiveness needs-review
