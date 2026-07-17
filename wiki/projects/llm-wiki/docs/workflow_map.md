---
type: Workflow Map
project: LLM-Wiki
status: active
date_updated: 2026-07-10
---

# Workflow Map

This map defines the pilot workflows for the LLM-Wiki evidence/test-matrix
auditor.

## WF-LLMWIKI-EVIDENCE-001 - Audit Test-Matrix Evidence

Outcome: identify proof/evidence inconsistencies without editing canonical
Markdown.

Actors:

- Human/integration owner.
- LLM-Wiki Auditor Agent.

Entry points:

- User asks to audit `test_matrix.md`.
- Scheduled/manual pilot run of
  `/home/admindebian/Agent-Platform/gateway/llmwiki_auditor.py run`.

Source-of-truth files:

- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`
- `reports/validation/*.md`

Runtime artifacts:

- `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/snapshots/<timestamp>/`
- `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/manifests/llm-wiki.jsonl`
- `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/extracted/<timestamp>/test_matrix_rows.jsonl`
- `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/extracted/<timestamp>/validation_reports.jsonl`
- `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/extracted/<timestamp>/audit_findings.jsonl`
- `/home/admindebian/Agent-Platform/wap/proposals/<timestamp>-llm-wiki-evidence-audit.md`
- `/home/admindebian/Agent-Platform/audit/events.jsonl`

Approval gates:

- No approval needed to create snapshots, derived indexes, findings, or WAP
  proposals for the LLM-Wiki pilot scope.
- Human/integration owner approval required before editing `test_matrix.md`,
  `tasks.md`, validation reports, or source-of-truth rules.

Validation:

- Python compile check.
- `python3 /home/admindebian/Agent-Platform/gateway/llmwiki_auditor.py run --root /home/admindebian/LLM-Wiki`.
- `bash harness/feedback-loop-lint.sh`.

## WF-LLMWIKI-SOT-001 - Change Source-Of-Truth Rules

Outcome: change source-of-truth boundaries only through explicit review.

Actors:

- Human/integration owner.
- LLM-Wiki Auditor Agent in proposal-only mode.

Entry points:

- User requests a source-of-truth boundary change.
- Auditor detects conflicting source roles.

Required proposal fields:

- current canonical source;
- proposed canonical source;
- reason;
- impact;
- migration path;
- pointer updates;
- validation checks;
- rollback plan;
- approval owner.

Approval gates:

- Human/integration owner approval required before implementation.
- If the change affects architecture posture or project docs structure, record
  it in `tasks.md`, `test_matrix.md`, and a validation report.

## WF-LLMWIKI-KNOWLEDGE-REFRESH-001 - Refresh Reusable Knowledge

Outcome: promote bounded, reviewed research or human-approved reasoning rules
into canonical LLM-Wiki knowledge without making raw evidence canonical.

Actors:

- Human/integration owner.
- Researching or filing agent.

Entry points:

- User requests auto research or a knowledge-pack update.
- A validated project lesson passes the file-back evidence and generalization
  gates.

Source and synthesis artifacts:

- `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/*.md` for
  durable consulted-source logs and reviewed raw source records.
- `reports/research/*.md` for synthesized research briefs.
- `wiki/knowledge/**` for approved reusable guidance.

Approval gates:

- Human approval is required before canonical promotion unless the current user
  instruction explicitly authorizes the update.
- Raw records remain noncanonical and immutable after review except through a
  governed correction.
- A promoted update must create validation evidence and update task/test rollups.

Validation:

- Citation/source-path check when external research was used.
- Knowledge-pack routing and template impact review when agent behavior changes.
- `bash harness/feedback-loop-lint.sh`.

## WF-LLMWIKI-IMPACT-001 - Assess Change Impact

Outcome: identify downstream artifacts affected by a durable LLM-Wiki change
before updating projections or derived artifacts.

Actors:

- Human/integration owner.
- Evaluating agent.
- Workflow owner when the change affects workflow behavior.

Entry points:

- User approves a workflow, source-of-truth, routing, template, contract, or
  validation rule change.
- A previous change causes repo-local or experiment fixture drift.
- Agent is unsure which files a change affects.

Source-of-truth files:

- `wiki/projects/llm-wiki/docs/change_impact_map.md`
- changed canonical file named by the current task
- `wiki/projects/llm-wiki/docs/source_of_truth_rules.md` for boundary changes

Validation:

- Run the relevant impact-test fixture when one exists.
- Add validation report and update `test_matrix.md` for durable changes.
- Run `harness/feedback-loop-lint.sh`.

## WF-LLMWIKI-CAPABILITY-001 - Calibrate And Route Agent Capability

Outcome: assign a frozen agent configuration the highest evidence-backed safe
capability envelope and prevent it from receiving a higher-tier context or
autonomy flow.

Actors:

- Human/integration owner as assignment authority.
- Evaluated agent configuration.
- Deterministic graders and human/Lead reviewer.

Source-of-truth files:

- `wiki/knowledge/project-docs/agent_capability_tiers.md`
- `workflows/agent-capability-calibration.workflow.md`
- project `agents/<agent>/AGENT.md` capability envelope
- active task packet capability gate

Approval gates:

- Agent may self-downgrade but cannot self-assign or self-upgrade.
- Human/integration-owner acceptance is required for upgrade or broader
  autonomy.
- Unrated/expired configurations use `C0`.

Validation:

- Freeze model/harness/tools/context/verifier identity.
- Run versioned outcome/policy/tool/stop-handoff fixtures with repeated trials
  as risk requires.
- Verify component-wise task fit and context projection ceiling.
- Record separate reliability, safety, boundary, rework, efficiency, and human-
  intervention metrics.
