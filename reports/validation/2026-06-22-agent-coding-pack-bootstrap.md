# Agent Coding Pack bootstrap

Date: 2026-06-22
Task/story: LLMWIKI-034 Agent Coding Pack bootstrap

## Goal

Systematize coding-agent preparation so agents load the full coding rule pack
once at session/assignment start instead of reading only short capsules first
and escalating to deeper rules later.

## User direction

The user accepted the full-load model for coding sessions: agents should be
fully equipped before entering implementation work, similar to workers carrying
both safety equipment and work tools before starting the job.

## Changes

- Added `wiki/knowledge/coding/agent-coding-workflow.md` as the canonical
  entrypoint for repo coding-session preparation.
- Updated `wiki/knowledge/coding/README.md` and `wiki/knowledge/README.md` to
  link the new entrypoint.
- Updated `wiki/knowledge/coding/repo-code-rules.md` so it is part of the full
  Coding Pack rather than a rare escalation-only fallback.
- Updated `harness/read-workflow.md`, `harness/agent-operating-guide.md`,
  `program.md`, `harness/knowledge-lookup-metric.md`, and
  `wiki/knowledge/project-docs/knowledge_lookup_metric.md` to distinguish:
  - mandatory Coding Pack bootstrap for coding sessions;
  - selective Knowledge Lookup Metric use for additional LLM-Wiki context.
- Updated `wiki/knowledge/project-docs/session_start.md`,
  `wiki/knowledge/project-docs/agent_local_work.md`, and
  `wiki/knowledge/project-docs/token-economy-bootstrap.md` to reconcile the
  Coding Pack with Token Economy.
- Updated repo/agent templates:
  - `templates/agents.template.md`
  - `templates/repo_rules.template.md`
  - `templates/agent_role_card.template.md`
  - `templates/session_start.template.md`
  - `templates/agent_result_report.template.md`
- Added result-report evidence fields for `Coding Pack loaded`.
- Added lint coverage for the new entrypoint and template fields.
- Updated LLM-Wiki rollups:
  - `active.md`
  - `wiki/projects/llm-wiki/docs/project_status.md`
  - `wiki/projects/llm-wiki/docs/tasks.md`
  - `wiki/projects/llm-wiki/docs/test_matrix.md`
  - `reports/validation/README.md`

## Rule now canonical

When an agent is assigned to write, review, refactor, test, validate, or accept
repo code, it must read the full Coding Pack once at session/assignment start.

The pack is bounded and does not permit broad repo-history reads or unrelated
LLM-Wiki reads.

## Validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
passed with 0 failures / 0 warnings
```

## Residual risk

Existing real repos will need their local `AGENTS.md`, `REPO_RULES.md`,
`agents/<agent>/AGENT.md`, and result-report templates updated or regenerated
before the new Coding Pack bootstrap is enforced there.
